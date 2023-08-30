print("^2Jim^7-^2Recycle v^42^7.^45 ^7- ^2Recycling Script by ^1Jimathy^7")

Config = {
	Lan = "en",
	Debug = true, -- Toggle Debug Mode
	Blips = true, -- Enable Blips?
	BlipNamer = false, -- Enable to Name Blips different things, disable if you already have too many blips as this will group them together
	Pedspawn = true, -- Do you want to spawn peds for main locations?
	img = "qb-inventory/html/images/", -- Set this to your inventory

	Core = "qb-core", -- set this to your core folder
	Inv = "qb", -- set to "ox" if using OX Inventory

	JimMenu = true, -- If using updated qb-menu icons, set this true
	JobRole = nil, -- Whats the job role you want to use this? "nil" for none
	EnableOpeningHours = true, -- Enable opening hours? If disabled you can always open the pawnshop.
	OpenHour = 9, -- From what hour should the pawnshop be open?
	CloseHour = 21, -- From what hour should the pawnshop be closed?
	PayAtDoor = nil, -- Set to nil stop turn this off, set to a number to enable

	useQBLock = false, -- Enable to use qb-lock instead of qb-skillbar when searching

	OutsideTele = vec4(746.83, -1399.66, 26.6, 230.732),
	InsideTele = vec4(993.16, -3097.61, -39.90, 82.95),

	scrapPool = {
		--{ model = ``, xPos = , yPos = , zPos = , xRot = , yRot = , zRot = },
		--{ model = `sf_prop_sf_art_box_cig_01a`, xPos = 0.16, yPos = -0.06, zPos = 0.21, xRot = 52.0, yRot = 288.0, zRot = 175.0},
		{ model = `hei_prop_drug_statue_box_01`, xPos = 0.08, yPos = 0.05, zPos = 0.06, xRot = 7.0, yRot = 198.0, zRot = 145.0},
		{ model = `prop_mat_box`, xPos = 0.0, yPos = 0.28, zPos = 0.36, xRot = 136.0, yRot = 114.0, zRot = 181.0},
		{ model = `prop_box_ammo03a`, xPos = -0.08, yPos = 0.04, zPos = 0.32, xRot = 76.0, yRot = 110.0, zRot = 185.0},
		{ model = `prop_rub_scrap_06`, xPos = 0.01, yPos = 0.02, zPos = 0.27, xRot = 85.0, yRot = 371.0, zRot = 177.0 },
		{ model = `prop_cs_cardbox_01`, xPos = 0.04, yPos = 0.04, zPos = 0.28, xRot = 52.0, yRot = 294.0, zRot = 177.0 },
		{ model = `v_ret_gc_bag01`, xPos = 0.16, yPos = 0.08, zPos = 0.24, xRot = 68.0, yRot = 394.0, zRot = 141.0 },
		{ model = `prop_ld_suitcase_01`, xPos = -0.04, yPos = 0.06, zPos = 0.31, xRot = -2.0, yRot = 21.0, zRot = 155.0 },
		{ model = `v_ind_cs_toolbox2`, xPos = 0.04, yPos = 0.12, zPos = 0.29, xRot = 56.0, yRot = 287.0, zRot = 169.0 },
	},

	Locations =  {
		["Centres"] = {
			["RecycleCity"] = {
				Enable = true,
				Blip = {
					blipEnable = true,
					name = "Recycle Center",
					coords = vec4(744.68, -1401.77, 26.55, 248.73),
					blipTrue = true,
					sprite = 365,
					col = 2,
					model = `G_M_M_ChemWork_01`,
					scenario = "WORLD_HUMAN_CLIPBOARD",
				},
				Zone = {
					vec2(992.39141845703, -3113.3854980469),
					vec2(1028.5169677734, -3113.1450195312),
					vec2(1027.978515625, -3088.9782714844),
					vec2(992.19049072266, -3089.8234863281)
				},
				JobLocations = {
					--Enter = { coords = vec4(746.82, -1398.93, 26.55, 0.0), w = 1, d = 1, minZ = 1, maxZ = 1 tele = },
					--Exit = { coords = vec4(746.82, -1398.93, 26.55, 0.0), w = 1, d = 1, minZ = 1, maxZ = 1 tele = },
					--Duty = { coords = vec4( ), w = , d = , minZ = , maxZ = },
					--Trolly = { coords = vec4(746.82, -1398.93, 26.55, 0.0), w = 1, d = 1, minZ = 1, maxZ = 1 tele = },
				},
				SearchLocations = {
					vec4(1003.63, -3108.50, -39.99, 0.0),
					vec4(1018.18, -3102.80, -39.99, 0.0),
					vec4(1013.33, -3102.80, -39.99, 0.0),
					vec4(1018.18, -3096.95, -39.99, 0.0),
					vec4(1006.05, -3091.60, -39.99, 0.0),
					vec4(1018.18, -3108.50, -39.99, 0.0),
					vec4(1008.48, -3102.80, -39.99, 0.0),
					vec4(1015.75, -3102.80, -39.99, 0.0),
					vec4(1018.18, -3091.60, -39.99, 0.0),
					vec4(1003.63, -3091.60, -39.99, 0.0),
					vec4(1010.90, -3108.50, -39.99, 0.0),
					vec4(1010.90, -3096.95, -39.99, 0.0),
					vec4(1008.48, -3096.95, -39.99, 0.0),
					vec4(1010.90, -3102.80, -39.99, 0.0),
					vec4(1006.05, -3108.50, -39.99, 0.0),
					vec4(1015.75, -3108.50, -39.99, 0.0),
					vec4(1003.63, -3096.95, -39.99, 0.0),
					vec4(1013.33, -3091.60, -39.99, 0.0),
					vec4(1013.33, -3108.50, -39.99, 0.0),
					vec4(1010.90, -3091.60, -39.99, 0.0),
					vec4(1008.48, -3091.60, -39.99, 0.0),
					vec4(1008.48, -3108.50, -39.99, 0.0),
					vec4(1003.63, -3102.80, -39.99, 0.0),
					vec4(1006.05, -3096.95, -39.99, 0.0),
					vec4(1015.75, -3091.60, -39.99, 0.0),
					vec4(1015.75, -3096.95, -39.99, 0.0),
					vec4(1006.05, -3102.80, -39.99, 0.0),
					vec4(1013.33, -3096.95, -39.99, 0.0),
					vec4(1026.75, -3096.43, -39.99, -90.0),
					vec4(1026.75, -3106.52, -39.99, -90.0),
					vec4(1026.75, -3091.59, -39.99, -90.0),
					vec4(1026.75, -3111.38, -39.99, -90.0),
					vec4(1026.75, -3108.88, -39.99, -90.0),
					vec4(1026.75, -3094.01, -39.99, -90.0),
					vec4(993.355, -3106.60, -39.99, 90.0),
					vec4(993.355, -3111.30, -39.99, 90.0),
					vec4(993.355, -3108.95, -39.99, 90.0),
				},
				ExtraPropLocations = {
					vec4(1006.05, -3096.95, -37.81, 0.0),
					vec4(1003.63, -3102.80, -37.81, 0.0),
					vec4(1003.63, -3091.60, -37.81, 0.0),
					vec4(1013.33, -3096.95, -37.81, 0.0),
					vec4(1008.48, -3108.50, -37.81, 0.0),
					vec4(1018.18, -3096.95, -37.81, 0.0),
					vec4(1013.33, -3108.50, -37.81, 0.0),
					vec4(1003.63, -3108.50, -37.81, 0.0),
					vec4(1013.33, -3091.60, -37.81, 0.0),
					vec4(1013.33, -3102.80, -37.81, 0.0),
					vec4(1003.63, -3096.95, -37.81, 0.0),
					vec4(1006.05, -3108.50, -37.81, 0.0),
					vec4(1015.75, -3096.95, -37.81, 0.0),
					vec4(1018.18, -3102.80, -37.81, 0.0),
					vec4(1018.18, -3108.50, -37.81, 0.0),
					vec4(1008.48, -3102.80, -37.81, 0.0),
					vec4(1018.18, -3091.60, -37.81, 0.0),
					vec4(1015.75, -3108.50, -37.81, 0.0),
					vec4(1008.48, -3091.60, -37.81, 0.0),
					vec4(1008.48, -3096.60, -37.81, 0.0),
					vec4(1006.05, -3091.60, -37.81, 0.0),
					vec4(1026.75, -3106.52, -37.81, -90.0),
					vec4(1026.75, -3111.38, -37.81, -90.0),
					vec4(1026.75, -3091.59, -37.81, -90.0),
					vec4(1026.75, -3094.01, -37.81, -90.0),
					vec4(1026.75, -3108.88, -37.81, -90.0),
					vec4(1026.75, -3096.43, -37.81, -90.0),
					vec4(993.355, -3106.60, -37.81, 90.0),
					vec4(993.355, -3111.30, -37.81, 90.0),
					vec4(993.355, -3108.95, -37.81, 90.0),
					vec4(1013.33, -3102.80, -35.62, 0.0),
					vec4(1015.75, -3102.80, -35.62, 0.0),
					vec4(1013.33, -3108.50, -35.62, 0.0),
					vec4(1015.75, -3108.50, -35.62, 0.0),
					vec4(1018.18, -3096.95, -35.62, 0.0),
					vec4(1003.63, -3108.50, -35.61, 0.0),
					vec4(1018.18, -3091.60, -35.74, 0.0),
					vec4(1008.48, -3091.60, -35.62, 0.0),
					vec4(1015.75, -3091.60, -35.74, 0.0),
					vec4(1008.48, -3096.95, -35.60, 0.0),
					vec4(1010.90, -3096.95, -35.60, 0.0),
					vec4(1010.90, -3091.60, -35.62, 0.0),
					vec4(1013.33, -3091.60, -35.74, 0.0),
					vec4(1003.63, -3091.60, -35.62, 0.0),
					vec4(1013.33, -3096.95, -35.62, 0.0),
					vec4(1010.90, -3108.50, -35.75, 0.0),
					vec4(1018.18, -3108.50, -35.75, 0.0),
					vec4(1026.75, -3106.52, -35.62, -90.0),
					vec4(1026.75, -3108.88, -35.62, -90.0),
					vec4(1026.75, -3111.38, -35.62, -90.0),
					vec4(1026.75, -3091.59, -35.74, -90.0),
					vec4(1026.75, -3094.01, -35.74, -90.0),
					vec4(1026.75, -3096.43, -35.74, -90.0),
					vec4(993.355, -3106.60, -35.60, 90.0),
					vec4(993.355, -3111.30, -35.60, 90.0),
					vec4(993.355, -3108.95, -35.62, 90.0),

				},
			},
			["RecycleNorth"] = {
				Blip = {
					blipEnable = true,
					name = "Recycle Center",
					coords = vec4(55.55, 6472.18, 31.43, 44.0),
					blipTrue = true,
					sprite = 365,
					col = 2,
					model = `G_M_M_ChemWork_01`,
					scenario = "WORLD_HUMAN_CLIPBOARD",
				},
				SearchLocations = {
					vector4(1067.68, -3095.57, -39.9, 342.39),
					vector4(1065.20, -3095.57, -39.9, 342.39),
					vector4(1062.73, -3095.57, -39.9, 342.39),
					vector4(1060.37, -3095.57, -39.9, 342.39),
					vector4(1057.95, -3095.57, -39.9, 342.39),
					vector4(1055.58, -3095.57, -39.9, 342.39),
					vector4(1053.09, -3095.57, -39.9, 342.39),

					vector4(1053.07, -3102.62, -39.9, 342.39),
					vector4(1055.49, -3102.62, -39.9, 342.39),
					vector4(1057.93, -3102.62, -39.9, 342.39),
					vector4(1060.19, -3102.62, -39.9, 342.39),
					vector4(1062.71, -3102.62, -39.9, 342.39),
					vector4(1065.19, -3102.62, -39.9, 342.39),
					vector4(1067.46, -3102.62, -39.9, 342.39),

					vector4(1067.69, -3109.71, -39.9, 342.39),
					vector4(1065.13, -3109.71, -39.9, 342.39),
					vector4(1062.70, -3109.71, -39.9, 342.39),
					vector4(1060.24, -3109.71, -39.9, 342.39),
					vector4(1057.76, -3109.71, -39.9, 342.39),
					vector4(1055.52, -3109.71, -39.9, 342.39),
					vector4(1053.16, -3109.71, -39.9, 342.39),
				},
				ExtraPropLocations = {
				},
			},
		},
		['Trade'] ={
			{ name = "Recyclable Trader", coords = vec4(997.48, -3097.44, -39.0, 234.53), blipTrue = false, sprite = 365, col = 2, model = `G_M_M_ChemWork_01`, scenario = "WORLD_HUMAN_CLIPBOARD", },
		},
		['BottleBanks'] = {
			{ name = "Bottle Bank", coords = vec4(757.06, -1399.68, 26.57 , 178.1), blipTrue = true, sprite = 642, col = 2, model = `G_M_M_ChemWork_01`, scenario = "WORLD_HUMAN_CLIPBOARD", },
			{ name = "Bottle Bank", coords = vec4(84.01, -220.32, 54.64 , 337.89), blipTrue = true, sprite = 642, col = 2, model = `G_M_M_ChemWork_01`, scenario = "WORLD_HUMAN_CLIPBOARD", },
			{ name = "Bottle Bank", coords = vec4(31.88, -1315.58, 29.52 , 357.19), blipTrue = true, sprite = 642, col = 2, model = `G_M_M_ChemWork_01`, scenario = "WORLD_HUMAN_CLIPBOARD", },
			{ name = "Bottle Bank", coords = vec4(29.08, -1769.99, 29.61 , 50.0), blipTrue = true, sprite = 642, col = 2, model = `G_M_M_ChemWork_01`, scenario = "WORLD_HUMAN_CLIPBOARD", },
			{ name = "Bottle Bank", coords = vec4(394.08, -877.48, 29.35 , 310.12), blipTrue = true, sprite = 642, col = 2, model = `G_M_M_ChemWork_01`, scenario = "WORLD_HUMAN_CLIPBOARD", },
			{ name = "Bottle Bank", coords = vec4(-1267.97, -812.08, 17.11 , 128.12), blipTrue = true, sprite = 642, col = 2, model = `G_M_M_ChemWork_01`, scenario = "WORLD_HUMAN_CLIPBOARD", },
		},
	},
	Prices = {
		['copper'] = 10,
		['plastic'] = 10,
		['metalscrap'] = 10,
		['steel'] = 10,
		['glass'] = 10,
		['iron'] = 10,
		['rubber'] = 10,
		['aluminum'] = 10,
		['bottle'] = 5,
		['can'] = 5,
	},
	TradeTable = {
		"copper",
		"plastic",
		"metalscrap",
		"steel",
		"glass",
		"iron",
		"rubber",
		"aluminum",
		"bottle",
		"can",
	},
	DumpItems = {
		"bottle",
		"can",
		"sandwich",
	},
	ScrapItems = {
		"steel",
		"copper",
		"iron",
		"glass",
		"bottle",
		"can",
	},
	RecycleAmounts = {
		recycleMin = 10,
		recycleMax = 25,

		tenMin = 2,
		tenMax = 5,

		hundMin = 5,
		hundMax = 14,

		thouMin = 10,
		thouMax = 28,
	}
}

Loc = {}
