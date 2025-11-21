local CRUX = {}

function CRUX.GetCurrentSociety()
    return 'snipe'
end

function CRUX.GetSociety(society)
    return exports["snipe-banking"]:GetAccountBalance(society)
end

function CRUX.RegisterSociety(name, label, account, datastore, inventory, data)
    return exports["snipe-banking"]:CreateJobGangAccount(name, label, 0, true)
end

function CRUX.AddSocietyMoney(society, amount, reason)
    return exports["snipe-banking"]:AddMoneyToAccount(society, amount)
end

function CRUX.RemoveSocietyMoney(society, amount, reason)
    return exports["snipe-banking"]:RemoveMoneyFromAccount(society, amount)
end

function CRUX.AddTransaction(receiver_name, receiver_identifier, sender_name, sender_identifier, value, reason)
    return exports["snipe-banking"]:CreateJobTransactions(receiver_name, value, reason, 'withdraw', sender_identifier, receiver_identifier, true)
end

return CRUX