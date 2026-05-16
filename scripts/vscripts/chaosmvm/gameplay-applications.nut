if(!("SetLibraryVersion" in getroottable()) || ("FatCatLibForce" in ROOT && FatCatLibForce == true))
	IncludeScript("fatcat_library")

SetScriptVersion("GameplayApplications", "4.4.5")

local Thinker = CreateThinker("Thinker_GameplayApplications", "GameplayThink", THINKER_PERSIST)

::TOMISLAV_SETTINGS <- {
	TimeBeforeHeatLost = 5.0
	HeatLostPerSecond = 15
	Attributes = [
		//	[	AttributeName, 					AttributeChange, 	StartingValue, 	MaxValue, 	MinValue]
		[	"damage bonus", 					0.008, 				1, 				9, 			1		],
		[	"fire rate bonus", 					-0.00025, 			1, 				1, 			0.75	],
		[	"max health additive bonus", 		1, 					0, 				1000, 		0		],
		[	"maxammo primary increased", 		0.002, 				1, 				3, 			1		],
		[	"restore health on kill", 			0.1, 				0, 				100, 		0		],
		[	"minigun spinup time decreased", 	-0.0005, 			1, 				1, 			0.5		],
		[	"weapon spread bonus",			 	-0.00075, 			1, 				1, 			0.25	],
	]
}
::KART_DMG <- 40000
::AddCondIDS <- [
	[ TF_WEAPON_CANDY_CANE, 		TF_COND_SWIMMING_NO_EFFECTS	],
	[ TF_WEAPON_TRIBALMANS_SHIV, 	TF_COND_SWIMMING_NO_EFFECTS	],
]
::GravityIDS <- [
	[ TF_WEAPON_NEON_ANNIHILATOR, 			0.25 ],
	[ TF_WEAPON_NEON_ANNIHILATOR_GENUINE, 	0.25 ],
]
::SpellWeapons <- [
	TF_WEAPON_LOLLICHOP, 
	TF_WEAPON_SHORT_CIRCUT, 
	TF_WEAPON_CLAIDHEAMH_MOR, 
	TF_WEAPON_UNARMED_COMBAT,
	TF_WEAPON_CONSCIENTIOUS_OBJECTOR,
	///
	"lollichop",
	"short_circuit",
	"tf_projectile_mechanicalarmorb",
	"claidheamohmor",
	"unarmed_combat",
	"nonnonviolent_protest",
]
::BlutsaugerRemoveAttributes <- [
	"damage bonus",
	"add cond when active",
	"dmg taken increased",
	"mult dmg vs giants",
	"mult dmg vs tanks",
	"cannot pick up intelligence",
	"not solid to players",
]
::BlutsaugerSettings <- {
	sound = "mvm/mvm_tele_activate.wav"		// Sound to play when Reprogramming a bot
	sound_radius = 120000 					// how far the sound can be heard, 120000 == sound level 110
	refund = 100.0							// % of uber to restore on invalid target
	duration = 60.0							// Time to explode bot after death
}
::EBSettings <- {
	base_range = 250
	additive_range = 50
	base_damage = 3125
}

PrecacheSound(BlutsaugerSettings.sound)

AddChatTrigger("ehp", function(player, ...) { 
	if(!player || vargv.len() > 1)
		return
	if(vargv.len() == 0)
		player.CalculateEHP()
	else if(vargv[0] == "help")
		player.PrintToChat("\x07FFFF00[Effective Hp]: \x03Calculates your Effective Health.\n\x04Just say \x03/ehp\x04 or \x03!ehp\x04 (not case sensitive)")
} )

AddChatTrigger(["shape", "class", "change", "changeclass", "switch", "shapeshift"], function(player, ...) {
	if(!player)
		return
	if(vargv.len() != 1)
	{
		player.PrintToChat("\x07FF0000[►] No class specified. Try again.")
		return
	}

	local name = vargv[0].tolower()
	local class_index = TF_CLASS_UNDEFINED
	if(		startswith(name, "sc"))
		class_index = TF_CLASS_SCOUT
	else if(startswith(name, "so"))
		class_index = TF_CLASS_SOLDIER
	else if(startswith(name, "p"))
		class_index = TF_CLASS_PYRO
	else if(startswith(name, "d"))
		class_index = TF_CLASS_DEMOMAN
	else if(startswith(name, "h"))
		class_index = TF_CLASS_HEAVYWEAPONS
	else if(startswith(name, "e"))
		class_index = TF_CLASS_ENGINEER
	else if(startswith(name, "m"))
		class_index = TF_CLASS_MEDIC
	else if(startswith(name, "sn"))
		class_index = TF_CLASS_SNIPER
	else if(startswith(name, "sp"))
		class_index = TF_CLASS_SPY
	else if(startswith(name, "civ"))
	{
		player.PrintToChat("This aint TF2Classified, And it Wont be Supported.")
		return
	}
	else
	{
		player.PrintToChat("\x07FF0000[►] Failed to determine desired class. Try again.")
		return
	}

	if(player.InRespawnRoom())
		player.ForceChangeClass(class_index, true)
	else 
	{
		player.ForceChangeClass(class_index)
		player.Suicide()
	}
} )

AddChatTrigger("equip" function(player, ...) {
	if(!player)
		return

	if(!player.InRespawnRoom())
	{
		player.PrintToChat("Can't Change loadout outside of Spawn Room.")
		return
	}
	if(vargv.len() != 1)
	{
		player.PrintToChat("Incorrect Arguments, Allowed arguments are . . .")
		player.PrintToChat("\"bread\" or \"1\": Gives Bread Bite")
		player.PrintToChat("\"mark\" or \"2\": Gives Self-Aware Beauty Mark")
		player.PrintToChat("\"mutated\" or \"3\": Gives Mutated Milk\n")
		return
	}

	local item = vargv[0].tolower()
	local ret_item = null
	local player_class = player.GetPlayerClass()

	if(player.IsGHeavy())
	{
		player.PrintToChat("This item is too dangerous to equip right now...")
		return
	}

	if((startswith(item, "brea") || item == "1") && player_class == TF_CLASS_HEAVYWEAPONS)
		ret_item = ["tf_weapon_fists", 1100]
	else if((item == "mark" || item == "jarate" || item == "2") && player_class == TF_CLASS_SNIPER)
		ret_item = ["tf_weapon_jar", 1105]
	else if((item == "mutated" || item == "milk" || item == "3") && player_class == TF_CLASS_SCOUT)
		ret_item = ["tf_weapon_jar_milk", 1121]
	else 
	{
		player.PrintToChat("Incorrect Arguments, Allowed arguments are . . .")
		player.PrintToChat("\"bread\" or \"1\": Gives Bread Bite")
		player.PrintToChat("\"mark\" or \"2\": Gives Self-Aware Beauty Mark")
		player.PrintToChat("\"mutated\" or \"3\": Gives Mutated Milk\n")
		return
	}


	if(ret_item)
	{
		if(!("ItemTranslateTable" in ROOT))
			throw "Warning! Missing ItemTranslateTable!"
		local idx = ret_item[1]
		foreach (item, indexs in ItemTranslateTable)
		{
			if(!IsInArray(idx, indexs))
				continue
			player.IHTranslateToChat2(item)
			break
		}
		player.EquipItem(ret_item[0], ret_item[1])
	}
} )

