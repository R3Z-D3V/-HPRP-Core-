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
        exports.core_inventory:clearInventory(stash.id)
    end
end

RegisterServerEvent('burger:openInventory')
AddEventHandler('burger:openInventory', function(identifier)
    local src = source
    local result = exports.core_inventory:openInventory(src, identifier, 'stash', nil, nil, false, nil, false)
    return result
end)

RegisterServerEvent('burger:getItemLabel')
AddEventHandler('burger:getItemLabel', function(itemName)
    local src = source
    local result = exports.core_inventory:getItemLabel(src, itemName)
    return result.label
end)

function CRUX.Inventory.GetItemsByName(source, ItemName)
    return exports.core_inventory:getItem(source, ItemName)
end

function CRUX.Inventory.CountItem(source, ItemName, MetaData)
  local item = exports.core_inventory:getItemCount(source, ItemName)
  return item or 0
end

function CRUX.Inventory.AddItem(source, item, amount, slot, metadata, reason)
    return exports.core_inventory:addItem(source, item, amount, slot, metadata)
end

function CRUX.Inventory.RemoveItem(source, item, amount, slot, reason)
    return exports.core_inventory:removeItem(source, item, amount, slot)
end

function CRUX.Inventory.CanAddItem(source, itemName, count)
  local canAdd = exports.core_inventory:canCarry(source, itemName, count)
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


