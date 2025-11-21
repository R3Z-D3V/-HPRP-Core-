local CRUX = {}

function CRUX.OpenTerminal(JobName)
    return exports["tgg-billing"]:OpenBillingMenu()
--   local dialog = Lib.interface.input({
--       Header = Config.LocalessUtils.Terminal.Header,
--       SubmitText = Config.Locales.Terminal.SubmitText,
--       Inputs = {
--           {Id = "id", Text = "Identification", Required = true},
--           {Id = "amount", Text = "Amount", Required = true},
--           {Id = "reason", Text = "Reason", Required = true}
--       }
--   })
--   if dialog and dialog.id and dialog.amount and tonumber(dialog.amount) and dialog.reason then
--       dialog.id = tonumber(dialog.id)
--       dialog.amount = tonumber(dialog.amount)

--       if not dialog.id or not dialog.amount then return end

--       local playerName = CRUX.Framework and CRUX.Framework.GetPlayerName and CRUX.Framework.GetPlayerName() or "Unknown"
--       local playerId = GetPlayerServerId(PlayerId())

--       local invoiceData = {
--           items = {
--               {
--                   key = "service",
--                   label = dialog.reason,
--                   price = dialog.amount,
--                   quantity = 1,
--                   priceChange = false,
--                   quantityChange = false
--               }
--           },
--           total = dialog.amount,
--           notes = dialog.reason,
--           sender = JobName,
--           senderId = tostring(playerId),
--           senderName = playerName,
--           recipientId = tostring(dialog.id),
--           recipientName = "Player " .. dialog.id,
--           taxPercentage = 0,
--           senderCompanyName = Config.JobLabel
--       }

--       local invoice = exports["tgg-billing"]:CreateInvoice(invoiceData)

--       -- Send Discord log
--       local logType = "Billing"
--       local title = "Invoice Created"
--       local description = string.format("Player %s created an invoice for Player %s for $%s (Reason: %s, Job: %s)", tostring(playerId), dialog.id, dialog.amount, dialog.reason, JobName)
--       local color = Config.DiscordLogging.color.billing
--       local fields = {
--           { name = "Player Name", value = playerName, inline = true },
--           { name = "Target ID", value = tostring(dialog.id), inline = true },
--           { name = "Amount", value = tostring(dialog.amount), inline = true },
--           { name = "Reason", value = dialog.reason, inline = true },
--           { name = "Job", value = JobName, inline = true }
--       }
--       TriggerServerEvent('crux_lib:discordLog', logType, title, description, fields, color, Config.DiscordLogging)
--   end
end

return CRUX

