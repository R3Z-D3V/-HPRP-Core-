local CRUX = {}

function CRUX.GetCurrentSociety()
    return 'felis'
end

function CRUX.GetSociety(society)
    return exports.fd_banking:GetAccount(society)
end

function CRUX.RegisterSociety(name, label, account, datastore, inventory, data)

end

function CRUX.AddSocietyMoney(society, amount, reason)
    return exports.fd_banking:AddMoney(society, amount, reason)
end

function CRUX.RemoveSocietyMoney(society, amount, reason)
    return exports.fd_banking:RemoveMoney(society, amount, reason)
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

-- function CRUX.AddTransaction(receiver_name, receiver_identifier, sender_name, sender_identifier, value, reason, targetId)
--     print("[CRUX] AddTransaction called with:")
--     print("  receiver_name:", receiver_name)
--     print("  receiver_identifier:", receiver_identifier)
--     print("  sender_name:", sender_name)
--     print("  sender_identifier:", sender_identifier)
--     print("  value:", value)
--     print("  reason:", reason)
--     print("  targetId:", targetId)

--     -- Use fd_banking doTransfer to send money to player
--     local success = exports.fd_banking:doTransfer(
--         targetId,           -- source (target player)
--         nil,                -- targetAccountId (nil for default account)
--         receiver_identifier,          -- playerId (citizenid)
--         value,              -- amount
--         nil,                -- localAccountId (nil for default)
--         reason,             -- reason
--         nil,                -- transactionCallback
--         true                -- forcePay
--     )

--     print("[CRUX] Transfer success:", success)
--     return success
-- end

return CRUX