if not QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

CRUX.Inventory = {}

function CRUX.Inventory.OpenStash(StashId)
  local result = lib.callback.await(GetCurrentResourceName() .. ':module:openInventory', source, StashId)
  if not result then
    return
  end

  if result.label and result.maxweight and result.slots then
    return exports['ak47_inventory']:OpenInventory({
      identifier = StashId,
      label = result.label,
      type = 'stash',
      maxweight = result.maxweight,
      slots = result.slots
    })
  else
    return exports['ak47_inventory']:OpenInventory(StashId)
  end
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