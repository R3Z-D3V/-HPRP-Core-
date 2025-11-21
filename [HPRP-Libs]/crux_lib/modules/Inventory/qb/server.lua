if not QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

CRUX.Inventory = {}

local RegisteredStashs = {}

function CRUX.Inventory.RegisterStash(stash)
    if RegisteredStashs[stash.id] then
        print(('^3[WARN]^7 Stash id %s was overrided'):format(stash.id))
    end
    RegisteredStashs[stash.id] = {
        maxweight = stash.maxWeight,
        slots = stash.slots,
    }
    if stash.delete and stash.delete.enabled then
        exports['qb-inventory']:ClearInventory(stash.id)
    end
end

function CRUX.Inventory.CreateUseableItem(item, func)
    QBCore.Functions.CreateUseableItem(item, func)
end

function CRUX.Inventory.UseItemForStash(itemName, stashId)
    QBCore.Functions.CreateUseableItem(itemName, function(source, item)
        print(('^2[INFO]^7 Player %s used item %s for stash %s'):format(source, itemName, stashId))

        if RegisteredStashs[stashId] then
            print(('^2[INFO]^7 Stash %s found, opening inventory'):format(stashId))
            TriggerClientEvent('crux_lib:openStash', source, stashId)
            return true
        else
            print(('^1[ERROR]^7 Stash %s not found'):format(stashId))
            return false
        end
    end)
end

function CRUX.Inventory.GetItemsByName(source, ItemName)
    -- REQUEST TO FRAMEWORK
end

function CRUX.Inventory.CountItem(source, ItemName, MetaData)
    local hasItem = exports['qb-inventory']:HasItem(source, ItemName, MetaData)
    if hasItem then
        -- QBCore can return item count with an additional parameter
        -- return exports['qb-inventory']:GetItemCount(source, ItemName, MetaData)
        -- Or simply return 1 if HasItem is true (if QBCore doesn't have GetItemCount)
        return 1
    end
    return 0
end

function CRUX.Inventory.AddItem(source, item, amount, slot, metadata, reason)
    local player = QBCore.Functions.GetPlayer(source)
    return player.Functions.AddItem(item, amount, slot, metadata)
end

function CRUX.Inventory.RemoveItem(source, item, amount, slot, reason)
    local player = QBCore.Functions.GetPlayer(source)
    return player.Functions.RemoveItem(item, amount, slot)
end

function CRUX.Inventory.CanAddItem(source, itemName, count)
  local canAdd = exports['qb-inventory']:CanAddItem(source, itemName, count)
  return canAdd
end


lib.callback.register('module:openInventory', function(source, invId)
    return RegisteredStashs[invId]
end)

return CRUX.Inventory