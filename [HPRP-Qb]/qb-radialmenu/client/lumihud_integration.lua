-- qb-radialmenu/client/lumihud_integration.lua
local defaultColor = "#c92a2a"

local function formatHex(color)
    if type(color) == "table" and color.background then
        return color.background
    end
    if type(color) == "string" then
        return color
    end
    return defaultColor
end

local function sendColorToNUI(color)
    local hex = formatHex(color)
    SendNUIMessage({
        action = "updateColor",
        color  = hex
    })
end

exports('updateRadialColor', function(color)
    sendColorToNUI(color)
    return true
end)

AddEventHandler("tgiann-lumihud:setLumiHudColor", function(color)
    sendColorToNUI(color)
end)

AddEventHandler("setLumiHudColor", function(color)
    sendColorToNUI(color)
end)

CreateThread(function()
    Wait(1500)
    local ok, res = pcall(function()
        if exports['tgiann-lumihud'] and exports['tgiann-lumihud'].getCurrentColor then
            return exports['tgiann-lumihud']:getCurrentColor()
        end
        return nil
    end)
    if ok and res then
        sendColorToNUI(res)
    else
        sendColorToNUI(defaultColor)
    end
end)
