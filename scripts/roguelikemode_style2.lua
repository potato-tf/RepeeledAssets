--[[Design thoughts (subjective)
Roguelikes in games typicallly follow a standard loop of progressing through a level
giving the players power spikes and maintaining survival as the winning condition
There are some parallels that can be applied to typical MvM (forgoing death as a lose condition),
or you can choose to opt for a total gamemode replacement

Some games to take inspiration from:
	Risk of Rain 2
	Vampire Survivors (and heavily inspired Holocure, 20 Minutes Til Dawn)
	Hades
	The Binding of Issac
	Enter The Gungeon

The most important thing to consider is how much control you want to give the players in terms of progression
Currently this is done by the number of upgrades and rerolls given, but you can also come up with other methods
Such as introducing another currency, or keeping the regular upgrade menu, or limiting which upgrades appear
until a certain wave, or perhaps even introducing a "refund and craft upgrade system"
Any mechanic you can think is possible in lua

Some features I wanted to implement but got lazy:
	Picking upgrades from RNG based on what loadout you have
	Using ItemAttributes instead of CharacterAttributes
	Some sort of sensible refund/respec that isn't completely overpowered
	Possible form of "weighted RNG" to allow RNG manipulation and more nuanced upgrading choices

"Style2" refers to the upgrade menu being rerolled after every purchase, 
there should be no duplicate upgrades in the shop so as not to waste slots
Think Vampire Survivors/Hades

"Style1" was when the upgrade menu behaved more similar to the regular shop, 
you could buy any choice of upgrades and it only rerolled on wave end
]]

--[[Global variables 
MenuCapacity - How many upgrades can be stored in the menu, keep as integer
	Note that the sourcemod menu has a 512 byte limit, try to keep names/descriptions short
	Byte limit as opposed to a character limit means that inserting unicode characters which contain more than 1 byte
	will use up more of the limit
	
	You can use special characters like \n in sourcemod menus
	
	If you go above 7 selections (6+1 reroll selections) the sourcemod menu will display the Next and Previous buttons
	Personally I find this to be a bit clunky so I would stick with using a MenuCapacity of 6, 7 if you want to
	prevent accidental rerolls
	
TotalUpgradePoints - Determines the starting amount of upgrade points on wave 1, and for any late joiners, keep as integer

TotalRerollPoints - Determines the starting amount of upgrade points on wave 1, and for any late joiners, keep as integer]]

MenuCapacity = 6
TotalUpgradePoints = 6
TotalRerollPoints = 1


--[[AllShops is a table that controls what upgrades are shown to players, based on what class they are
	Note that it uses the game's interal reference for classes, which is different from their class selection screen order
	
	Each class can have any number of subtables or sub categories, I use this to define four different rarities
	
	You can also go for a shared upgrade pool between all classes, or Demo and Soldier etc.]]

--attributes are defined as text on menu, attribute name, min, increment, max

--[[The 1st field is actually the most important, as it used to uniquely identify upgrades, this allows the second field
	to exist beyond just attributes, and you can utilize "custom" to write a function that can do anything, as shown in
	Max Ammo and Mixed Concoction On Hit
	
	Note that max is typicallly optional for attributes, and if you're using "custom", min increment and max are also optional
	and can be defined in the AddUpgrade function instead]]

