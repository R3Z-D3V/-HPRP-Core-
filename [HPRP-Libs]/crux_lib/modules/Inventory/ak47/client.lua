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
    local itemsObjects = exports['ak47_inventory']:Items()
    if not itemsObjects then return CRUX.Debug('^1[ERROR]^7 There are no items') end
    return itemsObjects
end

function CRUX.Inventory.GetItemLabel(Item)
    local itemObject = exports['ak47_inventory']:GetItemLabel(Item)
    return itemObject
end

return CRUX.Inventory