return {


	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Cash',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
		client = {
			image = 'card_id.png'
		}
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	["phone"] = {
		label = "Cellatowa C24",
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			export = "gksphone.UsePhoneItem",
			remove = function()
				TriggerEvent("gksphone:client:ItemRemoved", "phone")
			end,
			add = function()
				TriggerEvent("gksphone:client:ItemAdded", "phone")
			end
		}
	},
	["iphone"] = {
		label = "iFruit 17",
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			export = "gksphone.UsePhoneItem",
			remove = function()
				TriggerEvent("gksphone:client:ItemRemoved", "iphone")
			end,
			add = function()
				TriggerEvent("gksphone:client:ItemAdded", "iphone")
			end
		}
	},

	['money'] = {
		label = 'Cash',
		stack = true,
	},

	['wallet'] = {
		label = 'Wallet',
		weight = 120,
		stack = false,
		consume = 0,
		client = {
			export = 'wasabi_wallet.openWallet'
		}
	},

	['purse'] = {
		label = 'Purse',
		weight = 120,
		stack = false,
		consume = 0,
		client = {
			export = 'wasabi_wallet.openWallet'
		}
	},

	['WEAPON_BRIEFCASE_02'] = {
		label = 'Leather Briefcase',
		weight = 120,
		stack = false,
		consume = 0,
		client = {
			export = 'wasabi_wallet.openWallet'
		}
	},

	['WEAPON_BRIEFCASE'] = {
		label = 'Metal Briefcase',
		weight = 120,
		stack = false,
		consume = 0,
		client = {
			export = 'wasabi_wallet.openWallet'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Fleeca Card',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},


	["checkbook"] = {
		label = "Check Book",
		weight = 2500,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "checkbook.png",
		}
	},

	["security_card_02"] = {
		label = "Security Card B",
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to",
		client = {
			image = "security_card_02.png",
		}
	},

	["anchovy"] = {
		label = "Anchovy",
		weight = 20,
		stack = true,
		close = true,
		description = "anchovy",
		client = {
			image = "anchovy.png",
		}
	},

	["at_clip_bandana_black"] = {
		label = "BLK BANDANA DRUM",
		weight = 2000,
		stack = true,
		close = true,
		description = "A 60 Round Drum",
		client = {
			image = "at_clip_bandana_black.png",
		}
	},

	["grouper"] = {
		label = "Grouper",
		weight = 3500,
		stack = true,
		close = true,
		description = "grouper",
		client = {
			image = "grouper.png",
		}
	},

	["thermal_goggles"] = {
		label = "Thermal Goggles",
		weight = 850,
		stack = false,
		close = true,
		description = "Helps locate hidden safes and detect heat signatures",
		client = {
			image = "thermal_goggles.png",
		}
	},

	["iron_ore"] = {
		label = "Iron Ore",
		weight = 100,
		stack = true,
		close = true,
		description = "Iron Ore",
		client = {
			image = "iron_ore.png",
		}
	},

	["iron_ingot"] = {
		label = "Iron Ingot",
		weight = 100,
		stack = true,
		close = true,
		description = "Iron Ingot",
		client = {
			image = "iron_ingot.png",
		}
	},

	["tablet"] = {
		label = "Tablet",
		weight = 300,
		stack = true,
		close = true,
		description = "A tablet computer",
		client = {
			image = "tablet.png",
		}
	},

	["bs_moneyshot"] = {
		label = "Bs Moneyshot",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bs_moneyshot.png",
		}
	},

	["crowbar"] = {
		label = "Crowbar",
		weight = 700,
		stack = true,
		close = true,
		description = "A metal tool used to pry things open",
		client = {
			image = "crowbar.png",
		}
	},

	["sandwich"] = {
		label = "Sandwich",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice bread for your stomach",
		client = {
			image = "sandwich.png",
		}
	},

	["luxuryfinish_attachment"] = {
		label = "Luxury Finish",
		weight = 1000,
		stack = true,
		close = true,
		description = "A luxury finish for a weapon",
		client = {
			image = "luxuryfinish_attachment.png",
		}
	},

	["special_water"] = {
		label = "Special Water",
		weight = 100,
		stack = true,
		close = true,
		description = "Special Water",
		client = {
			image = "special_water.png",
		}
	},

	["binco_basic_sweatshirt"] = {
		label = "Basic Sweatshirt",
		weight = 100,
		stack = true,
		close = true,
		description = "Basic Sweatshirt",
		client = {
			image = "binco_basic_sweatshirt.png",
		}
	},

	["emptybaggies"] = {
		label = "Empty Baggies",
		weight = 5,
		stack = true,
		close = true,
		description = "Empty plastic baggies",
		client = {
			image = "emptybaggies.png",
		}
	},

	["diving_fill"] = {
		label = "Diving Tube",
		weight = 3000,
		stack = false,
		close = true,
		description = "An oxygen tube and a rebreather",
		client = {
			image = "diving_tube.png",
		}
	},

	["ponsonbys_suit"] = {
		label = "Full Suit",
		weight = 100,
		stack = true,
		close = true,
		description = "Full Suit",
		client = {
			image = "ponsonbys_suit.png",
		}
	},

	["xtc_bag"] = {
		label = "XTC Bag",
		weight = 5,
		stack = true,
		close = false,
		description = "Packaged ecstasy ready for sale",
		client = {
			image = "xtc_bag.png",
		}
	},

	["plant_pot"] = {
		label = "Plant Pot",
		weight = 1000,
		stack = true,
		close = true,
		description = "Basic pot for growing plants",
		client = {
			image = "plant_pot.png",
		}
	},

	["blue_dream"] = {
		label = "Blue Dream",
		weight = 50,
		stack = true,
		close = false,
		description = "Dried Blue Dream buds",
		client = {
			image = "blue_dream.png",
		}
	},

	["firework2"] = {
		label = "Poppelers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework2.png",
		}
	},

	["weed_ogkush_seed"] = {
		label = "OGKush Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of OG Kush",
		client = {
			image = "weed_seed.png",
		}
	},

	["tomato"] = {
		label = "Tomato",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tomato.png",
		}
	},

	["fastrunner_2000"] = {
		label = "Fastrunner 2000",
		weight = 5,
		stack = true,
		close = true,
		description = "Fastrunner 2000",
		client = {
			image = "fastrunner_2000.png",
		}
	},

	["suburban_jogger"] = {
		label = "Suburban Jogger",
		weight = 100,
		stack = true,
		close = true,
		description = "Suburban Jogger",
		client = {
			image = "suburban_jogger.png",
		}
	},

	["vintage_wine"] = {
		label = "Vintage Wine",
		weight = 750,
		stack = false,
		close = true,
		description = "A bottle of vintage wine",
		client = {
			image = "vintage_wine.png",
		}
	},

	["flashlight"] = {
		label = "Flashlight",
		weight = 200,
		stack = true,
		close = false,
		description = "Illuminates dark areas",
		client = {
			image = "flashlight.png",
		}
	},

	["security_card_01"] = {
		label = "Security Card A",
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to",
		client = {
			image = "security_card_01.png",
		}
	},

	["weed_purplehaze"] = {
		label = "Purple Haze 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Purple Haze",
		client = {
			image = "weed_baggy.png",
		}
	},

	["handcuffs"] = {
		label = "Handcuffs",
		weight = 100,
		stack = true,
		close = true,
		description = "Comes in handy when people misbehave. Maybe it can be used for something else?",
		client = {
			image = "handcuffs.png",
		}
	},

	["studio_mic_vintage_tier5name"] = {
		label = "Vintage Tube Condenser Mk V",
		weight = 850,
		stack = true,
		close = true,
		description = "Vintage tube condenser with exceptional warmth and character for professional recordings.",
		client = {
			image = "vintage_mic.png",
		}
	},

	["vinyl_recordname"] = {
		label = "Vinyl Record",
		weight = 100,
		stack = false,
		close = true,
		description = "Pressed vinyl record of your music for physical distribution.",
		client = {
			image = "vinyl.png",
		}
	},

	["knitting_wheel"] = {
		label = "Knitting Wheel",
		weight = 100,
		stack = true,
		close = true,
		description = "Knitting Wheel",
		client = {
			image = "knitting_wheel.png",
		}
	},

	["xtc"] = {
		label = "Ecstasy",
		weight = 10,
		stack = true,
		close = false,
		description = "Raw ecstasy pills for processing or sale",
		client = {
			image = "xtc.png",
		}
	},

	["at_clip_100_pistol"] = {
		label = "100 Round Mag",
		weight = 2000,
		stack = true,
		close = true,
		description = "A 100 Round Mag",
		client = {
			image = "at_clip_100_pistol.png",
		}
	},

	["art1"] = {
		label = "Kitty Sleeping Art",
		weight = 2500,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "art1.png",
		}
	},

	["legendary_condenser_micname"] = {
		label = "Legendary Condenser Microphone",
		weight = 950,
		stack = true,
		close = true,
		description = "Legendary condenser microphone with exceptional warmth and presence. A studio classic.",
		client = {
			image = "legendary_condenser.png",
		}
	},

	["binco_basic_short"] = {
		label = "Basic Short",
		weight = 100,
		stack = true,
		close = true,
		description = "Basic Short",
		client = {
			image = "binco_basic_short.png",
		}
	},

	["veh_brakes"] = {
		label = "Brakes",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle brakes",
		client = {
			image = "veh_brakes.png",
		}
	},

	["rolling_paper"] = {
		label = "Rolling Paper",
		weight = 0,
		stack = true,
		close = true,
		description = "Paper made specifically for encasing and smoking tobacco or cannabis.",
		client = {
			image = "rolling_paper.png",
		}
	},

	["binco_basic_singlet"] = {
		label = "Basic Singlet",
		weight = 100,
		stack = true,
		close = true,
		description = "Basic Singlet",
		client = {
			image = "binco_basic_singlet.png",
		}
	},

	["wetbud"] = {
		label = "Wet Bud",
		weight = 50,
		stack = true,
		close = true,
		description = "Freshly harvested wet cannabis buds",
		client = {
			image = "wetbud.png",
		}
	},

	["entry_condenser_mic_tier1name"] = {
		label = "Entry Condenser Microphone Mk I",
		weight = 400,
		stack = true,
		close = true,
		description = "Entry-level condenser microphone with phantom power. Frequency response: 40Hz-18kHz.",
		client = {
			image = "condenser_mic.png",
		}
	},

	["coke"] = {
		label = "Cocaine",
		weight = 50,
		stack = true,
		close = false,
		description = "Raw cocaine for processing or sale",
		client = {
			image = "coke.png",
		}
	},

	["maleseed"] = {
		label = "Male Seed",
		weight = 10,
		stack = true,
		close = true,
		description = "Male cannabis seed",
		client = {
			image = "maleseed.png",
		}
	},

	["weed_brick"] = {
		label = "Weed Brick",
		weight = 1000,
		stack = true,
		close = true,
		description = "1KG Weed Brick to sell to large customers.",
		client = {
			image = "weed_brick.png",
		}
	},

	["art5"] = {
		label = "Obi Jesus Painting",
		weight = 2500,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "art5.png",
		}
	},

	["cashmere"] = {
		label = "Cashmere",
		weight = 100,
		stack = true,
		close = true,
		description = "Cashmere",
		client = {
			image = "cashmere.png",
		}
	},

	["moneybag"] = {
		label = "Money Bag",
		weight = 0,
		stack = false,
		close = true,
		description = "A bag with cash",
		client = {
			image = "moneybag.png",
		}
	},

	["transparent_vca_compressorname"] = {
		label = "Transparent VCA Compressor",
		weight = 500,
		stack = true,
		close = true,
		description = "Transparent VCA compressor with clean sound and punchy character.",
		client = {
			image = "transparent_vca.png",
		}
	},

	["platinum_record_awardname"] = {
		label = "Platinum Record Award",
		weight = 250,
		stack = false,
		close = true,
		description = "Elite platinum record award for achieving 1,000,000 units sold. The pinnacle of success!",
		client = {
			image = "platinum_record_award.png",
		}
	},

	["weedpackage"] = {
		label = "Weed Package",
		weight = 100,
		stack = true,
		close = true,
		description = "Large package of weed",
		client = {
			image = "weedpackage.png",
		}
	},

	["police_stormram"] = {
		label = "Stormram",
		weight = 18000,
		stack = true,
		close = true,
		description = "A nice tool to break into doors",
		client = {
			image = "police_stormram.png",
		}
	},

	["studio_power_conditionername"] = {
		label = "Studio Power Conditioner",
		weight = 200,
		stack = true,
		close = true,
		description = "Professional power conditioner with surge protection and clean power delivery.",
		client = {
			image = "power_conditioner.png",
		}
	},

	["at_clip_100_black"] = {
		label = "BLK 100R DRUM",
		weight = 2000,
		stack = true,
		close = true,
		description = "A 100 Round Drum",
		client = {
			image = "at_clip_100_black.png",
		}
	},

	["suburban_shirt"] = {
		label = "Suburban Shirt",
		weight = 100,
		stack = true,
		close = true,
		description = "Suburban Shirt",
		client = {
			image = "suburban_shirt.png",
		}
	},

	["purple_haze_wet"] = {
		label = "Purple Haze (Wet)",
		weight = 50,
		stack = true,
		close = false,
		description = "Wet Purple Haze buds - needs drying",
		client = {
			image = "purple_haze_wet.png",
		}
	},

	["binco_basic_shirt"] = {
		label = "Basic Shirt",
		weight = 100,
		stack = true,
		close = true,
		description = "Basic Shirt",
		client = {
			image = "binco_basic_shirt.png",
		}
	},

	["ponsonbys_shirt"] = {
		label = "Grey Shirt",
		weight = 100,
		stack = true,
		close = true,
		description = "Grey Shirt",
		client = {
			image = "ponsonbys_shirt.png",
		}
	},

	["raw_chicken"] = {
		label = "Raw Chicken",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_chicken.png",
		}
	},

	["wine"] = {
		label = "Wine",
		weight = 300,
		stack = true,
		close = false,
		description = "Some good wine to drink on a fine evening",
		client = {
			image = "wine.png",
		}
	},

	["sour_diesel_seed"] = {
		label = "Sour Diesel Seed",
		weight = 10,
		stack = true,
		close = true,
		description = "Sour Diesel seed - Balanced performance",
		client = {
			image = "sour_diesel_seed.png",
		}
	},

	["purple_haze_seed"] = {
		label = "Purple Haze Seed",
		weight = 10,
		stack = true,
		close = true,
		description = "Purple Haze seed - Premium quality",
		client = {
			image = "purple_haze_seed.png",
		}
	},

	["house_blueprint"] = {
		label = "House Blueprint",
		weight = 100,
		stack = false,
		close = true,
		description = "Detailed blueprint of a house layout",
		client = {
			image = "house_blueprint.png",
		}
	},

	["stickynote"] = {
		label = "Sticky note",
		weight = 0,
		stack = false,
		close = false,
		description = "Sometimes handy to remember something :)",
		client = {
			image = "stickynote.png",
		}
	},

	["holy_grail_tube_comp_tier5name"] = {
		label = "Holy Grail Tube Compressor Mk V",
		weight = 600,
		stack = true,
		close = true,
		description = "Ultra-rare holy grail tube compressor with legendary warmth and stereo linking.",
		client = {
			image = "tube_compressor.png",
		}
	},

	["newsbmic"] = {
		label = "Boom Microphone",
		weight = 100,
		stack = false,
		close = true,
		description = "A Useable BoomMic",
		client = {
			image = "newsbmic.png",
		}
	},

	["royalty_statementname"] = {
		label = "Royalty Statement",
		weight = 10,
		stack = false,
		close = true,
		description = "Monthly royalty statement showing earnings from streams, sales, and licensing.",
		client = {
			image = "statement.png",
		}
	},

	["tosti"] = {
		label = "Grilled Cheese Sandwich",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice to eat",
		client = {
			image = "tosti.png",
		}
	},

	["whiskey"] = {
		label = "Whiskey",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "whiskey.png",
		}
	},

	["weed_purplehaze_seed"] = {
		label = "Purple Haze Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Purple Haze",
		client = {
			image = "weed_seed.png",
		}
	},

	["split_end_muzzle_brake"] = {
		label = "Split End Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "split_end_muzzle_brake.png",
		}
	},

	["suburban_chain"] = {
		label = "Chain",
		weight = 100,
		stack = true,
		close = true,
		description = "Chain",
		client = {
			image = "suburban_chain.png",
		}
	},

	["binco_basic_jumpsuit"] = {
		label = "Basic Jumpsuit",
		weight = 100,
		stack = true,
		close = true,
		description = "Basic Jumpsuit",
		client = {
			image = "binco_basic_jumpsuit.png",
		}
	},

	["work_station"] = {
		label = "Shoe Work Station",
		weight = 5,
		stack = true,
		close = true,
		description = "Shoe Work Station",
		client = {
			image = "work_station.png",
		}
	},

	["artificial_bait"] = {
		label = "Artificial bait",
		weight = 30,
		stack = true,
		close = true,
		description = "artifical bait for fishing",
		client = {
			image = "artificial_bait.png",
		}
	},

	["clip_attachment"] = {
		label = "Clip",
		weight = 1000,
		stack = true,
		close = true,
		description = "A clip for a weapon",
		client = {
			image = "clip_attachment.png",
		}
	},

	["holy_grail_tube_mic_tier5name"] = {
		label = "Holy Grail Tube Condenser Mk V",
		weight = 1000,
		stack = true,
		close = true,
		description = "Ultra-rare holy grail tube condenser with legendary recordings and exceptional vintage character.",
		client = {
			image = "holy_grail_mic.png",
		}
	},

	["luminol"] = {
		label = "Luminol Spray",
		weight = 200,
		stack = true,
		close = true,
		description = "Used to detect blood traces at crime scenes",
		client = {
			image = "luminol.png",
		}
	},

	["sky_gliders"] = {
		label = "Sky Gliders",
		weight = 5,
		stack = true,
		close = true,
		description = "Sky Gliders",
		client = {
			image = "sky_gliders.png",
		}
	},

	["weed_nutrition"] = {
		label = "Plant Fertilizer",
		weight = 2000,
		stack = true,
		close = true,
		description = "Plant nutrition",
		client = {
			image = "weed_nutrition.png",
		}
	},

	["salmon"] = {
		label = "Salmon",
		weight = 1000,
		stack = true,
		close = true,
		description = "salmon",
		client = {
			image = "salmon.png",
		}
	},

	["blank"] = {
		label = "Blank Card",
		weight = 100,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "blank.png",
		}
	},

	["basic_preamp_tier1name"] = {
		label = "Basic Preamp Module Mk I",
		weight = 300,
		stack = true,
		close = true,
		description = "Basic solid-state preamp with 50dB gain range. Entry-level channel strip.",
		client = {
			image = "basic_preamp.png",
		}
	},

	["evidence_bag"] = {
		label = "Evidence Bag",
		weight = 50,
		stack = false,
		close = true,
		description = "Used to collect and store evidence",
		client = {
			image = "evidence_bag.png",
		}
	},

	["sky_walkers"] = {
		label = "Sky Walkers",
		weight = 5,
		stack = true,
		close = true,
		description = "Sky Walkers",
		client = {
			image = "sky_walkers.png",
		}
	},

	["sliced_onion"] = {
		label = "Sliced Onion",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "sliced_onion.png",
		}
	},

	["goldchain"] = {
		label = "Gold Chain",
		weight = 100,
		stack = true,
		close = true,
		description = "A valuable gold chain",
		client = {
			image = "goldchain.png",
		}
	},

	["rollingpaper"] = {
		label = "Rolling Paper",
		weight = 1,
		stack = true,
		close = true,
		description = "Paper for rolling joints",
		client = {
			image = "rollingpaper.png",
		}
	},

	["stolen_toaster"] = {
		label = "Toaster",
		weight = 2000,
		stack = true,
		close = true,
		description = "A stolen toaster",
		client = {
			image = "stolen_toaster.png",
		}
	},

	["crack"] = {
		label = "Crack",
		weight = 50,
		stack = true,
		close = false,
		description = "Raw crack cocaine for processing or sale",
		client = {
			image = "crack.png",
		}
	},

	["northern_lights_seed"] = {
		label = "Northern Lights Seed",
		weight = 10,
		stack = true,
		close = true,
		description = "Northern Lights seed - Maximum yield",
		client = {
			image = "northern_lights_seed.png",
		}
	},

	["cryptostick"] = {
		label = "Crypto Stick",
		weight = 200,
		stack = false,
		close = true,
		description = "Why would someone ever buy money that doesn't exist.. How many would it contain..?",
		client = {
			image = "cryptostick.png",
		}
	},

	["art6"] = {
		label = "Merp Kitty Art",
		weight = 2500,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "art6.png",
		}
	},

	["crew_badge"] = {
		label = "Crew Badge",
		weight = 50,
		stack = false,
		close = true,
		description = "Identifies you as a member of a robbery crew",
		client = {
			image = "crew_badge.png",
		}
	},

	["binco_basic_bralet"] = {
		label = "Basic Bralet",
		weight = 100,
		stack = true,
		close = true,
		description = "Basic Bralet",
		client = {
			image = "binco_basic_bralet.png",
		}
	},

	["suppressor_attachment"] = {
		label = "Suppressor",
		weight = 1000,
		stack = true,
		close = true,
		description = "A suppressor for a weapon",
		client = {
			image = "suppressor_attachment.png",
		}
	},

	["joint"] = {
		label = "Joint",
		weight = 5,
		stack = true,
		close = true,
		description = "Rolled cannabis joint",
		client = {
			image = "joint.png",
		}
	},

	["bs_heartstopper_meal"] = {
		label = "Bs Heartstopper Meal",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bs_heartstopper_meal.png",
		}
	},

	["crew_radio"] = {
		label = "Crew Radio",
		weight = 300,
		stack = false,
		close = false,
		description = "Secure communication device for crew members",
		client = {
			image = "crew_radio.png",
		}
	},

	["wirecutter"] = {
		label = "Wire Cutter",
		weight = 180,
		stack = true,
		close = true,
		description = "A tool for cutting wires in security systems",
		client = {
			image = "wirecutter.png",
		}
	},

	["bs_nuggets"] = {
		label = "Bs Nuggets",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bs_nuggets.png",
		}
	},

	["encrypted_usb"] = {
		label = "Encrypted USB Drive",
		weight = 50,
		stack = false,
		close = true,
		description = "A USB drive containing encrypted software for accessing criminal networks.",
		client = {
			image = "encrypted_usb.png",
		}
	},

	["redchip"] = {
		label = "Red Decryption Key",
		weight = 100,
		stack = false,
		close = true,
		description = "A key that is Red.",
		client = {
			image = "redchip.png",
		}
	},

	["professional_channel_stripname"] = {
		label = "Professional Channel Strip",
		weight = 900,
		stack = true,
		close = true,
		description = "Professional channel strip with advanced EQ and dynamics processing.",
		client = {
			image = "professional_channel.png",
		}
	},

	["metal_bobbin"] = {
		label = "Metal Bobbin",
		weight = 100,
		stack = true,
		close = true,
		description = "Metal Bobbin",
		client = {
			image = "metal_bobbin.png",
		}
	},

	["tirerepairkit"] = {
		label = "Tire Repair Kit",
		weight = 1000,
		stack = true,
		close = true,
		description = "A kit to repair your tires",
		client = {
			image = "tirerepairkit.png",
		}
	},

	["patriotcamo_attachment"] = {
		label = "Patriot Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A patriot camo for a weapon",
		client = {
			image = "patriotcamo_attachment.png",
		}
	},

	["veh_neons"] = {
		label = "Neons",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle neons",
		client = {
			image = "veh_neons.png",
		}
	},

	["burger_meat"] = {
		label = "Burger Meat",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "burger_meat.png",
		}
	},

	["fiber"] = {
		label = "Fiber",
		weight = 100,
		stack = true,
		close = true,
		description = "Fiber",
		client = {
			image = "fiber.png",
		}
	},

	["gloves"] = {
		label = "Latex Gloves",
		weight = 50,
		stack = true,
		close = true,
		description = "Prevents leaving fingerprints",
		client = {
			image = "gloves.png",
		}
	},

	["shoe_foam"] = {
		label = "Foam Material",
		weight = 5,
		stack = true,
		close = true,
		description = "Foam Material",
		client = {
			image = "shoe_foam.png",
		}
	},

	["ponsonbys_waistcoats"] = {
		label = "Waistcoats",
		weight = 100,
		stack = true,
		close = true,
		description = "Waistcoats",
		client = {
			image = "ponsonbys_waistcoats.png",
		}
	},

	["tunerlaptop"] = {
		label = "Tunerchip",
		weight = 2000,
		stack = false,
		close = true,
		description = "With this tunerchip you can get your car on steroids... If you know what you're doing",
		client = {
			image = "tunerchip.png",
		}
	},

	["legendary_transformer_preampname"] = {
		label = "Legendary Transformer Preamp",
		weight = 850,
		stack = true,
		close = true,
		description = "Legendary transformer-coupled preamp with exceptional warmth and musical character.",
		client = {
			image = "legendary_transformer.png",
		}
	},

	["greenchip"] = {
		label = "Green Decryption Key",
		weight = 100,
		stack = false,
		close = true,
		description = "A key that is Green.",
		client = {
			image = "greenchip.png",
		}
	},

	["streaming_licensename"] = {
		label = "Streaming License",
		weight = 5,
		stack = false,
		close = true,
		description = "License for streaming distribution on major platforms (Spotify, Apple Music, etc.).",
		client = {
			image = "license.png",
		}
	},

	["diamond_ore"] = {
		label = "Diamond Ore",
		weight = 100,
		stack = true,
		close = true,
		description = "Diamond Ore",
		client = {
			image = "diamond_ore.png",
		}
	},

	["newsmic"] = {
		label = "News Microphone",
		weight = 100,
		stack = false,
		close = true,
		description = "A microphone for the news",
		client = {
			image = "newsmic.png",
		}
	},

	["veh_suspension"] = {
		label = "Suspension",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle suspension",
		client = {
			image = "veh_suspension.png",
		}
	},

	["studio_dynamic_mic_tier2name"] = {
		label = "Studio Dynamic Microphone Mk II",
		weight = 600,
		stack = true,
		close = true,
		description = "Professional dynamic microphone with enhanced proximity effect. Frequency response: 40Hz-18kHz.",
		client = {
			image = "studio_mic.png",
		}
	},

	["rope_reel"] = {
		label = "Rope Reel",
		weight = 100,
		stack = true,
		close = true,
		description = "Rope Reel",
		client = {
			image = "rope_reel.png",
		}
	},

	["markedbills"] = {
		label = "Marked Bills",
		weight = 0,
		stack = true,
		close = true,
		description = "Suspicious marked money",
		client = {
			image = "markedbills.png",
		}
	},

	["goldbar"] = {
		label = "Gold Bar",
		weight = 1000,
		stack = true,
		close = true,
		description = "A heavy gold bar",
		client = {
			image = "goldbar.png",
		}
	},

	["coal"] = {
		label = "Coal",
		weight = 100,
		stack = true,
		close = true,
		description = "Coal",
		client = {
			image = "coal.png",
		}
	},

	["walkstick"] = {
		label = "Walking Stick",
		weight = 1000,
		stack = true,
		close = true,
		description = "Walking stick for ya'll grannies out there.. HAHA",
		client = {
			image = "walkstick.png",
		}
	},

	["mdspeakers"] = {
		label = "Speakers",
		weight = 2500,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "speaker.png",
		}
	},

	["art7"] = {
		label = "Family Portait",
		weight = 2500,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "art7.png",
		}
	},

	["music_industry_awardname"] = {
		label = "Music Industry Award",
		weight = 300,
		stack = false,
		close = true,
		description = "Prestigious music industry award statue. The highest honor in the music world.",
		client = {
			image = "music_award.png",
		}
	},

	["kurkakola"] = {
		label = "Cola",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "cola.png",
		}
	},

	["spandex"] = {
		label = "Spandex",
		weight = 100,
		stack = true,
		close = true,
		description = "Spandex",
		client = {
			image = "spandex.png",
		}
	},

	["zebracamo_attachment"] = {
		label = "Zebra Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A zebra camo for a weapon",
		client = {
			image = "zebracamo_attachment.png",
		}
	},

	["driedbud"] = {
		label = "Dried Bud",
		weight = 25,
		stack = true,
		close = true,
		description = "Dried cannabis buds",
		client = {
			image = "driedbud.png",
		}
	},

	["shoe_phone"] = {
		label = "Shoe client phone",
		weight = 5,
		stack = true,
		close = true,
		description = "Shoe client phone",
		client = {
			image = "shoe_phone.png",
		}
	},

	["shadow_yellows"] = {
		label = "Shadow Yellows",
		weight = 5,
		stack = true,
		close = true,
		description = "Shadow Yellows",
		client = {
			image = "shadow_yellows.png",
		}
	},

	["studio_condenser_mic_tier2name"] = {
		label = "Studio Condenser Microphone Mk II",
		weight = 500,
		stack = true,
		close = true,
		description = "Studio-grade condenser microphone with multiple pad options. Frequency response: 20Hz-20kHz.",
		client = {
			image = "studio_condenser.png",
		}
	},

	["at_clip_bandana_white"] = {
		label = "WT BANDANA DRUM",
		weight = 2000,
		stack = true,
		close = true,
		description = "A 60 Round Drum",
		client = {
			image = "at_clip_bandana_white.png",
		}
	},

	["printerdocument"] = {
		label = "Document",
		weight = 500,
		stack = false,
		close = true,
		description = "A nice document",
		client = {
			image = "printerdocument.png",
		}
	},

	["sky_pilots"] = {
		label = "Sky Pilots",
		weight = 5,
		stack = true,
		close = true,
		description = "Sky Pilots",
		client = {
			image = "sky_pilots.png",
		}
	},

	["studio_mic_precision_tier3name"] = {
		label = "Precision Tube Condenser Mk III",
		weight = 750,
		stack = true,
		close = true,
		description = "Precision-engineered tube condenser with excellent clarity and detail for professional recordings.",
		client = {
			image = "precision_mic.png",
		}
	},

	["smallscales"] = {
		label = "Small Scales",
		weight = 100,
		stack = true,
		close = true,
		description = "Basic scales for weighing small amounts",
		client = {
			image = "smallscales.png",
		}
	},

	["aluminum"] = {
		label = "Aluminium",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "aluminum.png",
		}
	},

	["tiger_mediums"] = {
		label = "Tiger Mediums",
		weight = 5,
		stack = true,
		close = true,
		description = "Tiger Mediums",
		client = {
			image = "tiger_mediums.png",
		}
	},

	["veh_wheels"] = {
		label = "Wheels",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle wheels",
		client = {
			image = "veh_wheels.png",
		}
	},

	["fingerprint_kit"] = {
		label = "Fingerprint Kit",
		weight = 350,
		stack = true,
		close = true,
		description = "Used to collect fingerprints from surfaces",
		client = {
			image = "fingerprint_kit.png",
		}
	},

	["suburban_skirt"] = {
		label = "Skirt",
		weight = 100,
		stack = true,
		close = true,
		description = "Skirt",
		client = {
			image = "suburban_skirt.png",
		}
	},

	["comp_attachment"] = {
		label = "Compensator",
		weight = 1000,
		stack = true,
		close = true,
		description = "A compensator for a weapon",
		client = {
			image = "comp_attachment.png",
		}
	},

	["at_clip_100_green"] = {
		label = "GRN 100R DRUM",
		weight = 2000,
		stack = true,
		close = true,
		description = "A 100 Round Drum",
		client = {
			image = "at_clip_100_green.png",
		}
	},

	["veh_interior"] = {
		label = "Interior",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle interior",
		client = {
			image = "veh_interior.png",
		}
	},

	["frozen_nuggets"] = {
		label = "Frozen Nuggets",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "frozen_nuggets.png",
		}
	},

	["glass_mold"] = {
		label = "Glass Mold",
		weight = 100,
		stack = true,
		close = true,
		description = "Glass Mold",
		client = {
			image = "glass_mold.png",
		}
	},

	["antipatharia_coral"] = {
		label = "Antipatharia",
		weight = 1000,
		stack = true,
		close = true,
		description = "Its also known as black corals or thorn corals",
		client = {
			image = "antipatharia_coral.png",
		}
	},

	["app_tablet"] = {
		label = "Tablet",
		weight = 1000,
		stack = false,
		close = true,
		description = "You can install different applications onto this.",
		client = {
			image = "app_tablet.png",
		}
	},

	["mixing_console_professional_tier5name"] = {
		label = "Professional Mixing Console Mk V",
		weight = 2500,
		stack = true,
		close = true,
		description = "Professional 32-channel mixing console with advanced automation and motorized faders.",
		client = {
			image = "pro_console.png",
		}
	},

	["legendary_tube_mic_tier4name"] = {
		label = "Legendary Tube Condenser Mk IV",
		weight = 900,
		stack = true,
		close = true,
		description = "Legendary tube condenser used by industry legends. Exceptional vintage character and warmth.",
		client = {
			image = "legendary_mic.png",
		}
	},

	["watering_can"] = {
		label = "Watering Can",
		weight = 500,
		stack = true,
		close = true,
		description = "Used to water plants and keep them healthy",
		client = {
			image = "watering_can.png",
		}
	},

	["suburban_dress"] = {
		label = "Suburban Dress",
		weight = 100,
		stack = true,
		close = true,
		description = "Suburban Dress",
		client = {
			image = "suburban_dress.png",
		}
	},

	["meth"] = {
		label = "Meth",
		weight = 50,
		stack = true,
		close = false,
		description = "Raw methamphetamine for processing or sale",
		client = {
			image = "meth.png",
		}
	},

	["goldingot"] = {
		label = "Gold Ingot",
		weight = 100,
		stack = true,
		close = true,
		description = "Gold Ingot",
		client = {
			image = "wool.png",
		}
	},

	["skullcamo_attachment"] = {
		label = "Skull Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A skull camo for a weapon",
		client = {
			image = "skullcamo_attachment.png",
		}
	},

	["wool"] = {
		label = "Wool Yarn",
		weight = 100,
		stack = true,
		close = true,
		description = "Wool Yarn",
		client = {
			image = "wool.png",
		}
	},

	["at_clip_100_blue"] = {
		label = "BLUE 100R DRUM",
		weight = 2000,
		stack = true,
		close = true,
		description = "A 100 Round Drum",
		client = {
			image = "at_clip_100_blue.png",
		}
	},

	["professional_ribbon_mic_tier3name"] = {
		label = "Professional Ribbon Microphone Mk III",
		weight = 700,
		stack = true,
		close = true,
		description = "Professional ribbon microphone with figure-8 pattern and vintage tone. Frequency response: 30Hz-18kHz.",
		client = {
			image = "ribbon_mic.png",
		}
	},

	["sky_gliders_plus"] = {
		label = "Sky Gliders Plus",
		weight = 5,
		stack = true,
		close = true,
		description = "Sky Gliders Plus",
		client = {
			image = "sky_gliders_plus.png",
		}
	},

	["sour_diesel_wet"] = {
		label = "Sour Diesel (Wet)",
		weight = 50,
		stack = true,
		close = false,
		description = "Wet Sour Diesel buds - needs drying",
		client = {
			image = "sour_diesel_wet.png",
		}
	},

	["versatile_condenser_micname"] = {
		label = "Versatile Condenser Microphone",
		weight = 700,
		stack = true,
		close = true,
		description = "Versatile condenser microphone with multiple pickup patterns for various recording applications.",
		client = {
			image = "versatile_condenser.png",
		}
	},

	["veh_armor"] = {
		label = "Armor",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle armor",
		client = {
			image = "veh_armor.png",
		}
	},

	["copper_ingot"] = {
		label = "Copper Ingot",
		weight = 100,
		stack = true,
		close = true,
		description = "Copper Ingot",
		client = {
			image = "copper_ingot.png",
		}
	},

	["suburban_tshirt"] = {
		label = "Suburban Tshirt",
		weight = 100,
		stack = true,
		close = true,
		description = "Suburban Tshirt",
		client = {
			image = "suburban_tshirt.png",
		}
	},

	["nft_certificatename"] = {
		label = "NFT Ownership Certificate",
		weight = 5,
		stack = false,
		close = true,
		description = "Certificate of ownership for blockchain-based music NFT with royalty rights.",
		client = {
			image = "nft_cert.png",
		}
	},

	["digital_scale"] = {
		label = "Digital Scale",
		weight = 500,
		stack = true,
		close = true,
		description = "A digital scale for weighing drugs",
		client = {
			image = "digital_scale.png",
		}
	},

	["stolen_computer"] = {
		label = "Desktop Computer",
		weight = 12000,
		stack = true,
		close = true,
		description = "A stolen desktop computer",
		client = {
			image = "stolen_computer.png",
		}
	},

	["veh_xenons"] = {
		label = "Xenons",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle xenons",
		client = {
			image = "veh_xenons.png",
		}
	},

	["entry_monitor_tier1name"] = {
		label = "Entry Monitor System Mk I",
		weight = 800,
		stack = true,
		close = true,
		description = "Entry-level active monitors with 50W power and 80Hz-18kHz frequency response.",
		client = {
			image = "entry_monitors.png",
		}
	},

	["breeze_90s"] = {
		label = "Breeze 90s",
		weight = 5,
		stack = true,
		close = true,
		description = "Breeze 90s",
		client = {
			image = "breeze_90s.png",
		}
	},

	["woodcamo_attachment"] = {
		label = "Woodland Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A woodland camo for a weapon",
		client = {
			image = "woodcamo_attachment.png",
		}
	},

	["mddesktop"] = {
		label = "Desktop",
		weight = 2500,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "mddesktop.png",
		}
	},

	["sticky_gel"] = {
		label = "Sticky Gel",
		weight = 100,
		stack = true,
		close = true,
		description = "Sticky Gel",
		client = {
			image = "sticky_gel.png",
		}
	},

	["slanted_muzzle_brake"] = {
		label = "Slanted Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "slanted_muzzle_brake.png",
		}
	},

	["antique_watch"] = {
		label = "Antique Watch",
		weight = 100,
		stack = false,
		close = true,
		description = "A valuable antique watch",
		client = {
			image = "antique_watch.png",
		}
	},

	["laptop_h"] = {
		label = "Hacking Laptop",
		weight = 2000,
		stack = false,
		close = true,
		description = "A specialized laptop for hacking security systems",
		client = {
			image = "laptop_h.png",
		}
	},

	["holy_grail_preamp_tier5name"] = {
		label = "Holy Grail Channel Strip Mk V",
		weight = 900,
		stack = true,
		close = true,
		description = "Ultra-rare holy grail channel strip with legendary EQ bands and transformer saturation.",
		client = {
			image = "holy_grail_preamp.png",
		}
	},

	["smooth_optical_compressorname"] = {
		label = "Smooth Optical Compressor",
		weight = 650,
		stack = true,
		close = true,
		description = "Smooth optical compressor with musical compression and tube warmth.",
		client = {
			image = "smooth_optical.png",
		}
	},

	["mastered_trackname"] = {
		label = "Mastered Audio Track",
		weight = 1,
		stack = false,
		close = true,
		description = "Professionally mastered audio track ready for distribution.",
		client = {
			image = "audio_file.png",
		}
	},

	["polyester"] = {
		label = "Polyester",
		weight = 100,
		stack = true,
		close = true,
		description = "Polyester",
		client = {
			image = "polyester.png",
		}
	},

	["red_snapper"] = {
		label = "Red Snapper",
		weight = 2500,
		stack = true,
		close = true,
		description = "red_snapper",
		client = {
			image = "red_snapper.png",
		}
	},

	["weedbaggie"] = {
		label = "Weed Baggie",
		weight = 10,
		stack = true,
		close = true,
		description = "Packaged weed for selling",
		client = {
			image = "weedbaggie.png",
		}
	},

	["metal"] = {
		label = "Metal",
		weight = 100,
		stack = true,
		close = true,
		description = "Metal",
		client = {
			image = "metal.png",
		}
	},

	["armor"] = {
		label = "Armor",
		weight = 5000,
		stack = true,
		close = true,
		description = "Some protection won't hurt... right?",
		client = {
			image = "armor.png",
		}
	},

	["bleach"] = {
		label = "Bleach",
		weight = 1000,
		stack = true,
		close = true,
		description = "Used to clean up evidence",
		client = {
			image = "bleach.png",
		}
	},

	["stolen_blender"] = {
		label = "Kitchen Blender",
		weight = 3000,
		stack = true,
		close = true,
		description = "A stolen kitchen blender",
		client = {
			image = "stolen_blender.png",
		}
	},

	["unknown_seed"] = {
		label = "Unknown Seed",
		weight = 10,
		stack = true,
		close = true,
		description = "Mysterious seed for hybrid creation",
		client = {
			image = "unknown_seed.png",
		}
	},

	["stolen_vacuum"] = {
		label = "Vacuum Cleaner",
		weight = 6000,
		stack = true,
		close = true,
		description = "A stolen vacuum cleaner",
		client = {
			image = "stolen_vacuum.png",
		}
	},

	["advancedlockpick"] = {
		label = "Advanced Lockpick",
		weight = 500,
		stack = true,
		close = true,
		description = "If you lose your keys a lot this is very useful... Also useful to open your beers",
		client = {
			image = "advancedlockpick.png",
		}
	},

	["rare_book"] = {
		label = "First Edition Book",
		weight = 500,
		stack = false,
		close = true,
		description = "A rare first edition book",
		client = {
			image = "rare_book.png",
		}
	
	},

	["blue_dream_wet"] = {
		label = "Blue Dream (Wet)",
		weight = 50,
		stack = true,
		close = false,
		description = "Wet Blue Dream buds - needs drying",
		client = {
			image = "blue_dream_wet.png",
		}
	},

	["ecola"] = {
		label = "Ecola",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "ecola.png",
		}
	},

	["bag"] = {
		label = "bag",
		weight = 5,
		stack = true,
		close = true,
		description = "bag",
		client = {
			image = "bag.png",
		}
	},

	["screwdriver"] = {
		label = "Screwdriver",
		weight = 120,
		stack = true,
		close = true,
		description = "A tool for removing screws and accessing panels",
		client = {
			image = "screwdriver.png",
		}
	},

	["xtcbaggy"] = {
		label = "Bag of XTC",
		weight = 0,
		stack = true,
		close = true,
		description = "Pop those pills baby",
		client = {
			image = "xtc_baggy.png",
		}
	},

	["printer"] = {
		label = "Printer",
		weight = 100,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "printer.png",
		}
	},

	["boombox"] = {
		label = "Boom Box",
		weight = 2500,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "boombox.png",
		}
	},


	["drill"] = {
		label = "Power Drill",
		weight = 1000,
		stack = true,
		close = true,
		description = "Used to drill through locks and safes",
		client = {
			image = "drill.png",
		}
	},

	["paint"] = {
		label = "Paint",
		weight = 100,
		stack = true,
		close = true,
		description = "Paint",
		client = {
			image = "paint.png",
		}
	},

	["copper_ore"] = {
		label = "Copper Ore",
		weight = 100,
		stack = true,
		close = true,
		description = "Copper Ore",
		client = {
			image = "copper_ore.png",
		}
	},

	["weed_whitewidow"] = {
		label = "White Widow 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g White Widow",
		client = {
			image = "weed_baggy.png",
		}
	},

	["encrypted_phone"] = {
		label = "Encrypted Phone",
		weight = 250,
		stack = true,
		close = true,
		description = "An encrypted phone for high-security communications",
		client = {
			image = "encrypted_phone.png",
		}
	},

	["rubber"] = {
		label = "Rubber",
		weight = 100,
		stack = true,
		close = false,
		description = "Rubber, I believe you can make your own rubber ducky with it :D",
		client = {
			image = "rubber.png",
		}
	},

	["acrylic"] = {
		label = "Acrylic",
		weight = 100,
		stack = true,
		close = true,
		description = "Acrylic",
		client = {
			image = "acrylic.png",
		}
	},

	["labkey"] = {
		label = "Key",
		weight = 500,
		stack = false,
		close = true,
		description = "Key for a lock...?",
		client = {
			image = "labkey.png",
		}
	},


	["art4"] = {
		label = "Presidential Kitty Art",
		weight = 2500,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "art4.png",
		}
	},

	["geocamo_attachment"] = {
		label = "Geometric Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A geometric camo for a weapon",
		client = {
			image = "geocamo_attachment.png",
		}
	},

	["cotton"] = {
		label = "Cotton",
		weight = 100,
		stack = true,
		close = true,
		description = "Cotton",
		client = {
			image = "cotton.png",
		}
	},

	["metalscrap"] = {
		label = "Metal Scrap",
		weight = 100,
		stack = true,
		close = false,
		description = "You can probably make something nice out of this",
		client = {
			image = "metalscrap.png",
		}
	},

	["bs_torpedo"] = {
		label = "Bs Torpedo",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bs_torpedo.png",
		}
	},

	["duffel_bag"] = {
		label = "Large Duffel Bag",
		weight = 300,
		stack = false,
		close = true,
		description = "Carry more stolen goods",
		client = {
			image = "duffel_bag.png",
		}
	},

	["copper"] = {
		label = "Copper",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "copper.png",
		}
	},

	["professional_pickaxe"] = {
		label = "Professional Pickaxe",
		weight = 100,
		stack = true,
		close = true,
		description = "Professional Pickaxe",
		client = {
			image = "professional_pickaxe.png",
		}
	},


	["weed_ak47_seed"] = {
		label = "AK47 Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of AK47",
		client = {
			image = "weed_seed.png",
		}
	},

	["weed_fertilizer_both"] = {
		label = "Premium Fertilizer",
		weight = 100,
		stack = true,
		close = true,
		description = "Speeds growth and boosts yield",
		client = {
			image = "fertilizer_both.png",
		}
	},

	["mask"] = {
		label = "Face Mask",
		weight = 100,
		stack = true,
		close = true,
		description = "Conceals your identity",
		client = {
			image = "mask.png",
		}
	},

	["water_bottle"] = {
		label = "Bottle of Water",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "water_bottle.png",
		}
	},

	["northern_lights_wet"] = {
		label = "Northern Lights (Wet)",
		weight = 50,
		stack = true,
		close = false,
		description = "Wet Northern Lights buds - needs drying",
		client = {
			image = "northern_lights_wet.png",
		}
	},

	["fence_contact"] = {
		label = "Fence Contact Information",
		weight = 10,
		stack = false,
		close = true,
		description = "Contact information for a fence",
		client = {
			image = "fence_contact.png",
		}
	},


	["painkillers"] = {
		label = "Painkillers",
		weight = 0,
		stack = true,
		close = true,
		description = "For pain you can't stand anymore, take this pill that'd make you feel great again",
		client = {
			image = "painkillers.png",
		}
	},

	["driver_license"] = {
		label = "Drivers License",
		weight = 0,
		stack = false,
		close = false,
		description = "Permit to show you can drive a vehicle",
		client = {
			image = "driver_license.png",
		}
	},

	["sim"] = {
		label = "Swapped Sim Card",
		weight = 100,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "sim.png",
		}
	},

	["coke_brick"] = {
		label = "Coke Brick",
		weight = 1000,
		stack = false,
		close = true,
		description = "Heavy package of cocaine, mostly used for deals and takes a lot of space",
		client = {
			image = "coke_brick.png",
		}
	},

	["speedster_300"] = {
		label = "Speedster 300",
		weight = 5,
		stack = true,
		close = true,
		description = "Speedster 300",
		client = {
			image = "speedster_300.png",
		}
	},

	["lockpick_kit"] = {
		label = "Professional Lockpick Kit",
		weight = 450,
		stack = false,
		close = true,
		description = "Makes lockpicking easier and faster",
		client = {
			image = "lockpick_kit.png",
		}
	},

	["at_clip_bandana_red"] = {
		label = "RED BANDANA DRUM",
		weight = 2000,
		stack = true,
		close = true,
		description = "A 60 Round Drum",
		client = {
			image = "at_clip_bandana_red.png",
		}
	},

	["bellend_muzzle_brake"] = {
		label = "Bellend Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "bellend_muzzle_brake.png",
		}
	},

	["lighter"] = {
		label = "Lighter",
		weight = 0,
		stack = true,
		close = true,
		description = "On new years eve a nice fire to stand next to",
		client = {
			image = "lighter.png",
		}
	},

	["piranha"] = {
		label = "Piranha",
		weight = 1500,
		stack = true,
		close = true,
		description = "piranha",
		client = {
			image = "piranha.png",
		}
	},

	["rock"] = {
		label = "Rock",
		weight = 100,
		stack = true,
		close = true,
		description = "Rock",
		client = {
			image = "rock.png",
		}
	},

	["firstaid"] = {
		label = "First Aid",
		weight = 2500,
		stack = true,
		close = true,
		description = "You can use this First Aid kit to get people back on their feet",
		client = {
			image = "firstaid.png",
		}
	},

	["linen"] = {
		label = "Linen",
		weight = 100,
		stack = true,
		close = true,
		description = "Linen",
		client = {
			image = "linen.png",
		}
	},

	["trojan_usb"] = {
		label = "Trojan USB",
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to shut down some systems",
		client = {
			image = "usb_device.png",
		}
	},

	["trout"] = {
		label = "Trout",
		weight = 750,
		stack = true,
		close = true,
		description = "trout",
		client = {
			image = "trout.png",
		}
	},

	["ponsonbys_chino"] = {
		label = "Chino",
		weight = 100,
		stack = true,
		close = true,
		description = "Chino",
		client = {
			image = "ponsonbys_chino.png",
		}
	},

	["certificate"] = {
		label = "Certificate",
		weight = 0,
		stack = true,
		close = true,
		description = "Certificate that proves you own certain stuff",
		client = {
			image = "certificate.png",
		}
	},

	["weed_bag"] = {
		label = "Weed Bag",
		weight = 10,
		stack = true,
		close = false,
		description = "Packaged weed ready for sale",
		client = {
			image = "weed_bag.png",
		}
	},

	["suburban_short"] = {
		label = "Suburban Short",
		weight = 100,
		stack = true,
		close = true,
		description = "Suburban Short",
		client = {
			image = "suburban_short.png",
		}
	},

	["dendrogyra_coral"] = {
		label = "Dendrogyra",
		weight = 1000,
		stack = true,
		close = true,
		description = "Its also known as pillar coral",
		client = {
			image = "dendrogyra_coral.png",
		}
	},

	["leather_materials"] = {
		label = "Leathers",
		weight = 5,
		stack = true,
		close = true,
		description = "Leathers",
		client = {
			image = "leather_materials.png",
		}
	},

	["weed_ak47"] = {
		label = "AK47 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g AK47",
		client = {
			image = "weed_baggy.png",
		}
	},

	["firework1"] = {
		label = "2Brothers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework1.png",
		}
	},

	["fitbit"] = {
		label = "Fitbit",
		weight = 500,
		stack = false,
		close = true,
		description = "I like fitbit",
		client = {
			image = "fitbit.png",
		}
	},

	["ccard"] = {
		label = "Cloned Card",
		weight = 100,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "ccard.png",
		}
	},

	["lettuce2"] = {
		label = "Lettuce2",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "lettuce2.png",
		}
	},

	["nvscope_attachment"] = {
		label = "Night Vision Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A night vision scope for a weapon",
		client = {
			image = "nvscope_attachment.png",
		}
	},

	["og_kush_wet"] = {
		label = "OG Kush (Wet)",
		weight = 50,
		stack = true,
		close = false,
		description = "Wet OG Kush buds - needs drying",
		client = {
			image = "og_kush_wet.png",
		}
	},

	["lyocell"] = {
		label = "Lyocell",
		weight = 100,
		stack = true,
		close = true,
		description = "Lyocell",
		client = {
			image = "lyocell.png",
		}
	},

	["flat_muzzle_brake"] = {
		label = "Flat Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "flat_muzzle_brake.png",
		}
	},

	["jute"] = {
		label = "Jute",
		weight = 100,
		stack = true,
		close = true,
		description = "Jute",
		client = {
			image = "jute.png",
		}
	},

	["empty_weed_bag"] = {
		label = "Empty Weed Bag",
		weight = 0,
		stack = true,
		close = true,
		description = "A small empty bag",
		client = {
			image = "weed_baggy_empty.png",
		}
	},

	["diamond"] = {
		label = "Diamond",
		weight = 1000,
		stack = true,
		close = true,
		description = "A diamond seems like the jackpot to me!",
		client = {
			image = "diamond.png",
		}
	},

	["boomcamo_attachment"] = {
		label = "Boom Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A boom camo for a weapon",
		client = {
			image = "boomcamo_attachment.png",
		}
	},

	["concrete"] = {
		label = "Concrete",
		weight = 100,
		stack = true,
		close = true,
		description = "Concrete",
		client = {
			image = "concrete.png",
		}
	},

	["microphone_cablename"] = {
		label = "Microphone Cable",
		weight = 20,
		stack = true,
		close = true,
		description = "Standard microphone cable for connecting mics to audio interfaces.",
		client = {
			image = "mic_cable.png",
		}
	},

	["cupro"] = {
		label = "Cupro",
		weight = 100,
		stack = true,
		close = true,
		description = "Cupro",
		client = {
			image = "cupro.png",
		}
	},

	["repairkit"] = {
		label = "Repairkit",
		weight = 2500,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "repairkit.png",
		}
	},

	["lawyerpass"] = {
		label = "Lawyer Pass",
		weight = 0,
		stack = false,
		close = false,
		description = "Pass exclusive to lawyers to show they can represent a suspect",
		client = {
			image = "lawyerpass.png",
		}
	},

	["smallscope_attachment"] = {
		label = "Small Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A small scope for a weapon",
		client = {
			image = "smallscope_attachment.png",
		}
	},

	["gatecrack"] = {
		label = "Gatecrack",
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to tear down some fences",
		client = {
			image = "usb_device.png",
		}
	},

	["diamond_ingot"] = {
		label = "Diamond Ingot",
		weight = 100,
		stack = true,
		close = true,
		description = "Diamond Ingot",
		client = {
			image = "diamond_ingot.png",
		}
	},

	["thermalscope_attachment"] = {
		label = "Thermal Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A thermal scope for a weapon",
		client = {
			image = "thermalscope_attachment.png",
		}
	},

	["heroin"] = {
		label = "Heroin",
		weight = 50,
		stack = true,
		close = false,
		description = "Raw heroin for processing or sale",
		client = {
			image = "heroin.png",
		}
	},

	["stolen_tv"] = {
		label = "Flat Screen TV",
		weight = 15000,
		stack = true,
		close = true,
		description = "A stolen flat screen TV",
		client = {
			image = "stolen_tv.png",
		}
	},

	["tape_player_radio"] = {
		label = "Tape Player",
		weight = 500,
		stack = true,
		close = false,
		description = "An old cassette tape player stolen from a vehicle",
		client = {
			image = "tape_player_radio.png",
		}
	},

	["clothe_materials"] = {
		label = "Raw Cloth",
		weight = 25,
		stack = true,
		close = true,
		description = "Raw Cloth",
		client = {
			image = "clothe_materials.png",
		}
	},

	["veh_engine"] = {
		label = "Engine",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle engine",
		client = {
			image = "veh_engine.png",
		}
	},

	["camera"] = {
		label = "Camera",
		weight = 300,
		stack = true,
		close = true,
		description = "A digital camera",
		client = {
			image = "camera.png",
		}
	},

	["thermite"] = {
		label = "Thermite",
		weight = 1000,
		stack = true,
		close = true,
		description = "Sometimes you'd wish for everything to burn",
		client = {
			image = "thermite.png",
		}
	},

	["cleaningkit"] = {
		label = "Cleaning Kit",
		weight = 250,
		stack = true,
		close = true,
		description = "A microfiber cloth with some soap will let your car sparkle again!",
		client = {
			image = "cleaningkit.png",
		}
	},

	["luxury_carplay_radio"] = {
		label = "Luxury Car Play System",
		weight = 1200,
		stack = true,
		close = false,
		description = "A premium car play system with advanced features",
		client = {
			image = "luxury_carplay_radio.png",
		}
	},

	["haddock"] = {
		label = "Haddock",
		weight = 500,
		stack = true,
		close = true,
		description = "haddock",
		client = {
			image = "haddock.png",
		}
	},

	["grapejuice"] = {
		label = "Grape Juice",
		weight = 200,
		stack = true,
		close = false,
		description = "Grape juice is said to be healthy",
		client = {
			image = "grapejuice.png",
		}
	},

	["stolen_console"] = {
		label = "Gaming Console",
		weight = 4000,
		stack = true,
		close = true,
		description = "A stolen gaming console",
		client = {
			image = "stolen_console.png",
		}
	},

	["weed_whitewidow_seed"] = {
		label = "White Widow Seed",
		weight = 0,
		stack = true,
		close = false,
		description = "A weed seed of White Widow",
		client = {
			image = "weed_seed.png",
		}
	},

	["graphite_rod"] = {
		label = "Graphite rod",
		weight = 350,
		stack = true,
		close = true,
		description = "graphite_rod",
		client = {
			image = "graphite_rod.png",
		}
	},

	["grape"] = {
		label = "Grape",
		weight = 100,
		stack = true,
		close = false,
		description = "Mmmmh yummie, grapes",
		client = {
			image = "grape.png",
		}
	},

	["screwdriverset"] = {
		label = "Toolkit",
		weight = 1000,
		stack = true,
		close = false,
		description = "Very useful to screw... screws...",
		client = {
			image = "screwdriverset.png",
		}
	},

	["item_bench"] = {
		label = "Workbench",
		weight = 15000,
		stack = false,
		close = false,
		description = "A workbench to craft items.",
		client = {
			image = "workbench.png",
		}
	},
	["attachment_bench"] = {
		label = "Attachment Workbench",
		weight = 15000,
		stack = false,
		close = false,
		description = "A workbench for crafting attachments.",
		client = {
			image = "attworkbench.png",
		}
	},

	["tactical_muzzle_brake"] = {
		label = "Tactical Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brakee for a weapon",
		client = {
			image = "tactical_muzzle_brake.png",
		}
	},

	["jewelry_box"] = {
		label = "Antique Jewelry Box",
		weight = 1000,
		stack = false,
		close = true,
		description = "An ornate antique jewelry box",
		client = {
			image = "jewelry_box.png",
		}
	},

	["og_kush"] = {
		label = "OG Kush",
		weight = 50,
		stack = true,
		close = false,
		description = "Dried OG Kush buds",
		client = {
			image = "og_kush.png",
		}
	},

	["art3"] = {
		label = "Fancy Kitty Art",
		weight = 2500,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "art3.png",
		}
	},

	["weed"] = {
		label = "Weed",
		weight = 100,
		stack = true,
		close = false,
		description = "Raw cannabis for processing or sale",
		client = {
			image = "weed.png",
		}
	},

	["precision_muzzle_brake"] = {
		label = "Precision Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "precision_muzzle_brake.png",
		}
	},

	["shark"] = {
		label = "Shark",
		weight = 7500,
		stack = true,
		close = true,
		description = "shark",
		client = {
			image = "shark.png",
		}
	},

	["meth_bag"] = {
		label = "Meth Bag",
		weight = 5,
		stack = true,
		close = false,
		description = "Packaged meth ready for sale",
		client = {
			image = "meth_bag.png",
		}
	},

	["titanium_rod"] = {
		label = "Titanium rod",
		weight = 450,
		stack = true,
		close = true,
		description = "titanium_rod",
		client = {
			image = "titanium_rod.png",
		}
	},

	["at_clip_clear"] = {
		label = "Clear Round Mag",
		weight = 1000,
		stack = true,
		close = true,
		description = "Clear Weapon Mag",
		client = {
			image = "at_clip_clear.png",
		}
	},

	["tuna"] = {
		label = "Tuna",
		weight = 10000,
		stack = true,
		close = true,
		description = "tuna",
		client = {
			image = "tuna.png",
		}
	},

	["binoculars"] = {
		label = "Binoculars",
		weight = 350,
		stack = true,
		close = false,
		description = "See things from a distance",
		client = {
			image = "binoculars.png",
		}
	},

	["rare_painting"] = {
		label = "Rare Painting",
		weight = 2500,
		stack = false,
		close = true,
		description = "A valuable rare painting",
		client = {
			image = "rare_painting.png",
		}
	},

	["weed_skunk"] = {
		label = "Skunk 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Skunk",
		client = {
			image = "weed_baggy.png",
		}
	},

	["msr"] = {
		label = "MSR",
		weight = 100,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "msr.png",
		}
	},

	["veh_plates"] = {
		label = "Plates",
		weight = 1000,
		stack = true,
		close = true,
		description = "Install vehicle plates",
		client = {
			image = "veh_plates.png",
		}
	},

	["galaxy_x"] = {
		label = "Galaxy X",
		weight = 5,
		stack = true,
		close = true,
		description = "Galaxy X",
		client = {
			image = "galaxy_x.png",
		}
	},

	["northern_lights"] = {
		label = "Northern Lights",
		weight = 50,
		stack = true,
		close = false,
		description = "Dried Northern Lights buds",
		client = {
			image = "northern_lights.png",
		}
	},

	["id_card"] = {
		label = "ID Card",
		weight = 0,
		stack = false,
		close = false,
		description = "A card containing all your information to identify yourself",
		client = {
			image = "card_id.png",
		}
	},

	["laptop"] = {
		label = "Laptop",
		weight = 1000,
		stack = true,
		close = true,
		description = "A laptop computer",
		client = {
			image = "laptop.png",
		}
	},


	["grinder"] = {
		label = "grinder",
		weight = 200,
		stack = true,
		close = false,
		description = "The real grinder...",
		client = {
			image = "grinder.png",
		}
	},

	["fat_end_muzzle_brake"] = {
		label = "Fat End Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "fat_end_muzzle_brake.png",
		}
	},

	["basic_rod"] = {
		label = "Fishing rod",
		weight = 250,
		stack = true,
		close = true,
		description = "basic_rod",
		client = {
			image = "basic_rod.png",
		}
	},

	["cokebaggy"] = {
		label = "Bag of Coke",
		weight = 0,
		stack = true,
		close = true,
		description = "To get happy real quick",
		client = {
			image = "cocaine_baggy.png",
		}
	},

	["mahi_mahi"] = {
		label = "Mahi Mahi",
		weight = 3500,
		stack = true,
		close = true,
		description = "mahi_mahi",
		client = {
			image = "mahi_mahi.png",
		}
	},

	["burner_phone"] = {
		label = "Burner Phone",
		weight = 200,
		stack = true,
		close = true,
		description = "A disposable phone for secure communications",
		client = {
			image = "burner_phone.png",
		}
	},

	["coke_bag"] = {
		label = "Coke Bag",
		weight = 5,
		stack = true,
		close = false,
		description = "Packaged cocaine ready for sale",
		client = {
			image = "coke_bag.png",
		}
	},

	["veh_tint"] = {
		label = "Tints",
		weight = 1000,
		stack = true,
		close = true,
		description = "Install vehicle tint",
		client = {
			image = "veh_tint.png",
		}
	},

	["electronickit"] = {
		label = "Electronic Kit",
		weight = 100,
		stack = true,
		close = true,
		description = "If you've always wanted to build a robot you can maybe start here. Maybe you'll be the new Elon Musk?",
		client = {
			image = "electronickit.png",
		}
	},

	["beer"] = {
		label = "Beer",
		weight = 500,
		stack = true,
		close = true,
		description = "Nothing like a good cold beer!",
		client = {
			image = "beer.png",
		}
	},

	["empty_evidence_bag"] = {
		label = "Empty Evidence Bag",
		weight = 0,
		stack = true,
		close = false,
		description = "Used a lot to keep DNA from blood, bullet shells and more",
		client = {
			image = "evidence.png",
		}
	},

	["aluminumoxide"] = {
		label = "Aluminium Powder",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with",
		client = {
			image = "aluminumoxide.png",
		}
	},

	["mdlaptop"] = {
		label = "Slow Laptop",
		weight = 2500,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "laptop.png",
		}
	},

	["bs_moneyshot_meal"] = {
		label = "Bs Moneyshot Meal",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bs_moneyshot_meal.png",
		}
	},

	["at_clip_bandana_green"] = {
		label = "GRN BANDANA DRUM",
		weight = 2000,
		stack = true,
		close = true,
		description = "A 60 Round Drum",
		client = {
			image = "at_clip_bandana_green.png",
		}
	},

	["diving_gear"] = {
		label = "Diving Gear",
		weight = 30000,
		stack = false,
		close = true,
		description = "An oxygen tank and a rebreather",
		client = {
			image = "diving_gear.png",
		}
	},

	["sandstone"] = {
		label = "Sandstone",
		weight = 100,
		stack = true,
		close = true,
		description = "Sandstone",
		client = {
			image = "sandstone.png",
		}
	},

	["sessantacamo_attachment"] = {
		label = "Sessanta Nove Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A sessanta nove camo for a weapon",
		client = {
			image = "sessantacamo_attachment.png",
		}
	},

	["veh_transmission"] = {
		label = "Transmission",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle transmission",
		client = {
			image = "veh_transmission.png",
		}
	},

	["mdtablet"] = {
		label = "Tablet",
		weight = 2500,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "mdtablet.png",
		}
	},

	["plastic"] = {
		label = "Plastic",
		weight = 100,
		stack = true,
		close = false,
		description = "RECYCLE! - Greta Thunberg 2019",
		client = {
			image = "plastic.png",
		}
	},

	["tenkgoldchain"] = {
		label = "10k Gold Chain",
		weight = 2000,
		stack = true,
		close = true,
		description = "10 carat golden chain",
		client = {
			image = "10kgoldchain.png",
		}
	},

	["at_clip_100_white"] = {
		label = "WT 100R DRUM",
		weight = 2000,
		stack = true,
		close = true,
		description = "A 100 Round Drum",
		client = {
			image = "at_clip_100_white.png",
		}
	},

	["sulfur"] = {
		label = "Sulfur",
		weight = 100,
		stack = true,
		close = true,
		description = "Sulfur",
		client = {
			image = "sulfur.png",
		}
	},

	["ingot_mold"] = {
		label = "Ingot Mold",
		weight = 100,
		stack = true,
		close = true,
		description = "Ingot Mold",
		client = {
			image = "ingot_mold.png",
		}
	},

	["advanced_pickaxe"] = {
		label = "Advanced Pickaxe",
		weight = 100,
		stack = true,
		close = true,
		description = "Advanced Pickaxe",
		client = {
			image = "advanced_pickaxe.png",
		}
	},

	["mdmonitor"] = {
		label = "Monitor",
		weight = 2500,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "mansionlaptop.png",
		}
	},

	["bs_bleeder"] = {
		label = "Bs Bleeder",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bs_bleeder.png",
		}
	},

	["filled_evidence_bag"] = {
		label = "Evidence Bag",
		weight = 200,
		stack = false,
		close = false,
		description = "A filled evidence bag to see who committed the crime >:(",
		client = {
			image = "evidence.png",
		}
	},

	["heavy_duty_muzzle_brake"] = {
		label = "HD Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "heavy_duty_muzzle_brake.png",
		}
	},


	["stolen_microwave"] = {
		label = "Microwave",
		weight = 8000,
		stack = true,
		close = true,
		description = "A stolen microwave",
		client = {
			image = "stolen_microwave.png",
		}
	},

	["weed_fertilizer_yield"] = {
		label = "Yield Booster",
		weight = 100,
		stack = true,
		close = true,
		description = "Increases harvest yield by 50%",
		client = {
			image = "fertilizer_yield.png",
		}
	},

	["burger_patty"] = {
		label = "Burger Patty",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "burger_patty.png",
		}
	},

	["boosting_tablet"] = {
		label = "Boosting Tablet",
		weight = 500,
		stack = true,
		close = true,
		description = "A tablet for illegal street racing and boosting activities.",
		client = {
			image = "boosting_tablet.png",
		}
	},

	["cybertablet"] = {
		label = "CyberTablet",
		weight = 1000,
		stack = false,
		close = false,
		description = "A high-tech tablet for various activities. Requires special software to access criminal networks.",
		client = {
			image = "cybertablet.png",
		}
	},

	["coffee"] = {
		label = "Coffee",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coffee.png",
		}
	},

	["brushcamo_attachment"] = {
		label = "Brushstroke Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A brushstroke camo for a weapon",
		client = {
			image = "brushcamo_attachment.png",
		}
	},

	["snikkel_candy"] = {
		label = "Snikkel Bar",
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O",
		client = {
			image = "snikkel_candy.png",
		}
	},

	["bluechip"] = {
		label = "Blue Decryption Key",
		weight = 100,
		stack = false,
		close = true,
		description = "A key that is Blue",
		client = {
			image = "bluechip.png",
		}
	},

	["at_clip_drum_pistol"] = {
		label = "50 Round Drum",
		weight = 1250,
		stack = true,
		close = true,
		description = "A 50 Round Drum",
		client = {
			image = "at_clip_drum_pistol.png",
		}
	},

	["fertilizer"] = {
		label = "Fertilizer",
		weight = 100,
		stack = true,
		close = true,
		description = "Plant fertilizer",
		client = {
			image = "fertilizer.png",
		}
	},

	["glass"] = {
		label = "Glass",
		weight = 100,
		stack = true,
		close = true,
		description = "Glass",
		client = {
			image = "glass.png",
		}
	},

	["firework3"] = {
		label = "WipeOut",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework3.png",
		}
	},

	["hemp"] = {
		label = "Hemp",
		weight = 100,
		stack = true,
		close = true,
		description = "Hemp",
		client = {
			image = "hemp.png",
		}
	},

	["leopardcamo_attachment"] = {
		label = "Leopard Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A leopard camo for a weapon",
		client = {
			image = "leopardcamo_attachment.png",
		}
	},

	["pinger"] = {
		label = "Pinger",
		weight = 1000,
		stack = true,
		close = true,
		description = "With a pinger and your phone you can send out your location",
		client = {
			image = "pinger.png",
		}
	},

	["grip_attachment"] = {
		label = "Grip",
		weight = 1000,
		stack = true,
		close = true,
		description = "A grip for a weapon",
		client = {
			image = "grip_attachment.png",
		}
	},

	["bank_card"] = {
		label = "Bank Card",
		weight = 0,
		stack = false,
		close = true,
		description = "Used to access ATM",
		client = {
			image = "bank_card.png",
		}
	},

	["at_clip_100_red"] = {
		label = "RED 100R DRUM",
		weight = 2000,
		stack = true,
		close = true,
		description = "A 100 Round Drum",
		client = {
			image = "at_clip_100_red.png",
		}
	},

	["quality_silk"] = {
		label = "Quality Silk",
		weight = 100,
		stack = true,
		close = true,
		description = "Quality Silk",
		client = {
			image = "quality_silk.png",
		}
	},

	["perseuscamo_attachment"] = {
		label = "Perseus Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A perseus camo for a weapon",
		client = {
			image = "perseuscamo_attachment.png",
		}
	},

	["bs_torpedo_meal"] = {
		label = "Bs Torpedo Meal",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bs_torpedo_meal.png",
		}
	},

	["firework4"] = {
		label = "Weeping Willow",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework4.png",
		}
	},

	["holoscope_attachment"] = {
		label = "Holo Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A holo scope for a weapon",
		client = {
			image = "holoscope_attachment.png",
		}
	},

	["iron"] = {
		label = "Iron",
		weight = 100,
		stack = true,
		close = true,
		description = "Iron",
		client = {
			image = "iron.png",
		}
	},

	["houselaptop"] = {
		label = "House Hacking Laptop",
		weight = 1200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "houselaptop.png",
		}
	},

	["harness"] = {
		label = "Race Harness",
		weight = 1000,
		stack = false,
		close = true,
		description = "Racing Harness so no matter what you stay in the car",
		client = {
			image = "harness.png",
		}
	},

	["veh_turbo"] = {
		label = "Turbo",
		weight = 1000,
		stack = true,
		close = true,
		description = "Install vehicle turbo",
		client = {
			image = "veh_turbo.png",
		}
	},

	["silver"] = {
		label = "Silver",
		weight = 100,
		stack = true,
		close = true,
		description = "Silver",
		client = {
			image = "silver.png",
		}
	},

	["nitrous"] = {
		label = "Nitrous",
		weight = 1000,
		stack = true,
		close = true,
		description = "Speed up, gas pedal! :D",
		client = {
			image = "nitrous.png",
		}
	},

	["weaponlicense"] = {
		label = "Weapon License",
		weight = 0,
		stack = false,
		close = true,
		description = "Weapon License",
		client = {
			image = "weapon_license.png",
		}
	},

	["newscam"] = {
		label = "News Camera",
		weight = 100,
		stack = false,
		close = true,
		description = "A camera for the news",
		client = {
			image = "newscam.png",
		}
	},

	["nubuck"] = {
		label = "Nubuck",
		weight = 100,
		stack = true,
		close = true,
		description = "Nubuck",
		client = {
			image = "nubuck.png",
		}
	},

	["stolen_radio"] = {
		label = "Vintage Radio",
		weight = 5000,
		stack = true,
		close = true,
		description = "A stolen vintage radio",
		client = {
			image = "stolen_radio.png",
		}
	},

	["medscope_attachment"] = {
		label = "Medium Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A medium scope for a weapon",
		client = {
			image = "medscope_attachment.png",
		}
	},

	["onion"] = {
		label = "Onion",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "onion.png",
		}
	},


	["advscope_attachment"] = {
		label = "Advanced Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "An advanced scope for a weapon",
		client = {
			image = "advscope_attachment.png",
		}
	},

	["bs_nugget_meal"] = {
		label = "Bs Nugget Meal",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bs_nugget_meal.png",
		}
	},

	["oxy"] = {
		label = "Prescription Oxy",
		weight = 0,
		stack = true,
		close = true,
		description = "The Label Has Been Ripped Off",
		client = {
			image = "oxy.png",
		}
	},

	["worms"] = {
		label = "Worms",
		weight = 10,
		stack = true,
		close = true,
		description = "worms",
		client = {
			image = "worms.png",
		}
	},

	["diamond_ring"] = {
		label = "Diamond Ring",
		weight = 50,
		stack = true,
		close = true,
		description = "A valuable diamond ring",
		client = {
			image = "diamond_ring.png",
		}
	},


	["ifaks"] = {
		label = "ifaks",
		weight = 200,
		stack = true,
		close = true,
		description = "ifaks for healing and a complete stress remover.",
		client = {
			image = "ifaks.png",
		}
	},

	["house_contract"] = {
		label = "House Robbery Contract",
		weight = 10,
		stack = false,
		close = true,
		description = "A contract for robbing a specific house",
		client = {
			image = "house_contract.png",
		}
	},

	["basic_stereo_radio"] = {
		label = "Basic Car Stereo",
		weight = 750,
		stack = true,
		close = false,
		description = "A standard car stereo system",
		client = {
			image = "basic_stereo_radio.png",
		}
	},

	["twerks_candy"] = {
		label = "Twerks",
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O",
		client = {
			image = "twerks_candy.png",
		}
	},

	["squared_muzzle_brake"] = {
		label = "Squared Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "squared_muzzle_brake.png",
		}
	},

	["burger_cheese"] = {
		label = "Burger Cheese",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "burger_cheese.png",
		}
	},

	["bs_fries"] = {
		label = "Bs Fries",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bs_fries.png",
		}
	},

	["uvlight"] = {
		label = "UV Light",
		weight = 500,
		stack = true,
		close = true,
		description = "Used to detect fingerprints at crime scenes",
		client = {
			image = "uvlight.png",
		}
	},


	["premium_carplay_radio"] = {
		label = "Premium Car Play System",
		weight = 1000,
		stack = true,
		close = false,
		description = "A high-end car play system with touchscreen",
		client = {
			image = "premium_carplay_radio.png",
		}
	},

	["signal_jammer"] = {
		label = "Signal Jammer",
		weight = 1200,
		stack = false,
		close = true,
		description = "Disrupts electronic security systems",
		client = {
			image = "signal_jammer.png",
		}
	},

	["weed_fertilizer_speed"] = {
		label = "Growth Accelerator",
		weight = 100,
		stack = true,
		close = true,
		description = "Speeds up plant growth by 50%",
		client = {
			image = "fertilizer_speed.png",
		}
	},

	["cybertablet_unlocked"] = {
		label = "CyberTablet (Unlocked)",
		weight = 1000,
		stack = false,
		close = false,
		description = "A high-tech tablet with access to criminal networks and services.",
		client = {
			image = "cybertablet_unlocked.png",
		}
	},

	["largescope_attachment"] = {
		label = "Large Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A large scope for a weapon",
		client = {
			image = "largescope_attachment.png",
		}
	},

	["art2"] = {
		label = "Wide Eye Kitty Art",
		weight = 2500,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "art2.png",
		}
	},

	["cooked_chicken_burger"] = {
		label = "Cooked Chicken Burger",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cooked_chicken_burger.png",
		}
	},

	["silver_ring"] = {
		label = "Silver Ring",
		weight = 40,
		stack = true,
		close = true,
		description = "A silver ring",
		client = {
			image = "silver_ring.png",
		}
	},

	["heavyarmor"] = {
		label = "Heavy Armor",
		weight = 5000,
		stack = true,
		close = true,
		description = "Some protection won't hurt... right?",
		client = {
			image = "armor.png",
		}
	},

	["radioscanner"] = {
		label = "Radio Scanner",
		weight = 1000,
		stack = true,
		close = true,
		description = "With this you can get some police alerts. Not 100% effective however",
		client = {
			image = "radioscanner.png",
		}
	},

	["heroin_bag"] = {
		label = "Heroin Bag",
		weight = 5,
		stack = true,
		close = false,
		description = "Packaged heroin ready for sale",
		client = {
			image = "heroin_bag.png",
		}
	},

	["bs_heartstopper"] = {
		label = "Bs Heartstopper",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bs_heartstopper.png",
		}
	},

	["normal_pickaxe"] = {
		label = "Normal Pickaxe",
		weight = 100,
		stack = true,
		close = true,
		description = "Normal Pickaxe",
		client = {
			image = "normal_pickaxe.png",
		}
	},

	["gold_ore"] = {
		label = "Gold Ore",
		weight = 100,
		stack = true,
		close = true,
		description = "Gold Ore",
		client = {
			image = "goldingot.png",
		}
	},

	["checkpaper"] = {
		label = "Check Paper",
		weight = 100,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "checkpaper.png",
		}
	},

	["veh_toolbox"] = {
		label = "Toolbox",
		weight = 1000,
		stack = true,
		close = true,
		description = "Check vehicle status",
		client = {
			image = "veh_toolbox.png",
		}
	},

	["veh_exterior"] = {
		label = "Exterior",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle exterior",
		client = {
			image = "veh_exterior.png",
		}
	},

	["jerry_can"] = {
		label = "Jerrycan 20L",
		weight = 20000,
		stack = true,
		close = true,
		description = "A can full of Fuel",
		client = {
			image = "jerry_can.png",
		}
	},

	["steel"] = {
		label = "Steel",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "steel.png",
		}
	},


	["digicamo_attachment"] = {
		label = "Digital Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A digital camo for a weapon",
		client = {
			image = "digicamo_attachment.png",
		}
	},

	["qualityscales"] = {
		label = "Quality Scales",
		weight = 200,
		stack = true,
		close = true,
		description = "High precision scales for weighing drugs",
		client = {
			image = "qualityscales.png",
		}
	},

	["cooking_oil"] = {
		label = "Cooking Oil",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cooking_oil.png",
		}
	},

	["barrel_attachment"] = {
		label = "Barrel",
		weight = 1000,
		stack = true,
		close = true,
		description = "A barrel for a weapon",
		client = {
			image = "barrel_attachment.png",
		}
	},

	["boostingtablet"] = {
		label = "boostingtablet",
		weight = 1,
		stack = true,
		close = true,
		description = "a tablet for getting them cars",
		client = {
			image = "tablet1.png",
		}
	},

	["flashlight_attachment"] = {
		label = "Flashlight",
		weight = 1000,
		stack = true,
		close = true,
		description = "A flashlight for a weapon",
		client = {
			image = "flashlight_attachment.png",
		}
	},

	["at_clip_bandana_blue"] = {
		label = "BLUE BANDANA DRUM",
		weight = 2000,
		stack = true,
		close = true,
		description = "A 60 Round Drum",
		client = {
			image = "at_clip_bandana_blue.png",
		}
	},

	["sliced_tomato"] = {
		label = "Sliced Tomato",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "sliced_tomato.png",
		}
	},

	["studio_headphonesname"] = {
		label = "Studio Headphones",
		weight = 100,
		stack = true,
		close = true,
		description = "Professional studio headphones with flat response for accurate monitoring.",
		client = {
			image = "headphones.png",
		}
	},

	["coke_small_brick"] = {
		label = "Coke Package",
		weight = 350,
		stack = false,
		close = true,
		description = "Small package of cocaine, mostly used for deals and takes a lot of space",
		client = {
			image = "coke_small_brick.png",
		}
	},

	["crack_bag"] = {
		label = "Crack Bag",
		weight = 5,
		stack = true,
		close = false,
		description = "Packaged crack ready for sale",
		client = {
			image = "crack_bag.png",
		}
	},

	["highend_carplay_radio"] = {
		label = "High-End Car Play System",
		weight = 1400,
		stack = true,
		close = false,
		description = "A top-tier car play system with cutting-edge technology",
		client = {
			image = "highend_carplay_radio.png",
		}
	},

	["empDevice"] = {
		label = "EMP Device",
		weight = 1500,
		stack = false,
		close = true,
		description = "Temporarily disables all electronic devices in the area",
		client = {
			image = "emp_device.png",
		}
	},

	["rare_coin"] = {
		label = "Rare Coin Collection",
		weight = 200,
		stack = false,
		close = true,
		description = "A collection of rare coins",
		client = {
			image = "rare_coin.png",
		}
	},

	["vodka"] = {
		label = "Vodka",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "vodka.png",
		}
	},


	["simcard"] = {
		label = "Empty Sim Card",
		weight = 100,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "simcard.png",
		}
	},

	["drum_attachment"] = {
		label = "Drum",
		weight = 1000,
		stack = true,
		close = true,
		description = "A drum for a weapon",
		client = {
			image = "drum_attachment.png",
		}
	},

	["blackpowder"] = {
		label = "Black Powder",
		weight = 100,
		stack = true,
		close = true,
		description = "Black Powder",
		client = {
			image = "blackpowder.png",
		}
	},


	["fcheck"] = {
		label = "Forged Check",
		weight = 100,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "fcheck.png",
		}
	},

	["ironoxide"] = {
		label = "Iron Powder",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with.",
		client = {
			image = "ironoxide.png",
		}
	},

	["casinochips"] = {
		label = "Casino Chips",
		weight = 0,
		stack = true,
		close = false,
		description = "Chips For Casino Gambling",
		client = {
			image = "casinochips.png",
		}
	},

	["mansionlaptop"] = {
		label = "Mansion Hacking Laptop",
		weight = 1100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "mansionlaptop.png",
		}
	},


	["premium_stereo_radio"] = {
		label = "Premium Car Stereo",
		weight = 850,
		stack = true,
		close = false,
		description = "A high-quality car stereo system",
		client = {
			image = "premium_stereo_radio.png",
		}
	},

	["rolex"] = {
		label = "Rolex Watch",
		weight = 120,
		stack = true,
		close = true,
		description = "A luxury Rolex watch",
		client = {
			image = "rolex.png",
		}
	},

	["crack_baggy"] = {
		label = "Bag of Crack",
		weight = 0,
		stack = true,
		close = true,
		description = "To get happy faster",
		client = {
			image = "crack_baggy.png",
		}
	},

	["frozen_fries"] = {
		label = "Frozen Fries",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "frozen_fries.png",
		}
	},

	["burger_bun"] = {
		label = "Burger Bun",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "burger_bun.png",
		}
	},


	["limestone"] = {
		label = "Limestone",
		weight = 100,
		stack = true,
		close = true,
		description = "Limestone",
		client = {
			image = "limestone.png",
		}
	},

	["advancedrepairkit"] = {
		label = "Advanced Repairkit",
		weight = 4000,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "advancedkit.png",
		}
	},

	["drug_package"] = {
		label = "Drug Package",
		weight = 1000,
		stack = true,
		close = false,
		description = "A packaged drug product from the lab",
		client = {
			image = "drug_package.png",
		}
	},

	["thin_needle"] = {
		label = "Thin Needle",
		weight = 100,
		stack = true,
		close = true,
		description = "Thin Needle",
		client = {
			image = "thin_needle.png",
		}
	},
	-- Clothing as item -------------------------------------------------------------------------------------------------------------------------
	['clothes_hat'] = {
		label = 'Hat',
		weight = 50,
		stack = false,
		close = false,
		buttons = {
			{
				label = 'Show/Hide Hair',
				action = function(slot)
					TriggerEvent('p_itemclothes/client/toggleHair')
				end
			}
		},
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_ears'] = {
		label = 'Ear Accessories',
		weight = 50,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_tshirt'] = {
		label = 'T-Shirt',
		weight = 50,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_torso'] = {
		label = 'Jacket',
		weight = 50,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_arms'] = {
		label = 'Gloves',
		weight = 50,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_pants'] = {
		label = 'Pants',
		weight = 50,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_shoes'] = {
		label = 'Shoes',
		weight = 50,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_mask'] = {
		label = 'Mask',
		weight = 50,
		stack = false,
		close = false,
		buttons = {
			{
				label = 'Show/Hide Face',
				action = function(slot)
					TriggerEvent('p_itemclothes/client/toggleFace')
				end
			}
		},
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_glasses'] = {
		label = 'Glasses',
		weight = 50,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_vest'] = {
		label = 'Vest',
		weight = 50,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_bag'] = {
		label = 'Bag',
		weight = 50,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_watch'] = {
		label = 'Watch',
		weight = 50,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_chain'] = {
		label = 'Chain',
		weight = 50,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_bracelet'] = {
		label = 'Bracelet',
		weight = 50,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	-- Codewave
	['leather_materials'] = {
		label = 'Leathers',
		weight = 5,
		stack = true
	},
	['shoe_foam'] = {
		label = 'Foam Material',
		weight = 5,
		stack = true
	},
	
	['clothe_materials'] = {
		label = 'Raw Cloth',
		weight = 25,
		stack = true
	},
	
	['work_station'] = {
		label = 'Shoe Work Station',
		weight = 5,
		stack = true
	},
	
	['shoe_phone'] = {
		label = 'Shoe client phone',
		weight = 5,
		stack = true
	},
	
	['sky_gliders_plus'] = {
		label = 'Sky Gliders Plus',
		weight = 5,
		stack = true
	},
	['breeze_bangs'] = {
		label = 'Breeze Bangs',
		weight = 5,
		stack = true
	},
	['tiger_mediums'] = {
		label = 'Tiger Mediums',
		weight = 5,
		stack = true
	},
	['galaxy_x'] = {
		label = 'Galaxy X',
		weight = 5,
		stack = true
	},
	['sky_walkers'] = {
		label = 'Sky Walkers',
		weight = 5,
		stack = true
	},
	['sky_pilots'] = {
		label = 'Sky Pilots',
		weight = 5,
		stack = true
	},
	['sky_flyers'] = {
		label = 'Sky Flyers',
		weight = 5,
		stack = true
	},
	['sky_gliders'] = {
		label = 'Sky Gliders',
		weight = 5,
		stack = true
	},
	['fastrunner_2000'] = {
		label = 'Fastrunner 2000',
		weight = 5,
		stack = true
	},
	['speedster_300'] = {
		label = 'Speedster 300',
		weight = 5,
		stack = true
	},
	['runner_prime'] = {
		label = 'Runner Prime',
		weight = 5,
		stack = true
	},
	['breeze_95s'] = {
		label = 'Breeze 95s',
		weight = 5,
		stack = true
	},
	['breeze_100s'] = {
		label = 'Breeze 100s',
		weight = 5,
		stack = true
	},
	['breeze_90s'] = {
		label = 'Breeze 90s',
		weight = 5,
		stack = true
	},
	['sky_walkers_red'] = {
		label = 'Sky Walkers Red',
		weight = 5,
		stack = true
	},
	['shadow_yellows'] = {
		label = 'Shadow Yellows',
		weight = 5,
		stack = true
	},

	-- JG Mech
	["engine_oil"] = {
		label = "Engine Oil",
		weight = 1000,
	},
	["tyre_replacement"] = {
		label = "Tyre Replacement",
		weight = 1000,
	},
	["clutch_replacement"] = {
		label = "Clutch Replacement",
		weight = 1000,
	},
	["air_filter"] = {
		label = "Air Filter",
		weight = 100,
	},
	["spark_plug"] = {
		label = "Spark Plug",
		weight = 1000,
	},
	["brakepad_replacement"] = {
		label = "Brakepad Replacement",
		weight = 1000,
	},
	["suspension_parts"] = {
		label = "Suspension Parts",
		weight = 1000,
	},
	-- Engine Items
	["i4_engine"] = {
		label = "I4 Engine",
		weight = 1000,
	},
	["v6_engine"] = {
		label = "V6 Engine",
		weight = 1000,
	},
	["v8_engine"] = {
		label = "V8 Engine",
		weight = 1000,
	},
	["v12_engine"] = {
		label = "V12 Engine",
		weight = 1000,
	},
	["turbocharger"] = {
		label = "Turbocharger",
		weight = 1000,
	},
	-- Electric Engines
	["ev_motor"] = {
		label = "EV Motor",
		weight = 1000,
	},
	["ev_battery"] = {
		label = "EV Battery",
		weight = 1000,
	},
	["ev_coolant"] = {
		label = "EV Coolant",
		weight = 1000,
	},
	-- Drivetrain Items
	["awd_drivetrain"] = {
		label = "AWD Drivetrain",
		weight = 1000,
	},
	["rwd_drivetrain"] = {
		label = "RWD Drivetrain",
		weight = 1000,
	},
	["fwd_drivetrain"] = {
		label = "FWD Drivetrain",
		weight = 1000,
	},
	-- Tuning Items
	["slick_tyres"] = {
		label = "Slick Tyres",
		weight = 1000,
	},
	["semi_slick_tyres"] = {
		label = "Semi Slick Tyres",
		weight = 1000,
	},
	["offroad_tyres"] = {
		label = "Offroad Tyres",
		weight = 1000,
	},
	["drift_tuning_kit"] = {
		label = "Drift Tuning Kit",
		weight = 1000,
	},
	["ceramic_brakes"] = {
		label = "Ceramic Brakes",
		weight = 1000,
	},
	-- Cosmetic Items
	["lighting_controller"] = {
		label = "Lighting Controller",
		weight = 100,
		client = {
			event = "jg-mechanic:client:show-lighting-controller",
		}
	},
	["stancing_kit"] = {
		label = "Stancer Kit",
		weight = 100,
		client = {
			event = "jg-mechanic:client:show-stancer-kit",
		}
	},
	["cosmetic_part"] = {
		label = "Cosmetic Parts",
		weight = 100,
	},
	["respray_kit"] = {
		label = "Respray Kit",
		weight = 1000,
	},
	["vehicle_wheels"] = {
		label = "Vehicle Wheels Set",
		weight = 1000,
	},
	["tyre_smoke_kit"] = {
		label = "Tyre Smoke Kit",
		weight = 1000,
	},
	["bulletproof_tyres"] = {
		label = "Bulletproof Tyres",
		weight = 1000,
	},
	["extras_kit"] = {
		label = "Extras Kit",
		weight = 1000,
	},
	-- Nitrous & Cleaning Items
	["nitrous_bottle"] = {
		label = "Nitrous Bottle",
		weight = 1000,
		client = {
			event = "jg-mechanic:client:use-nitrous-bottle",
		}
	},
	["empty_nitrous_bottle"] = {
		label = "Empty Nitrous Bottle",
		weight = 1000,
	},
	["nitrous_install_kit"] = {
		label = "Nitrous Install Kit",
		weight = 1000,
	},
	["cleaning_kit"] = {
		label = "Cleaning Kit",
		weight = 1000,
		client = {
			event = "jg-mechanic:client:clean-vehicle",
		}
	},
	["repair_kit"] = {
		label = "Repair Kit",
		weight = 1000,
		client = {
			event = "jg-mechanic:client:repair-vehicle",
		}
	},
	["duct_tape"] = {
		label = "Duct Tape",
		weight = 1000,
		client = {
			event = "jg-mechanic:client:use-duct-tape",
		}
	},
	-- Performance Item
	["performance_part"] = {
		label = "Performance Parts",
		weight = 1000,
	},
	-- Mechanic Tablet Item
	["mechanic_tablet"] = {
		label = "Mechanic Tablet",
		weight = 1000,
		client = {
			event = "jg-mechanic:client:use-tablet",
		}
	},
	-- Gearbox
	["manual_gearbox"] = {
		label = "Manual Gearbox",
		weight = 1000,
	},


	-- KQ Drugs ---------------------------------------------
	["coke"] = {
        label = "Cocaine",
        weight = 500,
        stack = true,
        close = true,
    },

    ["cement"] = {
        label = "Cement",
        weight = 5000,
        stack = true,
        close = true,
        consume = 0,
        server = {
            export = 'kq_cocaine.UseCement',
        },
    },

    ["hydrochloric_acid"] = {
        label = "Hydrochloric acid",
        weight = 1000,
        stack = true,
        close = true,
    },

    ["coca_blend"] = {
        label = "Coca blend",
        weight = 200,
        stack = true,
        close = true,
    },

    ["coca_leaf"] = {
        label = "Coca leaf",
        weight = 100,
        stack = true,
        close = true,
        consume = 0,
        server = {
            export = 'kq_cocaine.UseLeaf',
        },
    },

    ["coca_paste"] = {
        label = "Coca paste",
        weight = 100,
        stack = true,
        close = true,
    },

    ["gasoline"] = {
        label = "Gasoline",
        weight = 3000,
        stack = true,
        close = true,
    },
	["kq_meth_low"] = {
		label = "Meth (Low grade)",
		weight = 100,
		stack = true,
		close = true,
	},

	["kq_meth_mid"] = {
		label = "Meth (Medium grade)",
		weight = 100,
		stack = true,
		close = true,
	},

	["kq_meth_high"] = {
		label = "Meth (High grade)",
		weight = 100,
		stack = true,
		close = true,
	},

	["kq_ethanol"] = {
		label = "Ethanol",
		weight = 200,
		stack = true,
		close = true,
	},

	["kq_meth_pills"] = {
		label = "Pseudoephedrine",
		weight = 300,
		stack = true,
		close = true,
	},

	["kq_lithium"] = {
		label = "Lithium pack",
		weight = 300,
		stack = true,
		close = true,
	},

	["kq_acetone"] = {
		label = "Acetone",
		weight = 1000,
		stack = true,
		close = true,
	},

	["kq_ammonia"] = {
		label = "Ammonia",
		weight = 1000,
		stack = true,
		close = true,
	},

	["kq_meth_lab_kit"] = {
		label = "Meth cooking kit",
		weight = 3000,
		stack = true,
		close = true,
	},

	-- Wasabi Ambulance ----------------------------------------------------------
	['medikit'] = { -- Make sure not already a medikit
		label = 'Medikit',
		weight = 165,
		stack = true,
		close = true,
	},
	['medbag'] = {
		label = 'Medical Bag',
		weight = 165,
		stack = false,
		close = true,
	},

	['tweezers'] = {
		label = 'Tweezers',
		weight = 2,
		stack = true,
		close = true,
	},

	['suturekit'] = {
		label = 'Suture Kit',
		weight = 15,
		stack = true,
		close = true,
	},

	['icepack'] = {
		label = 'Ice Pack',
		weight = 29,
		stack = true,
		close = true,
	},

	['burncream'] = {
		label = 'Burn Cream',
		weight = 19,
		stack = true,
		close = true,
	},

	['defib'] = {
		label = 'Defibrillator',
		weight = 225,
		stack = false,
		close = true,
	},

	['sedative'] = {
		label = 'Sedative',
		weight = 15,
		stack = true,
		close = true,
	},

	['morphine30'] = {
		label = 'Morphine 30MG',
		weight = 2,
		stack = true,
		close = true,
	},

	['morphine15'] = {
		label = 'Morphine 15MG',
		weight = 2,
		stack = true,
		close = true,
	},

	['perc30'] = {
		label = 'Percocet 30MG',
		weight = 2,
		stack = true,
		close = true,
	},

	['perc10'] = {
		label = 'Percocet 10MG',
		weight = 2,
		stack = true,
		close = true,
	},

	['perc5'] = {
		label = 'Percocet 5MG',
		weight = 2,
		stack = true,
		close = true,
	},

	['vic10'] = {
		label = 'Vicodin 10MG',
		weight = 2,
		stack = true,
		close = true,
	},

	['vic5'] = {
		label = 'Vicodin 5MG',
		weight = 2,
		stack = true,
		close = true,
	},

	['recoveredbullet'] = {
		label = 'Recovered Bullet',
		weight = 1,
		stack = true,
		close = false,
	},

	-- Zat Desktop-------------------------------------------
	["zatpc"] = {
		label = "Gaming Setup",
		weight = 1,
		stack = false,
		close = true,
		description = "Gaming Setup",
		client = {
			image = "zatpc.png",
		}
	},
	["zatminingrack"] = {
		label = "Mining Rack",
		weight = 1,
		stack = false,
		close = true,
		description = "Metal Rack with 10 GPU slots",
		client = {
			image = "zatminingrack.png",
		}
	},
	["zatgpu"] = {
		label = "GPU",
		weight = 1,
		stack = false,
		close = true,
		description = "GPU",
		client = {
			image = "zatgpu.png",
		}
	},
	["zatcpu"] = {
		label = "CPU",
		weight = 1,
		stack = false,
		close = true,
		description = "CPU",
		client = {
			image = "zatcpu.png",
		}
	},
	["zatps"] = {
		label = "Power Supply",
		weight = 1,
		stack = false,
		close = true,
		description = "Power Supply",
		client = {
			image = "zatps.png",
		}
	},
	["zatmb"] = {
		label = "Mother Board",
		weight = 1,
		stack = false,
		close = true,
		description = "Mother Board",
		client = {
			image = "zatmb.png",
		}
	},
	["zatmodem"] = {
		label = "Modem",
		weight = 1,
		stack = false,
		close = true,
		description = "Modem",
		client = {
			image = "zatmodem.png",
		}
	},
	["zatbaskets"] = {
		label = "Small Wicker Basket",
		weight = 1,
		stack = false,
		close = true,
		description = "Wicker Basket used for storage.",
		client = {
			image = "zatbaskets.png",
		}
	},
	["zatbasketm"] = {
		label = "Wicker Basket",
		weight = 1,
		stack = false,
		close = true,
		description = "Wicker Basket used for storage.",
		client = {
			image = "zatbasketm.png",
		}
	},
	["zatminingfan"] = {
		label = "Rack Cooler",
		weight = 100,
		stack = false,
		close = true,
		description = "Fan - 60 and 120 RPM...",
		client = {
			image = "zatresfan.png",
		}
	},

	-- Zat Weed-------------------------------------------
	["zatresfan"] = {
		label = "Modern Fan",
		weight = 100,
		stack = false,
		close = true,
		description = "Fan - 60 and 120 RPM...",
		client = {
			image = "zatresfan.png",
		}
	},
	["zatrollingpaper"] = {
		label = "Rolling Paper",
		weight = 2000,
		stack = true,
		close = true,
		description = "Rolling paper",
		client = {
			image = "zatrollingpaper.png",
		}
	},
	
	["zatpackedweed"] = {
		label = "Packed Weed",
		weight = 100,
		stack = false,
		close = true,
		description = "Weed ready for sale",
		client = {
			image = "zatpackedweed.png",
		}
	},
	
	["zatpatioheater"] = {
		label = "Patio Heater",
		weight = 100,
		stack = false,
		close = true,
		description = "Patio heater - LOH 21 degrees C...",
		client = {
			image = "zatpatioheater.png",
		}
	},
	
	["zatweedbranch"] = {
		label = "Weed Branch",
		weight = 10000,
		stack = false,
		close = true,
		client = {
			image = "zatweedbranch.png",
		},
		description = "Weed plant",
	},
	["zatceilinglight"] = {
		label = "Ceiling Light",
		weight = 100,
		stack = false,
		close = true,
		description = "ceiling light...",
		client = {
			image = "zatceilinglight.png",
		}
	},
	
	["zatbluelight"] = {
		label = "Blue Light",
		weight = 100,
		stack = false,
		close = true,
		description = "Blue Wall Light - Perfect for plant growth...",
		client = {
			image = "zatbluelight.png",
		}
	},
	["zatwalllight"] = {
		label = "Wall Light",
		weight = 100,
		stack = false,
		close = true,
		description = "Wall Light...",
		client = {
			image = "zatwalllight.png",
		}
	},
	
	["zatweedseed"] = {
		label = "Weed Seed",
		weight = 0,
		stack = false,
		close = true,
		description = "Weed Seed",
		client = {
			image = "zatweedseed.png",
		}
	},
	
	["zatweedtable"] = {
		label = "Table",
		weight = 0,
		stack = true,
		close = true,
		description = "Table with Full weed Setup",
		client = {
			image = "zatweedtable.png",
		}
	},
	
	["zatweedracks"] = {
		label = "Medium Weed Rack",
		weight = 100,
		stack = true,
		close = true,
		description = "Weed Rack with max 5 slots...",
		client = {
			image = "zatweedracks.png",
		}
	},
	["zatplanter"] = {
		label = "Planter",
		weight = 100,
		stack = true,
		close = true,
		description = "Home made Garden...",
		client = {
			image = "zatplanter.png",
		}
	},
	
	["zatwaterbottlefull"] = {
		label = "Water Bottle Full",
		weight = 100,
		stack = true,
		close = true,
		description = "Water Bottle...",
		client = {
			image = "zatwaterbottlefull.png",
		}
	},
	
	["zatwatersetup"] = {
		label = "Water Filtration",
		weight = 100,
		stack = true,
		close = true,
		description = "Water Filtration Setup...",
		client = {
			image = "zatwatersetup.png",
		}
	},
	["zatfan01"] = {
		label = "Fan",
		weight = 100,
		stack = false,
		close = true,
		description = "Fan - 20 and 50 RPM...",
		client = {
			image = "zatfan01.png",
		}
	},
	
	["zatweedrackxs"] = {
		label = "Small Weed Rack",
		weight = 100,
		stack = true,
		close = true,
		description = "Weed Rack with max 3 slots...",
		client = {
			image = "zatweedrackxs.png",
		}
	},
	["zatweednutrition"] = {
		label = "Plant Fertilizer",
		weight = 2000,
		stack = true,
		close = true,
		description = "Plant nutrition",
		client = {
			image = "zatweednutrition.png",
		}
	},
	["zatheater"] = {
		label = "Wall Heater",
		weight = 100,
		stack = false,
		close = true,
		description = "Electrical wall heater - LOH 10 degrees C...",
		client = {
			image = "zatheater.png",
		}
	},
	
	["zatwallfan"] = {
		label = "Wall Fan",
		weight = 100,
		stack = false,
		close = true,
		description = "Fan - 80 and 200 RPM...",
		client = {
			image = "zatwallfan.png",
		}
	},
	["zatjoint"] = {
		label = "Joint",
		weight = 0,
		stack = false,
		close = true,
		description = "Sidney would be very proud at you",
		client = {
			image = "zatjoint.png",
		}
	},
	
	["zatwaterbottleempty"] = {
		label = "Water Bottle Empty",
		weight = 100,
		stack = true,
		close = true,
		description = "Water Bottle...",
		client = {
			image = "zatwaterbottleempty.png",
		}
	},

	['femaleseed'] = {
		label = 'Female Marijuana Seed',
		weight = 1000,
		consume = 0,
		server = {
			export = 'rep-weed.femaleseed',
		},
		description = 'Surely I can just plant this, right?'
	},
	['maleseed'] = {
		label = 'Male Marijuana Seed',
		weight = 1000,
		consume = 0,
		description = 'Add this to a planted female seed to make it pregnant? You are pretty sure this seed has a penis.'
	},
	['wateringcan'] = {
		label = 'Watering Can',
		weight = 7000,
		consume = 0,
		server = {
			export = 'rep-weed.wateringcan',
		},
		description = 'Fill this at a river or lake.'
	},
	['fertilizer'] = {
		label = 'Fertilizer',
		weight = 1000,
		consume = 0,
		description = 'Cool'
	},
	['wetbud'] = {
		label = 'Wet Bud (100 grams)',
		weight = 35000,
		consume = 0,
		description = 'THIS CANT BE DRIED WITHOUT STRAIN... Needs to be stored somewhere dry.'
	},
	['driedbud'] = {
		label = 'Dried Bud (100 Grams)',
		weight = 10000,
		consume = 0,
		server = {
			export = 'rep-weed.driedbud',
		},
		description = 'Pack It?'
	},
	['weedpackage'] = {
		label = 'Suspicious Package',
		weight = 25000,
		consume = 0,
		server = {
			export = 'rep-weed.weedpackage',
		},
		description = 'Marked for Police Seizure'
	},
	['qualityscales'] = {
		label = 'Quality Scales',
		weight = 2000,
		consume = 0,
		description = 'Weighs Baggies with no loss'
	},
	['smallscales'] = {
		label = 'Small Scales',
		weight = 1000,
		description = 'Weighs Baggies with minimal loss'
	},
	['joint'] = {
		label = '2g Joint',
		weight = 1000,
		consume = 0,
		server = {
			export = 'rep-weed.joint',
		},
		description = 'Its a Joint, man.'
	},
	['emptybaggies'] = {
		label = 'Empty Baggies',
		weight = 1000,
		description = 'Empty Baggies'
	},
	['weedbaggie'] = {
		label = 'Baggie (7g)',
		weight = 1000,
		consume = 0,
		server = {
			export = 'rep-weed.weedbaggie',
		},
		description = 'Sold on the streets'
	},
	['rollingpaper'] = {
		label = 'Rolling Paper',
		weight = 200,
		description = 'Required to roll joints!'
	},	

	["weed_skunk_seed"] = {
		label = "Skunk Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Skunk",
		client = {
			image = "weed_seed.png",
		}
	},

	["burnerphone"] = {
		label = "Burner Phone",
		weight = 100,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "burnerphone.png",
		}
	},

	-- Vapes
	["evape1"] = {
		label = "E-Vape + Atomizer",
		weight = 1,
		stack = false,
	},
	["evape2"] = {
		label = "Smoke + Atomizer",
		weight = 1,
		stack = false,
	},
	["vapesuitcase"] = {
		label = "Vape Suitcase",
		weight = 100,
		stack = false,
	},

	-- Stick Vape
	["blue_stickevape"] = {
		label = "Blue Stick E-Vape",
		weight = 1,
		stack = false,
	},
	["red_stickevape"] = {
		label = "Red Stick E-Vape",
		weight = 1,
		stack = false,
	},
	["green_stickevape"] = {
		label = "Green Stick E-Vape",
		weight = 1,
		stack = false,
	},
	["pink_stickevape"] = {
		label = "Pink Stick E-Vape",
		weight = 1,
		stack = true,
	},
	["lightgrey_stickevape"] = {
		label = "Light Grey Stick E-Vape",
		weight = 1,
		stack = true,
	},
	["black_stickevape"] = {
		label = "Black Stick E-Vape",
		weight = 1,
		stack = false,
	},
	["orange_stickevape"] = {
		label = "Orange Stick E-Vape",
		weight = 1,
		stack = false,
	},
	["yellow_stickevape"] = {
		label = "Yellow Stick E-Vape",
		weight = 1,
		stack = false,
	},

	-- Sumo Vape
	["blue_sumovape"] = {
		label = "Blue Sumo",
		weight = 1,
		stack = false,
	},
	["red_sumovape"] = {
		label = "Red Sumo",
		weight = 1,
		stack = true,
	},
	["green_sumovape"] = {
		label = "Green Sumo",
		weight = 1,
		stack = false,
	},
	["pink_sumovape"] = {
		label = "Pink Sumo",
		weight = 1,
		stack = false,
	},
	["lightgrey_sumovape"] = {
		label = "Light Grey Sumo",
		weight = 1,
		stack = false,
	},
	["black_sumovape"] = {
		label = "Black Sumo",
		weight = 1,
		stack = false,
	},
	["orange_sumovape"] = {
		label = "Orange Sumo",
		weight = 1,
		stack = false,
	},
	["yellow_sumovape"] = {
		label = "Yellow Sumo",
		weight = 1,
		stack = false,
	},

	-- Vapor Vape
	["blue_vaporglowvape"] = {
		label = "Blue VaporGlow",
		weight = 1,
		stack = false,
	},
	["red_vaporglowvape"] = {
		label = "Red VaporGlow",
		weight = 1,
		stack = false,
	},
	["green_vaporglowvape"] = {
		label = "Green VaporGlow",
		weight = 1,
		stack = false,
	},
	["pink_vaporglowvape"] = {
		label = "Pink VaporGlow",
		weight = 1,
		stack = false,
	},
	["lightgrey_vaporglowvape"] = {
		label = "Light Grey VaporGlow",
		weight = 1,
		stack = false,
	},
	["black_vaporglowvape"] = {
		label = "Black VaporGlow",
		weight = 1,
		stack = false,
	},
	["orange_vaporglowvape"] = {
		label = "Orange VaporGlow",
		weight = 1,
		stack = false,
	},
	["yellow_vaporglowvape"] = {
		label = "Yellow VaporGlow",
		weight = 1,
		stack = false,
	},

	-- Boxes
	-- E-Vape
	["sand_evapebox"] = {
		label = "Sand E-Vape Box",
		weight = 1,
		stack = false,
	},
	["black_evapebox"] = {
		label = "Black E-Vape Box",
		weight = 1,
		stack = false,
	},
	["redblack_evapebox"] = {
		label = "Red & Black E-Vape Box",
		weight = 1,
		stack = false,
	},
	["cyan_evapebox"] = {
		label = "Cyan E-Vape Box",
		weight = 1,
		stack = false,
	},
	["redwhite_evapebox"] = {
		label = "Red & White E-Vape Box",
		weight = 1,
		stack = false,
	},
	["grey_evapebox"] = {
		label = "Grey E-Vape Box",
		weight = 1,
		stack = false,
	},

	-- Smokebox
	["blue_smokebox"] = {
		label = "Blue Smoke Box",
		weight = 1,
		stack = false,
	},
	["red_smokebox"] = {
		label = "Red Smoke Box",
		weight = 1,
		stack = false,
	},
	["green_smokebox"] = {
		label = "Green Smoke Box",
		weight = 1,
		stack = false,
	},
	["pink_smokebox"] = {
		label = "Pink Smoke Box",
		weight = 1,
		stack = false,
	},
	["lightblue_smokebox"] = {
		label = "L. Blue Smoke Box",
		weight = 1,
		stack = false,
	},
	["black_smokebox"] = {
		label = "Black Smoke Box",
		weight = 1,
		stack = false,
	},
	["orange_smokebox"] = {
		label = "Orange Smoke Box",
		weight = 1,
		stack = false,
	},
	["yellow_smokebox"] = {
		label = "Yellow Smoke Box",
		weight = 1,
		stack = false,
	},

	-- Atomizers
	["silver_longatomizer"] = {
		label = "Long Silver Atomizer",
		weight = 1,
		stack = true,
	},
	["red_longatomizer"] = {
		label = "Long Red Atomizer",
		weight = 1,
		stack = true,
	},
	["blue_longatomizer"] = {
		label = "Long Blue Atomizer",
		weight = 1,
		stack = true,
	},
	["green_longatomizer"] = {
		label = "Long Green Atomizer",
		weight = 1,
		stack = true,
	},
	["pink_longatomizer"] = {
		label = "Long Pink Atomizer",
		weight = 1,
		stack = true,
	},
	["grey_longatomizer"] = {
		label = "Long Grey Atomizer",
		weight = 1,
		stack = true,
	},
	["black_longatomizer"] = {
		label = "Long Black Atomizer",
		weight = 1,
		stack = true,
	},
	["orange_longatomizer"] = {
		label = "Long Orange Atomizer",
		weight = 1,
		stack = true,
	},
	["yellow_longatomizer"] = {
		label = "Long Yellow Atomizer",
		weight = 1,
		stack = true,
	},

	-- 2
	["silver_shortatomizer"] = {
		label = "Short Silver Atomizer",
		weight = 1,
		stack = true,
	},
	["red_shortatomizer"] = {
		label = "Short Red Atomizer",
		weight = 1,
		stack = true,
	},
	["blue_shortatomizer"] = {
		label = "Short Blue Atomizer",
		weight = 1,
		stack = true,
	},
	["green_shortatomizer"] = {
		label = "Short Green Atomizer",
		weight = 1,
		stack = true,
	},
	["pink_shortatomizer"] = {
		label = "Short Pink Atomizer",
		weight = 1,
		stack = true,
	},
	["grey_shortatomizer"] = {
		label = "Short Grey Atomizer",
		weight = 1,
		stack = true,
	},
	["black_shortatomizer"] = {
		label = "Short Black Atomizer",
		weight = 1,
		stack = true,
	},
	["orange_shortatomizer"] = {
		label = "Short Orange Atomizer",
		weight = 1,
		stack = true,
	},
	["yellow_shortatomizer"] = {
		label = "Short Yellow Atomizer",
		weight = 1,
		stack = true,
	},

	-- 3
	["silver_notankatomizer"] = {
		label = "Silver NO-Tank Atomizer",
		weight = 1,
		stack = true,
	},
	["gold_notankatomizer"] = {
		label = "Gold NO-Tank Atomizer",
		weight = 1,
		stack = true,
	},
	["black_notankatomizer"] = {
		label = "Black NO-Tank Atomizer",
		weight = 1,
		stack = true,
	},
	["red_notankatomizer"] = {
		label = "Red NO-Tank Atomizer",
		weight = 1,
		stack = true,
	},

	-- Liquids
	["liquid_sweettemptation"] = {
		label = "Liquid: Sweet Temptation",
		weight = 1,
		stack = true,
	},
	["liquid_iceberg"] = {
		label = "Liquid: Iceberg",
		weight = 1,
		stack = true,
	},
	["liquid_snoopify"] = {
		label = "Liquid: Snoopify",
		weight = 1,
		stack = true,
	},
	["liquid_goldtobacco"] = {
		label = "Liquid: Goldtobacco",
		weight = 1,
		stack = true,
	},
	["liquid_fruitytrip"] = {
		label = "Liquid: FruityTrip",
		weight = 1,
		stack = true,
	},
	["liquid_candybomb"] = {
		label = "Liquid: CandyBomb",
		weight = 1,
		stack = true,
	},
	["liquid_sensei"] = {
		label = "Liquid: Sensei",
		weight = 1,
		stack = true,
	},
	["liquid_blueberry"] = {
		label = "Liquid: Blue Berry",
		weight = 1,
		stack = true,
	},
	["liquid_blueberry_legendary"] = {
		label = "Legendary Blueberry",
		weight = 1,
		stack = true,
		rarity = 'legendary',
	},

	-- Cardboard Vapes 
	["smokebox_cardboard"] = {
		label = "Smoke Box Cardboard",
		weight = 1,
		stack = true,
	},
	["evape1_cardboard"] = {
		label = "E-Vape Stick Cardboard",
		weight = 1,
		stack = true,
	},
	["evape2_cardboard"] = {
		label = "E-Vape Box Cardboard",
		weight = 1,
		stack = true,
	},
	["sumo_cardboard"] = {
		label = "Sumo Vape Cardboard",
		weight = 1,
		stack = true,
	},
	["vaporglow_cardboard"] = {
		label = "VaporGlow Cardboard",
		weight = 1,
		stack = true,
	},
    
