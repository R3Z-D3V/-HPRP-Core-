local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = '',
    ['testwebhook'] = '',
    ['playermoney'] = 'https://discord.com/api/webhooks/1075138157076566016/F6HZb3yiYwuC9peBuSw34ICYvYyoXtL2B6Xjp83WXOkoXu7r_ngUZ2kckWz63em4GTYb',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1075138315927433366/Z1DrVoH62daabqWaM0JwCes-ku07GXYMR1PmiZhyRhkJzHnIDPVMJZwFncCc5kGVE9l8',
    ['robbing'] = 'https://discord.com/api/webhooks/1075138437415440384/VeKmRZ8Gsdx57V4Tl-aE5ZuMJWeVhVQMkt4nymmwwmZH4lDZWYrNdEbXFKtzo_ojBWln',
    ['cuffing'] = '',
    ['drop'] = 'https://discord.com/api/webhooks/1075138632312176720/JSjCnefw3uQPEHxNL_O8ybqCSpn5cajotyozQd8aFpQXJHqlrBbmS__fSYZuURAyz1mx',
    ['trunk'] = 'https://discord.com/api/webhooks/1075138755985416295/wL1WFhIR_ZgSHARaYcXxmDjTFvmc7eO-GEDCQGpeiWIOTmOJudlRBpRAHQBYp8GePZpK',
    ['stash'] = 'https://discord.com/api/webhooks/1075138887460069437/vFihtqsGXxaB-1aAHDluiXbpi1uYhmX9EcC-uowTb2FeR7Fv7jFZnvhSOWonPRbMY05a',
    ['glovebox'] = 'https://discord.com/api/webhooks/1075138980372304025/QmHWRCmAeZIyEZWGtYnWnkJbHKewedzJI_3RkS07CvFNCWnOW9vCFy8qbIuyHVcOBg0K',
    ['banking'] = 'https://discord.com/api/webhooks/1075139260904132678/6K7o7EVy8aZwKqLdfgc9AJLDaQ57ClOKavpGkReungi0dJ0oCOhhZlKYy4MaXfmQd9oQ',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/1075139140603105443/0SZzfd2KDkBRotKCdr6Znnen9H5sqBbeVWjMiubrBOF1lS5NHFuQ4bGSEC4XJpBeSk3C',
    ['vehicleupgrades'] = '',
    ['shops'] = '',
    ['dealers'] = '',
    ['storerobbery'] = '',
    ['bankrobbery'] = '',
    ['powerplants'] = '',
    ['death'] = 'https://discord.com/api/webhooks/1075139352167985333/uOy1LaaRAw4NMirxXdw7J5qgo8BerD7KWiRHbxJnjkJzQT9TxgacscScitfz2f7SaPUL',
    ['joinleave'] = '',
    ['ooc'] = '',
    ['report'] = '',
    ['me'] = '',
    ['pmelding'] = '',
    ['112'] = '',
    ['bans'] = '',
    ['anticheat'] = '',
    ['weather'] = '',
    ['moneysafes'] = '',
    ['bennys'] = '',
    ['bossmenu'] = '',
    ['robbery'] = '',
    ['casino'] = '',
    ['traphouse'] = '',
    ['911'] = '',
    ['palert'] = '',
    ['house'] = '',
    ['qbjobs'] = '',
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'QBCore Logs',
                ['icon_url'] = 'https://media.discordapp.net/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png?width=670&height=670',
            },
        }
    }
    PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'QB Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'QB Logs', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
