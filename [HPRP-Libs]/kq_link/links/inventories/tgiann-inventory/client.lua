RegisterNetEvent('kq_link:client:ox_inventory:openStash')
AddEventHandler('kq_link:client:ox_inventory:openStash', function(stashId)
    exports["tgiann-inventory"]:OpenInventory('stash', { id = stashId })
end)
