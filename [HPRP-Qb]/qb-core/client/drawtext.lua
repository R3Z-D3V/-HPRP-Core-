local function hideText()
    exports["tgiann-core"]:DrawTextClose(GetInvokingResource().."drawtex")
end

local function drawText(text, position)
    exports["tgiann-core"]:DrawTextOpen(GetInvokingResource().."drawtex", "E", text)
end

local function changeText(text, position)
    exports["tgiann-core"]:DrawTextOpen(GetInvokingResource().."drawtex", "E", text)
end

local function keyPressed()
    CreateThread(function() -- Not sure if a thread is needed but why not eh?
        SendNUIMessage({
            action = 'KEY_PRESSED',
        })
        Wait(500)
        hideText()
    end)
end

RegisterNetEvent('qb-core:client:DrawText', function(text, position)
    drawText(text, position)
end)

RegisterNetEvent('qb-core:client:ChangeText', function(text, position)
    changeText(text, position)
end)

RegisterNetEvent('qb-core:client:HideText', function()
    hideText()
end)

RegisterNetEvent('qb-core:client:KeyPressed', function()
    keyPressed()
end)

exports('DrawText', drawText)
exports('ChangeText', changeText)
exports('HideText', hideText)
exports('KeyPressed', keyPressed)
