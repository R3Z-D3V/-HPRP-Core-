local CRUX = {}

function CRUX.GetCurrentSociety()
    return 'justbank'
end

function CRUX.GetSociety(society)

end

function CRUX.RegisterSociety(name, label, account, datastore, inventory, data)
  -- name: society name (string)
  -- label: display name (string)
  -- account: starting balance (number or nil)
  -- Other params are ignored for banking

  -- Check if society account exists
  if exports.JustBanks:IsSocietyExist(name) then
    return true
  end

  -- Create society account if it doesn't exist
  local accountId = exports.JustBanks:CreateSocietyAccount(name)
  return accountId
end

function CRUX.AddSocietyMoney(society, amount, reason)
    return exports.JustBanks:AddSocietyMoney(society, amount)
end

function CRUX.RemoveSocietyMoney(society, amount, reason)
    return exports.JustBanks:RemoveSocietyMoney(society, amount)
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

end

return CRUX