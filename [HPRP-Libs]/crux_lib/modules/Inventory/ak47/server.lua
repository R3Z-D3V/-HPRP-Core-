if not QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

local RegisteredStashs = {}

function CRUX.Inventory.RegisterStash(stash)
    if RegisteredStashs[stash.id] then
        print(('^3[WARN]^7 Stash id %s was overrided'):format(stash.id))
    end
    RegisteredStashs[stash.id] = {
        label = stash.label,
        maxweight = stash.maxWeight,
        slots = stash.slots,
    }
    if stash.delete and stash.delete.enabled then
        exports['ak47_inventory']:ClearInventory(stash.id)
    end
end


function CRUX.Inventory.GetItemsByName(source, ItemName)
    return exports['ak47_inventory']:GetItem(source, ItemName)
end

function CRUX.Inventory.CountItem(source, ItemName, MetaData)
    local count = exports['ak47_inventory']:Search(source, 'count', ItemName, MetaData)
    return count
end

function CRUX.Inventory.AddItem(source, item, amount, slot, metadata, reason)
    return exports['ak47_inventory']:AddItem(source, item, amount, slot, metadata)
end

function CRUX.Inventory.RemoveItem(source, item, amount, slot, reason)
    return exports['ak47_inventory']:RemoveItem(source, item, amount, slot)
end

function CRUX.Inventory.CanAddItem(source, itemName, count)
  local canAdd = exports['ak47_inventory']:CanAddItem(source, itemName, count)
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

lib.callback.register(GetCurrentResourceName() .. ':module:openInventory', function(source, invId)
    return RegisteredStashs[invId]
end)


