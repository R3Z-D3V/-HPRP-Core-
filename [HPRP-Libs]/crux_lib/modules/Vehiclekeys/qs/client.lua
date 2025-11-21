CRUX.VehicleKeys = {}

function CRUX.VehicleKeys.GiveKey(plate, model)
  exports['qs-vehiclekeys']:GiveKeys(plate, model, true)
end


return CRUX.VehicleKeys