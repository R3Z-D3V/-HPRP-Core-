CRUX.Inventory = {}
local resourceName = 'crux_lib'

-- Get inventory type from config
local inventoryType = Config and Config.Inventory or 'auto-detect'  -- Default to auto-detect detection if not set

-- CRUX.Debug(inventoryType)

if not Resource then
    local resourceFile = LoadResourceFile('crux_lib', 'ResourceName.lua')
    if resourceFile then
        local fn = load(resourceFile, '@crux_lib/ResourceName.lua', 't', _G)
        if fn then fn() end
    end
end

-- Inventory types and their resource names to check
local inventoryTypes = Resource and Resource.Inventory

-- auto-detect-detect inventory system
local function DetectInventorySystem()
    if inventoryType ~= 'auto-detect' then

            if Config.DebugScript then print(("^2[INFO]^7 Using specified inventory system: %s"):format(inventoryType)) end
            return inventoryType
    end

    -- auto-detect-detection logic
    if Config.DebugScript then print("^5[INFO]^7 auto-detect-detecting inventory system...") end
    for type, resource in pairs(inventoryTypes) do
        if GetResourceState(resource) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 auto-detect-detected inventory system: %s"):format(type)) end
            return type
        end
    end

    -- Default to framework-based
    local framework = 'ox'
    if Config.DebugScript then print(("^3[WARNING]^7 No inventory system detected, falling back to framework default: %s"):format(framework)) end
    return framework
end

-- Detect and set inventory type
inventoryType = DetectInventorySystem()

local filePath = ('modules/Inventory/%s/client.lua'):format(inventoryType)
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

    -- Load and execute the inventory type specific module
    local fn, err = load(fileContent, ('@@%s/%s'):format(resourceName, filePath), 't', env)
    if fn then
        local success, result = pcall(fn)
        if success then
            if Config.DebugScript then print(('^2[INFO]^7 Successfully loaded the inventory module: %s'):format(inventoryType)) end
            -- Merge the result with CRUX.Inventory
            if type(result) == 'table' then
                for k, v in pairs(result) do
                    CRUX.Inventory[k] = v
                end
            end
        else
            if Config.DebugScript then print(('^1[ERROR]^7 Error executing the inventory module: %s - %s'):format(inventoryType, result)) end
        end
    else
        if Config.DebugScript then print(('^1[ERROR]^7 Failed to load the inventory module: %s - %s'):format(inventoryType, err)) end
    end
else
    if Config.DebugScript then print(("^1[ERROR]^7 Inventory module file not found: %s - Make sure the proper module exists for %s"):format(filePath, inventoryType)) end
end

return CRUX.Inventory
