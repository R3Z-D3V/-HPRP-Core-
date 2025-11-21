

local Utils = {}

function Utils.Debug(data)
    print(('[ %s : DEBUG]'):format(CRUX.name))
    if data and type(data) == 'table' then
        print(json.encode(data, {indent = true, exception = function(reason, v) return reason end}))
    else
        print(data)
    end
    print('[ END DEBUG ]')
end


return Utils
