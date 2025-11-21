
function CRUX.Input(Input)
    local inputs = {}
    for k, v in ipairs(Input.Inputs) do
        local input = {}
        if v.Type == "text" then
            input.type = "input"
        elseif input.type == "password" then
            input.type = "input"
            input.password = true
        else
            input.type = v.Type or "input"
        end

        input.default = v?.Default
        input.required = v?.Required
        input.label = v?.Text

        if v.Options then
            input.options = {}
            for k1, v1 in ipairs(v.Options) do
                table.insert(input.options, { value = v1.value, label = v1.label })
            end
        end
        table.insert(inputs, input)
    end

    local Dialog = lib.inputDialog(Input.Header, inputs)

    if not Dialog then return nil end

    local returnDialog = {}
    for k, v in ipairs(Input.Inputs) do
        returnDialog[v.Id] = Dialog[k]
    end

    return returnDialog
end

return CRUX.Input