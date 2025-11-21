CRUX.Framework = {}
local resourceName = 'crux_lib'

-- Get framework type from config with auto-detect-detection fallback
local frameworkType = 'auto-detect'  -- Default to auto-detect detection

-- Try to get config
if CRUX and type(CRUX.Config) == "table" and CRUX.Config.Framework then
    frameworkType = CRUX.Config.Framework
elseif Config and Config.Framework then
    frameworkType = Config.Framework
end


if not Resource then
    local resourceFile = LoadResourceFile('crux_lib', 'ResourceName.lua')
    if resourceFile then
        local fn = load(resourceFile, '@crux_lib/ResourceName.lua', 't', _G)
        if fn then fn() end
    end
end

-- Framework types and their resource names to check
local frameworkTypes = Resource and Resource.Framework

-- auto-detect-detect framework system
local function DetectFrameworkSystem()
    if frameworkType ~= 'auto-detect' then
        -- Check if specified framework is available
        local resourceToCheck = frameworkTypes[frameworkType]
        if resourceToCheck and GetResourceState(resourceToCheck) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 Using specified framework: %s"):format(frameworkType)) end
            return frameworkType
        else
            if Config.DebugScript then print(("^3[WARNING]^7 Specified framework '%s' not found or not started. Falling back to auto-detect-detection."):format(frameworkType)) end
        end
    end

    -- auto-detect-detection logic
    if Config.DebugScript then print("^5[INFO]^7 auto-detect-detecting framework...") end
    for type, resource in pairs(frameworkTypes) do
        if GetResourceState(resource) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 auto-detect-detected framework: %s"):format(type)) end
            return type
        end
    end

    -- Default fallback
    if Config.DebugScript then print("^3[WARNING]^7 No framework detected, falling back to qb") end
    return 'qb'
end

-- If Framework global var exists, use it, otherwise auto-detect-detect
if Framework then
    frameworkType = Framework
    if Config.DebugScript then
        print(("^2[INFO]^7 Using globally defined framework: %s"):format(frameworkType))
    end
else
    -- Detect and set framework type
    frameworkType = DetectFrameworkSystem()
end

local filePath = ('modules/Framework/%s/client.lua'):format(frameworkType)
local fileContent = LoadResourceFile(resourceName, filePath)

if fileContent then
    -- Create a custom environment for the module
    local env = {
        CRUX = CRUX,
        Config = Config,
        QBCore = QBCore, -- Make sure framework is available
        ESX = ESX,       -- Make sure framework is available
        QBX = QBX,       -- Make sure QBX is available if used
        allFuncs = {
            Name = 'crux_lib',
            framework = CRUX.Framework,
            interface = {
                notify = CRUX.Notify,
                menu = CRUX.Menu,
                input = CRUX.Input
            },
            inventory = CRUX.Inventory
        },
        Lib = {
            inventory = CRUX.Inventory,
            interface = {
                menu = CRUX.Menu,
                input = CRUX.Input,
                notify = CRUX.Notify
            }
        },
        lib = lib,
        _G = _G,
    }
    setmetatable(env, {__index = _G})

    -- Load and execute the framework specific module
    local fn, err = load(fileContent, ('@@%s/%s'):format(resourceName, filePath), 't', env)
    if fn then
        local success, result = pcall(fn)
        if success then
            if Config.DebugScript then print(('^2[INFO]^7 Successfully loaded the framework client module: %s'):format(frameworkType)) end
            -- Merge the result with CRUX.Framework
            if type(result) == 'table' then
                for k, v in pairs(result) do
                    CRUX.Framework[k] = v
                end
            end
        else
            if Config.DebugScript then print(('^1[ERROR]^7 Error executing the framework client module: %s - %s'):format(frameworkType, result)) end
        end
    else
        if Config.DebugScript then print(('^1[ERROR]^7 Failed to load the framework client module: %s - %s'):format(frameworkType, err)) end
    end
else
    if Config.DebugScript then print(('^1[ERROR]^7 Framework client module file not found: %s'):format(filePath)) end
end

return CRUX.Framework