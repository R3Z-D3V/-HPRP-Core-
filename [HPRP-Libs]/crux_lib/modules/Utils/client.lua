local Utils = {}

function Utils.CreateBlip(blip)
    local Blip = AddBlipForCoord(blip.location.x, blip.location.y, blip.location.z)
    SetBlipSprite(Blip, blip.sprite or 1)
    SetBlipScale(Blip, blip.scale or 1)
    SetBlipColour(Blip, blip.color or 0)
    SetBlipRoute(Blip, blip.route or false)
    SetBlipRouteColour(Blip, blip.routeColor or 0)
    SetBlipDisplay(Blip, blip.display or 2)
    SetBlipAsShortRange(Blip, blip.shortRange or true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(blip.name)
    EndTextCommandSetBlipName(Blip)
	return Blip
end

function Utils.ClearPropFromHands()
    local ped = PlayerPedId()
    local prop = GetPedPropIndex(ped, 5)
    if prop and prop ~= -1 then
        ClearPedProp(ped, 5)
    end
end

local spawnedPeds = {}

function Utils.CreatePed(PedType, PedHash, vector4, isNetwork, scenario)
    x, y, z, h = table.unpack(vector4)
    if not HasModelLoaded(PedHash) then
        RequestModel(PedHash)
        while not HasModelLoaded(PedHash) do Wait(1) end
    end
    local Ped = CreatePed(PedType, PedHash, x, y, z, h, isNetwork, true)
    SetModelAsNoLongerNeeded(PedHash)

    if scenario then
        ClearPedTasksImmediately(Ped)
        Wait(100)
        TaskStartScenarioInPlace(Ped, scenario, -1, false)
    end

    Wait(100)
    FreezeEntityPosition(Ped, true)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, true)

    spawnedPeds[Ped] = true

    return Ped
end

function Utils.RemovePed(Ped)
    if spawnedPeds[Ped] then
        spawnedPeds[Ped] = nil
        DeleteEntity(Ped)
    end
end

function Utils.RemoveAllPeds()
    for k, _ in pairs(spawnedPeds) do
        DeleteEntity(k)
    end
    spawnedPeds = {}
end

function Utils.SpawnProp(prop, location, rotation)
    local model = GetHashKey(prop)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    local obj = CreateObject(model, location.x, location.y, location.z, false, true, true)
    SetEntityHeading(obj, location.w)
    SetEntityRotation(obj, rotation.x, rotation.y, rotation.z, 2, true)
    FreezeEntityPosition(obj, true)
    SetModelAsNoLongerNeeded(model)
    return obj
end

function Utils.Debug(data)
    if Config.DebugScript then print(('[ %s : DEBUG]'):format(CRUX.name)) end
    if data and type(data) == 'table' then
        if Config.DebugScript then print(json.encode(data, {indent = true, exception = function(reason, v) return reason end})) end
    else
        if Config.DebugScript then print(data) end
    end
    if Config.DebugScript then print('[ END DEBUG ]') end
end

return Utils