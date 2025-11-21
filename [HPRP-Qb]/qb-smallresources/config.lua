Config = {}
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

-- To make this simple. Everything you need is in the config, except for discord, weapon drops, vehicle classes for cruise, hands up disabled keys, and recoil


Config.Binoculars = {
    fov_max = 70.0,
    fov_min = 5.0, -- max zoom level (smaller fov is more zoom)
    zoomspeed = 10.0, -- camera zoom speed
    speed_lr = 8.0, -- speed by which the camera pans left-right
    speed_ud = 8.0, -- speed by which the camera pans up-down
    storeBinoclarKey = 177
}

-- Whether to enable or disable dispatch services
Config.DispatchServices = {
    [1] = false, -- Police Vehicles
    [2] = false, -- Police Helicopters
    [3] = false, -- Fire Department Vehicles
    [4] = false, -- Swat Vehicles
    [5] = false, -- Ambulance Vehicles
    [6] = false, -- Police Motorcycles
    [7] = false, -- Police Backup
    [8] = false, -- Police Roadblocks
    [9] = false, -- PoliceAutomobileWaitPulledOver
    [10] = false, -- PoliceAutomobileWaitCruising
    [11] = false, -- Gang Members
    [12] = false, -- Swat Helicopters
    [13] = false, -- Police Boats
    [14] = false, -- Army Vehicles
    [15] = false, -- Biker Backup
}

-- Enable or disable the wanted level
Config.EnableWantedLevel = false

-- To Set This Up visit https://forum.cfx.re/t/how-to-updated-discord-rich-presence-custom-image/157686
Config.Discord = {
    ["IsEnabled"] = false, -- If set to true, then discord rich presence will be enabled
    ["ApplicationId"] = '00000000000000000', -- The discord application id
    ["IconLarge"] = 'logo_name', -- The name of the large icon
    ["IconLargeHoverText"] = 'This is a Large icon with text', -- The hover text of the large icon
    ["IconSmall"] = 'small_logo_name', -- The name of the small icon
    ["IconSmallHoverText"] = 'This is a Small icon with text', -- The hover text of the small icon
    ["UpdateRate"] = 60000, -- How often the player count should be updated
    ["ShowPlayerCount"] = true, -- If set to true the player count will be displayed in the rich presence
    ["MaxPlayers"] = 128, -- Maximum amount of players
    ["Buttons"] = {
        {
            text = 'First Button!',
            url = 'fivem://connect/localhost:30120'
        },
        {
            text = 'Second Button!',
            url = 'fivem://connect/localhost:30120'
        }
    }
}

Config.Density = {
    ['parked'] = 0.6,
    ['vehicle'] = 0.6,
    ['multiplier'] = 0.6,
    ['peds'] = 0.6,
    ['scenario'] = 0.6,
}

Config.Stun = {
    active = false,
    min = 4000,
    max = 7000
}

Config.Cruise = 'mp/h'
Config.IdleCamera = falsee
Config.disableHandsupControls = {24, 25, 47, 58, 59, 63, 64, 71, 72, 75, 140, 141, 142, 143, 257, 263, 264}
Config.DisableAmbience = false -- Disabled distance sirens, distance car alarms, etc
Config.HarnessUses = 20
Config.DamageNeeded = 100.0 -- vehiclepush 0-1000
Config.EnableProne = false -- prone isnt recomended at this time
Config.MapText = "HOLLOWPOINT" -- This is the name / text shown above the map

Config.Disable = {
    disableHudComponents = {1, 2, 3, 4, 6, 7, 8, 9, 13, 19, 20, 21, 22}, -- Hud Components: https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
    disableControls = {37}, -- Controls: https://docs.fivem.net/docs/game-references/controls/
    displayAmmo = false -- false disables ammo display
}

