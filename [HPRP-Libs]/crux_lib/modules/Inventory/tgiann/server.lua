CRUX.Inventory = {}

function CRUX.Inventory.RegisterStash(stash)
    exports["tgiann-inventory"]:RegisterStash(stash.id, stash.label, stash.slots, stash.maxWeight, false, false, false, false, false)

    if stash.delete and stash.delete.enabled then
        exports["tgiann-inventory"]:ClearInventory(stash.id)
    end
end

function CRUX.Inventory.GetItemsByName(source, ItemName)
    exports["tgiann-inventory"]:GetItemsByName(source, ItemName, nil)
end

function CRUX.Inventory.CountItem(source, ItemName, MetaData, ExactSearch)
    local count = exports["tgiann-inventory"]:GetItemCount(source, ItemName)
    if count and count > 0 then
        return 1
    else
        return 0
    end
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

function CRUX.Inventory.AddItem(source, item, amount, slot, metadata, reason)
    return exports["tgiann-inventory"]:AddItem(source, item, amount, slot, metadata, false)
end

function CRUX.Inventory.RemoveItem(source, item, amount, slot, reason)
    return exports["tgiann-inventory"]:RemoveItem(source, item, amount, slot, nil)
end

function CRUX.Inventory.CanAddItem(source, itemName, count)
  local canAdd = exports["tgiann-inventory"]:CanAddItem(source, itemName, count)
  return canAdd
end


return CRUX.Inventory