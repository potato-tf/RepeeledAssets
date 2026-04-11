::CONST <- getconsttable()
::ROOT <- getroottable()

::FATCATLIB_PREFIX 		<- "\x07D000D0► FatCatLib ◄\x01 "
::FATCATLIB_CON_PREFIX 	<- "► FatCatLib ◄ "

::MOD_TF2 <- "Team Fortress 2"
::MOD_TF2C <- "Team Fortress 2 Classified"

if("GetModName" in ROOT)
{
	local Mod = GetModName()
	if(Mod == MOD_TF2C)
	{
		IncludeScript("TF2C Fix")
	}
}
else
{
	function ROOT::GetModName()
		return MOD_TF2
}


/**
 * Sets the library version
 * @param 	{string} 	lib_version 	The Library version to set to.
 * @param 	{int} 		subversion 		The Library subversion to set to.
 * @param 	{bool} 		fail_msg 		If we want to include a fail message
 * @param 	{bool} 		force_include 	If we Force include this library version.
 * @param 	{bool} 		developer 		Developer ... idk
 * 
 * @return 	{bool} 		If the library version was modified
 */

// lib_version is the current installment of this version
function ROOT::SetLibraryVersion(lib_version, subversion = 0, fail_msg = true, force_include = false, developer = false)
{
	local force = false
	if("FatCatLibForce" in ROOT)
		force = FatCatLibForce

	if((force_include || force) || developer)
	{
		printl("Force Included Library")
		::FatCatLibVersion <- {
			version = lib_version
			sub_version = subversion
			forced = "true"
		}
		if(developer == true)
		{
			FatCatLibVersion.developer <- "true"
			PrintToChatAll(FATCATLIB_PREFIX+"\x04DONT FORGET TO DISABLE DEVELOPER MODE!!!\x01")
		}
		return true
	}
	if(!("FatCatLibVersion" in ROOT))
	{
		::FatCatLibVersion <- {
			version = 0
			sub_version = 0
			forced = "false"
		}
	}
	if(FatCatLibVersion.version == lib_version)
	{
		if(FatCatLibVersion.sub_version == subversion)
		{
			if(fail_msg)
				printl("Library Version is the same as old version. Not Including")
			return false
		}
		else if( FatCatLibVersion.sub_version > subversion)
		{
			if(fail_msg)
				printl("Uh oh, you are decremeting subversion without incrementing version!")
			return false
		}
		else
		{
			::FatCatLibVersion <- {
				version = lib_version
				sub_version = subversion
				forced = "false"
			}
			return true
		}
	}
	else
	{
		::FatCatLibVersion <- {
			version = lib_version
			sub_version = subversion
			forced = "false"
		}
		return true
	}
	return false
}
if(!("FatCatLibScriptsVersion" in ROOT))
	::FatCatLibScriptsVersion <- {}

function ROOT::SetScriptVersion(item, version)
	FatCatLibScriptsVersion[item] <- version

if(!("FatCatLibTimeStamp" in ROOT))
	::FatCatLibTimeStamp <- {}

function SetLibraryTimeStamp(timestamp)
	FatCatLibTimeStamp <- timestamp

::ValidLibrarySettings <- {
	// If True removes the unused spy watch viewmodel from every bot on spawn
	// -1 Edict per bot
	"KillWatchViewmodels" : false
	// Only Print Errors to Console
	"ConsoleErrors" : false
	// Print a different Error Message to All Clients
	"PublicErrors" : true
	// Tracks Better Statistics
	"BetterStatTracking" : true
}

function IsValidSetting(setting)
	return setting in ValidLibrarySettings

function ROOT::ReloadLibrary()
{
	local flag = "FatCatLibForce" in ROOT ? FatCatLibForce : false

	if(flag == false)
		ToggleForceFlag(true)
	IncludeScript("fatcat_library")
	if(flag == false)
		ToggleForceFlag(false)
}


function ROOT::SetLibrarySettings(settings_table = {})
{
	if(!("FatCatLibSettings" in ROOT))
	{
		::FatCatLibSettings <-{}
		foreach (setting, def in ValidLibrarySettings)
		{
			FatCatLibSettings[setting] <- def
		}
	}

	foreach (setting, def in ValidLibrarySettings)
	{
		if(!(setting in FatCatLibSettings))
			FatCatLibSettings[setting] <- def
	}

	foreach (setting, value in settings_table)
	{
		if(!IsValidSetting(setting))
			continue

		if(FatCatLibSettings[setting] == settings_table[setting])
			continue

		FatCatLibSettings[setting] <- settings_table[setting]

		local ChatPrint = @(message) ("PrintToChatAll" in ROOT ? PrintToChatAll(message) : ClientPrint(null, 3, message))
		ChatPrint(format(FATCATLIB_PREFIX+"Set \x03%s\x01 to \"\x05%s\x01\"\n", setting.tostring(), value.tostring()))
		printl(format(FATCATLIB_PREFIX+"Set %s to \"%s\"\n", setting.tostring(), value.tostring()))
	}
}

function ROOT::ToggleForceFlag( bool )
	::FatCatLibForce <- bool

if (!SetLibraryVersion("1.17.0", 3))
	return

SetLibraryTimeStamp("4-10-2026_01:04")

SetLibrarySettings({
	// KillWatchViewmodels = false
	// ConsoleErrors = false
	// PublicErrors = true
})

if (!("ConstantNamingConvention" in ROOT)) // make sure folding is only done once
{
	foreach (enum_table in Constants)
	{
		foreach (name, value in enum_table)
		{
			if (value == null)
				value = 0

			CONST[name] <- value
			ROOT[name] <- value
		}
	}
}

if (!("FoldedNetProps" in ROOT)) // make sure folding is only done once
{
	ROOT["FoldedNetProps"] <- "Folds all NetProps to Not require 'NetProps.'"
	foreach (name, method in ::NetProps.getclass())
	{
		// Every 'class' has this
		if (name != "IsValid")
		{
			ROOT[name] <- method.bindenv(::NetProps)
		}
	}
}

////////////// DEFINES ////////////////
//////// Slot indexs
::SLOT_PRIMARY   <- 0
::SLOT_SECONDARY <- 1
::SLOT_MELEE     <- 2
::SLOT_UTILITY   <- 3
::SLOT_BUILDING  <- 4
::SLOT_PDA       <- 5
::SLOT_PDA2      <- 6
::SLOT_COUNT     <- 7

//////// MathLib
::DEG2RAD	<- 0.0174532924
::RAD2DEG	<- 57.295779513
::FLT_MIN	<- 1.175494e-38
::FLT_MAX	<- 3.402823466e+38
::INT_MIN	<- -2147483648
::INT_MAX	<- 2147483647

//////// MASK'S
::MASK_ALL						<- (0xFFFFFFFF)
::MASK_SOLID					<- (CONTENTS_SOLID|CONTENTS_MOVEABLE|CONTENTS_WINDOW|CONTENTS_MONSTER|CONTENTS_GRATE)
::MASK_PLAYERSOLID				<- (CONTENTS_SOLID|CONTENTS_MOVEABLE|CONTENTS_PLAYERCLIP|CONTENTS_WINDOW|CONTENTS_MONSTER|CONTENTS_GRATE)
::MASK_NPCSOLID					<- (CONTENTS_SOLID|CONTENTS_MOVEABLE|CONTENTS_MONSTERCLIP|CONTENTS_WINDOW|CONTENTS_MONSTER|CONTENTS_GRATE)
::MASK_WATER					<- (CONTENTS_WATER|CONTENTS_MOVEABLE|CONTENTS_SLIME)
::MASK_OPAQUE					<- (CONTENTS_SOLID|CONTENTS_MOVEABLE|CONTENTS_OPAQUE)
::MASK_OPAQUE_AND_NPCS			<- (MASK_OPAQUE|CONTENTS_MONSTER)
::MASK_BLOCKLOS					<- (CONTENTS_SOLID|CONTENTS_MOVEABLE|CONTENTS_BLOCKLOS)
::MASK_BLOCKLOS_AND_NPCS		<- (MASK_BLOCKLOS|CONTENTS_MONSTER)
::MASK_VISIBLE					<- (MASK_OPAQUE|CONTENTS_IGNORE_NODRAW_OPAQUE)
::MASK_VISIBLE_AND_NPCS			<- (MASK_OPAQUE_AND_NPCS|CONTENTS_IGNORE_NODRAW_OPAQUE)
::MASK_SHOT						<- (CONTENTS_SOLID|CONTENTS_MOVEABLE|CONTENTS_MONSTER|CONTENTS_WINDOW|CONTENTS_DEBRIS|CONTENTS_HITBOX)
::MASK_SHOT_HULL				<- (CONTENTS_SOLID|CONTENTS_MOVEABLE|CONTENTS_MONSTER|CONTENTS_WINDOW|CONTENTS_DEBRIS|CONTENTS_GRATE)
::MASK_SHOT_PORTAL				<- (CONTENTS_SOLID|CONTENTS_MOVEABLE|CONTENTS_MONSTER|CONTENTS_WINDOW)
::MASK_SOLID_BRUSHONLY			<- (CONTENTS_SOLID|CONTENTS_MOVEABLE|CONTENTS_WINDOW|CONTENTS_GRATE)
::MASK_PLAYERSOLID_BRUSHONLY	<- (CONTENTS_SOLID|CONTENTS_MOVEABLE|CONTENTS_WINDOW|CONTENTS_PLAYERCLIP|CONTENTS_GRATE)
::MASK_NPCSOLID_BRUSHONLY		<- (CONTENTS_SOLID|CONTENTS_MOVEABLE|CONTENTS_WINDOW|CONTENTS_MONSTERCLIP|CONTENTS_GRATE)
::MASK_NPCWORLDSTATIC			<- (CONTENTS_SOLID|CONTENTS_WINDOW|CONTENTS_MONSTERCLIP|CONTENTS_GRATE)
::MASK_SPLITAREAPORTAL			<- (CONTENTS_WATER|CONTENTS_SLIME)
/// CUSTOM SOLID TYPES
::MASK_CUSTOM_PLAYERSOLID		<- 67190795 // uh, what did i use here?
::MASK_WORLD 					<- (CONTENTS_SOLID|CONTENTS_MOVEABLE|CONTENTS_WINDOW)
///////// TFCOLLISION_GROUP
::TFCOLLISION_GROUP_GRENADES							<- 20
::TFCOLLISION_GROUP_OBJECT								<- 21
::TFCOLLISION_GROUP_OBJECT_SOLIDTOPLAYERMOVEMENT		<- 22
::TFCOLLISION_GROUP_COMBATOBJECT						<- 23
::TFCOLLISION_GROUP_ROCKETS								<- 24
::TFCOLLISION_GROUP_RESPAWNROOMS						<- 25
::TFCOLLISION_GROUP_PUMPKIN_BOMB						<- 26
::TFCOLLISION_GROUP_ROCKET_BUT_NOT_WITH_OTHER_ROCKETS	<- 27

///////// Spell Index's
::TF_SPELL_UNKNOWN				<- -2
::TF_SPELL_EMPTY				<- -1
::TF_SPELL_FIREBALL 			<- 0
::TF_SPELL_BATS					<- 1
::TF_SPELL_HEAL					<- 2
::TF_SPELL_MIRV 				<- 3
::TF_SPELL_BLAST				<- 4
::TF_SPELL_STEALTH				<- 5
::TF_SPELL_TELEPORT				<- 6
::TF_SPELL_LIGHTNING			<- 7
::TF_SPELL_MINIFY				<- 8
::TF_SPELL_METEOR				<- 9
::TF_SPELL_MONOCULUS			<- 10
::TF_SPELL_SKELETON				<- 11
::TF_SPELL_BOXING_KART			<- 12
::TF_SPELL_BASE_JUMP_KART		<- 13
::TF_SPELL_OVERHEAL_KART		<- 14
::TF_SPELL_BOMB_HEAD_KART		<- 15

///////// TeamNums
::TF_TEAM_ANY 					<- -2
::TF_TEAM_INVALID 				<- -1
::TF_TEAM_UNASSIGNED 			<- 0
::TF_TEAM_SPECTATOR 			<- 1
::TF_TEAM_RED 					<- 2
::TF_TEAM_PVE_DEFENDERS 		<- TF_TEAM_RED
::TF_TEAM_BLUE 					<- 3
::TF_TEAM_PVE_INVADERS 			<- TF_TEAM_BLUE
::TF_TEAM_PVE_INVADERS_GIANTS 	<- 4
::TF_TEAM_COUNT 				<- 4
::TF_TEAM_HALLOWEEN 			<- 5

///////// Stun Flags
::TF_STUN_NONE					<- 0
::TF_STUN_MOVEMENT				<- (1<<0)
::TF_STUN_CONTROLS				<- (1<<1)
::TF_STUN_MOVEMENT_FORWARD_ONLY	<- (1<<2)
::TF_STUN_SPECIAL_SOUND			<- (1<<3)
::TF_STUN_DODGE_COOLDOWN		<- (1<<4)
::TF_STUN_NO_EFFECTS			<- (1<<5)
::TF_STUN_LOSER_STATE			<- (1<<6)
::TF_STUN_BY_TRIGGER			<- (1<<7)
::TF_STUN_BOTH					<- TF_STUN_MOVEMENT | TF_STUN_CONTROLS
::TF_STUN_SOUND					<- (1<<8)

///////// Flag Status
::FLAG_HOME						<- 0
::FLAG_PICKED_UP				<- 1
::FLAG_DROPPED					<- 2

///////// m_takedamage
::DAMAGE_NO						<- 0
::DAMAGE_EVENTS_ONLY			<- 1
::DAMAGE_YES					<- 2
::DAMAGE_AIM					<- 3

///////// Object Types
::OBJ_DISPENSER 				<- 0
::OBJ_TELEPORTER				<- 1
::OBJ_SENTRY 					<- 2
::OBJ_SAPPER 					<- 3

///////// kBonusEffect
::kBonusEffect_Crit 				<- 0
::kBonusEffect_MiniCrit				<- 1
::kBonusEffect_DoubleDonk			<- 2
::kBonusEffect_WaterBalloonSploosh	<- 3
::kBonusEffect_None					<- 4
::kBonusEffect_DragonsFury			<- 5
::kBonusEffect_Stomp				<- 6
::kBonusEffect_Count				<- 7
///////// BonusEffect // remap bonus effect to correct values
::BONUS_EFFECT_NONE 			<- 0	// default: 4
::BONUS_EFFECT_CRIT 			<- 1	// default: 0
::BONUS_EFFECT_MINICRIT			<- 2	// default: 1
::BONUS_EFFECT_DOUBLEDONK		<- 3	// default: 2
::BONUS_EFFECT_WATERBALLOON		<- 4 	// default: 3 // Unused
::BONUS_EFFECT_DRAGONS_FURY		<- 5	// default: 5
::BONUS_EFFECT_STOMP			<- 6	// default: 6
::BONUS_EFFECT_REMAP <- array(7, -1)
BONUS_EFFECT_REMAP[kBonusEffect_Crit] 					= BONUS_EFFECT_CRIT
BONUS_EFFECT_REMAP[kBonusEffect_MiniCrit] 				= BONUS_EFFECT_MINICRIT
BONUS_EFFECT_REMAP[kBonusEffect_DoubleDonk] 			= BONUS_EFFECT_DOUBLEDONK
BONUS_EFFECT_REMAP[kBonusEffect_WaterBalloonSploosh] 	= BONUS_EFFECT_WATERBALLOON
BONUS_EFFECT_REMAP[kBonusEffect_None] 					= BONUS_EFFECT_NONE
BONUS_EFFECT_REMAP[kBonusEffect_DragonsFury] 			= BONUS_EFFECT_DRAGONS_FURY
BONUS_EFFECT_REMAP[kBonusEffect_Stomp] 					= BONUS_EFFECT_STOMP

///////// TF_DEATH
::TF_DEATH_NONE					<- 0
::TF_DEATH_DOMINATION			<- (1<<0)
::TF_DEATH_ASSISTER_DOMINATION 	<- (1<<1)
::TF_DEATH_REVENGE 				<- (1<<2)
::TF_DEATH_ASSISTER_REVENGE 	<- (1<<3)
::TF_DEATH_FIRST_BLOOD 			<- (1<<4)
::TF_DEATH_FEIGN_DEATH 			<- (1<<5)
::TF_DEATH_INTERRUPTED 			<- (1<<6)
::TF_DEATH_GIBBED 				<- (1<<7)
::TF_DEATH_PURGATORY 			<- (1<<8)
::TF_DEATH_MINIBOSS 			<- (1<<9)
::TF_DEATH_AUSTRALIUM 			<- (1<<10)


////////// TF_AMMO
::TF_AMMO_UNDEFINED	<- 0
::TF_AMMO_NONE		<- 0
::TF_AMMO_DUMMY		<- 0
::TF_AMMO_PRIMARY	<- 1
::TF_AMMO_SECONDARY	<- 2
::TF_AMMO_METAL		<- 3
::TF_AMMO_GRENADES1	<- 4
::TF_AMMO_GRENADES2	<- 5
::TF_AMMO_GRENADES3	<- 6
::TF_AMMO_COUNT		<- 7

///////// Misc Weapon Index's
::TF_WEAPON_BLUTSAUGER 					<- 36
::TF_WEAPON_SOUTHERN_HOSPITALITY		<- 155
::TF_WEAPON_TRIBALMANS_SHIV				<- 171
::TF_WEAPON_VITA_SAW					<- 173
::TF_WEAPON_WARRIOR_SPIRIT 				<- 310
::TF_WEAPON_CANDY_CANE	 				<- 317
::TF_WEAPON_CLAIDHEAMH_MOR 				<- 327
::TF_WEAPON_FIST_OF_STEEL 				<- 331
::TF_WEAPON_TOMISLAV 					<- 424
::TF_WEAPON_POSTAL_PLUMBER 				<- 457
::TF_WEAPON_CONSCIENTIOUS_OBJECTOR		<- 474
::TF_WEAPON_SHORT_CIRCUT				<- 528
::TF_WEAPON_EUREKA_EFFECT				<- 589
::TF_WEAPON_UNARMED_COMBAT				<- 572
::TF_WEAPON_WANGA_PRICK 				<- 574
::TF_WEAPON_POMSON 						<- 588
::TF_WEAPON_LOLLICHOP					<- 739
::TF_WEAPON_BABYFACE					<- 772
::TF_WEAPON_NEON_ANNIHILATOR			<- 813
::TF_WEAPON_NEON_ANNIHILATOR_GENUINE	<- 834
::TF_WEAPON_BREAD_BITE	 				<- 1100
::TF_WEAPON_AIR_STRIKE	 				<- 1104
::TF_WEAPON_NECRO_SMASHER 				<- 1123

///////// TFBOT_BEHAVIOR
::TFBOT_NONE 						<- 0
::TFBOT_IGNORE_ENEMY_SCOUTS 		<- (1<<0)
::TFBOT_IGNORE_ENEMY_SOLDIERS 		<- (1<<1)
::TFBOT_IGNORE_ENEMY_PYROS 			<- (1<<2)
::TFBOT_IGNORE_ENEMY_DEMOMEN 		<- (1<<3)
::TFBOT_IGNORE_ENEMY_HEAVIES 		<- (1<<3)
::TFBOT_IGNORE_ENEMY_MEDICS 		<- (1<<4)
::TFBOT_IGNORE_ENEMY_ENGINEERS 		<- (1<<5)
::TFBOT_IGNORE_ENEMY_SNIPERS 		<- (1<<6)
::TFBOT_IGNORE_ENEMY_SPIES 			<- (1<<7)
::TFBOT_IGNORE_ENEMY_SENTRY_GUNS 	<- (1<<8)
::TFBOT_IGNORE_SCENARIO_GOALS 		<- (1<<9) // does not function

////////// Ability
::ABILITY_REMOVE 	<- -1
::ABILITY_TIME 		<- 0
::ABILITY_DAMAGE 	<- 1

///////// Ability Weapon Index's
::TF_ABILITY_BASE 				<- -1
::TF_ABILITY_HEAVY_RAGE 		<- 43
::TF_ABILITY_CHEERS 			<- 1013
::TF_ABILITY_KART 				<- 1123
::TF_ABILITY_IRON_CURTAIN		<- 298
::TF_ABILITY_BAZARR				<- 402
::TF_ABILITYS <- {
	TF_ABILITY_BASE 		= -1
	TF_ABILITY_HEAVY_RAGE	= 43
	TF_ABILITY_CHEERS		= 1013
	TF_ABILITY_KART 		= 1123
	TF_ABILITY_IRON_CURTAIN = 298
	TF_ABILITY_BAZARR		= 402
}

///////// Misc Taunt Index's
::TF_TAUNT_SECOND_RATE_SORCERY  	<- 30816
::TF_TAUNT_CHEERS 			   		<- 31412
::TF_TAUNT_UNLEASHED_RAGE	   		<- 31441

///////// Redefined DMG_ types
::DMG_USE_HITLOCATIONS 							<- DMG_AIRBOAT
::DMG_HALF_FALLOFF 								<- DMG_RADIATION
::DMG_CRITICAL 									<- DMG_ACID
::DMG_RADIUS_MAX 								<- DMG_ENERGYBEAM
::DMG_IGNITE 									<- DMG_PLASMA
::DMG_FROM_OTHER_SAPPER 						<- DMG_PLASMA
::DMG_USEDISTANCEMOD 							<- DMG_SLOWBURN
::DMG_NOCLOSEDISTANCEMOD 						<- DMG_POISON
::DMG_MELEE 									<- DMG_BLAST_SURFACE
::DMG_DONT_COUNT_DAMAGE_TOWARDS_CRIT_RATE 		<- DMG_DISSOLVE

////////// Particle Attachment
::PATTACH_ABSORIGIN 		<- 0 
::PATTACH_ABSORIGIN_FOLLOW 	<- 1
::PATTACH_CUSTOMORIGIN 		<- 2
::PATTACH_POINT 			<- 3
::PATTACH_POINT_FOLLOW 		<- 4
::PATTACH_WORLDORIGIN 		<- 5
::PATTACH_ROOTBONE_FOLLOW 	<- 6

////////// Trigger spawnflags
::SF_TRIGGER_NONE 							<- 0
::SF_TRIGGER_ALLOW_CLIENTS 					<- 1
::SF_TRIGGER_ALLOW_NPCS 					<- (1<<1)
::SF_TRIGGER_ALLOW_PUSHABLES	 			<- (1<<2)
::SF_TRIGGER_ALLOW_PHYSICS 					<- (1<<3)
::SF_TRIGGER_ONLY_PLAYER_ALLY_NPCS 			<- (1<<4)
::SF_TRIGGER_ONLY_CLIENTS_IN_VEHICLES 		<- (1<<5)
::SF_TRIGGER_ALLOW_ALL 						<- (1<<6)
::SF_TRIGGER_PUSH_ONCE 						<- (1<<7)
::SF_TRIGGER_PUSH_AFFECT_PLAYER_ON_LADDER 	<- (1<<8)
::SF_TRIGGER_ONLY_CLIENTS_OUT_OF_VEHICLES 	<- (1<<9)
::SF_TRIGGER_TOUCH_DEBRIS 					<- (1<<10)
::SF_TRIGGER_ONLY_NPCS_IN_VEHICLES 			<- (1<<11)
::SF_TRIGGER_DISALLOW_BOTS 					<- (1<<12)


////////// Custom DamageCustoms
::TF_DMG_CUSTOM_IGNORE_EVENTS 			<- (1<<7)
::TF_DMG_CUSTOM_NO_CALLBACKS 			<- (1<<8)
::TF_DMG_CUSTOM_NO_CALLBACKS_IGNORE 	<- (TF_DMG_CUSTOM_IGNORE_EVENTS|TF_DMG_CUSTOM_NO_CALLBACKS)

function ROOT::IsCustomFlags(dmg_custom)
	return dmg_custom >= (1<<7)

function ROOT::HasFCUSTOMDmgCustom(dmg_custom)
	return dmg_custom >= (1<<7)

////////// RUNES
::RUNE_NONE 				<- -1
::RUNE_STRENGTH 			<- 0
::RUNE_HASTE 				<- 1
::RUNE_REGEN 				<- 2
::RUNE_RESIST 				<- 3
::RUNE_VAMPIRE 				<- 4
::RUNE_REFLECT 				<- 5
::RUNE_PRECISION 			<- 6
::RUNE_AGILITY 				<- 7
::RUNE_KNOCKOUT 			<- 8
::RUNE_KING 				<- 9
::RUNE_PLAGUE 				<- 10
::RUNE_SUPERNOVA 			<- 11

function ROOT::GetRuneCondition(rune)
{
	switch (rune)
	{
	case RUNE_NONE:			return TF_COND_INVALID;
	case RUNE_STRENGTH:		return TF_COND_RUNE_STRENGTH;
	case RUNE_HASTE:		return TF_COND_RUNE_HASTE;
	case RUNE_REGEN:		return TF_COND_RUNE_REGEN;
	case RUNE_RESIST:		return TF_COND_RUNE_RESIST;
	case RUNE_VAMPIRE:		return TF_COND_RUNE_VAMPIRE;
	case RUNE_REFLECT:		return TF_COND_RUNE_REFLECT;
	case RUNE_PRECISION:	return TF_COND_RUNE_PRECISION;
	case RUNE_AGILITY:		return TF_COND_RUNE_AGILITY;
	case RUNE_KNOCKOUT:		return TF_COND_RUNE_KNOCKOUT;
	case RUNE_KING:			return TF_COND_RUNE_KING;
	case RUNE_PLAGUE:		return TF_COND_RUNE_PLAGUE;
	case RUNE_SUPERNOVA:	return TF_COND_RUNE_SUPERNOVA;
	}
	return TF_COND_INVALID;
}

////////// team chat colors
::TF_TEAM_COLOR_DEFAULT 	<- "\x07FBECCB"
::TF_TEAM_COLOR_RED 		<- "\x07FF3F3F"
::TF_TEAM_COLOR_BLUE 		<- "\x0799CCFF"
::TF_TEAM_COLOR_REPROG_B 	<- "\x0766AAFF"
::TF_TEAM_COLOR_SPEC 		<- "\x07CCCCCC"

////////// HealPlayer types
::T_HEAL_NONE 	<- -1
::T_HEAL_HEALER <- 0
::T_HEAL_PACK 	<- 1

///// MISC
// Should be 51 for
// 40 Bots, 8 Players, 2 Spec, 1 SourceTV
::MAX_CLIENTS	 		<- MaxClients().tointeger() 
::TF_CLASS_MAXNORMAL 	<- 9
::MAX_WEAPONS			<- 8
::DEFAULT_GRAVITY 		<- 1.0
::DEFAULT_SIZE 			<- 1.0
::DEFAULT_COLOR			<- "255 255 255"
::SOMETHINGFUCKEDUP 	<- -1
::NULL_S 				<- "null"
::TICKRATE 				<- 66
::TICK_DUR 				<- 1.0/TICKRATE
::MAX_DECAPITATIONS 	<- 4

::Host <- GetListenServerHost()

///
::PROP_MEDIGUN_CHARGE 	<- "LocalTFWeaponMedigunData.m_flChargeLevel"
::PROP_ITEM_DEF_IDX 	<- "m_AttributeManager.m_Item.m_iItemDefinitionIndex"
::PROP_CHARGE_TIME 		<- "LocalActiveTFWeaponData.m_flEffectBarRegenTime"
::PROP_PLAYER_AMMO 		<- "m_iAmmo"
::PROP_SPELL_CHARGES 	<- "m_iSpellCharges"
::PROP_SPELL_INDEX 		<- "m_iSelectedSpellIndex"
::PROP_PLAYER_STEAMID	<- "m_szNetworkIDString"