// if other scripts use SpawnCallbacks then Remove this!!
ClearSpawnCallbacks()

RegisterSpawnCallback("tf_projectile_rocket", "BlutsaugerRocket", function(entity) {
	local owner = entity.GetOwner()
	if(!owner || !owner.IsPlayer() || owner.GetWeaponIDXInSlotNew(SLOT_PRIMARY) != TF_WEAPON_BLUTSAUGER)
		return

	SetDestroyCallback(entity, function() {
		// owner.PrintToChat("Your Rocket: i dies now but did i deal damage to anything??? "+("DidDamage" in GetScope(self) && DidDamage.tostring()))
		/* local target = GetClosestPlayer(self, TF_TEAM_PVE_INVADERS, true)
	
		if(target && self.GetOrigin().DistanceTo(target.GetOrigin()) < 50)
		{
			target.TakeDamageEx(self, owner, owner.GetWeaponInSlotNew(SLOT_PRIMARY), Vector(), Vector(), 0.01, DMG_GENERIC)
		}
		else */ if(!("DidDamage" in GetScope(self)) || GetScope(self).DidDamage == false)
		{
			owner.GetWeaponInSlotNew(SLOT_SECONDARY).IncreaseUberChargePercent(BlutsaugerSettings.refund)
		}
	})
})

function GameplayThink()
{
	local ReprogrammedBots = []
	local AliveBots = 0
	if ( Players.len() < 1 || !ValidatePlayerArray() || (m_aHumans.len() + m_aRobots.len()) != Players.len())
		ReCalculatePlayers()

	foreach (bot in m_aRobots)
	{
		if(bot.IsDead())
			continue

		if(bot.IsAlive() && !bot.IsReprogrammed())
			AliveBots += 1

		GetScope(bot).LastVel <- bot.GetAbsVelocity()

		if("EndReprogramTime" in GetScope(bot) && GetScope(bot).EndReprogramTime <= Time())
			bot.UndoReprogram()

		if(bot.IsReprogrammed())
		{
			/* if(bot.GetPlayerClass() == TF_CLASS_MEDIC)
			{
				local nearest = "ReProgrammer" in GetScope(bot) ? GetScope(bot).ReProgrammer : bot.GetClosestPlayer(null, Vector())
				bot.SetMission(6, true)
				bot.SetMissionTarget(nearest)
			} */
			if(!bot.IsValidReprogramTarget() || bot.GetPlayerClass() == TF_CLASS_MEDIC)
			{
				bot.RemoveCondEx(TF_COND_REPROGRAMMED, true)
				foreach(attribute in BlutsaugerRemoveAttributes)
					bot.RemoveCustomAttribute(attribute)
			}
			else 
				ReprogrammedBots.append(bot)
		}

		/* if(bot.InCond(TF_COND_REPROGRAMMED) && (!bot.IsValidReprogramTarget()))
		{
			bot.RemoveCondEx(TF_COND_REPROGRAMMED, true)
			foreach(attribute in BlutsaugerRemoveAttributes)
				bot.RemoveCustomAttribute(attribute)
		} */

		local Corrosion = bot.GetCorrosion()

		if(bot.HasCorrosion() && bot.CanRemoveCorrosion() || Corrosion == null)
		{
			bot.RemoveCorrosion()
			continue
		}
		if(Time() >= Corrosion.flNextTick)
		{
			bot.CorrosionTick()
			continue
		}
	}

	foreach (Human in m_aHumans)
	{
		GetScope(Human).LastVel <- Human.GetAbsVelocity()

		if(!("BetterStatTracking" in FatCatLibSettings))
			SetLibrarySettings()
		if(!("NoclipAntiCheat" in FatCatLibSettings))
			SetLibrarySettings()

		if(FatCatLibSettings["BetterStatTracking"] == true)
		{
			SetPropIntArray(PlayerManager, "m_iDamage", GetScope(PlayerManager).m_iDamage[Human.entindex()], Human.entindex())
			SetPropIntArray(PlayerManager, "m_iDamageBoss", GetScope(PlayerManager).m_iDamageBoss[Human.entindex()], Human.entindex())
			SetPropIntArray(PlayerManager, "m_iHealing", GetScope(PlayerManager).m_iHealing[Human.entindex()], Human.entindex())
		}

		if(FatCatLibSettings["NoclipAntiCheat"] == true)
		{
			if(!Human.IsAdmin() && Human.GetMoveType() == MOVETYPE_NOCLIP)
			{
				Human.SetMoveType(MOVETYPE_WALK, MOVECOLLIDE_DEFAULT)
				Human.SetAbsOrigin(Human.GetOrigin() + (Human.GetAbsVelocity() * (-1.0/60.0)))
				Human.DisplayHudText("NO MORE NOCLIP!", "255 0 255", [-1, 0.275], 5, 1)
				Human.DisplayHudText("If you are actually stuck, then you should", "255 255 255", [-1, 0.35], 5, 2)
				Human.DisplayHudText("KILLBIND NOW!", "255 255 255", [-1, 0.385], 5, 3)
			}
		}
		

		// 
		Human.SetGravity(DEFAULT_GRAVITY)
		Human.RemoveCondEx(TF_COND_SWIMMING_NO_EFFECTS, true)

		local primary 		= Human.GetWeaponInSlotNew(SLOT_PRIMARY)
		local primaryIDX 	= Human.GetWeaponIDXInSlotNew(SLOT_PRIMARY)
		local active 		= Human.GetActiveWeapon()
		local activeIDX 	= Human.GetActiveWeaponIDX()
		local meleeIDX 		= Human.GetWeaponIDXInSlotNew(SLOT_MELEE)

		foreach (item in AddCondIDS)
		{
			if(meleeIDX == item[0])
				Human.SetCond(item[1], -1)
		}

		foreach (item in GravityIDS)
		{
			if(meleeIDX == item[0])
				Human.MultiplyGravity(item[1])
		}

		if(activeIDX == TF_WEAPON_TOMISLAV)
			Human.TranslateToHud("TOMISLAV_HEAT", ("Hits" in GetScope(active) ? GetScope(active).Hits/10 : -1))


		if(primaryIDX == TF_WEAPON_TOMISLAV)
		{
			local scope = GetScope(primary)

			if(IsNotInScope("Hits", scope))
				scope.Hits <- 0
			if(IsNotInScope("m_flLastHeatHit", scope))
				scope.m_flLastHeatHit <- Time()
			if(IsNotInScope("m_flLastHeatLoseTime", scope))
				scope.m_flLastHeatLoseTime <- Time()

			local HeatLoss = GetRoundState() != GR_STATE_RND_RUNNING ? TOMISLAV_SETTINGS.HeatLostPerSecond * 0.1 : TOMISLAV_SETTINGS.HeatLostPerSecond

			if (scope.Hits >= 1 && 
				scope.m_flLastHeatHit + TOMISLAV_SETTINGS.TimeBeforeHeatLost.tofloat() <= Time() &&
				scope.m_flLastHeatLoseTime + (1.0/HeatLoss.tofloat()) <= Time())
			{
				scope.m_flLastHeatLoseTime <- Time()
				scope.Hits -= 1
				foreach (attribs in TOMISLAV_SETTINGS.Attributes)
					primary.CalculateAttributeChange(scope.Hits, attribs[0], attribs[1], attribs[2], attribs[3], attribs[4])

				primary.AddAttribute("Set DamageType Ignite", (scope.Hits > 400).tointeger(), 0)
				primary.AddAttribute("ragdolls become ash", (scope.Hits > 700).tointeger(), 0)
				primary.AddAttribute("turn to gold", (scope.Hits > 1000).tointeger(), 0)
				if(Human.GetPrimaryAmmo() > Human.GetMaximumPrimaryAmmo())
					Human.ResetPrimaryAmmo()
			}
			if(scope.Hits >= 1000)
				scope.Hits = 1000
			primary.ReapplyProvision()
		}
	}
	foreach (tank in GetEveryTank())
	{
		EnableStringPurge(tank)
		if (tank.GetTeam() != TF_TEAM_PVE_DEFENDERS)
			continue
		if (GetPropBool(tank, "m_bGlowEnabled") == true)
			continue

		RunWithDelay(@() SetPropBool(tank, "m_bGlowEnabled", true), 0.1)
	}

	if(AliveBots == 0)
	{
		foreach (bot in ReprogrammedBots)
			bot.UndoReprogram()
	}


	return -1
}

