local CRUX = {}

function CRUX.OpenShop(ShopId)
    exports.ox_inventory:openInventory('shop', { type = ShopId, id = 1 })
end

return CRUX