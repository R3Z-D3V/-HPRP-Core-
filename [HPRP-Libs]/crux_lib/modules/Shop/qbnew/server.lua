local CRUX = {}

local RegisteredShops = {}

function CRUX.RegisterShop(Shop)
    if RegisteredShops[Shop.id] then
        print(('^3[WARN]^7 Shop id %s was overrided'):format(Shop.id))
    end

    local items = {}
    for k, v in ipairs(Shop.inventory) do
        items[k] = {
            name = v.name,
            price = v.price,
            amount = v.count,
            info = v.metadata,
            slot = k,
        }
    end
    RegisteredShops[Shop.id] = {
        name = Shop.id,
        label = Config.LocalessUtils.Shop.Label,
        slots = #items,
        items = items,
    }

    exports['qb-inventory']:CreateShop(RegisteredShops[Shop.id])
end

lib.callback.register(GetCurrentResourceName() .. ':module:openShop', function(source, shopId)
    exports['qb-inventory']:OpenShop(source, shopId)
end)

return CRUX