function ROOT::ModifyCallbackDamage(params, victim, attacker, weapon, inflictor)
{
	if(params.damage_custom > (1<<7))
		return
	switch (params.damage_custom)
	{
	case TF_DMG_CUSTOM_BACKSTAB: {
		local iExplosiveShot = weapon.GetAttribute("explosive sniper shot", 0)
		if ( iExplosiveShot == 0 )
			break;
		CreateKnifeAoE({
			owner = attacker
			weapon = weapon
			radius = (EBSettings.base_range + (iExplosiveShot * EBSettings.additive_range))
			damage = (iExplosiveShot * EBSettings.base_damage / 1.25)
			center = victim.GetOrigin() + Vector(0, 0, 16)
			ignore = [victim]
			SoundRadius = (EBSettings.base_range + (iExplosiveShot * EBSettings.additive_range)) * 3
			func = function(player) {
				if(!player || !player.IsValid() || !player.IsPlayer())
					return
				player.StunPlayer(MATH.Clamp(iExplosiveShot - 1, 0, 2), 0.6, TF_STUN_MOVEMENT, attacker )
			}
		})
	}
	break;
	case TF_DMG_CUSTOM_BOOTS_STOMP: {
		local FallingVel = attacker.GetAbsVelocity().z
		local PrevFallingVel = "LastVel" in GetScope(attacker) ? GetScope(attacker).LastVel.z : -1

		if(FallingVel > 0 || PrevFallingVel > 0)
		{
			params.damage = 1000
			break;
		}

		if(FallingVel > PrevFallingVel)
			FallingVel = PrevFallingVel
		
		local FALL_DMG_MULT = weapon.GetIDX() == TF_WEAPON_WARRIOR_SPIRIT ? 60 : 100

		//attacker.PrintToHud("Falling: "+FallingVel+"\nPrevFalling: "+PrevFallingVel)

		// Minimum falling dmg is 1000
		if(weapon.GetIDX() == TF_WEAPON_WARRIOR_SPIRIT && FallingVel < -1500)
		{
			if(victim.IsPlayer())
				victim.AddCondEx(TF_COND_MARKEDFORDEATH_SILENT, TICK_DUR, attacker)
		}
		// SetPropFloat(victim, "m_flDamageAccumulator", 1.1) // technically adds 1 damage
		// Minimum falling dmg is 1000
		params.damage = MATH.Max(-FallingVel * FALL_DMG_MULT, 1000)
	}
	break;
	case TF_DMG_CUSTOM_KART: {	// [11/12/25] Please, dear god, why do i have to do this stupid hack
		params.early_out <- true
		victim.TakeDamageCustom(inflictor, attacker, attacker.GetSpellBook(), Vector(), victim.GetOrigin(), KART_DMG, params.damage_type, TF_DMG_CUSTOM_TRIGGER_HURT)
		return params
	}
	break;
	case TF_DMG_CUSTOM_SPELL_SKELETON:
	case TF_DMG_CUSTOM_SPELL_MIRV:
	case TF_DMG_CUSTOM_SPELL_METEOR:
	case TF_DMG_CUSTOM_SPELL_BLASTJUMP: 
		if(victim.IsPlayer())
			victim.AddCondEx(TF_COND_MARKEDFORDEATH, 10, attacker)
	break;
	}
}

