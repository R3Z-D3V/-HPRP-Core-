-- https://codem.gitbook.io/codem-documentation/m-series/minventory-remake/exports-and-commands

CRUX.Inventory = {}

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
    local stashItems = exports['codem-inventory']:GetStashItems(stash.id)
    print("Stash items to remove:", json.encode(stashItems))

    if stashItems and next(stashItems) ~= nil then -- A better way to check if a table is not empty

        for _, itemData in pairs(stashItems) do
            if itemData and itemData.name and itemData.amount then
                -- Try removing the item WITHOUT the slot parameter.
                local success = exports['codem-inventory']:RemoveItem(stash.id, itemData.name, itemData.amount)
                
                print("Attempted to remove " .. itemData.amount .. "x " .. itemData.name .. ". Success: " .. tostring(success))
            end
        end
    end
end
end

function CRUX.Inventory.GetItemsByName(source, ItemName)
    return exports['codem-inventory']:GetItemsByName(source, ItemName)
end

function CRUX.Inventory.CountItem(source, ItemName, MetaData, ExactSearch)
    local count = exports['codem-inventory']:GetItemsTotalAmount(source, ItemName)
    return count or 0
end

function CRUX.Inventory.AddItem(source, item, amount, slot, metadata, reason)
    return exports['codem-inventory']:AddItem(source, item, amount, slot, metadata)
end

function CRUX.Inventory.RemoveItem(source, item, amount, slot, reason)
    return exports['codem-inventory']:RemoveItem(source, item, amount, slot)
end

function CRUX.Inventory.CanAddItem(source, itemName, count)
--   local canAdd = exports.core_inventory:canCarry(source, itemName, count)
  return true
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

RegisterServerEvent('crux:getitemlabel')
AddEventHandler('crux:getitemlabel', function(itemname)
    local label = exports['codem-inventory']:GetItemLabel(itemname)
    return label
end)


lib.callback.register(GetCurrentResourceName() .. ':module:openInventory', function(source, invId)
    return RegisteredStashs[invId]
end)

return CRUX.Inventory