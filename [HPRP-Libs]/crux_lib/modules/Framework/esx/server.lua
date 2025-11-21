local CRUX = {}

-- Make sure ESX is loaded
if not ESX then
    ESX = exports['es_extended']:getSharedObject()
end

function CRUX.RegisterLicense(src)
    local xPlayer = ESX.GetPlayerFromId(src)

    TriggerEvent('esx_license:getLicenses', src, function(licenses)
        local licenseStatus = {}

        if licenses and type(licenses) == 'table' then
            for i = 1, #licenses do
                licenseStatus[licenses[i].type] = true
            end
        end

        -- Register callback with the licenseStatus inside this function
        lib.callback.register(GetCurrentResourceName() .. ':CRUX:GetLicenseStatus', function(source)
            return licenseStatus
        end)
    end)
end

function CRUX.GetPlayerFromId(source)
    return ESX.GetPlayerFromId(source)
end

function CRUX.GetPlayerFromIdentifier(identifier)
    return ESX.GetPlayerFromIdentifier(identifier)
end

function CRUX.GetPlayerCitizenId(source)
    -- print(ESX.GetPlayerFromId(source).getIdentifier())
    return ESX.GetPlayerFromId(source).getIdentifier()
end

function CRUX.GetPlayers()
    return ESX.GetPlayers()
end

function CRUX.GetESXPlayers()
    return ESX.GetExtendedPlayers()
end

function CRUX.GetIdentifier(source)
    local xPlayer = CRUX.GetPlayerFromId(source)
    if xPlayer then
        return xPlayer.identifier
    end
    return nil
end

function CRUX.GetGender(source)
    local xPlayer = CRUX.GetPlayerFromId(source)
    if xPlayer then
        -- Try to get gender from ESX Identity
        local userData = MySQL.Sync.fetchAll('SELECT sex FROM users WHERE identifier = ?', {xPlayer.identifier})
        if userData and userData[1] and userData[1].sex then
            return userData[1].sex == 'm' and 'Male' or 'Female'
        end
    end
    return 'Male' -- Default to male if player not found
end

function CRUX.AddMoney(source, moneyType, amount, reason)
    local xPlayer = CRUX.GetPlayerFromId(source)
    if xPlayer then
        if moneyType == 'cash' then
            xPlayer.addMoney(amount)
            return true
        elseif moneyType == 'bank' then
            xPlayer.addAccountMoney('bank', amount, reason)
            return true
        end
    end
    return false
end

function CRUX.RemoveMoney(source, moneyType, amount, reason)
    local xPlayer = CRUX.GetPlayerFromId(source)
    if xPlayer then
        if moneyType == 'cash' then
            xPlayer.removeMoney(amount)
            return true
        elseif moneyType == 'bank' then
            xPlayer.removeAccountMoney('bank', amount, reason)
            return true
        end
    end
    return false
end

function CRUX.GetMoney(source, moneyType)
    local xPlayer = CRUX.GetPlayerFromId(source)
    if xPlayer then
        if moneyType == 'cash' then
            return xPlayer.getMoney()
        elseif moneyType == 'bank' then
            return xPlayer.getAccount('bank').money
        end
    end
    return 0
end

function CRUX.GetItemLabel(item)
    return ESX.GetItemLabel(item)
end

function CRUX.GetPlayerName(source)
    local xPlayer = CRUX.GetPlayerFromId(source)
    if xPlayer then
        return xPlayer.getName()
    end
    return "Unknown"
end

function CRUX.HasPermission(source, job, grade)
    local xPlayer = CRUX.GetPlayerFromId(source)
    if xPlayer and xPlayer.job.name == job then
        if not grade then
            return true
        elseif type(grade) == "table" then
            for _, g in ipairs(grade) do
                if xPlayer.job.grade >= g then
                    return true
                end
            end
        else
            return xPlayer.job.grade >= grade
        end
    end
    return false
end

function CRUX.CreateUseableItem(item, func)
    ESX.RegisterUsableItem(item, func)
end

-- ESX doesn't have direct metadata functions like QB, so we'll implement using player custom data
function CRUX.SetMetaData(source, key, value)
    local actualValue = math.floor(value * 10000)
    TriggerClientEvent('esx_status:set', source, key, actualValue)
end

function CRUX.GetMetaData(source, key)
    local result = nil
    TriggerEvent('esx_status:getStatus', source, key, function(status)
        if status and status.val then
            -- Convert status.val (0-1000000) to percent (0-100)
            local percent = math.floor((status.val / 1000000) * 100)
            result = string.format("%02d", percent)
        else
            result = "00"
        end
    end)
    return result
end

function CRUX.GetPlayer(source)
    return ESX.GetPlayerFromId(source)
end

function CRUX.SetJob(source, jobName, grade)
    local xPlayer = CRUX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.setJob(jobName, tonumber(grade))
        return true
    end
    return false
end

function CRUX.GetJob(src)
    local xPlayer = CRUX.GetPlayerFromId(src)
    if xPlayer then
        return xPlayer.job
    end
    return nil
end

function CRUX.GetQBPlayers()
    -- In ESX context, this is equivalent to GetESXPlayers
    return CRUX.GetESXPlayers()
end

function CRUX.SetJobDuty(source, duty)
    local xPlayer = CRUX.GetPlayerFromId(source)
    if xPlayer then
        -- ESX doesn't have native duty system, so we'll create a custom implementation
        TriggerClientEvent('esx:setDuty', source, duty)
        return true
    end
    return false
end

-- Register callback to get player name by various identifiers (only if not already registered)
local callbackName = GetCurrentResourceName() .. 'crux_lib:getPlayerName'
local success, err = pcall(function()
    lib.callback.register(callbackName, function(source, params)
        local playerName = "Unknown Player"

        if not params or not params.type or not params.id then
            return playerName
        end

        if params.type == 'source' then
            -- Get player by source ID
            local xPlayer = ESX.GetPlayerFromId(params.id)
            if xPlayer then
                local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = ?', {xPlayer.identifier})
                if result and result[1] then
                    playerName = ("%s %s"):format(result[1].firstname or "", result[1].lastname or "")
                else
                    playerName = GetPlayerName(params.id)
                end
            end
        elseif params.type == 'identifier' then
            -- Get player by ESX identifier
            local xPlayer = ESX.GetPlayerFromIdentifier(params.id)
            if xPlayer then
                local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = ?', {params.id})
                if result and result[1] then
                    playerName = ("%s %s"):format(result[1].firstname or "", result[1].lastname or "")
                end
            end
        end

        return playerName
    end)
end)


return CRUX