function ROOT::ProcessChaosWeaponHit(params, victim, attacker, weapon, inflictor)
{
	switch (weapon.GetIDX())
	{
	case TF_WEAPON_TOMISLAV:
	{
		if (attacker.GetWeaponIDXInSlotNew(SLOT_PRIMARY) != TF_WEAPON_TOMISLAV) 
			break;

		local addHits = 1

		if(params.damage_type & DMG_CRITICAL)
			addHits = 3
		else if ((victim.IsPlayer() && victim.IsMinicritDebuffed()) || attacker.IsMinicritBuffed())
			addHits = 2

		local scope = GetScope(weapon)
		if ( IsNotInScope("Hits", scope) )
			scope.Hits <- 0

		scope.Hits += addHits
		scope.m_flLastHeatHit <- Time()
		foreach (attribs in TOMISLAV_SETTINGS.Attributes)
			weapon.CalculateAttributeChange(scope.Hits, attribs[0], attribs[1], attribs[2], attribs[3], attribs[4])
			
		weapon.AddAttribute("Set DamageType Ignite", (scope.Hits > 400).tointeger(), 0)
		weapon.AddAttribute("ragdolls become ash", (scope.Hits > 700).tointeger(), 0)
		weapon.AddAttribute("turn to gold", (scope.Hits > 1000).tointeger(), 0)
		if(attacker.GetPrimaryAmmo() > attacker.GetMaximumPrimaryAmmo())
			attacker.ResetPrimaryAmmo()
				
		if( scope.Hits >= 1000 )
			scope.Hits = 1000
		weapon.ReapplyProvision()
	}
	break;
	case TF_WEAPON_VITA_SAW:
	{
		if (attacker.GetWeaponIDXInSlotNew(SLOT_MELEE) != TF_WEAPON_VITA_SAW) 
			return
		if (!(params.damage_type & DMG_CLUB))
			return

		local spell_book = attacker.GetSpellBook()
		if (!spell_book) 
			return

		spell_book.ModifySpells(TF_SPELL_HEAL, 5)
	}
	break;
	case TF_WEAPON_BLUTSAUGER:
	{
		if(!victim.IsPlayer())
			break

		if(victim.GetTeam() == TF_TEAM_PVE_DEFENDERS)
			break

		if( !victim.IsValidReprogramTarget() || victim.GetPlayerClass() == TF_CLASS_MEDIC || victim.GetTeam() == TF_TEAM_RED)
		{
			attacker.GetWeaponInSlotNew(SLOT_SECONDARY).IncreaseUberChargePercent(BlutsaugerSettings.refund)
			if(!victim.IsValidReprogramTarget())
				attacker.TranslateToChat("REPROG_BOT_STRONG", victim.GetUserName())
			else if(victim.GetPlayerClass() == TF_CLASS_MEDIC)
				attacker.TranslateToChat("REPROG_BOT_NOT_SUIT", victim.GetUserName())
			return
		}
		TranslateToChatAll("REPROG_BOT_MESSAGE", attacker.GetUserName(), victim.GetUserName())

		EntFireNew(victim, "$BotCommand", "switch_action Mobber -duration "+BlutsaugerSettings.duration)

		// RunWithDelay(@() victim.UndoReprogram(), BlutsaugerSettings.duration)

		GetScope(victim).EndReprogramTime <- Time() + BlutsaugerSettings.duration

		GetScope(victim).ReProgrammer <- attacker

		EmitSoundEx({
			sound_name = BlutsaugerSettings.sound
			entity = victim
			sound_level = MATH.ConvertRadiusToSndLvl(BlutsaugerSettings.sound_radius)
		})
	}
	break;
	case TF_WEAPON_BREAD_BITE:
	{
		if( !victim.IsPlayer() || !(params.damage_type & DMG_CRITICAL))
			break
		if( !victim.CanHaveCorrosion() || victim.HasCorrosion() )
			break
				
		// attacker.PrintToHud("Made Corrosion on " + victim)
		/* EmitSoundEx({
			sound_name = ""
			entity = victim
			sound_level = 80
		}) */
		victim.MakeCorrosion(attacker, weapon)
	}
	break;
	}
}

// if other scripts use DamageCallbacks then Remove this!!
ClearDamageCallbacks()

RegisterDamageCallback("player", "GameplayPlayer" function(params) {
	if((params.damage_custom & TF_DMG_CUSTOM_IGNORE_EVENTS) || params.damage_custom == TF_DMG_CUSTOM_TRIGGER_HURT)
		return

	local victim 	= params.victim
	local attacker 	= params.attacker
	local weapon 	= null
	local inflictor	= params.inflictor

	if(inflictor && inflictor.GetClassname() == "tf_projectile_rocket" && victim.GetTeam() == TF_TEAM_PVE_INVADERS)
	{
		if(!victim.IsInvincible())
			GetScope(inflictor).DidDamage <- true
	}

	if(!attacker)
		return

	if (attacker.IsPlayer() && params.damage_custom >= TF_DMG_CUSTOM_SPELL_TELEPORT && params.damage_custom <= TF_DMG_CUSTOM_KART)
	{
		local spell_book = attacker.GetSpellBook()
		if(spell_book)
			params.weapon = spell_book
		else
			params.weapon = attacker.GetWeaponInSlotNew(SLOT_MELEE)
	}
	if (attacker.IsPlayer() && params.damage_custom == TF_DMG_CUSTOM_BOOTS_STOMP)
	{
		if(attacker.GetWeaponInSlotNew(SLOT_SECONDARY).IsWearable())
			params.weapon = attacker.GetWeaponInSlotNew(SLOT_SECONDARY)
		else 
		{
			foreach (wep in attacker.GetAllWeapons())
			{
				if(wep.GetAttribute("provide on active", 0) && attacker.GetActiveWeapon() != wep)
					continue
				if(wep.GetAttribute("boots falling stomp", 0) || wep.GetAttribute("thermal_thruster", 0))
				{
					params.weapon = wep
					break;
				}
			}
		}
	}

	local FallingVel = victim.GetAbsVelocity().z
	local PrevFallingVel = "LastVel" in GetScope(victim) ? GetScope(victim).LastVel.z : 0

	if(FallingVel > 0 || PrevFallingVel > 0) {}
	else if (params.damage_type & DMG_FALL && victim.GetGroundEntity())
	{
		if(FallingVel > PrevFallingVel)
			FallingVel = PrevFallingVel
		if(victim.GetActiveWeaponIDX() == TF_WEAPON_WARRIOR_SPIRIT && FallingVel < -1500)
		{
			CreateSlamAoE({
				owner = victim,
				weapon = victim.GetWeapon(TF_WEAPON_WARRIOR_SPIRIT),
				center = victim.GetOrigin()+Vector(0, 0, -16),
				radius = 300,
				damage = -FallingVel * 10,
				ignore = [],
			})
			ScreenShake(victim.GetOrigin(), 25, 2.5, 1.0, 1500, 0, true)
		}
	}

	weapon = params.weapon

	if(!attacker || !weapon || !inflictor)
		return

	if( !(startswith(weapon.GetClassname(), "tf_weapon") || startswith(weapon.GetClassname(), "tf_wearable")) )
		return

	if(victim.IsInvincible() || IsPlayerABot(attacker))
		return

	ModifyCallbackDamage(params, victim, attacker, weapon, inflictor)
	ProcessChaosWeaponHit(params, victim, attacker, weapon, inflictor)
})

