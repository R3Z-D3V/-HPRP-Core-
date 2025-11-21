CRUX.Inventory = {}

function CRUX.Inventory.OpenStash(StashId)
    local result = lib.callback.await(GetCurrentResourceName() .. ':module:openInventory', false, StashId)
    if not result then return CRUX.Debug('^1[ERROR]^7 That inventory doesnt exists') end
    StashId = string.gsub(StashId, "-", "")

    TriggerEvent("inventory:client:SetCurrentStash", "Stash_"..StashId)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Stash_"..StashId, result)
end

-- function fun.OpenCraft()
--     -- TODO
-- end

function CRUX.Inventory.GetAllItems()
    local itemsObjects = exports['qs-inventory']:GetItemList()
    if not itemsObjects then return CRUX.Debug('^1[ERROR]^7 There are no items') end
    return itemsObjects
end

function CRUX.Inventory.GetItemLabel(Item)
    local itemObject = exports['qs-inventory']:GetItemList()[Item]
    if not itemObject then return CRUX.Debug('^1[ERROR]^7 That item doesnt exists') end
    return itemObject.label
end

return CRUX.Inventory
