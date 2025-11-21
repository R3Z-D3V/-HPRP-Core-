CRUX.VehicleKeys = {}

function CRUX.VehicleKeys.GiveKey(plate)
  TriggerServerEvent('t1ger_keys:updateOwnedKeys', plate, true)
end


return CRUX.VehicleKeys