CRUX.Inventory = {}

function CRUX.Inventory.RegisterStash(stash)
    exports.ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.maxWeight)


    if stash.delete and stash.delete.enabled then
        exports.ox_inventory:ClearInventory(stash.id)
    end
end

function CRUX.Inventory.AddItem(source, item, amount, metadata, slot)
    -- Pass the metadata table directly without changing it
    return exports.ox_inventory:AddItem(source, item, amount, metadata, slot)
end

function CRUX.Inventory.RemoveItem(source, item, amount, metadata, slot)
    return exports.ox_inventory:RemoveItem(source, item, amount, metadata, slot)
end

function CRUX.Inventory.CountItem(source, itemName, metadata, exactSearch)
    return exports.ox_inventory:GetItemCount(source, itemName, metadata, exactSearch)
end

-- -- Add GetItem function for consistency with qb implementation
-- function CRUX.Inventory.GetItem(source, item)
--     local count = exports.ox_inventory:GetItemCount(source, item)
--     local metadata = exports.ox_inventory:GetItemMetadata(source, item)

--     if count > 0 then
--         return {
--             name = item,
--             amount = count,
--             info = metadata
--         }
--     end
--     return nil
-- end

-- -- Register callback for consistency with qb implementation
-- lib.callback.register('crux_lib:module:openInventory', function(source, invId)
--     -- ox_inventory handles stash access internally, so we just return true
--     return true
-- end)

local usableItemCallbacks = {}

function CRUX.Inventory.CreateUseableItem(itemName, cb)
    usableItemCallbacks[itemName] = cb
end

AddEventHandler('ox_inventory:usedItem', function(playerId, name, slotId, metadata)
    if Config.DebugScript then print(('[CRUX.Inventory] ox_inventory:usedItem event triggered for item: %s, slot: %s, source: %s'):format(name, tostring(slotId), tostring(playerId))) end
    local cb = usableItemCallbacks[name]
    if cb then
        if Config.DebugScript then print(('[CRUX.Inventory] Found callback for item: %s, executing...'):format(name)) end
        -- Construct a minimal item table for compatibility
        local item = {
            name = name,
            slot = slotId,
            info = metadata
        }
        cb(playerId, item)
    else
        if Config.DebugScript then print(('[CRUX.Inventory] No callback registered for item: %s'):format(name)) end
    end
end)

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

function CRUX.Inventory.RemoveStash(stashId)
    if not stashId then
        if Config.DebugScript then print('^1[ERROR]^7 Missing stash ID for RemoveStash') end
        return false
    end

    -- ox_inventory uses ClearInventory to clear a stash
    exports.ox_inventory:ClearInventory(stashId)
    if Config.DebugScript then print(('^2[INFO]^7 Stash %s cleared successfully'):format(stashId)) end
    return true
end

function CRUX.Inventory.GetStash(stashId)
    if not stashId then
        if Config.DebugScript then print('^1[ERROR]^7 Missing stash ID for GetStash') end
        return nil
    end

    -- ox_inventory exposes GetInventory for stash data
    local inventoryData = exports.ox_inventory:GetInventory(stashId)
    if Config.DebugScript then print(json.encode(inventoryData, {indent = true})) end
    return inventoryData
end

function CRUX.Inventory.CanAddItem(source, itemName, count)
  local canCarry = exports.ox_inventory:CanCarryItem(source, itemName, count)
  return canCarry
end

return CRUX.Inventory
