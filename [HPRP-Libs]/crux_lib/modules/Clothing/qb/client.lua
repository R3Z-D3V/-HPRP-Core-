CRUX = {}

function CRUX.OpenJobClothing(JobName)

    TriggerEvent('qb-clothing:client:getOutfits', JobName.name, JobName.grade)
end

return CRUX