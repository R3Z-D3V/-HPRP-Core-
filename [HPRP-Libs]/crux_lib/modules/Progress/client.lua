CRUX.Progress = {}
local resourceName = 'crux_lib'

-- Get progress type from config with auto-detect-detection fallback
local progressType = Config and Config.Progress or 'auto-detect'  

if not Resource then
    local resourceFile = LoadResourceFile('crux_lib', 'ResourceName.lua')
    if resourceFile then
        local fn = load(resourceFile, '@crux_lib/ResourceName.lua', 't', _G)
        if fn then fn() end
    end
end


-- Progress types and their resource names to check
local progressTypes = Resource and Resource.Progress

-- Function to handle file path conversion for progress types with special characters
local function getProgressFilePath(type)
    if type == 'ox_bar' then
        return 'modules/Progress/ox-bar/client.lua'
    elseif type == 'ox_circle' then
        return 'modules/Progress/ox-circle/client.lua'
    else
        return ('modules/Progress/%s/client.lua'):format(type)
    end
end

-- auto-detect-detect progress system
local function DetectProgressSystem()
    if progressType ~= 'auto-detect' then
        -- Check if specified progress type is available
        local resourceToCheck = progressTypes[progressType]
        if resourceToCheck and GetResourceState(resourceToCheck) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 Using specified progress system: %s"):format(progressType)) end
            return progressType
        else
            if Config.DebugScript then print(("^3[WARNING]^7 Specified progress system '%s' not found or not started. Falling back to auto-detect-detection."):format(progressType)) end
        end
    end

    -- auto-detect-detection logic
    if Config.DebugScript then print("^5[INFO]^7 auto-detect-detecting progress system...") end
    for type, resource in pairs(progressTypes) do
        if GetResourceState(resource) == 'started' then
            if Config.DebugScript then print(("^2[INFO]^7 auto-detect-detected progress system: %s"):format(type)) end
            return type
        end
    end

    -- Default fallback
    if Config.DebugScript then print("^3[WARNING]^7 No progress system detected, falling back to ox_lib progress") end
    return 'ox_bar'
end

-- Detect and set progress type
progressType = DetectProgressSystem()

local filePath = getProgressFilePath(progressType)
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

    -- Load and execute the progress type specific module
    local fn, err = load(fileContent, ('@@%s/%s'):format(resourceName, filePath), 't', env)
    if fn then
        local success, result = pcall(fn)
        if success then
            if Config.DebugScript then print(('^2[INFO]^7 Successfully loaded the progress module: %s'):format(progressType)) end
            -- If the loaded module returns a function, use it directly as CRUX.Progress
            if type(result) == 'function' then
                CRUX.Progress = result
            -- If it returns a table, merge with CRUX.Progress
            elseif type(result) == 'table' then
                for k, v in pairs(result) do
                    CRUX.Progress[k] = v
                end
            end
        else
            if Config.DebugScript then print(('^1[ERROR]^7 Error executing the progress module: %s - %s'):format(progressType, result)) end
        end
    else
        if Config.DebugScript then print(('^1[ERROR]^7 Failed to load the progress module: %s - %s'):format(progressType, err)) end
    end
else
    if Config.DebugScript then print(('^1[ERROR]^7 Progress module file not found: %s'):format(filePath)) end
end

return CRUX.Progress
