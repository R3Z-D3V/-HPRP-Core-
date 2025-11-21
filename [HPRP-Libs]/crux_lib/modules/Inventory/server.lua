CRUX.Inventory = {}
local resourceName = 'crux_lib'

-- Get the name of the calling resource
local callingResource = GetInvokingResource() or 'crux_lib'

-- Initialize local config variable to prevent nil errors
local localConfig = {}
if Config then localConfig = Config end

-- Try to get config from the external configs first, fallback to local Config
local externalConfig = _G.GetExternalConfig and _G.GetExternalConfig(callingResource)
local InventoryType

if externalConfig and externalConfig.Inventory then
    InventoryType = externalConfig.Inventory
    -- Update localConfig with the external config so localConfig.Inventory has the right value
    localConfig = externalConfig
else
    -- Safely access Config or use default
    InventoryType = localConfig.Inventory or 'auto-detect'
end

if not Resource then
    local resourceFile = LoadResourceFile('crux_lib', 'ResourceName.lua')
    if resourceFile then
        local fn = load(resourceFile, '@crux_lib/ResourceName.lua', 't', _G)
        if fn then fn() end
    end
end

-- Inventory types and their resource names to check
local InventoryTypes = Resource and Resource.Inventory

-- auto-detect Inventory system
local function DetectInventorySystem()
    if InventoryType ~= 'auto-detect' then

            print(("^2[INFO]^7 Using specified Inventory system: %s"):format(InventoryType))
            return InventoryType
    end
    
    print("^5[INFO]^7 auto-detecting Inventory system...")
    -- auto-detect logic
    for type, resource in pairs(InventoryTypes) do
        if GetResourceState(resource) == 'started' then
            print(("^2[INFO]^7 auto-detected Inventory system: %s"):format(type))
            return type
        end
    end

    -- Default to framework-based
    local framework = 'qb'
    print(("^3[WARNING]^7 No Inventory system detected, falling back to default: %s"):format(framework))
    return framework
end

-- Detect and set Inventory type
InventoryType = DetectInventorySystem()

local filePath = ('modules/Inventory/%s/server.lua'):format(InventoryType)
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

    -- Load and execute the Inventory type specific module
    local fn, err = load(fileContent, ('@@%s/%s'):format(resourceName, filePath), 't', env)
    if fn then
        local success, result = pcall(fn)
        if success then
            print(('^2[INFO]^7 Successfully loaded the Inventory module: %s'):format(InventoryType))
            -- Merge the result with CRUX.Inventory
            if type(result) == 'table' then
                for k, v in pairs(result) do
                    CRUX.Inventory[k] = v
                end
            end
        else
            print(('^1[ERROR]^7 Error executing the Inventory module: %s - %s'):format(InventoryType, result))
        end
    else
        print(('^1[ERROR]^7 Failed to load the Inventory module: %s - %s'):format(InventoryType, err))
    end
else
    print(("^1[ERROR]^7 Inventory module file not found: %s - Make sure the proper module exists for %s"):format(filePath, InventoryType))
end

return CRUX.Inventory
