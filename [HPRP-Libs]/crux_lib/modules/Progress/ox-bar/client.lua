function CRUX.Progress(Progress)
    local data = {
        label = Progress.label,
        duration = Progress.duration * 1000,
        useWhileDead = Progress.useWhileDead,
        canCancel = Progress.canCancel,
        allowFalling = false, -- This is a default value, adjust as needed
        disable = Progress.disable,
        anim = {
            dict = Progress.animation and Progress.animation.animDict,
            clip = Progress.animation and Progress.animation.anim,
            flag = Progress.animation and Progress.animation.flag,
            scenario = Progress.animation and Progress.animation.scenario
        },
        prop = Progress.prop
    }

    return lib.progressBar(data)
end

return CRUX.Progress

