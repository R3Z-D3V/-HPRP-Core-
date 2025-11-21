function CRUX.Notify(Notify)
  exports['crux_notify']:SendNotification({
      title = Notify.title,
      message = Notify.description,
      type = Notify.type,
      duration = Notify.duration
  })
end

return CRUX.Notify