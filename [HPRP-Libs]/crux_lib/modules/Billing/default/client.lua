-- client.lua

CRUX.Billing = {}

function CRUX.Billing.OpenTerminal(JobName)
    local t1 = Config.LocalessUtils.Terminal
    local t = Config.DiscordLogging

    local input = lib.inputDialog(t1.Header, {
        {type = 'number', label = 'Target Player ID', required = true, icon = 'id-card', min = 1},
        {type = 'number', label = 'Amount', required = true, icon = 'dollar-sign', min = 1},
        {type = 'input', label = 'Reason (Optional)'},
        -- A dropdown menu is the most user-friendly way to select one option
        {
            type = 'select',
            label = 'Payment Method',
            required = true,
            options = {
                {value = "cash", label = "Cash"},
                {value = "bank", label = "Bank"}
            }
        }
    })

    if not input then return end

    -- The payment method is now the direct string value from the dropdown
    local targetId = tonumber(input[1])
    local amount = tonumber(input[2])
    local reason = input[3]
    local paymentMethod = input[4] -- This will be "cash" or "bank"

    if not reason or reason:gsub("%s*", "") == "" then
        reason = "No reason provided"
    end

    if targetId and amount and amount > 0 then
        TriggerServerEvent('crux_billing:createInvoice', targetId, amount, reason, paymentMethod, JobName, t)
    end
end

-- This new event shows the confirmation dialog to the player being billed.
RegisterNetEvent('crux_billing:showConfirmation', function(data)
    local result = lib.inputDialog('Incoming Invoice - Please Confirm', {
        -- {type = 'input', label = 'From', default = data.billerName, disabled = true},
        {type = 'input', label = 'Amount', default = '$'..tostring(data.amount), disabled = true},
        {type = 'input', label = 'Reason', default = data.reason, disabled = true},
        {type = 'input', label = 'Payment Method', default = data.paymentMethod:gsub("^%l", string.upper), disabled = true}
    })

    if result then
        -- If player confirms, trigger the final server event to process the payment.
        TriggerServerEvent('crux_billing:processPayment', data)

    else
        -- If player rejects, notify the original biller.
        TriggerServerEvent('crux_billing:rejectPayment', data.billerId)
    end
end)


return CRUX.Billing
