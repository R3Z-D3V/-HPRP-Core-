if not QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

CRUX.Inventory = {}

local RegisteredStashs = {}

function CRUX.Inventory.RegisterStash(stash)
     local src = source
    if RegisteredStashs[stash.id] then
        if Config.DebugScript then print(('^3[WARN]^7 Stash id %s was overrided'):format(stash.id)) end
    end
    
    RegisteredStashs[stash.id] = {
        name = stash.id,
        label = stash.label, -- Store label if provided, fallback to id
        slots = stash.slots,
        maxweight = stash.maxWeight
    }

    local result = nil
    if stash.delete and stash.delete.enabled then
        -- Fetch stash items
        local stashItems = nil
        TriggerEvent("ps-inventory:server:GetStashItems", src, stash.id, function(data)
            stashItems = data
        end)

        if stashItems and type(stashItems) == "table" then
            for slot, itemData in pairs(stashItems) do
                if itemData and itemData.name and itemData.amount then
                    -- Remove each item from the stash using CRUX.Inventory.RemoveItem
                    CRUX.Inventory.RemoveItem(stash.id, itemData.name, itemData.amount, slot)
                end
            end
        end

    end
    return result
end


function CRUX.Inventory.GetItemsByName(source, ItemName)
    -- REQUEST TO FRAMEWORK
end

function CRUX.Inventory.GetStash(stashId)
    local src = source

    if not stashId then
        if Config.DebugScript then print('^1[ERROR]^7 Missing stash ID for GetStash') end
        return nil
    end

    local inventoryData = nil
    TriggerEvent("ps-inventory:server:GetStashItems", src, stashId, function(data)
        inventoryData = data
    end)
    if Config.DebugScript then print(("^5[DEBUG]^7 GetStash called for stashId: %s, inventoryData: %s"):format(stashId, json.encode(inventoryData))) end
    return inventoryData
end

function CRUX.Inventory.CountItem(source, ItemName, MetaData)
  if Config.DebugScript then print(ItemName) end

    local hasItem = TriggerEvent("ps-inventory:server:HasItem", source, ItemName, MetaData)

    if Config.DebugScript then print(("^5[DEBUG]^7 CountItem called for item: %s, hasItem: %s"):format(ItemName, tostring(hasItem))) end
    if hasItem then
        -- QBCore can return item count with an additional parameter
        -- return exports['ps-inventory']:GetItemCount(source, ItemName, MetaData)
        -- Or simply return 1 if HasItem is true (if QBCore doesn't have GetItemCount)
        return 1
    end
    return 0
end

function CRUX.Inventory.AddItem(source, item, amount, slot, metadata, reason)
    return TriggerEvent("ps-inventory:server:AddItem", source, item, amount, slot, metadata, reason)
end

function CRUX.Inventory.RemoveItem(source, item, amount, slot, metadata, reason)
    return TriggerEvent("ps-inventory:server:RemoveItem", source, item, amount, slot, metadata, reason)
end

function CRUX.Inventory.CanAddItem(source, itemName, count)
--   local canAdd = exports['ak47_inventory']:CanAddItem(source, itemName, count)
  return true
end


function CRUX.Inventory.CreateUseableItem(item, func)
    allFuncs.framework.CreateUseableItem(item, func)
end

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

lib.callback.register(GetCurrentResourceName() .. GetCurrentResourceName() .. ':module:openInventory', function(source, invId)
    return RegisteredStashs[invId]
end)

return CRUX.Inventory
