---@alias NotificationPosition 'top' | 'top-right' | 'top-left' | 'bottom' | 'bottom-right' | 'bottom-left' | 'center-right' | 'center-left'
---@alias NotificationType 'info' | 'warning' | 'success' | 'error'
---@alias IconAnimationType 'spin' | 'spinPulse' | 'spinReverse' | 'pulse' | 'beat' | 'fade' | 'beatFade' | 'bounce' | 'shake'

---@class NotifyProps
---@field id? string
---@field title? string
---@field description? string
---@field duration? number
---@field showDuration? boolean
---@field position? NotificationPosition
---@field type? NotificationType
---@field style? { [string]: any }
---@field icon? string | { [1]: IconProp, [2]: string }
---@field iconAnimation? IconAnimationType
---@field iconColor? string
---@field alignIcon? 'top' | 'center'
---@field sound? { bank?: string, set: string, name: string }

local settings = require 'resource.settings'

---@param data DefaultNotifyProps
---@return boolean?
function notification(time,title,description,type,data)
    exports["tgiann-lumihud"]:Notif(description, type, 5500)
end

---`client`
---@param data NotifyProps
---@diagnostic disable-next-line: duplicate-set-field
function lib.notify(data)
    notification ( tonumber(data.duration), data.title, data.description, data.type, data)
end

---@class DefaultNotifyProps
---@field title? string
---@field description? string
---@field duration? number
---@field position? NotificationPosition
---@field status? 'info' | 'warning' | 'success' | 'error'
---@field id? number

---@param data DefaultNotifyProps
function lib.defaultNotify(data)
    notification ( tonumber(data.duration), data.title, data.description, data.type, data)
end

RegisterNetEvent('ox_lib:notify', lib.notify)
RegisterNetEvent('ox_lib:defaultNotify', lib.defaultNotify)