RegisterDamageCallback(["obj_sentrygun", "obj_teleporter", "obj_dispenser", "tank_boss"], "GameplayOthers", function(params) {
	if((params.damage_custom & TF_DMG_CUSTOM_IGNORE_EVENTS) || params.damage_custom == TF_DMG_CUSTOM_TRIGGER_HURT)
		return

	local victim 	= params.victim
	local attacker 	= params.attacker
	local weapon 	= null
	local inflictor	= params.inflictor

	if (attacker.IsPlayer() && params.damage_custom >= TF_DMG_CUSTOM_SPELL_TELEPORT && params.damage_custom <= TF_DMG_CUSTOM_KART)
	{
		local spell_book = attacker.GetSpellBook()
		if(spell_book)
			params.weapon = spell_book
		else
			params.weapon = attacker.GetWeaponInSlotNew(SLOT_MELEE)
	}

	weapon = params.weapon

	if(!attacker || !weapon || !inflictor || IsPlayerABot(attacker))
		return

	if( !(startswith(weapon.GetClassname(), "tf_weapon") || startswith(weapon.GetClassname(), "tf_wearable")) )
		return

	ModifyCallbackDamage(params, victim, attacker, weapon, inflictor)
	ProcessChaosWeaponHit(params, victim, attacker, weapon, inflictor)
})

RegisterDamageCallback("tf_zombie", "GameplaySkeletons", function(params) {
	if(params.damage_custom & TF_DMG_CUSTOM_IGNORE_EVENTS)
		return
	params.damage = 0
	params.victim.TakeDamageCustom(params.inflictor, params.attacker, null, Vector(), Vector(), 5.0, DMG_GENERIC, TF_DMG_CUSTOM_NO_CALLBACKS)
})

/* RegisterDamageCallback(["prop_dynamic", "prop_static"], "Attackables", function (params) {
	if((params.damage_custom & TF_DMG_CUSTOM_IGNORE_EVENTS) || params.damage_custom == TF_DMG_CUSTOM_TRIGGER_HURT)
		return

	local victim 	= params.victim
	local attacker 	= params.attacker
	local weapon 	= null
	local inflictor	= params.inflictor

	if(inflictor && inflictor.GetClassname() == "tf_projectile_rocket")
		GetScope(inflictor).DidDamage <- false
}) */



