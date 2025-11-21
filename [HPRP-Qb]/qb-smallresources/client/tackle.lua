local QBCore = exports['qb-core']:GetCoreObject()

local readyToTackle = true

local function TackleAnim()
    local ped = PlayerPedId()
    if not QBCore.Functions.GetPlayerData().metadata["ishandcuffed"] and not IsPedRagdoll(ped) then
        RequestAnimDict("swimming@first_person@diving")
        while not HasAnimDictLoaded("swimming@first_person@diving") do
            Wait(1)
        end
        if IsEntityPlayingAnim(ped, "swimming@first_person@diving", "dive_run_fwd_-45_loop", 3) then
            RemoveAnimDict('swimming@first_person@diving')
            SetPedToRagdoll(ped, 1500, 1500, 0, 0, 0, 0)
            ClearPedSecondaryTask(ped)
        else
            TaskPlayAnim(ped, "swimming@first_person@diving", "dive_run_fwd_-45_loop", 8.0, -8, -1, 49, 0, 0, 0, 0)
            seccount = 3
            while seccount > 0 do
                Wait(100)
                seccount = seccount - 1
            end
            RemoveAnimDict('swimming@first_person@diving')
            ClearPedSecondaryTask(ped)
            SetPedToRagdoll(ped, 1500, 1500, 0, 0, 0, 0)
        end
    end
end

local function Tackle()
    local closestPlayer, distance = QBCore.Functions.GetClosestPlayer()
    if (distance ~= -1 and distance < 2) then
        if readyToTackle then
            TriggerServerEvent("tackle:server:TacklePlayer", GetPlayerServerId(closestPlayer))
            TackleAnim()
            readyToTackle = false
            Wait(10000)
            readyToTackle = true
        end
    end
end

RegisterCommand('tackle', function()
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped, false) and GetEntitySpeed(ped) > 2.5 then
        Tackle()
    end
end)

RegisterKeyMapping('tackle', 'Tackle', 'keyboard', 'L ALT')
RegisterNetEvent('tackle:client:GetTackled', function()
    local ped = PlayerPedId()
    local time = math.random(2500, 5000)
    SetPedToRagdoll(ped, time, math.random(2500, 5000), 0, 0, 0, 0)
    readyToTackle = false
    Wait(time)
    readyToTackle = true
end)
