local CRUX = {}

function CRUX.OpenShop(ShopId)
    local result = lib.callback.await(GetCurrentResourceName() .. ':module:openShop', source, ShopId)
    if not result then return CRUX.Debug('^1[ERROR]^7 That shop doesnt exists') end

    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Itemshop_" .. ShopId, result)
end

return CRUX