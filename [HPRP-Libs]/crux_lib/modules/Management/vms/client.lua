local CRUX = {}

function CRUX.OpenManagement()
    local job = CRUX.Framework.GetJob()
    exports['vms_bossmenu']:openBossMenu(job.name, 'job')
end

return CRUX.OpenManagement