local CRUX = {}

function CRUX.OpenShop(ShopId)
    TriggerServerEvent('crux_lib:openshop', ShopId)
end

return CRUX