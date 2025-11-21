local CRUX = {}

local RegisteredShops = {}
---RegisterShop
---@param Shop Shop
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
        label = Config.LocalessUtils.Shop.label,
        slots = #items,
        items = items,
    }
end

lib.callback.register(GetCurrentResourceName() .. ':module:openShop', function(source, shopId)
    return RegisteredShops[shopId]
end)

lib.callback.register(GetCurrentResourceName() .. ':module:buyItem', function(source, item, amount, price)
    if not item or not amount or not price then return end

    local money = allFuncs.framework.GetMoney(source, 'cash')
    price = price * amount
    if money < price then
        return allFuncs.interface.notify(source, {
            title = 'Shop',
            description = 'You dont have enough money',
            type = 'error',
        }--[[@as Notify]])
    end

    -- Check if player can carry the item
    if not allFuncs.inventory.CanAddItem(source, item, amount) then
        return allFuncs.interface.notify(source, {
            title = 'Shop',
            description = 'Your inventory cannot hold this item',
            type = 'error',
        }--[[@as Notify]])
    end

    allFuncs.framework.RemoveMoney(source, 'cash', price)

    allFuncs.inventory.AddItem(source, item, amount)

    allFuncs.interface.notify(source, {
        title = 'Shop',
        description = 'Your purchase was successful',
        type = 'success',
    }--[[@as Notify]])
end)

return CRUX