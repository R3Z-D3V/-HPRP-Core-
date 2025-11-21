CRUX.Inventory = {}

if not QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

function CRUX.Inventory.OpenStash(StashId)
   TriggerServerEvent('burger:openInventory', StashId)
end

function CRUX.Inventory.GetAllItems()
    local playerData = QBCore.Functions.GetPlayerData().items
    if not playerData then return {} end
    return playerData
end


function CRUX.Inventory.GetItemLabel(Item)
    local itemObject = QBCore.Shared.Items[Item]
    if not itemObject then return CRUX.Debug('^1[ERROR]^7 That item doesnt exists') end
    return itemObject.label
end

return CRUX.Inventory