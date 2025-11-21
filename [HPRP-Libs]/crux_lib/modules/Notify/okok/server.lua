function CRUX.Notify(src, Notify)
  local type = Notify.type
  local title = Notify.title
  local description = Notify.description or Notify.message
  local duration = Notify.duration
  local playSound = Notify.playSound or true -- default to true if not provided

  -- Use TriggerClientEvent
  TriggerClientEvent('okokNotify:Alert', src, title, description, duration, type, playSound)
end

return CRUX.Notify