local CRUX = {}

-- Make sure ESX is loaded
if not ESX then
    ESX = exports['es_extended']:getSharedObject()
end

function CRUX.GetJob()
    local playerData = ESX.GetPlayerData()
    if not playerData or not playerData.job then return {} end
    local job = playerData.job
    return {
        name = job.name,
        label = job.label,
        grade = job.grade,
        onduty = true, -- ESX doesn't have native duty state
        isBoss = job.grade_name == 'boss'
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
    return ESX.GetPlayerData().money
end

function CRUX.GetBank()
    local playerData = ESX.GetPlayerData()
    if not playerData or not playerData.accounts then
        return 0
    end
    for _, account in pairs(playerData.accounts) do
        if account.name == 'bank' then
            return account.money
        end
    end
    return 0
end

function CRUX.GetPlayerName(target)
    -- No parameter - get current player's name
    if not target then
        local firstName = ESX.PlayerData.firstName or ''
        local lastName = ESX.PlayerData.lastName or ''
        if firstName == '' and lastName == '' then
            return GetPlayerName(PlayerId())
        end
        return ("%s %s"):format(firstName, lastName)
    end

    -- Parameter provided - handle different types
    if type(target) == "number" then
        -- Numeric source ID - use server callback
        local success, result = pcall(function()
            return lib.callback.await(GetCurrentResourceName() .. 'crux_lib:getPlayerName', false, {type = 'source', id = target})
        end)
        return (success and result) or "Unknown Player"
    elseif type(target) == "string" then
        -- Identifier - use server callback
        local success, result = pcall(function()
            return lib.callback.await(GetCurrentResourceName() .. 'crux_lib:getPlayerName', false, {type = 'identifier', id = target})
        end)
        return (success and result) or "Unknown Player"
    else
        return "Invalid Parameter"
    end
end

function CRUX.ResetPlayerClothing()
    -- ESX equivalent of resetting player clothing
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
end

function CRUX.GetPlayerData()
    return ESX.GetPlayerData() or {}
end


function CRUX.GetPlayerId()
    return ESX.GetPlayerData().identifier
end

function CRUX.IsCuffed()
    return ESX.PlayerData.isCuffed or false
end

function CRUX.GetGender()
    local gender = ESX.PlayerData.sex or 'm'
    return gender == 'm' and 'Male' or 'Female'
end

function CRUX.GetLicenses()
    local licenseStatus = lib.callback.await(GetCurrentResourceName() .. ':CRUX:GetLicenseStatus', false)
    return licenseStatus
end

function CRUX.GetGangs()
    if not ESX.PlayerData then return {} end
    local job = ESX.PlayerData.job
    if not job then return {} end
end

-- ESX client-side metadata access
function CRUX.GetMetaData(key)
    local result = nil
    TriggerEvent('esx_status:getStatus', key, function(status)
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


-- Event handlers for ESX events
local resource = CRUX.name or 'crux_lib'

-- ESX events to match QBCore functionality
RegisterNetEvent('esx:setJob', function(job)
    -- Map the job structure to match the expected format
    local mappedJob = {
        name = job.name,
        onduty = true -- ESX doesn't have native duty state
    }
    TriggerEvent(resource..":onJobUpdate", job.name, true)
end)

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    TriggerEvent(resource..":onPlayerLoaded")
end)

RegisterNetEvent('esx:playerDropped', function()
    TriggerEvent(resource..":onPlayerUnload")
end)

-- ESX doesn't have built-in duty system, so we'll create a basic implementation
RegisterNetEvent('esx:setDuty', function(duty)
    TriggerEvent(resource..":settedDuty", duty)
end)

function CRUX.GetVehiclePlate(entity)
    return GetVehicleNumberPlateText(entity)
end

function CRUX.DeleteVehicle(entity)
    if DoesEntityExist(entity) then
        SetEntityAsMissionEntity(entity, true, true)
        DeleteVehicle(entity)
        return true
    end
    return false
end

function CRUX.SpawnVehicle(model, vector, isNetwork)
    if isNetwork == nil then isNetwork = true end

    local modelHash = GetHashKey(model)
    if not IsModelInCdimage(modelHash) then return nil end

    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(10)
    end

    local vehicle = CreateVehicle(modelHash, vector.x, vector.y, vector.z, vector.w or 0.0, isNetwork, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    SetVehicleNeedsToBeHotwired(vehicle, false)
    SetModelAsNoLongerNeeded(modelHash)

    return vehicle
end

function CRUX.ToggleDuty()
    -- ESX doesn't have native duty system, so we'll create a custom event
     Lib.interface.notify({
            title = 'Duty',
            description = "Player is now on duty.",
            type = 'inform',
            duration = 3000
    })
end

return CRUX
