local CRUX = {}

function CRUX.OpenManagement()
    local job = Lib.framework.GetJob()
    if not job.isBoss then
        local msg = "You don't have boss permissions."
        Lib.interface.notify({
            title = 'Boss Menu',
            description = msg,
            type = 'inform',
            duration = 3000
        })
        return
    end
    TriggerEvent('qb-bossmenu:client:OpenMenu')
end


return CRUX