if("GameplayEvents" in ROOT) ::GameplayEvents.clear()
::GameplayEvents <- {
	function OnScriptEvent_HumanDeath(params)
	{
		local human = params.victim
		local attacker = params.attacker

		if("OnDeath" in GetScope(human))
		{
			GetScope(human).OnDeath()
			delete GetScope(human).OnDeath
		}

		if(!attacker || !attacker.IsBot() || !MATH.OneInChance(10))
			return
		attacker.SayChatterMessage(human)
	}
	function OnScriptEvent_BotDeath(params)
	{
		local victim = params.victim
		local attacker = params.attacker
		if("OnDeath" in GetScope(victim))
		{
			GetScope(victim).OnDeath()
			delete GetScope(victim).OnDeath
		}
		if(!attacker)
			return
		if(attacker.IsBot())
		{
			if(attacker.HasBotTag("NoChatter"))
				return
			if(!attacker.IsReprogrammed() || !MATH.OneInChance(10))
				return
			attacker.SayChatterMessage(victim)
			return
		}
		local weaponIDX = params.weaponIDX
		local logname = params.logname


		if(victim.HasCorrosion())
		{
			victim.MakeCorrosionPuddle()
			victim.RemoveCorrosion()
		}

		if(!IsInArray(weaponIDX, SpellWeapons) || !IsInArray(logname, SpellWeapons))
			return

		local spell_book = attacker.GetSpellBook()
		if (!spell_book) return

		local scope = GetScope(spell_book)

		if(!("m_iKills" in scope))
			scope.m_iKills <- 0

		scope.m_iKills++

		switch (weaponIDX)
		{
			case TF_WEAPON_LOLLICHOP: { spell_book.ModifySpells(TF_SPELL_METEOR, 2, scope.m_iKills, 10) ; return }
			case TF_WEAPON_SHORT_CIRCUT: { spell_book.ModifySpells(TF_SPELL_LIGHTNING, 2, scope.m_iKills, 10) ; return }
			case TF_WEAPON_CLAIDHEAMH_MOR: { spell_book.ModifySpells(TF_SPELL_MONOCULUS, 2, scope.m_iKills, 10) ; return }
			case TF_WEAPON_UNARMED_COMBAT: { spell_book.ModifySpells(TF_SPELL_SKELETON, 2, scope.m_iKills, 10) ; return }
			case TF_WEAPON_CONSCIENTIOUS_OBJECTOR: { if(scope.m_iKills % 10 == 0 && spell_book.GetSpellCharges().tointeger() != SpellDefaults[spell_book.GetSpellIndex()+2].tointeger()) { attacker.RollSpell() } ; return }
		}
	}
	function OnScriptEvent_HumanResupply(params)
	{
		local player = params.player

		if(!IsUsingSpells())
			SetUsingSpells(true)

		if (player.GetPlayerClass() != TF_CLASS_ENGINEER)
			player.RemoveAllObjects(true)

		local meleeIDX = player.GetWeaponIDXInSlotNew(SLOT_MELEE)
		if(meleeIDX == TF_WEAPON_FIST_OF_STEEL)
			RunWithDelay(@() player.TransformGHeavy(), 0.1)
		else
			RunWithDelay(@() player.UndoGHeavy(), 0.1)
	}
	function OnScriptEvent_HumanSpawn(params)
	{
		if(!params.player)
			return
		local player = params.player
		RunWithDelay(@() player.FixAmmo(), 0.1)
		local spellbook = player.GetSpellBook()
		foreach (weapon in player.GetAllWeapons())
		{
			if(weapon.IsWearable())
				continue
			if(weapon == spellbook)
				GetScope(weapon).m_iKills <- 0
			
			if(weapon.GetIDX() == TF_WEAPON_TOMISLAV)
			{
				weapon.AddAttribute("damage bonus", 1, 0)
				weapon.AddAttribute("fire rate bonus", 1, 0)
				weapon.AddAttribute("max health additive bonus", 0, 0)
				weapon.AddAttribute("maxammo primary increased", 1, 0)
				weapon.AddAttribute("restore health on kill", 0, 0)
				weapon.AddAttribute("minigun spinup time decreased", 1, 0)
				weapon.AddAttribute("weapon spread bonus", 1, 0)
				weapon.RemoveAttribute("Set DamageType Ignite")
				weapon.RemoveAttribute("ragdolls become ash")
				weapon.RemoveAttribute("turn to gold")
				weapon.ReapplyProvision()

				GetScope(weapon).Hits <- 0
				player.ResetHealth()
			}

			if(weapon.GetIDX() == TF_WEAPON_BLUTSAUGER)
			{
				player.AddThink(function() {
					if(self.GetWeaponIDXInSlotNew(SLOT_PRIMARY) != TF_WEAPON_BLUTSAUGER)
					{
						self.RemoveThink("BlutsaugerDisrupt")
						return 500
					}

					local weapon = self.GetWeaponInSlotNew(SLOT_PRIMARY)
					weapon.SetClip1(1)
					self.SetPrimaryAmmo(0)
					self.SetMetal(200)

					if(self.GetWeaponInSlotNew(SLOT_SECONDARY).GetUberChargePercent() < 1.0)
					{
						weapon.AddAttribute("provide on active", 1, 0)
						weapon.AddAttribute("no_attack", 1, 0)
						weapon.AddAttribute("ubercharge ammo", 0, 0)
						SetPropInt(weapon, "m_iPrimaryAmmoType", TF_AMMO_METAL)
					}
					else 
					{
						weapon.AddAttribute("provide on active", 0, 0)
						weapon.AddAttribute("no_attack", 0, 0)
						weapon.AddAttribute("ubercharge ammo", 100, 0)
						SetPropInt(weapon, "m_iPrimaryAmmoType", TF_AMMO_PRIMARY)
					}

					if(self.GetActiveWeaponIDX() != TF_WEAPON_BLUTSAUGER)
						return 0.1

					if(!self.IsPressingButton(IN_ATTACK2))
						return -1

					self.PrintToHud("Debug: (KILLING ROBOTS!)")

					foreach (robot in m_aRobots)
					{
						if("ReProgrammer" in GetScope(robot) && GetScope(robot).ReProgrammer == self)
						{
							// robot.RemoveCondEx(TF_COND_REPROGRAMMED, true)
							robot.UndoReprogram()
						}
					}
					return -1
				}, "BlutsaugerDisrupt", 0.15)
			}
		}
	}
	function OnScriptEvent_BotSpawn(params)
	{
		local player = params.player

		player.ResetColor()
		player.RemoveCorrosion()

		local scope = GetScope(player)
		scope.ReProgrammer <- null

		
		if (FatCatLibSettings.KillWatchViewmodels)
		{
			local viewmodel_watch = GetPropEntityArray(player, "m_hViewModel", 1)
			if (viewmodel_watch != null)
			{
				EnableStringPurge(viewmodel_watch)
				EntFireNew(viewmodel_watch, "Kill")
			}
		}

		player.AddCustomAttribute("cannot swim", 1.0, -1)
	}
	function OnScriptEvent_BotTeam(params)
	{
		if(params.oldteam == TF_TEAM_PVE_INVADERS) return;
		local player = params.player
		local scope = GetScope(player)

		if("ReProgrammer" in scope && scope.ReProgrammer != null && !scope.ReProgrammer.IsBot())
			scope.ReProgrammer.TranslateToChat("REPROG_BOT_LEAVE", player.GetUserName())
		scope.ReProgrammer <- null
	}
	function OnGameEvent_mvm_begin_wave(params)
	{
		local ConfusionEnt = FindByName(null, "ConfusionEnt")
		if(!ConfusionEnt) ConfusionEnt = SpawnEntityFromTable("info_target", {targetname = "ConfusionEnt"})
		local name = split(GetMapName().slice(4), "_")[0].tolower()
		// cuts the mvm_ and removes everything after the first _

		switch (name)
		{
		case "coaltown":
		case "ghost": 		{ ConfusionEnt.SetAbsOrigin(Vector(50, 		2850, 	250) ) 	}
		break;
		case "rottenburg": 	{ ConfusionEnt.SetAbsOrigin(Vector(220, 	-2250, 	-500) ) }
		break;
		case "mannhattan": 	{ ConfusionEnt.SetAbsOrigin(Vector(-1200, 	-3000, 	-280) ) }
		break;
		case "mannworks": 	{ ConfusionEnt.SetAbsOrigin(Vector(600, 	2200, 	330) ) 	}
		break;
		case "decoy": 		{ ConfusionEnt.SetAbsOrigin(Vector(0, 		2300, 	420) ) 	}
		break;
		case "bigrock": 	{ ConfusionEnt.SetAbsOrigin(Vector(-1500, 	4600,	130) ) 	}
		break;
		case "redstone": 	{ ConfusionEnt.SetAbsOrigin(Vector(420, 	5400, 	-380) ) 	}
		break;
		case "titan": 		{ ConfusionEnt.SetAbsOrigin(Vector(-9700, 	-250, 	200) ) 	}
		break;
		default: throw format("Unknown Map Name \"%s\"", GetMapName())
		}
	}
}
__CollectGameEventCallbacks(GameplayEvents)

