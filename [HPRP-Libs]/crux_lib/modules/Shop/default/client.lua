local CRUX = {}

---OpenShop
---@param ShopId string
function CRUX.OpenShop(ShopId)
    local result = lib.callback.await(GetCurrentResourceName() .. ':module:openShop', source, ShopId)
    if not result then return CRUX.Debug('^1[ERROR]^7 That shop doesnt exists') end

    local items = {}
    local allItems = Lib.inventory.GetAllItems() -- Get all items for image handling

    for k, v in ipairs(result.items) do
        local itemInfo = allItems[v.name]
        local image

        -- Handle image based on inventory type
        if Config.Inventory == "ox" then
            image = itemInfo and itemInfo.client.image
        else
            image = Config.InventoryImages .. v.name .. '.png'
        end

        local item = {
            Header = allFuncs.inventory.GetItemLabel(v.name) or v.name,
            Icon = image,
            Metadata = {
                { label = 'Price', value = "$"..v.price },
                { label = 'Amount', value = v.amount },
            },
            Event = 'shop:buyItem',
            Args = {
                { item = v.name, price = v.price }
            }
        } --[[@as MenuItem]]

        items[k] = item
    end

    Lib.interface.menu({
        Id = ShopId,
        Title = Config.LocalessUtils.Shop.Label,
        Items = items
    }--[[@as Menu]])
end

RegisterNetEvent('shop:buyItem', function(args)
    if not args or type(args) ~= "table" then return end
    local item = args[1].item
    local price = args[1].price

    local result = Lib.interface.input({
        Header = "How many do you want?",
        Inputs = {
            {
                Id = "amount",
                Text = "Amount",
                Type = "number",
                Required = true,
            }
        },
        SubmitText = "Buy"
    } --[[@as Input]])

    if not result then return end

    local amount = tonumber(result.amount) -- Ensure the amount is a number

    if not amount or amount <= 0 then
        return allFuncs.interface.notify({
            title = 'Shop',
            description = 'Invalid amount',
            type = 'error',
        } --[[@as Notify]])
    end

    local succ = lib.callback.await(GetCurrentResourceName() .. ':module:buyItem', false, item, amount, price)
end)

return CRUX
