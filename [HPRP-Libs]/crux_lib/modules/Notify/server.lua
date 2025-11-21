CRUX.Notify = {}
local resourceName = 'crux_lib'

-- Get the name of the calling resource
local callingResource = GetInvokingResource() or 'crux_lib'

-- Initialize local config variable to prevent nil errors
local localConfig = {}
if Config then localConfig = Config end

-- Try to get config from the external configs first, fallback to local Config
local externalConfig = _G.GetExternalConfig and _G.GetExternalConfig(callingResource)
local NotifyType

if externalConfig and externalConfig.Notify then
    NotifyType = externalConfig.Notify
    -- Update localConfig with the external config so localConfig.Notify has the right value
    localConfig = externalConfig
else
    -- Safely access Config or use default
    NotifyType = localConfig.Notify or 'auto-detect'
end

if not Resource then
    local resourceFile = LoadResourceFile('crux_lib', 'ResourceName.lua')
    if resourceFile then
        local fn = load(resourceFile, '@crux_lib/ResourceName.lua', 't', _G)
        if fn then fn() end
    end
end

-- Notify types and their resource names to check
local NotifyTypes = Resource and Resource.Notify

-- auto-detect Notify system
local function DetectNotifySystem()
    if NotifyType ~= 'auto-detect' then
        -- Check if specified Notify type is available
        local resourceToCheck = NotifyTypes[NotifyType]
        if resourceToCheck and GetResourceState(resourceToCheck) == 'started' then
            print(("^2[INFO]^7 Using specified notify system: %s"):format(NotifyType))
            return NotifyType
        else
            print(("^3[WARNING]^7 Specified notify system '%s' not found or not started. Falling back to auto-detect."):format(NotifyType))
        end
    end
    
    print("^5[INFO]^7 auto-detecting notify system...")
    -- auto-detect logic
    for type, resource in pairs(NotifyTypes) do
        if GetResourceState(resource) == 'started' then
            print(("^2[INFO]^7 auto-detected notify system: %s"):format(type))
            return type
        end
    end

    -- Default to framework-based
    local framework = 'crux'
    print(("^3[WARNING]^7 No notify system detected, falling back to default: %s"):format(framework))
    return framework
end

-- Detect and set Notify type
NotifyType = DetectNotifySystem()

local filePath = ('modules/Notify/%s/server.lua'):format(NotifyType)
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

    -- Load and execute the Notify type specific module
    local fn, err = load(fileContent, ('@@%s/%s'):format(resourceName, filePath), 't', env)
    if fn then
        local success, result = pcall(fn)
        if success then
            print(('^2[INFO]^7 Successfully loaded the notify module: %s'):format(NotifyType))
            -- Merge the result with CRUX.Notify
            if type(result) == 'table' then
                for k, v in pairs(result) do
                    CRUX.Notify[k] = v
                end
            end
        else
            print(('^1[ERROR]^7 Error executing the notify module: %s - %s'):format(NotifyType, result))
        end
    else
        print(('^1[ERROR]^7 Failed to load the notify module: %s - %s'):format(NotifyType, err))
    end
else
    print(("^1[ERROR]^7 Notify module file not found: %s - Make sure the proper module exists for %s"):format(filePath, NotifyType))
end

return CRUX.Notify