Config.ConsumablesEat = {

    ["sandwich"] = math.random(35, 54),
    ["tosti"] = math.random(40, 50),
    ["twerks_candy"] = math.random(35, 54),
    ["snikkel_candy"] = math.random(40, 50),
    ["irishpub_banana_nut"] = math.random(20, 40),
    ["irishpub_chocolatecup"] = math.random(20, 40),
    ["irishpub_strawberrycup"] = math.random(20, 40),
    ["breadsticks"] = math.random(35, 54),
    ["mozzarella-carrozza"] = math.random(35, 54),
    ["polpette-della-nonna"] = math.random(35, 54),
    ["garlic-bread"] = math.random(35, 54),
    ["prawn-cocktail"] = math.random(35, 54),
    ["veal-milanese"] = math.random(35, 54),
    ["fiorentina"] = math.random(35, 54),
    ["ravioli"] = math.random(35, 54),
    ["spaghetti-carbonara"] = math.random(35, 54),
    ["margherita-pizza"] = math.random(35, 54),
    ["pepperoni-pizza"] = math.random(35, 54),
    ["hawaiian-pizza"] = math.random(35, 54),
    ["vegetable-pizza"] = math.random(35, 54),
    ["gelato"] = math.random(35, 54),
    ["fudge-cake"] = math.random(35, 54),
    ["tiramisu"] = math.random(35, 54),
    ["cheesecake"] = math.random(35, 54),
    ["panna-cotta"] = math.random(35, 54),
    ["fries"] = math.random(35, 54),
    ["mashed-potato"] = math.random(35, 54),
    ["salad"] = math.random(35, 54),
}

Config.ConsumablesDrink = {
    ["water_bottle"] = math.random(35, 54),
    ["kurkakola"] = math.random(35, 54),
    ["coffee"] = math.random(40, 50),
    ["irishpub_berry_hydrating"] = math.random(20, 40),
    ["irishpub_green_dream"] = math.random(20, 40),
    ["irishpub_island_breeze"] = math.random(20, 40),
    ["irishpub_just_peachy"] = math.random(20, 40),
    ["irishpub_watermelon_dream"] = math.random(20, 40),
    ["irishpub_ban_straw_juice"] = math.random(20, 40),
    ["irishpub_banana_juice"] = math.random(20, 40),
    ["irishpub_kiwi_juice"] = math.random(20, 40),
    ["irishpub_strawberry_juice"] = math.random(20, 40),
    ["irishpub_orange_juice"] = math.random(20, 40),
    ["americano"] = math.random(40, 50),
}

Config.ConsumablesAlcohol = {
    ["whiskey"] = math.random(20, 30),
    ["beer"] = math.random(30, 40),
    ["vodka"] = math.random(20, 40),
    ["irishpub_cocktail"] = math.random(20, 30),
    ["irishpub_coconut_drink"] = math.random(30, 40),
    ["irishpub_island_fantasy"] = math.random(20, 40),
    ["irishpub_kamikaze"] = math.random(20, 40),
    ["irishpub_redhot_daquiri"] = math.random(20, 40),
    ["aperitivo"] = math.random(35, 54),
    ["negroni"] = math.random(40, 50),
    ["campari"] = math.random(40, 50),
    ["bellini"] = math.random(40, 50),
    ["spritz"] = math.random(30, 40),
}

Config.ConsumablesCustom = {
    -- ['newitem'] = {
    --     ['progress'] = {
    --         label = 'Using Item...',
    --         time = 5000
    --     },
    --     ['animation'] = {
    --         animDict = "amb@prop_human_bbq@male@base",
    --         anim = "base",
    --         flags = 8,
    --     },
    --     ['prop'] = {
    --         model = false,
    --         bone = false,
    --         coords = false, -- vector 3 format
    --         rotation = false, -- vector 3 format
    --     },
    --     ['replenish'] = {
    --         type = 'Hunger', -- replenish type 'Hunger'/'Thirst' / false
    --         replenish = math.random(20, 40), 
    --         isAlcohol = false, -- if you want it to add alcohol count
    --         event = false, -- 'eventname' if you want it to trigger an outside event on use useful for drugs
    --         server = false -- if the event above is a server event
    --     }
    -- }
}

ConsumablesFireworks = {
    "firework1",
    "firework2",
    "firework3",
    "firework4"
}

