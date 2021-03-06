return {
	armack = {
		acceleration = 0.432,
		brakerate = 2.7,
		buildcostenergy = 6534,
		buildcostmetal = 370,
		builddistance = 136,
		builder = true,
		buildpic = "ARMACK.DDS",
		buildtime = 9432,
		canmove = true,
		category = "KBOT MOBILE ALL NOTSUB NOWEAPON NOTSHIP NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 -7 -2",
		collisionvolumescales = "27 35 23",
		collisionvolumetype = "box",
		corpse = "DEAD",
		description = "Tech Level 2",
		energymake = 14,
		energystorage = 100,
		energyuse = 14,
		explodeas = "BIG_UNITEX",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 840,
		maxslope = 20,
		maxvelocity = 1.15,
		maxwaterdepth = 25,
		metalmake = 0.14,
		metalstorage = 100,
		movementclass = "KBOT2",
		name = "Advanced Construction Kbot",
		objectname = "ARMACK",
		radardistance = 50,
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		sightdistance = 323.70001,
		terraformspeed = 900,
		turninplace = 1,
		turninplaceanglelimit = 60,
		turninplacespeedlimit = 0.759,
		turnrate = 990,
		upright = true,
		workertime = 180,
		buildoptions = {
			[1] = "armfus",
			[2] = "armckfus",
			[3] = "armshltx",
			[4] = "amgeo",
			[5] = "armgmm",
			[6] = "armmoho",
			[7] = "armmmkr",
			[8] = "armuwadves",
			[9] = "armuwadvms",
			[10] = "armarad",
			[11] = "armveil",
			[12] = "armfort",
			[13] = "armasp",
			[14] = "armtarg",
			[15] = "armsd",
			[16] = "armgate",
			[17] = "armamb",
			[18] = "armpb",
			[19] = "armanni",
			[20] = "armflak",
			[21] = "mercury",
			[22] = "armemp",
			[23] = "armamd",
			[24] = "armsilo",
			[25] = "armbrtha",
			[26] = "armvulc",
			[27] = "armdf",
			[28] = "armlab",
			[29] = "armalab",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "1.64561462402 6.61621093734e-06 -1.44562530518",
				collisionvolumescales = "29.6044616699 29.4648132324 28.049697876",
				collisionvolumetype = "Box",
				damage = 700,
				description = "Advanced Construction Kbot Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				hitdensity = 100,
				metal = 189,
				object = "ARMACK_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 500,
				description = "Advanced Construction Kbot Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 76,
				object = "2X2B",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sounds = {
			build = "nanlath1",
			canceldestruct = "cancel2",
			capture = "capture1",
			repair = "repair1",
			underattack = "warning1",
			working = "reclaim1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "kbarmmov",
			},
			select = {
				[1] = "kbarmsel",
			},
		},
	},
}
