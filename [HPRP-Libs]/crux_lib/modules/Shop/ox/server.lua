local CRUX = {}

function CRUX.RegisterShop(Shop)
	local srcInventory = Shop.inventory or {}
	local inventoryToRegister = {}

	if Shop.enablecount then
		-- include count field as provided
		for i, item in ipairs(srcInventory) do
			inventoryToRegister[i] = {
				name = item.name,
				price = item.price,
				count = item.count, -- use the count sent through Shop.inventory
			}
		end
	else
		-- exclude count field
		for i, item in ipairs(srcInventory) do
			inventoryToRegister[i] = {
				name = item.name,
				price = item.price,
			}
		end
	end

	exports.ox_inventory:RegisterShop(Shop.id, {
		name = Config.LocalessUtils.Shop.Label,
		inventory = inventoryToRegister,
		locations = Shop.locations,
	})
end

return CRUX