AllShops =
{
	[1] = --Scout Shop
	{
		CommonAttribute =
		{
			{"Damage Bonus +25%", "damage bonus",1,0.25},
			{"Clip Size +50%", "clip size bonus",1,0.5},
			{"Firing Speed +10%", "fire rate bonus",1,-0.1,0.1},
 			{"Reload Speed +20%", "faster reload rate",1,-0.2,0.1},
			{"Heal On Kill +25 health", "heal on kill",0,25},
			{"Max Health +25", "max health additive bonus",0,25},
			{"Max Ammo +50%", "custom",1,0.5},
			{"Movement Speed +10%", "move speed bonus",1,0.1},
			{"Jump Height +20%", "increased jump height",1,0.2},
			{"Weapon Switch Speed +35%", "deploy time decreased",1,-0.35,0},
			{"Consumable Recharge Rate +15%", "charge recharge rate increased",1,0.15},
			--{"Fire Resistance +25%", "dmg taken from fire reduced",1,-0.25,0.1},
			--{"Crit Resistance +30%", "dmg taken from crit reduced",1,-0.3,0.1},
			--{"Bullet Resistance +25%", "dmg taken from bullets reduced",1,-0.25,0.1},
			--{"Blast Resistance +25%", "dmg taken from blast reduced",1,-0.25,0.1},
			--{"Melee Resistance +25%", "dmg from melee increased",1,-0.25,0.1},
            {"Damage Resistance +15%", "custom",1,-0.15,0.1},
			{"Health Regen +2 every second", "health regen",0,2},
			{"Ammo Regen +20% every 5 seconds", "ammo regen",0,0.2,1},
			--{"Heal On Hit +15 health", "heal on hit for rapidfire",0,15},
			--{"Push Force -30%", "damage force reduction",1,-0.3,0},
			{"Bleed On Hit +8 seconds", "bleeding duration",0,8,8},
		},
		RareAttribute =
		{
			{"(RARE) Drop On Kill: Small Health Pack", "drop health pack on kill",0,1,1},
			{"(RARE) Projectile Penetration", "projectile penetration",0,1,1},
			{"(RARE) Mad Milk Slows Targets", "applies snare effect",1,-0.35,0.65},
			{"(RARE) Extra Jump +1", "air dash count",0,1},
			{"(RARE) Damage Bonus While Airborne +35%", "mult dmg while midair",1,0.35},
		},
		EpicAttribute =
		{
			{"[EPIC] Bullets Per Shot +50%", "bullets per shot bonus",1,0.5},
			{"[EPIC] Tank Buster Damage Bonus +50%", "mult dmg vs tanks",1,0.5},
			{"[EPIC] Recall On Death +25% chance", "teleport instead of die",0,0.25,1},
			{"[EPIC] Meter Effect/Debuff Duration +50%", "mult effect duration",1,0.5},
			{"[EPIC] Speed Boost On Kill +5 seconds", "speed_boost_on_kill",0,5,5},
		},
		LegendaryAttribute =
		{
			{"【LEGENDARY】 Crit On Kill +2 seconds", "critboost on kill",0,2},
			{"【LEGENDARY】 Mini-crits become Crits", "minicrits become crits",0,1,1},
			{"【LEGENDARY】 All Healing Received +100%", "healing received bonus",1,1},
			{"【LEGENDARY】 Mark for Death On Hit", "mark for death",0,1,1},
			{"【LEGENDARY】 Melee Attacks Grant Uber +1 second", "melee grants protection",0,1},
		}
	},
	[3] = --Soldier Shop
	{
		CommonAttribute =
		{
			{"Damage Bonus +25%", "damage bonus",1,0.25},
			--{"Primary: Clip Size +2", "clip size upgrade atomic",0,2},
			{"Clip Size +50%", "clip size bonus",1,0.5},
			{"Firing Speed +10%", "fire rate bonus",1,-0.1,0.1},
			{"Reload Speed +20%", "faster reload rate",1,-0.2,0.1},
			{"Heal On Kill +25 health", "heal on kill",0,25},
			{"Max Health +25", "max health additive bonus",0,25},
			{"Max Ammo +50%", "custom",1,0.5},
			{"Movement Speed +10%", "move speed bonus",1,0.1},
			{"Jump Height +20%", "increased jump height",1,0.2},
			{"Weapon Switch Speed +35%", "deploy time decreased",1,-0.35,0},
			--{"Fire Resistance +25%", "dmg taken from fire reduced",1,-0.25,0.1},
			--{"Crit Resistance +30%", "dmg taken from crit reduced",1,-0.3,0.1},
			--{"Bullet Resistance +25%", "dmg taken from bullets reduced",1,-0.25,0.1},
			--{"Blast Resistance +25%", "dmg taken from blast reduced",1,-0.25,0.1},
			--{"Melee Resistance +25%", "dmg from melee increased",1,-0.25,0.1},
            {"Damage Resistance +15%", "custom",1,-0.15,0.1},
			{"Health Regen +2 every second", "health regen",0,2},
			{"Ammo Regen +20% every 5 seconds", "ammo regen",0,0.2,1},
			--{"Heal On Hit +15 health", "heal on hit for rapidfire",0,15},
			{"Explosion Radius +25%", "Blast radius increased",1,0.25},
			{"Projectile Speed +25%", "Projectile speed increased",1,0.25},
			{"Banners: Buff Duration +25%", "increase buff duration",1,0.25},
			{"Banners: Rage Gained +25%", "rage giving scale",1,0.25},
			{"B.A.S.E. Jumper: Infinite Redeploy", "parachute redeploy",0,1,1},
			{"Bleed On Hit +8 seconds", "bleeding duration",0,8,8},
			{"Heal From Credits +15 health", "health from credits",0,15},
		},
		RareAttribute =
		{
			{"(RARE) Drop On Kill: Small Health Pack", "drop health pack on kill",0,1,1},
			{"(RARE) Rocket Specialist", "rocket specialist",0,1,1},
			{"(RARE) Extra Jump +1", "air dash count",0,1},
			{"(RARE) Fall Damage Immunity", "cancel falling damage",0,1,1},
			{"(RARE) Mini-crit Airborne Targets", "mod mini-crit airborne",0,1,1},
			{"(RARE) Damage Bonus While Airborne +35%", "mult dmg while midair",1,0.35},
		},
		EpicAttribute =
		{
			{"[EPIC] Banners: Buff Radius +25%", "mod soldier buff range",1,0.25},
			{"[EPIC] Tank Buster Damage Bonus +50%", "mult dmg vs tanks",1,0.5},
			{"[EPIC] Recall On Death +25% chance", "teleport instead of die",0,0.25,1},
			{"[EPIC] Speed Boost On Kill +5 seconds", "speed_boost_on_kill",0,5,5},
			{"[EPIC] Projectiles Cannot Be Deflected", "projectile no deflect",0,1,1},
		},
		LegendaryAttribute =
		{
			{"【LEGENDARY】 Crit On Kill +2 seconds", "critboost on kill",0,2},
			{"【LEGENDARY】 Mini-crits become Crits", "minicrits become crits",0,1,1},
			{"【LEGENDARY】 All Healing Received +100%", "healing received bonus",1,1},
			{"【LEGENDARY】 Mark for Death On Hit", "mark for death",0,1,1},
			{"【LEGENDARY】 Crits While Blast Jumping", "mod crit while airborne",0,1,1},
			{"【LEGENDARY】 Melee Attacks Grant Uber +1 second", "melee grants protection",0,1},
		}
	},
	[7] = --Pyro Shop
	{
		CommonAttribute =
		{
			{"Damage Bonus +25%", "damage bonus",1,0.25},
			{"Damage Bonus +25%", "damage bonus",1,0.25},
			{"Damage Bonus +25%", "damage bonus",1,0.25},
			{"Secondary: Clip Size +50%", "clip size bonus",1,0.5},
			{"Secondary: Firing Speed +10%", "fire rate bonus",1,-0.1,0.1},
			{"Secondary: Reload Speed +20%", "faster reload rate",1,-0.2,0.1},
			{"Heal On Kill +25 health", "heal on kill",0,25},
			{"Max Health +25", "max health additive bonus",0,25},
			{"Max Ammo +50%", "custom",1,0.5},
			{"Movement Speed +10%", "move speed bonus",1,0.1},
			{"Jump Height +20%", "increased jump height",1,0.2},
			{"Weapon Switch Speed +35%", "deploy time decreased",1,-0.35,0},
			--{"Fire Resistance +25%", "dmg taken from fire reduced",1,-0.25,0.1},
			--{"Crit Resistance +30%", "dmg taken from crit reduced",1,-0.3,0.1},
			--{"Bullet Resistance +25%", "dmg taken from bullets reduced",1,-0.25,0.1},
			--{"Blast Resistance +25%", "dmg taken from blast reduced",1,-0.25,0.1},
			--{"Melee Resistance +25%", "dmg from melee increased",1,-0.25,0.1},
            {"Damage Resistance +15%", "custom",1,-0.15,0.1},
			{"Health Regen +2 every second", "health regen",0,2},
			{"Ammo Regen +20% every 5 seconds", "ammo regen",0,0.2,1},
			--{"Heal On Hit +2 health", "heal on hit for rapidfire",0,2},
			{"Flame Ammo Consumption -25%", "flame ammopersec decreased",1,-0.25,0},
			{"Afterburn Damage +100%", "weapon burn dmg increased",1,1},
			--{"Push Force -30%", "damage force reduction",1,-0.3,0},
			{"Flares: Projectile Speed +25%", "Projectile speed increased",1,0.25},
			{"Thermal Thruster: Mid-Air Relaunch", "thermal_thruster_air_launch",0,1,1},
			{"Thermal Thruster: Stun Targets On Landing", "falling_impact_radius_stun",0,1,1},
			{"Airblasting Teammates Gives Speed Boost", "airblast_give_teammate_speed_boost",0,1,1},
			{"Bleed On Hit +8 seconds", "bleeding duration",0,8,8},
			{"Heal From Credits +15 health", "health from credits",0,15},
		},
		RareAttribute =
		{
			{"(RARE) Drop On Kill: Small Health Pack", "drop health pack on kill",0,1,1},
			{"(RARE) Phlogistinator: Mmmph Gained +50%", "rage giving scale",1,0.50},
			{"(RARE) Extra Jump +1", "air dash count",0,1},
			{"(RARE) Reflected Projectile Speed +100%", "mult reflect velocity",1,1},
			{"(RARE) Flame Size +50%", "flame size bonus",1,0.50},
			{"(RARE) Flame Distance +50%", "flame life bonus",1,0.50},
			{"(RARE) Airblast Ammo Consumption -25%", "airblast cost decreased",1,-0.25,0},
			{"(RARE) Slow On Hit", "slow enemy on hit",0,1,1},
			{"(RARE) Damage Bonus While Airborne +35%", "mult dmg while midair",1,0.35},
		},
		EpicAttribute =
		{
			{"[EPIC] Dragon's Fury + Secondaries: Recharge Rate +15%", "mult_item_meter_charge_rate",1,-0.15,0.1},
			{"[EPIC] Tank Buster Damage Bonus +50%", "mult dmg vs tanks",1,0.5},
			{"[EPIC] Recall On Death +25% chance", "teleport instead of die",0,0.25,1},
			{"[EPIC] Speed Boost On Kill +5 seconds", "speed_boost_on_kill",0,5,5},
			{"[EPIC] Primary: Crits From Behind", "mod flamethrower back crit",0,1,1},
			{"[EPIC] Airblast Refire Speed +50%", "mult airblast refire time",1,-0.5,0},
		},
		LegendaryAttribute =
		{
			{"【LEGENDARY】 Crit On Kill +2 seconds", "critboost on kill",0,2},
			{"【LEGENDARY】 Mark for Death On Hit", "mark for death",0,1,1},
			{"【LEGENDARY】 All Healing Received +100%", "healing received bonus",1,1},
			{"【LEGENDARY】 300% Damage On Burning", "damage bonus vs burning",1,2,3},
			{"【LEGENDARY】 Melee Attacks Grant Uber +1 second", "melee grants protection",0,1},
		},
		Contraband =
		{
			{"☢ CAUTION!! ☢ Gas Passer: Explode On Ignite", "explode_on_ignite",0,1,1},
		}
	},
	[4] = --Demoman Shop
	{
		CommonAttribute =
		{
			{"Damage Bonus +25%", "damage bonus",1,0.25},
			--{"Primary: Clip Size +2", "clip size upgrade atomic",0,2},
			{"Clip Size +50%", "clip size bonus",1,0.5},
			{"Firing Speed +10%", "fire rate bonus",1,-0.1,0.1},
			{"Reload Speed +20%", "faster reload rate",1,-0.2,0.1},
			{"Heal On Kill +25 health", "heal on kill",0,25},
			{"Max Health +25", "max health additive bonus",0,25},
			{"Max Ammo +50%", "custom",1,0.5},
			{"Movement Speed +10%", "move speed bonus",1,0.1},
			{"Jump Height +20%", "increased jump height",1,0.2},
			{"Weapon Switch Speed +35%", "deploy time decreased",1,-0.35,0},
			{"Shields: Charge Recharge Rate +100%", "charge recharge rate increased",1,1},
			{"Shields: Charge Impact Damage Bonus +100%", "charge impact damage increased",1,1},
			--{"Fire Resistance +25%", "dmg taken from fire reduced",1,-0.25,0.1},
			--{"Crit Resistance +30%", "dmg taken from crit reduced",1,-0.3,0.1},
			--{"Bullet Resistance +25%", "dmg taken from bullets reduced",1,-0.25,0.1},
			--{"Blast Resistance +25%", "dmg taken from blast reduced",1,-0.25,0.1},
			--{"Melee Resistance +25%", "dmg from melee increased",1,-0.25,0.1},
            {"Damage Resistance +15%", "custom",1,-0.15,0.1},
			{"Health Regen +2 every second", "health regen",0,2},
			{"Ammo Regen +20% every 5 seconds", "ammo regen",0,0.2,1},
			--{"Heal On Hit +15 health", "heal on hit for rapidfire",0,15},
			{"Explosion Radius +25%", "Blast radius increased",1,0.25},
			{"Projectile Speed +25%", "Projectile speed increased",1,0.25},
			--{"Push Force -30%", "damage force reduction",1,-0.3,0},
			{"Max Stickybombs +2", "max pipebombs increased",1,2},
			{"Stickybombs: Charge Rate +25%", "stickybomb charge rate",1,-0.25,0},
			{"Stickybombs: Arm Time -0.2 seconds", "sticky arm time bonus",0,-0.2,-0.8},
			{"B.A.S.E. Jumper: Infinite Redeploy", "parachute redeploy",0,1,1},
			{"Bleed On Hit +8 seconds", "bleeding duration",0,8,8},
			{"Heal From Credits +15 health", "health from credits",0,15},
		},
		RareAttribute =
		{
			{"(RARE) Drop On Kill: Small Health Pack", "drop health pack on kill",0,1,1},
			{"(RARE) Melee Attack Width +50%", "melee bounds multiplier",1,0.5},
			{"(RARE) Melee Range +25%", "melee range multiplier",1,0.25},
			{"(RARE) Extra Jump +1", "air dash count",0,1},
			{"(RARE) Fall Damage Immunity", "cancel falling damage",0,1,1},
			{"(RARE) Mini-crit Airborne Targets", "mod mini-crit airborne",0,1,1},
			{"(RARE) Shields: Charge Duration +1 second", "charge time increased",1,1},
			{"(RARE) Pipebombs: Explode On Impact", "grenade explode on impact",0,1,1},
			{"(RARE) Melee Attacks Reflect Projectiles", "melee airblast",0,1,1},
			{"(RARE) Damage Bonus While Airborne +35%", "mult dmg while midair",1,0.35},
		},
		EpicAttribute =
		{
			{"[EPIC] Tank Buster Damage Bonus +50%", "mult dmg vs tanks",1,0.5},
			{"[EPIC] Recall On Death +25% chance", "teleport instead of die",0,0.25,1},
			{"[EPIC] Speed Boost On Kill +5 seconds", "speed_boost_on_kill",0,5,5},
			{"[EPIC] Shields: Full Turning Control", "full charge turn control",0,1,1},
			{"[EPIC] Stickybombs: Charging Increases Damage +35%", "stickybomb_charge_damage_increase",1,0.35},
			{"[EPIC] Melee Attacks Cleave All Targets", "melee cleave attack",0,1,1},
			{"[EPIC] Projectiles Cannot Be Deflected", "projectile no deflect",0,1,1},
		},
		LegendaryAttribute =
		{
			{"【LEGENDARY】 Crit On Kill +2 seconds", "critboost on kill",0,2},
			{"【LEGENDARY】 Mini-crits become Crits", "minicrits become crits",0,1,1},
			{"【LEGENDARY】 All Healing Received +100%", "healing received bonus",1,1},
			{"【LEGENDARY】 Mark for Death On Hit", "mark for death",0,1,1},
			{"【LEGENDARY】 Crits While Blast Jumping", "mod crit while airborne",0,1,1},
			{"【LEGENDARY】 Melee Attacks Grant Uber +1 second", "melee grants protection",0,1},
		}
	},
	[6] = --Heavy Shop
	{
		CommonAttribute =
		{
			{"Secondary: Clip Size +50%", "clip size bonus",1,0.5},
			{"Firing Speed +10%", "fire rate bonus",1,-0.1,0.1},
			{"Secondary: Reload Speed +20%", "faster reload rate",1,-0.2,0.1},
			{"Consumables Recharge Rate +15%", "charge recharge rate increased",1,-0.15,0},
			{"Heal On Kill +25 health", "heal on kill",0,25},
			{"Max Health +25", "max health additive bonus",0,25},
			{"Max Ammo +50%", "custom",1,0.5},
			{"Movement Speed +10%", "move speed bonus",1,0.1},
			{"Jump Height +20%", "increased jump height",1,0.2},
			{"Weapon Switch Speed +35%", "deploy time decreased",1,-0.35,0},
			--{"Fire Resistance +25%", "dmg taken from fire reduced",1,-0.25,0.1},
			--{"Crit Resistance +30%", "dmg taken from crit reduced",1,-0.3,0.1},
			--{"Bullet Resistance +25%", "dmg taken from bullets reduced",1,-0.25,0.1},
			--{"Blast Resistance +25%", "dmg taken from blast reduced",1,-0.25,0.1},
			--{"Melee Resistance +25%", "dmg from melee increased",1,-0.25,0.1},
            {"Damage Resistance +15%", "custom",1,-0.15,0.1},
			{"Health Regen +2 every second", "health regen",0,2},
			{"Ammo Regen +20% every 5 seconds", "ammo regen",0,0.2,1},
			--{"Heal On Hit +2 health", "heal on hit for rapidfire",0,2},
			--{"Push Force -30%", "damage force reduction",1,-0.3,0},
			{"Spin Up Speed +15%", "minigun spinup time decreased",1,-0.15,0},
			{"Move Speed While Spinning +20%", "aiming movespeed increased",1,0.20},
			{"Bleed On Hit +8 seconds", "bleeding duration",0,8,8},
			{"Heal From Credits +15 health", "health from credits",0,15},
		},
		RareAttribute =
		{
			{"(RARE) Damage Bonus +25%", "damage bonus",1,0.25},
			{"(RARE) Drop On Kill: Small Health Pack", "drop health pack on kill",0,1,1},
			{"(RARE) Extra Jump +1", "air dash count",0,1},
			{"(RARE) Projectile Penetration", "projectile penetration",0,1,1},
			{"(RARE) Destroy Projectiles", "attack projectiles",0,1,2},
			{"(RARE) Rage Knockback", "generate rage on damage",0,1,3},
			{"(RARE) Switch Weapons While Spinning", "mod minigun can holster while spinning",0,1,1},
			{"(RARE) Slow On Hit", "slow enemy on hit",0,1,1},
			{"(RARE) Damage Bonus While Airborne +35%", "mult dmg while midair",1,0.35},
		},
		EpicAttribute =
		{
			{"[EPIC] Tank Buster Damage Bonus +50%", "mult dmg vs tanks",1,0.5},
			{"[EPIC] Recall On Death +25% chance", "teleport instead of die",0,0.25,1},
			{"[EPIC] Speed Boost On Kill +5 seconds", "speed_boost_on_kill",0,5,5},
			{"[EPIC] Ring Of Fire", "ring of fire while aiming",0,1,1},
			{"[EPIC] Bullets Per Shot +25%", "bullets per shot bonus",1,0.25},
		},
		LegendaryAttribute =
		{
			{"【LEGENDARY】 Crit On Kill +2 seconds", "critboost on kill",0,2},
			{"【LEGENDARY】 Mini-crits become Crits", "minicrits become crits",0,1,1},
			{"【LEGENDARY】 All Healing Received +100%", "healing received bonus",1,1},
			{"【LEGENDARY】 Mark for Death On Hit", "mark for death",0,1,1},
			{"【LEGENDARY】 Melee Attacks Grant Uber +1 second", "melee grants protection",0,1},
		}
	},
	[9] = --Engineer Shop
	{
		CommonAttribute =
		{
 			{"Weapons: Damage Bonus +25%", "damage bonus",1,0.25},
			{"Weapons: Clip Size +50%", "clip size bonus",1,0.5},
			{"Weapons: Firing Speed +10%", "fire rate bonus",1,-0.1,0.1},
			{"Weapons: Reload Speed +20%", "faster reload rate",1,-0.2,0.1},
			{"Heal On Kill +25 health", "heal on kill",0,25},
			{"Max Health +25", "max health additive bonus",0,25},
			{"Weapons: Max Ammo +50%", "custom",1,0.5},
			{"Movement Speed +10%", "move speed bonus",1,0.1},
			{"Jump Height +20%", "increased jump height",1,0.2},
			{"Weapon Switch Speed +70%", "deploy time decreased",1,-0.70,0},
			--{"Fire Resistance +25%", "dmg taken from fire reduced",1,-0.25,0.1},
			--{"Crit Resistance +30%", "dmg taken from crit reduced",1,-0.3,0.1},
			--{"Bullet Resistance +25%", "dmg taken from bullets reduced",1,-0.25,0.1},
			--{"Blast Resistance +25%", "dmg taken from blast reduced",1,-0.25,0.1},
			--{"Melee Resistance +25%", "dmg from melee increased",1,-0.25,0.1},
            {"Damage Resistance +15%", "custom",1,-0.15,0.1},
			{"Health Regen +2 every second", "health regen",0,2},
			{"Ammo Regen +20% every 5 seconds", "ammo regen",0,0.2,1},
			--{"Heal On Hit +15 health", "heal on hit for rapidfire",0,3},
			{"Max Metal Capacity +50%", "maxammo metal increased",1,0.50},
			{"Building Max Health +100%", "engy building health bonus",1,1},
			{"Sentry Firing Speed +10%", "engy sentry fire rate increased",1,-0.1,0},
			{"Dispenser Range +100%", "engy dispenser radius increased",1,1},
			{"Disposable Sentry +1", "engy disposable sentries",0,1},
			{"Two-Way Teleporter", "bidirectional teleport",0,1,1},
			{"Metal Regen +100 every 5 seconds", "metal regen",0,100},
			{"Sentry Max Ammo +50%", "mvm sentry ammo",1,0.50},
			{"Build Speed +25%", "build rate bonus",1,-0.25,0},
			{"Wrench Construction Speed +30%", "Construction rate increased",1,0.3},
			{"Repair Speed +20%", "Repair rate increased",1,0.2},
			{"Upgrade Speed +20%", "upgrade rate decrease",1,0.2},
			{"Increased Metal From Ammo +25%", "metal_pickup_decreased",1,0.25},
			{"Bleed On Hit +8 seconds", "bleeding duration",0,8,8},
			{"Heal From Credits +15 health", "health from credits",0,15},
		},
		RareAttribute =
		{
			{"(RARE) Drop On Kill: Small Health Pack", "drop health pack on kill",0,1,1},
			{"(RARE) Extra Jump +1", "air dash count",0,1},
			{"(RARE) Weapons: Projectile Penetration", "projectile penetration",0,1,1},
			{"(RARE) Sentry Damage Bonus +25%", "engy sentry damage bonus",1,0.25},
			{"(RARE) Sentry Range +50%", "engy sentry radius increased",1,0.5},
			{"(RARE) Dispenser Heal/Resupply +50%", "mult dispenser rate",1,0.5},
			{"(RARE) Damage Bonus While Airborne +35%", "mult dmg while midair",1,0.35},
		},
		EpicAttribute =
		{
			{"[EPIC] Tank Buster Damage Bonus +50%", "mult dmg vs tanks",1,0.5},
			{"[EPIC] Recall On Death +25% chance", "teleport instead of die",0,0.25,1},
			{"[EPIC] Speed Boost On Kill +5 seconds", "speed_boost_on_kill",0,5,5},
			{"[EPIC] Bullets Per Shot +50%", "bullets per shot bonus",1,0.5},
			{"[EPIC] Sentry Rocket Firing Speed +25%", "mult firerocket rate",1,-0.25,0},
			{"[EPIC] Teleporter Recharge Rate +50%", "mult teleporter recharge rate",1,-0.5,0},
			{"[EPIC] Teleporter Grants Speed Boost", "mod teleporter speed boost",0,1,1},
			{"[EPIC] Damage Bonus vs Sentry's Target +50%", "damage bonus bullet vs sentry target",1,0.25},
		},
		LegendaryAttribute =
		{
			{"【LEGENDARY】 Crit On Kill +2 seconds", "critboost on kill",0,2},
			{"【LEGENDARY】 Mini-crits become Crits", "minicrits become crits",0,1,1},
			{"【LEGENDARY】 All Healing Received +100%", "healing received bonus",1,1},
			{"【LEGENDARY】 Mark for Death On Hit", "mark for death",0,1,1},
			{"【LEGENDARY】 Construction Cost -80%", "building cost reduction",1,-0.8,0.2},
			{"【LEGENDARY】 Melee Attacks Grant Uber +1 second", "melee grants protection",0,1},
		}
	},
	[5] = --Medic Shop
	{
		CommonAttribute =
		{
			{"Damage Bonus +25%", "damage bonus",1,0.25},
			{"Clip Size +50%", "clip size bonus",1,0.5},
			--{"Clip Size +2", "clip size upgrade atomic",0,2},
			{"Firing Speed +10%", "fire rate bonus",1,-0.1,0.1},
			{"Reload Speed +20%", "faster reload rate",1,-0.2,0.1},
			{"Heal On Kill +25 health", "heal on kill",0,25},
			{"Max Health +25", "max health additive bonus",0,25},
			{"Max Ammo +50%", "custom",1,0.5},
			{"Movement Speed +10%", "move speed bonus",1,0.1},
			{"Jump Height +20%", "increased jump height",1,0.2},
			{"Weapon Switch Speed +70%", "deploy time decreased",1,-0.70,0},
			--{"Fire Resistance +25%", "dmg taken from fire reduced",1,-0.25,0.1},
			--{"Crit Resistance +30%", "dmg taken from crit reduced",1,-0.3,0.1},
			--{"Bullet Resistance +25%", "dmg taken from bullets reduced",1,-0.25,0.1},
			--{"Blast Resistance +25%", "dmg taken from blast reduced",1,-0.25,0.1},
			--{"Melee Resistance +25%", "dmg from melee increased",1,-0.25,0.1},
            {"Damage Resistance +15%", "custom",1,-0.15,0.1},
			{"Health Regen +2 every second", "health regen",0,2},
			{"Ammo Regen +20% every 5 seconds", "ammo regen",0,0.2,1},
			--{"Heal On Hit +6 health", "heal on hit for rapidfire",0,6},
			{"ÜberCharge Rate +25%", "ubercharge rate bonus",1,0.25},
			{"Über Duration +2 seconds", "uber duration bonus",0,2},
			{"Healing Mastery", "healing mastery",0,1},
			{"Overheal Expert", "overheal expert",0,1},
			{"Heal Rate +25%", "heal rate bonus",1,0.25},
			{"Max Overheal +25%", "overheal bonus",1,0.25},
			{"Overheal Duration +50%", "overheal bonus",1,0.25},
			{"Revive Speed +25%", "revive rate",1,0.25},
			--{"Push Force -30%", "damage force reduction",1,-0.3,0},
			{"Bleed On Hit +8 seconds", "bleeding duration",0,8,8},
			{"Heal From Credits +15 health", "health from credits",0,15},
		},
		RareAttribute =
		{
			{"(RARE) Projectile Shield", "generate rage on heal",0,1,2},
			{"(RARE) Extra Jump +1", "air dash count",0,1},
			{"(RARE) Gain Über On Hit +1%", "add uber charge on hit",0,0.01},
			{"(RARE) Mad Milk Syringes", "mad milk syringes",0,1,1},
			{"(RARE) Medigun Range +25%", "mult medigun range",1,0.25},
			{"(RARE) Medigun Damages Enemies", "medigun attack enemy",0,1,1},
			{"(RARE) Damage Bonus While Airborne +35%", "mult dmg while midair",1,0.35},
		},
		EpicAttribute =
		{
			{"[EPIC] Recall On Death +25% chance", "teleport instead of die",0,0.25,1},
			{"[EPIC] Crit On Kill +2 seconds", "critboost on kill",0,2},
			{"[EPIC] Mixed Concoction On Hit", "custom",0,1,1},
			{"[EPIC] Heal Buildings +50% healing", "medic machinery beam",0,5},
			{"[EPIC] Melee Attacks Cleave All Targets", "melee cleave attack",0,1,1},
			{"[EPIC] Speed Boost On Kill +5 seconds", "speed_boost_on_kill",0,5,5},
		},
		LegendaryAttribute =
		{
			{"【LEGENDARY】 Mini-crits become Crits", "minicrits become crits",0,1,1},
			{"【LEGENDARY】 All Healing Received +100%", "healing received bonus",1,1},
			{"【LEGENDARY】 Invulnerable On Taking Damage +10% Chance", "uber on damage taken",0,0.1,0.1},
			{"【LEGENDARY】 Über Persists On Multiple Patients", "medigun keep charged effect",0,1,1},
			{"【LEGENDARY】 Melee Attacks Grant Uber +1 second", "melee grants protection",0,1},
		}
	},
	[2] = --Sniper Shop
	{
		CommonAttribute =
		{
			{"Damage Bonus +25%", "damage bonus",1,0.25},
			{"Secondary: Clip Size +50%", "clip size bonus",1,0.5},
			{"Firing Speed +10%", "fire rate bonus",1,-0.1,0.1},
			{"Reload Speed +20%", "faster reload rate",1,-0.2,0.1},
			{"Heal On Kill +25 health", "heal on kill",0,25},
			{"Max Health +25", "max health additive bonus",0,25},
			{"Max Ammo +50%", "custom",1,0.5},
			{"Movement Speed +10%", "move speed bonus",1,0.1},
			{"Jump Height +20%", "increased jump height",1,0.2},
			{"Weapon Switch Speed +35%", "deploy time decreased",1,-0.35,0},
			{"Consumable Recharge Rate +15%", "charge recharge rate increased",1,0.15},
			--{"Fire Resistance +25%", "dmg taken from fire reduced",1,-0.25,0.1},
			--{"Crit Resistance +30%", "dmg taken from crit reduced",1,-0.3,0.1},
			--{"Bullet Resistance +25%", "dmg taken from bullets reduced",1,-0.25,0.1},
			--{"Blast Resistance +25%", "dmg taken from blast reduced",1,-0.25,0.1},
			--{"Melee Resistance +25%", "dmg from melee increased",1,-0.25,0.1},
            {"Damage Resistance +15%", "custom",1,-0.15,0.1},
			{"Health Regen +2 every second", "health regen",0,2},
			{"Ammo Regen +20% every 5 seconds", "ammo regen",0,0.2,1},
			--{"Heal On Hit +15 health", "heal on hit for rapidfire",0,3},
			{"Bows: Arrow Mastery", "arrow mastery",0,1},
			{"Faster Charge +25%", "SRifle Charge rate increased",1,0.25},
			{"Bleed On Hit +8 seconds", "bleeding duration",0,8,8},
			{"Heal From Credits +15 health", "health from credits",0,15},
		},
		RareAttribute =
		{
			{"(RARE) Drop On Kill: Small Health Pack", "drop health pack on kill",0,1,1},
			{"(RARE) Extra Jump +1", "air dash count",0,1},
			{"(RARE) Projectile Penetration", "projectile penetration",0,1,1},
			{"(RARE) Jarate Slows Targets", "applies snare effect",1,-0.35,0.65},
			{"(RARE) Damage All Targets Connected By Medigun", "damage all connected",0,1,1},
			{"(RARE) No Fliching When Scoped", "no damage view flinch",0,1,1},
			{"(RARE) Damage Bonus On Full Charge +35%", "sniper full charge damage bonus",1,0.35},
			{"(RARE) SMGs: Accuracy +100%", "weapon spread bonus",1,-1,0},
			{"(RARE) SMGs: Headshots Enabled", "can headshot",0,1,1},
			{"(RARE) Damage Bonus While Airborne +35%", "mult dmg while midair",1,0.35},
			{"(RARE) Self Igniting Arrows", "arrow ignite",0,1,1},
		},
		EpicAttribute =
		{
			{"[EPIC] Tank Buster Damage Bonus +50%", "mult dmg vs tanks",1,0.5},
			{"[EPIC] Recall On Death +25% chance", "teleport instead of die",0,0.25,1},
			{"[EPIC] Meter Effect/Debuff Duration +50%", "mult effect duration",1,0.5},
			{"[EPIC] Explosive Headshot", "explosive sniper shot",0,1},
			{"[EPIC] Explosive Munitions", "explosive bullets",0,147,147},
			{"[EPIC] Speed Boost On Kill +5 seconds", "speed_boost_on_kill",0,5,5},
		},
		LegendaryAttribute =
		{
			{"【LEGENDARY】 Mini-crits become Crits", "minicrits become crits",0,1,1},
			{"【LEGENDARY】 All Healing Received +100%", "healing received bonus",1,1},
			{"【LEGENDARY】 Mark for Death On Hit", "mark for death",0,1,1},
			{"【LEGENDARY】 Melee Attacks Grant Uber +1 second", "melee grants protection",0,1},
		}
	},
	[8] = --Spy Shop
	{
		CommonAttribute =
		{
			{"Damage Bonus +25%", "damage bonus",1,0.25},
			{"Clip Size +50%", "clip size bonus",1,0.5},
			{"Firing Speed +10%", "fire rate bonus",1,-0.1,0.1},
			{"Reload Speed +20%", "faster reload rate",1,-0.2,0.1},
			{"Heal On Kill +25 health", "heal on kill",0,25},
			{"Max Health +25", "max health additive bonus",0,25},
			{"Max Ammo +50%", "custom",1,0.5},
			{"Movement Speed +10%", "move speed bonus",1,0.1},
			{"Jump Height +20%", "increased jump height",1,0.2},
			{"Weapon Switch Speed +35%", "deploy time decreased",1,-0.35,0},
			{"Sapper Recharge Rate +15%", "charge recharge rate increased",1,0.15},
			--{"Fire Resistance +25%", "dmg taken from fire reduced",1,-0.25,0.1},
			--{"Crit Resistance +30%", "dmg taken from crit reduced",1,-0.3,0.1},
			--{"Bullet Resistance +25%", "dmg taken from bullets reduced",1,-0.25,0.1},
			--{"Blast Resistance +25%", "dmg taken from blast reduced",1,-0.25,0.1},
			--{"Melee Resistance +25%", "dmg from melee increased",1,-0.25,0.1},
            {"Damage Resistance +15%", "custom",1,-0.15,0.1},
			{"Health Regen +2 every second", "health regen",0,2},
			{"Ammo Regen +20% every 5 seconds", "ammo regen",0,0.2,1},
			--{"Heal On Hit +15 health", "heal on hit for rapidfire",0,3},
			{"Robot Sapper Power", "robo sapper",0,1,3},
			{"Armor Penetration", "armor piercing",0,25,100},
			{"Cloak Duration +20%", "cloak consume rate decreased",1,-0.2},
			{"Cloak Recharge Rate +50%", "mult cloak meter regen rate",1,0.5},
			{"Add Cloak On Hit +30%", "add cloak on hit",0,30},
			--{"Add Cloak On Kill +30%", "add cloak on kill",0,30},
			{"Bleed On Hit +8 seconds", "bleeding duration",0,8,8},
			{"Heal From Credits +15 health", "health from credits",0,15},
		},
		RareAttribute =
		{
			{"(RARE) Drop On Kill: Small Health Pack", "drop health pack on kill",0,1,1},
			{"(RARE) Extra Jump +1", "air dash count",0,1},
			{"(RARE) Projectile Penetration", "projectile penetration",0,1,1},
			{"(RARE) Damage All Targets Connected By Medigun", "damage all connected",0,1,1},
			{"(RARE) Revolvers: Accuracy +100%", "weapon spread bonus",1,-1,0},
			{"(RARE) Headshots Enabled", "can headshot",0,1,1},
			{"(RARE) Decloak Speed +50%", "mult decloak rate",1,-0.5,0.01},
			{"(RARE) Damage Bonus While Airborne +35%", "mult dmg while midair",1,0.35},
		},
		EpicAttribute =
		{
			{"[EPIC] Recall On Death +25% chance", "teleport instead of die",0,0.25,1},
			{"[EPIC] Sapper: Buff/Debuff Duration +50%", "mult effect duration",1,0.5},
			{"[EPIC] Speed Boost On Kill", "speed_boost_on_kill",0,1,1},
			--{"[EPIC] Last Bullet Is A Crit", "last shot crits",0,1,1},
			{"[EPIC] Wet Immunity", "wet immunity",0,1,1},
			{"[EPIC] Afterburn Immunity", "afterburn immunity",0,1,1},
			{"[EPIC] Damage Bonus While Disguised +50%", "damage bonus while disguised",1,0.5},
		},
		LegendaryAttribute =
		{
 			{"【LEGENDARY】 All Healing Received +100%", "healing received bonus",1,1},
			{"【LEGENDARY】 Tank Buster Damage Bonus +300%", "mult dmg vs tanks",1,3},
			{"【LEGENDARY】 Revolver Retains Disguise", "keep disguise on attack",0,1,1},
			--{"【LEGENDARY】 Disguise On Backstab", "disguise on backstab",0,1,1},
			{"【LEGENDARY】 Backstabs and Saps Store Crits", "sapper kills collect crits",0,1,1},
			{"【LEGENDARY】 Melee Attacks Grant Uber +1 second", "melee grants protection",0,1},
		}
	}
}

