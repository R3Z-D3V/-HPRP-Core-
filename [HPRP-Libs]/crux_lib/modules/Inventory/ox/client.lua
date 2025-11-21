CRUX.Inventory = {}

function CRUX.Inventory.OpenStash(StashId)
    CRUX.Debug(('^2[CRUX.Inventory]^7 Opening stash with ID: %s'):format(StashId))
    exports.ox_inventory:openInventory('stash', StashId)
end

function CRUX.Inventory.GetAllItems()
    -- local itemObject = exports.ox_inventory:Items()
    local itemObject = exports.ox_inventory:GetPlayerItems()
    if not itemObject then return CRUX.Debug('^1[ERROR]^7 That item doesnt exists') end
    return itemObject
end

function CRUX.Inventory.GetPlayerItems()
    local itemObject = exports.ox_inventory:GetPlayerItems()
    if not itemObject then return CRUX.Debug('^1[ERROR]^7 That item doesnt exists') end
    return itemObject
end

function CRUX.Inventory.GetItemLabel(Item)
    local itemObject = exports.ox_inventory:Items(Item)
    if not itemObject then return CRUX.Debug('^1[ERROR]^7 That item doesnt exists') end
    return itemObject.label
end

return CRUX.Inventory
