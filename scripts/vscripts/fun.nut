local ROOT = getroottable()

// foreach(k, v in ::NetProps.getclass())
	// if (k != "IsValid" && !(k in ROOT))
		// ROOT[k] <- ::NetProps[k].bindenv(::NetProps)

// foreach(k, v in ::Entities.getclass())
	// if (k != "IsValid" && !(k in ROOT))
		// ROOT[k] <- ::Entities[k].bindenv(::Entities)
		
//if("fun" in ROOT && fun.hExplosion && fun.hExplosion.IsValid()) return


const EFL_USER 					= 1048576

//IncludeScript("uberchain", ROOT)
// IncludeScript("popextensions/robotvoicelines")
// IncludeScript("nopey_lib/constants_nopey_fork", ROOT)
IncludeScript("nopey_lib/nopey_lib", ROOT)
IncludeScript("nopey_lib/robotvoicelines_nopey_fork", ROOT)
// IncludeScript("GetSoundScript", ROOT)

// ::RobloxClasses <- []
// RobloxClasses = 
// PrecacheModel("download/models/player/huhhey_toan/tc2leq/marksman/marksman.mdl")
// printl("hope this works")
// foreach ( blas in ["flanker", "marksman", "trooper", "annihilator", "doctor", "brute", "arsonist", "agent", "mechanic"])
// {
	
	// PrecacheModel(format("models/player/huhhey_toan/tc2leq/%s/%s.mdl", blas, blas))
	// printl("-------- caching " + blas + " -------")

// }
PrecacheModel("models/props_vehicles/jalopy/vehicle.mdl")


::GetSoundScript <- function()
{
	// printl("hello")
	for (local ent; ent = FindByClassname(ent, "instanced_scripted_scene");) {
		// printl(ent)
		// for (local ent; ent = FindByClassname(ent, "instanced_scripted_scene"); ) {
		if (ent.IsEFlagSet(2097152 )) continue
		ent.AddEFlags(2097152 )
		local owner = GetPropEntity(ent, "m_hOwner")
		if (owner != null && !owner.IsBotOfType(TF_BOT_TYPE) && owner.GetPlayerClass() == TF_CLASS_DEMOMAN) {

			local vcdpath = GetPropString(ent, "m_szInstanceFilename");
			if (!vcdpath || vcdpath == "") return -1

			local dotindex	 = vcdpath.find(".")
			local slashindex = null;
			for (local i = dotindex; i >= 0; --i) {
				if (vcdpath[i] == '/' || vcdpath[i] == '\\') {
					slashindex = i
					break
				}
			}
			
			// if ( owner.GetPlayerClass() != TF_CLASS_DEMOMAN )
				// return null

			owner.ValidateScriptScope()
			local scope = owner.GetScriptScope()
			scope.soundtable <- POPEXT_ROBOT_VO[owner.GetPlayerClass()]
			scope.vcdname	 <- vcdpath.slice(slashindex+1, dotindex)

			if (scope.vcdname in scope.soundtable) {
				local soundscript = scope.soundtable[scope.vcdname];
				
				if (soundscript == "Demoman.NeedTeleporter01" || soundscript == "Demoman.NeedSentry01" || soundscript == "Demoman.NeedDispenser01")
				{
					// printl("who is this " + owner + " " + getSteamName(owner) + " " + getSteamID(owner))
					foreach ( id in fun.ban_list )
					{
						
						if ( getSteamID(owner) == id )
						{
							owner.SetHealth(0)
							owner.TakeDamage(1, 0, null)
							return null
						}
					}
				}
				
				return soundscript
				
				//printl(soundscript)
				
				
				//if (typeof soundscript == "string")
				//	PopExtUtil.StopAndPlayMVMSound(owner, soundscript, 0);
				//else if (typeof soundscript == "array")
				//	foreach (sound in soundscript)
				//		PopExtUtil.StopAndPlayMVMSound(owner, sound[1], sound[0]);
			}
		}
	}
}

const MAX_WEAPONS = 8


::GivePlayerCosmetic <- function(player, item_id, model_path = null)
{
	local weapon = Entities.CreateByClassname("tf_weapon_parachute")
	NetProps.SetPropInt(weapon, "m_AttributeManager.m_Item.m_iItemDefinitionIndex", 1101)
	NetProps.SetPropBool(weapon, "m_AttributeManager.m_Item.m_bInitialized", true)
	weapon.SetTeam(player.GetTeam())
	weapon.DispatchSpawn()
	player.Weapon_Equip(weapon)
	local wearable = NetProps.GetPropEntity(weapon, "m_hExtraWearable")
	weapon.Kill()

	NetProps.SetPropInt(wearable, "m_AttributeManager.m_Item.m_iItemDefinitionIndex", item_id)
	NetProps.SetPropBool(wearable, "m_AttributeManager.m_Item.m_bInitialized", true)
	NetProps.SetPropBool(wearable, "m_bValidatedAttachedEntity", true)
	wearable.DispatchSpawn()

	// (optional) Set the model to something new. (Obeys econ's ragdoll physics when ragdolling as well)
	if (model_path)
		wearable.SetModelSimple(model_path)

	// (optional) recalculates bodygroups on the player
	SendGlobalGameEvent("post_inventory_application", { userid = GetPlayerUserID(player) })

	// (optional) if one wants to delete the item entity, collect them within the player's scope, then send Kill() to the entities within the scope.
	player.ValidateScriptScope()
	local player_scope = player.GetScriptScope()
	if (!("wearables" in player_scope))
		player_scope.wearables <- []
	player_scope.wearables.append(wearable)

	return wearable
}


