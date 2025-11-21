local CRUX = {}

-- Make sure QBX is loaded
if not QBX then
    QBX = exports['qbx_core']:GetCoreObject()
end

-- Event handlers for QBX events
local resource = CRUX.name or 'crux_lib'

-- Register updated event names for QBX if they differ
RegisterNetEvent('QBX:Client:SetDuty', function(duty)
    TriggerEvent(resource..":settedDuty", duty)
end)

RegisterNetEvent("QBX:Client:OnPlayerLoaded", function()
    TriggerEvent(resource..":onPlayerLoaded")
end)

RegisterNetEvent("QBX:Client:OnPlayerUnload", function()
    TriggerEvent(resource..":onPlayerUnload")
end)

RegisterNetEvent("QBX:Client:OnJobUpdate", function(job)
    TriggerEvent(resource..":onJobUpdate", job and job.name, job and job.onduty)
end)

function CRUX.GetVehiclePlate(entity)
    return QBX.Functions.GetPlate(entity)
end

function CRUX.DeleteVehicle(entity)
    return QBX.Functions.DeleteVehicle(entity)
end

function CRUX.SpawnVehicle(model, vector, isNetwork)
    if isNetwork == nil then isNetwork = true end
    local p = promise.new()
    QBX.Functions.SpawnVehicle(model, function(vehicle)
        p:resolve(vehicle)
    end, vector, isNetwork)
    return Citizen.Await(p)
end

function CRUX.ToggleDuty()
    TriggerServerEvent('QBX:ToggleDuty')
end

function CRUX.GetJob()
    if not QBX.PlayerData then return {} end
    local job = QBX.PlayerData.job
    if not job then return {} end

    return {
        name = job.name,
        label = job.label,
        grade = job.grade.level,
        onduty = job.onduty,
        isBoss = job.isboss or false
    }
end

function CRUX.HasPermission(job, grade)
    local playerJob = CRUX.GetJob()
    if playerJob.name == job then
        if not grade then
            return true
        elseif type(grade) == "table" then
            for _, g in ipairs(grade) do
                if playerJob.grade >= g then
                    return true
                end
            end
        else
            return playerJob.grade >= grade
        end
    end
    return false
end

function CRUX.GetCash()
    if not QBX.PlayerData then return 0 end
    return QBX.PlayerData.money.cash
end

function CRUX.GetGangs()
    local Player = QBCore.Functions.GetPlayerData()
    return Player.gang
end

function CRUX.GetBank()
    if not QBX.PlayerData then return 0 end
    return QBX.PlayerData.money.bank
end

function CRUX.GetPlayerName(target)
    -- No parameter - get current player's name
    local callbackName = GetCurrentResourceName() .. ':crux_lib:getPlayerName'

    if not target then
        if not QBX.PlayerData then return "" end
        local charInfo = QBX.PlayerData.charinfo
        if not charInfo then return "" end
        return ("%s %s"):format(charInfo.firstname or "", charInfo.lastname or "")
    end

    -- Parameter provided - handle different types
    if type(target) == "number" then
        -- Numeric source ID - use server callback
        local success, result = pcall(function()
            return lib.callback.await(callbackName, false, {type = 'source', id = target})
        end)
        return (success and result) or "Unknown Player"
    elseif type(target) == "string" then
        -- CitizenID - use server callback
        local success, result = pcall(function()
            return lib.callback.await(callbackName, false, {type = 'citizenid', id = target})
        end)
        return (success and result) or "Unknown Player"
    else
        return "Invalid Parameter"
    end
end

function CRUX.ResetPlayerClothing()
    local PlayerData = QBX.Functions.GetPlayerData()
    if not PlayerData then return end

    -- Reset clothing to default state
    TriggerEvent('qbx-clothing:client:loadPlayerClothing', PlayerData.charinfo.gender == 0)
end

function CRUX.SetJob(jobName, grade)
    TriggerServerEvent('QBX:Server:SetJob', QBX.PlayerData.source, jobName, grade)
end

function CRUX.GetPlayerData()
    if not QBX.PlayerData then return {} end
    return QBX.PlayerData
end

function CRUX.GetPlayerId()
    return QBX.PlayerData.citizenid
end

function CRUX.IsCuffed()
    if not QBX.PlayerData then return false end
    return QBX.PlayerData.metadata.ishandcuffed
end

function CRUX.GetGender()
    if not QBX.PlayerData then return 'Male' end
    local gender = QBX.PlayerData.charinfo.gender
    return gender == 0 and 'Male' or 'Female'
end

function CRUX.GetLicenses()
    local Player = QBX.Functions.GetPlayerData()
    if not Player then return end
    local licenses = Player.metadata.licences
    return licenses
end


-- Get player metadata
function CRUX.GetMetaData(key)
    if not QBX.PlayerData then return nil end
    return QBX.PlayerData.metadata[key]
end

return CRUX
