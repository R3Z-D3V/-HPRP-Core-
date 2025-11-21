local CRUX = {}

-- Improved Helper function to ensure options are correctly formatted for qb-target
local function formatOptions(data)
    if not data then return nil end

    local formattedOptions = {
        distance = data.distance or 2.5
    }

    -- Always prefer explicit 'options' key if present
    if type(data.options) == 'table' then
        -- If options is a single option table (has label, action, but not array), wrap it
        if data.options.label and type(data.options.action) == "function" then
            formattedOptions.options = { data.options }
        else
            formattedOptions.options = data.options
        end
    else
        -- Otherwise, scan for valid option tables in the data
        formattedOptions.options = {}
        for k, v in pairs(data) do
            -- Only add if it's a table with a label (option entry)
            -- All extra fields (like canInteract) are preserved
            if type(v) == 'table' and v.label then
                table.insert(formattedOptions.options, v)
            end
        end
        -- If still empty, fallback: treat the whole data as a single option if it looks like one
        if #formattedOptions.options == 0 and data.label then
            table.insert(formattedOptions.options, data)
        end
    end

    -- Ensure options is always a non-empty table
    if not formattedOptions.options or #formattedOptions.options == 0 then
        CRUX.Debug("^1[ERROR] No valid options found in formatOptions")
        return nil
    end

    return formattedOptions
end

--- Add a box zone.
function CRUX.AddBoxZone(identifier, coords, length, width, data, debugPoly)
    if not identifier or not coords or not length or not width or not data then
        CRUX.Debug("^1[ERROR] Missing required parameters for AddBoxZone")
        return
    end

    local opts = formatOptions(data)
    if not opts then
        CRUX.Debug("^1[ERROR] Invalid data format for AddBoxZone")
        return
    end

    local handler = exports['qb-target']:AddBoxZone(identifier, coords, length, width, {
        name = identifier,
        heading = data.heading or 0.0, -- Default heading if not provided
        debugPoly = debugPoly or false,
        minZ = data.minZ, -- Can be nil
        maxZ = data.maxZ, -- Can be nil
    }, opts)
    return handler
end

--- Add a circle zone.
function CRUX.AddCircleZone(identifier, coords, radius, data, debugPoly)
    if not identifier or not coords or not radius or not data then
        CRUX.Debug("^1[ERROR] Missing required parameters for AddCircleZone")
        return
    end

    local opts = formatOptions(data)
    if not opts then
        CRUX.Debug("^1[ERROR] Invalid data format for AddCircleZone")
        return
    end

    local handler = exports['qb-target']:AddCircleZone(identifier, coords, radius, {
        name = identifier,
        useZ = data.useZ ~= false, -- Default to true unless explicitly set to false
        debugPoly = debugPoly or false,
        minZ = data.minZ, -- Can be nil
        maxZ = data.maxZ, -- Can be nil
    }, opts)
    return handler
end

--- Add a target entity.
function CRUX.AddTargetEntity(entityId, data)
    if not entityId or not data then
        CRUX.Debug("^1[ERROR] Missing required parameters for AddTargetEntity")
        return
    end

    -- Ensure entity is valid before adding target
    if not DoesEntityExist(entityId) then
        CRUX.Debug("^1[ERROR] Entity does not exist: " .. tostring(entityId))
        return
    end

    local opts = formatOptions(data)
    if not opts then
        CRUX.Debug("^1[ERROR] Invalid data format for AddTargetEntity")
        return
    end

    exports['qb-target']:AddTargetEntity(entityId, opts)
end

--- Add a target model.
function CRUX.AddTargetModel(models, data)
    if not models or not data then
        CRUX.Debug("^1[ERROR] Missing required parameters for AddTargetModel")
        return
    end

    local opts = formatOptions(data)
    if not opts then
        CRUX.Debug("^1[ERROR] Invalid data format for AddTargetModel")
        return
    end

    exports['qb-target']:AddTargetModel(models, opts)
end

--- Remove a target entity.
function CRUX.RemoveTargetEntity(entity)
    if not entity then
        CRUX.Debug("^1[ERROR] Missing entity parameter for RemoveTargetEntity")
        return
    end

    if DoesEntityExist(entity) then
        exports['qb-target']:RemoveTargetEntity(entity)
    else
        CRUX.Debug("^3[WARNING] Attempting to remove target from non-existent entity: " .. tostring(entity))
    end
end

--- Remove a zone.
function CRUX.RemoveZone(identifier)
    if not identifier then
        CRUX.Debug("^1[ERROR] Missing identifier parameter for RemoveZone")
        return
    end
    exports['qb-target']:RemoveZone(identifier)
end

--- Add a global ped target.
function CRUX.AddGlobalPed(identifier, data)
    if not identifier or not data then
        CRUX.Debug("^1[ERROR] Missing required parameters for AddGlobalPed")
        return
    end

    local opts = formatOptions(data)
    if not opts then
        CRUX.Debug("^1[ERROR] Invalid data format for AddGlobalPed")
        return
    end

    exports['qb-target']:AddGlobalPed({
        name = identifier,
        options = opts.options,
        distance = opts.distance,
    })
end

--- Add a poly zone.
function CRUX.AddPolyZone(identifier, points, data, debugPoly)
    if not identifier or not points or not data then
        CRUX.Debug("^1[ERROR] Missing required parameters for AddPolyZone")
        return
    end

    if type(points) ~= 'table' or #points < 3 then
        CRUX.Debug("^1[ERROR] Invalid points data for AddPolyZone - must be a table with at least 3 points")
        return
    end

    local opts = formatOptions(data)
    if not opts then
        CRUX.Debug("^1[ERROR] Invalid data format for AddPolyZone")
        return
    end

    -- For qb-target, they expect vector2 points
    local polyPoints = {}
    for i, point in ipairs(points) do
        if point then
            local pointType = type(point)
            if pointType == 'table' then
                if point.z ~= nil then  -- If point is vector3
                    polyPoints[i] = vector2(point.x, point.y) -- Convert to vector2
                else  -- If already vector2 table
                    polyPoints[i] = point
                end
            elseif pointType == 'vector2' then
                -- Already a vector2, use directly
                polyPoints[i] = point
            elseif pointType == 'vector3' then
                -- Convert vector3 to vector2
                polyPoints[i] = vector2(point.x, point.y)
            elseif pointType == 'userdata' then
                -- Handle other userdata types
                local success, z = pcall(function() return point.z end)
                if success and z ~= nil then  -- If point is vector3
                    polyPoints[i] = vector2(point.x, point.y) -- Convert to vector2
                else  -- If already vector2
                    polyPoints[i] = point
                end
            else
                CRUX.Debug("^1[ERROR] Invalid point data at index " .. i .. " in AddPolyZone - type: " .. pointType)
                return
            end
        else
            CRUX.Debug("^1[ERROR] Invalid point data at index " .. i .. " in AddPolyZone - point is nil")
            return
        end
    end

    local handler = exports['qb-target']:AddPolyZone(identifier, polyPoints, {
        name = identifier,
        debugPoly = debugPoly or false,
        minZ = data.minZ, -- Can be nil
        maxZ = data.maxZ, -- Can be nil
    }, opts)
    return handler
end

--- Remove a global ped target.
function CRUX.RemoveGlobalPed(identifier)
    if not identifier then
        CRUX.Debug("^1[ERROR] Missing identifier parameter for RemoveGlobalPed")
        return
    end
    exports['qb-target']:RemoveGlobalPed(identifier)
end

return CRUX
