local CRUX = {}

function CRUX.OpenShop(ShopId)
    lib.callback.await(GetCurrentResourceName() .. ':module:openShop', ShopId)
end

return CRUX