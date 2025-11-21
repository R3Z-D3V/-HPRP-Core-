local CRUX = {}

function CRUX.GetCurrentSociety()
    return 'pScripts'
end

function CRUX.GetSociety(society)

end

function CRUX.RegisterSociety(name, label, account, datastore, inventory, data)

end

function CRUX.AddSocietyMoney(society, amount, reason, billerId)
    local accounts = exports['p_banking']:getPlayerAccounts(billerId)
    return exports['p_banking']:addAccountMoney(accounts.iban, amount)
end

function CRUX.RemoveSocietyMoney(society, amount, reason)
    return exports['p_banking']:removeAccountMoney(society, amount)
end

-- Get player accounts
---@param playerId number - The player's server ID
---@return table - Array of player accounts
function CRUX.GetPlayerAccounts(playerId)
    return exports['p_banking']:getPlayerAccounts(playerId)
end

-- Add money to account
---@param iban string - IBAN of the account
---@param amount number - Amount to add
---@return boolean - Success status
function CRUX.AddAccountMoney(iban, amount)
    return exports['p_banking']:addAccountMoney(iban, amount)
end

-- Remove money from account
---@param iban string - IBAN of the account
---@param amount number - Amount to remove
---@return boolean - Success status
function CRUX.RemoveAccountMoney(iban, amount)
    return exports['p_banking']:removeAccountMoney(iban, amount)
end

-- Get account balance
---@param iban string - IBAN of the account
---@return number - Account balance
function CRUX.GetAccountMoney(iban)
    return exports['p_banking']:getAccountMoney(iban)
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

--     local accounts = exports['p_banking']:getPlayerAccounts(receiver_identifier)
--     print(json.encode(accounts, {indent=true}))

--     local data = {
--       iban = accounts[1].iban, -- replace with existing account iban
--       type = 'outcome', -- income / outcome
--       amount = value,
--       title = reason,
--       from = sender_name,
--       to = receiver_name
--     }
--     return exports['p_banking']:createHistory(data)
-- end

return CRUX