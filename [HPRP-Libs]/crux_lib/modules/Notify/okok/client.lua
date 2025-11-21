function CRUX.Notify(src,Notify)
  local type = Notify.type
  exports['okokNotify']:Alert(Notify.title, Notify.description or Notify.message, Notify.duration, type)
end

return CRUX.Notify