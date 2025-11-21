function CRUX.Menu(Menu)
  local items = {}
  if Menu.Title then
      table.insert(items, {header = Menu.Title, icon = Menu?.Icon, isMenuHeader = true})
  end
  for _, v in ipairs(Menu.Items) do
      local Item = {}
      Item.header = v?.Header
      Item.txt = v?.Text or ""
      Item.icon = v?.Icon
      if v.Event then
          Item.params = {
              event = v.Event,
              args = v.Args
          }
      end
      if v.Metadata then
          local text = ''
          for _, m in ipairs(v.Metadata) do
              text = text .. m.label .. ": " .. m.value .. "<br>"
          end
          Item.txt = Item.txt .. "<br>" .. text
      end

      table.insert(items, Item)
  end
  exports['qb-menu']:openMenu(items)
end

return CRUX.Menu