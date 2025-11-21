-- https://codem.gitbook.io/codem-documentation/m-series/minventory-remake/exports-and-commands

CRUX.Inventory = {}

function CRUX.Inventory.OpenStash(StashId)
    local result = lib.callback.await(GetCurrentResourceName() .. ':module:openInventory', source, StashId)
    if not result then return CRUX.Debug('^1[ERROR]^7 That inventory doesnt exists') end

    TriggerServerEvent('codem-inventory:server:openstash', StashId, result.slot, result.maxweight, result.label)
end

function CRUX.Inventory.GetAllItems()
    return exports['codem-inventory']:GetItemList()
end

function CRUX.Inventory.GetItemLabel(Item)
   return TriggerServerEvent('crux:getitemlabel', Item)
end

return CRUX.Inventory
