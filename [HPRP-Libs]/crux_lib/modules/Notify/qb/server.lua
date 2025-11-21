if not QBCore then
  QBCore = exports['qb-core']:GetCoreObject()
end

function CRUX.Notify(src, Notify)
  local type = (Notify.type == "inform" or Notify.type == "info") and "primary" or Notify.type
  if not Notify.description then
    TriggerClientEvent('QBCore:Notify', src, Notify.title, type, Notify.duration)
  else
    TriggerClientEvent('QBCore:Notify', src, {text = Notify.title, caption = Notify.description or Notify.message}, type, Notify.duration)
  end
end

return CRUX.Notify