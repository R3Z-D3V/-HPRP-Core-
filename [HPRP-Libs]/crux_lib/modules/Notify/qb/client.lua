if not QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

function CRUX.Notify(Notify)
  local type = (Notify.type == "inform" or Notify.type == "info") and "primary" or Notify.type
  if not Notify.description then
    QBCore.Functions.Notify(Notify.title, type, Notify.duration)
  else
    QBCore.Functions.Notify({text = Notify.title, caption = Notify.description or Notify.message}, type, Notify.duration)
  end
end

return CRUX.Notify