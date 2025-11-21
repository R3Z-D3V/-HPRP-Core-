CRUX.Target = {}
local resourceName = 'crux_lib'

-- Get Target type from config
local TargetType = Config and Config.Target or 'auto-detect'  -- Default to auto-detect detection if not set


if not Resource then
    local resourceFile = LoadResourceFile('crux_lib', 'ResourceName.lua')
    if resourceFile then
        local fn = load(resourceFile, '@crux_lib/ResourceName.lua', 't', _G)
        if fn then fn() end
    end
end

-- Target types and their resource names to check
local TargetTypes = Resource and Resource.Target

-- auto-detect-detect Target system
local function DetectTargetSystem()
    if TargetType ~= 'auto-detect' then
        -- Check if specified Target type is available
        local resourceToCheck = TargetTypes[TargetType]
        if resourceToCheck and GetResourceState(resourceToCheck) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 Using specified Target system: %s"):format(TargetType)) end
            return TargetType
        else
            if Config.DebugScript then print(("^3[WARNING]^7 Specified Target system '%s' not found or not started. Falling back to auto-detect-detection."):format(TargetType)) end
        end
    end

    -- auto-detect-detection logic
if Config.DebugScript then print("^5[INFO]^7 auto-detect-detecting Target system...") end
for targetType, resourceName in pairs(TargetTypes) do
    local state = GetResourceState(resourceName)
    if state == 'started' then
        if Config.DebugScript then
            print(("^2[INFO]^7 auto-detect-detected Target system: %s"):format(targetType, resourceName))
        end
        return targetType
    end
end

    -- Default to framework-based
    local framework = 'ox'
    if Config.DebugScript then print(("^3[WARNING]^7 No Target system detected, falling back to framework default: %s"):format(framework)) end
    return framework
end

-- Detect and set Target type
TargetType = DetectTargetSystem()

local filePath = ('modules/Target/%s/client.lua'):format(TargetType)
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

    -- Load and execute the Target type specific module
    local fn, err = load(fileContent, ('@@%s/%s'):format(resourceName, filePath), 't', env)
    if fn then
        local success, result = pcall(fn)
        if success then
            if Config.DebugScript then print(('^2[INFO]^7 Successfully loaded the Target module: %s'):format(TargetType)) end
            -- Merge the result with CRUX.Target
            if type(result) == 'table' then
                for k, v in pairs(result) do
                    CRUX.Target[k] = v
                end
            end
        else
            if Config.DebugScript then print(('^1[ERROR]^7 Error executing the Target module: %s - %s'):format(TargetType, result)) end
        end
    else
        if Config.DebugScript then print(('^1[ERROR]^7 Failed to load the Target module: %s - %s'):format(TargetType, err)) end
    end
else
    if Config.DebugScript then print(("^1[ERROR]^7 Target module file not found: %s - Make sure the proper module exists for %s"):format(filePath, TargetType)) end
end

return CRUX.Target
