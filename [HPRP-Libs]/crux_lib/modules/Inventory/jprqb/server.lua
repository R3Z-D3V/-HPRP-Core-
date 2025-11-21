local RegisteredStashs = {}

function CRUX.Inventory.RegisterStash(stash)
     local src = source
    if RegisteredStashs[stash.id] then
        print(('^3[WARN]^7 Stash id %s was overrided'):format(stash.id))
    end
    RegisteredStashs[stash.id] = {
        name = stash.id,
        label = stash.label, -- Store label if provided, fallback to id
        slots = stash.slots,
        maxweight = stash.maxWeight
    }

    local result = nil
    if stash.delete and stash.delete.enabled then
        result = exports['jpr-inventory']:ClearInventory(stash.id)
    end
    return result
end

RegisterServerEvent('burger:openInventory')
AddEventHandler('burger:openInventory', function(identifier)
    local src = source
    local stash = RegisteredStashs[identifier]
    if stash then
        local result = exports['jpr-inventory']:OpenInventory(src, {
            name = stash.name,
            label = stash.label, -- Store label if provided, fallback to id
            slots = stash.slots,
            maxweight = stash.maxweight
        })
        return result
    else
        local result = exports['jpr-inventory']:OpenInventory(src, identifier)
        return result
    end
end)


function CRUX.Inventory.GetItemsByName(source, ItemName)
    return exports['jpr-inventory']:GetItemsByName(source, ItemName)
end

function CRUX.Inventory.CountItem(source, ItemName, MetaData)
  local hasItem = exports['jpr-inventory']:HasItem(source, ItemName, 1)
  if hasItem then
    return 1
  end
  return 0
end

function CRUX.Inventory.CanAddItem(source, itemName, count)
  local canAdd = exports["jpr-inventory"]:CanAddItem(source, itemName, count)
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

function CRUX.Inventory.AddItem(source, item, amount, slot, metadata, reason)
    return exports['jpr-inventory']:AddItem(source, item, amount, slot, metadata)
end

function CRUX.Inventory.RemoveItem(source, item, amount, slot, reason)
    return exports['jpr-inventory']:RemoveItem(source, item, amount, slot)
end