--Used for returning the class name
classIndices_Internal = {
    [1] = "Scout",
    [3] = "Soldier",
    [7] = "Pyro",
    [4] = "Demoman",
    [6] = "Heavy",
    [9] = "Engineer",
    [5] = "Medic",
    [2] = "Sniper",
    [8] = "Spy",
}


--[[This table is essential, it will store the SteamID3 of a player and act as a "save file" for the player,
		Things that are stored in here for each player:
			UpgradePoints - how many upgrade points the player has, persists between classes
			RerollPoints - how many rerolls the player has, persists between classes

			An index from [1] to [9] which will represent the player's class
			Inside the index, each class has its own
				hasRolled - boolean, used as a flag if the player has rolled for upgrades on that class
				PurchasedUpgrades - table, which upgrades have been purchased for that player on that class
				MaxedUpgrades - table, which upgrades are maxed for that player on that class
				UpgradeMenu - table, show a unique upgrade menu for that player on that class
			]]
UniqueAccountIDs = {}

--[[Also very important, this table is akin to an emulator's "save state" where it will copy everything from
	UniqueAccountIDs, TotalUpgradePoints, and TotalRerollPoints. In the case that players lose a wave, this table is used
	to store save states]]
WaveState = {}

--[[Finds all func_upgradestation's on the map and lets the player interact with them for bringing up the menu]]
function EnableUpgradeStations()
	for _, v in pairs(ents.FindAllByClass("func_upgradestation")) do
		v:AddCallback(ON_START_TOUCH,
		function(_,player)
		    if player:IsRealPlayer() then
				RollUpgrades(player)
				ShowUpgradeMenu(player)
				player:Print(2, "Weclome to the Randomizer Upgrade Station!")
			end
		end)
		v:AddCallback(ON_END_TOUCH,
		function(_,player)
		    if player:IsRealPlayer() then
				CloseUpgradeMenu(player) --probably redundnant
				player:Print(2, "You have left the Randomizer Upgrade Station.")
			end
		end)
	end
end

--[[Adds the OnSpawn callback so that everytime a player spawns their upgrades are reapplied]]
function OnPlayerConnected(player)
    if player:IsRealPlayer() then
        player:AddCallback(ON_SPAWN, function(player)
			InitUserId(player)
			ReAddPurchasedUpgrades(player)
		end)
    end
end

--[[If the player joins the server for the first time, their SteamID3 is added to UniqueAccountIDs
	Note that the function for purchasing upgrades is stored here]]
function InitUserId(activator)
	local player = (ents.FindByClass("tf_player_manager", nil)).m_iAccountID[activator:GetNetIndex()+1]
	if UniqueAccountIDs[player] == nil then
		UniqueAccountIDs[player] =
		{
			UpgradePoints = TotalUpgradePoints,
			RerollPoints = TotalRerollPoints,
		}
	end

	local class = activator.m_iClass
	if UniqueAccountIDs[player][class] == nil then
		UniqueAccountIDs[player][class] =
		{
			hasRolled = false,
			PurchasedUpgrades = {}, --Stored as key [Upgrade name] with value equal to how many times it was purchased
			--MaxedUpgrades = {}, --Used as a temporary table, similar to PurchasedUpgrades, probably not needed in style2
			UpgradeMenu =
			{
				timeout = 0,
				title = "Select an upgrade - ",
				itemsPerPage = nil,
				flags = MENUFLAG_BUTTON_EXIT,
				onSelect = function(activator, index, value) --Responsible for subtracting upgrade/reroll points, disabling purchased upgrades
					local player = UniqueAccountIDs[(ents.FindByClass("tf_player_manager", nil)).m_iAccountID[activator:GetNetIndex()+1]]
					local class = activator.m_iClass
					local purchased = player[class].PurchasedUpgrades
					local menu = player[class].UpgradeMenu
					local playername = activator.m_szNetname

					if value ~= "reroll" then
						if purchased[value] == nil then
							purchased[value] = 1
						else
							purchased[value] = purchased[value] + 1
						end

						menu[index].disabled = true
						AddUpgrade(activator, value)

						local upgradetable = {}
						for i in (string.gmatch(value, "[^,]+")) do
							upgradetable[#upgradetable + 1] = i
						end
						local upgrade = upgradetable[1]

						if string.find(upgrade, "(RARE)",1,true) then
							util.PrintToChatAll("\x07ff3d3d"  .. playername .. "\x07fbeccb has purchased: " .. "\x074B69FF".. string.sub(upgrade,1,6) .. "\x07FFD700".. string.sub(upgrade,7,#upgrade) .. "\x07fbeccb Level " .. purchased[value])
						elseif string.find(upgrade, "[EPIC]",1,true) then
							util.PrintToChatAll("\x07ff3d3d"  .. playername .. "\x07fbeccb has purchased: " .. "\x078847FF".. string.sub(upgrade,1,6) .. "\x07FFD700".. string.sub(upgrade,7,#upgrade) .. "\x07fbeccb Level " .. purchased[value])
						elseif string.find(upgrade, "【LEGENDARY】",1,true) then
							util.PrintToChatAll("\x07ff3d3d"  .. playername .. "\x07fbeccb has purchased: " .. "\x07EB4B4B".. string.sub(upgrade,1,15) .. "\x07FFD700".. string.sub(upgrade,16,#upgrade) .. "\x07fbeccb Level " .. purchased[value])
						else
						util.PrintToChatAll("\x07ff3d3d"  .. playername .. "\x07fbeccb has purchased: " .. "\x07FFD700" .. upgrade .. "\x07fbeccb Level " .. purchased[value])
						end

						player.UpgradePoints = player.UpgradePoints - 1

						player[class].hasRolled = false
						RollUpgrades(activator) --after purchasing an upgrade, reroll for new set of upgrades

					else
						RerollUpgrades(activator)
					end

					ShowUpgradeMenu(activator)
				end,
				onCancel = nil
			}
		}
	end
end

--[[Your random number generator, returns a float to allow for decimal probabilities
	In this example, it rolls for rarity first, then rolls a second time to pick an upgrade
	So the probability of a specific upgrade is based on two rng rolls]]
function UpgradeRoulette(activator)
	local number = math.random() --returns float from 0 to 1
	local class = activator.m_iClass
	local shop = AllShops[class]
	local pool = {}

	if number < 0.80 then
		pool = shop.CommonAttribute
	elseif (number >= 0.80 and number < 0.95) then
		pool = shop.RareAttribute
	elseif (number >= 0.95 and number < 0.99) then
		pool = shop.EpicAttribute
	elseif number >= 0.99 then --probably should be less than 1%
		pool = shop.LegendaryAttribute
	end

	local index = math.random(1,(#pool)) --returns integer from 1 to number of upgrades in pool
	local upgrade = pool[index]

	return upgrade
end

--[[This function calls UpgradeRoulette and sends the chosen upgrades to the upgrade menu]]
function RollUpgrades(activator)
	local player = UniqueAccountIDs[(ents.FindByClass("tf_player_manager", nil)).m_iAccountID[activator:GetNetIndex()+1]]
	local class = activator.m_iClass
	local menu = player[class].UpgradeMenu
	local purchased = player[class].PurchasedUpgrades
	--local maxed = player[class].MaxedUpgrades

	if player[class].hasRolled ~= true then
		for index = 1, MenuCapacity, 1 do
			menu[index] = {}
			--maxed = {}
		end

		for index = 1, MenuCapacity, 1 do
			local upgrade = UpgradeRoulette(activator)

			--[[Used to prevent maxed out upgrades from reappearing in the shop]]
			function CheckMaxed(upgrade)
				local min = upgrade[3]
				local increment = upgrade[4]
				local max = upgrade[5]
				if max ~= nil then
					if purchased[table.concat(upgrade,",")] ~= nil then
						local value = min + purchased[table.concat(upgrade,",")] * increment
						if increment > 0 then
							return (math.floor(value*100)/100 >= (math.floor(max*100)/100))  --floating point issue
						else
							return (math.floor(value*100)/100 <= (math.floor(max*100)/100))
						end
					end
				end
			end

			for i = 1, MenuCapacity, 1 do --If upgrade is duplicate or maxed, reroll
				if ((menu[i].text == upgrade[1]) or (CheckMaxed(upgrade) == true)) then
					while ((menu[i].text == upgrade[1]) or (CheckMaxed(upgrade) == true)) do
						upgrade = UpgradeRoulette(activator)
					end
				end
			end

			menu[index] = {text = upgrade[1], value = table.concat(upgrade,","), disabled = false} --value can't accept tables, only strings/numbers, do not change value key
		end
		player[class].hasRolled = true
	end
end

--Called when the reroll option is selected, subtracts a reroll point
function RerollUpgrades(activator)
	local player = UniqueAccountIDs[(ents.FindByClass("tf_player_manager", nil)).m_iAccountID[activator:GetNetIndex()+1]]
	local class = activator.m_iClass

	player.RerollPoints = player.RerollPoints - 1
	player[class].hasRolled = false
	RollUpgrades(activator)
end

--Sets hasRolled to false for all players in the game, usually called on wave end
function ResetRolls()
	for _, v in pairs(UniqueAccountIDs) do
		for i = 1, 9, 1 do
			if v[i] ~= nil then
				v[i].hasRolled = false
			end
		end
	end
end

--[[Apply upgrades to players
	using "custom" allows you do anything you define in the function as an upgrade
	meaning PointTemplate upgrades are possible]]
function AddUpgrade(activator, value)
	local player = UniqueAccountIDs[(ents.FindByClass("tf_player_manager", nil)).m_iAccountID[activator:GetNetIndex()+1]]
	local class = activator.m_iClass
	local purchased = player[class].PurchasedUpgrades
	local upgradetable = {}

	for i in string.gmatch(value, "[^,]+") do
		upgradetable[#upgradetable + 1] = i
	end
	local upgrade = upgradetable[1]
	local attributename = upgradetable[2]
	local min = tonumber(upgradetable[3])
	local increment = tonumber(upgradetable[4])
	local max = tonumber(upgradetable[5])

	if attributename == "custom" then
		if upgrade == "Max Ammo +50%" then
			activator:SetAttributeValue("maxammo primary increased",min+increment*purchased[value])
			activator:SetAttributeValue("maxammo secondary increased",min+increment*purchased[value])
			activator:SetAttributeValue("maxammo grenades1 increased",min+increment*2*purchased[value])
		elseif upgrade == "[EPIC] Mixed Concoction On Hit" then
			activator:SetAttributeValue("add cond on hit",123 + 27*256 + 24*65536) --123 = gas, 27 = milk, 24 = jarate, total is 1579899
			activator:SetAttributeValue("add cond on hit duration",10)
			activator:SetAttributeValue("bleeding duration",10)
		elseif upgrade == "Damage Resistance +15%" then
			activator:SetAttributeValue("dmg taken from fire reduced",math.max(min+increment*purchased[value],max))
			activator:SetAttributeValue("dmg taken from crit reduced",math.max(min+increment*purchased[value],max))
			activator:SetAttributeValue("dmg taken from bullets reduced",math.max(min+increment*purchased[value],max))
			activator:SetAttributeValue("dmg taken from blast reduced",math.max(min+increment*purchased[value],max))
			activator:SetAttributeValue("dmg from melee increased",math.max(min+increment*purchased[value],max))
		end
	elseif attributename ~= "custom" then
		if max ~= nil then
			if increment > 0 then
				activator:SetAttributeValue(attributename,math.min(min+increment*purchased[value],max))
			else
				activator:SetAttributeValue(attributename,math.max(min+increment*purchased[value],max))
			end
		else
			activator:SetAttributeValue(attributename,min+increment*purchased[value])
		end
	end
end

--Give all players specified amount of upgrade points, adds running total to TotalUpgradePoints for late joiners
function AddUpgradePoints(number)
	for _, v in pairs(UniqueAccountIDs) do
		v.UpgradePoints = v.UpgradePoints + number
	end
	TotalUpgradePoints = TotalUpgradePoints + number
end

--Give all players specified amount of rerolls, adds running total to TotalRerollPoints for late joiners
function AddRerollPoints(number)
	for _, v in pairs(UniqueAccountIDs) do
		v.RerollPoints = v.RerollPoints + number
	end
	TotalRerollPoints = TotalRerollPoints + number
end

--Set all players's upgrade points to specified value without adding or subtracting to TotalUpgradePoints
function SetUpgradePoints(number)
	for _, v in pairs(UniqueAccountIDs) do
		v.UpgradePoints = number
	end
end

--Set all players's rerolls to specified value without adding or subtracting to TotalRerollPoints
function SetRerollPoints(number)
	for _, v in pairs(UniqueAccountIDs) do
		v.RerollPoints = number
	end
end

--Iterates upon PurchasedUpgrades table and calls AddUpgrade for each upgrade, called OnSpawn of every player
function ReAddPurchasedUpgrades(activator)
	local player = UniqueAccountIDs[(ents.FindByClass("tf_player_manager", nil)).m_iAccountID[activator:GetNetIndex()+1]]
	local class = activator.m_iClass
	local purchased = player[class].PurchasedUpgrades

	for k, _ in pairs(purchased) do
		AddUpgrade(activator, k)
	end
	activator:RefillAmmo()
end

--[[This function will display the shop menu
	It shows how many upgrade levels were purchased and the max if it exists
	It will also show the corresponding class you are playing as in the title
	Shows how many upgrade points are remaining
	Always adds the reroll option to the bottom of the list
	Will disable the shop if the player has no more upgrade points]]
function ShowUpgradeMenu(activator)
	local player = UniqueAccountIDs[(ents.FindByClass("tf_player_manager", nil)).m_iAccountID[activator:GetNetIndex()+1]]
	local class = activator.m_iClass
	local menu = player[class].UpgradeMenu
	local purchased = player[class].PurchasedUpgrades

	menu[MenuCapacity+1] = {text="Reroll " .. classIndices_Internal[class] .. " Shop\n    "  .. player.RerollPoints .. " rerolls remaining", value="reroll"}
	if player.RerollPoints == 1 then
		menu[MenuCapacity+1] = {text="Reroll " .. classIndices_Internal[class] .. " Shop\n    "  .. player.RerollPoints .. " reroll remaining", value="reroll"}
	elseif player.RerollPoints <= 0 then
		menu[MenuCapacity+1] = {text="Reroll " .. classIndices_Internal[class] .. " Shop\n    "  .. player.RerollPoints .. " rerolls remaining", value="reroll", disabled = true}
	end

	menu.title = classIndices_Internal[class] .. " Shop\nSelect an upgrade\n" ..  player.UpgradePoints .. " upgrade points remaining\n "
	if player.UpgradePoints == 1 then
		menu.title = classIndices_Internal[class] .. " Shop\nSelect an upgrade\n" .. player.UpgradePoints .. " upgrade point remaining\n "
	elseif player.UpgradePoints <= 0 then
		for i = 1, MenuCapacity+1, 1 do
			menu[i].disabled = true
		end
	end

	for i = 1, MenuCapacity, 1 do
		local value = menu[i].value
		local upgradetable = {}
		for k in string.gmatch(value, "[^,]+") do
			upgradetable[#upgradetable + 1] = k
		end
		local min = upgradetable[3]
		local increment = upgradetable[4]
		local max = upgradetable[5]

		if purchased[value] ~= nil then
			menu[i].text = menu[i].text .. "\n    #: " .. purchased[value]
		else
			menu[i].text = menu[i].text .. "\n    #: 0"
		end
		if max ~= nil then
			menu[i].text = menu[i].text .. "          Max: " .. math.ceil((max-min)/increment) --big brain math
		end
	end

	activator:DisplayMenu(menu)

	for i = 1, MenuCapacity, 1 do
		local value = menu[i].value
		local upgradetable = {}
		for k in string.gmatch(value, "[^,]+") do
			upgradetable[#upgradetable + 1] = k
		end
		upgrade = upgradetable[1]

		menu[i].text = upgrade
	end
end

function CloseUpgradeMenu(activator) --probably redundnant
	activator:HideMenu()
end

function deepCopy(original) --special thx to https://developer.roblox.com
	local copy = {}
	for k, v in pairs(original) do
		if type(v) == "table" then
			v = deepCopy(v)
		end
		copy[k] = v
	end
	return copy
end

function OnWaveSuccess(wave) --adds however many upgrade points every wave, can also be edited to do other things
	AddUpgradePoints(3)
end

function OnWaveReset(wave) --on wave reset, load save state from WaveState
	if WaveState[wave] ~= nil then
		TotalUpgradePoints = WaveState[wave].TotalUpgradePoints
		TotalRerollPoints = WaveState[wave].TotalRerollPoints
		UniqueAccountIDs = deepCopy(WaveState[wave].UniqueAccountIDs)
	end
end

function OnWaveInit(wave) --on wave init, create save state in WaveState, reset rolls
	EnableUpgradeStations() --for wave 1
	if WaveState[wave] == nil then
		WaveState[wave] =
		{
			TotalUpgradePoints = TotalUpgradePoints,
			TotalRerollPoints = TotalRerollPoints,
			UniqueAccountIDs = deepCopy(UniqueAccountIDs)
		}
	end
	ResetRolls()
end