::Invincible_Conds <- [
	TF_COND_PHASE,
	TF_COND_INVULNERABLE,
	TF_COND_INVULNERABLE_WEARINGOFF,
	TF_COND_INVULNERABLE_HIDE_UNLESS_DAMAGED,
	TF_COND_INVULNERABLE_USER_BUFF,
	TF_COND_INVULNERABLE_CARD_EFFECT
]

::WearableIDXs <- {
	Primarys = [
		405, 608
	],
	Secondarys = [
		57, 131, 133,
		231, 406, 444, 
		642, 1099, 1144
	]
}

::SpellDefaults <- [
	-1,	-1, // Unknown, Empty
	2,	2, 	// Fireball, Bats
	1,	1, 	// Heal, Mirv
	2,	1, 	// Blast, Stealth
	2,	1, 	// teleport, lightning
	1,	1, 	// minify, meteor
	1,	1, 	// monoculus, skeleton
	1, 		// idk
]

function ROOT::IsConvarAllowed(cvar)
	return Convars.IsConVarOnAllowList(cvar)
function ROOT::GetCvarFloat(cvar)
	return Convars.GetFloat(cvar)
function ROOT::GetCvarBool(cvar)
	return Convars.GetBool(cvar)
function ROOT::GetCvarInt(cvar)
	return Convars.GetInt(cvar)
function ROOT::GetCvarStr(cvar)
	return Convars.GetStr(cvar)
ROOT.GetCvarString <- ROOT.GetCvarStr


///////////////////////////////////////
function CTFPlayer::PrintToHud(message)
	ClientPrint(this, HUD_PRINTCENTER, message != null ? message.tostring() : NULL_S)

function CTFPlayer::PrintToChat(message)
	ClientPrint(this, HUD_PRINTTALK, message != null ? message.tostring() : NULL_S)

function CTFPlayer::PrintToConsole(message)
	ClientPrint(this, HUD_PRINTCONSOLE, message != null ? message.tostring() : NULL_S)

function CTFPlayer::IsOnGround()
	return GetPropEntity(this, "m_hGroundEntity") != null

function CTFPlayer::GetUserName()
	return GetPropString(this, "m_szNetname")

function CTFPlayer::GetSteamID()
	return GetPropString(this, PROP_PLAYER_STEAMID)

function CTFPlayer::GetUserID()
	return GetPropIntArray(PlayerManager, "m_iUserID", entindex())

function CTFPlayer::GetHealers()
	return GetPropInt(this, "m_Shared.m_nNumHealers")

function CTFPlayer::GetAmmoByIndex(index)
	return GetPropIntArray(this, PROP_PLAYER_AMMO, index)

function CTFPlayer::GetPrimaryAmmo()
	return GetPropIntArray(this, PROP_PLAYER_AMMO, TF_AMMO_PRIMARY)

function CTFPlayer::GetSecondaryAmmo()
	return GetPropIntArray(this, PROP_PLAYER_AMMO, TF_AMMO_SECONDARY)

function CTFPlayer::GetMetal()
	return GetPropIntArray(this, PROP_PLAYER_AMMO, TF_AMMO_METAL)

function CTFPlayer::IsOverhealed()
	return (GetHealth() > GetMaxBuffedHealth())

function CTFPlayer::GetMaxBuffedHealth()
	return GetPropIntArray(PlayerManager, "m_iMaxBuffedHealth", entindex())

function CTFPlayer::EyeVector()
	return EyeAngles().Forward()

function CTFPlayer::GetFrontOffset(offset)
	return GetOrigin() + (EyeVector() * offset)

function CTFPlayer::GetEyeOffset(offset)
	return EyePosition() + (EyeVector() * offset)

function CTFPlayer::IsPressingButton(button)
	return ( GetPropInt(this, "m_nButtons") & button ) ? true : false

function CTFPlayer::GetWeaponInSlot(slot = 0)
	return EnableStringPurge(GetPropEntityArray(this, "m_hMyWeapons", slot))

function CTFPlayer::GetWeaponIDXInSlot(slot = 0)
	{ local weapon = GetWeaponInSlotNew(slot) ; return weapon ? weapon.GetIDX() : SOMETHINGFUCKEDUP }

function CTFPlayer::GetWeaponIDXInSlotNew(slot = 0)
	{ local weapon = GetWeaponInSlotNew(slot) ; return weapon ? weapon.GetIDX() : SOMETHINGFUCKEDUP }

function CTFPlayer::GetActiveWeaponIDX()
	{ local weapon = GetActiveWeapon() ; return weapon ? weapon.GetIDX() : SOMETHINGFUCKEDUP }

function CTFPlayer::GetAbilityWeaponIDX()
	{ local weapon = GetAbilityWeapon() ; return weapon ? weapon.GetIDX() : SOMETHINGFUCKEDUP }

function CTFPlayer::GetAbilityWeaponIDXs()
{
	local idxs = []
	if(GetAbilityWeapons() == null)
		return null
	foreach(weapon in GetAbilityWeapons())
		idxs.append(weapon.GetIDX())
	
	return idxs.len() == 0 ? null : idxs
}
function CTFPlayer::IsPressingButton(button = 1)
	return ( GetPropInt(this, "m_nButtons") & button ) ? true : false

function CTFPlayer::SetAmmoByIndex(index, ammo)
	SetPropIntArray(this, PROP_PLAYER_AMMO, ammo, index)

function CTFPlayer::SetPrimaryAmmo(ammo)
	SetPropIntArray(this, PROP_PLAYER_AMMO, ammo, 1)

function CTFPlayer::SetSecondaryAmmo(ammo)
	SetPropIntArray(this, PROP_PLAYER_AMMO, ammo, 2)

function CTFPlayer::SetMetal(metal)
	SetPropIntArray(this, PROP_PLAYER_AMMO, metal, 3)

function CTFPlayer::ResetHealth()
	SetHealth(GetMaxHealth())

function CTFPlayer::ResetColor()
	AcceptInput("Color", DEFAULT_COLOR, this, this)

function CTFPlayer::SetColor(color = DEFAULT_COLOR)
	AcceptInput("Color", color, this, this)

function CTFPlayer::SetScale(scale = DEFAULT_SIZE)
	SetModelScale(scale, 0)

// TODO: Add to Snippets
function CTFPlayer::IsDead()
	return !IsAlive()

function CTFPlayer::MultiplyGravity(mult)
	SetGravity(GetGravity() * mult)

function CTFPlayer::PlayerFire(action = "", input = "", delay = -1, activator = this, caller = this)
	EntFireNew(this, action, input, delay, activator, caller)
	
function CTFPlayer::RunScriptCode(input, delay = -1)
	RunWithDelay(this.compilestring(input), delay)

function CTFPlayer::GetGroundEntity()
	return GetPropEntity(this, "m_hGroundEntity")

function CTFPlayer::GetFallingVelocity()
	return GetAbsVelocity().z

// TODO: Add to Snippets
function CTFPlayer::IsDucking()
	return GetFlags() & FL_DUCKING
// TODO: Add to Snippets
CTFPlayer.IsCrouching <- CTFPlayer.IsDucking

// TODO: Add to Snippets
function CTFPlayer::IsReprogrammed()
	return false

function CTFPlayer::TakeUnblockableDamage(damage, attacker = Entities.First(), inflictor = this, weapon = this)
	TakeDamageCustom(inflictor, attacker, weapon, Vector(0, 0, 1), Vector(0, 0, 0), damage, DMG_GENERIC, TF_DMG_CUSTOM_TRIGGER_HURT)

function CTFPlayer::Suicide()
	{ SetHealth(0); TakeUnblockableDamage(INT_MAX) }

function CTFPlayer::SetCond(cond, duration = -1)
	AddCondEx(cond, duration, this)
if(!("__ORIGINAL_RemoveCondEx" in CTFPlayer))
{
	CTFPlayer.__ORIGINAL_RemoveCondEx <- CTFPlayer.RemoveCondEx
	CTFBot.__ORIGINAL_RemoveCondEx <- CTFBot.RemoveCondEx
	function CTFPlayer::RemoveCondEx(cond, ignoreDuration = true)
		__ORIGINAL_RemoveCondEx(cond, ignoreDuration)
	function CTFBot::RemoveCondEx(cond, ignoreDuration = true)
		__ORIGINAL_RemoveCondEx(cond, ignoreDuration)
}

function CTFPlayer::GetTrackedDamage()
	return GetScope(PlayerManager).m_iDamage[entindex()]

function CTFPlayer::SetTrackedDamage( damage = 0 )
	GetScope(PlayerManager).m_iDamage[entindex()] = damage

function CTFPlayer::AddTrackedDamage( damage = 0 )
{
	if ( type( GetTrackedDamage( ) ) != "integer" )
	{
		SetTrackedDamage( )
	}
	SetTrackedDamage( GetTrackedDamage( ) + damage )
}

function CTFPlayer::GetTrackedHealing()
	return GetScope(PlayerManager).m_iHealing[entindex()]

function CTFPlayer::SetTrackedHealing( healing = 0 )
	GetScope(PlayerManager).m_iHealing[entindex()] = healing

function CTFPlayer::AddTrackedHealing( healing = 0 )
{
	if ( type( GetTrackedHealing( ) ) != "integer" )
	{
		SetTrackedHealing( )
	}
	SetTrackedHealing( GetTrackedHealing( ) + healing )
}
// TODO: Add to Snippets
function CTFPlayer::GetTrackedTankDamage()
	return GetScope(PlayerManager).m_iDamageBoss[entindex()]
// TODO: Add to Snippets
function CTFPlayer::SetTrackedTankDamage( healing = 0 )
	GetScope(PlayerManager).m_iDamageBoss[entindex()] = healing
// TODO: Add to Snippets
function CTFPlayer::AddTrackedTankDamage( damage = 0 )
{
	if ( type( GetTrackedTankDamage( ) ) != "integer" )
	{
		SetTrackedTankDamage( )
	}
	SetTrackedTankDamage( GetTrackedTankDamage( ) + damage )
}

function CTFPlayer::GetCurrentRune()
{
	if(!IsCarryingRune())
		return RUNE_NONE
	if(InCond(TF_COND_RUNE_STRENGTH))
		return RUNE_STRENGTH
	if(InCond(TF_COND_RUNE_HASTE))
		return RUNE_HASTE
	if(InCond(TF_COND_RUNE_REGEN))
		return RUNE_REGEN
	if(InCond(TF_COND_RUNE_RESIST ))
		return RUNE_RESIST
	if(InCond(TF_COND_RUNE_VAMPIRE ))
		return RUNE_VAMPIRE
	if(InCond(TF_COND_RUNE_REFLECT ))
		return RUNE_REFLECT
	if(InCond(TF_COND_RUNE_PRECISION ))
		return RUNE_PRECISION
	if(InCond(TF_COND_RUNE_AGILITY ))
		return RUNE_AGILITY
	if(InCond(TF_COND_RUNE_KNOCKOUT ))
		return RUNE_KNOCKOUT
	if(InCond(TF_COND_RUNE_KING ))
		return RUNE_KING
	if(InCond(TF_COND_RUNE_PLAGUE ))
		return RUNE_PLAGUE
	if(InCond(TF_COND_RUNE_SUPERNOVA ))
		return RUNE_SUPERNOVA
	return RUNE_NONE
}

function CTFPlayer::GetRuneResistance()
{
	if( GetCurrentRune() == RUNE_RESIST )
		return 0.5
	if( GetCurrentRune() == RUNE_VAMPIRE )
		return 0.75
	else return 1.0
}

function CTFPlayer::IsValidReprogramTarget()
{
	if(!IsBot())
		return false
	if(HasBotAttribute(USE_BOSS_HEALTH_BAR))
		return false
	if(HasBotTag("HardWired"))
		return false
	return true
}

function CTFPlayer::IsBot()
	return false

function CTFPlayer::SetFoodItemCharge(charge)
	SetPropFloatArray(this, "m_Shared.m_flItemChargeMeter", charge, 1)
CTFPlayer.SetJetpackCharge <- CTFPlayer.SetFoodItemCharge

function CTFPlayer::AddThrowableCharge(charge)
{
	local secondary = GetWeaponInSlotNew(SLOT_SECONDARY)
	local def_time = secondary.GetDefaultChargeTime()
	if(def_time == -1) return;

	def_time *= secondary.GetAttribute("effect bar recharge rate increased", 1)
	if(secondary.GetClassname().slice(10) == "jar_gas") def_time *= secondary.GetAttribute("mult_item_meter_charge_rate", 1)
	local percent_time = def_time * (charge.tofloat()/100)

	secondary.SetChargeTime(secondary.GetChargeTime() - percent_time)
}

function CTFPlayer::SetThrowableCharge(charge)
{
	local secondary = GetWeaponInSlotNew(SLOT_SECONDARY)
	local def_time = secondary.GetDefaultChargeTime()
	if(def_time == -1) return;

	def_time *= secondary.GetAttribute("effect bar recharge rate increased", 1)
	if(secondary.GetClassname().slice(10) == "jar_gas") def_time *= secondary.GetAttribute("mult_item_meter_charge_rate", 1)
	local percent_time = def_time * ((100 - charge.tofloat())/100)

	secondary.SetChargeTime(Time() + percent_time)
}

function CTFPlayer::SetThrowableAmmo(ammo)
	SetPropIntArray(this, "m_iAmmo", ammo, TF_AMMO_GRENADES2)

function CTFPlayer::IsUberDraining() {
	foreach (weapon in GetAllWeapons()) { 
		if(HasProp(weapon, "m_bChargeRelease"))
			return GetPropBool(weapon, "m_bChargeRelease")
	}
	return false
}

function CTFPlayer::GetAbilityWeapon() {
	foreach (weapon in GetAllWeapons()) { 
		if (TF_ABILITYS.values().find(weapon.GetIDX()) != null)
			return weapon
	}
	return null
}

function CTFPlayer::GetAbilityWeapons() {
	local weapons = []
	foreach (weapon in GetAllWeapons()) {
		if (TF_ABILITYS.values().find(weapon.GetIDX()) != null)
			weapons.append(weapon)
	}
	return weapons.len() == 0 ? null : weapons
}

function CTFPlayer::ForceTaunt(taunt_id)
{
	local weapon = CreateByClassname("tf_weapon_bat")
	local active_weapon = GetActiveWeapon()
	StopTaunt(true) // both are needed to fully clear the taunt
	RemoveCond(TF_COND_TAUNTING)
	weapon.DispatchSpawn()
	SetPropInt(weapon, PROP_ITEM_DEF_IDX, taunt_id)
	SetPropBool(weapon, "m_AttributeManager.m_Item.m_bInitialized", true)
	EnableStringPurge(weapon)
	SetPropEntity(this, "m_hActiveWeapon", weapon)
	SetPropInt(this, "m_iFOV", 0) // fix sniper rifles
	HandleTauntCommand(0)
	SetPropEntity(this, "m_hActiveWeapon", active_weapon)
	weapon.Kill()
}

function CTFPlayer::GetMyWeaponsArray()
{
	local MyWeapons = array(MAX_WEAPONS)
	for(local i = 0; i < MAX_WEAPONS; i++) { MyWeapons[i] = GetWeaponInSlot(i) }
	return MyWeapons
}

function CTFPlayer::GetWeaponInSlotNew(slot = 0)
{
	if(!IsValid() || !this)
		return null

	local targetArray = (slot == SLOT_PRIMARY) ? WearableIDXs.Primarys : ((slot == SLOT_SECONDARY) ? WearableIDXs.Secondarys : null)

	for (local child = targetArray ? FirstMoveChild() : null; child; child = child.NextMovePeer())
	{
		EnableStringPurge(child)

		if (!startswith(child.GetClassname(), "tf_wearable"))
			continue

		if (IsInArray(child.GetIDX(), targetArray))
			return child
	}

	local weapon = GetWeaponInSlot(slot)
	if (weapon)
	{
		local weaponSlot = weapon.GetSlot()
		if (GetPlayerClass() == TF_CLASS_ENGINEER && weapon.GetClassname() == "tf_weapon_spellbook")
			weaponSlot = SLOT_PDA2

		if (weaponSlot == slot)
			return EnableStringPurge(weapon)
	}

	for(local i = 0; i < MAX_WEAPONS; i++) 
	{ 
		if (i == slot) continue
		weapon = GetWeaponInSlot(i)
		if( weapon == null ) continue

		local weaponSlot = weapon.GetSlot()
		if (GetPlayerClass() == TF_CLASS_ENGINEER && weapon.GetClassname() == "tf_weapon_spellbook")
			weaponSlot = SLOT_PDA2
		
		if (weaponSlot == slot)
			return EnableStringPurge(weapon)
	}

	return null
}

function CTFPlayer::GetAllWeapons()
{
	local list = []
	for (local i = 0; i < MAX_WEAPONS; i++)
	{
		list.append(GetWeaponInSlotNew(i))
	}
	return list.filter(@(index, value) value != null)
}

function CTFPlayer::GetSpellBook()
{
	foreach (weapon in GetAllWeapons())
	{
		if ( weapon.GetClassname() == "tf_weapon_spellbook" )
			return weapon
	}
	return null
}

function CTFPlayer::InRespawnRoom(any = false)
{
	foreach (respawnroom in GetAllEntitiesByClassname("func_respawnroom"))
	{
		if(!any) { if(respawnroom.GetTeam() != GetTeam()) continue }

		respawnroom.RemoveSolidFlags(FSOLID_NOT_SOLID)
		respawnroom.SetCollisionGroup(0)
		local trace =
		{
			start =       EyePosition()
			end =         EyePosition()
			hullmin =     GetPlayerMins()
			hullmax =     GetPlayerMaxs()
			mask =        CONTENTS_SOLID
		}
		TraceHull(trace)
		respawnroom.AddSolidFlags(FSOLID_NOT_SOLID)
		respawnroom.SetCollisionGroup(TFCOLLISION_GROUP_RESPAWNROOMS)

		if(trace.hit && trace.enthit == respawnroom) return true
	}
	return false
}

function CTFPlayer::InAnyRespawnRoom()
{
	foreach (respawnroom in GetAllEntitiesByClassname("func_respawnroom"))
	{
		respawnroom.RemoveSolidFlags(FSOLID_NOT_SOLID)
		respawnroom.SetCollisionGroup(0)
		local trace =
		{
			start =       EyePosition()
			end =         EyePosition()
			hullmin =     GetPlayerMins()
			hullmax =     GetPlayerMaxs()
			mask =        CONTENTS_SOLID
		}
		TraceHull(trace)
		respawnroom.AddSolidFlags(FSOLID_NOT_SOLID)
		respawnroom.SetCollisionGroup(TFCOLLISION_GROUP_RESPAWNROOMS)

		if(trace.hit && trace.enthit == respawnroom) return true
	}
	return false
}

function CTFPlayer::GetEveryHumanWithin(range, include_me = false)
	return include_me ? GetAllPlayers(TF_TEAM_PVE_DEFENDERS, range ? [GetOrigin(), range] : range, false) : GetAllPlayers(TF_TEAM_PVE_DEFENDERS, [GetOrigin(), range], false).filter(@(index, value) value != this)

function CTFPlayer::GetEveryPlayerWithin(range, include_me = false)
	return include_me ? GetAllPlayers(false, range ? [GetOrigin(), range] : range, false) : GetAllPlayers(false, range ? [GetOrigin(), range] : range, false).filter(@(index, value) value != this)

function CTFPlayer::GetEveryTankWithin(range)
{
	local list = []
	for (local tank; tank = FindByClassnameWithin(tank, "tank", GetOrigin(), range); )
	{
		if(tank.GetTeam() == TF_TEAM_PVE_INVADERS) list.append(tank)
	}
	return list
}
function CTFPlayer::GetEveryBotWithin(range)
	return GetAllPlayers(TF_TEAM_PVE_INVADERS, [GetOrigin(), range], false).extend(GetAllPlayers(TF_TEAM_PVE_INVADERS_GIANTS, [GetOrigin(), range], false))

function CTFPlayer::DamageEveryTankWithin(range, damage)
{
	for (local tank; tank = FindByClassnameWithin(tank, "tank", GetOrigin(), range); )
	{
		if(tank.GetTeam() == TF_TEAM_PVE_INVADERS) tank.TakeDamage(damage, 0, this)
	}
}
function CTFPlayer::DamageEveryBotWithin(range, damage)
{
	foreach(bot in GetEveryBotWithin(range))
	{
		bot.TakeDamage(damage, 0, this)
	}
}

function CTFPlayer::RemoveStun()
{
	SetPropInt(this, "m_Shared.m_flMovementStunTime", 0)
	SetPropInt(this, "m_Shared.m_iStunFlags", 0)
	SetPropInt(this, "m_Shared.m_hStunner", -1)
	SetPropInt(this, "m_Shared.m_iMovementStunAmount", 0)
	SetPropInt(this, "m_Shared.m_iMovementStunParity", 0)
	RemoveCondEx(TF_COND_STUNNED, true)
}

function CTFPlayer::IsInvincible()
{
	foreach(Condition in Invincible_Conds)
	{
		if(InCond(Condition)) return true
	}
	return false
}

function CTFPlayer::IsEventJudge()
{
	return IsInArray(GetPropString(this, PROP_PLAYER_STEAMID), [
		// Names as of searching [2/8/26] && [2/14/26] && [2/24/26] && [3/1/26]
		"[U:1:279359900]"	// Automaton Trooper
		"[U:1:28266263]"	// Braindawg
		"[U:1:197828022]"	// Bazooks
		"[U:1:66915592]"	// Claudz
		"[U:1:205635676]"	// pametome
		"[U:1:295552082]"	// Flurbury
		"[U:1:55891323]"	// skg
		"[U:1:36810370]"	// Package O' Lies
		"[U:1:919398610]"	// Kat [uber]
		"[U:1:167092512]"	// OrangeGlazer
		"[U:1:99590462]"	// UltimentM
		"[U:1:419501997]"	// Pasta
		"[U:1:179345871]"	// Kurante
		"[U:1:1086491858]"	// Sergeant Table
		"[U:1:73335243]"	// Magdalene, The Roaring
		"[U:1:1585968943]"	// Skylamama
		"[U:1:1117234744]"	// wbend yout
		"[U:1:1404800684]"	// unsaken
		"[U:1:56932872]"	// Yoovy
		"[U:1:157264909]"	// M1
		"[U:1:879075697]"	// spruce
		"[U:1:141959568]"	// Sleeeepykai
		"[U:1:285143208]"	// Skin King
		"[U:1:1077797916]"	// wooper (real)
		"[U:1:63932876]"	// PDA Expert
		"[U:1:1215461762]"	// NongLyney
		"[U:1:401162912]"	// Conga Dispenser
		"[U:1:83176584]"	// Mince
		"[U:1:112896383]"	// Lemonée
		"[U:1:1075756146]"	// GET ANGRY !!! 	//furuka
		"[U:1:312592019]"	// the fat			//T_TFBot_Eel_New_Jersey
		"[U:1:1104797071]"	// Katsu
	])
}

		//"[U:1:294258124]"	// Gregarious
		//"[U:1:889968517]"	// Ralsei

function CTFPlayer::IsAdmin()
{
	return IsEventJudge() || IsInArray(GetPropString(this, PROP_PLAYER_STEAMID), [
		"[U:1:969530867]"	// Fatcat
		"[U:1:101345257]"	// ShadowBolt
		"[U:1:1768280682]"	// MiirioKing
	])
}

function CTFPlayer::HasWeapon(index = -1)
{
	foreach(weapon in GetAllWeapons())
		if(weapon.GetIDX() == index) return true
	return false
}
function CTFPlayer::HasWeaponClassname(classname = NULL_S)
{
	foreach (weapon in GetAllWeapons())
		if(weapon.GetClassname() == classname) return true
	return false
}

function CTFPlayer::GetWeapon(index = -1)
{
	foreach(weapon in GetAllWeapons())
		if(weapon.GetIDX() == index) return weapon
	return null
}
function CTFPlayer::GetWeaponClassname(classname = NULL_S)
{
	foreach (weapon in GetAllWeapons())
		if(weapon.GetClassname() == classname) return weapon
	return null
}
function CTFPlayer::ResetPrimaryAmmo()
	SetPrimaryAmmo(GetMaximumPrimaryAmmo())

function CTFPlayer::ResetSecondaryAmmo()
	SetSecondaryAmmo(GetMaximumSecondaryAmmo())

function CTFPlayer::ResetMetal()
	SetMetal(GetMaximumMetal())

function CTFPlayer::RegenerateNoHP(ammo)
{
	local hp = GetHealth()
	Regenerate(ammo)
	SetHealth(hp)
}

if(!("__ORIGINAL_Regenerate" in CTFPlayer))
{
	CTFPlayer.__ORIGINAL_Regenerate <- CTFPlayer.Regenerate
	function CTFPlayer::Regenerate(ammo, hp = true)
	{
		if(hp)
			__ORIGINAL_Regenerate(ammo)
		else
			RegenerateNoHP(ammo)
	}
}


function CTFPlayer::GetMaximumPrimaryAmmo()
{
	local ammo = 32
	local ammo_mult = 1
	local round = false

	local weapon = GetWeaponInSlotNew(SLOT_PRIMARY)
	if(!weapon)
		return ammo
	// Assert(weapon, "CTFPlayer::GetMaximumPrimaryAmmo: Got a NULL weapon")

	local orig_name = weapon.GetClassname()
	local name = weapon.GetClassname()
	if(startswith(orig_name, "tf_weapon_"))
		name = orig_name.slice(10)

	switch (name)
	{
		case "minigun":
		case "flamethrower":
		case "rocketlauncher_fireball":
		{
			ammo = 200
			break
		}
		case "crossbow":
		case "syringegun_medic":
		{
			ammo = 150
			round = true
			break
		}
		case "compound_bow":
		case "sniperrifle":
		case "sniperrifle_decap":
		case "sniperrifle_classic":
		{
			ammo = 25
			break
		}
		case "revolver":
		{
			ammo = 24
			break
		}
		case "rocketlauncher":
		case "rocketlauncher_airstrike":
		case "rocketlauncher_directhit":
		{
			ammo = 20
			break
		}
		case "cannon":
		case "grenadelauncher":
		{
			ammo = 16
			break
		}
		case "drg_pomson":
		case "particle_cannon":
		case "parachute_primary":
		case "tf_wearable":
		{
			return ammo
		}
	}
	foreach (weapon in GetAllWeapons())
	{
		if(weapon.GetAttribute("provide on active", 0) == 1)
		{
			if(GetActiveWeapon() == weapon)
			{
				ammo_mult *= weapon.GetAttribute("hidden primary max ammo bonus", 1)
				ammo_mult *= weapon.GetAttribute("maxammo primary increased", 1)
				ammo_mult *= weapon.GetAttribute("maxammo primary reduced", 1)
			}
		}
		else
		{
			ammo_mult *= weapon.GetAttribute("hidden primary max ammo bonus", 1)
			ammo_mult *= weapon.GetAttribute("maxammo primary increased", 1)
			ammo_mult *= weapon.GetAttribute("maxammo primary reduced", 1)
		}
	}
	if(IsCarryingRune() && InCond(TF_COND_RUNE_HASTE))	
		ammo_mult *= 2
	
	return (round == true ? ceil(ammo * ammo_mult) : (ammo * ammo_mult))
}

