CRUX.Management = {}
local resourceName = 'crux_lib'

-- Get management type from config
local managementType = Config and Config.Management or 'auto-detect'  -- Default to auto-detect detection if not set

if not Resource then
    local resourceFile = LoadResourceFile('crux_lib', 'ResourceName.lua')
    if resourceFile then
        local fn = load(resourceFile, '@crux_lib/ResourceName.lua', 't', _G)
        if fn then fn() end
    end
end

-- Management types and their resource names to check
local managementTypes = Resource and Resource.Management

-- auto-detect-detect management system
local function DetectManagementSystem()
    if managementType ~= 'auto-detect' then
        -- Check if specified management type is available
        local resourceToCheck = managementTypes[managementType]
        if resourceToCheck and GetResourceState(resourceToCheck) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 Using specified management system: %s"):format(managementType)) end
            return managementType
        else
            if Config.DebugScript then print(("^3[WARNING]^7 Specified management system '%s' not found or not started. Falling back to auto-detect-detection."):format(managementType)) end
        end
    end

    -- auto-detect-detection logic
    if Config.DebugScript then print("^5[INFO]^7 auto-detect-detecting management system...") end
    for type, resource in pairs(managementTypes) do
        if GetResourceState(resource) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 auto-detect-detected management system: %s"):format(type)) end
            return type
        end
    end

    -- Default fallback
    if Config.DebugScript then print("^3[WARNING]^7 No management system detected, falling back to default: vms") end
    return 'vms'
end

-- Detect and set management type
managementType = DetectManagementSystem()

local filePath = ('modules/Management/%s/client.lua'):format(managementType)
local fileContent = LoadResourceFile(resourceName, filePath)

if fileContent then
    -- Create a custom environment for the module
        local env = {
        CRUX = CRUX,
        Config = Config,
        Lib = {
            Name = 'crux_lib',
            framework = CRUX.Framework,
            interface = {
                menu = CRUX.Menu,
                input = CRUX.Input,
                notify = CRUX.Notify
            }
        },
        QBCore = QBCore, -- Make sure framework is available
        ESX = ESX,       -- Make sure framework is available
        _G = _G,
    }
    setmetatable(env, {__index = _G})

    -- Load and execute the management type specific module
    local fn, err = load(fileContent, ('@@%s/%s'):format(resourceName, filePath), 't', env)
    if fn then
        local success, result = pcall(fn)
        if success then
            if Config.DebugScript then print(('^2[INFO]^7 Successfully loaded the management module: %s'):format(managementType)) end
            -- If the loaded module returns a function, use it directly
            if type(result) == 'function' then
                CRUX.Management.OpenManagement = result
            -- If it returns a table, merge with CRUX.Management
            elseif type(result) == 'table' then
                for k, v in pairs(result) do
                    CRUX.Management[k] = v
                end
            end
        else
            if Config.DebugScript then print(('^1[ERROR]^7 Error executing the management module: %s - %s'):format(managementType, result)) end
        end
    else
        if Config.DebugScript then print(('^1[ERROR]^7 Failed to load the management module: %s - %s'):format(managementType, err)) end
    end
else
    if Config.DebugScript then print(('^1[ERROR]^7 Management module file not found: %s'):format(filePath)) end
end

return CRUX.Management
