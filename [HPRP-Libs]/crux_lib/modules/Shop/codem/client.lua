local CRUX = {}

function CRUX.OpenShop(ShopId)
    local result = lib.callback.await(GetCurrentResourceName() .. ':module:openShop', source, ShopId)
    if not result then return CRUX.Debug('^1[ERROR]^7 That shop doesnt exists') end

    TriggerEvent('codem-inventory:openshop', ShopId, {
        name = result.name,
        label = result.label,
        slots = result.slots,
        items = result.items
    })
end

return CRUX