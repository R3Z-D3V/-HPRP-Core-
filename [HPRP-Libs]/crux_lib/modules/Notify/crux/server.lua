function CRUX.Notify(src,Notify)
  exports['crux_notify']:NotifyPlayer(src , {
      title = Notify.title,
      message = Notify.description,
      type = Notify.type,
      duration = Notify.duration
  })
end

return CRUX.Notify