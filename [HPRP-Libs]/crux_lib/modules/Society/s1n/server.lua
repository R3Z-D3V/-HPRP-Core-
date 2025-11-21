local CRUX = {}

function CRUX.GetCurrentSociety()
    return 's1n'
end

-- function CRUX.GetSociety(society)
--      return exports["s1n_banking"]:GetSocietyAccount(society)
-- end

-- function CRUX.RegisterSociety(name, label, account, datastore, inventory, data)

-- end

function CRUX.AddSocietyMoney(society, amount, reason)
    return exports["s1n_banking"]:AddMoneyToSociety(society, amount)
end

function CRUX.RemoveSocietyMoney(society, amount, reason)
    return exports["s1n_banking"]:RemoveMoneyFromSociety(society, amount)
end

-- Get account data for the specified account
---@param source string - The target player's server ID
---@param data table - Must contain a type field (societyaccount, sharedaccount, or useraccount)
---@return table|boolean, string|nil - Account data if successful, or false with error message
function CRUX.GetAccountData(source, data)
    if not source or not data or not data.type then
        return false, "Invalid parameters: source and data with type field are required"
    end

    local validTypes = {
        ["societyaccount"] = true,
        ["sharedaccount"] = true,
        ["useraccount"] = true
    }

    if not validTypes[data.type] then
        return false, "Invalid account type: must be societyaccount, sharedaccount, or useraccount"
    end

    return exports["s1n_banking"]:GetAccountData(source, data)
end


-- Create a history transaction for logging purposes (doesn't add/remove money)
---@param account table - Must contain an iban field with the account's IBAN as a string
---@param action string - The action that will be displayed in the transaction history
---@param label string - The label that will be displayed in the transaction history
---@param amount number - The amount that will be displayed in the transaction history
---@return boolean - True if successful, false otherwise
function CRUX.AddTransaction(receiver_name, receiver_identifier, sender_name, sender_identifier, value, reason, targetId)
    local accountData = exports["s1n_banking"]:GetAccountData(targetId, { type = "useraccount" })
    local iban = accountData and accountData.iban or nil
    if not iban then
        return false
    end
    return exports["s1n_banking"]:CreateTransaction(iban, "withdraw", reason, value)
end



return CRUX
