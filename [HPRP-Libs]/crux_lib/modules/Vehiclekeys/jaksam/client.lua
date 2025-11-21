CRUX.VehicleKeys = {}

function CRUX.VehicleKeys.GiveKey(plate)
  TriggerServerEvent("vehicles_keys:selfGiveVehicleKeys", plate)
end


return CRUX.VehicleKeys