['bankcard'] = {
		label = 'Bank Card',
		weight = 1,
		stack = false,
		close = true,
	},

	['transactionsreceipt'] = {
		label = 'Transaction Receipt',
		weight = 1,
		stack = false,
		close = true,
	},
    ["bbq_grill"] = {  
        label = "BBQ Grill",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["gazebo"] = {  
        label = "Gazebo",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["soda_machine"] = {  
        label = "Soda Machine",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["table"] = {  
        label = "Table",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["flood_light"] = {  
        label = "Flood Light",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["chair"] = {  
        label = "Chair",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["raw_ribs"] = {  
        label = "Raw Ribs",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["raw_beef_brisket"] = {  
        label = "Raw Beef Brisket",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["pork_joint"] = {  
        label = "Pork Joint",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["raw_sausages"] = {  
        label = "Raw Sausages",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["raw_short_ribs"] = {  
        label = "Raw Short Ribs",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["lamb_chops"] = {  
        label = "Lamb Chops",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["ribeye_steak"] = {  
        label = "Ribeye Steak",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["chicken_thigh"] = {  
        label = "Chicken Thigh",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["raw_turkey_drums"] = {  
        label = "Raw Turkey Drumsticks",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["corn_cob"] = {  
        label = "Corn on the Cob",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["raw_kebab"] = {  
        label = "Raw Kebab",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["bbq_seasoning"] = {  
        label = "BBQ Seasoning",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["raw_wings"] = {  
        label = "Raw Wings",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["cooked_ribs"] = {  
        label = "Cooked Ribs",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["cooked_brisket"] = {  
        label = "Cooked Brisket",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["cooked_pork_joint"] = {  
        label = "Cooked Pork Joint",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["cooked_bbq_sausages"] = {  
        label = "Cooked BBQ Sausages",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["cooked_short_ribs"] = {  
        label = "Cooked Short Ribs",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["cooked_lamb_chops"] = {  
        label = "Cooked Lamb Chops",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["cooked_bbq_ribeye"] = {  
        label = "Cooked BBQ Ribeye",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["cooked_bbq_thigh"] = {  
        label = "Cooked BBQ Chicken Thigh",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["cooked_turkey_drum"] = {  
        label = "Cooked Turkey Drumstick",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["cooked_corn_cob"] = {  
        label = "Cooked Corn on the Cob",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["cooked_kebab"] = {  
        label = "Cooked Kebab",  
        weight = 15,  
        stack = true,  
        close = true  
    },
    ["cooked_bbq_wings"] = {  
        label = "Cooked BBQ Wings",  
        weight = 15,  
        stack = true,  
        close = true  
    },

    -- drinks

        ["cup_cola"] = {   
        label = "Cup of Cola",   
        weight = 1,  
        stack = true,  
        close = true  
    },
    ["cup_lemonade"] = {   
        label = "Cup of Lemonade",   
        weight = 1,  
        stack = true,  
        close = true  
    },
    ["cup_tide"] = {   
        label = "Cup of Tide",   
        weight = 1,  
        stack = true,  
        close = true  
    },
    ["empty_cup"] = {   
        label = "Empty Cup",   
        weight = 0.5,  
        stack = true,  
        close = true  
    },
    ["big_bottle_cola"] = {   
        label = "Big Bottle of Cola",   
        weight = 3,  
        stack = true,  
        close = true  
    },
    ["big_bottle_lemonade"] = {   
        label = "Big Bottle of Lemonade",   
        weight = 3,  
        stack = true,  
        close = true  
    },
    ["big_bottle_tide"] = {   
        label = "Big Bottle of Tide",   
        weight = 3,  
        stack = true,  
        close = true  
    },
    ['radio2'] = {
		label = 'radio',
		weight = 1,
		stack = false,
		close = true,
	},
      ['junk_blue'] = {
		label = 'Junk Blue',
		weight = 15,
		stack = true,
		close = true,
	},

    ['junk_green'] = {
		label = 'Junk Green',
		weight = 15,
		stack = true,
		close = true,
	},

    ['junk_orange'] = {
		label = 'Junk Orange',
		weight = 15,
		stack = true,
		close = true,
	},

    ['junk_purple'] = {
		label = 'Junk Purple',
		weight = 15,
		stack = true,
		close = true,
	},

    ['junk_red'] = {
		label = 'Junk Red',
		weight = 15,
		stack = true,
		close = true,
	},
    ["mdt"] = {
    label = 'MDT',
    weight = 800,
    client = {
        export = 'ND_MDT.useTablet',
    },
    },

    ['stretcher'] = {
        label = 'Stretcher',
        weight = 15000,
        stack = false,
        close = true,
        consume = 1,
        server = {
            export = 'ND_Ambulance.createStretcher',
        }
    },

    ['defib'] = {
        label = 'Monitor/Defibrillator',
        weight = 8000,
        stack = false,
        close = true,
        consume = 1,
        client = {
            export = 'ND_Ambulance.useDefib',
            add = function(total)
                if total > 0 then
                    pcall(function()
                        return exports['ND_Ambulance']:hasDefib(true)
                    end)
                end
            end,
            remove = function(total)
                if total < 1 then
                    pcall(function()
                        return exports['ND_Ambulance']:hasDefib(false)
                    end)
                end
            end
        }
    },

    ['medbag'] = {
        label = 'Trauma Bag',
        weight = 1000,
        stack = false,
        close = true,
        consume = 1,
        server = {
            export = 'ND_Ambulance.useBag'
        },
        client = {
            export = 'ND_Ambulance.useBag',
            add = function(total)
                if total > 0 then
                    pcall(function()
                        return exports['ND_Ambulance']:bag(true)
                    end)
                end
            end,
            remove = function(total)
                if total < 1 then
                    pcall(function()
                        return exports['ND_Ambulance']:bag(false)
                    end)
                end
            end
        }
    },

    ['burndressing'] = {
        label = 'Burn Dressing',
        weight = 50,
        stack = true,
        close = true,
        consume = 1,
        server = {
            export = 'ND_Ambulance.treatment',
        },
        client = {
            anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
            prop = { model = 'prop_toilet_roll_01', pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
            disable = { move = true, car = true, combat = true },
            usetime = 2500
        }
    },

    ['splint'] = {
        label = 'Splint',
        weight = 500,
        stack = true,
        close = true,
        consume = 1,
        server = {
            export = 'ND_Ambulance.treatment',
        },
        client = {
            anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
            prop = { model = 'prop_toilet_roll_01', pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
            disable = { move = true, car = true, combat = true },
            usetime = 2500
        }
    },

    ['gauze'] = {
        label = 'Gauze',
        weight = 80,
        stack = true,
        close = true,
        consume = 1,
        server = {
            export = 'ND_Ambulance.treatment',
        },
        client = {
            anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
            prop = { model = 'prop_toilet_roll_01', pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
            disable = { move = true, car = true, combat = true },
            usetime = 2500
        }
    },

   ['tourniquet'] = {
    label = 'Tourniquet',
    weight = 85,
    stack = true,
    close = true,
    consume = 1,
    server = {
        export = 'ND_Ambulance.treatment',
    },
    client = {
        anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
        prop = { model = 'prop_rolled_sock_02', pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
        disable = { move = true, car = true, combat = true },
        usetime = 2500
    },

},
["hotdogstand"] = {
		label = "Hotdog Stand",
		weight = 10,
		stack = true,
		close = true,
	},

	["ketchup"] = {
		label = "Ketchup",
		weight = 1,
		stack = false,
		close = true,
	},

	["mayonnaise"] = {
		label = "Mayonnaise",
		weight = 1,
		stack = false,
		close = true,
	},

	["bun"] = {
		label = "Hotdog Bun",
		weight = 1,
		stack = true,
		close = true,
	},

['hotdog'] = {
    label = 'Hotdog',
    weight = 1,
    consume = 1,
		stack = true,
		close = true,	
    server = {
        export = 'uniqers-hotdog.hotdog_use'
    }
},


	["sausage"] = {
		label = "Sausage",
		weight = 1,
		stack = true,
		close = true,
	},



	["repairkit"] = {
		label = "Repair Kit",
		weight = 1,
		stack = true,
		close = true,
	},

["backpack1"] = { label = "Backpack 1", weight = 15, stack = false, close = true, description = "A stylish backpack" },
["backpack2"] = { label = "Backpack 2", weight = 15, stack = false, close = true, description = "A stylish backpack" },
["duffle1"] = { label = "Duffle Bag", weight = 15, stack = false, close = true, description = "A stylish duffle bag" },
["briefcase"] = { label = "Briefcase", weight = 10, stack = false, close = true, description = "Portable case for documents" },
["paramedicbag"] = { label = "Paramedic Bag", weight = 5, stack = false, close = true, description = "Medical bag for emergency care" },
["policepouches"] = { label = "Police Pouch", weight = 5, stack = false, close = true, description = "Tactical equipment pouch" },
["policepouches1"] = { label = "Police Pouch (Large)", weight = 5, stack = false, close = true, description = "Larger tactical pouch" },
["briefcaselockpicker"] = { label = "Briefcase Lockpicker", weight = 0.5, stack = true, close = true, description = "Lockpicker for briefcases" },
-- r_whippets
	['solargas_banana'] = {
		label = 'Solar Gas Banana',
		weight = 800,
		stack = false,
		close = true,
	},
	
	['solargas_banana_box'] = {
		label = 'Solar Gas Banana Box',
		weight = 850,
		stack = false,
		close = true,
	},
	
	['solargas_cottoncandy'] = {
		label = 'Solar Gas Cotton Candy',
		weight = 800,
		stack = true,
		close = true,
	},
	
	['solargas_cottoncandy_box'] = {
		label = 'Solar Gas Cotton Candy Box',
		weight = 850,
		stack = true,
		close = true,
	},
	
	['solargas_grape'] = {
		label = 'Solar Gas Grape',
		weight = 800,
		stack = false,
		close = true,
	},
	
	['solargas_grape_box'] = {
		label = 'Solar Gas Grape Box',
		weight = 850,
		stack = false,
		close = true,
	},
	
	['solargas_orange'] = {
		label = 'Solar Gas Orange',
		weight = 800,
		stack = false,
		close = true,
	},
	
	['solargas_orange_box'] = {
		label = 'Solar Gas Orange Box',
		weight = 850,
		stack = false,
		close = true,
	},
	
	['solargas_strawberry'] = {
		label = 'Solar Gas Strawberry',
		weight = 800,
		stack = false,
		close = true,
	},
	
	['solargas_strawberry_box'] = {
		label = 'Solar Gas Strawberry Box',
		weight = 850,
		stack = false,
		close = true,
	},
	
	['solargas_watermelon'] = {
		label = 'Solar Gas Watermelon',
		weight = 800,
		stack = false,
		close = true,
	},
	
	['solargas_watermelon_box'] = {
		label = 'Solar Gas Watermelon Box',
		weight = 850,
		stack = false,
		close = true,
	},
    ['blank_prescription'] = {
    label = 'Blank Prescription',
    description = nil,
    weight = 10,
    stack = true,
    close = true
},

['signed_prescription'] = {
    label = 'Prescription',
    description = nil,
    weight = 10,
    stack = true,
    close = true
},

['oxy_bottle'] = {
    label = 'Oxy Bottle',
    description = 'A bottle of addiction',
    weight = 115,
    stack = true,
    close = true
},

['oxycontin'] = {
    label = 'Oxycontin',
    weight = 5,
    stack = true,
    close = true

},
['heroin_scoring_tool'] = {
	label = "Scoring tool",
	weight = 250,
	stack = true,
	close = true,
	description = 'A tool used for scoring opium poppy'
},

['heroin_poppy'] = {
	label = "Opium poppy",
	weight = 25,
	stack = true,
	close = true,
	description = 'Opium poppy, used in the production of heroin'
},

['heroin_barrel'] = {
	label = "Barrel",
	weight = 750,
	stack = true,
	close = true,
	description = 'A barrel used for storing ingredients or mixtures'
},

['heroin_water_canister'] = {
	label = "Water canister",
	weight = 150,
	stack = true,
	close = true,
	description = 'A canister for storing water'
},

['heroin_water'] = {
	label = "Water",
	weight = 350,
	stack = true,
	close = true,
	description = 'Water, essential for various stages in the production process'
},

['heroin_calcium_oxide'] = {
	label = "Calcium oxide",
	weight = 50,
	stack = true,
	close = true,
	description = 'A chemical compound used in heroin production'
},

['heroin_morphine_base'] = {
	label = "Morphine base",
	weight = 100,
	stack = true,
	close = true,
	description = 'A key component in the manufacture of heroin'
},

['heroin_wood'] = {
	label = "Wood",
	weight = 200,
	stack = true,
	close = true,
	description = 'Wood, used as fuel in the production process'
},

['heroin_pot'] = {
	label = "Cooking pot",
	weight = 300,
	stack = true,
	close = true,
	description = 'A pot used for cooking and mixing ingredients'
},

['heroin_spoon'] = {
	label = "Spoon",
	weight = 20,
	stack = true,
	close = true,
	description = 'A spoon used for stirring and mixing ingredients'
},

['heroin_sodium_carbonate'] = {
	label = "Sodium carbonate",
	weight = 50,
	stack = true,
	close = true,
	description = 'A white, crystalline powder often used in chemical reactions.'
},

['heroin_acetic_anhydride'] = {
	label = "Acetic anhydride",
	weight = 50,
	stack = true,
	close = true,
	description = 'A colorless liquid that serves as a reagent for acetylation during chemical synthesis.'
},

['heroin_brown_heroin_base'] = {
	label = "Brown heroin base",
	weight = 50,
	stack = true,
	close = true,
	description = 'A partially refined version of heroin, brown in color.'
},

['heroin_plastic_pot'] = {
	label = "Plastic pot",
	weight = 70,
	stack = true,
	close = true,
	description = 'A standard plastic pot, often used for various applications including storage and mixing.'
},

['heroin_acetone_acid'] = {
	label = "Acetone acid",
	weight = 50,
	stack = true,
	close = true,
	description = 'Highly volatile and flammable liquid, commonly used as an organic solvent in labs.'
},

['heroin_ammonia_solution'] = {
	label = "Ammonia solution",
	weight = 50,
	stack = true,
	close = true,
	description = 'Solution of ammonia in water, utilized as a cleaning product and a component in various chemical reactions.'
},

['heroin_hydrochloric_acid'] = {
	label = "Hydrochloric acid",
	weight = 50,
	stack = true,
	close = true,
	description = 'A strong, corrosive acid used in chemical laboratories for a wide range of reactions.'
},

['heroin_activated_carbon'] = {
	label = "Activated carbon",
	weight = 50,
	stack = true,
	close = true,
	description = 'Charcoal that has been processed into ultra-fine particles, increasing its adsorption properties.'
},

['heroin'] = {
	label = "Heroin",
	weight = 20,
	stack = true,
	close = true,
	description = 'An illegal, highly addictive drug derived from morphine that has been processed with chemicals.'
},

['heroin_mixing_stick'] = {
	label = "Mixing stick",
	weight = 100,
	stack = true,
	close = true,
	description = 'A simple, typically wooden stick used for stirring and mixing.'
},

['heroin_litmus_paper'] = {
	label = "Litmus Paper",
	weight = 50,
	stack = true,
	close = true,
	description = 'A tool used to test the pH level of a liquid, changes color according to the pH level.'
},

['heroin_ph_9'] = {
	label = "PH 9",
	weight = 10,
	stack = true,
	close = true,
	description = 'Represents a slightly alkaline solution in the pH scale.'
},

['heroin_ph_8'] = {
	label = "PH 8",
	weight = 10,
	stack = true,
	close = true,
	description = 'Represents a slightly alkaline solution in the pH scale.'
},

['heroin_ph_10'] = {
	label = "PH 10",
	weight = 10,
	stack = true,
	close = true,
	description = 'Represents a slightly alkaline solution in the pH scale.'
},

['heroin_ph_11'] = {
	label = "PH 11",
	weight = 10,
	stack = true,
	close = true,
	description = 'Represents a slightly alkaline solution in the pH scale.'
},

['heroin_ph_12'] = {
	label = "PH 12",
	weight = 10,
	stack = true,
	close = true,
	description = 'Represents a slightly alkaline solution in the pH scale.'
},

['heroin_ph_13'] = {
	label = "PH 13",
	weight = 10,
	stack = true,
	close = true,
	description = 'Represents a slightly alkaline solution in the pH scale.'
},

['heroin_ph_14'] = {
	label = "PH 14",
	weight = 10,
	stack = true,
	close = true,
	description = 'Represents a slightly alkaline solution in the pH scale.'
},

['heroin_toxic_waste'] = {
	label = "Toxic waste",
	weight = 150,
	stack = true,
	close = true,
	description = 'Hazardous waste material that is harmful or potentially harmful to human health or the environment.'
},

['heroin_filtering_pipe'] = {
	label = "Filtering pipe",
	weight = 550,
	stack = true,
	close = true,
	description = 'A tube used for transferring or directing flow of substances in a fluid or gas state.'
},

['heroin_syringe_dose'] = {
	label = "Heroin dose",
	weight = 55,
	stack = true,
	close = true,
	description = 'Heroin dose'
},

['heroin_syringe'] = {
	label = "Syringe",
	weight = 15,
	stack = true,
	close = true,
	description = 'Syringe'
},

['scale'] = {
	label = "Scale",
	weight = 200,
	stack = true,
	close = true,
	description = 'Drug scale'
},

['drug_bag'] = {
	label = "Drug bag",
	weight = 10,
	stack = true,
	close = true,
	description = 'Dealer\'s delight.'
},

['gas_mask'] = {
	label = "Gas mask",
	weight = 100,
	stack = true,
	close = true,
	description = 'Breath of safety.'
},

['heroin_package'] = {
	label = "Heroin package",
	weight = 40,
	stack = true,
	close = true,
	description = 'Heroin package'
},

['lighter'] = {
	label = "Lighter",
	weight = 5,
	stack = true,
	close = true,
	description = 'Firestarter.'
},
['empty_oil'] = {
		    label = 'Empty Oil Container',
		    weight = 1000,
		    stack = true,
		    close = false,
		    description = 'An empty container for collecting crude oil'
		},
		['crude_light'] = {
		    label = 'Light Crude Oil',
		    weight = 2000,
		    stack = true,
		    close = false,
		    description = 'Unrefined light crude oil'
		},
		['crude_heavy'] = {
		    label = 'Heavy Crude Oil',
		    weight = 2500,
		    stack = true,
		    close = false,
		    description = 'Unrefined heavy crude oil'
		},
		['refined_light_pure'] = {
		    label = 'Pure Light Oil',
		    weight = 1800,
		    stack = true,
		    close = false,
		    description = 'High-quality refined light oil'
		},
		['refined_light_standard'] = {
		    label = 'Standard Light Oil',
		    weight = 1800,
		    stack = true,
		    close = false,
		    description = 'Standard-quality refined light oil'
		},
		['refined_light_dirty'] = {
		    label = 'Dirty Light Oil',
		    weight = 1800,
		    stack = true,
		    close = false,
		    description = 'Low-quality refined light oil'
		},
		['refined_heavy_pure'] = {
		    label = 'Pure Heavy Oil',
		    weight = 2200,
		    stack = true,
		    close = false,
		    description = 'High-quality refined heavy oil'
		},
		['refined_heavy_standard'] = {
		    label = 'Standard Heavy Oil',
		    weight = 2200,
		    stack = true,
		    close = false,
		    description = 'Standard-quality refined heavy oil'
		},
		['refined_heavy_dirty'] = {
		    label = 'Dirty Heavy Oil',
		    weight = 2200,
		    stack = true,
		    close = false,
		    description = 'Low-quality refined heavy oil'
		},
		['empty_drum'] = {
		    label = 'Empty Oil Drum',
		    weight = 1500,
		    stack = true,
		    close = false,
		    description = 'An empty drum for packaging refined oil'
		},
		['packaged_light_pure'] = {
		    label = 'Packaged Pure Light Oil',
		    weight = 3000,
		    stack = true,
		    close = false,
		    description = 'High-quality light oil ready for delivery'
		},
		['packaged_light_standard'] = {
		    label = 'Packaged Standard Light Oil',
		    weight = 3000,
		    stack = true,
		    close = false,
		    description = 'Standard-quality light oil ready for delivery'
		},
		['packaged_light_dirty'] = {
		    label = 'Packaged Dirty Light Oil',
		    weight = 3000,
		    stack = true,
		    close = false,
		    description = 'Low-quality light oil ready for delivery'
		},
		['packaged_heavy_pure'] = {
		    label = 'Packaged Pure Heavy Oil',
		    weight = 3500,
		    stack = true,
		    close = false,
		    description = 'High-quality heavy oil ready for delivery'
		},
		['packaged_heavy_standard'] = {
		    label = 'Packaged Standard Heavy Oil',
		    weight = 3500,
		    stack = true,
		    close = false,
		    description = 'Standard-quality heavy oil ready for delivery'
		},
		['packaged_heavy_dirty'] = {
		    label = 'Packaged Dirty Heavy Oil',
		    weight = 3500,
		    stack = true,
		    close = false,
		    description = 'Low-quality heavy oil ready for delivery'
		},
        ['animal_tracker'] = {
    label = 'Animal Tracker',
    weight = 200,
    allowArmed = true,
    stack = false,
},
['campfire'] = {
    label = 'Campfire',
    weight = 200,
    allowArmed = true,
    stack = false,
},

['huntingbait'] = {
    label = 'Hunting Bait',
    weight = 100,
    allowArmed = true,
},

['cooked_meat'] = {
    label = 'Cooked Meat',
    weight = 200,
},
['raw_meat'] = {
    label = 'Raw Meat',
    weight = 200,
},

['skin_deer_ruined'] = {
    label = 'Tattered Deer Pelt',
    weight = 200,
    stack = false,
},
['skin_deer_low'] = {
    label = 'Worn Deer Pelt',
    weight = 200,
},
['skin_deer_medium'] = {
    label = 'Supple Deer Pelt',
    weight = 200,
},
['skin_deer_good'] = {
    label = 'Prime Deer Pelt',
    weight = 200,
},
['skin_deer_perfect'] = {
    label = 'Flawless Deer Pelt',
    weight = 200,
},

['deer_horn'] = {
    label = 'Deer Horn',
    weight = 1000,
},
['lighter'] = {['name'] = 'lighter', ['label'] = 'Lighter', ['weight'] = 500, ['type'] = 'item', ['image'] = 'lighter.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Your description here'},
['cheap_lighter'] = {['name'] = 'cheap_lighter', ['label'] = 'Cheap Lighter', ['weight'] = 500, ['type'] = 'item', ['image'] = 'cheap_lighter.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Your description here'},
['vape'] = {['name'] = 'vape', ['label'] = 'Vape', ['weight'] = 500, ['type'] = 'item', ['image'] = 'vape.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Your description here'},

['glacatti'] = {['name'] = 'glacatti', ['label'] = 'Glacatti', ['weight'] = 500, ['type'] = 'item', ['image'] = 'glacatti.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['hary_payton'] = {['name'] = 'hary_payton', ['label'] = 'Harry Payton', ['weight'] = 500, ['type'] = 'item', ['image'] = 'hary_payton.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['grain_cream'] = {['name'] = 'grain_cream', ['label'] = 'Grain Cream', ['weight'] = 500, ['type'] = 'item', ['image'] = 'grain_cream.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['wild_feline'] = {['name'] = 'wild_feline', ['label'] = 'Wild Feline', ['weight'] = 500, ['type'] = 'item', ['image'] = 'wild_feline.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['frosty_phantom'] = {['name'] = 'frosty_phantom', ['label'] = 'Frosty Phantom', ['weight'] = 500, ['type'] = 'item', ['image'] = 'frosty_phantom.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['peach_cobbler'] = {['name'] = 'peach_cobbler', ['label'] = 'Peach Cobbler', ['weight'] = 500, ['type'] = 'item', ['image'] = 'peach_cobbler.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['boss_blend'] = {['name'] = 'boss_blend', ['label'] = 'Boss Blend', ['weight'] = 500, ['type'] = 'item', ['image'] = 'boss_blend.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['pastry_blend'] = {['name'] = 'pastry_blend', ['label'] = 'Pastry Blend', ['weight'] = 500, ['type'] = 'item', ['image'] = 'pastry_blend.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['pure_runs'] = {['name'] = 'pure_runs', ['label'] = 'Pure Runs', ['weight'] = 500, ['type'] = 'item', ['image'] = 'pure_runs.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['snowberry_gelato'] = {['name'] = 'snowberry_gelato', ['label'] = 'Snowberry Gelato', ['weight'] = 500, ['type'] = 'item', ['image'] = 'snowberry_gelato.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['berry_muffin'] = {['name'] = 'berry_muffin', ['label'] = 'Berry Muffin', ['weight'] = 500, ['type'] = 'item', ['image'] = 'berry_muffin.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['elegant_porcelain'] = {['name'] = 'elegant_porcelain', ['label'] = 'Elegant Porcelain', ['weight'] = 500, ['type'] = 'item', ['image'] = 'elegant_porcelain.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['rosy_dunes'] = {['name'] = 'rosy_dunes', ['label'] = 'Rosy Dunes', ['weight'] = 500, ['type'] = 'item', ['image'] = 'rosy_dunes.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['zen_blend'] = {['name'] = 'zen_blend', ['label'] = 'Zen Blend', ['weight'] = 500, ['type'] = 'item', ['image'] = 'zen_blend.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['crisp_gelato'] = {['name'] = 'crisp_gelato', ['label'] = 'Crisp Gelato', ['weight'] = 500, ['type'] = 'item', ['image'] = 'crisp_gelato.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['golden_biscuit'] = {['name'] = 'golden_biscuit', ['label'] = 'Golden Biscuit', ['weight'] = 500, ['type'] = 'item', ['image'] = 'golden_biscuit.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['collins_way'] = {['name'] = 'collins_way', ['label'] = 'Collins Way', ['weight'] = 500, ['type'] = 'item', ['image'] = 'collins_way.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['endurance_blend'] = {['name'] = 'endurance_blend', ['label'] = 'Endurance Blend', ['weight'] = 500, ['type'] = 'item', ['image'] = 'endurance_blend.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['choco_creme'] = {['name'] = 'choco_creme', ['label'] = 'Choco Creme', ['weight'] = 500, ['type'] = 'item', ['image'] = 'choco_creme.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['spiky_pear'] = {['name'] = 'spiky_pear', ['label'] = 'Spiky Pear', ['weight'] = 500, ['type'] = 'item', ['image'] = 'spiky_pear.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['runs_elite'] = {['name'] = 'runs_elite', ['label'] = 'Runs Elite', ['weight'] = 500, ['type'] = 'item', ['image'] = 'runs_elite.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['azure_tomyz'] = {['name'] = 'azure_tomyz', ['label'] = 'Azure Tomyz', ['weight'] = 500, ['type'] = 'item', ['image'] = 'azure_tomyz.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['vapor_essence'] = {['name'] = 'vapor_essence', ['label'] = 'Vapor Essence', ['weight'] = 500, ['type'] = 'item', ['image'] = 'vapor_essence.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['frosties_blend'] = {['name'] = 'frosties_blend', ['label'] = 'Frosties Blend', ['weight'] = 500, ['type'] = 'item', ['image'] = 'frosties_blend.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['bio_crunch'] = {['name'] = 'bio_crunch', ['label'] = 'Bio Crunch', ['weight'] = 500, ['type'] = 'item', ['image'] = 'bio_crunch.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['frosted_delight'] = {['name'] = 'frosted_delight', ['label'] = 'Frosted Delight', ['weight'] = 500, ['type'] = 'item', ['image'] = 'frosted_delight.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['royal_haze'] = {['name'] = 'royal_haze', ['label'] = 'Royal Haze', ['weight'] = 500, ['type'] = 'item', ['image'] = 'royal_haze.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['sunset_secret'] = {['name'] = 'sunset_secret', ['label'] = 'Sunset Secret', ['weight'] = 500, ['type'] = 'item', ['image'] = 'sunset_secret.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['fluffy_og'] = {['name'] = 'fluffy_og', ['label'] = 'Fluffy OG', ['weight'] = 500, ['type'] = 'item', ['image'] = 'fluffy_og.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['lunar_stone'] = {['name'] = 'lunar_stone', ['label'] = 'Lunar Stone', ['weight'] = 500, ['type'] = 'item', ['image'] = 'lunar_stone.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['tangy_fuel'] = {['name'] = 'tangy_fuel', ['label'] = 'Tangy Fuel', ['weight'] = 500, ['type'] = 'item', ['image'] = 'tangy_fuel.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['summit_og'] = {['name'] = 'summit_og', ['label'] = 'Summit OG', ['weight'] = 500, ['type'] = 'item', ['image'] = 'summit_og.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},

['glacatti_joint'] = {['name'] = 'glacatti_joint', ['label'] = 'Glacatti Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'glacatti_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['hary_payton_joint'] = {['name'] = 'hary_payton_joint', ['label'] = 'Hary Payton Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'hary_payton_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['grain_cream_joint'] = {['name'] = 'grain_cream_joint', ['label'] = 'Grain Cream Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'grain_cream_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['wild_feline_joint'] = {['name'] = 'wild_feline_joint', ['label'] = 'Wild Feline Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'wild_feline_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['frosty_phantom_joint'] = {['name'] = 'frosty_phantom_joint', ['label'] = 'Frosty Phantom Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'frosty_phantom_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['peach_cobbler_joint'] = {['name'] = 'peach_cobbler_joint', ['label'] = 'Peach Cobbler Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'peach_cobbler_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['boss_blend_joint'] = {['name'] = 'boss_blend_joint', ['label'] = 'Boss Blend Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'boss_blend_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['pastry_blend_joint'] = {['name'] = 'pastry_blend_joint', ['label'] = 'Pastry Blend Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'pastry_blend_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['pure_runs_joint'] = {['name'] = 'pure_runs_joint', ['label'] = 'Pure Runs Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'pure_runs_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['snowberry_gelato_joint'] = {['name'] = 'snowberry_gelato_joint', ['label'] = 'Snowberry Gelato Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'snowberry_gelato_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['berry_muffin_joint'] = {['name'] = 'berry_muffin_joint', ['label'] = 'Berry Muffin Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'berry_muffin_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['elegant_porcelain_joint'] = {['name'] = 'elegant_porcelain_joint', ['label'] = 'Elegant Porcelain Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'elegant_porcelain_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['rosy_dunes_joint'] = {['name'] = 'rosy_dunes_joint', ['label'] = 'Rosy Dunes Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'rosy_dunes_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['zen_blend_joint'] = {['name'] = 'zen_blend_joint', ['label'] = 'Zen Blend Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'zen_blend_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['crisp_gelato_joint'] = {['name'] = 'crisp_gelato_joint', ['label'] = 'Crisp Gelato Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'crisp_gelato_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['golden_biscuit_joint'] = {['name'] = 'golden_biscuit_joint', ['label'] = 'Golden Biscuit Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'golden_biscuit_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['collins_way_joint'] = {['name'] = 'collins_way_joint', ['label'] = 'Collins Way Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'collins_way_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['endurance_blend_joint'] = {['name'] = 'endurance_blend_joint', ['label'] = 'Endurance Blend Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'endurance_blend_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['choco_creme_joint'] = {['name'] = 'choco_creme_joint', ['label'] = 'Choco Creme Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'choco_creme_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['spiky_pear_joint'] = {['name'] = 'spiky_pear_joint', ['label'] = 'Spiky Pear Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'spiky_pear_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['runs_elite_joint'] = {['name'] = 'runs_elite_joint', ['label'] = 'Runs Elite Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'runs_elite_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['azure_tomyz_joint'] = {['name'] = 'azure_tomyz_joint', ['label'] = 'Azure Tomyz Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'azure_tomyz_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['vapor_essence_joint'] = {['name'] = 'vapor_essence_joint', ['label'] = 'Vapor Essence Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'vapor_essence_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['frosties_blend_joint'] = {['name'] = 'frosties_blend_joint', ['label'] = 'Frosties Blend Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'frosties_blend_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['bio_crunch_joint'] = {['name'] = 'bio_crunch_joint', ['label'] = 'Bio Crunch Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'bio_crunch_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['frosted_delight_joint'] = {['name'] = 'frosted_delight_joint', ['label'] = 'Frosted Delight Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'frosted_delight_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['royal_haze_joint'] = {['name'] = 'royal_haze_joint', ['label'] = 'Royal Haze Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'royal_haze_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['sunset_secret_joint'] = {['name'] = 'sunset_secret_joint', ['label'] = 'Sunset Secret Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'sunset_secret_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['fluffy_og_joint'] = {['name'] = 'fluffy_og_joint', ['label'] = 'Fluffy OG Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'fluffy_og_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['lunar_stone_joint'] = {['name'] = 'lunar_stone_joint', ['label'] = 'Lunar Stone Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'lunar_stone_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['tangy_fuel_joint'] = {['name'] = 'tangy_fuel_joint', ['label'] = 'Tangy Fuel Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'tangy_fuel_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},
['summit_og_joint'] = {['name'] = 'summit_og_joint', ['label'] = 'Summit OG Loo Leaf', ['weight'] = 500, ['type'] = 'item', ['image'] = 'summit_og_joint.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'SMOKE AT YOUR OWN RISK. LOO LEAFS CAUSE CANCER...'},

['backroots_honey'] = {['name'] = 'backroots_honey', ['label'] = 'Backroots Honey', ['weight'] = 500, ['type'] = 'item', ['image'] = 'backroots_honey.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['backroots_grape'] = {['name'] = 'backroots_grape', ['label'] = 'Backroots Grape', ['weight'] = 500, ['type'] = 'item', ['image'] = 'backroots_grape.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['graba_wrap'] = {['name'] = 'graba_wrap', ['label'] = 'Graba Wrap', ['weight'] = 500, ['type'] = 'item', ['image'] = 'graba_wrap.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['backroots_creamy_blend'] = {['name'] = 'backroots_creamy_blend', ['label'] = 'Backroots Creamy Blend', ['weight'] = 500, ['type'] = 'item', ['image'] = 'backroots_creamy_blend.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['preston_pearl_cigars'] = {['name'] = 'preston_pearl_cigars', ['label'] = 'Preston Pearl Cigars', ['weight'] = 500, ['type'] = 'item', ['image'] = 'preston_pearl_cigars.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['banana_backroots'] = {['name'] = 'banana_backroots', ['label'] = 'Banana Backroots', ['weight'] = 500, ['type'] = 'item', ['image'] = 'banana_backroots.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['pure_cone_king'] = {['name'] = 'pure_cone_king', ['label'] = 'Pure Cone King', ['weight'] = 500, ['type'] = 'item', ['image'] = 'pure_cone_king.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},

['berry_swirl'] = {['name'] = 'berry_swirl', ['label'] = 'Berry Swirl', ['weight'] = 500, ['type'] = 'item', ['image'] = 'berry_swirl.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['golden_crumble'] = {['name'] = 'golden_crumble', ['label'] = 'Golden Crumble', ['weight'] = 500, ['type'] = 'item', ['image'] = 'golden_crumble.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['biscuit_bliss'] = {['name'] = 'biscuit_bliss', ['label'] = 'Biscuit Bliss', ['weight'] = 500, ['type'] = 'item', ['image'] = 'biscuit_bliss.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['citrus_crumble'] = {['name'] = 'citrus_crumble', ['label'] = 'Citrus Crumble', ['weight'] = 500, ['type'] = 'item', ['image'] = 'citrus_crumble.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['fluffy_crunch'] = {['name'] = 'fluffy_crunch', ['label'] = 'Fluffy Crunch', ['weight'] = 500, ['type'] = 'item', ['image'] = 'fluffy_crunch.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['blend_99'] = {['name'] = 'blend_99', ['label'] = 'Blend 99', ['weight'] = 500, ['type'] = 'item', ['image'] = 'blend_99.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['paris_mist'] = {['name'] = 'paris_mist', ['label'] = 'Paris Mist', ['weight'] = 500, ['type'] = 'item', ['image'] = 'paris_mist.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['bounce_blend'] = {['name'] = 'bounce_blend', ['label'] = 'Bounce Blend', ['weight'] = 500, ['type'] = 'item', ['image'] = 'bounce_blend.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['spiced_crumble'] = {['name'] = 'spiced_crumble', ['label'] = 'Spiced Crumble', ['weight'] = 500, ['type'] = 'item', ['image'] = 'spiced_crumble.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['clover_crunch'] = {['name'] = 'clover_crunch', ['label'] = 'Clover Crunch', ['weight'] = 500, ['type'] = 'item', ['image'] = 'clover_crunch.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['berry_bliss'] = {['name'] = 'berry_bliss', ['label'] = 'Berry Bliss', ['weight'] = 500, ['type'] = 'item', ['image'] = 'berry_bliss.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},


['loofleafcookies'] = {['name'] = 'loofleafcookies', ['label'] = 'Cookies & Cream Loo Leafs', ['weight'] = 500, ['type'] = 'item', ['image'] = 'loofleafcookies.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Best leafs on the market...'},
['looleafhoneybourbon'] = {['name'] = 'looleafhoneybourbon', ['label'] = 'Honey Bourbon Loo Leafs', ['weight'] = 500, ['type'] = 'item', ['image'] = 'looleafhoneybourbon.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Best leafs on the market...'},
['tropicalwisherweet'] = {['name'] = 'tropicalwisherweet', ['label'] = 'Tropical Wisher Weets', ['weight'] = 500, ['type'] = 'item', ['image'] = 'tropicalwisherweet.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Best leafs on the market...'},
['tripplegrapegangowl'] = {['name'] = 'tripplegrapegangowl', ['label'] = 'Triple Grape Gang Owls', ['weight'] = 500, ['type'] = 'item', ['image'] = 'tripplegrapegangowl.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Best leafs on the market...'},
['wishersweetaromaticleaf'] = {['name'] = 'wishersweetaromaticleaf', ['label'] = 'Sweet Aromatic Wisher Weet Leafs', ['weight'] = 500, ['type'] = 'item', ['image'] = 'wishersweetaromaticleaf.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Best leafs on the market...'},
['wisherweetoriginal'] = {['name'] = 'wisherweetoriginal', ['label'] = 'Orginal Wisher Weets', ['weight'] = 500, ['type'] = 'item', ['image'] = 'wisherweetoriginal.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Best leafs on the market...'},
['hoodtimesleaf'] = {['name'] = 'hoodtimesleaf', ['label'] = 'Fruit Punch Hood Times', ['weight'] = 500, ['type'] = 'item', ['image'] = 'hoodtimesleaf.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Best leafs on the market...'},
['gangowlleaf'] = {['name'] = 'gangowlleaf', ['label'] = 'Strawberry Gang Owls', ['weight'] = 500, ['type'] = 'item', ['image'] = 'gangowlleaf.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Best leafs on the market...'},
['wisherweetdiamond'] = {['name'] = 'wisherweetdiamond', ['label'] = 'Diamond Wisher Weets', ['weight'] = 500, ['type'] = 'item', ['image'] = 'wisherweetdiamond.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Best leafs on the market...'},
['juicecaponeleaf'] = {['name'] = 'juicecaponeleaf', ['label'] = 'Capone Leafs', ['weight'] = 500, ['type'] = 'item', ['image'] = 'juicecaponeleaf.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Best leafs on the market...'},
['blueberrywisherweet'] = {['name'] = 'blueberrywisherweet', ['label'] = 'Blueberry Wisher Weets', ['weight'] = 500, ['type'] = 'item', ['image'] = 'blueberrywisherweet.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Best leafs on the market...'},

['looleafstrawberry'] = {['name'] = 'looleafstrawberry', ['label'] = 'Strawberry Loo Leafs', ['weight'] = 500, ['type'] = 'item', ['image'] = 'looleafstrawberry.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Best leafs on the market...'},

    
    

	['medicbag'] = {
    label = 'Medic Bag',
    weight = 5000,
    stack = true,
    close = true,
    description = 'A bag containing essential medical supplies.',
},
['ambulance_gps'] = {
    label = 'Ambulance GPS',
    weight = 50,
    stack = false,
    close = true,
    description = 'A specialized GPS for locating emergencies.',
},
['wheelchair'] = {
    label = 'Wheelchair',
    weight = 20000,
    stack = false,
    close = true,
    description = 'A device used for transporting patients with mobility issues.',
},
['crutch'] = {
    label = 'Crutch',
    weight = 5000,
    stack = false,
    close = true,
    description = 'Used to aid walking after leg injuries.',
},
['stretcher'] = {
    label = 'Stretcher',
    weight = 15000,
    stack = false,
    close = true,
    description = 'Used to carry injured or ill people.',
},
['bodybag'] = {
    label = 'Body Bag',
    weight = 2000,
    stack = true,
    close = true,
    description = 'Used to transport deceased persons.',
},
['bandage'] = {
    label = 'Bandage',
    weight = 200,
    stack = true,
    close = true,
    description = 'Used to stop minor bleeding.',
},
['icepack'] = {
    label = 'Ice Pack',
    weight = 300,
    stack = true,
    close = true,
    description = 'Used to reduce swelling and numb pain.',
},
['ointment'] = {
    label = 'Ointment',
    weight = 150,
    stack = true,
    close = true,
    description = 'A topical cream for minor skin irritations.',
},
['defibrilator'] = {
    label = 'Defibrillator',
    weight = 10000,
    stack = false,
    close = true,
    description = 'Used to restore normal heart rhythm to a person in cardiac arrest.',
},
['splint'] = {
    label = 'Splint',
    weight = 500,
    stack = true,
    close = true,
    description = 'Used to immobilize a fractured or dislocated limb.',
},
['suture_kit'] = {
    label = 'Suture Kit',
    weight = 750,
    stack = true,
    close = true,
    description = 'A kit for stitching up large wounds.',
},
['morphine'] = {
    label = 'Morphine',
    weight = 100,
    stack = true,
    close = true,
    description = 'A powerful narcotic for severe pain relief.',
},
['medical_kit'] = {
    label = 'Medical Kit',
    weight = 1500,
    stack = true,
    close = true,
    description = 'A comprehensive kit for moderate injuries.',
},
['disinfectant'] = {
    label = 'Disinfectant',
    weight = 250,
    stack = true,
    close = true,
    description = 'Used to clean wounds and prevent infection.',
},
['advanced_medical_kit'] = {
    label = 'Advanced Medical Kit',
    weight = 3000,
    stack = true,
    close = true,
    description = 'A high-level kit for critical medical emergencies.',
},
['blood_bag_250'] = {
    label = 'Blood Bag (250ml)',
    weight = 300,
    stack = true,
    close = true,
    description = 'A small bag of blood for transfusions.',
},
['blood_bag_500'] = {
    label = 'Blood Bag (500ml)',
    weight = 600,
    stack = true,
    close = true,
    description = 'A standard bag of blood for transfusions.',
},
['antipyretics'] = {
    label = 'Antipyretics',
    weight = 50,
    stack = true,
    close = true,
    description = 'Medication used to prevent or reduce fever.',
},
['painkillers'] = {
    label = 'Painkillers',
    weight = 50,
    stack = true,
    close = true,
    description = 'Medication to relieve pain.',
},
['gauze'] = {
    label = 'Gauze',
    weight = 100,
    stack = true,
    close = true,
    description = 'Sterile cotton for dressing wounds.',
},
['adrenaline'] = {
    label = 'Adrenaline',
    weight = 50,
    stack = true,
    close = true,
    description = 'Used to treat severe allergic reactions or cardiac arrest.',
},
['cyclonamine'] = {
    label = 'Cyclonamine',
    weight = 50,
    stack = true,
    close = true,
    description = 'Medication to help control bleeding.',
},
['tourniquet'] = {
    label = 'Tourniquet',
    weight = 200,
    stack = true,
    close = true,
    description = 'Used to stop severe blood loss from a limb.',
},


	["samsungphone"] = {
		label = "Samsung S10",
		weight = 1000,
		stack = true,
		close = true,
		description = "Very expensive phone",
		client = {
			image = "samsungphone.png",
		}
	},

	["weed_amnesia_seed"] = {
		label = "Amnesia Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Amnesia",
		client = {
			image = "weed_seed.png",
		}
	},

	["weed_amnesia"] = {
		label = "Amnesia 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Amnesia",
		client = {
			image = "weed_baggy.png",
		}
	},

	["weed_ogkush"] = {
		label = "OGKush 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g OG Kush",
		client = {
			image = "weed_baggy.png",
		}
	},
    ["houserobbery_bag"] = {
    label = "Heist Bag",
    weight = 500,
    stack = false,
    close = true,
},

["houserobbery_tablet"] = {
    label = "House Robbery Tablet",
    weight = 500,
    stack = false,
    close = true,
},

["wine"] = {
    label = "Wine",
    weight = 300,
    stack = true,
    close = false,
},

["whiskey"] = {
    label = "Whiskey",
    weight = 500,
    stack = true,
    close = true,
},

["weed_ak47"] = {
    label = "AK47 2g",
    weight = 200,
    stack = true,
    close = false,
},

["cokebaggy"] = {
    label = "Bag of Coke",
    weight = 0,
    stack = true,
    close = true,
},

["meth"] = {
    label = "Meth",
    weight = 100,
    stack = true,
    close = true,
},

["rolex"] = {
    label = "Golden Watch",
    weight = 1500,
    stack = true,
    close = true,
},

["diamond_ring"] = {
    label = "Diamond Ring",
    weight = 1500,
    stack = true,
    close = true,
},

["goldchain"] = {
    label = "Golden Chain",
    weight = 1500,
    stack = true,
    close = true,
},

["tenkgoldchain"] = {
    label = "10k Gold Chain",
    weight = 2000,
    stack = true,
    close = true,
},

["goldbar"] = {
    label = "Gold Bar",
    weight = 7000,
    stack = true,
    close = true,
},

["iphone"] = {
    label = "iPhone",
    weight = 1000,
    stack = true,
    close = true,
},

["samsungphone"] = {
    label = "Samsung S10",
    weight = 1000,
    stack = true,
    close = true,
},

["laptop"] = {
    label = "Laptop",
    weight = 4000,
    stack = true,
    close = true,
},

["tablet"] = {
    label = "Tablet",
    weight = 2000,
    stack = true,
    close = true,
},

["smartwatch"] = {
    label = "Smart Watch",
    weight = 2000,
    stack = true,
    close = true,
},
}