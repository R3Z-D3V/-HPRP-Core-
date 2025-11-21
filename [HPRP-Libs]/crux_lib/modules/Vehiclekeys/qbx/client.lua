CRUX.VehicleKeys = {}

function CRUX.VehicleKeys.GiveKey(plate)
  -- Use the correct server event as defined in server.lua
  TriggerServerEvent('qbx_vehiclekeys:server:GiveKeys', plate)
end


return CRUX.VehicleKeys