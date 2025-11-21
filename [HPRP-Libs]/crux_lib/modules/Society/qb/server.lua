CRUX.Society = {}

function CRUX.Society.AddSocietyMoney(society, amount, reason)

    if not exports['qb-banking']:GetAccount(society) then
        exports['qb-banking']:CreateJobAccount(society, 0)
    end
    exports['qb-banking']:AddMoney(society, amount, reason or "Society Income")
end

function CRUX.Society.RemoveSocietyMoney(society, amount, reason)
    if not exports['qb-banking']:GetAccount(society) then
        exports['qb-banking']:CreateJobAccount(society, 0)
    end
    return exports['qb-banking']:RemoveMoney(society, amount, reason or "Society Expense")
end

function CRUX.Society.GetCurrentSociety()
    return 'qb'
end

return CRUX.Society