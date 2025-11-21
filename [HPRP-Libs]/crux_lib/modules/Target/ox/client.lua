local CRUX = {}

-- Helper functions for ox_target conversion
local oxTargetHelpers = {}

-- Convert options for ox_target format
function oxTargetHelpers.convert(options)
    local distance = options.distance
    options = options.options

    -- People may pass options as a hashmap (or mixed, even)
    for k, v in pairs(options) do
        if type(k) ~= 'number' then
            table.insert(options, v)
        end
    end

    for id, v in pairs(options) do
        if type(id) ~= 'number' then
            options[id] = nil
            goto continue
        end

        v.onSelect = v.action
        v.distance = v.distance or distance
        v.name = v.name or v.label
        v.items = v.item
        v.icon = v.icon
        v.groups = v.job

        local groupType = type(v.groups)
        if groupType == 'nil' then
            v.groups = {}
            groupType = 'table'
        end
        if groupType == 'string' then
            local val = v.gang
            if type(v.gang) == 'table' then
                if table.type(v.gang) ~= 'array' then
                    val = {}
                    for k in pairs(v.gang) do
                        val[#val + 1] = k
                    end
                end
            end

            if val then
                v.groups = { v.groups, type(val) == 'table' and table.unpack(val) or val }
            end

            val = v.citizenid
            if type(v.citizenid) == 'table' then
                if table.type(v.citizenid) ~= 'array' then
                    val = {}
                    for k in pairs(v.citizenid) do
                        val[#val + 1] = k
                    end
                end
            end

            if val then
                v.groups = { v.groups, type(val) == 'table' and table.unpack(val) or val }
            end
        elseif groupType == 'table' then
            local val = {}
            if table.type(v.groups) ~= 'array' then
                for k in pairs(v.groups) do
                    val[#val + 1] = k
                end
                v.groups = val
                val = nil
            end

            val = v.gang
            if type(v.gang) == 'table' then
                if table.type(v.gang) ~= 'array' then
                    val = {}
                    for k in pairs(v.gang) do
                        val[#val + 1] = k
                    end
                end
            end

            if val then
                v.groups = { table.unpack(v.groups), type(val) == 'table' and table.unpack(val) or val }
            end

            val = v.citizenid
            if type(v.citizenid) == 'table' then
                if table.type(v.citizenid) ~= 'array' then
                    val = {}
                    for k in pairs(v.citizenid) do
                        val[#val + 1] = k
                    end
                end
            end

            if val then
                v.groups = { table.unpack(v.groups), type(val) == 'table' and table.unpack(val) or val }
            end
        end

        if type(v.groups) == 'table' and table.type(v.groups) == 'empty' then
            v.groups = nil
        end

        if v.event and v.type and v.type ~= 'client' then
            if v.type == 'server' then
                v.serverEvent = v.event
            elseif v.type == 'command' then
                v.command = v.event
            end

            v.event = nil
            v.type = nil
        end

        v.action = nil
        v.job = nil
        v.gang = nil
        v.citizenid = nil
        v.item = nil
        v.qtarget = true

        ::continue::
    end

    return options
end

--- Add a box zone.
function CRUX.AddBoxZone(identifier, coords, length, width, data, debugPoly)
    exports.ox_target:addBoxZone({
        name = identifier,
        coords = vec3(coords.x, coords.y, (data.minZ + data.maxZ) / 2),
        size = vec3(width, length, math.abs(data.maxZ - data.minZ)),
        rotation = data.heading,
        debug = debugPoly,
        options = oxTargetHelpers.convert({options = data.options, distance = data.distance})
    })
    return identifier
end

--- Add a circle zone.
function CRUX.AddCircleZone(identifier, coords, radius, data, debugPoly)
    exports.ox_target:addSphereZone({
        name = identifier,
        coords = coords,
        radius = radius,
        debug = debugPoly,
        options = oxTargetHelpers.convert({options = data.options, distance = data.distance})
    })
    return identifier
end

--- Add a target entity.
function CRUX.AddTargetEntity(entityId, data)
    if NetworkGetEntityIsNetworked(entityId) then
        exports.ox_target:addEntity(NetworkGetNetworkIdFromEntity(entityId), oxTargetHelpers.convert({options = data.options, distance = data.distance}))
    else
        exports.ox_target:addLocalEntity(entityId, oxTargetHelpers.convert({options = data.options, distance = data.distance}))
    end
end

--- Add a target model.
function CRUX.AddTargetModel(models, data)
    exports.ox_target:addModel(models, oxTargetHelpers.convert({options = data.options, distance = data.distance}))
end

--- Remove a target entity.
function CRUX.RemoveTargetEntity(entity)
    if NetworkGetEntityIsNetworked(entity) then
        exports.ox_target:removeEntity(NetworkGetNetworkIdFromEntity(entity))
    else
        exports.ox_target:removeLocalEntity(entity)
    end
end

--- Remove a zone.
function CRUX.RemoveZone(identifier)
    exports.ox_target:removeZone(identifier, true)
end

--- Add a global ped target.
function CRUX.AddGlobalPed(identifier, data)
    exports.ox_target:addGlobalPed(oxTargetHelpers.convert({options = data.options, distance = data.distance}))
end

--- Add a poly zone.
function CRUX.AddPolyZone(identifier, points, data, debugPoly)
    -- Convert vector2 points to vector3 if needed
    local polyPoints = {}
    for i, point in ipairs(points) do
        if point.z == nil then  -- If point is vector2
            local z = (data.minZ and data.maxZ) and ((data.minZ + data.maxZ) / 2) or 0
            polyPoints[i] = vec3(point.x, point.y, z)
        else  -- If point is already vector3
            polyPoints[i] = point
        end
    end

    -- Calculate thickness from minZ and maxZ if provided
    local thickness = data.thickness
    if not thickness and data.minZ and data.maxZ then
        thickness = math.abs(data.maxZ - data.minZ)
    end

    exports.ox_target:addPolyZone({
        name = identifier,
        points = polyPoints,
        thickness = thickness or 4.0,
        debug = debugPoly,
        drawSprite = data.drawSprite,
        options = oxTargetHelpers.convert({options = data.options, distance = data.distance})
    })
    return identifier
end

--- Remove a global ped target.
function CRUX.RemoveGlobalPed(identifier)
    exports.ox_target:removeGlobalPed()
end

return CRUX
