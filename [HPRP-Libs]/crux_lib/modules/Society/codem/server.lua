local CRUX = {}

function CRUX.GetCurrentSociety()
    return 'codem'
end

function CRUX.GetSociety(society)

end

function CRUX.RegisterSociety(name, label, account, datastore, inventory, data)

end

function CRUX.AddSocietyMoney(society, amount, reason)
    return exports['qb-management']:AddMoney(society, amount)
end

function CRUX.RemoveSocietyMoney(society, amount, reason)
    return exports['qb-management']:RemoveMoney(society, amount)
end

-- Add a transaction between accounts/societies
---@param toIban number | nil - The iban of the account or society name
---@param fromIban number | nil - The iban of the account or society name
---@param transactionType string - The type of the transaction (deposit, withdraw)
---@param amount number - The amount of the transaction
---@param description string | nil - The description of the transaction
---@param playerId string | nil - The id of the player if the transaction is from a player, nil otherwise
---@param cardId number | nil - The id of the card if the transaction is from a card, nil otherwise
---@return string | nil - The id of the transaction if successful, nil otherwise
function CRUX.AddTransaction(receiver_name, receiver_identifier, sender_name, sender_identifier, value, reason, targetId)
    return exports['codem-bank']:addtransaction(targetId,value,'bills')
end

return CRUX