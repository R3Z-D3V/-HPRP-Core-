local CRUX = {}
local RegisteredShops = {}

function CRUX.OpenShop(ShopId)
    -- Remove spaces and hyphens from ShopId
    local cleanShopId = tostring(ShopId):gsub("[%s%-]", "")

    -- Build items table from config
    local items = {}
    if Config and Config.ShopSetup and Config.ShopSetup.Shop and Config.ShopSetup.Shop.inventory then
        for k, v in ipairs(Config.ShopSetup.Shop.inventory) do
            items[k] = {
                name = v.name,
                price = v.price,
                amount = v.count,
                info = v.metadata,
                slot = k,
            }
        end
    end

    RegisteredShops[cleanShopId] = {
        name = cleanShopId,
        label = Config.LocalessUtils.Shop.Label or cleanShopId,
        slots = #items,
        items = items,
    }

    exports.origen_inventory:SetShopEnabled(cleanShopId, true --[[true/false]])
    exports.origen_inventory:openInventory('shop', cleanShopId, RegisteredShops[cleanShopId])
end

return CRUX