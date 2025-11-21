if not QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

CRUX.Inventory = {}

function CRUX.Inventory.OpenStash(StashId)
    TriggerServerEvent('burger:openInventory', StashId)
end

function CRUX.Inventory.GetAllItems()
    local playerData = QBCore.Functions.GetPlayerData().items
    if not playerData then return {} end
    return playerData
end

function CRUX.Inventory.GetPlayerItems()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if not PlayerData or not PlayerData.items then return {} end
    return PlayerData.items
end

function CRUX.Inventory.GetItemLabel(Item)
    local itemObject = QBCore.Shared.Items[Item]
    if not itemObject then return CRUX.Debug('^1[ERROR]^7 That item doesnt exists') end
    return itemObject.label
end

-- function CRUX.Inventory.UseItemForStash(itemName, stashId)
--     CRUX.Debug(('^2[INFO]^7 Client requesting to use item %s for stash %s'):format(itemName, stashId))
--     TriggerServerEvent('crux_lib:useItemForStash', itemName, stashId)
-- end

return CRUX.Inventory
