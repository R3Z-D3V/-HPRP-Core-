if not QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

CRUX.Inventory = {}

function CRUX.Inventory.OpenStash(StashId)
    local result = lib.callback.await('module:openInventory', false, StashId)
    if not result then return CRUX.Debug('^1[ERROR]^7 That inventory doesnt exists') end

    TriggerEvent("inventory:client:SetCurrentStash", StashId)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", StashId, result)
end

-- function fun.OpenCraft()
--     -- TODO
-- end

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