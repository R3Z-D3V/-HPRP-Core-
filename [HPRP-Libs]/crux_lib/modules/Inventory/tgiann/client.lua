--https://docs.tgiann.com/scripts/tgiann-inventory/exports/client#getitemlist-or-items

CRUX.Inventory = {}

function CRUX.Inventory.OpenStash(StashId)
    exports["tgiann-inventory"]:OpenInventory('stash', StashId)
end

function CRUX.Inventory.GetAllItems()
    local itemsObjects = exports["tgiann-inventory"]:Items()
    if not itemsObjects then return CRUX.Debug('^1[ERROR]^7 There are no items') end
    return itemsObjects
end

function CRUX.Inventory.GetItemLabel(Item)
    local itemLabel = exports["tgiann-inventory"]:GetItemLabel(Item)
    if not itemLabel then return CRUX.Debug('^1[ERROR]^7 That item doesnt exists') end
    return itemLabel
end

return CRUX.Inventory