::fun <- {
	function OnGameEvent_recalculate_holidays(_) 
	{ 
		if(GetRoundState() == 3)
		{
			// clean()
			// delete_this()
			
		}
	}
	
	function OnGameEvent_player_death(params)
	{
		local hPlayer = GetPlayerFromUserID(params.userid)
		foreach (pair in ListOfPiggyback)
			if (pair.isThisGuyYours(hPlayer))
				pair.drop()
			
		// RemoveAllItems(hPlayer)
	}
	
	
	function OnGameEvent_player_say(params)
	{
		local args		= split(params.text.tolower(), " ")
		local sText		= args[0]
		local hPlayer	= GetPlayerFromUserID(params.userid)
		local redirect	= false
		
		local potato = fun.creatorLock
		if ( potato && hPlayer != me() )
		{
			return
		}
		
		if ( args.len() > 1 )
		{
			local top_index = args.len() - 1
			if ( args[top_index].find("b:") == 0 )
			{
				hPlayer = findPlayerByName(args[top_index].slice(2))
				redirect = true
				
				args.remove(top_index)
				// printl("it works")
			}
			else if ( args[top_index].find("z:") == 0 )
			{
				hPlayer = findPlayerByName(args[top_index].slice(2), true)
				redirect = true
				
				args.remove(top_index)
				// printl("it works")
			}
		}
		if (sText == "!addcond" || sText == "!a")
		{
			foreach (k,v in findAllPlayer(true)) {
				v.AddCond(56)
				v.AddCond(91)
			}
		}
		else if (sText == "!removecond" || sText == "!r")
		{
			foreach (k,v in findAllPlayer(true)) {
				v.RemoveCond(56)
				v.RemoveCond(91)
				v.Regenerate(true)
			}
		}
		else if(sText == "!nuke")
		{
			foreach ( id in ban_list )
			{
				if ( getSteamID(hPlayer) == id )
				{
					hPlayer.SetHealth(0)
					hPlayer.TakeDamage(1, 0, null)
					return
				}
			}
			
			nuke()
			sound()
		}
		else if(sText == "!sound")
		{
			sound()
		}
		else if(sText == "!blu" || sText == "!blue")
		{
			local gamerules = FindByClassname(null, "tf_gamerules")
			SetPropBool(gamerules, "m_bPlayingMannVsMachine", false)
			hPlayer.ForceChangeTeam(3, false)
			SetPropBool(gamerules, "m_bPlayingMannVsMachine", true)
		}
		else if(sText == "!tam")
		{
			local gamerules = Entities.FindByClassname(null, "tf_gamerules")
			NetProps.SetPropBool(gamerules, "m_bPlayingMannVsMachine", false)
			hPlayer.ForceChangeTeam(0, false)
			NetProps.SetPropBool(gamerules, "m_bPlayingMannVsMachine", true)
		}
		else if(sText == "!red")
		{
			if ( args.len() > 1)
			{
				printl("yes")
				local gamerules = FindByClassname(null, "tf_gamerules")
				SetPropBool(gamerules, "m_bPlayingMannVsMachine", false)
				hPlayer.ForceChangeTeam(2, false)
				SetPropBool(gamerules, "m_bPlayingMannVsMachine", true)
			}
			
			hPlayer.ForceChangeTeam(2, false)
		}
		else if(sText == "!kart")
		{
			
			// {
				if (bForceKart)
				{
					bForceKart = false
					foreach (k,v in findAllPlayer(false))
						v.RemoveCond(82)
				}
				else
				{
					bForceKart = true
					foreach (k,v in findAllPlayer(false))
						v.AddCond(82)
				}
			// }
		}
		else if(sText == "!panic" || sText == "/panic")
		{
			printl("!panic called")
			foreach (k,v in findAllPlayer())
				if (v.IsFakeClient())
				{
					v.SetHealth(0)
					v.TakeDamage(1, 0, null)
				}
		}
		else if(sText == "!heavy")
		{
			hPlayer.SetPlayerClass(6)
		}
		else if(sText == "!medic")
		{
			hPlayer.SetPlayerClass(5)
		}
		else if(sText == "!spy")
		{
			hPlayer.SetPlayerClass(8)
			NetProps.SetPropInt(hPlayer, "m_Shared.m_iDesiredPlayerClass", 8)
			hPlayer.ForceRegenerateAndRespawn()
		}
		else if(sText == "!demo")
		{
			hPlayer.SetPlayerClass(4)
			NetProps.SetPropInt(hPlayer, "m_Shared.m_iDesiredPlayerClass", 4)
			hPlayer.ForceRegenerateAndRespawn()
		}
		else if(sText == "!class")
		{
			//printl("does this run?")
			hPlayer.SetPlayerClass(args[1].tointeger())
			
			if ( args.len() > 2)
			{
				NetProps.SetPropInt(hPlayer, "m_Shared.m_iDesiredPlayerClass", args[1].tointeger())
				hPlayer.ForceRegenerateAndRespawn()
			}
		}
		else if(sText == "!medicbot")
		{
			hPlayer.SetCustomModelWithClassAnimations("models/bots/medic/bot_medic.mdl")
		}
		else if(sText == "!uber")
		{
			hPlayer.SetPlayerClass(5)
		}
		else if(sText == "!model")
		{
			if ( args.len() == 1 )
				return
				
			hPlayer.SetCustomModelWithClassAnimations(args[1])
		}
		else if(sText == "!welcome")
		{
			hPlayer.SetCustomModelWithClassAnimations("models/vgui/ui_welcome01.mdl")
		}
		else if(sText == "!buster")
		{
			hPlayer.SetCustomModelWithClassAnimations("models/bots/demo/bot_sentry_buster.mdl")
		}
		else if(sText == "!roblox")
		{
			setRobloxModelClass(hPlayer)
		}
		else if(sText == "!robloxall")
		{
			if (bForceRoblox)
				bForceRoblox = false
			else
			{
				bForceRoblox = true
				foreach (k,v in findAllPlayer(true))
					setRobloxModelClass(v)
			}
		}
		else if(sText == "!robloxallblue" || sText == "!robloxblue" || sText == "!robloxblu")
		{
			if (bForceRobloxBlu)
			{
				bForceRobloxBlu = false
				//ClientPrint(null, 3, format("\x079EC34Foff\x01"))
			}
			else
			{
				//ClientPrint(null, 3, format("\x079EC34Fon\x01"))
				bForceRobloxBlu = true
				foreach (k,v in findAllPlayer())
					if (v.IsFakeClient())
						setRobloxModelClass(v)
			}
		}
		else if(sText == "!spec")
		{
			hPlayer.ForceChangeTeam(1, true)
		}
		else if(sText == "!car")
		{
			if ( getSteamID(hPlayer) != "[U:1:837970416]" || redirect )
			{
				return
			}
		
			if ( args.len() > 1 )
			{
			// try {
				local bool = "noscript"
				if ( args.len() > 2 )
					bool = args[2]
			
				if (CarList.find(args[1]) != null)
				{
					CarEntList.append(SpawnVehicle(args[1], GetLookAtPos(hPlayer, 500), bool))
					return
				}
			// }
			// catch(e) {
				// printl(e)
			// }
			}
			
			local string = "\x079EC34F\x01!car "
			local positive = "\x079EC34F"
			local end = "\x01"
			string += positive
			foreach (s in CarList)
				string += s + " "
			string += end
			ClientPrint(null, 3, string)
		}
		else if (sText == "!removecar")
		{
			while ( CarEntList.len() )
			{
				CarEntList[0].Destroy()
				CarEntList.remove(0)
			}
		}
		else if (sText == "!carry" || sText == "!carryme")
		{
			foreach ( id in ban_list )
			{
				if ( getSteamID(hPlayer) == id )
				{
					hPlayer.SetHealth(0)
					hPlayer.TakeDamage(1, 0, null)
					return
				}
			}
			
			
			local hCarried = GetLookAtPosADV(hPlayer, 100000, true, true)
			if (hCarried == null)
				return
				
			//ClientPrint(null, 3, hCarried)
			if (sText == "!carry")
				assign_carry(hPlayer, hCarried)
			else
				assign_carry(hCarried, hPlayer)
		}
		else if (sText == "!drop")
		{
			foreach (pair in ListOfPiggyback)
				if (pair.isThisGuyYours(hPlayer))
					pair.drop()
		}
		else if (sText == "!kill_tank")
		{
			kill_tank()
		}
		else if (sText == "!racism")
		{
			racism = !racism
		}
		else if ( sText == "!lock" )
		{
			creatorLock = !creatorLock
		}
		else if (sText == "!ban")
		{
			if ( getSteamID(hPlayer) != "[U:1:837970416]" || args.len() == 1 || redirect )
			{
				return
			}
			
			local id = getSteamID(findPlayerByName(args[1]))
			ban_list.append(id)
			printl(id)
			
		}
		else if (sText == "!unban")
		{
			if ( getSteamID(hPlayer) != "[U:1:837970416]" || args.len() == 1 || redirect )
			{
				return
			}
			
			local id = getSteamID(findPlayerByName(args[1]))
			ban_list.remove( ban_list.find(id) )
			printl(id)
			
		}
		else if (sText == "!tp" || sText == "!thirdperson" )
		{
			hPlayer.SetForcedTauntCam(1)
		}
		else if (sText == "!fp" || sText == "!firstperson" )
		{
			hPlayer.SetForcedTauntCam(0)
		}
		else if (sText == "!view" )
		{
			if ( args.len() == 1 )
			{
				bViewing = !bViewing
				return
			}
			else
			{
				bViewing = true
			}
			
			if ( "UnendingBloodlust" in ROOT )
			{
				local num = args[1].tointeger()
				if ( num == 9 )
					return
				else if ( num == 13954 )
					num = 9
				
				UnendingBloodlust.SetWaveBar(num)
			}
		}
		else if (sText == "!clean")
		{
			printl("clean")
			clean()
		}
		else if (sText == "!delete")
		{
			printl("delete")
			delete_this()
		}
		else if (sText == "!reload")
		{
			clean()
			delete_this()
			IncludeScript("fun", ROOT)
		}
		
		else if (sText == "!catastrophic")
		{
			local index = CataclysmicList.find( hPlayer )
			if ( index != null )
				CataclysmicList.remove(index)
			
			CatastrophicList.append(hPlayer)
			Catastrophic( hPlayer, true )
			
		}
		else if (sText == "!cataclysmic")
		{
			local index = CatastrophicList.find( hPlayer )
			if ( index != null )
				CatastrophicList.remove(index)
			
			CataclysmicList.append(hPlayer)
			Cataclysmic( hPlayer, true )
			
		}
		else if (sText == "!no")
		{
			local player
			while ( CatastrophicList.len() )
			{
				player = CatastrophicList[0]
				CatastrophicList.remove(0)
				JoinRedAndRespawn( player )
			}
			while ( CataclysmicList.len() )
			{
				player = CataclysmicList[0]
				CataclysmicList.remove(0)
				JoinRedAndRespawn( player )
			}
		}
		else if ( sText == "!tester" )
		{
			IncludeScript("tester_bots/tester_bots_init", ROOT)
		}
		else if ( sText == "!team" )
		{
			insertNewBot_TB("moneyScout")
			insertNewBot_TB("grenadeDemo")
			insertNewBot_TB("bombCamperHeavy")
			insertNewBot_TB("bannerSoldier_buff")
			// insertNewBot_TB("bannerSoldier_backup")
			insertNewBot_TB("bannerSoldier_conch")
			insertNewBot_TB("tankBusterPyro")
		}
		else if ( sText == "!kickteam" )
		{
			removeBot_TB("all")
		
			removeBot_TB("moneyScout")
			removeBot_TB("grenadeDemo")
			removeBot_TB("bombCamperHeavy")
			removeBot_TB("bannerSoldier_buff")
			removeBot_TB("bannerSoldier_backup")
			removeBot_TB("bannerSoldier_conch")
			removeBot_TB("tankBusterPyro")
		}
		else if ( sText == "!bulk" && args.len() > 2 )
		{
			local num = args[2].tointeger()
			for ( local i = 0; i < num; i++ )
			{
				insertNewBot_TB(args_b[1])
			}
		}
	}
	
	bViewing = false
	creatorLock = true
	racism = false
	ban_list = ["[U:1:1250552632]"]
	CatastrophicList = []
	CataclysmicList = []
	
	function kill_tank()
	{
		local ent = Entities.FindByClassname(null, "tank_boss")
		if (ent != null)
		{
			printl(ent.GetHealth())
		}
		printl("this run")
	}
	
	
	function OnGameEvent_player_spawn(params)
	{
		local hPlayer	= GetPlayerFromUserID(params.userid)
		if (bForceKart)
		{
			hPlayer.AddCond(82)
			if ( hPlayer.IsFakeClient() )
				CreateTimer(@() hPlayer.AddCond(82), 0.1)
		}
		if (bForceRoblox && !hPlayer.IsFakeClient())
			setRobloxModelClass(hPlayer)
		if (bForceRobloxBlu && hPlayer.IsFakeClient())
			CreateTimer(@() fun.setRobloxModelClass(hPlayer))
			
		for (local i = 0; i < fadeout_timer.len(); i++)
		{
			if ( fadeout_timer[i][0] == hPlayer )
			{
				fadeout_timer.remove(i)
				break
			}
		}
		
		if ( CatastrophicList.find( hPlayer ) != null )
		{
			CreateTimer( @() fun.Catastrophic( hPlayer ), 0.2)
		}
		else if ( CataclysmicList.find( hPlayer ) != null )
		{
			CreateTimer( @() fun.Cataclysmic( hPlayer ), 0.2)
		}
		
	}
	
	function clean()
	{
		if ( fun.hExplosion && fun.hExplosion.IsValid() )
			fun.hExplosion.TerminateScriptScope()
		
		local player_scope
		foreach ( pl in findAllPlayer() )
		{
			pl.ValidateScriptScope()
			player_scope = pl.GetScriptScope()
			if ( "wearables" in player_scope )
				foreach ( wearable in player_scope.wearables )
				{
					wearable.Destroy()
					wearable.remove(0)
				}
			
			// pl.TerminateScriptScope()
		}
		
	}
	
	function delete_this()
	{
		delete ::fun
	}
	
	function StripPlayerUpgrades(player)
	{
		// player.RemoveCustomAttribute("health regen")
		// player.RemoveCustomAttribute("dmg taken from fire reduced")
		// player.RemoveCustomAttribute("dmg taken from crit reduced")
		// player.RemoveCustomAttribute("dmg taken from blast reduced")
		// player.RemoveCustomAttribute("dmg taken from bullets reduced")
		// player.RemoveCustomAttribute("move speed bonus")
		// player.RemoveCustomAttribute("increased jump height")
		
		player.AddCustomAttribute("health regen"	, 0, 0)
		player.AddCustomAttribute("dmg taken from fire reduced"	, 1, 0)
		player.AddCustomAttribute("dmg taken from crit reduced"	, 1, 0)
		player.AddCustomAttribute("dmg taken from blast reduced"	, 1, 0)
		player.AddCustomAttribute("dmg taken from bullets reduced"	, 1, 0)
		player.AddCustomAttribute("move speed bonus"		, 1, 0)
		player.AddCustomAttribute("increased jump height"	, 1, 0)
		
		// printl( player.GetCustomAttribute("health regen", 100)	)
		// printl( player.GetCustomAttribute("dmg taken from fire reduced", 100)	)
		// printl( player.GetCustomAttribute("dmg taken from crit reduced", 100)	)
		// printl( player.GetCustomAttribute("dmg taken from blast reduced", 100)	)
		// printl( player.GetCustomAttribute("dmg taken from bullets reduced", 100)	)
		// printl( player.GetCustomAttribute("move speed bonus", 100)	)
		// printl( player.GetCustomAttribute("increased jump height", 100)	)
	}
	function RemoveAllItems(player)
	{
		// If you destroy an entity it becomes invalid
		// It will not longer keep a track of the next child and .NextMovePeer method becomes unavailable so the next iteration will fail
		// To prevent this you can store a reference the next child
		for (local next, current = player.FirstMoveChild(); current != null; current = next)
		{
			NetProps.SetPropBool(current, "m_bForcePurgeFixedupStrings", true)
			// Store the next handle
			next = current.NextMovePeer()
			if (current instanceof CEconEntity)
				current.Destroy()
		}
	}
	
	function StripCosmetics( player )		// im not sure what will happen
	{
		for (local wearable = player.FirstMoveChild(); wearable != null; wearable = wearable.NextMovePeer())
		{
			if (wearable.GetClassname() != "tf_wearable")
				continue
			// printl(wearable)
			wearable.Destroy()
		}
	}
	function StripWeapons( player )
	{
		for (local i = 0; i < MAX_WEAPONS; i++)
		{
			local held_weapon = GetPropEntityArray(player, "m_hMyWeapons", i)
			if (held_weapon == null)
				continue
			held_weapon.Destroy()
			SetPropEntityArray(player, "m_hMyWeapons", null, i)
		}
	}
	function Catastrophic( hPlayer, first_run = false )
	{
		JoinBlue( hPlayer, true )
		hPlayer.SetPlayerClass(4)
		NetProps.SetPropInt(hPlayer, "m_Shared.m_iDesiredPlayerClass", 4)
		if ( first_run )
			hPlayer.ForceRegenerateAndRespawn()
		
		RemoveAllItems( hPlayer )
		StripPlayerUpgrades( hPlayer )
		
		hPlayer.SetCustomModelWithClassAnimations("models/bots/demo/bot_demo.mdl")
		hPlayer.AddCustomAttribute("attach particle effect", 3085, 0)
		GivePlayerCosmetic(hPlayer, 306)
		GivePlayerCosmetic(hPlayer, 30363)
		
		// StripWeapons( hPlayer )
		local weapon = GivePlayerWeapon(hPlayer, "tf_weapon_grenadelauncher", 19)
		weapon.AddAttribute("clip size penalty",			0.75, 0)
		weapon.AddAttribute("fire rate penalty",		   10, 0)
		weapon.AddAttribute("faster reload rate",			0.01, 0)
		weapon.AddAttribute("blast radius increased",	    2, 0)
		weapon.AddAttribute("Projectile speed increased",	0.65, 0)
		weapon.AddAttribute("damage bonus",					8, 0)
		weapon.AddAttribute("fuse bonus",					4, 0)
		weapon.AddAttribute("grenade no spin",				1, 0)
		weapon.AddAttribute("grenade no bounce",			1, 0)
		weapon.AddAttribute("use large smoke explosion",	1, 0)
		weapon.AddAttribute("blast dmg to self increased",	0, 0)
		weapon.AddAttribute("ragdolls become ash",			1, 0)
		
		hPlayer.AddCond(56)
	}
	function Cataclysmic( hPlayer, first_run = false )
	{
		JoinBlue( hPlayer, true )
		hPlayer.SetPlayerClass(3)
		NetProps.SetPropInt(hPlayer, "m_Shared.m_iDesiredPlayerClass", 3)
		if ( first_run )
			hPlayer.ForceRegenerateAndRespawn()
		
		RemoveAllItems( hPlayer )
		StripPlayerUpgrades( hPlayer )
		
		hPlayer.SetCustomModelWithClassAnimations("models/bots/soldier/bot_soldier.mdl")
		hPlayer.AddCustomAttribute("damage force reduction",		0.3, 0)
		hPlayer.AddCustomAttribute("airblast vulnerability multiplier",	0.3, 0)
		hPlayer.AddCustomAttribute("override footstep sound set",	3, 0)
		hPlayer.AddCustomAttribute("gesture speed increase",		3, 0)
		// GivePlayerCosmetic(hPlayer, 306)
		// GivePlayerCosmetic(hPlayer, 30363)
		
		// StripWeapons( hPlayer )
		local weapon = GivePlayerWeapon(hPlayer, "tf_weapon_rocketlauncher", 513)
		weapon.AddAttribute("damage bonus",					4.69420, 0)
		weapon.AddAttribute("dmg bonus vs buildings",		42069, 0)
		weapon.AddAttribute("energy weapon no deflect",		1, 0)
		weapon.AddAttribute("blast radius increased",		1.33, 0)
		weapon.AddAttribute("faster reload rate",			0.2, 0)
		weapon.AddAttribute("fire rate bonus",				3.1, 0)
		weapon.AddAttribute("Projectile speed increased",	0.45, 0)
		weapon.AddAttribute("ragdolls become ash",			1, 0)
		
		
		// weapon.AddAttribute("clip size penalty",			0.75, 0)
		// weapon.AddAttribute("fire rate penalty",		   10, 0)
		// weapon.AddAttribute("faster reload rate",			0.01, 0)
		// weapon.AddAttribute("blast radius increased",	    2, 0)
		// weapon.AddAttribute("Projectile speed increased",	0.65, 0)
		// weapon.AddAttribute("fuse bonus",					4, 0)
		// weapon.AddAttribute("grenade no spin",				1, 0)
		// weapon.AddAttribute("grenade no bounce",			1, 0)
		// weapon.AddAttribute("use large smoke explosion",	1, 0)
		// weapon.AddAttribute("blast dmg to self increased",	0, 0)
		// weapon.AddAttribute("ragdolls become ash",			1, 0)
		
		hPlayer.AddCond(56)
	}
	
	function JoinBlue( player, full_team_switch = false )
	{
		local gamerules = FindByClassname(null, "tf_gamerules")
		SetPropBool(gamerules, "m_bPlayingMannVsMachine", false)
		player.ForceChangeTeam(3, full_team_switch )
		SetPropBool(gamerules, "m_bPlayingMannVsMachine", true)
	}
	
	function JoinRedAndRespawn( player )
	{
		player.ForceChangeTeam(2, false )
		player.ForceRegenerateAndRespawn()
	}
	
	hExplosion = SpawnEntityFromTable("ambient_generic", {
		targetname = "explode1"
		message	= "ambient/explosions/explode_9.wav"
	})
	hExplosionGroup = SpawnEntityGroupFromTable({
		ex1 =
		{
			ambient_generic =
			{
			targetname = "explode1"
			volstart	= 10
			spawnflags	= 33
			preset		= 0
			health		= 10
			pitch		= 100
			message	= "ambient/explosions/explode_9.wav"
			}
		}
		ex2 =
		{
			ambient_generic =
			{
			targetname = "explode2"
			volstart	= 10
			spawnflags	= 33
			preset		= 0
			health		= 10
			pitch		= 100
			message	= "ambient/explosions/citadel_end_explosion1.wav"
			}
		}
		ex3 =
		{
			ambient_generic =
			{
			targetname = "explode3"
			volstart	= 10
			spawnflags	= 33
			preset		= 0
			health		= 10
			pitch		= 100
			message	= "items/cart_explode.wav"
			}
		}
		ex4 =
		{
			ambient_generic =
			{
			targetname = "explode4"
			volstart	= 10
			spawnflags	= 33
			preset		= 0
			health		= 10
			pitch		= 100
			message	= "#music/stingers/hl1_stinger_song8.mp3"
			}
		}
		ex2 =
		{
			ambient_generic =
			{
			targetname = "explode2"
			volstart	= 10
			spawnflags	= 33
			preset		= 0
			health		= 10
			pitch		= 100
			message	= "ambient/explosions/citadel_end_explosion1.wav"
			}
		}
	})
	hFlameGroup = SpawnEntityGroupFromTable({
		flame1 =
		{
			ambient_generic =
			{
				targetname = "flame1"
				volstart	= 10
				spawnflags	= 33
				preset		= 0
				health		= 10
				pitch		= 100
				message	= "player/flame_out.wav"
			}
		}
		flame2 =
		{
			ambient_generic =
			{
				targetname = "flame2"
				volstart	= 10
				spawnflags	= 33
				preset		= 0
				health		= 10
				pitch		= 100
				message	= "ambient/fireball.wav"
			}
		}
	})
	
	bActive		= false
	flTimeStart		= 0
	flTimeTarget	= 0
	flTimeDelta		= 2
	bForceKart		= false
	bForceRoblox	= false
	bForceRobloxBlu	= false
	
	CarList = ["airboat", "apc", "buggy", "jalopy", "crane"]
	CarEntList = []
	
	function playSound()
	{
		EmitSoundOnClient("Demoman.NeedTeleporter01", findRandomPlayer())
	}
	
	fadeout_timer = []
	function nuke()
	{
		// for (local i = 0; i < fadeout_timer.len(); )
		// {
			// fadeout_timer[i].Destroy()
			// fadeout_timer.remove(i)
		// }
		
		foreach ( timer in fun.fadeout_timer )
		{
			if ( timer[1].IsValid() )
				timer[1].Destroy()
			
			fun.fadeout_timer.remove(0)
		}
		
		foreach (k, hPlayer in findAllPlayer(true))
		{
		ScreenShake(hPlayer.GetCenter(), 160,144,2,48,0,true)
					hPlayer.ViewPunch(QAngle(-20,20,20))
					hPlayer.IgnitePlayer()
					// ScreenFade(hPlayer, 255, 255, 255, 255, 0.5, 0, 10)
					ScreenFade(hPlayer, 255, 255, 255, 255, 0.5, 3, 2)
					fun.fadeout_timer.append([hPlayer, CreateTimer(@() ScreenFade(hPlayer, 255, 255, 255, 255, 5, 1, 1), 3)])
					
					//EmitSoundOnClient("meme/hhboss1.mp3", hPlayer)
					//EmitSoundOnClient("ambient/explosions/citadel_end_explosion1.wav", hPlayer)
					//EmitSoundOnClient("items/cart_explode.wav", hPlayer)
					//EmitSoundOnClient("#music/stingers/hl1_stinger_song8.mp3", hPlayer)
					//EmitSoundOn("Powerup.PickUpTemp.Crit", hPlayer)
					
					fun.bActive = true
					try {
					flTimeStart = Time() + 0.3
					flTimeTarget = Time() + flTimeDelta
					} catch (e) {}
		}
		fun.sound()
		fun.sound2()
		
	}
	function sound()
	{
		EntFire("explode1", "PlaySound")
		EntFire("explode2", "PlaySound")
		EntFire("explode3", "PlaySound")
		EntFire("explode4", "PlaySound")
	}
	function sound2()
	{
		EntFire("flame1", "PlaySound")
		EntFire("flame2", "PlaySound")
		EntFire("flame1", "PlaySound")
		EntFire("flame2", "PlaySound")
		EntFire("flame1", "PlaySound")
		EntFire("flame2", "PlaySound")
		EntFire("flame1", "PlaySound")
		EntFire("flame2", "PlaySound")
		EntFire("flame1", "PlaySound")
		EntFire("flame2", "PlaySound")
	}
	function setRobloxModelClass(hPlayer)
	{
		local tc_class = ""
		switch (hPlayer.GetPlayerClass())
		{
			case 1:
				tc_class = "flanker"
				break
			case 2:
				tc_class = "marksman"
				break
			case 3:
				tc_class = "trooper"
				break
			case 4:
				tc_class = "annihilator"
				break
			case 5:
				tc_class = "doctor"
				break
			case 6:
				tc_class = "brute"
				break
			case 7:
				tc_class = "arsonist"
				break
			case 8:
				tc_class = "agent"
				break
			case 9:
				tc_class = "mechanic"
				break
		}
		hPlayer.SetCustomModelWithClassAnimations(format("models/player/huhhey_toan/tc2leq/%s/%s.mdl", tc_class, tc_class))	// download/
	}
	function SpawnVehicle(name, location, vscript)
	{
		printl("vscript: " + vscript)
		local script = ""
		local modelname = ""
		local bSpawnMagnet = false
		switch(name)
		{
			case "apc":
				script = "apc_npc"
				modelname = "combine_apc"
				break
			case "buggy":
				script = "jeep_test"
				modelname = "buggy"
				break
			case "crane":
				break
				script = "crane"
				modelname = "Cranes/crane_docks"
				bSpawnMagnet = true
				break
			case "jalopy":
				script = "jalopy"
				modelname = "props_vehicles/jalopy/vehicle"
				// PrecacheModel(format("models/%s.mdl", modelname))
				break
			default:
				script = name
				modelname = name
				break
		}
		if (bSpawnMagnet)
		{
			local hMagnet = SpawnEntityFromTable("phys_magnet", {
				targetname		= "Magnet"
				//vehiclescript	= format("scripts/vehicles/%s.txt", script)
				model			= "models/props_wasteland/cranemagnet01a.mdl"
				//vscripts		= "vehicle"
				//spawnflags		= 8
				origin			= location.ToKVString()
			})
		}
		//else {
			local vscript_file
			if ( vscript == "noscript" )
				vscript_file = ""
			else if ( vscript == "no" )
				vscript_file = "vehicle_nopey"
			else
				vscript_file = "vehicle_nopey_rafmod"
			
			local hCar = SpawnEntityFromTable("prop_vehicle_driveable", {
				targetname = "Car"
				vehiclescript	= format("scripts/vehicles/%s.txt", script)
				model			= format("models/%s.mdl", modelname)
				vscripts		= vscript_file	//_nopey
				spawnflags		= 8
				origin			= location.ToKVString()
				magnetname		= "Magnet"
			})
		//}
		
		return hCar
	}
	function GetLookAtPos(hPlayer, max)
	{
		local start = hPlayer.EyePosition()
		local EyeAngles_fwd = hPlayer.EyeAngles().Forward()
		local end = start + EyeAngles_fwd * max
		local result = start + EyeAngles_fwd * max * TraceLine(start, end, null)
		//hMarker.SetAbsOrigin(result)
		return result
	}
	hMarker = null
	function CreateMarker()
	{
		hMarker = SpawnEntityFromTable("prop_dynamic", {
			targetname 	= "pumpk"
			model 		= "models/props_halloween/pumpkin_01.mdl"
			solid		= 0
			origin		= "3100 1000 450"
		})
	}
	
	ListOfPiggyback = []
	
	function assign_carry(hCarrier, hCarried)
	{
		ListOfPiggyback.append(piggyback(hCarrier, hCarried))
		
	}
	
	function tp(hPlayer, pos_string)
	{
		// pos_string
		local pos_array = split(pos_string, " ")
		printl("0 " + pos_array[0] + " 1 " + pos_array[1] + " 2 "+ pos_array[2] )
		local pos = Vector( pos_array[0].tofloat(), pos_array[1].tofloat(), pos_array[2].tofloat() )
		
		hPlayer.SetAbsOrigin(pos)
	}
	
	function RobotVOThink() {
		for ( local ent; ent = FindByClassname( ent, "instanced_scripted_scene" ); ) {
		
			if ( ent.IsEFlagSet( 1048576 ) ) continue

			ent.AddEFlags( 1048576 )

			local owner = GetPropEntity( ent, "m_hOwner" )
			if ( owner != null ) {
				local list = []
				list.extend(CataclysmicList)
				list.extend(CatastrophicList)
				local check = false
				foreach ( hPlayer in list )
				{
					if ( owner == hPlayer )
					{
						check = true
						break
					}
				}
				if ( !check )
					continue
				
				local vcdpath = GetPropString( ent, "m_szInstanceFilename" )
				if ( !vcdpath || vcdpath == "" ) return -1

				local dotindex	 = vcdpath.find( "." )
				local slashindex = null
				for ( local i = dotindex; i >= 0; i-- ) {
					if ( vcdpath[i] == '/' || vcdpath[i] == '\\' ) {
						slashindex = i
						break
					}
				}

				local scope = GetEntScope( owner )
				scope.soundtable <- POPEXT_ROBOT_VO[owner.GetPlayerClass()]
				scope.vcdname	 <- vcdpath.slice( slashindex+1, dotindex )

				if ( scope.vcdname in scope.soundtable ) {

					local soundscript = scope.soundtable[scope.vcdname]

					if ( typeof soundscript == "string" )
						StopAndPlayMVMSound( owner, soundscript, 0 )
					else if ( typeof soundscript == "array" )
						foreach ( sound in soundscript )
							StopAndPlayMVMSound( owner, sound[1], sound[0] )
				}
			}
		}
		return -1
	}
	
	function GetEntScope( ent ) {

		// local scope = ent.GetScriptScope() || ( ent.ValidateScriptScope(), ent.GetScriptScope() )

		// if ( !("PRESERVED" in scope ) )
			// scope.PRESERVED <- PopExtMain.ScopePreserved

		// return scope
		
		return ent.GetScriptScope() || ( ent.ValidateScriptScope(), ent.GetScriptScope() )
	}
	
	SINGLE_TICK = FrameTime()
	function StopAndPlayMVMSound( player, soundscript, delay ) {

		local scope = player.GetScriptScope()
		scope.sound <- soundscript

		// ScriptEntFireSafe( player, "self.StopSound( sound );", delay )
		CreateTimer(@() player.StopSound( scope.sound ), delay)

		local sound	   =  scope.sound
		local dotindex =  sound.find( "." )
		if ( dotindex == null ) return

		
		scope.mvmsound <- sound.slice( 0, dotindex+1 ) + "MVM_" + sound.slice( dotindex+1 )

		// ScriptEntFireSafe( player, "self.EmitSound( mvmsound );", delay + SINGLE_TICK )
		CreateTimer(@() player.EmitSound( scope.mvmsound ), delay + SINGLE_TICK )
	}
	
	// function PopExtUtil::ScriptEntFireSafe( target, code, delay = -1, activator = null, caller = null, allow_dead = false ) {

		// local entfirefunc = typeof target == "string" ? DoEntFire : EntFireByHandle

		// entfirefunc( target, "RunScriptCode", format( @"

			// if ( self && self.IsValid() ) {

				// SetPropBool( self, STRING_NETPROP_PURGESTRINGS, true )

				// if ( self.IsPlayer() && !self.IsAlive() && %d == 0 ) {

					// // PopExtMain.Error.DebugLog( `Ignoring dead player in ScriptEntFireSafe: ` + self )
					// printl( `Ignoring dead player in ScriptEntFireSafe: ` + self )
					// return
				// }

				// // code passed to ScriptEntFireSafe
				// %s

				// return
			// }

			// // PopExtMain.Error.DebugLog( `Invalid target passed to ScriptEntFireSafe: ` + self )
			// printl( `Invalid target passed to ScriptEntFireSafe: ` + self )

		// ", allow_dead.tointeger(), code ), delay, activator, caller )

		// PURGE_STRINGS( code )
	// }
	
	
	
	function Think()
	{
		// if ( flame )
			// flame.PrimaryAttack()
		
		if (bActive)
		{
			//printl("it runs")
			if (Time() > flTimeTarget)
			{
				printl("kill")
				EntFire("explode2", "StopSound")
				
				foreach (k,v in findAllPlayer())
					v.TakeDamage(10000, 1, v)
				bActive = false
				return -1
			}
			if (Time() < flTimeStart)
				return -1
			foreach (k,v in findAllPlayer())
				v.TakeDamage(1, 1, v)
		}
		//printl("does this run")
		//if (bActive)
		//{
			//printl("it runs")
		//	if (Time() > flTimeTarget)
		//	{
		//		if (bActive)
		//		{
		//			EntFire("explode2", "StopSound")
		//			foreach (k,v in findAllPlayer())
		//				v.TakeDamage(10000, 1, v)
		//			bActive = false
		//			return -1
		//		}
		//	}
		//	else
		//	{
		//		if (Time() > flTimeStart)
		//		{
		//			foreach (k,v in findAllPlayer())
		//				v.TakeDamage(1, 1, v)
		//			bActive = true
		//			//printl("nuking")
		//		}
		//		//printl("this should be called")
		//	}
		
		//}
		
		foreach (pair in ListOfPiggyback)
			pair.TPto()
		
		// RobotVOThink()
		
		if ( !racism )
			return
		
		local soundscript = GetSoundScript() //null
		local delay = 0
		if (soundscript == "Demoman.NeedTeleporter01")
			delay = 0.5
		else if (soundscript == "Demoman.NeedSentry01")
			delay = 0.38
		else if (soundscript == "Demoman.NeedDispenser01")
			delay = 0.4
		else
		{
			RobotVOThink()
			return
		}
		
		//printl(delay)
		local list = findAllPlayer()
		foreach (k, hPlayer in list)
			EmitSoundOnClient(soundscript, hPlayer)
		CreateTimer(fun.nuke, delay)
		foreach (k, hPlayer in list)
			CreateTimer(function() {StopSoundOn(soundscript, hPlayer)
									hPlayer.SetHealth(0)}, delay)
		
		
	}
	
	nopey_flame = null
	// function test()
	// {
		// printl("flamme")
		// hMarker = SpawnEntityFromTable("tf_weapon_flamethrower", {
			// targetname 	= "flame"
			// solid		= 0
			// origin		= "-450 500 0"
		// })
	// }
	
	// flame = null
	// function spawnflame()
	// {
		// flame = CreateByClassname("tf_weapon_flamethrower")
		// SetPropInt(flame, "m_AttributeManager.m_Item.m_iItemDefinitionIndex", 21)
		// SetPropBool(flame, "m_AttributeManager.m_Item.m_bInitialized", true)
		
		// flame.SetTeam(3)
		
		// flame.DispatchSpawn()
		// flame.SetClip1(-1)
		
	// }
	
	// function go()
	// {
		// flame.SetAbsOrigin(me().EyePosition())
	// }
	
	// function shoot()
	// {
		// local owner = me()
		
		
		// NetProps.SetPropIntArray(owner, "m_iAmmo", 99, 1)
		// NetProps.SetPropFloat(owner, "m_Shared.m_flItemChargeMeter", 100.0)
		// NetProps.SetPropFloat(flame, "m_flNextPrimaryAttack", 0)
		// NetProps.SetPropEntity(flame, "m_hOwner", owner)
		
		

	// }
	// ps = null
	// function SpawnFlameParticle(origin, angles = QAngle(0,0,0))
	// {
		// local car = FindByName(null, "Car")
		// origin = car.GetOrigin()
		
		// ps = SpawnEntityFromTable("info_particle_system",
		// {
			// origin = origin,
			// angles = angles,
			// effect_name = "flamethrower", // or other flame effect
			// start_active = "0"
		// })
		// ps.AcceptInput("SetParent", "!activator", car, null)
	
		
		// EntFireByHandle(ps, "Start", "", 0.0, null, null)
		

		// return ps
	// }
	
	function enter()
	{
		FindByName(null, "Car").AcceptInput("EnterVehicle", "!activator", me(), me())
	}
	
	function Enter(player, vehicle)
	{
		// if (!can_enter || driver)
			// return;
		
		local player_scope = player.GetScriptScope();
		player_scope.vehicle = vehicle;
		// player_scope.vehicle_scope = this;
		local driver = player;
		// can_exit = false;

		driver.SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE);
		driver.SetMoveType(MOVETYPE_NONE, 0);
		
		local origin;
		local attachment = vehicle.LookupAttachment("vehicle_driver_eyes");
		if (attachment > 0)
			origin = vehicle.GetAttachmentOrigin(attachment);
		else
			origin = vehicle.GetCenter();
		origin.z -= 64.0;
		driver.SetAbsOrigin(origin);
		driver.SetAbsVelocity(Vector());
		
		driver.AcceptInput("SetParent", "!activator", vehicle, vehicle);
		
		driver.RemoveFlag(FL_DUCKING);
		NetProps.SetPropBool(driver, "m_Local.m_bDrawViewmodel", false);
		NetProps.SetPropInt(driver, "m_Shared.m_nAirDucked", 8);
		
		NetProps.SetPropBool(driver, "pl.deadflag", true);
		driver.AddCustomAttribute("disable weapon switch", 1, -1);
		driver.AddCustomAttribute("no_attack", 1, -1);
		driver.AddCustomAttribute("no_duck", 1, -1);
			
		vehicle.AcceptInput("TurnOn", "", null, null)
		// EntFireByHandle(vehicle, "CallScriptFunction", "EnableExit", 1.0, null, null);
	}
	
	
}

