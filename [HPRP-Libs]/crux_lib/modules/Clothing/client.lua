CRUX.Clothing = {}
local resourceName = 'crux_lib'

-- Get clothing type from config with auto-detect-detection fallback
local clothingType = Config and Config.Clothing or 'auto-detect'

if not Resource then
    local resourceFile = LoadResourceFile('crux_lib', 'ResourceName.lua')
    if resourceFile then
        local fn = load(resourceFile, '@crux_lib/ResourceName.lua', 't', _G)
        if fn then fn() end
    end
end

-- Clothing types and their resource names to check
local clothingTypes = Resource and Resource.Clothing

-- auto-detect-detect clothing system
local function DetectClothingSystem()
    if clothingType ~= 'auto-detect' then
        -- Check if specified clothing type is available
        local resourceToCheck = clothingTypes[clothingType]
        if resourceToCheck and GetResourceState(resourceToCheck) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 Using specified clothing system: %s"):format(clothingType)) end
            return clothingType
        else
            if Config.DebugScript then print(("^3[WARNING]^7 Specified clothing system '%s' not found or not started. Falling back to auto-detect-detection."):format(clothingType)) end
        end
    end

    -- auto-detect-detection logic
    if Config.DebugScript then print("^5[INFO]^7 auto-detect-detecting clothing system...") end
    for type, resource in pairs(clothingTypes) do
        if GetResourceState(resource) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 auto-detect-detected clothing system: %s"):format(type)) end
            return type
        end
    end

    -- Default fallback
    if Config.DebugScript then print("^3[WARNING]^7 No clothing system detected, falling back to qb clothing") end
    return 'qb'
end

-- Detect and set clothing type
clothingType = DetectClothingSystem()

local filePath = ('modules/Clothing/%s/client.lua'):format(clothingType)
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

    -- Load and execute the clothing type specific module
    local fn, err = load(fileContent, ('@@%s/%s'):format(resourceName, filePath), 't', env)
    if fn then
        local success, result = pcall(fn)
        if success then
            if Config.DebugScript then print(('^2[INFO]^7 Successfully loaded the clothing module: %s'):format(clothingType)) end
            -- If the loaded module returns a function, use it directly
            if type(result) == 'function' then
                CRUX.Clothing.OpenJobClothing = result
            -- If it returns a table, merge with CRUX.Clothing
            elseif type(result) == 'table' then
                for k, v in pairs(result) do
                    CRUX.Clothing[k] = v
                end
            end
        else
            if Config.DebugScript then print(('^1[ERROR]^7 Error executing the clothing module: %s - %s'):format(clothingType, result)) end
        end
    else
        if Config.DebugScript then print(('^1[ERROR]^7 Failed to load the clothing module: %s - %s'):format(clothingType, err)) end
    end
else
    if Config.DebugScript then print(('^1[ERROR]^7 Clothing module file not found: %s'):format(filePath)) end
end

-- Create a shorthand function
if type(CRUX.Clothing) == 'table' and not CRUX.Clothing.__call then
    local originalFunc = CRUX.Clothing.OpenJobClothing or function() end
    setmetatable(CRUX.Clothing, {
        __call = function(_, ...)
            return originalFunc(...)
        end
    })
end

return CRUX.Clothing