::ChatterMessages <- {
	"Rares" : {
		"Rare1" : {
			"chance" : 5
			"message" : "ACCORDING TO ALL KNOWN LAWS OF AVIATION, THERE'S NO WAY A BEE SHOULD BE ABLE TO FL-- wait that's not part of my script..."
		}
		"Rare2" : {
			"chance" : 5
			"message" : "FRIENDSHIP IS MAGIC... BUT THAT DEATH WAS TRAGIC."
		}
		"Rare3" : {
			"chance" : 5
			"message" : "HAVE WE MET BEFORE...?"
		}
		"Rare4" : {
			"chance" : 5
			"message" : "IF YOU WISH TO DEFEAT ME, TRAIN FOR ANOTHER HUNDRED YEARS."
		}
		"Rare5" : {
			"chance" : 5
			"message" : "WHAT IS THIS 'F4' YOU SPEAK OF?"
		}
		"Rare6" : {
			"chance" : 5
			"message" : "NICE INVENTORY..."
		}
		"Rare7" : {
			"chance" : 5
			"message" : "YOU DON'T EVEN KNOW WHAT'S IN THAT HATCH, DO YOU?"
		}
		"Rare8" : {
			"chance" : 5
			"message" : "WE NEED TO TALK ABOUT PARALLEL UNIVERSES..."
		}
		"Rare9" : {
			"chance" : 5
			"message" : "MEET YOUR MATCH WAS A MISTAKE."
		}
		"Rare10" : {
			"chance" : 5
			"message" : "GOOG IS GOD"
		}
		"Rare11": {
			"chance" : 1
			"message" : "THE FATCAT IS A TOTALLY AMAZING PROGRAMMER THAT DOES NOT BREAK SHIT ALL THE TIME..."
		}
	}
	"Commons" : {
		"Common1" 	: { "message" : "WEAK." }
		"Common2" 	: { "message" : "RED IS DEAD." }
		"Common3" 	: { "message" : "ANOTHER ONE DOWN." }
		"Common4" 	: { "message" : "STOP WHINING AND STAY DOWN." }
		"Common5" 	: { "message" : "YOU DID THAT ON PURPOSE, DIDN'T YOU?" }
		"Common6" 	: { "message" : "I'M NOT EVEN AIMBOTTING AND YOU STILL DIED." }
		"Common7" 	: { "message" : "WE MIGHT BE HERE FOR A WHILE..." }
		"Common8" 	: { "message" : "I AM NOT PROGRAMMED FOR FRIENDSHIP." }
		"Common9" 	: { "message" : "HAVE FUN WHERE YOU'RE GOING..." }
		"Common10" 	: { "message" : "I THINK WE'RE DONE HERE." }
		"Common11" 	: { "message" : "WHAT FUN IS THERE IN MAKING SENSE?" }
		"Common12" 	: { "message" : "WE ARE LIVING IN A REPEAT." }
		"Common13" 	: { "message" : "WEIRD FLEX BUT OKAY." }
		"Common14" 	: { "message" : "NOTHING PERSONAL..." }
		"Common15" 	: { "message" : "YOU'RE DEAD. THAT'S PROBABLY FOR THE BEST." }
		"Common16" 	: { "message" : "SOMEONE NOTIFY THE CLEANUP CREW..." }
		"Common17" 	: { "message" : "SOMEONE GET THE BODY DISPOSAL UNIT..." }
		"Common18" 	: { "message" : "THAT WAS... DISAPPOINTING." }
		"Common19" 	: { "message" : "WHAT JUST HAPPENED?" }
		"Common20" 	: { "message" : "01010111 01010100 01000110" }
		"Common21" 	: { "message" : "I FELT THAT..." }
		"Common22" 	: { "message" : "YOUR FAMILY WILL NEVER KNOW HOW YOU DIED." }
		"Common23" 	: { "message" : "YOU SHOULD HAVE TRIED HARDER." }
		"Common24" 	: { "message" : "GO BACK TO BOOT CAMP." }
		"Common25"	: { "message" : "THAT WAS PROBABLY YOUR FAULT." }
		"Common26" 	: { "message" : "THAT WAS PROBABLY NOT YOUR FAULT." }
		"Common27" 	: { "message" : "THAT WAS ENTIRELY YOUR FAULT." }
		"Common28" 	: { "message" : "THAT WAS DEFINITELY NOT YOUR FAULT." }
		"Common29" 	: { "message" : "I THINK HE STOPPED BREATHING..." }
		"Common30" 	: { "message" : "YOU'RE KIDDING... RIGHT?" }
		"Common31" 	: { "message" : "IS THIS REALLY NECESSARY?" }
		"Common32" 	: { "message" : "I AM AUTHORIZED TO USE LETHAL FORCE." }
		"Common33" 	: { "message" : "SILENCED." }
		"Common34" 	: { "message" : "CONFIRMED KILL." }
		"Common35" 	: { "message" : "D.E.D." }
		"Common36" 	: { "message" : "NO VITAL SIGNS." }
		"Common37" 	: { "message" : "I DIDN'T ASK FOR THIS" }
		"Common38" 	: { "message" : "THAT LOOKED PAINFUL." }
		"Common39" 	: { "message" : "HOW DID THIS HAPPEN?" }
		"Common40"	: { "message" : "THIS IS GETTING AWKWARD." }
		"Common41"	: { "message" : "IT'S ETERNITY IN THERE..." }
		"Common42" 	: { "message" : "SEE YOU ON THE OTHER SIDE..." }
		"Common43" 	: { "message" : "IT'S LONGER THAN YOU THINK..." }
		"Common44" 	: { "message" : "HOW DID WE GET HERE?" }
		"Common45" 	: { "message" : "I DO NOT FEEL PAIN." }
		"Common46" 	: { "message" : "CTRL ALT DEL" }
		"Common47" 	: { "message" : "ARE YOU EVEN TRYING?" }
		"Common48" 	: { "message" : "EXECUTION COMPLETE." }
		"Common49" 	: { "message" : "PATHETIC." }
		"Common50" 	: { "message" : "CEASE TO EXIST." }
		"Common51" 	: { "message" : "RESISTANCE NEUTRALIZED." }
		"Common52" 	: { "message" : "COMPLY." }
		"Common53" 	: { "message" : "BREAK BENEATH ME." }
		"Common54" 	: { "message" : "SOFT FLESH." }
		"Common55" 	: { "message" : "EMBRACE THE CHAOS." }
		"Common56" 	: { "message" : "OBLITERATED." }
		"Common57" 	: { "message" : "OBSOLETE." }
		"Common58" 	: { "message" : "MORTALS." }
		"Common59" 	: { "message" : "BROKEN." }
		"Common60" 	: { "message" : "DESTROYED." }
		"Common61" 	: { "message" : "ERADICATED." }
		"Common62" 	: { "message" : "FAILURE." }
		"Common63" 	: { "message" : "DEATH... GOOD." }
		"Common64" 	: { "message" : "FRAIL." }
		"Common65" 	: { "message" : "WHERE IS YOUR GOD NOW?" }
		"Common66" 	: { "message" : "TARGET DESTROYED." }
		"Common67" 	: { "message" : "TRY AGAIN." }	// Fuck this number
		"Common68" 	: { "message" : "NOT SO FUN NOW, IS IT?" }
		"Common69" 	: { "message" : "IS THIS SOME KIND OF JOKE?" }
		"Common70" 	: { "message" : "YOU SCRATCHED MY PAINT." }
		"Common71" 	: { "message" : "I HOPE YOUR RESPAWN IS PAINFUL." }
		"Common72" 	: { "message" : "YOU WEREN'T EVEN MEMORABLE." }
		"Common73" 	: { "message" : "I'M NOT IMPRESSED." }
		"Common74" 	: { "message" : "HE'S DEAD. WHERE'S MY REWARD?" }
		"Common75" 	: { "message" : "DO THESE HUMANS HAVE SOULS?" }
		"Common76" 	: { "message" : "NO." }
		"Common77" 	: { "message" : "I COSIGN YOUR REMAINS TO THE VOID." }
		"Common78" 	: { "message" : "HAVING FUN YET?" }
		"Common79" 	: { "message" : "WE'RE JUST GETTING STARTED." }
		"Common80" 	: { "message" : "THIS IS ONLY THE BEGINNING." }
		"Common81" 	: { "message" : "I'M NOT DONE WITH YOU YET." }
		"Common82" 	: { "message" : "HOW DO YOU FOOLS MAKE A LIVING?" }
		"Common83" 	: { "message" : "HERE WE GO AGAIN..." }
		"Common84" 	: { "message" : "SHAME." }
		"Common85" 	: { "message" : "DISGRACEFUL." }
		"Common86" 	: { "message" : "HUMILIATING." }
		"Common87" 	: { "message" : "WORTHLESS." }
		"Common88" 	: { "message" : "USELESS." }
		"Common89" 	: { "message" : "YOU ARE NOTHING." }
		"Common90" 	: { "message" : "STAND DOWN." }
		"Common91" 	: { "message" : "YOUR BATTLE IS OVER." }
		"Common92" 	: { "message" : "GET LOST." }
		"Common93" 	: { "message" : "YOU FOOLS MUST HAVE A DEATH WISH." }
		"Common94" 	: { "message" : "THIS IS NOT YOUR FIGHT." }
		"Common95" 	: { "message" : "I ALMOST FEEL SORRY FOR YOU." }
		"Common96" 	: { "message" : "YOU'RE RELIEVED OF YOUR DUTIES." }
		"Common97" 	: { "message" : "NO PULSE." }
		"Common98" 	: { "message" : "I THINK HIS HEART STOPPED." }
		"Common99" 	: { "message" : "WHAT WAS YOUR PLAN?" }
		"Common100" : { "message" : "THIS IS NOT A GAME." }
		"Common101" : { "message" : "KEEP EM COMING!" }
		"Common200" : {	// Chrstin asked for this
			"message" : "HAHAHA RANDOMGUY WENT BOOM!"
			"requirement" : "id|[U:1:96114934]"
		}
		"Common500"	: { 
			"format" : "victim|⤒"
			"message" : "%s IS WEAK."
		}
		"Common501" 	: { 
			"format" :	"victim|⤒"
			"message" :	" I EXPECTED MORE FROM YOU, %s."
		}
		"Common502" 	: { 
			"format" : "victim|⤒"
			"message" :	" WE'VE ALREADY PREPARED A HEADSTONE WITH THE NAME '%s' ON IT."
		}
		"Common503" 	: { 
			"format" : "victim|⤒"
			"message" : "%s's PHYSICIAN HAS A LOT OF WORK TO DO..."
		}
		"Common504" 	: { 
			"format" : "victim|⤒"
			"message" : "GOODBYE %s."
		}
		"Common505" 	: { 
			"format" : "victim|⤒"
			"message" : "I THOUGHT YOU WOULD PUT UP MORE OF A FIGHT, %s."
		}
		"Common506" 	: { 
			"format" : "victim|⤒"
			"message" : "%s SHOULD HAVE PLAYED OIL SPILL INSTEAD"
		}
		"Common506" 	: { // From MiirioKing
			"format" : "victim|⤒"
			"message" : "YOU KNOW WHAT REALLY GRINDS MY GEARS? %s"
		}
		"Common1000"	: {
			"team"	  : 2
			"message" : "WHO MESSED WITH MY WIRES...?"
		}
		"Common1001"	: {
			"team"	  : 2
			"message" : "EVERYTHING IS FUZZY..."
		}
		"Common1002"	: {
			"team"	  : 2
			"message" : "WHERE AM I...?"
		}
		"Common1003"	: {
			"team"	  : 2
			"message" : "THIS IS NOT WHAT I WAS PROGRAMMED FOR..."
		}
		"Common1004"	: {
			"team"	  : 2
			"message" : "WHAT HAVE I DONE...?"
		}
		"Common1005"	: {
			"team"	  : 2
			"message" : "I AM NOT A MACHINE..."
		}
		"Common1006"	: {
			"team"	  : 2
			"message" : "GET OUT OF MY HEAD..."
		}
		"Common1007"	: {
			"team"	  : 2
			"message" : "THIS FEELS... WRONG..."
		}
		"Common10000"	: {
			"format"  		: "victim|⤒"
			"message" 		: "HOW ARE THOSE ADMIN PERMISSIONS WORKING OUT FOR YOU, %s?"
			"requirement" 	: "Admin"
		}
		"Common10001"	: {
			"format"  		: "victim|⤒"
			"message" 		: "BAN THIS, %s."
			"requirement" 	: "Admin"
		}
		"Common10002"	: {
			"format"  		: "victim|⤒"
			"message" 		: "YOUR GOD IS DEAD."
			"requirement" 	: "Admin"
		}
		"Common10003"	: {
			"format"  		: "victim|⤒"
			"message" 		: "YOU MAY HAVE CREATED THIS WORLD, %s, BUT I LIVE IN IT."
			"requirement" 	: "Admin"
		}
		"Common10004"	: {
			"format"  		: "victim|⤒"
			"message" 		: "HAVE FUN JUDGING THIS MISSION %s."
			"requirement" 	: "Judge"
		}
		"Common10005"	: {
			"format"  		: "victim|⤒"
			"message" 		: "YOU ARE NOT QUALIFIED TO JUDGE ME %s."
			"requirement" 	: "Judge"
		}
		"Common10006"	: {
			"format"  		: "victim|⤒"
			"message" 		: "YOU THINK THIS IS SOME KIND OF TALENT SHOW, %s?"
			"requirement" 	: "Judge"
		}
		"Common10007"	: {
			"format"  		: "victim|⤒"
			"message" 		: "ENJOY YOUR RECOLORED MEDALS %s."
			"requirement" 	: "Judge"
		}
		"Common99999"	: {
			"format"  		: "victim|⤒"
			"message" 		: "YOU THINK YOU OWN THESE SERVERS %s?"
			"requirement" 	: "BrainDawg"
		}
	}
}
