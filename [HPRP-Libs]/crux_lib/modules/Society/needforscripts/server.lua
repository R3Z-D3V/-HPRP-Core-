local CRUX = {}

function CRUX.GetCurrentSociety()
    return 'needforscripts'
end

function CRUX.GetSociety(society)
    return exports['nfs-billing']:getSocietyBalance(society)
end

function CRUX.RegisterSociety(name, label, account, datastore, inventory, data)

    exports['nfs-billing']:registerSociety({
        accountName = name,     -- Shared account name
        label = name,                 -- Society label
        job = name,                   -- Job name
        grade = 3,                        -- Minimum grade to send invoices
        withdrawGrade = 4,                -- Minimum grade to withdraw money
        presetGrade = 4,                  -- Minimum grade to use preset amounts
        societyBalanceGrade = 4,         -- Minimum grade to view society balance
        playerCommission = 5,            -- % commission the player earns per invoice
        vat = 5                           -- % VAT added to invoices
    })

end

function CRUX.AddSocietyMoney(society, amount, reason)
    print(("^2[INFO]^7 Adding $%s to society %s"):format(amount, society))

    local ok, balance = pcall(CRUX.GetSociety, society)
    if not ok or not balance then
        CRUX.RegisterSociety(society)
        return exports['nfs-billing']:depositSociety(society, amount)
    else
        return exports['nfs-billing']:depositSociety(society, amount)
    end
end

function CRUX.RemoveSocietyMoney(society, amount, reason)
    local ok, balance = pcall(CRUX.GetSociety, society)
    if not ok or not balance then
        CRUX.RegisterSociety(society)
        return exports['nfs-billing']:withdrawSociety(society, amount)
    else
        return exports['nfs-billing']:withdrawSociety(society, amount)
    end
end

-- -- Add a transaction between accounts/societies
-- ---@param receiver_name string - The name of the receiver society/account
-- ---@param receiver_identifier string - The identifier of the receiver (iban or player id)
-- ---@param sender_name string - The name of the sender (player or society)
-- ---@param sender_identifier string - The identifier of the sender (iban or player id)
-- ---@param value number - The amount of the transaction
-- ---@param reason string - The description/reason for the transaction
-- ---@param targetId number - The player id of the receiver
-- ---@return string | nil - The id of the transaction if successful, nil otherwise

-- function CRUX.AddTransaction(receiver_name, receiver_identifier, sender_name, sender_identifier, value, reason, targetId)
--     print("[CRUX] AddTransaction called with:")
--     print("  receiver_name:", receiver_name)
--     print("  receiver_identifier:", receiver_identifier)
--     print("  sender_name:", sender_name)
--     print("  sender_identifier:", sender_identifier)
--     print("  value:", value)
--     print("  reason:", reason)
--     print("  targetId:", targetId)


--     local iban = exports['nfs-banking']:getPlayerMainCardIban(sender_identifier)
--     local transactionId = exports['nfs-banking']:registerTransaction(iban, value, reason, 'withdraw', receiver_name)

--     print("[CRUX] Transaction ID:", transactionId)
--     return transactionId
-- end

return CRUX