function CTFPlayer::GetMaximumSecondaryAmmo()
{
	local ammo = 32
	local ammo_mult = 1
	local round = false

	local weapon = GetWeaponInSlotNew(SLOT_SECONDARY)

	if(!weapon)
		return ammo

	local orig_name = weapon.GetClassname()
	local name = orig_name
	if(startswith(orig_name, "tf_weapon_"))
		name = orig_name.slice(10)

	switch (name)
	{
		case "pistol":
		{
			ammo = 200
			break
		}
		case "smg":
		case "charged_smg":
		{
			ammo = 75
			break
		}
		case "handgun_scout_secondary":
		case "pistol_scout":
		{
			ammo = 36
			break
		}
		case "pipebomblauncher":
		case "revolver":
		{
			ammo = 24
			break
		}

		case "tf_wearable":
		case "cleaver":
		case "lunchbox_drink":
		case "jar_milk":
		case "buff_item":
		case "raygun":
		case "jar_gas":
		case "flaregun_revenge":
		case "rocketpack":
		case "tf_wearable_demoshield":
		case "lunchbox":
		case "mechanical_arm":
		case "laser_pointer":
		case "medigun":
		case "tf_wearable_razorback":
		case "jar":
		{
			return 0
		}
		// yes... sapper is called this and not tf_weapon_sapper
		case "builder":
		{
			ammo =  GetMaximumPrimaryAmmo()
			break
		}
	}
	foreach (weapon in GetAllWeapons())
	{
		if(weapon.GetAttribute("provide on active", 0) == 1)
		{
			if(GetActiveWeapon() == weapon)
			{
				ammo_mult *= weapon.GetAttribute("hidden secondary max ammo penalty", 1)
				ammo_mult *= weapon.GetAttribute("maxammo secondary increased", 1)
				ammo_mult *= weapon.GetAttribute("maxammo secondary reduced", 1)
			}
		}
		else
		{
			ammo_mult *= weapon.GetAttribute("hidden secondary max ammo penalty", 1)
			ammo_mult *= weapon.GetAttribute("maxammo secondary increased", 1)
			ammo_mult *= weapon.GetAttribute("maxammo secondary reduced", 1)
		}
	}
	if(IsCarryingRune() && InCond(TF_COND_RUNE_HASTE))	
		ammo_mult *= 2
	return (round ? ceil(ammo * ammo_mult) : (ammo * ammo_mult))
}

function CTFPlayer::GetMaximumMetal()
{
	if(!this||!IsValid())
		return 0
	local metal = 200
	local metal_mult = 1
	foreach (weapon in GetAllWeapons())
	{
		if(weapon.HasAttribute("provide on active", 0) == 1)
		{
			if(GetActiveWeapon() == weapon)
			{
				metal_mult *= weapon.GetAttribute("maxammo metal increased", 1)
				metal_mult *= weapon.GetAttribute("maxammo metal reduced", 1)
			}
		}
		else
		{
			metal_mult *= weapon.GetAttribute("maxammo metal increased", 1)
			metal_mult *= weapon.GetAttribute("maxammo metal reduced", 1)
		}
	}
	if(IsCarryingRune() && InCond(TF_COND_RUNE_HASTE))	
		metal_mult *= 2
	return metal * metal_mult
}

function CTFPlayer::ResetAmmo()
{
	ResetPrimaryAmmo()
	ResetSecondaryAmmo()
	ResetMetal()
}

function CTFPlayer::InMultiCond(conds)
{
	foreach(cond in conds)
		if(InCond(cond))
			return true
	
	return false
}

function CTFPlayer::ForceChangeClass(index, respawn = false)
{
	SetPlayerClass(index)
	SetPropInt(this, "m_Shared.m_iDesiredPlayerClass", index)
	if(respawn)
		ForceRegenerateAndRespawn()
	else
		Regenerate(true)
}
// TODO: Add to Snippets
function CTFPlayer::GetPlayerClassName()
{
	switch (GetPlayerClass())
	{
	case TF_CLASS_SCOUT:			return "Scout"
	case TF_CLASS_SOLDIER: 			return "Soldier"
	case TF_CLASS_PYRO: 			return "Pyro"
	case TF_CLASS_DEMOMAN: 			return "Demoman"
	case TF_CLASS_HEAVYWEAPONS: 	return "Heavy"
	case TF_CLASS_ENGINEER: 		return "Engineer"
	case TF_CLASS_MEDIC: 			return "Medic"
	case TF_CLASS_SNIPER: 			return "Sniper"
	case TF_CLASS_SPY: 				return "Spy"
	default:						return "Unknown!"
	}
}

// function CTFPlayer::ForceChangeClass

function CTFPlayer::ToggleGlow(bool)
	SetPropBool(this, "m_bGlowEnabled", bool)

function CTFPlayer::GetLanguage()
	return GetClientConVar("cl_language", entindex())
	
function CTFPlayer::GetTranslatedString(string)
{
	local lang = GetLanguage()
	local translated_string = ""
	//hmm, mising all translations?
	if(!("TRANSLATION_TABLE" in ROOT))
		return " MISSING TRANSLATION TABLE!!!!!"

	// we dont have this language translated yet, or its missing
	// default to english
	if(!(lang in TRANSLATION_TABLE))
	{
		lang = "english"
		PrintToHud("Please contact The Fatcat to assist with adding translations. (Use !translate)")
	}
	
	local translation_table = TRANSLATION_TABLE[lang]

	// so... we dont have this string yet, or is misspelled, idk
	if(!(string in translation_table))
		return format(" \x01MISSING TRANSLATION STRING FOR \x01\"\x03%s\x01\"", string.tostring())
	
	return translation_table[string]
}

function CTFPlayer::IHTranslateToChat(name, description)
	TranslateToChat("IH_TRANSLATE_ITEM", "%T" + name, "%T" + description)

function CTFPlayer::IHTranslateToChat2(item)
	TranslateToChat("IH_TRANSLATE_ITEM", "%T" + item+"_NAME", "%T" + item+"_DESC")

// only half stolen from Potato's MGE vscript
function CTFPlayer::GetTranslatedAndFormattedString(...)
{
	local args = vargv
	local localized_string = args[0]
	local format_args = args.slice(1).apply(@(a) a.tostring())

	// check if any of our formated strings need to be translated
	for (local i = 0; i < format_args.len(); i++)
	{
		if (startswith(format_args[i], "%T"))
			format_args[i] = GetTranslatedString(format_args[i].slice(2))
	}

	local str = GetTranslatedString(localized_string)

	if (args.len() > 1)
		str = format.acall([this, str].extend(format_args))

	if (!endswith(str, "\x01"))
		str = format("%s\x01", str)

	if (!startswith(str, "\x01"))
		str = format("\x01%s", str)
	
	return str
}

function CTFPlayer::TranslateToChat(...)
	PrintToChat(GetTranslatedAndFormattedString.acall([this].extend(vargv)))

function CTFPlayer::TranslateToHud(...)
	PrintToHud(GetTranslatedAndFormattedString.acall([this].extend(vargv)))

function CTFPlayer::SetAbilityTime(time)
	{local weapon = GetAbilityWeapon() ; if(weapon) {weapon.SetAbilityTime(time)}}

function CTFPlayer::AddAbilityTime(time)
	{local weapon = GetAbilityWeapon() ; if(weapon) {weapon.AddAbilityTime(time)}}

function CTFPlayer::TeamFortress_SetSpeed()
{
	if(InCond(TF_COND_HALLOWEEN_SPEED_BOOST))
	{
		local duration = GetCondDuration(TF_COND_HALLOWEEN_SPEED_BOOST)
		__ORIGINAL_RemoveCondEx(TF_COND_HALLOWEEN_SPEED_BOOST, true)
		SetCond(TF_COND_HALLOWEEN_SPEED_BOOST, duration)
	}
	else
	{
		SetCond(TF_COND_HALLOWEEN_SPEED_BOOST)
		__ORIGINAL_RemoveCondEx(TF_COND_HALLOWEEN_SPEED_BOOST, true)
	}
}

function ROOT::GetGameText()
	return FindByName(null, "GlobalGameText") ? FindByName(null, "GlobalGameText") : SpawnEntityFromTable("game_text", {targetname = "GlobalGameText", holdtime = 0.5})

function CTFPlayer::DisplayHudText(msg = "", clr = false, pos = false, holdtime = false)
{
	local text = GetGameText()
	local GT_Scope = GetScope(text)

	if(!("Last_Message" in GT_Scope))
		GT_Scope.Last_Message <- ""


	if(GT_Scope.Last_Message != msg) text.KeyValueFromString("message", msg)
	if(clr) text.KeyValueFromString("color", clr)
	if(pos)
	{
		text.KeyValueFromFloat("x", pos[0])
		text.KeyValueFromFloat("y", pos[1])
	}
	if(holdtime) text.KeyValueFromFloat("holdtime", holdtime)
	
	GT_Scope.Last_Message <- msg

	text.AcceptInput("Display", "", this, this)

	PurgeString(msg)
}

function CTFPlayer::CalculateEHP()
{
	local HP = GetHealth()

	local BlastMult = 1.0
	local BulletMult = 1.0
	local FireMult = 1.0
	local AllMult = 1.0
	local RangedMult = 1.0
	local MeleeMult = 1.0
	local CritMult = 1.0
	local CondMult = 1.0
	foreach( weapon in GetAllWeapons() )
	{
		if( weapon.GetAttribute("provide on active", 0) )
		{
			if( GetActiveWeapon() != weapon )
				continue
		}

		BlastMult *= weapon.GetAttribute("dmg taken from blast increased",1)
		BlastMult *= weapon.GetAttribute("dmg taken from blast reduced",1)

		BulletMult *= weapon.GetAttribute("dmg taken from bullets increased",1)
		BulletMult *= weapon.GetAttribute("dmg taken from bullets reduced",1)
		BulletMult *= weapon.GetAttribute("CARD: dmg taken from bullets reduced",1)
		BulletMult *= weapon.GetAttribute("SET BONUS: dmg taken from bullets increased",1)
				
		FireMult *= weapon.GetAttribute("dmg taken from fire increased",1)
		FireMult *= weapon.GetAttribute("dmg taken from fire reduced",1)
		FireMult *= weapon.GetAttribute("SET BONUS: dmg taken from fire reduced set bonus",1)

		AllMult *= weapon.GetAttribute("dmg taken increased",1)

		MeleeMult *= weapon.GetAttribute("mult dmgtaken from melee",1)

		CritMult *= weapon.GetAttribute("dmg taken from crit reduced",1)
		CritMult *= weapon.GetAttribute("dmg taken from crit increased",1)
		CritMult *= weapon.GetAttribute("SET BONUS: dmg taken from crit reduced set bonus",1)

		if( GetActiveWeapon() == weapon )
		{
			FireMult *= weapon.GetAttribute("dmg taken from fire reduced on active",1)

			MeleeMult *= weapon.GetAttribute("dmg from melee increased",1)

			RangedMult *= weapon.GetAttribute("dmg from ranged reduced",1)

			AllMult *= weapon.GetAttribute("mult_dmgtaken_active",1)
		}
	}
	
	BlastMult *= GetCustomAttribute("dmg taken from blast increased",1)
	BlastMult *= GetCustomAttribute("dmg taken from blast reduced",1)

	BulletMult *= GetCustomAttribute("dmg taken from bullets increased",1)
	BulletMult *= GetCustomAttribute("dmg taken from bullets reduced",1)
	BulletMult *= GetCustomAttribute("CARD: dmg taken from bullets reduced",1)
	BulletMult *= GetCustomAttribute("SET BONUS: dmg taken from bullets increased",1)
				
	FireMult *= GetCustomAttribute("dmg taken from fire increased",1)
	FireMult *= GetCustomAttribute("dmg taken from fire reduced",1)
	FireMult *= GetCustomAttribute("SET BONUS: dmg taken from fire reduced set bonus",1)

	AllMult *= GetCustomAttribute("dmg taken increased",1)

	MeleeMult *= GetCustomAttribute("mult dmgtaken from melee",1)

	CritMult *= GetCustomAttribute("dmg taken from crit reduced",1)
	CritMult *= GetCustomAttribute("dmg taken from crit increased",1)
	CritMult *= GetCustomAttribute("SET BONUS: dmg taken from crit reduced set bonus",1)
	
	if(InMultiCond([TF_COND_MEDIGUN_UBER_FIRE_RESIST, TF_COND_MEDIGUN_SMALL_FIRE_RESIST]))
		FireMult = 0
	if(InMultiCond([TF_COND_MEDIGUN_UBER_BULLET_RESIST, TF_COND_MEDIGUN_SMALL_BULLET_RESIST]))
		BulletMult = 0
	if(InMultiCond([TF_COND_MEDIGUN_UBER_BLAST_RESIST, TF_COND_MEDIGUN_SMALL_BLAST_RESIST]))
		BlastMult = 0

	CondMult *= GetRuneResistance()

	if(InCond(TF_COND_DEFENSEBUFF_HIGH))	//likely unused now
		CondMult *= 0.25
	else if(InMultiCond([TF_COND_DEFENSEBUFF, TF_COND_DEFENSEBUFF_NO_CRIT_BLOCK]))
		CondMult *= 0.65
	
	if(InCond(TF_COND_STEALTHED))
		CondMult *= GetCvarFloat("tf_stealth_damage_reduction")
	if(IsMinicritDebuffed())
		CondMult *= (1.0 + (0.35 * CritMult))

	// BulletMult = 	MATH.Max(0.00000000000000001, BulletMult)
	// BlastMult = 	MATH.Max(0.00000000000000001, BlastMult)
	// FireMult = 		MATH.Max(0.00000000000000001, FireMult)
	// RangedMult = 	MATH.Max(0.00000000000000001, RangedMult)
	// MeleeMult = 	MATH.Max(0.00000000000000001, MeleeMult)

	// CondMult = 		MATH.Max(0.00000000000000001, CondMult)
	AllMult = 		/* MATH.Max(0.00000000000000001,  */AllMult/* ) */ * CondMult

	local InfHP = "\x0700bbffInfinite"

	local BulletHP 	= BulletMult 	<= 0 ? InfHP : format("%.0f", ceil(HP/BulletMult/AllMult))
	local BlastHP 	= BlastMult 	<= 0 ? InfHP : format("%.0f", ceil(HP/BlastMult/AllMult))
	local FireHP 	= FireMult 		<= 0 ? InfHP : format("%.0f", ceil(HP/FireMult/AllMult))
	local MeleeHP 	= MeleeMult 	<= 0 ? InfHP : format("%.0f", ceil(HP/MeleeMult/AllMult))
	local RangedHP 	= RangedMult 	<= 0 ? InfHP : format("%.0f", ceil(HP/RangedMult/AllMult))
	local AllHP 	= AllMult 		<= 0 ? InfHP : format("%.0f", ceil(HP/AllMult))
	
	local formatstring 	=  "\x0800FF00B0 ** ( Counts Most Active Conditions ) **\n"
	formatstring 		+= "\x07FFFF00[Effective HP]: \x01\n"
	formatstring 		+= "\x03Bullet: \x04%s \x01| \x03Blast: \x04%s \x01| \x03Fire: \x04%s\n"
	formatstring 		+= "\x03Melee: \x04%s \x01| \x03Ranged: \x04%s\n"
	formatstring 		=  format(formatstring, BulletHP, BlastHP, FireHP, MeleeHP, RangedHP)

	PrintToChat(formatstring)

	if(AllMult != 1.00)
	{	
		if(AllMult == 0.00) {
			PrintToChat("\x07FFFF00* \x01You are currently \x07FFFF00unkillable \x01due to a \x0700bbffUniversal Damage Resistance\x01 of \x04100%")
		}
		else 
			PrintToChat(format("\x07FFFF00* \x01Your current base health \x04%i\x01 is effectively \x04%.0f\x01 due to a "+(AllMult <= 1.0 ? "\x0700bbffUniversal Damage Resistance" : "\x07ff4545Universal Damage Vulnerability")+"\x01 of \x04%.2f%%.", HP, ceil(HP/AllMult), fabs(100-(AllMult*100.0))) )

		/* else if(AllMult <= 1.0) {
			PrintToChat(format("\x07FFFF00* \x01Your current base health \x04%i\x01 is effectively \x04%.0f\x01 due to a \x0700bbffUniversal Damage Resistance\x01 of \x04%.2f%%.", HP, ceil(HP/AllMult), fabs(100-(AllMult*100.0))) )
		}
		else {
			PrintToChat(format("\x07FFFF00* \x01Your current base health \x04%i\x01 is effectively \x04%.0f\x01 due to a \x07ff4545Universal Damage Vulnerability\x01 of \x04%.2f%%.", HP, ceil(HP/AllMult), fabs(100-(AllMult*100.0))) )
		} */
	}
	else if(MeleeMult <= 0 && RangedMult <= 0) {
		PrintToChat("\x07FFFF00* \x01You are currently \x07FFFF00unkillable \x01due to a combined \x0700bbffRanged + Melee Resistance\x01 of \x04100%")
	}
}
// TODO: Add to Snippets
function CTFPlayer::SwitchWeaponSlot( slot )
	Weapon_Switch(GetWeaponInSlot(slot))
// TODO: Add to Snippets
function CTFPlayer::SwitchWeapon(wep)
	Weapon_Switch(wep)
// TODO: Add to Snippets
function CTFPlayer::IsMinicritDebuffed()
	return !InCond(TF_COND_DEFENSEBUFF) && InMultiCond([TF_COND_URINE, TF_COND_MARKEDFORDEATH, TF_COND_MARKEDFORDEATH_SILENT])

function CTFPlayer::IsMinicritBuffed()
	return InMultiCond([TF_COND_OFFENSEBUFF, TF_COND_ENERGY_BUFF, TF_COND_NOHEALINGDAMAGEBUFF, TF_COND_MINICRITBOOSTED_ON_KILL])

/* function CTFPlayer::CopyWeapon( 
	weapon, idx_over = false, override_slot = false, copy_attrib = false, duration = false, regenerate = false, reset_ammo = false, switch_slot = false, attributes = {})
{
	local scope = GetScope(this)

	if("CopiedWeapon" in scope && scope.CopiedWeapon > Time())
		return

	local new_wep = SpawnEntityFromTable(weapon.GetClassname(), { targetname = "kill me" })

	SetPropInt(new_wep, PROP_ITEM_DEF_IDX, idx_over ? idx_over : weapon.GetIDX())
	SetPropBool(new_wep, "m_bValidatedAttachedEntity", true)
	SetPropBool(new_wep, "m_AttributeManager.m_Item.m_bInitialized", true)
	SetPropInt(new_wep, "m_AttributeManager.m_iReapplyProvisionParity", 1)
	new_wep.SetTeam(GetTeam())


	if(copy_attrib)
		CopyAttributesFromWeapons(weapon, new_wep)
	else 
	{
		foreach(attrib, value in attributes)
			weapon.AddAttribute(attrib, value, 0)
	}

	new_wep.DispatchSpawn()

	local old_wep = GetPropEntityArray(this, "m_hMyWeapons", override_slot ? new_wep.GetSlot() : SLOT_UTILITY)
	if(old_wep)
		old_wep.Destroy()

	SetPropEntityArray(this, "m_hMyWeapons", new_wep, override_slot ? new_wep.GetSlot() : SLOT_UTILITY)

	Weapon_Equip(new_wep)
	Weapon_Switch(new_wep)

	if(reset_ammo && !new_wep.IsMeleeWeapon())
	{
		if(new_wep.GetSlot() == 0)
			ResetPrimaryAmmo()
		else if(new_wep.GetSlot() == 1)
			ResetSecondaryAmmo()
	}

	if(duration)
	{
		EntFireNew(new_wep, "Kill", "", duration)
		RunWithDelay(@() printl("Killed " + new_wep.tostring()), duration - TICK_DUR)

		if(switch_slot)
			RunScriptCode(format("SwitchWeapon(%i)", switch_slot), duration + TICK_DUR)
	}

	if(regenerate)
	{
		if(duration)
			RunScriptCode("Regenerate(true, false)", duration + TICK_DUR)
		else
			Regenerate(true, false)
	}

	scope.CopiedWeapon <- Time() + duration.tofloat()
} */
// TODO: Add to Snippets
function CTFPlayer::KillUnknownWeapons()
{
	local my_weps = GetMyWeaponsArray()
	for (local next, current = FirstMoveChild(); current != null; current = next)
	{
		EnableStringPurge(current)
		next = current.NextMovePeer()
		if (startswith(current.GetClassname(), "tf_wearable") || current.GetClassname() == "tf_viewmodel")
			continue
		if(my_weps.find(current) != null)
			continue
		printf("Destroyed unknown Move Child %s\n", current.tostring())
		current.Destroy()
	}
}
// TODO: Add to Snippets
function CTFPlayer::HasCorrosion()
	return "Corrosion" in GetScope(this)

// TODO: Add to Snippets
function CTFPlayer::GetCorrosion()
	return HasCorrosion() ? GetScope(this).Corrosion : null

// TODO: Add to Snippets
function CTFPlayer::CanRemoveCorrosion()
	return IsInvincible() || InRespawnRoom() || IsDead()

// TODO: Add to Snippets
function CTFPlayer::RemoveCorrosion()
{
	if(HasCorrosion())
		delete GetScope(this).Corrosion
}
if(!("__CORROSION_DEBUG" in ROOT))
	::__CORROSION_DEBUG <- false
// TODO: Add to Snippets
function CTFPlayer::MakeCorrosion(Attacker, Weapon)
{
	if(IsInvincible())
	{
		RemoveCorrosion()
		return;
	}

	if(Weapon.getclass() != CTFWeaponBase)
		return;
		
	if(Weapon.GetIDX() != TF_WEAPON_BREAD_BITE)
	{
		if(__CORROSION_DEBUG)
		{
			PrintToHudAll(format("CTFPlayer::MakeCorrosion got %d for Weapon IDX!!!"), Weapon.GetIDX())
			PrintToChatAll(format("CTFPlayer::MakeCorrosion got %d for Weapon IDX!!!"), Weapon.GetIDX())
		}
		return
	}

	if(__CORROSION_DEBUG) PrintToChatAll(format("Made Corrosion on %s", tostring()))

	SetColor("205 245 135")

	GetScope(this).Corrosion <- {
		hAttacker = Attacker
		hWeapon = Weapon
		flNextTick = Time() + 1.0
	}
	// return GetScope(this).Corrosion
}
// TODO: Add to Snippets
function CTFPlayer::CorrosionTick()
{
	if(HasCorrosion() && CanRemoveCorrosion())
	{
		RemoveCorrosion()
		return
	}
	if(!HasCorrosion())
		return
	

	local Corrosion = GetCorrosion()
	Corrosion.flNextTick <- Time() + 1.0
	
	if(__CORROSION_DEBUG) printf("%s took Corrosion Damage! Attacker : %s, Weapon : %s, Damage : %f\n", tostring(), Corrosion.hAttacker.tostring(), Corrosion.hWeapon.tostring(), 250+GetMaxHealth()/400)
	TakeDamageEx(CORROSION_ICON, Corrosion.hAttacker, Corrosion.hWeapon, Vector(), Vector(), 250+GetMaxHealth()/400, DMG_GENERIC|DMG_PREVENT_PHYSICS_FORCE)
}
// TODO: Add to Snippets
function CTFPlayer::CanHaveCorrosion()
{
	if(CanRemoveCorrosion())
		return false
	if(IsBot() && HasBotTag("NoCorrode"))
		return false
	return true
}

function IsGasNotValid(gas)
{
	return !GetScope(gas).Attacker || !GetScope(gas).Attacker.IsValid() || GetScope(gas).TimeCreated + 15 <= Time() || IsPointInRespawnRoom(gas.GetOrigin())
}

if(!("GasBombs" in ROOT))
	::GasBombs <- []
// TODO: Add to Snippets
function CTFPlayer::MakeCorrosionPuddle()
{
	if(InRespawnRoom())
		return
	local Corrosion = GetCorrosion()

	// 1. Cleanup invalid bombs
	for (local i = GasBombs.len() - 1; i >= 0; i--)
	{
		if (!GasBombs[i] || !GasBombs[i].IsValid())
			GasBombs.remove(i)
	}

	// 2. Enforce limit by killing the oldest bomb
	if (GasBombs.len() > 3)
	{
		// if you Time() var is above this, then GOD have mercy on you
		local lowest_time = 2e30
		local lowest_bomb_idx = -1
		
		foreach (idx, bomb in GasBombs)
		{
			local bomb_time = GetScope(bomb).TimeCreated
			if (bomb_time < lowest_time)
			{
				lowest_time = bomb_time
				lowest_bomb_idx = idx
			}
		}
		
		if (lowest_bomb_idx != -1)
		{
			GetScope(GasBombs[lowest_bomb_idx]).GasDestroy()
			GasBombs.remove(lowest_bomb_idx)
		}
	}


	local Gasbomb = SpawnEntityFromTable("info_teleport_destination", {targetname = "GasBomb"})
	Gasbomb.SetAbsOrigin(GetOrigin())

	GasBombs.append(Gasbomb)

	local scope = GetScope(Gasbomb)
	local Corrosion = GetCorrosion()

	scope.Weapon 		<- Corrosion.hWeapon
	scope.Attacker 		<- Corrosion.hAttacker
	scope.TimeCreated 	<- Time()
	scope.Particle 		<- SpawnEntityFromTable("info_particle_system", {
		targetname = "GasParticle"
		effect_name = "corrosion_cloud_parent"
		start_active = 1
	})
	scope.Particle.SetAbsOrigin(GetOrigin()+Vector(0, 0, 40))

	scope.GasThink <- function() {
		if(!self || !self.IsValid())
		{
			if(Particle && Particle.IsValid())
			{
				Particle.AcceptInput("Stop", "", null, null)
				Particle.Destroy()
			}
			
			local idx = GasBombs.find(self)
			if (idx != null) GasBombs.remove(idx)
			return 500
		}

		if(IsGasNotValid(self))
		{
			GasDestroy()
			return 500
		}
		foreach(bot in GetAllPlayers(TF_TEAM_PVE_INVADERS, [self.GetOrigin(), 75], true))
		{
			if(bot.HasCorrosion())
				continue
			bot.MakeCorrosion(Attacker, Weapon)
		}
		// DebugDrawCircle(self.GetOrigin(), Vector(0, 0, 255), 5, 75, false, 0.15)
		return 0.1
	}
	scope.GasDestroy <- function() {
		local idx = GasBombs.find(self)
		if (idx != null) GasBombs.remove(idx)

		if(Particle && Particle.IsValid())
		{
			Particle.AcceptInput("Stop", "", null, null)
			Particle.Destroy()
		}
				
		self.Destroy()
	}
	AddThinkToEnt(Gasbomb, "GasThink")
	return Gasbomb
}
// TODO: Add to Snippets
function CTFPlayer::RollSpell()
{
	local spellbook = GetSpellBook()
	if(!spellbook)
		return
	if(spellbook.GetSpellCharges() != 0)
		return
	spellbook.SetSpellIndex(TF_SPELL_UNKNOWN)
	RunWithDelay(@() spellbook.SetRandomSpell(), 2.1)
}
// TODO: Add to Snippets
function CTFPlayer::GetChatColor()
	return GetTeam() == TF_TEAM_RED ? TF_TEAM_COLOR_RED : TF_TEAM_COLOR_BLUE

