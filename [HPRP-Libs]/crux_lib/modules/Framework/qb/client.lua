local CRUX = {}

-- Make sure QBCore is loaded
if not QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end


function CRUX.GetJob()
    if not QBCore.Functions.GetPlayerData() then return {} end
    local job = QBCore.Functions.GetPlayerData().job
    if not job then return {} end

    return {
        name = job.name,
        label = job.label,
        grade = job.grade,
        onduty = job.onduty,
        isBoss = job.grade.isboss or false
    }
end

function CRUX.GetAllPlayers()
    return QBCore.Functions.GetPlayers()
end

function CRUX.GetPlayerItems()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if not PlayerData or not PlayerData.items then return {} end
    return PlayerData.items
end

function CRUX.SetJob(jobName, grade)
    TriggerServerEvent('QBCore:Server:SetJob', QBCore.Functions.GetPlayerData().source, jobName, grade)
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
    local PlayerData = QBCore.Functions.GetPlayerData()
    return (PlayerData and PlayerData.money) and PlayerData.money.cash or 0
end


function CRUX.GetGangs()
    local Player = QBCore.Functions.GetPlayerData()
    return Player.gang
end


function CRUX.GetBank()
    local PlayerData = QBCore.Functions.GetPlayerData()
    return (PlayerData and PlayerData.money) and PlayerData.money.bank or 0
end


function CRUX.GetPlayerName(target)
    -- No parameter - get current player's name
    if not target then
        local playerData = QBCore.Functions.GetPlayerData()
        if not playerData then return "" end

        if not playerData.charinfo then return "" end

        local firstName = playerData.charinfo.firstname or ""
        local lastName = playerData.charinfo.lastname or ""
        return ("%s %s"):format(firstName, lastName)
    end

    -- Parameter provided - handle different types
    if type(target) == "number" then
        -- Numeric source ID - use server callback
        local success, result = pcall(function()
            return lib.callback.await(GetCurrentResourceName() .. ':crux_lib:getPlayerName', false, {type = 'source', id = target})
        end)
        return (success and result) or "Unknown Player"
    elseif type(target) == "string" then
        -- CitizenID - use server callback
        local success, result = pcall(function()
            return lib.callback.await(GetCurrentResourceName() .. ':crux_lib:getPlayerName', false, {type = 'citizenid', id = target})
        end)
        return (success and result) or "Unknown Player"
    else
        return "Invalid Parameter"
    end
end

function CRUX.GetPlayerData()
    local playerData = QBCore.Functions.GetPlayerData()
    if not playerData then return {} end
    return playerData
end

function CRUX.GetPlayerId()
    local playerData = QBCore.Functions.GetPlayerData()
    if not playerData then return nil end
    return playerData.citizenid
end

function CRUX.IsCuffed()
    local playerData = QBCore.Functions.GetPlayerData()
    if not playerData or not playerData.metadata then return false end
    return playerData.metadata.ishandcuffed
end

function CRUX.GetLicenses()
    local Player = QBCore.Functions.GetPlayerData()
    if not Player then return end
    local licenses = Player.metadata.licences
    return licenses
end

function CRUX.GetGender()
    local playerData = QBCore.Functions.GetPlayerData()
    if not playerData or not playerData.charinfo then return 'Male' end

    local gender = playerData.charinfo.gender
    return gender == 0 and 'Male' or 'Female'
end

function CRUX.ResetPlayerClothing()
    local playerData = QBCore.Functions.GetPlayerData()
    if not playerData or not playerData.charinfo then return end

    -- Reset clothing to default state using QBCore's clothing system
    -- Pass gender as boolean (true for male, false for female)
    local gender = playerData.charinfo.gender or 0
    TriggerEvent('qb-clothing:client:loadPlayerClothing', gender == 0)
end

-- Get player metadata
function CRUX.GetMetaData(key)
    if not QBCore.Functions.GetPlayerData() then return nil end
    return QBCore.Functions.GetPlayerData().metadata[key]
end

-- Event handlers for QBCore events
local resource = CRUX.name or 'crux_lib'

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    TriggerEvent(resource..":settedDuty", duty)
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    TriggerEvent(resource..":onPlayerLoaded")
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    TriggerEvent(resource..":onPlayerUnload")
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate", function(job)
    TriggerEvent(resource..":onJobUpdate", job and job.name, job and job.onduty)
end)

function CRUX.GetVehiclePlate(entity)
    return QBCore.Functions.GetPlate(entity)
end

function CRUX.DeleteVehicle(entity)
    return QBCore.Functions.DeleteVehicle(entity)
end

function CRUX.GetPlayersClient()
    return QBCore.Functions.GetPlayers()
end

function CRUX.SpawnVehicle(model, vector, isNetwork)
    if isNetwork == nil then isNetwork = true end
    local p = promise.new()
    QBCore.Functions.SpawnVehicle(model, function(vehicle)
        p:resolve(vehicle)
    end, vector, isNetwork)
    return Citizen.Await(p)
end

function CRUX.ToggleDuty()
    TriggerServerEvent('QBCore:ToggleDuty')
end

return CRUX
