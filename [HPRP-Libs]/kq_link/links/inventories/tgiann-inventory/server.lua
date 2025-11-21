if Link.inventory ~= 'tgiann-inventory' and Link.inventory ~= 'tgiann' then
    return
end

function GetPlayerItemData(player, item, meta)
    exports["tgiann-inventory"]:GetItem(src, item, metadata, returnsAmount)
    return data or {}
end

function GetPlayerItemCount(player, item, meta)
    local data = GetPlayerItemData(player, item)
    return data.count or data.amount or 0
end

function AddPlayerItem(player, item, amount, meta)
    local success, response = exports["tgiann-inventory"]:AddItem(source, item, amount, slot, metadata, isClotheSlot)
    return success
end

function RemovePlayerItem(player, item, amount)
    amount = amount or 1
    
    local items = exports["tgiann-inventory"]:Search(src, search, item, metadata)
    if not items or #items == 0 then
        return false
    end

    local total = 0
    for _, itemData in ipairs(items) do
        total = total + itemData.count
    end
    if total < amount then return false end

    local metadata = {}
    local remaining = amount

    for _, itemData in ipairs(items) do
        if remaining <= 0 then break end

        local remove = math.min(itemData.count, remaining)
        if exports["tgiann-inventory"]:RemoveItem(source, item, amount, slot, metadata) then
            for i = 1, remove do
                table.insert(metadata, itemData.metadata or {})
            end
            remaining = remaining - remove
        end
    end

    return remaining == 0, metadata or {}
end

-- Stashes
local stashes = {}
function OpenCustomStash(player, stashId, label, slots, weight)
    if not stashes[stashId] then
        exports["tgiann-inventory"]:RegisterStash(invId, label, slots, maxweight, owner, groups, coords, blacklist, whitelist)
        stashes[stashId] = true
    end

    TriggerClientEvent('kq_link:client:ox_inventory:openStash', player, stashId)
end

function GetStashItems(stashId)
    if not stashes[stashId] then
        return {}
    end

    return exports["tgiann-inventory"]:GetInventoryItems(stashId)
end
--
