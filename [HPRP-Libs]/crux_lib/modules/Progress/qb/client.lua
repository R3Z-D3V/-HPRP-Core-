
if not QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

function CRUX.Progress(Progress)
    local firstProp = nil
    local secondProp = nil
    if Progress.prop then
        if Progress.prop.model then
            firstProp = {
                model = Progress.prop.model,
                bone = Progress.prop.bone,
                coords = Progress.prop.pos,
                rotation = Progress.prop.rot,
            }
        else
            firsProp = {
                model = Progress.prop[1].model,
                bone = Progress.prop[1].bone,
                coords = Progress.prop[1].pos,
                rotation = Progress.prop[1].rot,
            }
            if Progress.prop[2] ~= nil then
                secondProp = {
                    model = Progress.prop[2]?.model,
                    bone = Progress.prop[2]?.bone,
                    coords = Progress.prop[2]?.pos,
                    rotation = Progress.prop[2]?.rot,
                }
            end
        end

    end
    local p = promise:new()
    QBCore.Functions.Progressbar(Progress.id, Progress.label, Progress.duration*1000, Progress.useWhileDead, Progress.canCancel, {
        disableMovement = Progress?.disable?.move,
        disableCarMovement = Progress?.disable?.car,
        disableMouse = Progress?.disable?.mouse,
        disableCombat = Progress?.disable?.combat,
    }, {
        animDict = Progress.animation?.animDict,
        anim = Progress.animation?.anim,
        flags = Progress.animation?.flag,
        task = Progress.animation?.scenario,
    }, firstProp, secondProp, function()
        p:resolve(true)
    end, function()
        p:resolve(false)
    end)
    return Citizen.Await(p)
end

return CRUX.Progress