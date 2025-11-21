CRUX.Billing = {}
local resourceName = 'crux_lib'

-- Get billing type from config with auto-detect-detection fallback
local billingType = Config and Config.Billing or 'auto-detect'  -- Default to auto-detect detection

if not Resource then
    local resourceFile = LoadResourceFile('crux_lib', 'ResourceName.lua')
    if resourceFile then
        local fn = load(resourceFile, '@crux_lib/ResourceName.lua', 't', _G)
        if fn then fn() end
    end
end

-- Billing types and their resource names to check
local billingTypes = Resource and Resource.Billing

-- auto-detect-detect billing system
local function DetectBillingSystem()
    if billingType == 'default' then
        if Config.DebugScript then print("^2[INFO]^7 Using default billing system.") end
        return 'default'
    end

    if billingType ~= 'auto-detect' then
        -- Check if specified billing type is available
        local resourceToCheck = billingTypes[billingType]
        if resourceToCheck and GetResourceState(resourceToCheck) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 Using specified billing system: %s"):format(billingType)) end
            return billingType
        else
            if Config.DebugScript then print(("^3[WARNING]^7 Specified billing system '%s' not found or not started. Falling back to auto-detect-detection."):format(billingType)) end
        end
    end

    if Config.DebugScript then print("^5[INFO]^7 auto-detect-detecting billing system...") end
    -- auto-detect-detection logic
    for type, resource in pairs(billingTypes) do
        if GetResourceState(resource) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 auto-detect-detected billing system: %s"):format(type)) end
            return type
        end
    end

    if Config.DebugScript then print("^3[WARNING]^7 No billing system detected, falling back to default billing") end
    -- Default fallback to built-in
    return 'default'
end

-- Detect and set billing type
billingType = DetectBillingSystem()

local folder = (billingType and tostring(billingType):lower() == 'default') and 'default' or tostring(billingType):lower()
local filePath = ('modules/Billing/%s/client.lua'):format(folder)
local fileContent = LoadResourceFile(resourceName, filePath)

if fileContent then
    -- Create a custom environment for the module
    local env = {
        CRUX = CRUX,
        Config = Config,
        QBCore = QBCore, -- Make sure framework is available
        ESX = ESX,       -- Make sure framework is available
        QBX = QBX,       -- Make sure QBX is available if used
        Lib = {
            Name = 'crux_lib',
            framework = CRUX.Framework,
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

    -- Load and execute the Billing type specific module
    local fn, err = load(fileContent, ('@@%s/%s'):format(resourceName, filePath), 't', env)
    if fn then
        local success, result = pcall(fn)
        if success then
            if Config.DebugScript then print(('^2[INFO]^7 Successfully loaded the Billing module: %s'):format(billingType)) end
            -- Merge the result with CRUX.Billing
            if type(result) == 'table' then
                for k, v in pairs(result) do
                    CRUX.Billing[k] = v
                end
            end
        else
            if Config.DebugScript then print(('^1[ERROR]^7 Error executing the Billing module: %s - %s'):format(billingType, result)) end
        end
    else
        if Config.DebugScript then print(('^1[ERROR]^7 Failed to load the Billing module: %s - %s'):format(billingType, err)) end
    end
else
    if Config.DebugScript then print(('^1[ERROR]^7 Billing module file not found: %s'):format(filePath)) end
end

return CRUX.Billing

