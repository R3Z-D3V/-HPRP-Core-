CRUX.Inventory = {}

if not QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

function CRUX.Inventory.OpenStash(StashId)
    -- Remove spaces and hyphens from StashId
    local cleanedStashId = tostring(StashId):gsub("[%s%-]", "")
    local result = lib.callback.await(GetCurrentResourceName() .. GetCurrentResourceName() .. ':module:openInventory', source, cleanedStashId)
    -- CRUX.Debug('^5[DEBUG]^7 OpenStash callback result:', json.encode(result))
    -- CRUX.Debug('^5[DEBUG]^7 StashId:', cleanedStashId)

    TriggerEvent("ps-inventory:client:SetCurrentStash", cleanedStashId)

    TriggerServerEvent("ps-inventory:server:OpenInventory", "stash", cleanedStashId, result)
end

-- function fun.OpenCraft()
--     -- TODO
-- end

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

return CRUX.Inventory