local CRUX = {}
local registeredSocieties = {} -- Track registered societies to ensure one-time registration

function CRUX.GetCurrentSociety()
    return 'esx'
end

function CRUX.GetSociety(society)
    return exports["esx_society"]:GetSociety(society)
end

function CRUX.RegisterSociety(name, label, account, datastore, inventory, data)
    -- Check if society is already registered in our tracking table
    if registeredSocieties[name] then
        print('^3[INFO] ^7 Society already registered: ^5' .. name .. '^7')
        return registeredSocieties[name]
    end

    -- Check if society exists in ESX
    if CRUX.GetSociety(name) then
        registeredSocieties[name] = CRUX.GetSociety(name)
        return registeredSocieties[name]
    end

    -- addon_account query
    MySQL.Async.fetchAll('SELECT name FROM addon_account WHERE name = ?', {account}, function(result)
        if result and #result > 0 then
            print('^3[INFO] ^7 addon_account already exists for: ^5' .. account .. '^7')
        else
            MySQL.Async.execute([[
                INSERT INTO `addon_account` (name, label, shared) VALUES
                    (?, ?, 1)
                ;
            ]], { account, label })
            print('^2[INFO] ^7 Created addon_account for: ^5' .. account .. '^7')
        end
    end)

    -- addon_inventory query
    MySQL.Async.fetchAll('SELECT name FROM addon_inventory WHERE name = ?', {inventory}, function(result)
        if result and #result > 0 then
            print('^3[INFO] ^7 addon_inventory already exists for: ^5' .. inventory .. '^7')
        else
            MySQL.Async.execute([[
                INSERT INTO `addon_inventory` (name, label, shared) VALUES
                    (?, ?, 1)
                ;
            ]], { inventory, label })
            print('^2[INFO] ^7 Created addon_inventory for: ^5' .. inventory .. '^7')
        end
    end)

    -- datastore query
    MySQL.Async.fetchAll('SELECT name FROM datastore WHERE name = ?', {datastore}, function(result)
        if result and #result > 0 then
            print('^3[INFO] ^7 datastore already exists for: ^5' .. datastore .. '^7')
        else
            MySQL.Async.execute([[
                INSERT INTO `datastore` (name, label, shared) VALUES
                    (?, ?, 1)
                ;
            ]], { datastore, label })
            print('^2[INFO] ^7 Created datastore for: ^5' .. datastore .. '^7')
        end
    end)

    -- job query
    MySQL.Async.fetchAll('SELECT name FROM jobs WHERE name = ?', {name}, function(result)
        if result and #result > 0 then
            print('^3[INFO] ^7 job already exists for: ^5' .. name .. '^7')
        else
            MySQL.Async.execute([[
                INSERT INTO `jobs` (name, label, whitelisted) VALUES
                    (?, ?, 0)
                ;
            ]], { name, label })
            print('^2[INFO] ^7 Created job for: ^5' .. name .. '^7')
        end
    end)

    -- job_grades query
    MySQL.Async.fetchAll('SELECT job_name FROM job_grades WHERE job_name = ? LIMIT 1', {name}, function(result)
        if result and #result > 0 then
            print('^3[INFO] ^7 job_grades already exist for: ^5' .. name .. '^7')
        else
            MySQL.Async.execute([[
                INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
                    (?,0,'recruit','Recruit',120,'{}','{}'),
                    (?,1,'novice','Novice',240,'{}','{}'),
                    (?,2,'experienced','Experienced',360,'{}','{}'),
                    (?,3,'advanced',"Advanced",480,'{}','{}'),
                    (?,4,'manager',"Manager",480,'{}','{}'),
                    (?,5,'boss','Boss',500,'{}','{}')
                ;
            ]], { name, name, name, name, name, name })
            print('^2[INFO] ^7 Created job_grades for: ^5' .. name .. '^7')
        end
    end)

    print('^2[INFO] ^7 Registered society: ^5' .. name .. '^7')

    exports["esx_society"]:registerSociety(name, label, account, datastore, inventory, data)

    return CRUX.GetSociety(name)
end

function CRUX.AddSocietyMoney(society, amount, reason)
    local societyTbl = CRUX.GetSociety(society)

    if not societyTbl then
        local label = society:gsub("^%l", string.upper)
        societyTbl = CRUX.RegisterSociety(society, label, "society_" .. society, "society_" .. society,
            "society_" .. society, {
            type = "public"
        })
    end

    TriggerEvent('esx_addonaccount:getSharedAccount', societyTbl.account, function(account)
        account.addMoney(amount)
    end)

    return true
end

function CRUX.RemoveSocietyMoney(society, amount, reason)
    local societyTbl = CRUX.GetSociety(society)

    if not societyTbl then
        local label = society:gsub("^%l", string.upper)
        societyTbl = CRUX.RegisterSociety(society, label, "society_" .. society, "society_" .. society,
            "society_" .. society, {
            type = "public"
        })
    end

    TriggerEvent('esx_addonaccount:getSharedAccount', societyTbl.account, function(account)
        account.removeMoney(amount)
    end)

    return true
end

return CRUX
