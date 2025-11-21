CRUX.Shop = {}
local resourceName = 'crux_lib'

-- Get Shop type from config with auto-detect-detection fallback
local ShopType = Config and Config.Shop or 'auto-detect'  -- Default to auto-detect detection

if not Resource then
    local resourceFile = LoadResourceFile('crux_lib', 'ResourceName.lua')
    if resourceFile then
        local fn = load(resourceFile, '@crux_lib/ResourceName.lua', 't', _G)
        if fn then fn() end
    end
end

-- Shop types and their resource names to check
local ShopTypes = Resource and Resource.Shop

-- auto-detect-detect Shop system
local function DetectShopSystem()
    if ShopType == 'default' then
        if Config.DebugScript then print("^2[INFO]^7 Using default Shop system.") end
        return 'default'
    end

    if ShopType ~= 'auto-detect' then
     
            if Config.DebugScript then print(("^2[INFO]^7 Using specified Shop system: %s"):format(ShopType)) end
            return ShopType
    end

    -- auto-detect-detection logic
    if Config.DebugScript then print("^5[INFO]^7 auto-detect-detecting Shop system...") end
    for type, resource in pairs(ShopTypes) do
        if GetResourceState(resource) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 auto-detect-detected Shop system: %s"):format(type)) end
            return type
        end
    end

    -- Default fallback to built-in
    if Config.DebugScript then print("^3[WARNING]^7 No Shop system detected, falling back to default Shop") end
    return 'default'
end

-- Detect and set Shop type
ShopType = DetectShopSystem()

local folder = (ShopType and tostring(ShopType):lower() == 'default') and 'default' or tostring(ShopType):lower()
local filePath = ('modules/Shop/%s/client.lua'):format(folder)
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

    -- Load and execute the Shop type specific module
    local fn, err = load(fileContent, ('@@%s/%s'):format(resourceName, filePath), 't', env)
    if fn then
        local success, result = pcall(fn)
        if success then
            if Config.DebugScript then print(('^2[INFO]^7 Successfully loaded the Shop module: %s'):format(ShopType)) end
            -- Merge the result with CRUX.Shop
            if type(result) == 'table' then
                for k, v in pairs(result) do
                    CRUX.Shop[k] = v
                end
            end
        else
            if Config.DebugScript then print(('^1[ERROR]^7 Error executing the Shop module: %s - %s'):format(ShopType, result)) end
        end
    else
        if Config.DebugScript then print(('^1[ERROR]^7 Failed to load the Shop module: %s - %s'):format(ShopType, err)) end
    end
else
    if Config.DebugScript then print(('^1[ERROR]^7 Shop module file not found: %s'):format(filePath)) end
end

-- Create a shorthand function
if type(CRUX.Shop) == 'table' and not CRUX.Shop.__call then
    local originalFunc = CRUX.Shop.OpenShop or function() end
    setmetatable(CRUX.Shop, {
        __call = function(_, ...)
            return originalFunc(...)
        end
    })
end

return CRUX.Shop
