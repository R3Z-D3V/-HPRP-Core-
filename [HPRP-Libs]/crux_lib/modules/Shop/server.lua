CRUX.Shop = {}
local resourceName = 'crux_lib'

-- Get the name of the calling resource
local callingResource = GetInvokingResource() or 'crux_lib'

-- Initialize local config variable to prevent nil errors
local localConfig = {}
if Config then localConfig = Config end

-- Try to get config from the external configs first, fallback to local Config
local externalConfig = _G.GetExternalConfig and _G.GetExternalConfig(callingResource)
local ShopType

if externalConfig and externalConfig.Shop then
    ShopType = externalConfig.Shop
    -- Update localConfig with the external config so localConfig.Shop has the right value
    localConfig = externalConfig
else
    -- Safely access Config or use default
    ShopType = localConfig.Shop or 'auto-detect'
end

if not Resource then
    local resourceFile = LoadResourceFile('crux_lib', 'ResourceName.lua')
    if resourceFile then
        local fn = load(resourceFile, '@crux_lib/ResourceName.lua', 't', _G)
        if fn then fn() end
    end
end

-- Shop types and their resource names to check
local ShopTypes = Resource and Resource.Shop

-- auto-detect Shop system
local function DetectShopSystem()
    if ShopType == 'default' then
        print("^2[INFO]^7 Using default shop system.")
        return 'default'
    end


    if ShopType ~= 'auto-detect' then
     
            if Config.DebugScript then print(("^2[INFO]^7 Using specified Shop system: %s"):format(ShopType)) end
            return ShopType
    end
    
    print("^5[INFO]^7 auto-detecting shop system...")
    -- auto-detect logic
    for type, resource in pairs(ShopTypes) do
        if GetResourceState(resource) == 'started' then
            print(("^2[INFO]^7 auto-detected shop system: %s"):format(type))
            return type
        end
    end

    -- Default to fallback
    local fallback = 'default'
    print(("^3[WARNING]^7 No shop system detected, falling back to default: %s"):format(fallback))
    return fallback
end

-- Detect and set Shop type
ShopType = DetectShopSystem()

local filePath = ('modules/Shop/%s/server.lua'):format(ShopType)
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
            print(('^2[INFO]^7 Successfully loaded the shop module: %s'):format(ShopType))
            -- Merge the result with CRUX.Shop
            if type(result) == 'table' then
                for k, v in pairs(result) do
                    CRUX.Shop[k] = v
                end
            end
        else
            print(('^1[ERROR]^7 Error executing the shop module: %s - %s'):format(ShopType, result))
        end
    else
        print(('^1[ERROR]^7 Failed to load the shop module: %s - %s'):format(ShopType, err))
    end
else
    print(("^1[ERROR]^7 Shop module file not found: %s - Make sure the proper module exists for %s"):format(filePath, ShopType))
end

return CRUX.Shop