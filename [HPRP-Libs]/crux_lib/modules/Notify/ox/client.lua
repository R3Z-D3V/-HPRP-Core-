function CRUX.Notify(Notify)
  lib.notify({
      title = Notify.title,
      description = Notify.description or Notify.message,
      ---@diagnostic disable-next-line: assign-type-mismatch
      type = Notify.type,
      duration = Notify.duration
  })
end

return CRUX.Notify