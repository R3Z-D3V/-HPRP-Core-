CRUX.Inventory = {}

function CRUX.Inventory.OpenStash(StashId)
   TriggerServerEvent('burger:openInventory', StashId)
end

function CRUX.Inventory.GetAllItems(source) -- It's very likely you need the player's source ID here
    CRUX.Debug("Retrieving all items...")
    
    -- 1. Get the master list of all possible items
    local itemsObjects = exports.origen_inventory:GetItems()
    
    if not itemsObjects or next(itemsObjects) == nil then 
        CRUX.Debug('^1[ERROR]^7 There are no item definitions found.')
        return {}
    end
    
    -- 2. Create a list of just the item names from the master list
    local itemNames = {}
    for itemName, _ in pairs(itemsObjects) do
        table.insert(itemNames, itemName)
    end
    
    -- 3. Now, search for the count of those specific items in the player's inventory
    local itemCounts = nil
    local success, result = pcall(function()
        -- Pass the list of all item names and the player source to the search function
        return exports.origen_inventory:Search('count', itemNames, source) 
    end)
    
    if success and result then
        itemCounts = result
    else
        CRUX.Debug("^1[ERROR]^7 pcall failed when searching for item counts. Reason: " .. tostring(result))
        CRUX.Debug("^3[WARNING]^7 Could not retrieve item counts, setting all counts to 0.")
    end
    
    -- 4. Add the retrieved count to each item object
    for itemName, itemData in pairs(itemsObjects) do
        itemData.count = (itemCounts and itemCounts[itemName]) or 0
    end
    
    CRUX.Debug("Successfully retrieved items with their counts.")
    -- CRUX.Debug(json.encode(itemsObjects)) -- You can uncomment this for debugging
    return itemsObjects
end

function CRUX.Inventory.GetItemLabel(Item)
    CRUX.Debug("Looking up item:", Item) -- Debug CRUX.Debug
    local itemObject = exports.origen_inventory:Items(Item)
    if not itemObject then
        CRUX.Debug('^1[ERROR]^7 That item doesnt exists:', Item)
        return
    end
    return itemObject.label
end

return CRUX.Inventory