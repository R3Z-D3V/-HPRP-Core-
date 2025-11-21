CRUX.VehicleKeys = {}

function CRUX.VehicleKeys.GiveKey(plate)
  TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
end


return CRUX.VehicleKeys