Config.FireworkTime = 5 -- seconds before it goes off

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
        "WORLD_VEHICLE_AMBULANCE",
        "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
        "WORLD_VEHICLE_POLICE_CAR",
        "WORLD_VEHICLE_POLICE_BIKE",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.BlacklistedVehs = {
    [`SHAMAL`] = true,
    [`LUXOR`] = true,
    [`LUXOR2`] = true,
    [`JET`] = true,
    [`LAZER`] = true,
    [`BUZZARD`] = true,
    [`BUZZARD2`] = true,
    [`ANNIHILATOR`] = true,
    [`SAVAGE`] = true,
    [`TITAN`] = true,
    [`RHINO`] = true,
    [`FIRETRUK`] = true,
    [`MULE`] = true,
    [`MAVERICK`] = true,
    [`BLIMP`] = true,
    [`AIRTUG`] = true,
    [`CAMPER`] = true,
    [`HYDRA`] = true,
    [`OPPRESSOR`] = true,
    [`technical3`] = true,
    [`insurgent3`] = true,
    [`apc`] = true,
    [`tampa3`] = true,
    [`trailersmall2`] = true,
    [`halftrack`] = true,
    [`hunter`] = true,
    [`vigilante`] = true,
    [`akula`] = true,
    [`barrage`] = true,
    [`khanjali`] = true,
    [`caracara`] = true,
    [`blimp3`] = true,
    [`menacer`] = true,
    [`oppressor2`] = true,
    [`scramjet`] = true,
    [`strikeforce`] = true,
    [`cerberus`] = true,
    [`cerberus2`] = true,
    [`cerberus3`] = true,
    [`scarab`] = true,
    [`scarab2`] = true,
    [`scarab3`] = true,
    [`rrocket`] = true,
    [`ruiner2`] = true,
    [`deluxo`] = true,
    [`cargoplane2`] = true,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}

Config.HolsterVariant = {130,122,3,6,8}
Config.HolsterableWeapons = {
    --'WEAPON_STUNGUN',
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_PISTOL50',
    'WEAPON_REVOLVER',
    'WEAPON_SNSPISTOL',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_VINTAGEPISTOL',
    'WEAPON_TASER',
}

Config.Objects = { -- for object removal
    {coords = vector3(266.09,-349.35,44.74), heading = 0, length = 200, width = 200, model = "prop_sec_barier_02b"},
    {coords = vector3(285.28,-355.78,45.13), heading = 0, length = 200, width = 200, model = "prop_sec_barier_02a"},
}

-- You may add more than 2 selections and it will bring up a menu for the player to select which floor be sure to label each section though
Config.Teleports = {
    --Elevator @ labs
    [1] = {
        [1] = { -- up label
            ['poly'] = {
                coords = vector3(3540.74, 3675.59, 20.99),
                heading = 167.5,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = false -- set this to a string for a custom label or leave it false to keep the default

        },
        [2] = { -- down label
            ['poly'] = {
                coords = vector3(3540.74, 3675.59, 28.11),
                heading = 172.5,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = false
        },
        -- [3] = { 
        --     ['poly'] = {
        --         coords = vector3(0.0, 0.0, 0.0),
        --         heading = 0.0,
        --         length = 0,
        --         width = 0
        --     },
        --     ["AllowVehicle"] = false,
        --     label = 'be sure to label all sections if more than 2'
        -- },
    },
    --Coke Processing Enter/Exit
    --[[[2] = {
        [1] = {
            ['poly'] = {
                coords = vector3(909.49, -1589.22, 30.51),
                heading = 92.24,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = '[E] Enter Coke Processing'
        },
        [2] = {
            ['poly'] = {
                coords = vector3(1088.81, -3187.57, -38.99),
                heading = 181.7,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = '[E] Leave'
        }
    }]]
}

Config.DefaultPrice = 20 -- Default price for the carwash
Config.DirtLevel = 0.1 -- Threshold for the dirt level to be counted as dirty
Config.CarWash = { -- carwash
    [1] = {
        ["label"] = "Hands Free Carwash",
        ["poly"] = {
            coords = vector3(174.81, -1736.77, 28.87),
            length = 7.0,
            width = 8.8,
            heading = 359
        }
    },
    [2] = {
        ["label"] = "Hands Free Carwash",
        ["poly"] = {
            coords = vector3(25.2, -1391.98, 28.91),
            length = 6.6,
            width = 8.2,
            heading = 0
        }
    },
    [3] = {
        ["label"] = "Hands Free Carwash",
        ["poly"] = {
            coords = vector3(-74.27, 6427.72, 31.02),
            length = 9.4,
            width = 8,
            heading = 315
        }
    },
    [4] = {
        ["label"] = "Hands Free Carwash",
        ["poly"] = {
            coords = vector3(1362.69, 3591.81, 34.5),
            length = 6.4,
            width = 8,
            heading = 21
        }
    },
    [5] = {
        ["label"] = "Hands Free Carwash",
        ["poly"] = {
            coords = vector3(-699.84, -932.68, 18.59),
            length = 11.8,
            width = 5.2,
            heading = 0
        }
    }
}
