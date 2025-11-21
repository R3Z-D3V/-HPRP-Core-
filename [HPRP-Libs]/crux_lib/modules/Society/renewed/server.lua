local CRUX = {}

function CRUX.GetCurrentSociety()
    return 'renewed'
end

function CRUX.AddSocietyMoney(society, amount, reason)
  exports['Renewed-Banking']:addAccountMoney(society, amount)
end

function CRUX.RemoveSocietyMoney(society, amount, reason)
  exports['Renewed-Banking']:removeAccountMoney(society, amount)
end

function CRUX.GetCurrentSociety()
    return 'renewed'
end

 ---@param account<string> - job name or citizenid
 ---@param title<string> - Title of transaction example `Personal Account / ${Player.PlayerData.citizenid}`
 ---@param amount<number> - Amount of money being transacted
 ---@param message<string> - Description of transaction
 ---@param issuer<string> - Name of Business or Character issuing the bill
 ---@param receiver<string> - Name of Business or Character receiving the bill
 ---@param type<string> - deposit | withdraw
 ---@param transID<string> - (optional) Force a specific transaction ID instead of generating one.

function CRUX.AddTransaction(receiver_name, receiver_identifier, sender_name, sender_identifier, value, reason, targetId)
  return exports['Renewed-Banking']:handleTransaction(receiver_name, sender_identifier, value, reason, receiver_identifier, sender_name, 'withdraw')
end

return CRUX