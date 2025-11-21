-- Use the global QBCore from init.lua or get it if not available
if not QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

CRUX.Inventory = {}

local RegisteredStashs = {}

function CRUX.Inventory.RegisterStash(stash)
    if RegisteredStashs[stash.id] then
        if Config.DebugScript then print(('^3[WARN]^7 Stash id %s was overrided'):format(stash.id)) end
    end

    -- Store the stash in RegisteredStashs table
    RegisteredStashs[stash.id] = stash

    exports['qb-inventory']:CreateInventory(stash.id, {
        label = stash.label,
        maxweight = stash.maxWeight,
        slots = stash.slots
    })

    if stash.delete and stash.delete.enabled then
        exports['qb-inventory']:ClearStash(stash.id)
    end
end

function CRUX.Inventory.RemoveStash(stashId)
    if not stashId then
        if Config.DebugScript then print('^1[ERROR]^7 Missing stash ID for RemoveStash') end
        return false
    end

    if RegisteredStashs[stashId] then
        exports['qb-inventory']:ClearStash(stashId)
        RegisteredStashs[stashId] = nil
        if Config.DebugScript then print(('^2[INFO]^7 Stash %s cleared successfully'):format(stashId)) end
        return true
    else
        if Config.DebugScript then print(('^3[WARN]^7 Stash %s not found in registered stashes'):format(stashId)) end
        return false
    end
end

function CRUX.Inventory.GetStash(stashId)
    if not stashId then
        if Config.DebugScript then print('^1[ERROR]^7 Missing stash ID for GetStash') end
        return nil
    end

    local inventoryData = exports['qb-inventory']:GetInventory(stashId)
    return inventoryData
end

function CRUX.Inventory.CreateUseableItem(item, func)
    QBCore.Functions.CreateUseableItem(item, func)
end

RegisterServerEvent('burger:openInventory')
AddEventHandler('burger:openInventory', function(identifier)
    local src = source
    local result = exports['qb-inventory']:OpenInventory(src, identifier)
    return result
end)


function CRUX.Inventory.UseItemForStash(itemName, stashId)
    QBCore.Functions.CreateUseableItem(itemName, function(source, item)
        if Config.DebugScript then print(('^2[INFO]^7 Player %s used item %s for stash %s'):format(source, itemName, stashId)) end

        if RegisteredStashs[stashId] then
            if Config.DebugScript then print(('^2[INFO]^7 Stash %s found, opening inventory'):format(stashId)) end
            TriggerClientEvent('crux_lib:openStash', source, stashId)
            return true
        else
            if Config.DebugScript then print(('^1[ERROR]^7 Stash %s not found'):format(stashId)) end
            return false
        end
    end)
end

-- QB Inventory specific functions
function CRUX.Inventory.AddItem(source, item, count, metadata)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        return Player.Functions.AddItem(item, count, nil, metadata)
    end
    return false
end

function CRUX.Inventory.RemoveItem(source, item, count, metadata)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        return Player.Functions.RemoveItem(item, count, nil, metadata)
    end
    return false
end

function CRUX.Inventory.GetItem(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        return Player.Functions.GetItemByName(item)
    end
    return nil
end

function CRUX.Inventory.CountItem(source, ItemName, MetaData)
    local hasItem = exports['qb-inventory']:HasItem(source, ItemName, MetaData)
    if hasItem then
        -- QBCore can return item count with an additional parameter
        return exports['qb-inventory']:GetItemCount(source, ItemName)
        -- -- Or simply return 1 if HasItem is true (if QBCore doesn't have GetItemCount)
        -- return 1
    end
    return 0
end

function CRUX.Inventory.CanAddItem(source, itemName, count)
  local canAdd = exports['qb-inventory']:CanAddItem(source, itemName, count)
  return canAdd
end

-- Fix callback registration to use proper resource name
lib.callback.register('crux_lib:module:openInventory', function(source, invId)
    return RegisteredStashs[invId]
end)

return CRUX.Inventory