/*	PrintTime = {
		owner = player
		LastThinkTime = -1
		delay = 0.995
		func = function(self) {
			// self is the player, "this" is the table above
			self.PrintToHud(Time())
		}
	}
	Heal = {
		delay = 1
		func = function(self) {
			self.SetHealth(self.GetHealth() + (self.GetMaxHealth() /10))
			if(self.GetHealth() > self.GetMaxHealth() * 1.5)
			self.SetHealth(self.GetMaxHealth()*1.5)
		}
	} 	
*/
// TODO: Add to Snippets
function CTFPlayer::SetUpThinkTable()
{
	local scope = GetScope(this)
	scope.ThinkTable <- {}
	scope.ThinkTableThink <- function() {
		foreach (key, func_table in ThinkTable)
		{
			if(func_table.NextThinkTime <= Time())
			{
				local result = func_table.func.call(this)
				try { result.tofloat() }
				catch (e) { result = -1	}
				func_table.NextThinkTime = Time() + result
			}
		}
		return -1
	}
	AddThinkToEnt(this, "ThinkTableThink")
	if(IsNotInScope("PreservedThinks", GetScope(this)))
		GetScope(this).PreservedThinks <- {}
}
// TODO: Add to Snippets 
/**
 * Adds a Preserved think to the think table that stays after spawning / resupplying
 * 
 * @param {function} 	func 		The Think Function.
 * @param {string|null} [name] 		The Think function name in the ThinkTable (used for removing a think). (Default: null)
 * @param {float} 		[offset] 	Time offset of the first Think. (Default: 0.0)
 */
function CTFPlayer::AddPreservedThink(func, name = null, offset = 0.0)
{
	name = name||UniqueString()
	AddThink(func, name, offset)
	GetScope(this).PreservedThinks[name] <- {
		func = func
		offset = offset
	}
	return name
}
// TODO: Add to Snippets 
/**
 * Adds a think to the think table
 * 
 * @param {function} 	func 		The Think Function.
 * @param {string|null} [name] 		The Think function name in the ThinkTable (used for removing a think). (Default: null)
 * @param {float} 		[offset] 	Time offset of the first Think. (Default: 0.0)
 */
function CTFPlayer::AddThink(func, name = null, offset = 0.0)
{
	if(IsNotInScope("ThinkTable", GetScope(this)))
		SetUpThinkTable()
		
	name = name||UniqueString()
	GetScope(this).ThinkTable[name] <- {
		func = func
		NextThinkTime = Time() + offset
	}
	return name
}
// TODO: Add to Snippets
function CTFPlayer::RemoveThink(name)
{
	if(IsNotInScope("ThinkTable", GetScope(this)))
		SetUpThinkTable()
	if(name in GetScope(this).PreservedThinks)
		delete GetScope(this).PreservedThinks[name]
	if(name in GetScope(this).ThinkTable)
		delete GetScope(this).ThinkTable[name]
}
// TODO: Add to Snippets
function CTFPlayer::DiedWithAbility()
	return "DiedWithAbility" in GetScope(this) && GetScope(this).DiedWithAbility == true

// TODO: Add to Snippets
function CTFPlayer::FixAmmo()
{
	// if this happens then all shit goes out
	if(!this||!IsValid())
		return
	ResetAmmo()
	foreach (weapon in GetAllWeapons())
	{
		if(weapon.IsWearable())
			continue
		weapon.SetClip1(0)
		if(weapon.HasAttribute("auto fires full clip penalty", 0) || weapon.HasAttribute("auto fires full clip", 0))
			weapon.SetClip1(0)
		else 
			weapon.SetClip1(weapon.GetMaxClip1())

		if(weapon.HasAttribute("mod use metal ammo type", 0))
			SetPropInt(weapon, "m_iPrimaryAmmoType", TF_AMMO_METAL)

		// the cleavers and mad milk, TODO: make TF_WEAPON_ constants
		if(weapon.GetIDX() == 812 || weapon.GetIDX() == 833 || weapon.GetIDX() == 222)
		{
			SetThrowableAmmo(0)
			SetThrowableCharge(50)
		}
	}
}

// TODO: Add to Snippets
function CTFPlayer::TransformGHeavy()
{
	GetScope(this).HeavyTransform <- true
	PrecacheObject("models/bots/heavy_boss/bot_heavy_boss.mdl")
	SetForcedTauntCam(1)
	SetCustomModelWithClassAnimations("models/bots/heavy_boss/bot_heavy_boss.mdl")

	// Kill all the Children
	for (local child = FirstMoveChild(); child; child = child.NextMovePeer())
	{
		EnableStringPurge(child)
		if (!startswith(child.GetClassname(), "tf_wearable")) continue
		// do not kill wearables if they are needed for weapons!
		if(IsInArray(child.GetIDX(), WearableIDXs.Primarys) || IsInArray(child.GetIDX(), WearableIDXs.Secondarys))
			continue
		
		EntFireNew(child, "Kill")
	}
}
// TODO: Add to Snippets
function CTFPlayer::UndoGHeavy()
{
	if(!this||!IsValid())
		return
	GetScope(this).HeavyTransform <- false
	SetForcedTauntCam(0)
	SetCustomModelWithClassAnimations("")
}

// TODO: Add to Snippets
function CTFPlayer::IsGHeavy()
	return "HeavyTransform" in GetScope(this) && GetScope(this).HeavyTransform

// TODO: Add to Snippets
function CTFPlayer::TransformGDemoknight()
{
	GetScope(this).DemoknightTransform <- true
	PrecacheObject("models/bots/demo_boss/bot_demo_boss.mdl")
	SetForcedTauntCam(1)
	SetCustomModelWithClassAnimations("models/bots/demo_boss/bot_demo_boss.mdl")

	local weapons = GetAllWeapons()
	foreach (wep in weapons)
	{
		if(wep.IsMeleeWeapon())
		{
			Weapon_Switch(wep)
			continue
		}
		EntFireNew(wep, "Kill")
	}

	local weapon = EquipItemBAD("The Chargin' Targe")
	Weapon_Switch(GetWeaponInSlotNew(SLOT_MELEE))

	if(!weapon)
		return

	if(!("ScotsmanSettings" in ROOT))
		return
	
	foreach (attrib, value in ScotsmanSettings.ShieldAttributes)
	{
		weapon.AddAttribute(attrib, value, 0)
		PrintToConsoleAll(weapon.tostring()+": Added attribute \""+attrib+"\" with a value of "+format("%g", value.tofloat()))
	}


	// Kill all the Children
	// for (local child = FirstMoveChild(); child; child = child.NextMovePeer())
	// {
	// 	EnableStringPurge(child)
	// 	if (!startswith(child.GetClassname(), "tf_wearable")) continue
	// 	// do not kill wearables if they are needed for weapons!
	// 	if(IsInArray(child.GetIDX(), WearableIDXs.Primarys) || IsInArray(child.GetIDX(), WearableIDXs.Secondarys))
	// 		continue
		
	// 	EntFireNew(child, "Kill")
	// }
}
// TODO: Add to Snippets
function CTFPlayer::UndoGDemoknight()
{
	if(!this||!IsValid())
		return
	GetScope(this).DemoknightTransform <- false
	SetForcedTauntCam(0)
	SetCustomModelWithClassAnimations("")
}

// TODO: Add to Snippets
function CTFPlayer::IsGDemoknight()
	return "DemoknightTransform" in GetScope(this) && GetScope(this).DemoknightTransform


// TODO: Add to Snippets
function CTFPlayer::EquipItem(classname, idx, swit = true, attrib_overrides = {})
{
	local weapon = SpawnEntityFromTable(classname, {})

	if(!weapon)
		return

	SetPropInt(weapon, PROP_ITEM_DEF_IDX, idx)
	SetPropBool(weapon, "m_bValidatedAttachedEntity", true)
	SetPropBool(weapon, "m_AttributeManager.m_Item.m_bInitialized", true)
	SetPropInt(weapon, "m_AttributeManager.m_iReapplyProvisionParity", 1)
	weapon.SetTeam(GetTeam())

	foreach (attrib, value in attrib_overrides)
	{
		weapon.AddAttribute(attrib, value, 0)
	}

	weapon.DispatchSpawn()


	local old_wep = GetWeaponInSlotNew(weapon.GetSlot())
	local myweaps_idx = GetMyWeaponsArray().find(old_wep)
	old_wep.Destroy()

	SetPropEntityArray(this, "m_hMyWeapons", null, myweaps_idx)

	Weapon_Equip(weapon)
	if(swit)
		Weapon_Switch(weapon)

	FixAmmo()
}

function CTFPlayer::EquipWearableItem(idx, classname_override = false, attrib_overrides = {})
{
	local dummy = CreateByClassname( "tf_weapon_parachute" )
	SetPropInt( dummy, PROP_ITEM_DEF_IDX, 1101 )
	SetPropBool( dummy, "m_AttributeManager.m_Item.m_bInitialized", true )
	dummy.SetTeam( GetTeam() )
	dummy.DispatchSpawn()
	dummy.SetModelSimple("")
	Weapon_Equip( dummy )

	// SetPropString( dummy, "m_iName", format( "dummy_%d", dummy.entindex() ) )

	local wearable = GetPropEntity( dummy, "m_hExtraWearable" )
	dummy.Kill()

	// SetPropString( wearable, "m_iName", format( "werable_%d", wearable.entindex() ) )

	wearable.SetTeam(GetTeam())
	SetPropInt( wearable, PROP_ITEM_DEF_IDX, idx )
	SetPropBool( wearable, "m_AttributeManager.m_Item.m_bInitialized", true )
	SetPropBool( wearable, "m_bValidatedAttachedEntity", true )

	if(classname_override)
		wearable.KeyValueFromString("classname", classname_override)

	printl(wearable.GetClassname())

	wearable.DispatchSpawn()

	printl(wearable.GetClassname())

	wearable.SetModelSimple(GetItemModelName(idx))

	if(classname_override)
		wearable.KeyValueFromString("classname", classname_override)

	wearable.SetTeam(GetTeam())

	SendGlobalGameEvent( "post_inventory_application", { userid = GetUserID(), early_out = true} )
	wearable.SetOwner(this)

	Weapon_Switch(GetWeaponInSlotNew(SLOT_MELEE))

	PrintToChat(wearable)
	return wearable
}

function CTFPlayer::EquipItemBAD(ItemName)
{
	local OldWeapons = GetAllWeapons()
	AddEFlags(EFL_NO_MEGAPHYSCANNON_RAGDOLL)  // prevent inf resupply loop
	GenerateAndWearItem(ItemName)
	RemoveEFlags(EFL_NO_MEGAPHYSCANNON_RAGDOLL)
	local NewWeapons = GetAllWeapons()

	foreach (wep in OldWeapons)
	{
		if(NewWeapons.find(wep) != null)
			NewWeapons.remove(NewWeapons.find(wep))
	}

	if(NewWeapons.len() > 1)
		return null

	return NewWeapons[0]
}
// TODO: Add to Snippets
function CTFPlayer::IsMedicButtonDown()
	return GetPropFloat(this, "m_flHelpmeButtonPressTime") != 0
// TODO: Add to Snippets
function CTFPlayer::GetActiveHealers()
{
	local healers = []
	foreach (player in GetAllEntitiesByClassname("player")) // worse than iterating through cached player array tbh
	{
		if(player.GetTeam() != TF_TEAM_PVE_INVADERS || player.GetPlayerClass() != TF_CLASS_MEDIC)
			continue
		if(player.GetHealTarget() == null || player.GetHealTarget() != this)
			continue
		healers.append(player)
	}
	return healers
}

// TODO: Add to Snippets
function CTFPlayer::AddHealth(amount)
	SetHealth(GetHealth()+amount)
// TODO: Add to Snippets
function CTFPlayer::RemoveHealth(amount)
	SetHealth(GetHealth()-amount)
// TODO: Add to Snippets
function CTFPlayer::GetOverHealCapMult(start)
{
	local cap_mult = start
	cap_mult *= HookMultAttributes("patient overheal penalty")
	cap_mult *= GetActiveWeapon().GetAttribute("mult_patient_overheal_penalty_active", 1.0)
	return cap_mult
}
// TODO: Add to Snippets
function CTFPlayer::HealPlayer(amount, overheal = false, overheal_cap = false, display = true, type = T_HEAL_NONE)
{
	local mult = 1.0
	mult *= HookMultAttributes("healing received penalty")
	mult *= HookMultAttributes("healing received bonus")

	if(type == T_HEAL_HEALER)
	{
		mult *= HookMultAttributes("health from healers reduced")
		mult *= HookMultAttributes("health from healers increased")
		mult *= HookMultAttributes("reduced_healing_from_medics")
		mult *= GetActiveWeapon().GetAttribute("mult_health_fromhealers_penalty_active", 1.0)
		if(HookAdditiveAttributes("mod weapon blocks healing"))
			return // Cannot be healed
	}
	else if(type == T_HEAL_PACK) 
	{
		mult *= HookMultAttributes("health from packs increased")
		mult *= HookMultAttributes("health from packs decreased")
	}

	amount *= mult

	if(overheal && !overheal_cap)
		AddHealth(amount)
	else if(overheal && overheal_cap)
	{
		local max = GetMaxHealth() + (GetMaxHealth() * GetOverHealCapMult(overheal_cap))
		AddHealth(amount)
		if(GetHealth() > max)
			SetHealth(max)
	}
	else if(GetHealth() >= GetMaxHealth())
		{}
	else if(GetHealth()+amount >= GetMaxHealth())
		SetHealth(GetMaxHealth())
	else AddHealth(amount)


	if(display)
		SendGlobalGameEvent("player_healonhit", {
			entindex = entindex()
			amount = amount
			manual = true
		})
}
// TODO: Add to Snippets
function CTFPlayer::HookMultAttributes(attribute, weapons = true)
{
	local mult = 1.0
	mult *= GetCustomAttribute(attribute, 1.0)
	if(!weapons)
		return mult
	local weps = GetAllWeapons()
	foreach (weapon in weps)
	{
		if(weapon.GetAttribute("provide on active", 0) && weapon != GetActiveWeapon())
			continue
		mult *= weapon.GetAttribute(attribute, 1.0)
	}
	return mult
}
// TODO: Add to Snippets
function CTFPlayer::HookAdditiveAttributes(attribute, weapons = true)
{
	local amount = 0.0
	amount += GetCustomAttribute(attribute, 0.0)
	if(!weapons)
		return amount
	local weps = GetAllWeapons()
	foreach (weapon in weps)
	{
		if(weapon.GetAttribute("provide on active", 0) && weapon != GetActiveWeapon())
			continue
		amount += weapon.GetAttribute(attribute, 0)
	}
	return amount
}
// TODO: Add to Snippets
function CTFPlayer::GetBaseMovespeed( classidx = false )
{
	switch (classidx||GetPlayerClass()) 
	{
	case TF_CLASS_SCOUT: 		return 400
	case TF_CLASS_SOLDIER: 		return 240
	case TF_CLASS_PYRO: 		return 300
	case TF_CLASS_DEMOMAN: 		return 280
	case TF_CLASS_HEAVYWEAPONS: return 230
	case TF_CLASS_ENGINEER: 	return 300
	case TF_CLASS_MEDIC: 		return 320
	case TF_CLASS_SNIPER: 		return 300
	case TF_CLASS_SPY: 			return 320
	default: 					return 300
	}
	return -1
}
// TODO: Add to Snippets
function CTFPlayer::GetMoveSpeed()
{
	local BaseSpeed = GetBaseMovespeed()
	if ( InCond( TF_COND_DISGUISED ) && !IsStealthed() )
		BaseSpeed = MATH.Min(GetBaseMovespeed( GetPropInt(this, "m_Shared.m_nDisguiseClass") ), BaseSpeed)
	local speed = BaseSpeed

	if ( InCond( TF_COND_AIMING ) )
	{
		local AimMax = 0

		if ( GetPlayerClass() == TF_CLASS_HEAVYWEAPONS )
			AimMax = 110
		else if(GetActiveWeapon() && GetActiveWeapon().IsBow())
			AimMax = 160
		else
			AimMax = 80

		AimMax *= active.GetAttribute("aiming movespeed increased", 1)
		AimMax *= active.GetAttribute("aiming movespeed decreased", 1)
		AimMax *= active.GetAttribute("sniper aiming movespeed decreased", 1)
		
		speed = MATH.Min( speed, AimMax );
	}

	local WhipBoost = 105.0
	if ( IsConvarAllowed("tf_whip_speed_increase") )
		WhipBoost = GetCvarFloat("tf_whip_speed_increase")


	if ( InCond( TF_COND_SPEED_BOOST ) && speed > 0.0)
		speed += MATH.Min( speed * 0.4, WhipBoost )

	if ( GetActiveWeapon() )
		speed *= GetActiveWeapon().GetSpeedMod()

	if ( GetPlayerClass() == TF_CLASS_DEMOMAN )
	{
		local Sword = GetWeaponClassname("tf_weapon_sword")
		if ( Sword )
			speed *= Sword.GetSwordSpeedMod()
	}
	if ( InCond( TF_COND_SHIELD_CHARGE ) )
		speed = (IsConvarAllowed("tf_max_charge_speed") && GetCvarFloat("tf_max_charge_speed")) ? GetCvarFloat("tf_max_charge_speed") : 750.0

	if ( !IsMannVsMachineMode() && GetPropBool(this, "m_Shared.m_bCarryingObject") )
		speed *= 0.9

	speed *= HookMultAttributes("move speed bonus")
	speed *= HookMultAttributes("move speed penalty")

	if ( GetPropBool(this, "m_Shared.m_bShieldEquipped") )
		speed *= HookMultAttributes("move speed bonus shield required")

	if ( GetPlayerClass() == TF_CLASS_MEDIC )
	{
		// QuickFix stuff
		local flClassResourceLevelMod = GetActiveWeapon().GetAttribute("move speed bonus resource level", 1.0)
		if ( flClassResourceLevelMod != 1.0 )
		{
			local Medigun = GetWeaponClassname("tf_weapon_medigun")
			if ( Medigun )
				speed *= RemapValClamped( Medigun.GetUberChargePercent(), 0.0, 1.0, 1.0, flClassResourceLevelMod );
		}
	}

	if ( GetPlayerClass() == TF_CLASS_HEAVYWEAPONS && InCond( TF_COND_ENERGY_BUFF ))
	{
		speed *= 1.3;
		MATH.Clamp(speed, 0, BaseSpeed * 1.35)
	}

	if ( GetPlayerClass() == TF_CLASS_SCOUT )
	{	
		local wep = GetWeapon(TF_WEAPON_BABYFACE)
		if ( wep )
			speed *= RemapValClamped( GetScoutHypeMeter(), 0.0, 100.0, 1.0, 1.45 )
	}

	if ( GetCurrentRune() == RUNE_HASTE )
		speed *= 1.3
	if ( GetCurrentRune() == RUNE_AGILITY )
	{
		// light classes get more benefit due to movement speed cap of 520 
		switch ( GetPlayerClass() )
		{
		case TF_CLASS_DEMOMAN:
		case TF_CLASS_SOLDIER:
		case TF_CLASS_HEAVYWEAPONS:
			speed *= 1.4
			break;
		default:
			speed *= 1.5
			break;
		}
	}
	return speed
}

CTFPlayer.GenerateAndWearItem <- CTFBot.GenerateAndWearItem
/* 
function CTFPlayer::CreateParticle(particle, duration = -1)
{
	local trigger = CreateByClassname("trigger_particle")
	trigger.KeyValueFromString("particle_name", particle)
	trigger.KeyValueFromInt("spawnflags", SF_TRIGGER_ALLOW_CLIENTS)
	trigger.KeyValueFromInt("attachment_type", PATTACH_ABSORIGIN_FOLLOW)

	trigger.AcceptInput("StartTouch", "", null, this)
	trigger.Destroy()

	if(duration > 0)
	{
		PlayerFire("DispatchEffect", "ParticleEffectStop", duration)
	}
}

function CTFPlayer::CreateWearable( idx, model )
{
	local dummy = CreateByClassname( "tf_weapon_parachute" )
	SetPropInt( dummy, PROP_ITEM_DEF_IDX, 1101 )
	SetPropBool( dummy, "m_AttributeManager.m_Item.m_bInitialized", true )
	dummy.SetTeam( GetTeam() )
	dummy.DispatchSpawn()
	dummy.SetModelSimple("")
	Weapon_Equip( dummy )

	// SetPropString( dummy, "m_iName", format( "dummy_%d", dummy.entindex() ) )

	local wearable = GetPropEntity( dummy, "m_hExtraWearable" )
	dummy.Kill()

	// SetPropString( wearable, "m_iName", format( "werable_%d", wearable.entindex() ) )

	wearable.SetTeam(GetTeam())
	SetPropInt( wearable, PROP_ITEM_DEF_IDX, idx )
	SetPropBool( wearable, "m_AttributeManager.m_Item.m_bInitialized", true )
	SetPropBool( wearable, "m_bValidatedAttachedEntity", true )
	wearable.DispatchSpawn()

	if (model) 
		wearable.SetModelSimple(model)

	wearable.SetTeam(GetTeam())

	SendGlobalGameEvent( "post_inventory_application", { userid = GetUserID() } )
	wearable.SetOwner(this)

	return wearable
} */

::NoFormatToBot <- [
	"PrintToChat"
	"PrintToHud"
	"TranslateToChat"
	"TranslateToHud"
	"GetTranslatedAndFormattedString"
	"GetTranslatedString"
	"GetLanguage"
	"IsAdmin"
	"IsEventJudge"
	"IHTranslateToChat"
	"IsBot"
	"CalculateEHP"
]

// somewhat stolen from ZI
foreach ( key, value in CTFPlayer )
{
	if ( typeof( value ) == "function" )
	{
		if(NoFormatToBot.find(key) != null)
			continue
		CTFBot[ key ] <- value
		// printf("Formatted Function %s to CTFBot\n", key)
	}
}
// funi
function CTFBot::IsBot()
	return true
function CTFBot::IsAdmin()
	return false
function CTFBot::IsEventJudge()
	return false
function CTFBot::IsReprogrammed()
	return InCond(TF_COND_REPROGRAMMED)
function CTFBot::SayChatterMessage(victim)
{
	local Messages = []
	foreach (Rarity in [ChatterMessages["Commons"], ChatterMessages["Rares"]])
	{
		foreach (message in Rarity)
		{
			local chance 		= "chance" 		in message ? message["chance"].tofloat() 	: 101.0
			local team 			= "team" 		in message ? message["team"] 				: 3
			local requirement 	= "requirement" in message ? message["requirement"] 		: false

			local requirements = []

			if(requirement && requirement.find("|"))
			{
				requirements = split(requirement, "|")
			}

			local Failed = false

			if(MATH.RandomChance() > chance/100 || GetTeam() != team)
				Failed = true

			if(Failed == false && requirement)
			{
				Failed = true
				if(requirements.len() != 0)
				{
					if(requirements[0] == "id")
					{
						if(victim.GetSteamID() == requirements[1])
							Messages.append(message)
					}
				}
				else if(requirement == "Admin")
				{
					if(victim.IsAdmin())
						Messages.append(message)
				}
				else if(requirement == "Judge")
				{
					if(victim.IsEventJudge())
						Messages.append(message)
				}
				else if(requirement == "BrainDawg")
				{
					if(victim.GetSteamID() == "[U:1:28266263]")
						Messages.append(message)
				}
				else throw format("Unknown Requirement in message %s : %s", message["message"], requirement)
			}

			if(Failed == false)
				Messages.append(message)
		}
	}

	if(Messages.len() == 0)
		return

	local MessageData = Messages[RandomInt(0, Messages.len()-1)]
	local FormatData = "format" in MessageData ? MessageData["format"] : null
	local Message = MessageData["message"]
	if(FormatData)
	{
		if(MessageData["format"].find("|"))
			FormatData = split(FormatData, "|")
		else 
			FormatData = [FormatData]
		// ADD CUSTOM FORMAT RULES LUL
		local victim_in = FormatData.find("victim")
		printl(FormatData.find("victim"))
		printl(FormatData.find("⤒"))
		if(victim_in != null)
		{
			local msg = victim.GetUserName()
			if(FormatData.find("⤒"))
			{
				msg = msg.toupper()
				FormatData.remove(FormatData.find("⤒"))
			}
			
			FormatData[victim_in] = msg
		}
		
		Message = format.acall([this, Message].extend(FormatData))
	}
	PrintToChatAll(format("%s%s\x01 :  %s", GetChatColor(), GetUserName(), Message))
}

function CTFBot::UndoReprogram()
{
	if(!this||!IsValid()||IsDead())
		return

	local temp = SpawnEntityFromTable("info_particle_system", {effect_name = "drg_cow_explosioncore_charged"})
	temp.SetAbsOrigin(GetOrigin()+Vector(0, 0, 8))
	temp.SetAbsAngles(QAngle(-90, 0, 0))
	temp.AcceptInput("Start", "", null, null)
	EntFireNew(temp, "Stop", "", TICK_DUR*3)
	EntFireNew(temp, "Kill", "", TICK_DUR*5)

	Suicide()
}


/////////
function CTFWeaponBase::HasAttribute(attrib, def_val)
	return GetAttribute(attrib, def_val) != def_val

function CTFWeaponBase::GetIDX()
	return GetPropInt(this, PROP_ITEM_DEF_IDX)
	
function CTFWeaponBase::GetChargeTime()
	return GetPropFloat(this, PROP_CHARGE_TIME)

function CTFWeaponBase::SetChargeTime(time)
	SetPropFloat(this, PROP_CHARGE_TIME, time)

function CTFWeaponBase::GetDefaultChargeTime()
{
	switch (GetClassname().slice(10))
	{
		case "jar":
		case "jar_milk":
		{
			return 20
			break;
		}
		case "jar_gas":
		{
			return 60
		}
		case "cleaver":
		{
			return 5
		}
		default:
		{
			return -1
		}
	}
	return -1
}

function CTFWeaponBase::IsAbilityWeapon()
	return TF_ABILITYS.values().find(GetIDX()) != null

function CTFWeaponBase::CalculateAttributes(AttributeName, AttributeChange, StartingValue, MaxValue, MinValue)
{
	local EndingValue = (GetAttribute(AttributeName, StartingValue) + AttributeChange)

	if (EndingValue <= MaxValue || EndingValue >= MinValue ) { AddAttribute(AttributeName, EndingValue, 0) }
	if (EndingValue > MaxValue) { AddAttribute(AttributeName, MaxValue, 0) }
	if (EndingValue < MinValue) { AddAttribute(AttributeName, MinValue, 0) }
}

function CTFWeaponBase::CalculateAttributeChange(mult_val, AttributeName, AttributeChange, StartingValue, MaxValue, MinValue)
{
	local EndingValue = (StartingValue + (AttributeChange * mult_val))

	if (EndingValue <= MaxValue || EndingValue >= MinValue ) { AddAttribute(AttributeName, EndingValue, 0) }
	if (EndingValue > MaxValue) { AddAttribute(AttributeName, MaxValue, 0) }
	if (EndingValue < MinValue) { AddAttribute(AttributeName, MinValue, 0) }
}


function CTFWeaponBase::SetProp(propertyName, value)
	SetPropArray(propertyName, value, 0)

function CTFWeaponBase::SetPropArray(propertyName, value, index)
{
	if(!HasProp(this, propertyName))
	{
		printf("%s does not have property %s\n", GetClassname(), propertyName)
		return
	}
	switch (type(value))
	{
		case "string":
		{ 	SetPropStringArray(this, propertyName, value, index); return 	}
		case "integer":
		{ 	SetPropIntArray(this, propertyName, value, index); return 		}
		case "float":
		{ 	SetPropFloatArray(this, propertyName, value, index); return 	}
		case "instance":
		{ 	SetPropEntityArray(this, propertyName, value, index); return 	}
		case "bool":
		{ 	SetPropBoolArray(this, propertyName, value, index); return 		}
		case "vector":
		{ 	SetPropVectorArray(this, propertyName, value, index); return 	}
		default:
			printl("Hmm found " + type(value) + " for CTFWeaponBase::SetProp/SetPropArray")
	}
}

