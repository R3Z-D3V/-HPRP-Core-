local CRUX = {}

function CRUX.GetCurrentSociety()
    return 'karthik'
end

function CRUX.GetSociety(society)
    return exports['kartik-banking']:GetSocietyAccount(society)
end

function CRUX.RegisterSociety(name, label, account, datastore, inventory, data)

end

function CRUX.AddSocietyMoney(society, amount, reason)
    return exports['kartik-banking']:AddAccountMoney(society, amount, reason)
end

function CRUX.RemoveSocietyMoney(society, amount, reason)
    return exports['kartik-banking']:RemoveAccountMoney(society, amount, reason)
end

-- Get account data by player source and bank type
---@param source number - The player's server ID
---@param bankType string - The type of bank (e.g., "fleeca", "swiss")
---@return table | false - Account data or false if not found
function CRUX.GetAccountDataBySource(source, bankType)
    return exports['kartik-banking']:GetAccountDataBySource(source, bankType)
end

-- Log a bank transaction
---@param data table - Transaction data containing account_number, type, amount, memo, etc.
---@return boolean - Success status
function CRUX.LogBankTransaction(data)
    return exports['kartik-banking']:LogBankTransaction(data)
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

    local receiverAccount = exports['kartik-banking']:GetAccountDataBySource(targetId, "fleeca")
    print("[CRUX] receiverAccount:", json.encode(receiverAccount))

    if not receiverAccount then
        print("[CRUX] No receiver account found for targetId:", targetId)
        return nil
    end

    -- Log the transaction
    local transactionData = {
        account_number = receiverAccount.accountNumber,
        type = "withdraw",
        amount = value,
        memo = reason,
        bankType = receiverAccount.bankType or "fleeca"
    }

    local success = CRUX.LogBankTransaction(transactionData)
    print("[CRUX] Transaction logged:", success)

    return success and receiverAccount.accountNumber or nil
end

return CRUX