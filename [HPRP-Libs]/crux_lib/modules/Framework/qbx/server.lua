local CRUX = {}

-- Make sure QBX is loaded
if not QBX then
    QBX = exports['qbx_core']:GetCoreObject()
end

function CRUX.GetPlayerFromId(source)
    return QBX.Functions.GetPlayer(source)
end

function CRUX.GetPlayerFromIdentifier(identifier)
    return QBX.Functions.GetPlayerByCitizenId(identifier)
end

function CRUX.GetPlayers()
    return QBX.Functions.GetPlayers()
end

function CRUX.GetQBXPlayers()
    return QBX.Functions.GetQBXPlayers()
end

function CRUX.GetIdentifier(source)
    local Player = CRUX.GetPlayerFromId(source)
    if Player then
        return Player.PlayerData.citizenid
    end
    return nil
end

function CRUX.GetGender(source)
    local Player = CRUX.GetPlayerFromId(source)
    if Player then
        return Player.PlayerData.charinfo.gender == 0 and 'Male' or 'Female'
    end
    return 'Male' -- Default to male if player not found
end

function CRUX.AddMoney(source, moneyType, amount, reason)
    local Player = CRUX.GetPlayerFromId(source)
    if Player then
        return Player.Functions.AddMoney(moneyType, amount, reason)
    end
    return false
end

function CRUX.RemoveMoney(source, moneyType, amount, reason)
    local Player = CRUX.GetPlayerFromId(source)
    if Player then
        return Player.Functions.RemoveMoney(moneyType, amount, reason)
    end
    return false
end

function CRUX.GetMoney(source, moneyType)
    local Player = CRUX.GetPlayerFromId(source)
    if Player and (moneyType == 'cash' or moneyType == 'bank') then
        return Player.Functions.GetMoney(moneyType)
    end
    return 0
end

function CRUX.GetItemLabel(item)
    return QBX.Shared.Items[item]?.label
end

function CRUX.GetPlayerName(source)
    local Player = CRUX.GetPlayerFromId(source)
    if Player then
        local charinfo = Player.PlayerData.charinfo
        return ("%s %s"):format(charinfo.firstname, charinfo.lastname)
    end
    return nil
end

function CRUX.HasPermission(source, job, grade)
    local Player = CRUX.GetPlayerFromId(source)
    if Player and Player.PlayerData.job.name == job then
        if not grade then
            return true
        elseif type(grade) == "table" then
            for _, g in ipairs(grade) do
                if Player.PlayerData.job.grade.level >= g then
                    return true
                end
            end
        else
            return Player.PlayerData.job.grade.level >= grade
        end
    end
    return false
end

function CRUX.CreateUseableItem(item, func)
    QBX.Functions.CreateUseableItem(item, func)
end

function CRUX.SetMetaData(source, key, value)
    local Player = CRUX.GetPlayerFromId(source)
    if Player then
        Player.Functions.SetMetaData(key, value)
        return true
    end
    return false
end

function CRUX.GetMetaData(source, key)
    local Player = CRUX.GetPlayerFromId(source)
    if Player then
        return Player.Functions.GetMetaData(key)
    end
    return nil
end

function CRUX.SetJob(source, jobName, grade)
    local Player = CRUX.GetPlayerFromId(source)
    if Player then
        return Player.Functions.SetJob(jobName, tonumber(grade))
    end
    return false
end

function CRUX.GetJob(src)
    local Player = CRUX.GetPlayerFromId(src)
    if Player then
        return Player.PlayerData.job
    end
    return nil
end

function CRUX.SetJobDuty(source, duty)
    local Player = CRUX.GetPlayerFromId(source)
    if Player then
        Player.Functions.SetJobDuty(duty)
        return true
    end
    return false
end

-- Register callback to get player name by various identifiers (only if not already registered)
local callbackName = 'crux_lib:getPlayerName'
local success, err = pcall(function()
    lib.callback.register(callbackName, function(source, params)
        local playerName = "Unknown Player"

        if not params or not params.type or not params.id then
            return playerName
        end

        if params.type == 'source' then
            -- Get player by source ID
            local targetPlayer = QBX.Functions.GetPlayer(params.id)
            if targetPlayer and targetPlayer.PlayerData and targetPlayer.PlayerData.charinfo then
                local charInfo = targetPlayer.PlayerData.charinfo
                playerName = ("%s %s"):format(charInfo.firstname or "", charInfo.lastname or "")
            end
        elseif params.type == 'citizenid' then
            -- Get player by citizenID
            local targetPlayer = QBX.Functions.GetPlayerByCitizenId(params.id)
            if targetPlayer and targetPlayer.PlayerData and targetPlayer.PlayerData.charinfo then
                local charInfo = targetPlayer.PlayerData.charinfo
                playerName = ("%s %s"):format(charInfo.firstname or "", charInfo.lastname or "")
            end
        end

        return playerName
    end)
end)

if not success and not string.find(err, "cannot overwrite callback") then
    -- print("Error registering callback:", err)
end

return CRUX