function CTFWeaponBase::SetSpellIndex(index)
	if(HasProp(this, PROP_SPELL_INDEX)) { SetPropInt(this, PROP_SPELL_INDEX, index) }

function CTFWeaponBase::GetSpellIndex()
	if(HasProp(this, PROP_SPELL_INDEX)) { return GetPropInt(this, PROP_SPELL_INDEX) } else { return null }

function CTFWeaponBase::GetSpellCharges()
	if(HasProp(this, PROP_SPELL_CHARGES)) { return GetPropInt(this, PROP_SPELL_CHARGES) } else { return null }

function CTFWeaponBase::SetSpellCharges(charge)
	if(HasProp(this, PROP_SPELL_CHARGES)) { SetPropInt(this, PROP_SPELL_CHARGES, charge) }

function CTFWeaponBase::IncrementSpellCharge(num)
	if(HasProp(this, PROP_SPELL_CHARGES)) SetPropInt(this, PROP_SPELL_CHARGES, GetSpellCharges() + num)

function CTFWeaponBase::IsHolstered()
	if(HasProp(this, "m_bHolstered")) { return GetPropInt(this, "m_bHolstered") } else { return false }


function CTFWeaponBase::SetUberChargePercent(level)
	if(HasProp(this, PROP_MEDIGUN_CHARGE)) { SetPropFloat(this, PROP_MEDIGUN_CHARGE, level.tofloat()/100) }

function CTFWeaponBase::GetUberChargePercent()
	if(HasProp(this, PROP_MEDIGUN_CHARGE)) { return GetPropFloat(this, PROP_MEDIGUN_CHARGE) } else { return null }

function CTFWeaponBase::IncreaseUberChargePercent(level)
{
	if(HasProp(this, PROP_MEDIGUN_CHARGE))
	{
		SetPropFloat(this, PROP_MEDIGUN_CHARGE, GetUberChargePercent() + level.tofloat()/100)
		local charge = GetUberChargePercent()
		if( charge > 1.00) SetUberChargePercent(100)
		if( charge < 0.00) SetUberChargePercent(0)
	}
}

function CTFWeaponBase::DecreaseUberChargePercent(level)
{
	IncreaseUberChargePercent(-level)
	return
	if(HasProp(this, PROP_MEDIGUN_CHARGE))
	{
		SetPropFloat(this, PROP_MEDIGUN_CHARGE, GetUberChargePercent() - (level.tofloat()/100))
		local charge = GetUberChargePercent()
		if( charge > 1.00) SetUberChargePercent(100)
		if( charge < 0.00) SetUberChargePercent(0)
	}
}

function CTFWeaponBase::ModifySpells(index, max, compared = 1, mod_compare = 1)
{
	if ((compared % mod_compare) != 0) return

	if (GetSpellCharges() == 0)
	{
		SetSpellIndex(index)
		IncrementSpellCharge(1)
	}
	else if (index == GetSpellIndex() && GetSpellCharges() < max)
		IncrementSpellCharge(1)
}

function CTFWeaponBase::IsAbilityReady()
{
	if(!IsAbilityWeapon())
		return false
	if(GetAbilityType() == ABILITY_TIME)
		return GetScope(this).Timestamp <= Time()
	else if (GetAbilityType() == ABILITY_DAMAGE)
		return GetScope(this).DamageNeeded-GetScope(this).CurrentDamage <= 0
}

function CTFWeaponBase::SetAbilityTime(time)
	GetScope(this).Timestamp <- time
function CTFWeaponBase::AddAbilityTime(time)
	SetAbilityTime(Time() + time)

// TODO: Add to Snippets
function CTFWeaponBase::SetAbilityDamage(max_dmg, cur_dmg = 0.0)
{
	GetScope(this).DamageNeeded <- max_dmg.tofloat()
	GetScope(this).CurrentDamage <- cur_dmg.tofloat()
}
// TODO: Add to Snippets
function CTFWeaponBase::AddAbilityDamage(dmg)
	if(!("CurrentDamage" in GetScope(this))) { GetScope(this).CurrentDamage <- dmg } 
	else { GetScope(this).CurrentDamage += dmg }
// TODO: Add to Snippets
function CTFWeaponBase::ResetAbilityDamage()
	GetScope(this).CurrentDamage <- 0.0
// TODO: Add to Snippets
function CTFWeaponBase::GetAbilityDamage()
	return "CurrentDamage" in GetScope(this) ? GetScope(this).CurrentDamage : 0.0
// TODO: Add to Snippets
function CTFWeaponBase::SetAbilityType(type)
	if(type != ABILITY_REMOVE)
		GetScope(this).__ABILITY_TYPE <- type
	else if("__ABILITY_TYPE" in GetScope(this)) delete GetScope(this).__ABILITY_TYPE
// TODO: Add to Snippets
function CTFWeaponBase::GetAbilityType()
	return "__ABILITY_TYPE" in GetScope(this) ? GetScope(this).__ABILITY_TYPE : ABILITY_REMOVE
// TODO: Add to Snippets
function CTFWeaponBase::IsAbilityActive()
	return "AbilityActive" in GetScope(this) ? GetScope(this).AbilityActive : false

// TODO: Add to Snippets
function CTFWeaponBase::SetRandomSpell(rares = true, lower_rares = false)
{
	local spell = RandomInt(TF_SPELL_FIREBALL, rares ? TF_SPELL_SKELETON : TF_SPELL_TELEPORT)
	if(lower_rares && spell > TF_SPELL_TELEPORT && RandomFloat(0, 1.0) > 0.333)
	{
		spell = RandomInt(TF_SPELL_FIREBALL, TF_SPELL_TELEPORT)
	}
	SetSpellIndex(spell)
	SetSpellCharges(SpellDefaults[spell+2])
}
// TODO: Add to Snippets
function CTFWeaponBase::ShootPosition()
{
	local offset = null
	local zOffset =  GetOwner().GetFlags() & FL_DUCKING ? 8.0 : -3.0
	switch (GetIDX())
	{
	case 441: // The Cow Mangler
		offset = Vector(23.5, 8.0, zOffset)
		break
	case 513: // The Original
		offset = Vector(23.5, 0.0, zOffset)
		break
	case 18: // Rocket Launcher
	case 127: // The Direct Hit
	case 1104: // The Air Strike
	case 205: // Rocket Launcher (Renamed/Strange)
	case 228: // The Black Box
	case 237: // Rocket Jumper
	case 414: // The Liberty Launcher
	case 658: // Festive Rocket Launcher
	case 730: // The Beggar's Bazooka
	case 800: // Silver Botkiller Rocket Launcher Mk.I
	case 809: // Gold Botkiller Rocket Launcher Mk.I
	case 889: // Rust Botkiller Rocket Launcher Mk.I
	case 898: // Blood Botkiller Rocket Launcher Mk.I
	case 907: // Carbonado Botkiller Rocket Launcher Mk.I
	case 916: // Diamond Botkiller Rocket Launcher Mk.I
	case 965: // Silver Botkiller Rocket Launcher Mk.II
	case 974: // Gold Botkiller Rocket Launcher Mk.II
	case 1085: // Festive Black Box
	case 15006: // Woodland Warrior
	case 15014: // Sand Cannon
	case 15028: // American Pastoral
	case 15043: // Smalltown Bringdown
	case 15052: // Shell Shocker
	case 15057: // Aqua Marine
	case 15081: // Autumn
	case 15104: // Blue Mew
	case 15105: // Brain Candy
	case 15129: // Coffin Nail
	case 15130: // High Roller's
	case 15150: // Warhawk
	case 39: // The Flare Gun
	case 351: // The Detonator
	case 595: // The Manmelter
	case 740: // The Scorch Shot
	case 1081: // Festive Flare Gun
		offset = Vector(23.5, 12.0, zOffset)
		break
	case 56: // Hunstman
	case 1005: // Festive Huntsman
	case 1092: // The Fortified Compound
	case 997: // Rescue Ranger
	case 305: // Crusader's Crossbow
	case 1079: // Festive Crusader's Crossbow
		offset = Vector(23.5, 12.0, -3.0)
		break
	case 442: // The Righteous Bison
	case 588: // The Pomson 6000
		offset = Vector(23.5, 8.0, zOffset)
		break
	case 222: // The Mad Milk
	case 1121: // Mutated Milk
	case 1180: // Gas Passer
	case 58: // Jarate
	case 751: // Festive Jarate
	case 1105: // The Self-Aware Beauty Mark
	case 19: // Grenade Launcher
	case 206: // Grenade Launcher (Renamed/Strange)
	case 308: // The Loch-n-Load
	case 996: // The Loose Cannon
	case 1007: // Festive Grenade Launcher
	case 1151: // The Iron Bomber
	case 15077: // Autumn
	case 15079: // Macabre Web
	case 15091: // Rainbow
	case 15092: // Sweet Dreams
	case 15116: // Coffin Nail
	case 15117: // Top Shelf
	case 15142: // Warhawk
	case 15158: // Butcher Bird
	case 20: // Stickybomb Launcher
	case 207: // Stickybomb Launcher (Renamed/Strange)
	case 130: // The Scottish Resistance
	case 265: // Sticky Jumper
	case 661: // Festive Stickybomb Launcher
	case 797: // Silver Botkiller Stickybomb Launcher Mk.I
	case 806: // Gold Botkiller Stickybomb Launcher Mk.I
	case 886: // Rust Botkiller Stickybomb Launcher Mk.I
	case 895: // Blood Botkiller Stickybomb Launcher Mk.I
	case 904: // Carbonado Botkiller Stickybomb Launcher Mk.I
	case 913: // Diamond Botkiller Stickybomb Launcher Mk.I
	case 962: // Silver Botkiller Stickybomb Launcher Mk.II
	case 971: // Gold Botkiller Stickybomb Launcher Mk.II
	case 1150: // The Quickiebomb Launcher
	case 15009: // Sudden Flurry
	case 15012: // Carpet Bomber
	case 15024: // Blasted Bombardier
	case 15038: // Rooftop Wrangler
	case 15045: // Liquid Asset
	case 15048: // Pink Elephant
	case 15082: // Autumn
	case 15083: // Pumpkin Patch
	case 15084: // Macabre Web
	case 15113: // Sweet Dreams
	case 15137: // Coffin Nail
	case 15138: // Dressed to Kill
	case 15155: // Blitzkrieg
		offset = Vector(16.0, 8.0, -6.0)
		break
	case 17: // Syringe Gun
	case 204: // Syringe Gun (Renamed/Strange)
	case 36: // The Blutsauger
	case 412: // The Overdose
		offset = Vector(16.0, 6.0, -8.0)
		break
	case 812: // The Flying Guillotine
	case 833: // The Flying Guillotine (Genuine)
		offset = Vector(32.0, 0.0, 15.0)
		break
	case 528: // The Short Curcuit
		offset = Vector(40.0, 15.0, -10.0)
		break
	case 44: // Sandman
	case 648: // The Wrap Assassin
		return GetOwner().GetOrigin() + GetOwner().GetModelScale() *
				(GetOwner().EyeAngles().Forward() * 32.0 + Vector(0.0, 0.0, 50.0))
	default:
		return GetOwner().EyePosition()
	}


	if(GetClientConVar("cl_flipviewmodels", GetOwner().entindex()) == "1")
		offset.y *= -1

	local eye_angles = GetOwner().EyeAngles()
	return GetOwner().EyePosition() +
			eye_angles.Up() * offset.z +
			eye_angles.Left() * offset.y +
			eye_angles.Forward() * offset.x
}
// TODO: Add to Snippets
function CTFWeaponBase::IsWearable()
	return IsInArray(GetIDX(), WearableIDXs.Primarys) || IsInArray(GetIDX(), WearableIDXs.Secondarys)
// TODO: Add to Snippets
function CTFWeaponBase::IsSniperRifle()
	return startswith(GetClassname().slice(10), "sniperrifle")
// TODO: Add to Snippets
function CTFWeaponBase::IsBow()
	return startswith(GetClassname().slice(10), "compound")
// TODO: Add to Snippets
function CTFWeaponBase::IsMinigun()
	return startswith(GetClassname().slice(10), "minigun")
// TODO: Add to Snippets
function CTFWeaponBase::GetSpeedMod()
{
	if(!GetAttribute("mod shovel speed boost", 0))
		return 1.0
	local healthRatio = GetHealth().tofloat() / GetMaxHealth().tofloat()
	if ( healthRatio > 0.8 )
		return 1.0
	else if ( healthRatio > 0.6 )
		return 1.1
	else if ( healthRatio > 0.4 )
		return 1.2
	else if ( healthRatio > 0.2 )
		return 1.4
	else
		return 1.6
}
// TODO: Add to Snippets
function CTFWeaponBase::GetSwordSpeedMod()
{
	if(!GetOwner())
		return 1.0
	return 1.0 + (MATH.Min( MAX_DECAPITATIONS, GetPropInt(GetOwner(), "m_Shared.m_iDecapitations") ) * 0.08);
}


::CopyAttributes <- {
	"fire rate bonus" : 1
	"fire rate penalty" : 1
	"fire rate bonus hidden " : 1
	"damage bonus" : 1
	"damage bonus" : 1
	"override projectile type" : 0
}

function ROOT::CopyAttributesFromWeapons(weapon, new_weapon)
{
	foreach (attribute, def in CopyAttributes)
	{
		new_weapon.AddAttribute(attribute, weapon.GetAttribute(attribute, def), 0)
		if(weapon.GetAttribute(attribute, def) != def)
			printf("Copied Attribute %s with value %f from %s to %s\n", attribute, weapon.GetAttribute(attribute, def), weapon.tostring(), new_weapon.tostring())
	}
}

function ROOT::GetItemModelName(ItemID)
{
	local wearable = CreateByClassname("tf_wearable")
	
	wearable.SetAbsAngles(QAngle(0,0,0))
	SetPropInt(wearable, "m_fEffects", 32)
	wearable.SetSolidFlags(4)
	wearable.SetCollisionGroup(11)
	
	local pootis = ItemID & ( (1 << 16) - 1)
	
	SetPropInt(wearable, "m_AttributeManager.m_Item.m_iItemDefinitionIndex", pootis)
	SetPropInt(wearable, "m_AttributeManager.m_Item.m_bInitialized", 1)
	
	wearable.DispatchSpawn()

	local modelname = wearable.GetModelName()
	wearable.Kill()
	
	return modelname
}

::NoFormatToEcon <- [
	"GetSpellCharges",
	"AddAbilityTime",
	"SetAbilityTime",
	"ModifySpells",
	"SetSpellIndex",
	"GetSpellIndex",
	"DecreaseUberChargePercent",
	"GetUberChargePercent",
	"SetUberChargePercent",
	"IncreaseUberChargePercent",
	"IncrementSpellCharge",
	"SetSpellCharges",
	"SetChargeTime",
	"GetChargeTime",
	"GetDefaultChargeTime",
]
foreach ( key, value in CTFWeaponBase )
{
	if ( typeof( value ) == "function" )
	{
		if(NoFormatToEcon.find(key) != null)
			continue
		CEconEntity[ key ] <- value
	}
}

function CEconEntity::IsMeleeWeapon()
	return false

function CEconEntity::GetSlot()
	return -1

function CTFBaseBoss::Disabledamage( events = true )
	SetPropInt(this, "m_takedamage", events ? DAMAGE_EVENTS_ONLY : DAMAGE_NO)

function CTFBaseBoss::RegisterHurtPercentCallback(perc, callback)
{
	local OutputName = format("OnHealthBelow%sPercent", perc.tostring())
	GetScope(this)[OutputName] <- callback
	ConnectOutput(OutputName, OutputName)
}

function CNavMesh::GetNav() 
{
	local t = {}
	GetAllAreas(t)
	return t
}

function CNavMesh::GetLargestArea( NoSpawns = false, SavedNav = false )
{
	local areas = SavedNav ? SavedNav : GetNav()
	local lArea = 0.0
	local lMesh = null
	foreach (_, mesh in areas)
	{
		if(NoSpawns && mesh.IsTFInSpawnroom())
			continue
		local a = mesh.GetArea()
		if(a > lArea)
		{
			lArea = a
			lMesh = mesh
		}
	}
	return lMesh
}

function CTFNavArea::GetArea()
	return sqrt(GetSizeX()*GetSizeY())

function CTFNavArea::GetLargestSide()
	return GetSizeX() > GetSizeY() ? GetSizeX() : GetSizeY()

function CTFNavArea::IsTFInSpawnroom()
	return HasAttributeTF(TF_NAV_SPAWN_ROOM_BLUE) || HasAttributeTF(TF_NAV_SPAWN_ROOM_RED)


function ROOT::GetWeaponInSlot(player = null, slot = 0)
{
	if( !player ) return null
	DeprecatedWarning(getstackinfos(1), getstackinfos(2))
	return player.GetWeaponInSlot(slot)
}

function ROOT::CleanUpAndFormatString(msg, ...)
{
	if(msg == null)
		msg = "NULL"
	else 
		msg = msg.tostring()

	local args = vargv

	local leng = args.len()

	for (local i = 0; i < leng; i++) 
	{
		if(args[i] == null)
			args[i] = "NULL"
	}
	// this shit will break at one time
	try {
	if (leng > 0)
		msg = format.acall([this, msg].extend(args))
	}
	catch (e)
		return "SHIT ERRORED OUT STILL   "+e+"    "+__LINE__

	return msg
}

///////// Printing functions
////// HUD PRINTS //////
function ROOT::PrintToHudAll(msg)
	ClientPrint(null, HUD_PRINTCENTER, msg == null ? NULL_S : msg.tostring())
	
function ROOT::PrintToHudAllF(msg, ...)
	ClientPrint(null, HUD_PRINTCENTER, CleanUpAndFormatString.acall([this, msg].extend(vargv)))

function ROOT::PrintToHudAllFilter(msg, filter = [])
{
	ReCalculatePlayers()
	local plrs = Players.filter(@(i, p) !IsInArray(p, filter))
	foreach (player in plrs)
		player.PrintToHud(msg)
}
///// CHAT PRINTS /////
function ROOT::PrintToChatAll(msg)
	ClientPrint(null, HUD_PRINTTALK, msg == null ? NULL_S : msg.tostring())

function ROOT::PrintToChatAllF(msg, ...)
	ClientPrint(null, HUD_PRINTTALK, CleanUpAndFormatString.acall([this, msg].extend(vargv)))

function ROOT::TranslateToChatAll( ... )
{
	foreach (player in m_aHumans)
		player.TranslateToChat.acall([player].extend(vargv))
}

function ROOT::PrintToChatAllFilter(msg, filter = [])
{
	ReCalculatePlayers()
	local plrs = Players.filter(@(i, p) !IsInArray(p, filter))
	foreach (player in plrs)
		player.PrintToChat(msg)
}

///// CONSOLE PRINTS /////
// TODO: Add to Snippets
function ROOT::PrintToConsoleAll(msg)
	ClientPrint(null, HUD_PRINTCONSOLE, msg == null ? NULL_S : msg.tostring())

function ROOT::PrintToConsoleAllF(msg, ...)
	ClientPrint(null, HUD_PRINTCONSOLE, CleanUpAndFormatString.acall([this, msg].extend(vargv)))

///// OTHER PRINTS /////
function ROOT::PrintToAdmins(level, message)
{
	foreach (player in m_aHumans)
	{
		if(player.IsAdmin())
		{
			ClientPrint(player, level, message)
		}
	}
}

function ROOT::PrintTable(table, filter = [])
	PrintCollection(table, filter)

function ROOT::PrintArray(array, filter = [])
	PrintCollection(array, filter)
// TODO: Add to Snippets
function ROOT::PrintClass(clas, filter = [])
	PrintCollection(clas, filter)

function ROOT::PrintCollection(collection, filter = [], indentation = 0, no_indent_header = false)
{
	local type = typeof collection
	if(type != "table" && type != "array" && type != "class")
	{
		PrintToConsoleAll("Trying to PrintCollection() a " + type)
		return
	}

	Assert(indentation >= 0, "Indentation Cannot be Negative in ROOT::PrintCollection()")

	// Calculate indentation
	local indents = ""
	for (local i = 0; i < indentation; i++) {
		indents += "\t"
	}

	PrintToConsoleAll((no_indent_header ? "" : indents) + collection.tostring() + " " + ((type == "table" || type == "class") ? "{" : "["))
	foreach (key, value in collection)
	{
		// Skip internal Squirrel variables and filtered keys
		if(key == "__vname" || key == "__vrefs") continue
		if(IsInArray(key, filter)) continue

		local valType = typeof value
		if(IsInArray(valType, filter)) continue
		
		local itemIndents = indents + "\t"
		
		// If it's an array, show [index] for clarity
		local keyDisplay = (type == "array") ? "[" + key + "]" : key
		
		if(valType == "table" || valType == "array" || valType == "class")
		{
			print(itemIndents + keyDisplay + " : ")
			PrintCollection(value, filter, indentation + 1, true)
		}
		else if(valType == "function" || valType == "native function")
			PrintToConsoleAll(itemIndents + "function (" + keyDisplay + "): " + value)
		else
			PrintToConsoleAll(itemIndents + keyDisplay + " : " + value)
	}
	PrintToConsoleAll(indents + ((type == "table" || type == "class") ? "}" : "]"))
}

//// Entity Debug
function ROOT::ShowBBOX(entity = null, rgba = Vector(255, 0, 0), alpha = 5, duration = 5)
{
	Assert(entity, "ROOT::ShowBBOX Missing Entity")
	DebugDrawBox(entity.GetOrigin(), entity.GetBoundingMins(), entity.GetBoundingMaxs(), rgba.x, rgba.y, rgba.z, alpha,  duration)
}

function ROOT::ShowOBB(entity = null, rgba = Vector(255, 0, 0), alpha = 5, duration = 5)
{
	Assert(entity, "ROOT::ShowOBB Missing Entity")
	DebugDrawBoxAngles(entity.GetOrigin(), entity.GetBoundingMins(), entity.GetBoundingMaxs(), entity.GetAbsAngles(), Vector(rgba.x, rgba.y, rgba.z), alpha, duration)
}

function ROOT::ShowAABB(entity = null, rgba = Vector(255, 0, 0), alpha = 5, duration = 5)
{
	Assert(entity, "ROOT::ShowAABB Missing Entity")
	DebugDrawBox(entity.GetOrigin(),entity.GetBoundingMins(), entity.GetBoundingMaxs(), rgba.x, rgba.y, rgba.z, alpha, duration)
}

function ROOT::DebugDrawTrigger(trigger = null, color = Vector(255, 128, 0), alpha = 5, duration = 5)
{
	Assert(trigger, "ROOT::DebugDrawTrigger Missing Trigger")

	if (trigger.GetSolid() == 2)
		DebugDrawBox(trigger.GetOrigin(), GetPropVector(trigger, "m_Collision.m_vecMins"), GetPropVector(trigger, "m_Collision.m_vecMaxs"), color.x, color.y, color.z, alpha, duration)
	else if (trigger.GetSolid() == 3)
		DebugDrawBoxAngles(trigger.GetOrigin(), GetPropVector(trigger, "m_Collision.m_vecMins"), GetPropVector(trigger, "m_Collision.m_vecMaxs"), trigger.GetAbsAngles(), Vector( color.x, color.y, color.z ), alpha, duration)
}

function ROOT::IsListenServer()
	return !IsDedicatedServer()
	
//// Entity Functions
function ROOT::EnableStringPurge(entity)
{
	if( !entity )
		return entity
	SetPropBool(entity, "m_bForcePurgeFixedupStrings", true)
	return entity
}

/// Credit to LizardOfOz in TF2Maps Discord
function ROOT::CreateByClassname(classname)
	return EnableStringPurge(Entities.CreateByClassname(classname))

/// DISPATCH SPAWN NOT NEEDED

function ROOT::FindByClassname(previous, classname)
	return EnableStringPurge(Entities.FindByClassname(previous, classname))

function ROOT::FindByClassnameNearest(classname, center,radius)
	return EnableStringPurge(Entities.FindByClassnameNearest(classname, center, radius))

function ROOT::FindByClassnameWithin(previous, classname, center, radius)
	return EnableStringPurge(Entities.FindByClassnameWithin(previous, classname, center, radius))
// TODO: Add to Snippets
function ROOT::FindByModel(previous, modelname)
	return EnableStringPurge(Entities.FindByModel(previous, modelname))

function ROOT::FindByName(previous, name)
	return EnableStringPurge(Entities.FindByName(previous, name))

function ROOT::FindByNameNearest(targetname, center, radius)
	return EnableStringPurge(Entities.FindByNameNearest(targetname, center, radius))

function ROOT::FindByNameWithin(previous, targetname, center, radius)
	return EnableStringPurge(Entities.FindByNameWithin(previous, targetname, center, radius))
// TODO: Add to Snippets
function ROOT::FindByTarget(previous, target)
	return EnableStringPurge(Entities.FindByTarget(previous, target))
// TODO: Add to Snippets
function ROOT::FindInSphere(previous, center, radius)
	return EnableStringPurge(Entities.FindInSphere(previous, center, radius))
// TODO: Add to Snippets
function ROOT::First()
	return EnableStringPurge(Entities.First())
// TODO: Add to Snippets
function ROOT::Next(previous)
	return EnableStringPurge(Entities.Next(previous))



if (!("SpawnEntityFromTableOriginal" in ROOT))
   ::SpawnEntityFromTableOriginal <- ::SpawnEntityFromTable
function ROOT::SpawnEntityFromTable(name, keyvalues)
	return EnableStringPurge(SpawnEntityFromTableOriginal(name, keyvalues))
if (!("_AddThinkToEnt" in ROOT))
{
	::_AddThinkToEnt <- AddThinkToEnt
	function ROOT::AddThinkToEnt(entity, think_func)
	{
		_AddThinkToEnt(entity, think_func == null ? "" : think_func)
		PurgeString(think_func)
		PurgeString(entity)
	}
}

function ROOT::GetScope(entity)
{
	if(!entity || !entity.IsValid())
		return null
	entity.ValidateScriptScope()
	return entity.GetScriptScope()
}


::THINKER_PERSIST <- 0
::THINKER_NO_PERSIST <- 1

function ROOT::CreateThinker(name, think_func, type = THINKER_NO_PERSIST)
{
	local Thinker = FindByName(null, name)
	if (Thinker == null) Thinker = SpawnEntityFromTable( type == THINKER_PERSIST ? "info_target" : "info_teleport_destination", { targetname = name })
	 
	if(typeof think_func == "string")
		AddThinkToEnt(Thinker, think_func)
	else if (typeof think_func == "function")
	{
		GetScope(Thinker).think <- think_func
		AddThinkToEnt(Thinker, "think")
	}
	return Thinker
}

