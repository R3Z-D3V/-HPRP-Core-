CRUX.VehicleKeys = {}

function CRUX.VehicleKeys.GiveKey(plate)
   ExecuteCommand('vehicle-keys')
  --  TriggerEvent("vehiclekeys:client:SetOwner", plate)
end


return CRUX.VehicleKeys