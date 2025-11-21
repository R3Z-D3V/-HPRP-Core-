CRUX = {}

function CRUX.OpenJobClothing(JobName)
    local job = allFuncs.framework.GetJob()
    if job.name ~= JobName then return end

    exports['sleek-clothestore']:OpenWardrobe()

end

return CRUX