function ROOT::GetPlayerReadyCount()
{
	if ( IsWaveStarted() ) 
		return 0

	local ready = 0

	local size = GetPropArraySize( Gamerules, "m_bPlayerReady" )

	for ( local i = 0; i < size; i++ ) 
		if ( GetPropBoolArray( Gamerules, "m_bPlayerReady", i ) )
			ready++

	return ready
}
// TODO: Add to Snippets
function ROOT::IsWaveStarted()
{
	if(!FindByClassname(null, "tf_gamerules"))
		return false
	if(!("IsWaveStarted" in GetScope(Gamerules)))
		GetScope(Gamerules).IsWaveStarted <- false
	return GetScope(Gamerules).IsWaveStarted
}
// TODO: Add to Snippets
function ROOT::StringToArray(string)
{
	local char_array = []
	for (local i = 0; i < string.len(); i++) {
		char_array.push(string.slice(i, i + 1))
	}
	return char_array
}
// TODO: Add to Snippets
function ROOT::ArrayToString(array)
{
	local str = ""
	foreach(item in array)
		str += item.tostring()
	return str
}
// TODO: Add to Snippets
function ROOT::IsStringATrigger(string, triggers = ["/", "!"])
	return IsInArray(StringToArray(string)[0], triggers)
// TODO: Add to Snippets
function ROOT::RemoveChatTrigger(string, triggers = ["/", "!"])
{
	if(!IsStringATrigger(string, triggers))
		return string
	return ArrayToString(StringToArray(string).slice(1))
}

//// Get Every/All Entitys functions
function ROOT::GetAllEntitiesByClassname(classname)
{
	local list = []
	for (local entity; entity = FindByClassname(entity, classname); )
	{
		if(entity != null) list.append(entity)
	}
	return list
}
function ROOT::GetAllEntitiesByClassnameWithin(classname, center, radius)
{
	local list = []
	for (local entity; entity = FindByClassnameWithin(entity, classname, center, radius); )
	{
		if(entity != null) list.append(entity)
	}
	return list
}
function ROOT::GetAllEntitiesByTargetname(targtetname)
{
	local list = []
	for (local entity; entity = FindByName(entity, targtetname); )
	{
		if(entity != null) list.append(entity)
	}
	return list
}
function ROOT::GetAllEntitiesByTargetnameWithin(targtetname, center, radius)
{
	local list = []
	for (local entity; entity = FindByNameWithin(entity, targtetname, center, radius); )
	{
		if(entity != null) list.append(entity)
	}
	return list
}

function ROOT::GetAllPlayers(team = false, radius = false, alive = true)
{
	local players = []
 
	if (radius)
	{
		foreach (player in GetAllEntitiesByClassnameWithin("player", radius[0], radius[1]))
		{
			if (team) { if (player.GetTeam() != team) continue }
			if (alive) { if (!player.IsAlive()) continue }
			
			players.append(player)
		}
	}
	else
	{
		foreach (player in GetAllEntitiesByClassname("player"))
		{
			if (team) { if (player.GetTeam() != team) continue }
			if (alive) { if (!player.IsAlive()) continue }
			
			players.append(player)
		}
	}
	return players
}


//
function ROOT::GetEveryTank()
{
	local list = []
	foreach	(tank in GetAllEntitiesByClassname("tank_boss"))
	{
		if(tank != null) list.append(tank)
	}
	return list
}
function ROOT::GetEveryTankWithin(center, radius)
{
	local list = []
	foreach (tank in GetAllEntitiesByClassnameWithin("tank_boss", center, radius))
	{
		if(tank != null) list.append(tank)
	}
	return list
}

::Gamerules 		<- FindByClassname(null, "tf_gamerules")
::MvMStats 			<- FindByClassname(null, "tf_mann_vs_machine_stats")
::PlayerManager 	<- FindByClassname(null, "tf_player_manager")
::ObjResource 		<- FindByClassname(null, "tf_objective_resource")
::Worldspawn 		<- Entities.First()

function ROOT::GetCurrentWaveNumber()
	return GetPropInt(ObjResource, "m_nMannVsMachineWaveCount")

function ROOT::GetMaximumWaveNumber()
	return GetPropInt(ObjResource, "m_nMannVsMachineMaxWaveCount")

function ROOT::GetPopfileName()
	return GetPropString(ObjResource, "m_iszMvMPopfileName")

function ROOT::SetPopfileName(name)
	SetPropString(ObjResource, "m_iszMvMPopfileName", name)
// TODO: Add to Snippets
function ROOT::dummy_ent() {
	// logic_relay does not take up an edict
	local relay = CreateByClassname("logic_relay")
	relay.ValidateScriptScope()
	return relay
}
// TODO: Add to Snippets
function ROOT::RunWithDelay(func, delay = 0.0)
{
	local dummy = dummy_ent()
	dummy.GetScriptScope()["Run"] <- function()
	{
		dummy.Kill()
		func()
	}.bindenv(this)

	EntFireByHandle(dummy, "CallScriptFunction", "Run", delay, null, null)
	return dummy
}

function ROOT::CreateTimer(on_timer_func, first_delay = 0.0)
{
	local dummy = dummy_ent()
	dummy.GetScriptScope()["Run"] <- function()
	{
		try
		{
			local delay = on_timer_func()

			if (delay == null)
			{
				dummy.Kill()
				return
			}

			// Delays which are less or equal to 0 will be executed in the current tick which leads to an infinite loop
			if (delay <= 0.0)
				delay = 0.01

			EntFireByHandle(dummy, "CallScriptFunction", "Run", delay, null, null)
		}
		catch (err)
		{
			dummy.Kill()
			throw err
		}
	}.bindenv(this)

	EntFireByHandle(dummy, "CallScriptFunction", "Run", first_delay, null, null)
	return dummy
}
// TODO: Add to Snippets
function ROOT::KillTimer(timer)
{
	if (timer.IsValid())
		timer.Kill()
}
// TODO: Add to Snippets
function ROOT::FireTimer(timer)
{
	if (timer.IsValid())
	{
		timer.GetScriptScope()["Run"]()
		KillTimer(timer)
	}
}

/* 
// Example

local fired = false
local timer = CreateTimer(function()
{
	if (!fired)
	{
		printl("This is the first fire")
		fired = true
		// Repeat after 1 second
		return 1.0
	}
	else
	{
		printl("This is not a first fire")
		// repeat after 2 seconds
		return 2.0
	}
// First fire will be after 1 second
}, 1.0)

// Fire and kill the timer after 7 seconds
RunWithDelay(@() printl("Firing and killing a timer..."), 7.0)
RunWithDelay(@() FireTimer(timer), 7.0)
 */


//// Helps make code look nice
function ROOT::IsNotInScope(item, scope)
	return (!(item in scope))
function ROOT::IsNotInTable(item, table)
	return (!(item in table))
function ROOT::IsDamageTypeSpell(dmg_type)
	return dmg_type >= 65 && dmg_type <= 75
function ROOT::IsInArray(item, array)
	return array.find(item) != null


//// Misc player/entity Functions
function ROOT::IsPointInRespawnRoom(point)
{
	foreach (respawnroom in GetAllEntitiesByClassname("func_respawnroom"))
	{
		respawnroom.RemoveSolidFlags(FSOLID_NOT_SOLID)
		respawnroom.SetCollisionGroup(0)
		local trace =
		{
			start =     	point
			end =         	point
			mask =        	1
		}
		TraceLineEx(trace)
		respawnroom.AddSolidFlags(FSOLID_NOT_SOLID)
		respawnroom.SetCollisionGroup(TFCOLLISION_GROUP_RESPAWNROOMS)

		if(trace.hit && trace.enthit == respawnroom) return true
	}
	return false
}
function ROOT::IsHullInRespawnRoom(start, min, max)
{
	foreach (respawnroom in GetAllEntitiesByClassname("func_respawnroom"))
	{
		if(respawnroom.GetTeam() != TF_TEAM_PVE_DEFENDERS) continue

		respawnroom.RemoveSolidFlags(FSOLID_NOT_SOLID)
		respawnroom.SetCollisionGroup(0)
		local trace =
		{
			start =     	start
			end =         	start
			mask =        	1
			hullmin = 		min
			hullmax = 		max
		}
		TraceHull(trace)
		respawnroom.AddSolidFlags(FSOLID_NOT_SOLID)
		respawnroom.SetCollisionGroup(TFCOLLISION_GROUP_RESPAWNROOMS)

		if(trace.hit && trace.enthit == respawnroom) return true
	}
	return false
}

function ROOT::IsValidEnemy(entity)
{
	if(entity.GetTeam() != TF_TEAM_PVE_INVADERS) return false

	foreach(classname in [ "player", "tank_boss", "obj_dispenser", "obj_sentrygun", "obj_teleporter" ])
	{
		if(entity.GetClassname() == classname)
		{
			return true
		}
	}
	return false
}
// TODO: Add to Snippets
function ROOT::CanPointSeePoint(point1, point2)
{
	local trace = {
		start = point1
		end = point2
		mask = MASK_WORLD
	}
	TraceLineEx(trace)
	// DebugDrawLine_vCol(trace.start, trace.endpos, Vector(0, 0, 255), false, 5)
	return !trace.hit
}
// end deprecated
function ROOT::GetBuilder(entity)
{
	EnableStringPurge(entity)
	if(!HasProp(entity, "m_hBuilder")) return null

	local entity = GetPropEntity(entity, "m_hBuilder")
	return EnableStringPurge(entity)
}

function ROOT::GetLauncher(entity)
{
	EnableStringPurge(entity)
	if(!HasProp(entity, "m_hLauncher")) return null

	local entity = GetPropEntity(entity, "m_hLauncher")
	return EnableStringPurge(entity)
}

function ROOT::GetFlagStatus(flag)
{
	if(!flag) return null
	EnableStringPurge(flag)
	if(!HasProp(flag, "m_nFlagStatus")) return null
	return GetPropInt(flag, "m_nFlagStatus")
}

function ROOT::GetState(entity)
{
	EnableStringPurge(entity)
	if(!HasProp(entity, "m_iState")) return null
	return GetPropInt(entity, "m_iState")
}

function ROOT::ClearThinks(entity)
{
	SetPropString(entity, "m_iszScriptThinkFunction", "")
	AddThinkToEnt(entity, "")
}

function ROOT::IsBuilding(object)
{
	return startswith(object.GetClassname(), "obj_")
}

function ROOT::IsTank(object)
{
	return endswith(object.GetClassname(), "boss")
}

function ROOT::IsBuildingValid(building)
{
	if(!building) return null
	EnableStringPurge(building)
	if(!HasProp(building, "m_bServerOverridePlacement")) return null
	return GetPropBool(building, "m_bServerOverridePlacement")
}

function ROOT::EmitGlobalSound(info)
	EmitSoundEx({
		sound_name = info.sound_name
		channel = "channel" in info ? info.channel : 0
		// sound_level = "sound_level" in info ? info.sound_level : 0
		pitch = "pitch" in info ? info.pitch : 100
		// origin = "origin" in info ? info.origin : Vector(0, 0, 0)
		// entity = "entity" in info ? info.entity : null
		filter_type = RECIPIENT_FILTER_GLOBAL
	})
// TODO: Add to Snippets
function ROOT::GetSentryAngles(sentry)
{
	return QAngle((GetPropFloatArray(sentry, "m_flPoseParameter", 0) * -100 + 50) * DEG2RAD, (GetPropFloatArray(sentry, "m_flPoseParameter", 1) * -360 + 180 + sentry.GetAbsAngles().y) * DEG2RAD, 0)
}
// TODO: Add to Snippets
function ROOT::ConvertAngleToEndpoint(Angle, length = 600)
{
	return Vector(cos(Angle.Pitch()) * cos(Angle.Yaw()), cos(Angle.Pitch()) * sin(Angle.Yaw()), -sin(Angle.Pitch())) * length
}
// TODO: Add to Snippets
function ROOT::SetDestroyCallback(entity, callback)
{
	local scope = GetScope(entity)
	scope.setdelegate({}.setdelegate({
			parent   = scope.getdelegate()
			id       = entity.GetScriptId()
			index    = entity.entindex()
			callback = callback
			_get = function(k)
			{
				return parent[k]
			}
			_delslot = function(k)
			{
				if (k == id)
				{
					entity = EntIndexToHScript(index)
					local scope = GetScope(entity)
					scope.self <- entity
					callback.pcall(scope)
				}
				delete parent[k]
			}
		})
	)
}

//// Developer?

// RealTime() // returns real time (independent of game) in seconds
// BeginBenchmark() // starts time measurement
// EndBenchmark() // ends time measurement and returns high-precision time elapsed in milliseconds
// PushBenchmark() // pushes current real time onto internal stack (useful for recursive time measurement)
// PopBenchmark() // pops from the stack and returns the high-precision time elapsed in milliseconds
function ROOT::IsBenchmarkLoaded()
	return "BeginBenchmark" in ROOT

function ROOT::StartBenchmark()
{
	if(IsBenchmarkLoaded())
		BeginBenchmark()
	else
		error("Warning Benchmarking is not enabled, please load the extension\n")
}
function ROOT::StopBenchmark()
{
	if(IsBenchmarkLoaded())
		return EndBenchmark()
	else
		error("Warning Benchmarking is not enabled, please load the extension\n")
	return null
}
function ROOT::PrintBenchmarkTime(text = "")
{
	if(IsBenchmarkLoaded())
		return printf(text + "%.5f ms\n", StopBenchmark())
	else 
		StopBenchmark()
}

function ROOT::SetCvar(convar, value, admin_notify = false, notify_all = false)
{
	if(!IsConvarAllowed(convar))
	{
		PrintToAdmins(3, "\x07FF0000fatcat_library::SetCvar: \x01Warning Cvar \x03" + convar + "\x01 is Not on the Allowlist!")
		PrintToAdmins(2, "fatcat_library::SetCvar: Warning Cvar \"" + convar + "\" is Not on the Allowlist!")
		return
	}

	Convars.SetValue(convar, value)
	if( notify_all )
		PrintToChatAll("Server cvar \'" + convar + "\' changed to " + value)
	else if( admin_notify )
		PrintToAdmins(3, "Server cvar \'" + convar + "\' changed to " + value)
}

function ROOT::IsPotato()
	return "__potato" in ROOT

function ROOT::EntFireNew(target, action, input = "", delay = -1, activator = null, caller = null)
{
	if(typeof target != "string" && target.IsPlayer() && action == "RunScriptCode")
	{
		target.RunScriptCode(input, delay)
		return
	}
		
	if(type(target) == "string")
		DoEntFire(target, action, input, delay, activator, caller)
	else if(type(target) == "instance")
		EntFireByHandle(target, action, input, delay, activator, caller)
	PurgeString(action)
	PurgeString(input)
}

function ROOT::CreateKillIcon(icon)
{
	if(FindByClassname(null, icon))
		return FindByClassname(null, icon)
	local classicon = SpawnEntityFromTable( "info_target", { classname = icon })
	// dont know if we want to Create a class icon forever
	// and access it after puting into a global variable
	// ROOT[icon] <- classicon
	PurgeString(icon)
	return classicon;
}

function ROOT::PurgeString(string)
{
	return; // this sometime dont work
	if ( !string || !( 0 in string ) )
		return

	local temp = CreateByClassname( "info_null" )
	SetPropString( temp, "m_iName", string )
	SetPropBool( temp, "m_bForcePurgeFixedupStrings", true )
	temp.DispatchSpawn()
	// temp.Kill()
}

function ROOT::GetClientConVar(cvar, entindex)
	return Convars.GetClientConvarValue(cvar, entindex)

function ROOT::CreateTestTank(origin = Vector(0, 0, 0), angles = QAngle(0, 0, 0))
{
	if(FindByName(null, "Test_Tank"))
		FindByName(null, "Test_Tank").Kill()

	local tank = SpawnEntityFromTable("tank_boss", {
		targetname = "Test_Tank"
		health = (1<<31) - 1
	})
	tank.SetAbsOrigin(origin)
	tank.SetAbsAngles(angles)
	return tank
}

function ROOT::DrawTraceHull(trace, starting_color = Vector(255, 0, 0), ending_color = Vector(0, 0, 255))
{
	local max = "hullmax" in trace ? trace.hullmax : Vector(1, -1, 1)
	local min = "hullmin" in trace ? trace.hullmin : Vector(-1, 1, -1)

	if(!("endpos" in trace))
		trace.endpos <- Vector()

	DebugDrawBox(trace.start, min, max, starting_color.x, starting_color.y, starting_color.z, 30, 30)
	DebugDrawBox(trace.endpos, min, max, ending_color.x, ending_color.y, ending_color.z, 30, 30)

	local diffX = (trace.start.x-trace.endpos.x)
	local diffY = (trace.start.y-trace.endpos.y)
	local diffZ = (trace.start.z-trace.endpos.z)

	local difference = Vector(-1*(diffX), -1*(diffY), -1*(diffZ))
	local repeat = (difference.Length() / 25)
	for (local i = 1; i < repeat.tointeger(); i++) 
	{
		DebugDrawBox(trace.start + (difference * (i.tofloat() / repeat)), min, max, 0, 255, 0, 0, 30)
	}
}
function ROOT::DeprecatedWarning(info1, info2)
	error(format("FatCatLibrary::%s  :  %s on Line %i is running a Deprecated Version of %s\n", info1.func, info2.src, info2.line, info1.func))

function ROOT::IsEntityAProjectile(entity)
	return startswith(entity.GetClassname(), "tf_projectile")

// TODO: Add to Snippets
function ROOT::PrecacheObject(thing)
{
	local ret = 0
	if(thing.find(".mdl") != null || thing.find(".vmt") != null)
	{
		ret = PrecacheModel(thing)
	}
	else if (thing.find(".wav") != null || thing.find(".mp3") != null)
	{
		ret = PrecacheSound(thing)
		// PrecacheScriptSound(string)
	}
	else 
		throw format("Unknown Object Type in PrecacheObject: \"%s\"", thing)

	if(ret == null)
		return
	else if ( ret == -1 || ret == false )
		throw format("Failed to Precache Object \"%s\"", thing)
}
//// Math
::MATH <- {
	function BitWise(a, b)
	{
		return (a & b) == b
	}
	// Returns the smalller Value
	function Min(a, b)
	{
		return (b < a) ? b : a
	}
	// Returns the Larger Value
	function Max(a, b)
	{
		return (a < b) ? b : a
	}
	function Clamp( val, minVal, maxVal )
	{
		if ( maxVal < minVal )
			return maxVal;
		else if( val < minVal )
			return minVal;
		else if( val > maxVal )
			return maxVal;
		else
			return val;
	}
	function RemapVal(val, A, B, C, D)
	{
		if ( A == B )
			return val >= B ? D : C;
		return C + (D - C) * (val - A) * 1.0 / (B - A);
	}
	function RemapValClamped(val, A, B, C, D)
	{
		if ( A == B )
			return val >= B ? D : C;
		local cVal = (val - A) / (B - A);
		cVal = MATH.Clamp( cVal, 0.0, 1.0 );

		return C + (D - C) * cVal;
	}
	function ConvertRadiusToSndLvl(radius)
	{
		return (40 + (20 * log10(radius / 36.0))).tointeger()
	}
	function RandomVec(min, max)
	{
		local v = Vector()
		v.Random(min, max)
		return v
	}
	function Distance(point1, point2)
	{
		return (point1 - point2).Length()
	}
	// TODO: Add to Snippets
	function RandomChance()
	{
		return RandomFloat(0, 1)
	}
	// TODO: Add to Snippets
	function OneInChance(num)
	{
		return RandomChance() <= (1.0/num.tofloat())
	}
}
function Vector::Normalize()
{
	local new = this + ::Vector()
	new.Norm()
	return new
}

function Vector::Random(min, max)
{	//VALVE_RAND_MAX == 0x7FFF
	this.x = min + (::RandomInt(0, 0x7FFF).tofloat() / 0x7FFF) * (max - min);
	this.y = min + (::RandomInt(0, 0x7FFF).tofloat() / 0x7FFF) * (max - min);
	this.z = min + (::RandomInt(0, 0x7FFF).tofloat() / 0x7FFF) * (max - min);
}

function Vector::DistanceTo(point2)
{
	return (this-point2).Length()
}

function Vector2D::Normalize()
{
	local new = this + ::Vector2D()
	new.Norm()
	return new
}

function ROOT::DummyB( ... )
	return true
function ROOT::DummyN( ... )
	return 1
function ROOT::DummyV( ... )
	return Vector()


function ROOT::min(a, b)
{
	DeprecatedWarning(getstackinfos(1), getstackinfos(2))
	return (b < a) ? b : a;
}
function ROOT::max(a, b)
{
	DeprecatedWarning(getstackinfos(1), getstackinfos(2))
	return (a < b) ? b : a;
}

function ROOT::clamp( val, minVal, maxVal )
{
	DeprecatedWarning(getstackinfos(1), getstackinfos(2))
	if ( maxVal < minVal )
		return maxVal;
	else if( val < minVal )
		return minVal;
	else if( val > maxVal )
		return maxVal;
	else
		return val;
}
function ROOT::remapValue(val, A, B, C, D)
{
	DeprecatedWarning(getstackinfos(1), getstackinfos(2))
	if ( A == B )
		return val >= B ? D : C;
	return C + (D - C) * (val - A) / (B - A);
}
function ROOT::remapValueClamped(val, A, B, C, D)
{
	DeprecatedWarning(getstackinfos(1), getstackinfos(2))
	if ( A == B )
		return val >= B ? D : C;
	local cVal = (val - A) / (B - A);
	cVal = clamp( cVal, 0.0, 1.0 );

	return C + (D - C) * cVal;
}
function ROOT::ConvertRadiusToSndLvl(radius)
{
	DeprecatedWarning(getstackinfos(1), getstackinfos(2))
	return (40 + (20 * log10(radius / 36.0))).tointeger()
}

// function ROOT::GetVisibleEntities(ent, point, )

if(!("CORROSION_ICON" in ROOT))
	::CORROSION_ICON <- CreateKillIcon("infection_acid_puddle")
////
/**
 * Creates a base explosion to use
 * 
 * @param {entity} 		owner 				The player to report the damage to.
 * @param {entity|null}	[weapon] 			The weapon to give credit to. (Default: null)
 * @param {entity[]}	[ignores] 			The Entitys to ignore for the explosion (usually the victim). (Default: [])
 * @param {string} 		[sound] 			The sound to play on explosion. (Default: "")
 * @param {float} 		[radius] 			The radius of the explosion. (Default: 147.0)
 * @param {vector} 		[origin] 			The origin of the explosion. (Default: Vector())
 * @param {float} 		[damage] 			The damage dealt at the center. (Default: 90.0)
 * @param {float} 		[MinDamage] 		The damage dealt at the edge. (Default: damage/2.0)
 * @param {float} 		[DamageDeadzone]	The radius from the center where zero falloff occurs. (Default: 0.0)
 * @param {string}		[particle] 			The explosion particle. (Default: "")
 * @param {vector}		[particle_ang]		The angle of the explosion particle. (Default: QAngle(-90, 0, 0))
 * @param {vector}		[particle_offset]	How much to offset the explosion particle spawn. (Default: Vector())
 * @param {long}		[DmgType] 			The damage types to use (add DMG_RADIUS_MAX to ignore damage falloff). (Default: DMG_GENERIC|DMG_BLAST)
 * @param {float}		[SoundRadius]		The radius the sound travels. (Default: radius)
 * @param {float}		[SoundDelay]		Cooldown between explosion sounds. (Default: 0.5)
 * @param {function}	[ExplodeFunc]		Callback function for players hit. (Default: null)
 * @param {bool}		[FuncBeforeDmg]		If true, call ExplodeFunc before dealing damage. (Default: false)
 * @param {bool}		[FuncOnIgnore]		If true, call ExplodeFunc on ignored targets. (Default: false)
 * @param {bool}		[OnlyPlayers]		If true, only collect players to attack. (Default: false)
 * @param {bool}		[FuncIgnoreObjects]	If true, ignore non-players when calling ExplodeFunc. (Default: false)
 */
function ROOT::CreateBaseExplosion(table)
{
	local owner 			= "owner" 				in table ? table.owner 				: null
	local weapon 			= "weapon" 				in table ? table.weapon 			: null
	local sound 			= "sound" 				in table ? table.sound 				: ""
	local origin 			= "origin" 				in table ? table.origin 			: owner && owner.IsPlayer() ? owner.GetCenter() : Vector()
	local radius 			= "radius" 				in table ? table.radius 			: 147.0
	local damage 			= "damage" 				in table ? table.damage.tofloat() 	: 90.0
	local MinDamage 		= "MinDamage" 			in table ? table.MinDamage	 		: damage.tofloat()/2.0
	local DamageDeadzone 	= "DamageDeadzone" 		in table ? table.DamageDeadzone		: 0.0
	local trace 			= "trace" 				in table ? table.trace	 			: true
	local particle 			= "particle" 			in table ? table.particle 			: ""
	local particle_ang 		= "particle_ang"		in table ? table.particle_ang 		: QAngle(-90, 0, 0)
	local particle_offset 	= "particle_offset"		in table ? table.particle_offset 	: Vector()
	local DmgType 			= "DmgType" 			in table ? table.DmgType 			: DMG_GENERIC|DMG_BLAST
	local FuncBeforeDmg		= "FuncBeforeDmg"		in table ? table.FuncBeforeDmg 		: false
	local ExplodeFunc		= "ExplodeFunc"			in table ? table.ExplodeFunc		: function(player) { /* do what you want on explosion */ }
	local ignores			= "ignores"				in table ? table.ignores			: []
	local OnlyPlayers		= "OnlyPlayers"			in table ? table.OnlyPlayers		: false
	local FuncOnIgnore		= "FuncOnIgnore"		in table ? table.FuncOnIgnore 		: false
	local FuncIgnoreObjects	= "FuncIgnoreObjects"	in table ? table.FuncIgnoreObjects 	: false

	local SoundRadius 		= "SoundRadius" 		in table ? table.SoundRadius 		: radius
	local SoundDelay 		= "SoundDelay" 			in table ? table.SoundDelay 		: 0.5

	Assert(owner && owner.IsPlayer(), "CreateBaseExplosion currently need a owner")

	local scope = GetScope(owner)
	if(IsNotInScope("LastExplosionTime", scope))
		scope.LastExplosionTime <- 0

	if(sound != "")
		PrecacheSound(sound)

	// always update the list (could be expensive but this func is not run often)
	ReCalculatePlayers()

	local targets = Players.filter(@(i, p) p.GetTeam() != owner.GetTeam() )

	if(!OnlyPlayers)
	{
		targets.extend(GetAllEntitiesByClassnameWithin("tank_boss", origin, radius).filter(@(i, ent) ent.GetTeam() != owner.GetTeam() ))
		targets.extend(GetAllEntitiesByClassnameWithin("obj*", origin, radius).filter(@(i, ent) ent.GetClassname() != "obj_attachment_sapper").filter(@(i, ent) ent.GetTeam() != owner.GetTeam()))
	}

	DebugDrawClear()
	foreach (entity in targets)
	{
		local isIgnored = ignores.find(entity) != null
		local delta = entity.GetCenter() - origin
		local distance = delta.Length()

		if(distance > radius)
			continue

		if(trace && !CanPointSeePoint(origin, entity.GetCenter()))
			continue

		if(isIgnored)
		{
			if(FuncOnIgnore && (!FuncIgnoreObjects || entity.IsPlayer()))
				ExplodeFunc(entity)
			continue
		}

		local currentDamage = damage
		if(!MATH.BitWise(DmgType, DMG_RADIUS_MAX))
		{
			if (distance <= DamageDeadzone)
				currentDamage = damage
			else
				currentDamage = MATH.RemapVal(distance, DamageDeadzone, radius, damage, MinDamage)
			// printl("DEBUG: Dist: " + distance + " | Rad: " + radius + " | Deadzone: " + DamageDeadzone + " | Dmg: " + damage + " | MinDmg: " + MinDamage + " | Final: " + currentDamage)
		}
		// DebugDrawText(entity.GetCenter(),currentDamage.tostring(), false, 60)

		if(FuncBeforeDmg && (!FuncIgnoreObjects || entity.IsPlayer())) 
			ExplodeFunc(entity)
		entity.TakeDamageCustom(owner, owner, weapon, Vector(), Vector(), currentDamage, DmgType, TF_DMG_CUSTOM_TRIGGER_HURT)
		if(!FuncBeforeDmg && (!FuncIgnoreObjects || entity.IsPlayer())) 
			ExplodeFunc(entity)
	}

	DebugDrawCircle(origin, Vector(255, 0, 0), 50, radius, false, 15)
	DebugDrawCircle(origin+Vector(0,0,1), Vector(0, 0, 255), 50, DamageDeadzone, false, 15)

	if(particle != "")
	{
		local temp = SpawnEntityFromTable("info_particle_system", { effect_name = particle })
		temp.SetAbsOrigin(origin+particle_offset)
		temp.SetAbsAngles(particle_ang)
		temp.AcceptInput("Start", "", null, null)
		EntFireNew(temp, "Stop", "", TICK_DUR*3)
		EntFireNew(temp, "Kill", "", TICK_DUR*5)
	}

	if(sound != "" && scope.LastExplosionTime <= Time())
	{
		EmitSoundEx({
			sound_name = sound
			entity = owner
			origin = origin
			sound_level = MATH.ConvertRadiusToSndLvl(SoundRadius)
		})
		scope.LastExplosionTime <- Time() + SoundDelay
	}
}
/**
 * @param {entity} 		owner		The owner of the damage to report it back to.
 * @param {vector} 		center		The position to create the explosion.
 * @param {float} 		radius		How big the explosion can hit.
 * @param {float} 		maxDmg		The Maximum damage to deal.
 * @param {float} 		minDmg		The Minimum damage to deal.
 * @param {entity[]}	[ignore]	What entitys to ignore in the explosion. (Default: [])
 * @param {int}			[dmg_Type]	DMG_ type to mark the damage as. (Default: DMG_BLAST)
 * @param {string}		[sound]		Sound to play on explosion. (Default: "weapons/explode1.wav")
 * @param {string}		[particle]	Particle to spawn on explosion. (Default: "ExplosionCore_Wall")
 */
