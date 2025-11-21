local CRUX = {}

function CRUX.OpenTerminal(JobName)
    TriggerEvent("okokBilling:ToggleCreateInvoice")

            -- Send Discord log
        -- local logType = "Billing"
        -- local title = "Billing Attempt"
        -- local description = string.format("Player %s attempted to bill Player %s for $%s (Reason: %s, Job: %s)", tostring(GetPlayerServerId(PlayerId())), dialog.id, dialog.amount, dialog.reason, JobName)
        -- local color = Config.DiscordLogging.color.billing
        -- local playerName = CRUX.Framework and CRUX.Framework.GetPlayerName and CRUX.Framework.GetPlayerName() or "Unknown"
        -- local fields = {
        --     { name = "Player Name", value = playerName, inline = true },
        --     { name = "Target ID", value = tostring(dialog.id), inline = true },
        --     { name = "Amount", value = tostring(dialog.amount), inline = true },
        --     { name = "Reason", value = dialog.reason, inline = true },
        --     { name = "Job", value = JobName, inline = true }
        -- }
        -- TriggerServerEvent('crux_lib:discordLog', logType, title, description, fields, color, Config.DiscordLogging)
end

return CRUX

