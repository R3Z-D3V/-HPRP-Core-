CRUX = {}

function CRUX.OpenJobClothing(JobName)
    local job = allFuncs.framework.GetJob()
    if job.name ~= JobName then return end

    exports['rcore_clothing']:OpenWardrobe()
end

return CRUX