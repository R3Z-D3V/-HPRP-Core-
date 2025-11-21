
Menus = {}

function CRUX.Menu(Menu)
    if Menus[Menu.Id] == nil or not Static then
        local items = {}
        for _, v in ipairs(Menu.Items) do
            ---@type (ContextMenuItem)
            local Item = {}
            Item.title = v.Header
            Item.description = v?.Text
            Item.icon = v?.Icon
            Item.args = v?.Args
            Item.event = v?.Event
            Item.metadata = v?.Metadata
            table.insert(items, Item)
        end
        lib.registerContext({
            id = Menu.Id,
            title = Menu.Title,
            options = items,
        })
        Menus[Menu.Id] = true
    end
    lib.showContext(Menu.Id)
end

return CRUX.Menu