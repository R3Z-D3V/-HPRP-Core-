local CRUX = {}

function CRUX.RegisterShop(Shop)
    local items = {}
    for k, v in ipairs(Shop.inventory) do
        items[k] = {
            name = v.name,
            price = v.price,
            amount = v.count,
            type = "item"
        }
    end

    exports['jpr-inventory']:CreateShop({
      name = Shop.id,
      label = Config.LocalessUtils.Shop.Label,
      slots = #items,
      items = items,
    })
end

RegisterServerEvent('crux_lib:openshop')
AddEventHandler('crux_lib:openshop', function(identifier)
    local src = source
    local result = exports['jpr-inventory']:OpenShop(src, identifier)
    return result
end)


return CRUX