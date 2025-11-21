fx_version 'cerulean'
game 'gta5'

lua54 'yes'

Description 'A library of functions.'
Version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'resource/*.lua',
    'ResourceName.lua'
}

client_scripts {
    'resource/client/client.lua',
}

server_scripts {
    'resource/server/server.lua',
}

files {
    'init.lua',
    'modules/**/*.lua',
    'modules/**/**/*.lua',
}

escrow_ignore {
	'ResourceName.lua',
    'modules/**/*.lua',
}
dependency '/assetpacks'