local CRUX = {}

--- Add a box zone.
function CRUX.AddBoxZone(identifier, coords, length, width, data, debugPoly)
    local handler = exports.qtarget:AddBoxZone(identifier, coords, length, width, {
        name = identifier,
        heading = data.heading,
        debugPoly = debugPoly,
        minZ = data.minZ,
        maxZ = data.maxZ,
    }, {
        options = data.options,
        distance = data.distance,
    })
    return handler
end

--- Add a circle zone.
function CRUX.AddCircleZone(identifier, coords, radius, data, debugPoly)
    local handler = exports.qtarget:AddCircleZone(identifier, coords, radius, {
        name = identifier,
        useZ = true,
        debugPoly = debugPoly,
    }, {
        options = data.options,
        distance = data.distance,
    })
    return handler
end

--- Add a target entity.
function CRUX.AddTargetEntity(entityId, data)
    exports.qtarget:AddTargetEntity(entityId, {
        options = data.options,
        distance = data.distance,
    })
end

--- Add a target model.
function CRUX.AddTargetModel(models, data)
    exports.qtarget:AddTargetModel(models, {
        options = data.options,
        distance = data.distance,
    })
end

--- Remove a target entity.
function CRUX.RemoveTargetEntity(entity)
    exports.qtarget:RemoveTargetEntity(entity)
end

--- Remove a zone.
function CRUX.RemoveZone(identifier)
    exports.qtarget:RemoveZone(identifier)
end

--- Add a global ped target.
function CRUX.AddGlobalPed(identifier, data)
    exports.qtarget:AddGlobalPed({
        name = identifier,
        options = data.options,
        distance = data.distance,
    })
end

--- Add a poly zone.
function CRUX.AddPolyZone(identifier, points, data, debugPoly)
    -- For qtarget, they expect vector2 points
    local polyPoints = {}
    for i, point in ipairs(points) do
        if point.z ~= nil then  -- If point is vector3
            polyPoints[i] = vector2(point.x, point.y) -- Convert to vector2
        else  -- If already vector2
            polyPoints[i] = point
        end
    end

    local handler = exports.qtarget:AddPolyZone(identifier, polyPoints, {
        name = identifier,
        debugPoly = debugPoly,
        minZ = data.minZ,
        maxZ = data.maxZ,
    }, {
        options = data.options,
        distance = data.distance,
    })
    return handler
end

--- Remove a global ped target.
function CRUX.RemoveGlobalPed(identifier)
    exports.qtarget:RemoveGlobalPed(identifier)
end

return CRUX
