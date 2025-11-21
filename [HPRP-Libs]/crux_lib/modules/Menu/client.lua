CRUX.Menu = {}
local resourceName = 'crux_lib'

-- Get menu type from config with auto-detect-detection fallback
local menuType = Config and Config.Menu or 'auto-detect'  -- Default to auto-detect detection

if not Resource then
    local resourceFile = LoadResourceFile('crux_lib', 'resource/resource.lua')
    if resourceFile then
        local fn = load(resourceFile, '@crux_lib/resource/resource.lua', 't', _G)
        if fn then fn() end
    end
end

-- Menu types and their resource names to check
local menuTypes = Resource and Resource.Menu

-- auto-detect-detect menu system
local function DetectMenuSystem()
    if menuType ~= 'auto-detect' then
        -- Check if specified menu type is available
        local resourceToCheck = menuTypes[menuType]
        if resourceToCheck and GetResourceState(resourceToCheck) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 Using specified menu system: %s"):format(menuType)) end
            return menuType
        else
            if Config.DebugScript then print(("^3[WARNING]^7 Specified menu system '%s' not found or not started. Falling back to auto-detect-detection."):format(menuType)) end
        end
    end

    -- auto-detect-detection logic
    if Config.DebugScript then print("^5[INFO]^7 auto-detect-detecting menu system...") end
    for type, resource in pairs(menuTypes) do
        if GetResourceState(resource) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 auto-detect-detected menu system: %s"):format(type)) end
            return type
        end
    end

    -- Default fallback
    if Config.DebugScript then print("^3[WARNING]^7 No menu system detected, falling back to ox_lib menu") end
    return 'ox'
end

-- Detect and set menu type
menuType = DetectMenuSystem()

-- Set current active menu type
if type(CRUX.CurrentActive) ~= "table" then
    CRUX.CurrentActive = {}
end
CRUX.CurrentActive.Menu = menuType

local filePath = ('modules/Menu/%s/client.lua'):format(menuType)
local fileContent = LoadResourceFile(resourceName, filePath)

if fileContent then
    -- Create a custom environment for the module
    local env = {
        CRUX = CRUX,
        Config = Config,
        QBCore = QBCore, -- Make sure framework is available
        ESX = ESX,       -- Make sure framework is available
        _G = _G,
    }
    setmetatable(env, {__index = _G})

    -- Load and execute the menu type specific module
    local fn, err = load(fileContent, ('@@%s/%s'):format(resourceName, filePath), 't', env)
    if fn then
        local success, result = pcall(fn)
        if success then
            if Config.DebugScript then print(('^2[INFO]^7 Successfully loaded the menu module: %s'):format(menuType)) end
            -- If the loaded module returns a function, use it directly as CRUX.Menu
            if type(result) == 'function' then
                CRUX.Menu = result
            -- If it returns a table, merge with CRUX.Menu
            elseif type(result) == 'table' then
                for k, v in pairs(result) do
                    CRUX.Menu[k] = v
                end
            end
        else
            if Config.DebugScript then print(('^1[ERROR]^7 Error executing the menu module: %s - %s'):format(menuType, result)) end
        end
    else
        if Config.DebugScript then print(('^1[ERROR]^7 Failed to load the menu module: %s - %s'):format(menuType, err)) end
    end
else
    if Config.DebugScript then print(('^1[ERROR]^7 Menu module file not found: %s'):format(filePath)) end
end

-- Ensure CRUX.Menu is a table that can be called like a function
if type(CRUX.Menu) ~= 'table' then
    local originalFunc = CRUX.Menu or function() end
    CRUX.Menu = {}
    setmetatable(CRUX.Menu, {
        __call = function(_, ...)
            return originalFunc(...)
        end
    })
elseif type(CRUX.Menu) == 'table' and not getmetatable(CRUX.Menu) then
    local originalMenu = CRUX.Menu.Menu or function() end
    setmetatable(CRUX.Menu, {
        __call = function(_, ...)
            return originalMenu(...)
        end
    })
end

-- Add function to get current active menu type
CRUX.Menu.GetCurrentActiveMenu = function()
    return CRUX.CurrentActive and CRUX.CurrentActive.Menu or nil
end

return CRUX.Menu
