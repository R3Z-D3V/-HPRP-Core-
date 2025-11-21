CRUX.VehicleKeys = {}

function CRUX.VehicleKeys.GiveKey(plate)
   TriggerEvent("vehiclekeys:client:SetOwner", plate)
end


return CRUX.VehicleKeys