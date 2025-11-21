CRUX.VehicleKeys = {}
local resourceName = 'crux_lib'

-- Get VehicleKeys type from config with auto-detect-detection fallback
local VehicleKeysType = Config and Config.VehicleKeys or 'auto-detect'  -- Default to auto-detect detection

if not Resource then
    local resourceFile = LoadResourceFile('crux_lib', 'resource/resource.lua')
    if resourceFile then
        local fn = load(resourceFile, '@crux_lib/resource/resource.lua', 't', _G)
        if fn then fn() end
    end
end

-- VehicleKeys types and their resource names to check
local VehicleKeysTypes = Resource and Resource.VehicleKeys

-- auto-detect-detect VehicleKeys system
local function DetectVehicleKeysSystem()
    if VehicleKeysType ~= 'auto-detect' then
        -- Check if specified VehicleKeys type is available
        local resourceToCheck = VehicleKeysTypes[VehicleKeysType]
        if resourceToCheck and GetResourceState(resourceToCheck) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 Using specified VehicleKeys system: %s"):format(VehicleKeysType)) end
            return VehicleKeysType
        else
            if Config.DebugScript then print(("^3[WARNING]^7 Specified VehicleKeys system '%s' not found or not started. Falling back to auto-detect-detection."):format(VehicleKeysType)) end
        end
    end

    -- auto-detect-detection logic
    if Config.DebugScript then print("^5[INFO]^7 auto-detect-detecting VehicleKeys system...") end
    for type, resource in pairs(VehicleKeysTypes) do
        if GetResourceState(resource) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 auto-detect-detected VehicleKeys system: %s"):format(type)) end
            return type
        end
    end

    -- Default fallback
    if Config.DebugScript then print("^3[WARNING]^7 No VehicleKeys system detected, falling back to ox_lib VehicleKeys") end
    return 'ox'
end

-- Detect and set VehicleKeys type
VehicleKeysType = DetectVehicleKeysSystem()

-- Set current active VehicleKeys type
if type(CRUX.CurrentActive) ~= "table" then
    CRUX.CurrentActive = {}
end
CRUX.CurrentActive.VehicleKeys = VehicleKeysType

local filePath = ('modules/VehicleKeys/%s/client.lua'):format(VehicleKeysType)
local fileContent = LoadResourceFile(resourceName, filePath)

if fileContent then
    -- Create a custom environment for the module
    local env = {
        CRUX = CRUX,
        Config = Config,
        QBCore = QBCore, -- Make sure framework is available
        ESX = ESX,       -- Make sure framework is available
        _G = _G,
    }
    setmetatable(env, {__index = _G})

    -- Load and execute the VehicleKeys type specific module
    local fn, err = load(fileContent, ('@@%s/%s'):format(resourceName, filePath), 't', env)
    if fn then
        local success, result = pcall(fn)
        if success then
            if Config.DebugScript then print(('^2[INFO]^7 Successfully loaded the VehicleKeys module: %s'):format(VehicleKeysType)) end
            -- If the loaded module returns a function, use it directly as CRUX.VehicleKeys
            if type(result) == 'function' then
                CRUX.VehicleKeys = result
            -- If it returns a table, merge with CRUX.VehicleKeys
            elseif type(result) == 'table' then
                for k, v in pairs(result) do
                    CRUX.VehicleKeys[k] = v
                end
            end
        else
            if Config.DebugScript then print(('^1[ERROR]^7 Error executing the VehicleKeys module: %s - %s'):format(VehicleKeysType, result)) end
        end
    else
        if Config.DebugScript then print(('^1[ERROR]^7 Failed to load the VehicleKeys module: %s - %s'):format(VehicleKeysType, err)) end
    end
else
    if Config.DebugScript then print(('^1[ERROR]^7 VehicleKeys module file not found: %s'):format(filePath)) end
end

-- Ensure CRUX.VehicleKeys is a table that can be called like a function
if type(CRUX.VehicleKeys) ~= 'table' then
    local originalFunc = CRUX.VehicleKeys or function() end
    CRUX.VehicleKeys = {}
    setmetatable(CRUX.VehicleKeys, {
        __call = function(_, ...)
            return originalFunc(...)
        end
    })
elseif type(CRUX.VehicleKeys) == 'table' and not getmetatable(CRUX.VehicleKeys) then
    local originalVehicleKeys = CRUX.VehicleKeys.VehicleKeys or function() end
    setmetatable(CRUX.VehicleKeys, {
        __call = function(_, ...)
            return originalVehicleKeys(...)
        end
    })
end

-- Add function to get current active VehicleKeys type
CRUX.VehicleKeys.GetCurrentActiveVehicleKeys = function()
    return CRUX.CurrentActive and CRUX.CurrentActive.VehicleKeys or nil
end

return CRUX.VehicleKeys
