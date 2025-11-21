CRUX = {}

function CRUX.OpenJobClothing(JobName)
    local job = allFuncs.framework.GetJob()
    if job.name ~= JobName then return end

    exports['vms_clothestore']:OpenWardrobe()
end

return CRUX