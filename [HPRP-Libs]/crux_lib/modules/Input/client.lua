CRUX.Input = {}
local resourceName = 'crux_lib'

-- Get input type from config with auto-detect-detection fallback
local inputType = 'auto-detect'  -- Default to auto-detect detection

-- Try to get config
if CRUX and type(CRUX.Config) == "table" and CRUX.Config.Input then
    inputType = CRUX.Config.Input
elseif Config and Config.Input then
    inputType = Config.Input
end

if not Resource then
    local resourceFile = LoadResourceFile('crux_lib', 'ResourceName.lua')
    if resourceFile then
        local fn = load(resourceFile, '@crux_lib/ResourceName.lua', 't', _G)
        if fn then fn() end
    end
end

-- Input types and their resource names to check
local inputTypes = Resource and Resource.Input

-- auto-detect-detect input system
local function DetectInputSystem()
    if inputType ~= 'auto-detect' then
        -- Check if specified input type is available
        local resourceToCheck = inputTypes[inputType]
        if resourceToCheck and GetResourceState(resourceToCheck) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 Using specified input system: %s"):format(inputType)) end
            return inputType
        else
            if Config.DebugScript then print(("^3[WARNING]^7 Specified input system '%s' not found or not started. Falling back to auto-detect-detection."):format(inputType)) end
        end
    end

    -- auto-detect-detection logic
    if Config.DebugScript then print("^5[INFO]^7 auto-detect-detecting input system...") end
    for type, resource in pairs(inputTypes) do
        if GetResourceState(resource) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 auto-detect-detected input system: %s"):format(type)) end
            return type
        end
    end

    -- Default fallback
    if Config.DebugScript then print("^3[WARNING]^7 No input system detected, falling back to ox_lib input") end
    return 'ox'
end

-- Detect and set input type
inputType = DetectInputSystem()

-- Set current active input type
if type(CRUX.CurrentActive) ~= "table" then
    CRUX.CurrentActive = {}
end
CRUX.CurrentActive.Input = inputType

local filePath = ('modules/Input/%s/client.lua'):format(inputType)
local fileContent = LoadResourceFile(resourceName, filePath)

if fileContent then
    -- Create a custom environment for the module
    local env = {
        CRUX = CRUX,
        Config = Config,
        QBCore = QBCore, -- Make sure framework is available
        ESX = ESX,       -- Make sure framework is available
        _G = _G,
        lib = lib,       -- For ox_lib
    }
    setmetatable(env, {__index = _G})

    -- Load and execute the input type specific module
    local fn, err = load(fileContent, ('@@%s/%s'):format(resourceName, filePath), 't', env)
    if fn then
        local success, result = pcall(fn)
        if success then
            if Config.DebugScript then print(('^2[INFO]^7 Successfully loaded the input module: %s'):format(inputType)) end
            -- If the loaded module returns a function, use it directly as CRUX.Input
            if type(result) == 'function' then
                CRUX.Input = result
            -- If it returns a table, merge with CRUX.Input
            elseif type(result) == 'table' then
                for k, v in pairs(result) do
                    CRUX.Input[k] = v
                end
            end
        else
            if Config.DebugScript then print(('^1[ERROR]^7 Error executing the input module: %s - %s'):format(inputType, result)) end
        end
    else
        if Config.DebugScript then print(('^1[ERROR]^7 Failed to load the input module: %s - %s'):format(inputType, err)) end
    end
else
    if Config.DebugScript then print(('^1[ERROR]^7 Input module file not found: %s'):format(filePath)) end
end

-- Ensure CRUX.Input is a table that can be called like a function
if type(CRUX.Input) ~= 'table' then
    local originalFunc = CRUX.Input or function() end
    CRUX.Input = {}
    setmetatable(CRUX.Input, {
        __call = function(_, ...)
            return originalFunc(...)
        end
    })
elseif type(CRUX.Input) == 'table' and not getmetatable(CRUX.Input) then
    local originalInput = CRUX.Input.Input or function() end
    setmetatable(CRUX.Input, {
        __call = function(_, ...)
            return originalInput(...)
        end
    })
end

-- Add function to get current active input type
CRUX.Input.GetCurrentActiveInput = function()
    return CRUX.CurrentActive and CRUX.CurrentActive.Input or nil
end

return CRUX.Input
