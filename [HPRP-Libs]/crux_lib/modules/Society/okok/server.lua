local CRUX = {}

function CRUX.GetCurrentSociety()
    return 'okok'
end

function CRUX.GetSociety(society)
    return exports['okokBanking']:GetAccount(society)
end

function CRUX.RegisterSociety(name, label, account, datastore, inventory, data)

end

function CRUX.AddSocietyMoney(society, amount, reason)
    print("[CRUX.AddSocietyMoney] society:", society)
    return exports['okokBanking']:AddMoney(society, amount)
end

function CRUX.RemoveSocietyMoney(society, amount, reason)
    return exports['okokBanking']:RemoveMoney(society, amount)
end

function CRUX.AddTransaction(receiver_name, receiver_identifier, sender_name, sender_identifier, value, reason)
    return TriggerEvent('okokBanking:AddNewTransaction', receiver_name, receiver_identifier, sender_name, sender_identifier, value, reason)
end

return CRUX