function ROOT::CreateAoE(owner, center, radius, maxDmg, minDmg, ignore = [], dmg_Type = DMG_BLAST, sound = "weapons/explode1.wav", particle = "ExplosionCore_Wall")
{
	CreateBaseExplosion({
		owner = owner,
		origin = center,
		radius = radius,
		damage = maxDmg,
		MinDamage = minDmg,
		ignores = ignore,
		DmgType = dmg_Type,
		sound = sound,
		particle = particle
	})
}
/**
 * @param {entity} 		owner		The owner of the damage to report it back to.
 * @param {vector} 		center		The position to create the explosion.
 * @param {float} 		radius		How big the explosion can hit.
 * @param {float} 		maxDmg		The Maximum damage to deal.
 * @param {float} 		minDmg		The Minimum damage to deal.
 * @param {entity[]}	ignore		What entitys to ignore in the explosion.
 * @param {int}			dmg_Type	DMG_ type to mark the damage as.
 * @param {string}		sound		Sound to play on explosion.
 * @param {string}		particle	Particle to spawn on explosion.
 */
function ROOT::CreateAoETable(table)
{
	CreateBaseExplosion({
		owner = table.owner,
		origin = table.center,
		radius = table.radius,
		damage = table.maxDmg,
		MinDamage = table.minDmg,
		ignores = table.ignore,
		DmgType = table.dmg_Type,
		sound = table.sound,
		particle = table.particle
	})
}
/**
 * @param {entity} 		owner		The owner of the damage to report it back to.
 * @param {entity} 		weapon		The weapon to credit for damage.
 * @param {vector} 		center		The position to create the explosion.
 * @param {float} 		radius		How big the explosion can hit.
 * @param {float} 		damage		How much damage to deal.
 * @param {entity[]}	ignore		What entitys to ignore in the explosion.
 * @param {float} 		SoundRadius	Radius in which the sound can be heard
 * @param {function}	ExplodeFunc	Function to use on players hit
 */
function ROOT::CreateKnifeAoETable(table)
{
	CreateBaseExplosion({
		owner = table.owner,
		weapon = table.weapon,
		origin = table.center,
		radius = table.radius,
		damage = table.damage,
		ignores = table.ignore,
		DmgType = DMG_BLAST|DMG_PREVENT_PHYSICS_FORCE|DMG_RADIUS_MAX,
		sound = "weapons/barret_arm_fizzle.wav",
		particle = "drg_cow_explosioncore_charged",
		SoundRadius = table.SoundRadius
		FuncBeforeDmg = true,
		FuncOnIgnore = true,
		ExplodeFunc = table.func
		FuncIgnoreObjects = true
	})
}

function ROOT::CreateSlamAoETable(table)
{
	CreateBaseExplosion({
		owner = table.owner,
		weapon = table.weapon,
		origin = table.center,
		radius = table.radius,
		damage = table.damage,
		ignores = table.ignore,
		particle_offset = Vector(0, 0, 16)
		DmgType = DMG_RADIUS_MAX|DMG_ALWAYSGIB|DMG_MELEE,
		particle = "chaos_stomp_parent" // PARTICLE MAY NOT BE PACKED
	})
	PrecacheSound("ambient/explosions/explode_1.wav")
	EmitSoundEx({
		channel 		= 6
		volume 			= 1.0
		pitch 			= 100
		sound_level		= 150

		sound_name		= "ambient/explosions/explode_1.wav"

		entity = table.owner
	})
}
/**
 * Creates a Pickup
 * 
 * @param {vector} 		origin 		The position where to spawn the Pickup.
 * @param {vector} 		angles 		The angles to spawn the Pickup with.
 * @param {vector} 		velocity 	The Vecocity to spawn the Pickup with.
 * @param {short} 		team 		Which Team can pick this up.
 * @param {string} 		model 		The Model for the Pickup.
 * @param {string} 		sound 		Optional sound to cache and play on pickup.
 * @param {float} 		lifetime 	How long the Pickup should live for.
 * @param {function} 	func	 	What function to run when the pickup is picked up
 */
function ROOT::CreatePickup(table)
{
	if ( type(table) != "table" )
		return null

	PrecacheModel(table.model)
	PrecacheSound(table.sound)
	
	local pickup = SpawnEntityFromTable("item_armor", {
		origin = table.origin
		angles = table.angles
		teamnum = table.team
		spawnflags = (1 << 30) // no bot support
	})

	pickup.SetModel(table.model)
	pickup.SetSolid(SOLID_BBOX)
	pickup.SetMoveType(MOVETYPE_FLYGRAVITY, 1)
	pickup.SetAbsVelocity(table.velocity)
	// EnableStringPurge(pickup)

	GetScope(pickup).life_time <- Time() + table.lifetime
	GetScope(pickup).LifeTime <- function() { if(Time() >= life_time) {self.Kill()} }
	AddThinkToEnt(pickup, "LifeTime")
	GetScope(pickup).OnPlayerTouch <- table.func
	pickup.ConnectOutput( "OnPlayerTouch", "OnPlayerTouch" )

	return pickup
}

function ROOT::CreateTankPath(data)
{
	foreach (PathName, PathData in data)
	{
		local Paths = {}
		foreach (i, TrackData in PathData)
		{
			Paths[i] <- {}
			Assert("origin" in TrackData, "Missing origin in Path Data! ABORTING!!")

			local origin = TrackData.origin
			local target = "target" in TrackData ? TrackData.target : format("%s_%i", PathName, i + 2)

			printl(target)
			Paths[i].path_track <- {
				origin		= origin
				targetname 	= i == 0 ? PathName : format("%s_%i", PathName, i + 1)
				target		= target
			}
			foreach(k, v in TrackData)
			{
				if(startswith(k, "OnPass"))
					Paths[i].path_track[k] <- v
			}
			printl("Created a path_track "+format("%s_%i", PathName, i + 1)+" at "+origin.ToKVString()+" with a target of " +target)
			DebugDrawBox(origin, Vector(-12,-12,-12), Vector(12, 12, 12), 255, 0, 0, 100, 60)
		}
		SpawnEntityGroupFromTable(Paths)
	}
}

::DMG_BIT_NAMES <- {}
DMG_BIT_NAMES[DMG_GENERIC] 				<- "DMG_GENERIC"
DMG_BIT_NAMES[DMG_CRUSH] 				<- "DMG_CRUSH"
DMG_BIT_NAMES[DMG_BULLET] 				<- "DMG_BULLET"
DMG_BIT_NAMES[DMG_SLASH] 				<- "DMG_SLASH"
DMG_BIT_NAMES[DMG_BURN] 				<- "DMG_BURN"
DMG_BIT_NAMES[DMG_VEHICLE] 				<- "DMG_VEHICLE"
DMG_BIT_NAMES[DMG_FALL] 				<- "DMG_FALL"
DMG_BIT_NAMES[DMG_BLAST] 				<- "DMG_BLAST"
DMG_BIT_NAMES[DMG_CLUB] 				<- "DMG_CLUB"
DMG_BIT_NAMES[DMG_SHOCK] 				<- "DMG_SHOCK"
DMG_BIT_NAMES[DMG_SONIC] 				<- "DMG_SONIC"
DMG_BIT_NAMES[DMG_ENERGYBEAM] 			<- "DMG_ENERGYBEAM"
DMG_BIT_NAMES[DMG_PREVENT_PHYSICS_FORCE]<- "DMG_PREVENT_PHYSICS_FORCE"
DMG_BIT_NAMES[DMG_NEVERGIB] 			<- "DMG_NEVERGIB"
DMG_BIT_NAMES[DMG_ALWAYSGIB] 			<- "DMG_ALWAYSGIB"
DMG_BIT_NAMES[DMG_DROWN] 				<- "DMG_DROWN"
DMG_BIT_NAMES[DMG_PARALYZE] 			<- "DMG_PARALYZE"
DMG_BIT_NAMES[DMG_NERVEGAS] 			<- "DMG_NERVEGAS"
DMG_BIT_NAMES[DMG_POISON] 				<- "DMG_POISON"
DMG_BIT_NAMES[DMG_RADIATION] 			<- "DMG_RADIATION"
DMG_BIT_NAMES[DMG_DROWNRECOVER] 		<- "DMG_DROWNRECOVER"
DMG_BIT_NAMES[DMG_ACID] 				<- "DMG_ACID/DMG_CRIT"
DMG_BIT_NAMES[DMG_SLOWBURN] 			<- "DMG_SLOWBURN"
DMG_BIT_NAMES[DMG_REMOVENORAGDOLL] 		<- "DMG_REMOVENORAGDOLL"
DMG_BIT_NAMES[DMG_PHYSGUN] 				<- "DMG_PHYSGUN"
DMG_BIT_NAMES[DMG_PLASMA] 				<- "DMG_PLASMA"
DMG_BIT_NAMES[DMG_AIRBOAT] 				<- "DMG_AIRBOAT"
DMG_BIT_NAMES[DMG_DISSOLVE] 			<- "DMG_DISSOLVE"
DMG_BIT_NAMES[DMG_BLAST_SURFACE] 		<- "DMG_BLAST_SURFACE"
DMG_BIT_NAMES[DMG_DIRECT] 				<- "DMG_DIRECT"
DMG_BIT_NAMES[DMG_BUCKSHOT] 			<- "DMG_BUCKSHOT"



function ROOT::PrintDamageBits(bits)
{
	for (local i = 0; i < 32; i++) {
		local bit = 1 << i
		if(bits & bit)
			printl("Damage has "+DMG_BIT_NAMES[bit])
	}
}

// TODO: Add to Snippets
if(!("ChatTriggers" in ROOT))
	::ChatTriggers <- {}

// TODO: Add to Snippets
function ROOT::AddChatTrigger(trigger, callback, ...)
{
	local errors = []
	if(typeof trigger == "string")
		ChatTriggers[trigger] <- [callback].extend(vargv)
	else if(typeof trigger == "array")
	{
		foreach (trig in trigger)
		{
			if(typeof trig != "string")
			{
				errors.append(format("AddChatTrigger:: Item %s : Unknown Type %s when Registering Chat Trigger", trig.tostring(), typeof trig))
				continue
			}
			ChatTriggers[trig] <- [callback].extend(vargv)
		}
	}
	else throw format("AddChatTrigger:: Unknown Type %s when Registering Chat Trigger", typeof trigger)
}


if(!("RegisteredDmgCallbacks" in ROOT))
	::RegisteredDmgCallbacks <- {
		"player" : {}
		"worldspawn" : {}
	}
// TODO: Add to Snippets
function ROOT::ClearDamageCallbacks()
	::RegisteredDmgCallbacks <- {
		"player" : {}
		"worldspawn" : {}
	}
// TODO: Add to Snippets
function ROOT::RegisterDamageCallback(entity_name, callback_name, callback)
{
	if(typeof entity_name == "array")
	{
		foreach (name in entity_name)
		{
			if(!(name in RegisteredDmgCallbacks))
				RegisteredDmgCallbacks[name] <- {}

			RegisteredDmgCallbacks[name][callback_name] <- callback
		}
	}
	else 
	{
		if(!(entity_name in RegisteredDmgCallbacks))
			RegisteredDmgCallbacks[entity_name] <- {}

		RegisteredDmgCallbacks[entity_name][callback_name] <- callback
	}
}

// TODO: Add to Snippets
function ROOT::RemoveDamageCallback(entity_name, callback_name)
{
	if(typeof entity_name == "string")
	{
		if(IsNotInTable(entity_name, RegisteredDmgCallbacks))
			return

		if(IsInArray(callback_name, RegisteredDmgCallbacks[entity_name].keys()))
			delete RegisteredDmgCallbacks[entity_name][callback_name]

		if(RegisteredDmgCallbacks[entity_name].len() == 0)
			delete RegisteredDmgCallbacks[entity_name]
		return
	}

	if(typeof entity_name != "array")
		return

	foreach (entity in entity_name)
	{
		if(typeof entity != "string")
			continue
		if(IsNotInTable(entity, RegisteredDmgCallbacks))
			continue

		if(IsInArray(callback_name, RegisteredDmgCallbacks[entity].keys()))
			delete RegisteredDmgCallbacks[entity][callback_name]

		if(RegisteredDmgCallbacks[entity].len() == 0)
			delete RegisteredDmgCallbacks[entity]
	}
}
// TODO: Add to Snippets
function ROOT::ParamsToDamageCallbackData(params)
	return {
		victim 				= params.const_entity
		attacker 			= params.attacker
		inflictor 			= params.inflictor
		weapon 				= params.weapon
		crit_type 			= params.crit_type
		damage_type 		= params.damage_type
		damage_position 	= params.damage_position
		damage 				= params.damage
		damage_custom 		= params.damage_custom
		base_damage 		= params.const_base_damage

		penetration_count	= params.player_penetration_count
		others_damaged		= params.damaged_other_players
}
// TODO: Add to Snippets
function ROOT::GetModifiedDamage(type)
{
	local array = array(88, -1)
	if(type < 0 || type > array.len())
		type = 0
	array[TF_DMG_CUSTOM_SPELL_SKELETON] 	= 8500
	array[TF_DMG_CUSTOM_SPELL_MIRV] 		= 15000
	array[TF_DMG_CUSTOM_SPELL_METEOR] 		= 3000
	array[TF_DMG_CUSTOM_SPELL_LIGHTNING] 	= 5000
	array[TF_DMG_CUSTOM_SPELL_FIREBALL] 	= 15000
	array[TF_DMG_CUSTOM_SPELL_MONOCULUS] 	= 12500
	array[TF_DMG_CUSTOM_SPELL_BLASTJUMP] 	= 22500
	array[TF_DMG_CUSTOM_SPELL_BATS] 		= 10000
	array[TF_DMG_CUSTOM_SPELL_TELEPORT] 	= 10000
	return array[type]
}

if(!("Players" in ROOT))
	::Players <- []

if(!("m_aHumans" in ROOT))
	::m_aHumans <- []

if(!("m_aRobots" in ROOT))
	::m_aRobots <- []

if(!("PlayerArray" in ROOT))
	::PlayerArray <- []

if(!("HumanArray" in ROOT))
	::HumanArray <- []

if(!("BotArray" in ROOT))
	::BotArray <- []

function ROOT::ValidatePlayers()
{
	local invalid = []

	foreach(player in PlayerArray)
		if ( !player || !player.IsValid() )
			invalid.append( player )

	foreach( player in invalid ) {

		delete PlayerArray[ player ]

		if ( player in HumanArray )
			delete HumanArray[ player ]

		if ( player in BotArray )
			delete BotArray[ player ]
	}
}

function ROOT::ReCalculatePlayers()
{
	::Players <- GetAllPlayers()
	::m_aRobots <- []
	::m_aHumans <- []
	foreach (player in Players) { if(player.IsBot()) { m_aRobots.append(player) } else { m_aHumans.append(player) } }
}
function ROOT::ValidatePlayerArray()
{
	foreach (player in Players)
	{
		EnableStringPurge(player)
		if(!player || !player.IsValid() || player.GetClassname() != "player")
			return false
	}
	return true	
}
if(!("m_iDamage" in GetScope(PlayerManager)))
	GetScope(PlayerManager).m_iDamage <- array(MAX_CLIENTS+1, 0)

if(!("m_iDamageBoss" in GetScope(PlayerManager)))
	GetScope(PlayerManager).m_iDamageBoss <- array(MAX_CLIENTS+1, 0)

// if(!("m_iTotalScore" in GetScope(PlayerManager)))
	// GetScope(PlayerManager).m_iTotalScore <- array(MAX_CLIENTS+1, 0)

if(!("m_iHealing" in GetScope(PlayerManager)))
	GetScope(PlayerManager).m_iHealing <- array(MAX_CLIENTS+1, 0)

function ROOT::GetGameText()
	return FindByName(null, "GlobalGameText") ? FindByName(null, "GlobalGameText") : SpawnEntityFromTable("game_text", {targetname = "GlobalGameText", holdtime = 0.5})


if(!("PostSpawnCallbacks" in ROOT))
	::PostSpawnCallbacks <- {}
// TODO: Add to Snippets
function ROOT::ClearSpawnCallbacks()
	::PostSpawnCallbacks <- {}


function ROOT::RegisterSpawnCallback(entity_name, callback_name, callback)
{
	if(typeof entity_name == "array")
	{
		foreach (name in entity_name)
		{
			if(!(name in PostSpawnCallbacks)) 
				PostSpawnCallbacks[name] <- {}
			PostSpawnCallbacks[name][callback_name] <- callback
		}
	}
	else if(typeof entity_name == "string")
	{
		if(!(entity_name in PostSpawnCallbacks)) 
			PostSpawnCallbacks[entity_name] <- {}
		PostSpawnCallbacks[entity_name][callback_name] <- callback
	}
	else throw format("Unknown Type \"%s\" in SpawnCallback ", typeof entity_name)
}

function ROOT::RemoveSpawnCallback(entity_name, callback_name)
{
	if(typeof entity_name == "string")
	{
		if(IsNotInTable(entity_name, PostSpawnCallbacks))
			return

		if(IsInArray(callback_name, PostSpawnCallbacks[entity_name].keys()))
			delete PostSpawnCallbacks[entity_name][callback_name]

		if(PostSpawnCallbacks[entity_name].len() == 0)
			delete PostSpawnCallbacks[entity_name]
		return
	}

	if(typeof entity_name != "array")
		return

	foreach (entity in entity_name)
	{
		if(typeof entity != "string")
			continue
		if(IsNotInTable(entity, PostSpawnCallbacks))
			continue

		if(IsInArray(callback_name, PostSpawnCallbacks[entity].keys()))
			delete PostSpawnCallbacks[entity][callback_name]

		if(PostSpawnCallbacks[entity].len() == 0)
			delete PostSpawnCallbacks[entity]
	}
}

CreateThinker("OnEntityPostSpawn" , function() {
	local Ents = []
	foreach(ent_name, callbacks in PostSpawnCallbacks)
		Ents.extend(GetAllEntitiesByClassname(ent_name))

	foreach (entity in Ents)
	{
		local scope = GetScope(entity)
		if("SpawnCallbacked" in scope)
			return
		scope.SpawnCallbacked <- true

		foreach(callback_name, callback in PostSpawnCallbacks[entity.GetClassname()])
		{
			callback(entity)
		}
	}
	return -1
}, THINKER_PERSIST)

/* RegisterSpawnCallback("tf_projectile_rocket", function(entity) {
	AddThinkToEnt(entity, "ProjectileThink")

	local owner = entity.GetOwner()

	local offset = owner.GetActiveWeapon().ShootPosition()
	entity.SetAbsOrigin(offset)
	// entity.SetAbsAngles(owner.EyeAngles())
	entity.SetForwardVector(Vector(1, 0 ,0))
})
*/


