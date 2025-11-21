local CRUX = {}

function CRUX.GetCurrentSociety()
    return 'tgg'
end

function CRUX.GetSociety(society)
    return exports['tgg-banking']:GetSocietyAccount(society)
end

function CRUX.RegisterSociety(name, label, account, datastore, inventory, data)
    -- name: society name (string)
    -- label: display name (string)
    -- account: starting balance (number or nil)
    -- Other params are ignored for banking
    local startBalance = account or 0
    local displayName = label or name
    local color = data and data.color or nil
    return exports['tgg-banking']:CreateBusinessAccount(name, startBalance, displayName, color)
end

function CRUX.AddSocietyMoney(society, amount, reason)
    return exports['tgg-banking']:AddSocietyMoney(society, amount)
end

function CRUX.RemoveSocietyMoney(society, amount, reason)
    return exports['tgg-banking']:RemoveSocietyMoney(society, amount)
end

-- Add a transaction between accounts/societies
---@param receiver_name string - The name of the receiver society/account
---@param receiver_identifier string - The identifier of the receiver (iban or player id)
---@param sender_name string - The name of the sender (player or society)
---@param sender_identifier string - The identifier of the sender (iban or player id)
---@param value number - The amount of the transaction
---@param reason string - The description/reason for the transaction
---@param targetId number - The player id of the receiver
---@return string | nil - The id of the transaction if successful, nil otherwise

function CRUX.AddTransaction(receiver_name, receiver_identifier, sender_name, sender_identifier, value, reason, targetId)
    print("[CRUX] AddTransaction called with:")
    print("  receiver_name:", receiver_name)
    print("  receiver_identifier:", receiver_identifier)
    print("  sender_name:", sender_name)
    print("  sender_identifier:", sender_identifier)
    print("  value:", value)
    print("  reason:", reason)
    print("  targetId:", targetId)

    local receiverAccount = exports['tgg-banking']:GetPersonalAccountByPlayerId(targetId)
    local senderplayerAccount = exports['tgg-banking']:GetPersonalAccountByPlayerId(targetId)
    print("[CRUX] receiverAccount:", json.encode(receiverAccount))

    if not receiverAccount then
        print("[CRUX] No receiver account found for targetId:", targetId)
        return nil
    end

    local transactionId = exports['tgg-banking']:AddTransaction(
        receiverAccount.iban,                      -- receiver IBAN
        senderplayerAccount.iban,                  -- sender IBAN (can be nil if not used)
        'withdraw',
        value,
        reason,
        sender_identifier,
        nil
    )

    print("[CRUX] Transaction ID:", transactionId)
    return transactionId
end

return CRUX