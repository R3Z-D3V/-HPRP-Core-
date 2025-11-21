CRUX.Inventory = {}

function CRUX.Inventory.OpenStash(StashId)
   TriggerServerEvent('burger:openInventory', StashId)
end


function CRUX.Inventory.GetAllItems()
    local itemsObjects = exports.core_inventory:getInventory()
    if not itemsObjects then return CRUX.Debug('^1[ERROR]^7 There are no items') end
    return itemsObjects
end

function CRUX.Inventory.GetItemLabel(Item)
    TriggerServerEvent('burger:getItemLabel', Item)
end

return CRUX.Inventory