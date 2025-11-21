
function CRUX.Progress(Progress)
    local data = {
        label = Progress.label,
        duration = Progress.duration * 1000,
        useWhileDead = Progress.useWhileDead,
        canCancel = Progress.canCancel,
        allowFalling = false, -- This is a default value, adjust as needed
        ---@diagnostic disable-next-line: assign-type-mismatch
        disable = Progress.disable,
        anim = {
            dict = Progress.animation?.animDict,
            clip = Progress.animation?.anim,
            flag = Progress.animation?.flag,
            scenario = Progress.animation?.scenario
        },
        prop = Progress.prop

    }

    return lib.progressCircle(data)
end

return CRUX.Progress