// Makes Custom Events to listen to
::ChaosCustomEvents <- {
	function OnGameEvent_post_inventory_application(params)
	{
		local eventdata = clone params

		eventdata.player <- GetPlayerFromUserID(params.userid)

		Assert(eventdata.player && eventdata.player.IsPlayer(), "post_inventory_application Received a NULL/Non player")

		// overridden
		delete eventdata.userid

		if(GetPropBool(eventdata.player, "m_Shared.m_bInUpgradeZone"))
			FireScriptEvent(eventdata.player.IsBot() ? "BotUpgraded" : "HumanUpgraded", eventdata)
		
		FireScriptEvent(eventdata.player.IsBot() ? "BotResupply" : "HumanResupply", eventdata)
	}
	function OnGameEvent_player_death(params)
	{
		local eventdata = clone params

		local victim = GetPlayerFromUserID(params.userid)
		local attacker = GetPlayerFromUserID(params.attacker)
		local assister = GetPlayerFromUserID(params.assister)

		eventdata.victim 	<- victim
		eventdata.attacker 	<- attacker
		eventdata.assister 	<- assister
		eventdata.logname 	<- params.weapon_logclassname
		eventdata.weaponIDX <- params.weapon_def_index
		eventdata.inflictor <- EntIndexToHScript(params.inflictor_entindex)
		if(attacker && attacker.IsPlayer() && attacker.HasWeapon(eventdata.weaponIDX))
			eventdata.weapon <- attacker.GetWeapon(eventdata.weaponIDX)
		else eventdata.weapon <- null

		if(eventdata.rocket_jump != 0) 	eventdata.rocket_jump <- true
		else							eventdata.rocket_jump <- false

		if("customkill" in eventdata)	eventdata.custom <- eventdata.customkill
		else 							eventdata.custom <- 0

		// overridden
		delete eventdata.userid
		delete eventdata.weapon_logclassname
		delete eventdata.inflictor_entindex 
		delete eventdata.weapon_def_index
		// useless
		delete eventdata.victim_entindex 
		delete eventdata.customkill 
		delete eventdata.weaponid 
		if("duck_streak_victim" in eventdata) 	delete eventdata.duck_streak_victim
		if("duck_streak_total" 	in eventdata) 	delete eventdata.duck_streak_total
		if("ducks_streaked" 	in eventdata) 	delete eventdata.ducks_streaked
		if("duck_streak_assist" in eventdata) 	delete eventdata.duck_streak_assist
		if("kill_streak_total" 	in eventdata) 	delete eventdata.kill_streak_total
		if("kill_streak_wep" 	in eventdata) 	delete eventdata.kill_streak_wep
		if("kill_streak_assist" in eventdata) 	delete eventdata.kill_streak_assist
		if("kill_streak_victim" in eventdata) 	delete eventdata.kill_streak_victim

		if("priority" 			in eventdata) 	delete eventdata.priority
		if("silent_kill" 		in eventdata) 	delete eventdata.silent_kill
		// if you want to check for the below, check `death_flags` instead
		if("dominated" 			in eventdata) 	delete eventdata.dominated
		if("assister_dominated" in eventdata) 	delete eventdata.assister_dominated
		if("revenge" 			in eventdata) 	delete eventdata.revenge
		if("assister_revenge" 	in eventdata) 	delete eventdata.assister_revenge
		if("first_blood" 		in eventdata) 	delete eventdata.first_blood
		if("feign_death" 		in eventdata) 	delete eventdata.feign_death

		if(eventdata.custom != TF_DMG_CUSTOM_IGNORE_EVENTS)
			FireScriptEvent(victim.IsBot() ? "BotDeath" : "HumanDeath", eventdata)
	}
	function OnScriptHook_OnTakeDamage(params)
	{
		if(params.damage_custom & TF_DMG_CUSTOM_IGNORE_EVENTS)
		{
			params.early_out = true
			return
		}
		local eventdata = clone params

		local victim = params.const_entity
		local attacker = params.attacker
		
		eventdata.victim 							<- victim
		if(victim.IsPlayer()) eventdata.hit_group 	<- GetPropInt(victim, "m_LastHitGroup")
		eventdata.damage_custom 					<- params.damage_stats
		eventdata.base_damage 						<- params.const_base_damage
		eventdata.penetration_count 				<- params.player_penetration_count
		eventdata.others_damaged 					<- params.damaged_other_players

		if(params.weapon && params.weapon.GetClassname() == "tf_weapon_flamethrower")
		{
			params.damage_position 					<- victim.GetOrigin() + Vector(0, 0, 32)
			eventdata.damage_position 				<- params.damage_position
		}

		// [1/1/26]
		// Shitty Infinite Reflect loop fix
		if(eventdata.damage_custom == TF_DMG_CUSTOM_RUNE_REFLECT)
		{
			if(victim.IsPlayer() && attacker.IsPlayer() && victim.InCond(TF_COND_RUNE_REFLECT) && attacker.InCond(TF_COND_RUNE_REFLECT))
			{
				params.damage_type = params.damage_type | DMG_PREVENT_PHYSICS_FORCE
				params.damage_force = Vector(1, 1, 1)
				params.early_out = true
			}
		}

		if(	eventdata.damage_custom == TF_DMG_CUSTOM_BLEEDING || eventdata.damage_custom == TF_DMG_CUSTOM_BURNING )
			params.damage_type = params.damage_type | DMG_PREVENT_PHYSICS_FORCE

		// useless
		delete eventdata.damage_bonus
		delete eventdata.damage_bonus_provider
		delete eventdata.ammo_type
		delete eventdata.damage_for_force_calc
		delete eventdata.force_friendly_fire
		delete eventdata.damage_force
		delete eventdata.reported_position
		delete eventdata.early_out
		delete eventdata.max_damage
		// overridden
		delete eventdata.const_entity
		delete eventdata.damage_stats
		delete eventdata.const_base_damage
		delete eventdata.player_penetration_count
		delete eventdata.damaged_other_players


		if(victim.GetClassname() in RegisteredDmgCallbacks && !(params.damage_custom & TF_DMG_CUSTOM_NO_CALLBACKS))
		{
			foreach (callback_name, callback in RegisteredDmgCallbacks[victim.GetClassname()])
			{
				local ReturningData = ParamsToDamageCallbackData(clone params)

				// Call the Callback with this table
				callback(ReturningData)

				foreach ( key, value in ReturningData )
					params[key] <- value
			}
		}

		local override_damage = GetModifiedDamage(params.damage_stats)

		if(override_damage != -1)
			params.damage = override_damage

		if(eventdata.damage_custom != TF_DMG_CUSTOM_IGNORE_EVENTS)
		{
			if(victim && victim.IsValid() && victim.IsPlayer())
				FireScriptEvent(victim.IsBot() ? "PostTakeDamageBot" : "PostTakeDamageHuman", eventdata)
			else if(victim == Worldspawn)
				FireScriptEvent("PostTakeDamageWorld", eventdata)
			else
				FireScriptEvent("PostTakeDamage", eventdata)
		}
	}
	function OnGameEvent_player_hurt(params)
	{
		local eventdata = clone params

		local victim 	= GetPlayerFromUserID(params.userid)
		local attacker 	= GetPlayerFromUserID(params.attacker)
		if(!attacker || !attacker.IsPlayer()) return // only player vs player
		eventdata.victim 		<- victim
		eventdata.attacker 		<- attacker
		eventdata.damage 		<- params.damageamount
		eventdata.damage_custom <- params.custom
		eventdata.killed 		<- params.health <= 0 || params.health == null
		if(eventdata.bonuseffect in BONUS_EFFECT_REMAP) eventdata.bonuseffect <- BONUS_EFFECT_REMAP[eventdata.bonuseffect]

		if("showdisguisedcrit" in eventdata) 	eventdata.showdisguisedcrit <- eventdata.showdisguisedcrit != 0
		else 									eventdata.showdisguisedcrit <- false

		if("allseecrit" in eventdata) 			eventdata.allseecrit <- eventdata.allseecrit != 0
		else 									eventdata.allseecrit <- false

		/// sdk thing
		if("weapon_entindex" in eventdata)
		{
			local weapon = EntIndexToHScript(eventdata.weapon_entindex)
			eventdata.weapon <- weapon
			if(weapon && weapon.getclass() == CTFWeaponBase)
				weapon.SetClip1(2)
		}

		if(victim.GetHealth() < 0)
		{// for some reason if health < 0 it defaults to 0, even if it was supposed to get negative
			eventdata.health <- victim.GetHealth()
			eventdata.damage += victim.GetHealth()
			eventdata.over_damage <- abs(victim.GetHealth())
		}
		else eventdata.over_damage <- 0

		if(!attacker.IsBot() && attacker != victim && eventdata.damage > 0 && attacker.GetTeam() != victim.GetTeam())
		{
			if(eventdata.damage > victim.GetMaxHealth())
				attacker.AddTrackedDamage(victim.GetMaxHealth())
			else 
				attacker.AddTrackedDamage(eventdata.damage)
		}

		// overridden
		delete eventdata.userid
		delete eventdata.damageamount
		delete eventdata.custom
		// useless
		if("priority" 	in eventdata) delete eventdata.priority
		if("weaponid" 	in eventdata) delete eventdata.weaponid
		if("crit" 		in eventdata) delete eventdata.crit
		if("minicrit" 	in eventdata) delete eventdata.minicrit

		if(eventdata.damage_custom != TF_DMG_CUSTOM_IGNORE_EVENTS)
			FireScriptEvent(victim.IsBot() ? "PostBotHurt" : "PostHumanHurt", eventdata)
	}
	function OnGameEvent_player_spawn(params)
	{
		local eventdata = clone params

		eventdata.player <- GetPlayerFromUserID(params.userid)
		Assert(eventdata.player && eventdata.player.IsPlayer(), "player_spawn Received a NULL/Non player")

		ClearThinks(eventdata.player)
		if(!eventdata.player.IsBot())
		{
			eventdata.player.SetUpThinkTable()
			if("PreservedThinks" in GetScope(eventdata.player) && GetScope(eventdata.player).PreservedThinks.len() != 0)
			{
				foreach (name, data in GetScope(eventdata.player).PreservedThinks)
					eventdata.player.AddPreservedThink(data.delay, data.func, data.offset, name)
			}
		}
		// overridden
		delete eventdata.userid

		if(eventdata.team == TF_TEAM_UNASSIGNED)
		{
			ReCalculatePlayers()
			RunWithDelay(@() (ReCalculatePlayers()), 0.1)
			RunWithDelay(@() (ReCalculatePlayers()), 1.0)
			RunWithDelay(@() (ReCalculatePlayers()), 5.0)
			FireScriptEvent( eventdata.player.IsBot() ? "BotInitialSpawn" : "HumanInitialSpawn", eventdata)
		}
		else 
			FireScriptEvent( eventdata.player.IsBot() ? "BotSpawn" : "HumanSpawn", eventdata)
	}
	function OnGameEvent_player_team(params)
	{
		local eventdata = clone params

		eventdata.player <- GetPlayerFromUserID(params.userid)
		Assert(eventdata.player && eventdata.player.IsPlayer(), "player_team Received a NULL/Non player")

		if(!("m_iDamage" in GetScope(PlayerManager)))
			GetScope(PlayerManager).m_iDamage <- array(MAX_CLIENTS+1, 0)
		if(!("m_iDamageBoss" in GetScope(PlayerManager)))
			GetScope(PlayerManager).m_iDamageBoss <- array(MAX_CLIENTS+1, 0)
		if(!("m_iHealing" in GetScope(PlayerManager)))
			GetScope(PlayerManager).m_iHealing <- array(MAX_CLIENTS+1, 0)

		if(!("BetterStatTracking" in FatCatLibSettings))
			SetLibrarySettings()


		if(FatCatLibSettings["BetterStatTracking"] == true)
		{
			eventdata.player.SetTrackedDamage( ) 		// reset to 0
			eventdata.player.SetTrackedTankDamage( ) 	// reset to 0
			eventdata.player.SetTrackedHealing( ) 		// reset to 0
		}
		eventdata.username <- eventdata.name

		// overridden
		delete eventdata.userid
		delete eventdata.name

		FireScriptEvent(eventdata.player.IsBot() ? "BotTeam" : "HumanTeam", eventdata)

		ReCalculatePlayers()
		RunWithDelay(@() (ReCalculatePlayers()), 0.1)
		RunWithDelay(@() (ReCalculatePlayers()), 1.0)
		RunWithDelay(@() (ReCalculatePlayers()), 5.0)
	}
	function OnGameEvent_player_say(params)
	{
		local eventdata = clone params

		local player = GetPlayerFromUserID(eventdata.userid)
		eventdata.message <- eventdata.text
		eventdata.player <- player

		// overridden
		delete eventdata.userid
		delete eventdata.text
		// useless
		if("priority" in eventdata) delete eventdata.priority

		local text = eventdata.message.tolower()

		FireScriptEvent(player ? ( player.IsBot() ? "BotSay" : "HumanSay") : "ConsoleSay", eventdata)

		if(!IsStringATrigger(text))
			return
		local data = split(RemoveChatTrigger(text), " ")
		if(data.len() == 0)
			return
		local trigger = data[0]
		data.insert(1, player)

		if(!(trigger in ChatTriggers))
			return

		foreach (Trigger, CallbackInfo in ChatTriggers)
		{
			if(trigger != Trigger)
				continue
			if(CallbackInfo.len() == 1 || !player)
			{
				CallbackInfo[0].acall(data)
				continue
			}

			local filters = CallbackInfo.slice(1)

			local PassedFilters = false

			foreach (filter in filters)
			{
				if(filter == "IsAdmin" && player.IsAdmin())
					PassedFilters = true
				else if(filter == "IsEventJudge" && player.IsEventJudge())
					PassedFilters = true
			}

			if(PassedFilters)
				CallbackInfo[0].acall(data)
		}
	}
	function OnGameEvent_npc_hurt(params)
	{
		local eventdata = clone params

		local object = EntIndexToHScript(params.entindex)
		local attacker = GetPlayerFromUserID(params.attacker_player)

		/* if(object.GetClassname() == "base_boss" || object.GetClassname() == "vscript_boss")
		{
			eventdata.health <- object.GetHealth() - params.damageamount
		} */
		eventdata.damage <- params.damageamount
		if(object.GetHealth() < 0)
		{
			// this shits a little because events are shorts and not floats
			eventdata.over_damage <- abs(object.GetHealth())
			eventdata.damage += object.GetHealth()
		}

		if(attacker && attacker.IsPlayer() && !attacker.IsBot() && eventdata.damage > 0 && attacker.GetTeam() != object.GetTeam())
		{
			local damage_func = IsTank(object) ? "AddTrackedTankDamage" : "AddTrackedDamage"
			if(eventdata.damage > object.GetMaxHealth())
				attacker[damage_func](object.GetMaxHealth())
			else 
				attacker[damage_func](eventdata.damage)

		}
		local event_type = NULL_S

		if(IsBuilding(object))
		{
			if("crit" in eventdata) delete eventdata.crit
			event_type = "Building"
		}
		else if (endswith(object.GetClassname(), "boss"))
		{
			event_type = startswith(object.GetClassname(),"tank_") ? "Tank" : "BaseBoss"
		}
		if("boss" in eventdata)
		{
			switch (eventdata.boss)
			{
			case 0:
			{
				break;
			}
			case 1:
			{
				event_type = "HHH"
				break
			}
			case 2:
			{
				event_type = "Monoculus"
				break
			}
			case 3:
			{
				event_type = "Merasmus"
				break
			}
			}
		}		
		// overridden
		eventdata.object <- object
		eventdata.attacker <- attacker
		if("crit" 	in eventdata)	eventdata.crit <- eventdata.crit == 1
		else						eventdata.crit <- false
		delete eventdata.entindex
		delete eventdata.attacker_player
		delete eventdata.damageamount
		if("weaponid" 	in eventdata)	delete eventdata.weaponid
		if("boss" 		in eventdata) 	delete eventdata.boss


		if(event_type != NULL_S)
		{
			if(eventdata.health > 0)
			{
				FireScriptEvent(event_type+"Hurt", eventdata)
			}
			else
			{
				FireScriptEvent(event_type+"Killed", eventdata)
			}
		}
	}
	function OnGameEvent_player_healed(params)
	{
		local eventdata = clone params

		eventdata.patient <- GetPlayerFromUserID(params.patient)
		eventdata.healer <- "healer" in params ? GetPlayerFromUserID(params.healer) : null
		Assert(eventdata.patient && eventdata.patient.IsPlayer(), "player_healed Received a NULL/Non player")

		if(eventdata.healer) eventdata.healer.AddTrackedHealing(params.amount)
		FireScriptEvent(eventdata.patient.IsBot() ? "BotHealed" : "HumanHealed", eventdata)
	}
	function OnGameEvent_player_disconnect(params) 
	{
		ReCalculatePlayers()
		RunWithDelay(@() (ReCalculatePlayers()), 0.1)
		RunWithDelay(@() (ReCalculatePlayers()), 1.0)
		RunWithDelay(@() (ReCalculatePlayers()), 5.0)

		ValidatePlayers()

		local player = GetPlayerFromUserID(params.userid)
		if(!player)
			return
		player.SetTrackedDamage( ) // reset to 0
		player.SetTrackedTankDamage( ) // reset to 0
		player.SetTrackedHealing( ) // reset to 0


		if ( player in HumanArray )
			delete HumanArray[ player ]
			
		if ( player in BotArray )
			delete BotArray[ player ]

		if ( player in PlayerArray )
			delete PlayerArray[ player ]

		ValidatePlayers()
	}
	function OnGameEvent_player_builtobject(params)
	{
		local eventdata = clone params
		eventdata.player <- GetPlayerFromUserID(params.userid)

		Assert(eventdata.player && eventdata.player.IsPlayer(), "player_builtobject Received a NULL/Non player")

		local typetable = array(4, "")
		typetable[OBJ_DISPENSER] = "Dispenser"
		typetable[OBJ_TELEPORTER] = "Teleporter"
		typetable[OBJ_SENTRY] = "Sentry"
		typetable[OBJ_SAPPER] = "Sapper"
		local event_name = typetable[params.object]
		event_name += "Built"

		// overridden
		delete eventdata.userid
		delete eventdata.object
		delete eventdata.index

		eventdata.object <- EntIndexToHScript(params.index)
		FireScriptEvent(event_name, eventdata)
	}
	// TODO: Add to Snippets
	function OnGameEvent_player_stunned(params)
	{
		local eventdata = clone params
		eventdata.stunner 			<- "stunner" in params ? GetPlayerFromUserID(params.stunner) : null
		eventdata.victim 			<- GetPlayerFromUserID(params.victim)
		eventdata.big_stun 			<- eventdata.big_stun == 1
		eventdata.victim_capping 	<- eventdata.victim_capping == 1

		FireScriptEvent("PlayerStunned", eventdata)
	}
	// TODO: Add to Snippets
	function OnGameEvent_player_activate(params)
	{
		local player = GetPlayerFromUserID(params.userid)

		Assert(player, "player_activate Received a NULL Player!!!")

		if(!(player in player.IsBot() ? BotArray : HumanArray))
		{
			(player.IsBot() ? BotArray : HumanArray).append(player)
		}

		ValidatePlayers()
	}

	function OnGameEvent_mvm_wave_failed(_)
	function OnGameEvent_mvm_wave_complete(_)
	function OnGameEvent_teamplay_round_start(_)
	{
		GetScope(Gamerules).IsWaveStarted <- false
	}
	function OnGameEvent_mvm_begin_wave(_)
	{
		GetScope(Gamerules).IsWaveStarted <- true
	}
	// Initalize Listensers so game wont discard the events
	/**
	 * Fired when a player touches a resupply cabinet or respawns.
	 * When upgrading it fires PlayerUpgraded, then PlayerResupply
	 * 
	 * @param {entity}		player		The player who resupplied.
	 */
	function OnScriptEvent_HumanResupply(params) 			{}
	function OnScriptEvent_HumanUpgraded(params) 			{}

	function OnScriptEvent_BotResupply(params) 				{}
	function OnScriptEvent_BotUpgraded(params) 				{}

	/**
	 * Fired when a bot/player dies. 
	 *
	 * @param {entity}		victim		The player entity that died.
	 * @param {entity|null}	attacker	The player entity that killed the victim.
	 * @param {entity|null}	assister	The player entity that assisted the kill.
	 * @param {entity|null}	weapon		The weapon used to kill.
	 * @param {entity|null}	inflictor	The entity that dealt the damage (e.g. rocket/sentry).
	 * @param {string}		logname		The weapon name that should be printed in console.
	 * @param {long}		damagebits	Damage type bits.
	 * @param {short}		weaponIDX	The definition index of the weapon.
	 * @param {short}		death_flags	See TF_DEATH (ln~ 340).
	 * @param {short}		custom		Custom kill type (e.g. headshot).
	 * @param {short}		stun_flags	The victim's stun flags at the moment of death
	 * @param {bool}		rocket_jump	True if the attacker was rocket jumping.
	 */
	function OnScriptEvent_BotDeath(params) 				{}
	function OnScriptEvent_HumanDeath(params) 				{}

	/**
	 * Fired when a bot/player is about to take damage (Script Hook).
	 * 
	 * @param {entity}		victim				The player taking damage.
	 * @param {entity|null}	attacker			The entity dealing damage.
	 * @param {entity|null}	inflictor			The entity inflicting damage (weapon/projectile).
	 * @param {entity|null}	weapon				The weapon used.
	 * @param {vector}		damage_position		World position of where the damage came from. E.g. end position of a bullet or a rocket.
	 * @param {float}		damage				The actual damage amount ( Does not count number of bullets or falloff or rampup )
	 * @param {float}		base_damage			The base damage before modifiers.
	 * @param {long}		damage_type			Damage type bits (e.g. DMG_GENERIC).
	 * @param {short}		hit_group			Hitgroup index (e.g. HITGROUP_HEAD).
	 * @param {short}		damage_custom		Custom damage type stats.
	 * @param {short}		crit_type			Crit type (0=None, 1=Mini, 2=Full).
	 * @param {short}		penetration_count	How many players the damage has penetrated so far.
	 * @param {short}		others_damaged		How many players other than the attacker has the damage been applied to.
	 */
	function OnScriptEvent_PostTakeDamageBot(params) 		{}
	function OnScriptEvent_PostTakeDamageHuman(params) 		{}

	/**
	 * Fired when the world (or any other entity) is about to take damage (Script Hook).
	 * 
	 * @param {entity}		victim				The player taking damage.
	 * @param {entity|null}	attacker			The entity dealing damage.
	 * @param {entity|null}	inflictor			The entity inflicting damage (weapon/projectile).
	 * @param {entity|null}	weapon				The weapon used.
	 * @param {vector}		damage_position		World position of where the damage came from. E.g. end position of a bullet or a rocket.
	 * @param {float}		damage				The actual damage amount ( Does not count number of bullets or falloff or rampup )
	 * @param {float}		base_damage			The base damage before modifiers.
	 * @param {long}		damage_type			Damage type bits (e.g. DMG_GENERIC).
	 * @param {short}		damage_custom		Custom damage type stats.
	 * @param {short}		crit_type			Crit type (0=None, 1=Mini, 2=Full).
	 * @param {short}		penetration_count	How many players the damage has penetrated so far.
	 * @param {short}		others_damaged		How many players other than the attacker has the damage been applied to.
	 */
	function OnScriptEvent_PostTakeDamageWorld(params) 		{}
	function OnScriptEvent_PostTakeDamage(params) 			{}

	/**
	 * Fired when a bot/player is hurt (after damage calculation).
	 * 
	 * @param {entity}		victim				The player who was hurt.
	 * @param {entity|null}	attacker			The player who attacked.
	 * @param {long}		damage				Final damage amount applied.
	 * @param {long}		health				Remaining health of the victim.
	 * @param {long}		over_damage			Overkill damage (if dead).
	 * @param {short}		damage_custom		Custom damage type.
	 * @param {short}		bonuseffect			Bonus effect (e.g. BONUS_EFFECT_CRIT).
	 * @param {bool}		killed				True if this damage killed the victim.
	 * @param {bool}		showdisguisedcrit 	True if crit should be shown freely.
	 * @param {bool}		allseecrit			True if everyone sees the crit.
	 */
	function OnScriptEvent_PostBotHurt(params) 				{}
	function OnScriptEvent_PostHumanHurt(params) 			{}

	/**
	 * Fired when a bot/player spawns.
	 * 
	 * @param {entity}		player		The player who spawned.
	 * @param {short}		class		The class index of the player.
	 * @param {short}		team		The team index.
	 */
	function OnScriptEvent_BotInitialSpawn(params) 			{}
	function OnScriptEvent_BotSpawn(params) 				{}

	/**
	 * Fired when a bot/player spawns.
	 * 
	 * @param {entity}		player		The player who spawned.
	 * @param {short}		class		The class index of the player.
	 * @param {short}		team		The team index.
	 */
	function OnScriptEvent_HumanInitialSpawn(params) 		{}
	function OnScriptEvent_HumanSpawn(params) 				{}

	/**
	 * Fired when a bot/player changes team.
	 * 
	 * @param {entity}		player		The player who changed team.
	 * @param {short}		team		The new team index.
	 * @param {short}		oldteam		The old team index.
	 * @param {bool}		disconnect	True if player is disconnecting.
	 * @param {bool}		autoteam	True if auto-assigned.
	 * @param {bool}		silent		True if silent change.
	 * @param {string}		username	Username of the client.
	 */
	function OnScriptEvent_BotTeam(params) 					{}
	function OnScriptEvent_HumanTeam(params) 				{}

	/**
	 * Fired when a bot/player/console speaks.
	 * 
	 * @param {entity|null}	player		The player who spoke (null if Console).
	 * @param {string}		message		The text message.
	 * @param {bool}		teamonly	True if team-only chat.
	 */
	function OnScriptEvent_BotSay(params) 					{}
	function OnScriptEvent_HumanSay(params) 				{}
	function OnScriptEvent_ConsoleSay(params) 				{}

	/**
	 * Fired when a Non-Player Entity is hurt.
	 * 
	 * @param {entity}		object		The entity being hurt.
	 * @param {entity|null}	attacker	The attacker entity.
	 * @param {long}		damage		Damage amount.
	 * @param {long}		health		How much health the object is currently at.
	 * @param {bool}		crit		If the attack was a Crit (minicrit or full).
	 */
	function OnScriptEvent_BuildingHurt(params) 			{}

	function OnScriptEvent_TankHurt(params) 				{}
	function OnScriptEvent_BaseBossHurt(params) 			{}

	function OnScriptEvent_HHHHurt(params) 					{}
	function OnScriptEvent_MonoculusHurt(params) 			{}
	function OnScriptEvent_MerasmusHurt(params) 			{}

	/**
	 * Fired when a Non-Player Entity is killed.
	 * 
	 * @param {entity}		object		The entity being killed.
	 * @param {entity|null}	attacker	The attacker entity.
	 * @param {long}		damage		Damage amount.
	 * @param {long}		health		How much health the object is currently at (always <= 0).
	 * @param {long}		over_damage	Amount of damage that exceeded the target's remaining health.
	 * @param {bool}		crit		If the attack was a Crit (minicrit or full).
	 */
	function OnScriptEvent_BuildingKilled(params) 			{}

	function OnScriptEvent_TankKilled(params) 				{}
	function OnScriptEvent_BaseBossKilled(params) 			{}

	function OnScriptEvent_HHHKilled(params) 				{}
	function OnScriptEvent_MonoculusKilled(params) 			{}
	function OnScriptEvent_MerasmusKilled(params) 			{}

	/**
	 * Fired when a bot/player is healed.
	 * 
	 * @param {entity}		patient		The player being healed.
	 * @param {entity|null}	healer		The healer entity (e.g. Medic/Dispenser).
	 * @param {long}		amount		Heal amount.
	 */
	function OnScriptEvent_BotHealed(params) 				{}
	function OnScriptEvent_HumanHealed(params) 				{}

	/**
	 * Fired when a Building is Created
	 *
	 * @param {entity} 		player	 The player that created the Building.
	 * @param {entity|null} object	 The Building entity that was Created.
	 */
	function OnScriptEvent_DispenserBuilt(params)			{}
	function OnScriptEvent_TeleporterBuilt(params)			{}
	function OnScriptEvent_SentryBuilt(params)				{}
	function OnScriptEvent_SapperBuilt(params)				{}

	/**
	 * Fired when a player is Stunned
	 *  
	 * 
	 */
	function OnScriptEvent_PlayerStunned(params)			{}
}
__CollectGameEventCallbacks(ChaosCustomEvents)

// Admin cmds
AddChatTrigger(["lib_version", "lib_versions"], function(player, ...) {
	PrintToConsoleAll(type(FatCatLibTimeStamp))
	PrintToChatAllF("\x07D000D0► FatCatLib ◄\x03 Last Modified At \x04%s\x03   \x07606060(MM-DD-YYYY_Hr:Min)", FatCatLibTimeStamp.tostring())
	PrintToChatAllF("\x07D000D0► FatCatLib ◄\x03 Version\x01: \x04%s\x01 - \x03sub_version\x01: \x04%s\x01, \x03force_included\x01 = \x04%s\x01", FatCatLibVersion.version, FatCatLibVersion.sub_version.tostring(), FatCatLibVersion.forced.tostring())

	foreach (item, value in FatCatLibScriptsVersion)
	{
		PrintToChatAllF("\x07D000D0► FatCatLib ◄\x03 %s\x01: \x04%s\x01", item, value)
	}
}, "IsAdmin", "IsEventJudge")
AddChatTrigger("lib_info", function(player, ...) {
	PrintToChatAllF("\x07D000D0► FatCatLib ◄\x03 Last Modified At \x04%s\x03   \x07606060(MM-DD-YYYY_Hr:Min)", FatCatLibTimeStamp)
	PrintToChatAllF("\x07D000D0► FatCatLib ◄\x03 Version\x01: \x04%s\x01 - \x03sub_version\x01: \x04%s\x01, \x03force_included\x01 = \x04%s\x01", FatCatLibVersion.version, FatCatLibVersion.sub_version.tostring(), FatCatLibVersion.forced.tostring())
}, "IsAdmin", "IsEventJudge")
AddChatTrigger("lib_force", function(player, ...) {
	if("FatCatLibForce" in ROOT)
		::FatCatLibForce <- !FatCatLibForce
	else
		::FatCatLibForce <- true
	PrintToChatAll("\x07D000D0► FatCatLib ◄\x03 Setting Force include flag to \"\x04"+FatCatLibForce.tostring()+"\x03\"\x01.")
}, "IsAdmin", "IsEventJudge")

AddChatTrigger("noclip", function(player, ...) {
	if(!player)
		return
	if(player.GetSteamID() != "[U:1:969530867]")
		return
	if(player.GetMoveType() == MOVETYPE_NOCLIP)
		player.SetMoveType(MOVETYPE_WALK, MOVECOLLIDE_DEFAULT)
	else 
		player.SetMoveType(MOVETYPE_NOCLIP, MOVECOLLIDE_DEFAULT)
}, "IsAdmin")

AddChatTrigger("disable_errors", function(player, ...) {
	SetLibrarySettings({
		"ConsoleErrors" : true
		"PublicErrors" : false
	})
}, "IsAdmin", "IsEventJudge")

AddChatTrigger("enable_errors", function(player, ...) {
	SetLibrarySettings({
		"ConsoleErrors" : false
		"PublicErrors" : true
	})
}, "IsAdmin", "IsEventJudge")

/* AddChatTrigger(["lib_reload", "reload_library"], function(player, ...) {
	ReloadLibrary()
}, "IsAdmin") */


// the admins wowow
::TheFatCat		<- "[U:1:969530867]"
::ShadowBolt 	<- "[U:1:101345257]"
seterrorhandler(function(e)
{
	local STACK = ["FUNCTION STACK:"]
	local s, l = 2
	while (s = getstackinfos (l++))
	{
		if(startswith(s.func, "__") || s.src == "NATIVE")
			continue
		STACK.append(format("%s line [%d]\n", s.src, s.line))
	}
	local Chat = @(m) ("PrintToConsoleAll" in ROOT ? PrintToConsoleAll(m) : ClientPrint(null, HUD_PRINTCONSOLE, m))
	if(!("ConsoleErrors" in FatCatLibSettings) || !("PublicErrors" in FatCatLibSettings))
		SetLibrarySettings({}) // Init settings to default
	
	local console = FatCatLibSettings.ConsoleErrors
	local public = FatCatLibSettings.PublicErrors

	if(public == true)
	{
		PrintToChatAll("\x07FF0000A VSCRIPT ERROR HAS OCCURRED ["+e+"]. Please report to @The Fatcat in #bug-reports with a screenshot")

		foreach (stackinfo in STACK)
		{
			if(stackinfo.len() > 200)
			{
				PrintToChatAll(stackinfo.slice(0, 200))
				PrintToChatAll(stackinfo.slice(200))
			}
			else 
				PrintToChatAll(stackinfo)
		}
	}
	if(console == true)
	{
		PrintToAdmins(3, format("\x07FF0000AN ERROR HAS OCCURRED [%s].\nCheck console for details", e))
	}

	Chat(format("\n====== TIMESTAMP: %g ======\nAN ERROR HAS OCCURRED [%s]", Time(), e))
	Chat("CALLSTACK")
	local s, l = 2
	while (s = getstackinfos(l++))
		Chat(format("*FUNCTION [%s()] %s line [%d]", s.func, s.src, s.line))
	Chat("LOCALS")
	if (s = getstackinfos(2))
	{
		foreach (n, v in s.locals)
		{
			local t = type(v)
			t ==    "null" ? Chat(format("[%s] NULL"  , n))    :
			t == "integer" ? Chat(format("[%s] %d"    , n, v)) :
			t ==   "float" ? Chat(format("[%s] %.14g" , n, v)) :
			t ==  "string" ? Chat(format("[%s] \"%s\"", n, v)) :
			t ==  "vector" ? Chat(format("[%s] vector (%s)" , n, v.ToKVString())) :
							 Chat(format("[%s] %s %s" , n, t, v.tostring()))
		}
	}

	return
})
PrintToConsoleAll("Included Library Successfully")