CRUX.VehicleKeys = {}

RegisterNetEvent('qbx_vehiclekeys:server:GiveKeys')
AddEventHandler('qbx_vehiclekeys:server:GiveKeys', function(source, vehicle)
  -- Your logic to give vehicle keys goes here
  local src = source
  exports.qbx_vehiclekeys:GiveKeys(src, vehicle, false)
end)

return CRUX.VehicleKeys