function CRUX.Input(Input)
    local inputs = {}
    for k, v in ipairs(Input.Inputs) do
        local input = {}
        input.type = v.Type or "text"
        input.text = v.Text
        input.name = v.Id
        input.isRequired = v.Required
        input.default = v.Default
        if v.Options then
            input.options = {}
            for k1, v1 in ipairs(v.Options) do
                table.insert(input.options, { value = v1.value, text = v1.label})
            end
        end
        table.insert(inputs, input)
    end

    return exports['qb-input']:ShowInput({
        header = Input.Header,
        submitText = Input.SubmitText or "Submit",
        inputs = inputs,
    })
end

return CRUX.Input