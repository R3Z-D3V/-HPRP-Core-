--https://docs.origennetwork.store/origen_inventory/exports/client-exports

CRUX.Inventory = {}

---Register a stash
---@param stash Stash
---@param playerId number Optional player ID for clearing inventory
function CRUX.Inventory.RegisterStash(stash, playerId)

    exports.origen_inventory:registerStash(stash.id,{
        label = stash.label,
        slots = stash.slots,
        maxweight = stash.maxWeight,
    })

    if stash.delete and stash.delete.enabled then
        -- Remove all items from the stash inventory
        local items = exports.origen_inventory:getItems(stash.id)
        for _, item in pairs(items or {}) do
            exports.origen_inventory:removeItem(stash.id, item.name, item.amount, item.metadata, item.slot, false)
        end
    end
end

RegisterServerEvent('burger:openInventory')
AddEventHandler('burger:openInventory', function(identifier)
    local src = source
    local result = exports.origen_inventory:OpenInventory(src,'stash',identifier)
    return result
end)

function CRUX.Inventory.GetItemsByName(source, ItemName)
    local tbl = {}
    local table = exports.origen_inventory:getItems(source)
    for k, item in pairs(table) do
        if item.name == ItemName then
            tbl[#tbl+1] = item
        end
    end

    return tbl
end

function CRUX.Inventory.CountItem(source, ItemName, MetaData, ExactSearch)
    local count = exports.origen_inventory:getItemCount(source, ItemName, MetaData, ExactSearch)
    return count or 0
end

function CRUX.Inventory.AddItem(source, item, amount, slot, metadata, reason)
    return exports.origen_inventory:addItem(source, item, amount, metadata, slot, false)
end

function CRUX.Inventory.CanAddItem(source, itemName, count)
  local canAdd = exports.origen_inventory:canCarryItem(source, itemName, count)
  return canAdd
end

function CRUX.Inventory.CreateUseableItem(item, func)
    allFuncs.framework.CreateUseableItem(item, func)
end

function CRUX.Inventory.UseItemForStash(itemName, stashId)
    if Config.DebugScript then print(('^2[INFO]^7 Registering item %s for stash %s'):format(itemName, stashId)) end
    CRUX.Inventory.CreateUseableItem(itemName, function(source, item)
        if Config.DebugScript then print(('^2[INFO]^7 Player %s used item %s for stash %s'):format(source, itemName, stashId)) end
        TriggerClientEvent('crux_lib:openStash', source, stashId)
        return true
    end)
    if Config.DebugScript then print(('[CRUX.Inventory] UseItemForStash registered for item: %s, stash: %s'):format(itemName, stashId)) end
    return true
end

function CRUX.Inventory.RemoveItem(source, item, amount, slot, reason)
    return exports.origen_inventory:removeItem(source, item, amount, nil, slot, false)
end

return CRUX.Inventory