::car_name <- "Car"

::piggyback <- class
{
	hCarrier = null
	hCarried = null
	
	constructor(hCarrier, hCarried)
	{
		this.hCarrier = hCarrier
		this.hCarried = hCarried
		
		//this.hOwner.ValidateScriptScope()
		//this.hOwner.GetScriptScope().me <- this
		//this.hOwner.GetScriptScope().Think <- function()
		//{
		//	me.Think()
		//	return -1
		//}
		//AddThinkToEnt(this.hOwner, "Think")
	}
	
	function findIndex()
	{
		return fun.ListOfPiggyback.find(this)
	}
	
	function isThisGuyYours(hPlayer)
	{
		if (hCarrier == hPlayer || hCarried == hPlayer)
		{
			
			
			return true		// Yuh Uh
		}
		else
			return false	// Nuh Uh
	}
	
	function TPto()
	{
		if ( !hCarrier || !hCarried )
		{
			drop()
			return
		}
		
		local cord = hCarrier.GetOrigin() + Vector(0, 0, 72)
		
		hCarried.SetAbsOrigin(cord)
		hCarried.SetAbsVelocity(Vector(0, 0, 0))
	}
	
	function drop()
	{
		fun.ListOfPiggyback.remove(findIndex())
	}
}



__CollectGameEventCallbacks(fun)

fun.hExplosion.ValidateScriptScope()
fun.hExplosion.GetScriptScope().Think <- function()
{
	if("fun" in ROOT)
		fun.Think()
	return -1
}
AddThinkToEnt(fun.hExplosion, "Think")

