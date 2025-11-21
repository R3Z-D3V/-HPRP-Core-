CRUX.Notify = {}
local resourceName = 'crux_lib'

-- Get notification type from config
local notifyType = Config and Config.Notify or 'auto-detect'  -- Default to auto-detect detection if not set

-- Use NotifyResources from Resource.lua
if not Resource then
    local resourceFile = LoadResourceFile('crux_lib', 'ResourceName.lua')
    if resourceFile then
        local fn = load(resourceFile, '@crux_lib/ResourceName.lua', 't', _G)
        if fn then fn() end
    end
end

local notifyTypes = Resource and Resource.Notify


-- auto-detect-detect notification system
local function DetectNotifySystem()
    if notifyType ~= 'auto-detect' then
        -- Check if specified notify type is available
        local resourceToCheck = notifyTypes[notifyType]
        if resourceToCheck and GetResourceState(resourceToCheck) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 Using specified notification system: %s"):format(notifyType)) end
            return notifyType
        else
            if Config.DebugScript then print(("^3[WARNING]^7 Specified notification system '%s' not found or not started. Falling back to auto-detect-detection."):format(notifyType)) end
        end
    end

    -- auto-detect-detection logic
    if Config.DebugScript then print("^5[INFO]^7 auto-detect-detecting notification system...") end
    for type, resource in pairs(notifyTypes) do
        if GetResourceState(resource) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 auto-detect-detected notification system: %s"):format(type)) end
            return type
        end
    end

    -- Use framework as fallback
    local framework = Framework or 'qb'
    if Config.DebugScript then print(("^3[WARNING]^7 No notification system detected, falling back to framework: %s"):format(framework)) end
    return framework
end

-- Detect and set notify type
notifyType = DetectNotifySystem()

-- Send Config value to server
TriggerServerEvent('crux_lib:notify:sendConfig', Config.Notify)


local filePath = ('modules/Notify/%s/client.lua'):format(notifyType)
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

    -- Load and execute the notification type specific module
    local fn, err = load(fileContent, ('@@%s/%s'):format(resourceName, filePath), 't', env)
    if fn then
        local success, result = pcall(fn)
        if success then
            if Config.DebugScript then print(('^2[INFO]^7 Successfully loaded the notification module: %s'):format(notifyType)) end
            -- If the loaded module returns a function, use it directly as CRUX.Notify
            if type(result) == 'function' then
                CRUX.Notify = result
            -- If it returns a table, merge with CRUX.Notify
            elseif type(result) == 'table' then
                for k, v in pairs(result) do
                    CRUX.Notify[k] = v
                end
            end
        else
            if Config.DebugScript then print(('^1[ERROR]^7 Error executing the notification module: %s - %s'):format(notifyType, result)) end
        end
    else
        if Config.DebugScript then print(('^1[ERROR]^7 Failed to load the notification module: %s - %s'):format(notifyType, err)) end
    end
else
    if Config.DebugScript then print(('^1[ERROR]^7 Notification module file not found: %s'):format(filePath)) end
end

return CRUX.Notify
