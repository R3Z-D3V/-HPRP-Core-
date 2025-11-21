local CRUX = {}

function CRUX.OpenShop(ShopId)
    local result = lib.callback.await(GetCurrentResourceName() .. ':module:openShop', false, ShopId)
    if not result then return CRUX.Debug('^1[ERROR]^7 That shop doesnt exist') end

    TriggerServerEvent("inventory:server:OpenInventory", "shop", ShopId, result)
end

return CRUX.OpenShop