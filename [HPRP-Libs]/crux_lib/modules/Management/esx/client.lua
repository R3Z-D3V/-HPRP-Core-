local CRUX = {}

function CRUX.OpenManagement(jobName)
    local job = Lib.framework.GetJob()
    if not job or not job.isBoss then
        local msg = "You don't have boss permissions."
        Lib.interface.notify({
            title = 'Boss Menu',
            description = msg,
            type = 'inform',
            duration = 3000
        })
        return
    end
    CRUX.Debug(('^2[CRUX.Management]^7 Opening management for job: %s'):format(jobName))
    TriggerEvent('esx_society:openBossMenu', jobName, function(data, menu)
        frameworkObject.CloseContext()
    end, { wash = false })
end

return CRUX.OpenManagement