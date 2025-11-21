CRUX.Society = {}

function CRUX.GetCurrentSociety()
    return 'qb_management'
end

function CRUX.AddSocietyMoney(society, amount, reason)
    exports['qb-management']:AddMoney(society, amount)
end

function CRUX.RemoveSocietyMoney(society, amount, reason)
    exports['qb-management']:RemoveMoney(society, amount, reason)
end

function CRUX.Society.GetCurrentSociety()
    return 'qb_management'
end

return CRUX.Society