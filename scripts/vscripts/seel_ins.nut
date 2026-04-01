//Seelpit's Icon maNipulator Script (SINS)

//////////////////////////////////////////////////////////
//						Functions						//
//////////////////////////////////////////////////////////

//ChangeIconByIndex(index,name)	Changes the icon at the specified index to the icon with the specified name.

//ChangeIconByName(oldName,newName)	Changes the icon with the specified name to the icon with the specified name.

//ChangeIconByTag(tag,newName,wavebar = true,classicon = true)	Changes the icon of all bots that are currently alive with the specified tag to the icon with the specified name.

//ChangeClassIcon(player,name)	Changes the classicon, but not the wavebar icon, of the specified player (handle) to the icon with the specified name. Typically for bosses with healthbars.

//ChangeClassIconAndWavebar(player,name)	Changes both the class icon and the wavebar icon. Assumes wavebar icon is the same as player's classicon!

//ChangeIconFlags(name,flags)	Changes the icon with the specified name's flags; flags must be an integer (1, 2, 4, 8, 16).

//ChangeIconFlagsString(name,flags)	Changes the icon with the specified name's flags; flags must be a string (mainwave, support, mission, giant, crit)

//ToggleIconFlagsString(name,flags)	Alternative caller of ChangeIconFlags. Toggles whether an icon is a giant or common; crit or not; support or mainwave; and mission support IF support.
//									Format with strings, f.e.: ToggleIconFlags("soldier","crit|support") ; ToggleIconFlags("soldier","giant|support")

//SetIconCountByIndex(index,count,update = true)	Changes the count of an icon by the index provided, and whether to update the max amount of enemies to ensure the wavebar does not overflow.

//SetIconCountByName(name,count,update = true)	Changes the count of an icon with the specified name, and see above ^.

//////////////////////////////////////////////////////////
//					"Debug" Functions					//
//////////////////////////////////////////////////////////

//FindIndexOfIcon(name)			Finds the index of the icon with the specified name. Mostly used internally, but may be useful for other scripts.

//PrintAllIconNames()	Prints all the icon names per index of the wave. May be useful for debugging in what order they're in.

//////////////////////////////////////////////////////////

// Namespace base by ficool.
// Constants folding from the VDC wiki.
foreach(k,v in NetProps.getclass())
	if (k != "IsValid")
		getroottable()[k] <- NetProps[k].bindenv(NetProps);

foreach (k, v in Entities.getclass())
    if (k != "IsValid")
        getroottable()[k] <- Entities[k].bindenv(Entities);

printl("Seelpit's Icon maNipulator Script loaded and ready for use.")

local iMaxEnemyCount = 0
local iCurrentEnemyCount = 0
local flWaveProgress = 1
::hTFOR <- Entities.FindByClassname(null,"tf_objective_resource")
if (!("TF_BOT_TYPE" in this))
	::TF_BOT_TYPE <- 1337

::FLAG_MAINWAVE <- 1
::FLAG_SUPPORT <- 2
::FLAG_MISSION <- 4
::FLAG_GIANT <- 8
::FLAG_CRIT <- 16
	
::SINS <- 
{
	Cleanup = function()
	{
		// cleanup any persistent changes here
		
		// Remove think from tf_objective_resource
		AddThinkToEnt(hTFOR, null)
		
		local __ROOT = getroottable()
		
		// Remove variables and functions from global scope
		if ( "hTFOR" in __ROOT )
			delete ::hTFOR
		
		if ( "IconCountThink" in __ROOT )
			delete ::IconCountThink
		
		// Remove unnecessary player scope variables
		for(local i = 1; i <= MaxPlayers ; i++)
		{
			local hPlayer = PlayerInstanceFromIndex(i)
			if (hPlayer == null) continue
			local hScope = hPlayer.GetScriptScope()
			if ( "iszClassIconOld" in hScope )
				delete hScope.iszClassIconOld
		}
		
		
		// keep this at the end
		if (SINS)
			delete ::SINS;
	}
	
	// mandatory events
	OnGameEvent_recalculate_holidays = function(_) { if (GetRoundState() == 3) Cleanup() }
	OnGameEvent_mvm_wave_complete = function(_) { Cleanup() }
	
	
	DEBUG = false
	EngageDebugMode = function()
	{
		printl("SINS - Debug mode manually engaged!")
		DEBUG = true
	}
	
	
	MaxPlayers = MaxClients().tointeger()
	
	tbIconFlags = {
		"1" : "mainwave",
		"2" : "support",
		"4" : "mission",
		"8" : "giant",
		"16" : "crit"
	}
	tbValidIconFlags = {
		mainwave = 1,
		support = 2,
		mission = 4,
		giant = 8,
		crit = 16,
	}
	
	IconsToChangeTable = {}
	HiddenIcons = {}
	tbIconMemory = {}
	tbTankMemory = {}
	arStartWave = []
	
	OnGameEvent_mvm_begin_wave = function(_)
	{
		foreach(func in arStartWave)
			func()
	}
	OnGameEvent_player_death = function(params)
	{
		local hDied = GetPlayerFromUserID(params.userid)
		
		if ( !(hDied.IsBotOfType(TF_BOT_TYPE)) ) return;
		
		local hScope = hDied.GetScriptScope()
		
		local iszClassIcon = GetIconByHandle(hDied)
		if ( "iszClassIconOld" in hScope )
		{
			// CASE: the bot's ClassIcon was changed, and its original icon is on the wavebar.
			// Result: decrement from original icon and delete scope variable.
			if ( iszClassIcon != hScope.iszClassIconOld && GetIndexOfIcon(hScope.iszClassIconOld) )
				DecrementIconCountByName(hScope.iszClassIconOld)
			
			// CASE: the bot's ClassIcon was changed, but its current or original icon are NOT on the wavebar.
			// Result: check memory for newly matching icon. 
			else if ( iszClassIcon in tbIconMemory )
					DecrementIconCountByName(tbIconMemory[iszClassIcon])
				
			// CASE: the bot's ClassIcon was changed, but its current or original icon are NOT on the wavebar,
			// 		 AND its "new" icon is not in memory.
			// Result: check memory for old icon as final resort.
			else if ( hScope.iszClassIconOld in tbIconMemory )
					DecrementIconCountByName(tbIconMemory[hScope.iszClassIconOld])
			
			else
				printl(" [[MEMORY]] I don't know what you did, but you didn't fit in any of my cases. Incredible!")
			
			delete hScope.iszClassIconOld
		}
		
		// CASE: the bot's ClassIcon is unchanged, not on the wavebar, and inside memory.
		else if ( !(GetIndexOfIcon(iszClassIcon)) && iszClassIcon in tbIconMemory )
		{
			if (DEBUG) printl("[[MEMORY]] Bot's icon was not changed ("+iszClassIcon+"), isn't on wavebar, but found in memory (tied to "+tbIconMemory[iszClassIcon]+")");
			DecrementIconCountByName(tbIconMemory[iszClassIcon])
		}
	}
	OnGameEvent_mvm_tank_destroyed_by_players = function(_)
	{
		local sTankName = ""
		for( local hEnt; hEnt = FindByClassname(hEnt,"tank_boss"); )
		{
			sTankName = hEnt.GetName()
			if (DEBUG) printl("Found tank with name '"+sTankName+"'!");
			if( hEnt.GetHealth() <= 0 )
			{
				if (DEBUG) print("[[MEMORY]] Tank "+sTankName+" died, checking memory...");
				
				if( sTankName in tbTankMemory )
				{
					if (DEBUG) printl("found "+sTankName+" in memory, decrementing icon "+tbTankMemory[sTankName]+".");
					DecrementIconCountByName(tbTankMemory[sTankName])
				}
				if (DEBUG) printl("nothing found in memory, ignoring.");
			}
		}
		
	}
	// Returns the icon name found at the given index. Index starts at 0, ends at 23.
	// @integer	iIndex	: index from where the icon should be grabbed from.
	GetIconByIndex = function(iIndex)
	{
		if (iIndex > 23)
		{
			printl("SINS GetIconByIndex WARNING: highest index is 23! Clamping value to 23...")
			iIndex = 23
		}
		
		local i = 0
		local two = ""
		local i2 = 0
		if (iIndex >= 12) two = "2.",i2 = 12;
		
		if (DEBUG) printf("Trying to find icon at index %i...",iIndex);
		
		local sName = GetPropStringArray(hTFOR, "m_iszMannVsMachineWaveClassNames"+two, iIndex-i2)
		if ( sName.len() == 0 )
		{
			if (DEBUG) printf("index %i is empty!\n",iIndex);
			return null
		}
		if (DEBUG) printf("found '%s' at index %i!\n",sName,iIndex);
		return sName
	}

	GetIconByHandle = function(hPlayer)
	{
		if ( !(hPlayer.IsValid()) )
		{
			printl("SINS GetIconByHandle ERROR: Invalid player!")
			return null;
		}
		return GetPropString(hPlayer, "m_PlayerClass.m_iszClassIcon")
	}
	
	//@string sTag	: tag of the bot.
	GetIconByTag = function(sTag)
	{
		local iBotCount = 1
		for(local i = 1; i <= MaxPlayers ; i++)
		{
			local player = PlayerInstanceFromIndex(i)
			if (player == null) continue
			if (GetPropInt(player, "m_lifeState") != 0) continue
			if (!player.IsBotOfType(TF_BOT_TYPE)) continue
			if (!player.HasBotTag(tag)) continue
			
			local sName = GetIconByHandle(player)
			if (DEBUG) printf("Found icon %s on bot #%i",sName,iBotCount);
			iBotCount = iBotCount + 1
		}
		if (iBotCount == 1)
			if (DEBUG) printf("Couldn't find any bots with tag %s!\n",sTag)
	}
	
	//Finds the index of the given icon on the wavebar. Intended for internal use, but global for accessibility.
	//@string sName	: name of the icon.
	//@return int	: integer index of icon. If not found, returns NULL.
	FindIndexOfIcon = function(sName)
	{
		local i = 0 //Check: do I start at 0 or at 1?
		local two = ""
		local i2 = 0
		if (DEBUG) printf("Trying to find icon '%s'...",sName);
		for(i; i < 24; i++) //Check: and thus, do I end at 24, or 23?
		{
			if (i >= 12) two = "2.",i2 = 12;
			
			local _sName = GetPropStringArray(hTFOR, "m_iszMannVsMachineWaveClassNames"+two, i-i2)
			if (_sName == sName)
			{
				if (DEBUG) printf("found '%s' at index %i!\n",sName,i);
				return i
			}
		}
		printf("\nSINS FindIndexOfIcon WARNING: icon name '%s' not found!\n",sName)
		return null
	}
	//Finds the enemy count of the given icon on the wavebar. Intended for internal use, but global for accessibility.
	//@string sName	: name of the icon.
	//@return int	: count of icon. If not found or if the index is invalid, returns 0 (zero).
	GetIconCountByIndex = function(iIndex)
	{
		if (iIndex > 23)
		{
			printl("SINS GetIconCountByIndex ERROR: highest index is 23!")
			return 0
		}
		
		local two = ""
		local i2 = 0
		if (iIndex >= 12) two = "2.",i2 = 12;
		local iIconCount = GetPropIntArray(hTFOR, "m_nMannVsMachineWaveClassCounts"+two, iIndex-i2);
		return iIconCount
	}
	//Finds the enemy count of the given icon on the wavebar. Intended for internal use, but global for accessibility.
	//@string sName	: name of the icon.
	//@return int	: count of icon. If not found, returns 0 (zero).
	GetIconCountByName = function(sName)
	{
		local iIndex = FindIndexOfIcon(sName)
		
		if (iIndex == null) return 0;
		
		return GetIconCountByIndex(iIndex)
	}

	//Wrapper for FindIndexOfIcon so both can be used.
	//Finds the index of the given icon on the wavebar. Intended for internal use, but global for accessibility.
	//@string sName	: name of the icon.
	//@return int	: integer index of icon. If not found, returns NULL.
	GetIndexOfIcon = function(sName){ 	return FindIndexOfIcon(sName) }
	GetIconIndex = function(sName)	{	return FindIndexOfIcon(sName) }
	
	//Wrappers for FindCountOfIcon [DEPRECATED] so both can be used.
	//Finds the enemy count of the given icon on the wavebar. Intended for internal use, but global for accessibility.
	//@string sName	: name of the icon.
	//@return int	: count of icon. If not found, returns 0 (zero).
	// GetCountOfIcon = function(sName){	return  }
	// GetIconCount = function(sName)	{	return  }
	// GetIconCount = function(sName)	{	return  }
	
	//Returns the flags of the icon with the specified name.
	//@string sName : name of the icon to get the flags of.
	//If the icon is not on the wavebar, returns NULL.
	GetIconFlagsByIndex = function(iIndex)
	{
		if (iIndex > 23)
		{
			printl("SINS SetIconCountByIndex ERROR: highest index is 23!")
			return null
		}
		
		local two = ""
		local i2 = 0
		if (iIndex >= 12) two = "2.",i2 = 12; //Was this dot ever fixed? Getting fixed? Hopefully.
		local iFlags = GetPropIntArray(hTFOR, "m_nMannVsMachineWaveClassFlags"+two, iIndex-12)
		return iFlags
	}
	//Returns the flags of the icon with the specified name.
	//@string sName : name of the icon to get the flags of.
	//If the icon is not on the wavebar, returns NULL.
	GetIconFlagsByName = function(sName)
	{
		local iIndex = FindIndexOfIcon(sName)
		if (iIndex == null) return null;
		
		return GetIconFlagsByIndex(iIndex)
	}
	
	//Wrapper for GetIconFlagsByName. Returns the flags of the icon with the specified name.
	//@string sName : name of the icon to get the flags of.
	//If the icon is not on the wavebar, returns NULL.
	GetIconFlags = function(sName)
	{
		return GetIconFlagsByName(sName)
	}
	
	// Translates a given integer (flags) to a comma-delineated string.
	//@int	iFlags : flags to translate into a string.
	FlagsToString = function(iFlags)
	{
		if (iFlags > 31)
		{
			printl("SINS FlagToString ERROR: flags exceed limit! Valid flags:")
			printl("	[1] 'mainwave' || [2] 'support' || [4] 'mission' || [8] 'giant' || [16] 'crit'")
			return
		}
		
		local sFlags = ""
		local i = 0
		
		while (iFlags > 0 || i > 5)
		{
			local j = abs( pow( 2, i ) )
			
			if ( (iFlags & j) != 0 )
			{
				sFlags += j.tostring()
				if (iFlags - j > 0)
					sFlags += ", "
				iFlags -= j
			}
			
			i++
		}
		
		return sFlags
	}
	
	// Translates a given integer (flags) to an array.
	//@int	iFlags : flags to translate into an array.
	FlagsToArray = function(iFlags)
	{
		if (iFlags > 31)
		{
			printl("SINS FlagToString ERROR: flags exceed limit! Valid flags:")
			printl("	[1] 'mainwave' || [2] 'support' || [4] 'mission' || [8] 'giant' || [16] 'crit'")
			return
		}
		
		local arFlags = []
		local i = 0
		
		while (iFlags > 0 || i > 5)
		{
			local j = abs( pow( 2,i ) )
			
			if ( (iFlags & j) != 0 )
			{
				arFlags.push(j)
				iFlags -= j
			}
			
			i++
		}
		return arFlags
	}
	
	//Loops through and prints all icon names.
	PrintAllIconNames = function()
	{
		local i = 0
		local two = ""
		local i2 = 0
		for(i; i < 24; i++)
		{
			if (i >= 12) two = "2.",i2 = 12;
			
			local sName = GetPropStringArray(hTFOR, "m_iszMannVsMachineWaveClassNames"+two, i-i2)
			printf("Icon %i: %s\n",i+1,sName)
		}
	}
	
	//Loops through and returns all icon names and indices in a table.
	GetAllIconNames = function()
	{
		local table = {}
		local i = 0
		local two = ""
		local i2 = 0
		for(i; i < 24; i++)
		{
			if (i >= 12) two = "2.",i2 = 12;
			
			local sName = GetPropStringArray(hTFOR, "m_iszMannVsMachineWaveClassNames"+two, i-i2)
			if (sName == "") continue
			table[i] <- sName
		}
		return table
	}
	
	
	// ### All functions that change wavebar icons are dependent on this function!!! ###
	
	//Changes icon of specified index on the wavebar to icon with the specified name. Uses parts of lite's hideicons script.
	//@integer	iIndex	: index of the given icon. Can be determined by counting unique icons in WaveSpawn order.
	//@string	sName	: name of the new icon.
	//@bool		bMemory	: whether to save the change to memory, decrementing the icon if a bot with the old icon gets killed. Default to true.
	//@bool		bStore	: whether to store this function to re-execute it upon wave start, if executed during setup. Default to true.
	ChangeIconByIndex = function(iIndex, sName, bMemory = true, bStore = true)
	{
		if (iIndex == null)
		{
			if (DEBUG) ClientPrint(null,2,"SINS ChangeIconByIndex ERROR: Index is null!");
			return;
		}
		
		if (GetRoundState() == 10 && bStore)
			arStartWave.append(function() ChangeIconByIndex(iIndex,sName))
		
		local two = ""
		local i2 = 0
		if (iIndex >= 12) two = "2.",i2 = 12; //Was this dot ever fixed? Getting fixed? Hopefully.
		
		local sNameOld = GetPropStringArray(hTFOR, "m_iszMannVsMachineWaveClassNames"+two, iIndex-i2)
		
		if (sNameOld.len() != 0)
		{
			if ( sNameOld == sName )
			{
				if (DEBUG) printl("SINS ChangeIconByIndex WARNING: Redundant operation! '"+sNameOld+"' **is** '"+sName+"'!");
				return
			}
			
			if (bMemory)
			{
				// CASE: icon was not changed on the wavebar before; is neither a key nor a value in memory.
				if ( !(sNameOld in tbIconMemory) && tbIconMemory.values().find(sNameOld) == null )
				{
					if (DEBUG) printl("[[MEMORY]] Storing '"+sNameOld+"' in memory. When a bot with that classicon dies, decrement '"+sName+"' on the wavebar!");
					tbIconMemory[sNameOld] <- sName
				}
				// CASE: NEW icon exists in memory as a KEY - aka "bot with icon A should die means decrement B, B is on the wavebar, set icon to A".
				// This is done when restoring icons, so delete it from memory as we no longer need to remember it.
				else if ( sName in tbIconMemory )
				{
					if (DEBUG) printl("[[MEMORY]] Resetting & forgetting icon '"+sName+"'!");
					delete tbIconMemory[sName]
				}
				// CASE: OLD icon exists in memory as a VALUE - aka "bot with icon A should die means decrement B, B is on the wavebar, set icon to C".
				else if ( tbIconMemory.values().find(sNameOld) != null )
				{
					local sNameOldOld = tbIconMemory.keys()[tbIconMemory.values().find(sNameOld)]
					tbIconMemory[sNameOldOld] <- sName
					if (DEBUG) printl(" [[MEMORY]] Updating memory. When a bot with icon '"+sNameOldOld+"' dies, decrement '"+sName+"' on the wavebar!");
				}
			}
		}
		
		
		if (DEBUG) printl("# Wavebar Icon changed: index "+iIndex+" is now "+sName+".");
		SetPropStringArray(hTFOR, "m_iszMannVsMachineWaveClassNames"+two, sName, iIndex-i2)
	}
	
	//Changes only the wavebar icon with the specified name to the icon with the specified new name.
	//@string	sNameOld	: name of the icon to change.
	//@string	sNameNew	: name of the new icon.
	//@bool		bMemory		: whether to save the change to memory, decrementing the icon if a bot with the old icon gets killed. Default to true.
	//@bool		bStore		: whether to store this function to re-execute it upon wave start, if executed during setup. Default to true.
	ChangeIconByName = function(sNameOld, sName, bMemory = true, bStore = true)
	{
		local iIndex = FindIndexOfIcon(sNameOld)
		if ( iIndex == null )
		{
			if (DEBUG) ClientPrint(null,2,"SINS ChangeIconByIndex ERROR: Index is null!");
			return;
		}
		if ( sNameOld == sName )
		{
			printl("SINS ChangeIconByName ERROR: Redundant operation! '"+sNameOld+"' **is** '"+sName+"'!")
			return
		}
		
		if (DEBUG) printf("'%s' found at %i! Changing to '%s'...\n",sNameOld,iIndex,sName)
		ChangeIconByIndex(iIndex,sName,bMemory,bStore)
	}
	
	
	//Wrapper that changes the given player's class icon. More convenient than writing it all out.
	//Does NOT change the wavebar icon, but can change the icon on a boss health bar.
	//@handle	hPlayer	: player to change the classicon of.
	//@string	sName	: name of the icon to change to.
	//@bool		bStore	: whether to store the icon to remove it from the wavebar later, if it is no longer the same (default: true)
	ChangeClassIcon = function(hPlayer, sName, bStore = true)
	{
		local hScope = hPlayer.GetScriptScope()
		if ( !("iszClassIconOld" in hScope) && bStore)
			hScope.iszClassIconOld <- GetPropString(hPlayer, "m_PlayerClass.m_iszClassIcon")
		
		SetPropString(hPlayer, "m_PlayerClass.m_iszClassIcon", sName)
	}

	//Changes both the class icon and the wavebar icon. Assumes wavebar icon is the same as player's classicon!
	//@handle	hPlayer	: the player (bot) to change the icon of.
	//@string	sName	: name of the icon to change to.
	//@bool		bStore	: whether to store this function to re-execute it upon wave start, if executed during setup. Default to FALSE for this function!
	ChangeClassIconAndWavebar = function(hPlayer, sName, bMemory = false, bStore = false)
	{
		if (!(hPlayer)) return;
		
		local sNameOld = GetIconByHandle(hPlayer)
		local iIndex = FindIndexOfIcon(sNameOld)
		
		if (iIndex == null)
		{
			printl("SINS ChangeClassIconAndWavebar ERROR: couldn't find ")
			return;
		}
		if ( sNameOld == sName )
		{
			if (DEBUG) printl("SINS ChangeClassIconAndWavebar WARNING: Redundant operation! '"+sNameOld+"' **is** '"+sName+"'!");
			return
		}
		
		if (DEBUG) printf("%s found at %d! Changing to %s...\n",sNameOld,iIndex,sName);
		ChangeClassIcon(hPlayer, sName, false)
		ChangeIconByIndex(iIndex,sName,bMemory,bStore) //Since this gets executed on a player, it's PROBABLY not done in setup...
	}
	
	//Changes icons of all bots that match the provided tag and are currently alive.
	//@string	tag				: tag of the bots whose icon should be changed.
	//@string	iconName		: name of the icon to change to.
	//@bool		updateClassIcon	: whether to also change the classicon. Default: true.
	//@bool		bStore			: whether to store this function to re-execute it upon wave start, if executed during setup. Default to true.
	ChangeIconByTag = function(tag, iconName, updateWavebarIcon = true, updateClassIcon = true, bMemory = true, bStore = true)
	{
		for(local i = 1; i <= MaxPlayers ; i++)
		{
			local player = PlayerInstanceFromIndex(i)
			if (player == null) continue
			if (GetPropInt(player, "m_lifeState") != 0) continue
			if (!player.IsBotOfType(TF_BOT_TYPE)) continue
			if (!player.HasBotTag(tag)) continue
			
			local oldIcon = GetIconByHandle(player)
			if (updateWavebarIcon && oldIcon != iconName)
			{
				local iconIndex = FindIndexOfIcon(oldIcon)
				
				if (iconIndex == null && DEBUG)
					ClientPrint(null,2,"SINS ChangeIconByTag ERROR: Index is null!");
				else 
					ChangeIconByIndex(iconIndex,iconName,bMemory,bStore);
			}
			
			// Should the bot's icon (healthbar) be changed?
			// Don't store it if we're changing both!
			if (updateClassIcon)
				ChangeClassIcon(player,iconName,!(updateWavebarIcon && updateClassIcon) )
		}
	}
	
	//Changes "flags" of the given icon.
	//@string	sName	: name of the icon whose flags to change.
	//@int		iFlags	: flags to set on the icon. Valid values below.
	//					  POSITION FLAGS: 0 = not on wavebar;	1 = mainwave;	2 = Support;	4 = Mission Support, is put right of other Support. Also causes Engineer, Spy, and Sentry Buster icons to flash.
	//					  VISUAL FLAGS	:   8 = red background, for giants and tanks;		16 = blue flashing outline, for crits
	//@bool		bStore	: whether to store this function to re-execute it upon wave start, if executed during setup. Default to true.
	ChangeIconFlagsByIndex = function(iIndex,iFlags,bStore = true)
	{
		if (iIndex > 23)
		{
			printl("SINS ChangeIconFlagsByIndex ERROR: highest index is 23!")
			return false
		}
		
		local two = ""
		local i2 = 0
		if (iIndex >= 12) two = "2.",i2 = 12; //Was this dot ever fixed? Getting fixed? Hopefully.
		
		if (GetRoundState() == 10 && bStore)
			arStartWave.append(function() SetPropIntArray(hTFOR, "m_nMannVsMachineWaveClassFlags"+two, iFlags, iIndex-i2))
		
		if (DEBUG) printl("# Icon Flags changed: icon '"+GetIconByIndex(iIndex)+"' now has flags "+iFlags+"");
		SetPropIntArray(hTFOR, "m_nMannVsMachineWaveClassFlags"+two, iFlags, iIndex-i2)
	}
	
	//Changes "flags" of the given icon.
	//@string	sName	: name of the icon whose flags to change.
	//@int		iFlags	: flags to set on the icon. Valid values below.
	//					  POSITION FLAGS: 0 = not on wavebar;	1 = mainwave;	2 = Support;	4 = Mission Support, is put right of other Support. Also causes Engineer, Spy, and Sentry Buster icons to flash.
	//					  VISUAL FLAGS	:   8 = red background, for giants and tanks;		16 = blue flashing outline, for crits
	//@bool		bStore	: whether to store this function to re-execute it upon wave start, if executed during setup. Default to true.
	ChangeIconFlags = function(sName,iFlags,bStore = true)
	{
		local iIndex = FindIndexOfIcon(sName)
		
		if (iIndex == null) return;
		
		ChangeIconFlagsByIndex(iIndex,iFlags,bStore)
	}
	
	//Changes "flags" of the given icon based on a string.
	//@string	sName	: name of the icon whose flags to change.
	//@string	sFlags	: string of flags to set the icon to. Formatted as: SINS.ChangeIconFlagsString("soldier","mainwave|giant")
	//@bool		bStore	: whether to store this function to re-execute it upon wave start, if executed during setup. Default to true.
	ChangeIconFlagsString = function(sName,sFlags, bStore = true)
	{
		local arFlags = split(sFlags,"|")
		local iNewFlags = 0
		foreach(flag in arFlags)
		{
			if ( !(flag in tbValidIconFlags) )
			{
				if (DEBUG) 
				{
					printl("SINS ChangeIconFlagsString WARNING: '"+flag+"' is not a valid flag! Valid flags:")
					printl("	[1] 'mainwave' || [2] 'support' || [4] 'mission' || [8] 'giant' || [16] 'crit'")
				}
				continue
			}
			iNewFlags += tbValidIconFlags[flag]
		}
		ChangeIconFlags(sName,iNewFlags, bStore)
	}
	
	//Moves the given icon to mainwave, support, or mission support (after support). Default: support.
	//@string	sName	: name of the icon to move.
	//@string	sPlace	: string of where to move the icon to. Accepted strings: "main", "mainwave", "support", "mission", "mission support"
	//@bool		bStore	: whether to store this function to re-execute it upon wave start, if executed during setup. Default to true.
	MoveIcon = function(sName, sPlace = "support", bStore = true)
	{
		local iNewFlags = 0;
		switch(sPlace)
		{
				case "main":
				case "mainwave":
					iNewFlags += FLAG_MAINWAVE
					break
					
				case "support":
					iNewFlags += FLAG_SUPPORT
					break
					
				case "mission":
				case "mission support":
					iNewFlags += FLAG_MISSION
					break
		}
		
		if (DEBUG) printl("New flags to set thus far: "+iNewFlags);
		if (iNewFlags == 0)
		{
			printl("SINS MoveIcon ERROR: "+sPlace+" is not a valid value!")
			printl("Use `main`, `mainwave`, `support`, `mission`, or `mission support` instead.")
		}
		
		local iFlags = GetIconFlags(sName)
		if (iFlags == null)
		{
			printl("SINS MoveIcon ERROR: Couldn't find flags of icon "+sName+"! Verify if the icon is on the wavebar.")
			return
		}
		
		if (DEBUG) printl("Old flags: "+iFlags);
		local arFlags = FlagsToArray(iFlags)
		iNewFlags += arFlags.find(FLAG_GIANT) != null ? FLAG_GIANT : 0
		iNewFlags += arFlags.find(FLAG_CRIT) != null ? FLAG_CRIT : 0
		
		if (DEBUG) printl("Flags to set: "+iNewFlags);
		ChangeIconFlags(sName, iNewFlags, bStore)
	}
	
	//Convenient functions for MoveIcon with the parameter of sPlace pre-set.
	//@string	sName	: name of the icon to move.
	//@bool		bStore	: whether to store this function to re-execute it upon wave start, if executed during setup. Default to true.
	MoveIconToMain				= function(sName, bStore = true) { MoveIcon(sName, "main", bStore) }
	MoveIconToMainWave			= function(sName, bStore = true) { MoveIcon(sName, "mainwave", bStore) }
	MoveIconToSupport			= function(sName, bStore = true) { MoveIcon(sName, "support", bStore) }
	MoveIconToMission			= function(sName, bStore = true) { MoveIcon(sName, "mission", bStore) }
	MoveIconToMissionSupport	= function(sName, bStore = true) { MoveIcon(sName, "mission support", bStore) }
	
	//TODO: finish
	//Toggles "flags" of the given icon based on a string.
	//@string	sName	: name of the icon whose flags to change.
	//@string	sFlags	: string of flags to toggle on the icon. Formatted as: SINS.ToggleIconFlagsString("soldier","mainwave|giant")
	ToggleIconFlagsString = function(sName,sFlags)
	{
		local iFlagsOld = GetIconFlags(sName)
		
		local arFlags = split(sFlags,"|")
		foreach(flag in arFlags)
		{
			if (!(tbValidIconFlags[flag] & existingFlags))
			{
				if (validFlags[flag] & validFlags[mainwave] || validFlags[flag] & validFlags[support] || validFlags[flag] & validFlags[mission])
					existingFlags = existingFlags & validFlags[mainwave]
				existingFlags = existingFlags & validFlags[flag];
				print("New flags: "+existingFlags.tostring() + "\n");
			}
		}
	}
	
	//Increments the given icon index by the given count. Returns true if succesful, false if unsuccesful.
	//@string	sName	: icon name to increment.
	//@int		iCount	: amount to set count to (default: 1).
	//@bool		bUpdate	: whether to update the max enemy count. Default to true.
	//@bool		bStore	: whether to store this function to re-execute it upon wave start, if executed during setup. Default to true.
	SetIconCountByIndex = function(iIndex, iCount = 1, bUpdate = true, bStore = true)
	{
		if (iIndex > 23)
		{
			printl("SINS SetIconCountByIndex ERROR: highest index is 23!")
			return false
		}
		
		local two = ""
		local i2 = 0
		if (iIndex >= 12) two = "2.",i2 = 12;
		
		local iCountOld = GetIconCountByIndex( iIndex )
		
		if (GetRoundState() == 10 && bStore)
		{
			arStartWave.append(function() SetPropIntArray(hTFOR, "m_nMannVsMachineWaveClassCounts"+two, iCount, iIndex-i2) )
			arStartWave.append(function() SetPropInt(hTFOR,"m_nMannVsMachineWaveEnemyCount",iMaxEnemyCount + iCount - iCountOld) )
		}
		
		SetPropInt(hTFOR,"m_nMannVsMachineWaveEnemyCount",iMaxEnemyCount + iCount - iCountOld)
		SetPropIntArray(hTFOR, "m_nMannVsMachineWaveClassCounts"+two, iCount, iIndex-i2)
		
		if (DEBUG) printl("Set icon count of index "+iIndex+" from "+iCountOld+" to "+iCount);
		
		return true
	}
	
	//Sets the given icon's name to the given count. Returns true if succesful, false if unsuccesful.
	//@string	sName	: icon name to increment.
	//@int		iCount	: amount to set count to (default: 1).
	SetIconCountByName = function(sName,iCount = 1, bUpdate = true, bStore = true)
	{
		local iIndex = FindIndexOfIcon(sName)
		if (iIndex == null)
		{
			printl("SINS SetIconCountByName ERROR: couldn't find index of icon '"+sName+"'!")
			return false
		}
		return SetIconCountByIndex(iIndex,iCount,bUpdate,bStore)
	}
	
	
	//Increments the given icon index by the given count. Returns true if succesful, false if unsuccesful.
	//@string	sName	: icon name to increment.
	//@int		iCount	: amount to increment by (default: 1).
	IncrementIconCountByIndex = function(iIndex,iCount = 1, bUpdate = true, bStore = true)
	{
		if (iIndex > 23)
		{
			printl("SINS IncrementIconCountByIndex WARNING: highest index is 23! Clamping value to 23...")
			iIndex = 23
		}
		
		SetPropInt(hTFOR,"m_nMannVsMachineWaveEnemyCount",iMaxEnemyCount + iCount)
		if (DEBUG) printl("Incrementing icon count of index "+iIndex+" by "+iCount+"; new total should be "+ (iMaxEnemyCount + iCount) );
		return SetIconCountByIndex( iIndex, GetIconCountByIndex( iIndex ) + iCount, bUpdate, bStore)
	}
	
	//Increments the given icon's name by the given count. Returns true if succesful, false if unsuccesful.
	//@string	sName	: icon name to increment.
	//@int		iCount	: amount to increment by (default: 1).
	IncrementIconCountByName = function(sName,iCount = 1, bUpdate = true, bStore = true)
	{
		local iIndex = FindIndexOfIcon(sName)
		if (iIndex == null)
		{
			printl("SINS IncrementIconCountByName ERROR: couldn't find index of icon '"+sName+"'!")
			return false
		}
		return IncrementIconCountByIndex(iIndex,iCount,bUpdate,bStore)
	}
	
	
	//Decrements the given icon's count by the given count. Returns true if succesful, false if unsuccesful.
	//@string	sName	: icon name to decrement.
	//@int		iCount	: amount to decrement by (default: 1).
	DecrementIconCountByName = function(sName,iCount = 1, bUpdate = true, bStore = true)
	{
		local iIndex = FindIndexOfIcon(sName)
		if (iIndex == null)
		{
			printl("SINS DecrementIconCountByName ERROR: couldn't find index of icon '"+sName+"'!")
			return false;
		}
		
		return SetIconCountByName( sName, GetIconCountByIndex( iIndex ) - iCount, bUpdate, bStore)
	}

	// Inserts a bot icon at the given index. Use InsertTankIconAtIndex for Tank icons!!!
	// 
	InsertIconAtIndex = function(iIndex,sName,iCount = 1,iFlags = 1)
	{
		if (iIndex > 23)
		{
			printl("SINS InsertIconAtIndex ERROR: highest index is 23!")
			return
		}
		
		local i = 23
		local two = ""
		local i2 = 0
		if(iIndex >= 12) two = "2.",i2 = 12;
		
		local sNameCurrent = GetPropStringArray(hTFOR, "m_iszMannVsMachineWaveClassNames"+two, iIndex-i2)
		
		// CASE: The icon is already on the wavebar! Don't insert it, just send a message to let them know.
		if( GetIconIndex(sName) != null )
		{
			printl("SINS InsertIconAtIndex ERROR: Icon already exists on the wavebar! Try SINS.IncrementIconCountByIndex or SINS.SetIconCountByIndex instead!")
			return
		}
		
		// CASE: It's empty! And therefore, Free Real Estate. Insert the icon, count, and apply flags.
		if( sNameCurrent.len() == 0 )
		{
			if (DEBUG) printl("Index is empty - inserting icon '"+sName+"'!");
			ChangeIconByIndex(iIndex,sName,false)
			SetIconCountByIndex(iIndex,iCount)
			ChangeIconFlags(sName,iFlags)
			SetPropInt(hTFOR, "m_nMannVsMachineWaveEnemyCount", iMaxEnemyCount + iCount)
			return
		}
		
		// CASE: It's NOT empty, push all other icons up.
		for(i; i >= iIndex; i--)
		{
			local _two = ""
			local _i2 = 0
			if(i >= 12) _two = "2.",_i2 = 12;
			sNameCurrent = GetPropStringArray(hTFOR, "m_iszMannVsMachineWaveClassNames"+_two, i-_i2)
			
			if (DEBUG) print("Checking index "+i+"...");
			// CASE: Current icon is empty & not at index yet, let's move on.
			if( sNameCurrent.len() == 0 )
			{
				if (DEBUG) printl("it's empty, continuing...");
				continue
			}
			
			// CASE: Current icon is NOT empty! First, check if we have space to push it down.
			if( i == 23 )
			{
				printl("SINS InsertIconAtIndex ERROR: cannot insert, wavebar is already full!")
				return
			}
			
			local iFlagsNew = GetIconFlagsByIndex(i)
			
			// We've got space! Push it up to the next index.
			ChangeIconByIndex(i+1, sNameCurrent, false)
			SetIconCountByIndex(i+1, GetIconCountByIndex(i), false, false )
			ChangeIconFlagsByIndex(i+1, iFlagsNew )
		}
		if (DEBUG) printl("Finished moving all icons, now overriding index "+iIndex+" with icon '"+sName+"'!");
		ChangeIconByIndex(iIndex, sName, false)
		if (DEBUG) printl("Setting max enemy count to "+(iMaxEnemyCount+iCount).tostring() );
		SetIconCountByIndex(iIndex,iCount, false, false)
		ChangeIconFlags(sName,iFlags)
		SetPropInt(hTFOR, "m_nMannVsMachineWaveEnemyCount", iMaxEnemyCount + iCount)
	}
	
	// This function PRESUMES that 
	InsertTankIconAtIndex = function(iIndex,sName,sTankName,iCount = 1,iFlags = 9)
	{
		if (iIndex > 23)
		{
			printl("SINS InsertIconAtIndex ERROR: highest index is 23!")
			return
		}
		
		local i = 23
		local two = ""
		local i2 = 0
		if(iIndex >= 12) two = "2.",i2 = 12;
		
		local sNameCurrent = GetPropStringArray(hTFOR, "m_iszMannVsMachineWaveClassNames"+two, iIndex-i2)
		
		// CASE: The icon is already on the wavebar! Don't insert it, just send a message to let them know.
		if( GetIconIndex(sName) != null )
		{
			printl("SINS InsertIconAtIndex ERROR: Icon already exists on the wavebar! Try SINS.IncrementIconCountByIndex or SINS.SetIconCountByIndex instead!")
			return
		}
		
		// CASE: It's empty! And therefore, Free Real Estate. Insert the icon, count, and apply flags.
		if( sNameCurrent.len() == 0 )
		{
			if (DEBUG) printl("Index is empty - inserting icon '"+sName+"'!");
			
			ChangeIconByIndex(iIndex,sName,false)
			SetIconCountByIndex(iIndex,iCount)
			ChangeIconFlags(sName,iFlags)
			SetPropInt(hTFOR, "m_nMannVsMachineWaveEnemyCount", iMaxEnemyCount + iCount)
			
			return
		}
		
		// CASE: It's NOT empty, push all other icons up.
		for(i; i >= iIndex; i--)
		{
			local _two = ""
			local _i2 = 0
			if(i >= 12) _two = "2.",_i2 = 12;
			sNameCurrent = GetPropStringArray(hTFOR, "m_iszMannVsMachineWaveClassNames"+_two, i-_i2)
			
			if (DEBUG) print("Checking index "+i+"...");
			// CASE: Current icon is empty & not at index yet, let's move on.
			if( sNameCurrent.len() == 0 )
			{
				if (DEBUG) printl("it's empty, continuing...");
				continue
			}
			
			// CASE: Current icon is NOT empty! First, check if we have space to push it down.
			if( i == 23 )
			{
				printl("SINS InsertIconAtIndex ERROR: cannot insert, wavebar is already full!")
				return
			}
			
			local iFlagsNew = GetIconFlagsByIndex(i)
			
			// We've got space! Push it up to the next index.
			ChangeIconByIndex(i+1, sNameCurrent, false)
			SetIconCountByIndex(i+1, GetIconCountByIndex(i), false, false )
			ChangeIconFlagsByIndex(i+1, iFlagsNew )
		}
		if (DEBUG) printl("Finished moving all icons, now overriding index "+iIndex+" with icon '"+sName+"'!");
		ChangeIconByIndex(iIndex, sName, false)
		if (DEBUG) printl("Setting max enemy count to "+(iMaxEnemyCount+iCount).tostring() );
		SetIconCountByIndex(iIndex,iCount, false, false)
		ChangeIconFlags(sName,iFlags)
		SetPropInt(hTFOR, "m_nMannVsMachineWaveEnemyCount", iMaxEnemyCount + iCount)
	}
	
	// Hides an icon from the wavebar.
	// @string	name : Bot icon to hide.
	HideIcon = function(name)
	{
		local iIndex 					= FindIndexOfIcon(name)
		local iEnemyCount				= GetIconCountByName(name)
		local iFlags 					= GetIconFlags(name)
		local iMaxEnemyCountAfterHide 	= (GetIconFlags(name) & 1) == 1 ? iMaxEnemyCount - iEnemyCount : iMaxEnemyCount //Only subtract if icons were mainwave.
		
		if (DEBUG)
		{
			printl("Hiding icon '"+name+"' ("+iEnemyCount+" on the wavebar), new total enemy count: "+iMaxEnemyCountAfterHide)
		}
		HiddenIcons[name] <- { flags = iFlags, count = iEnemyCount }
		
		ChangeIconFlags(name,0)
		SetPropInt(hTFOR,"m_nMannVsMachineWaveEnemyCount",iMaxEnemyCountAfterHide)
	}
	
	// Unhides a bot icon from the wavebar.
	// @string	name : Bot icon to unhide.
	UnhideIcon = function(name)
	{
		local iIconFlags = GetIconFlags(name)
		if (!name in HiddenIcons || iIconFlags != 0)
		{
			printl("SINS UnhideIcon ERROR: You can't un-hide an icon that's not hidden, dummy.")
			return;
		}
		iIconFlags 						= HiddenIcons[name].flags
		local iIconCount 				= HiddenIcons[name].count
		local iMaxEnemyCountAfterUnhide = iMaxEnemyCount + iIconCount
		
		ChangeIconFlags(name, HiddenIcons[name].flags)
		SetPropInt(hTFOR,"m_nMannVsMachineWaveEnemyCount",iMaxEnemyCountAfterUnhide)
	}
	
	// Wrapper for UnhideIcon.
	UnHideIcon = function(name) { UnhideIcon(name) }
	
	// TODO
	// Advanced function that changes the ENTIRE wavebar to the predefined set of icons, passed in an array.
	// The array should be set up as follows:
	//	array = [ [ "sIconName",  iCount, sFlags ] ]
	// Valid flags: mainwave, support, mission, giant, crit
	SetWavebar = function(arWavebar)
	{}
}
__CollectGameEventCallbacks(SINS)

if (SINS.DEBUG)
	printl("SINS - Debug mode engaged!")

//This think is on the tf_objective_resource.
::IconCountThink <- function()
{
	local iCurrentEnemyCount = 0
	
	local i = 0
	local two = ""
	local i2 = 0
	for(i; i < 24; i++)
	{
		if (i >= 12) two = "2.",i2 = 12;
		
		local iFlags = GetPropIntArray(hTFOR, "m_nMannVsMachineWaveClassFlags"+two, i-i2)
		if (!(iFlags & 1)) continue; //Support is not counted, nor are any that are invisible.
		
		local iIconCount = GetPropIntArray(hTFOR, "m_nMannVsMachineWaveClassCounts"+two, i-i2)
		iCurrentEnemyCount = iCurrentEnemyCount + iIconCount
	}
	
	iMaxEnemyCount = GetPropInt(hTFOR,"m_nMannVsMachineWaveEnemyCount")
	
	if(SINS.DEBUG)
	{
		ClientPrint(null,4,format("Current enemy count / max enemy count:\n%i / %i",iCurrentEnemyCount,iMaxEnemyCount))
	}
	
	flWaveProgress = iCurrentEnemyCount.tofloat() / iMaxEnemyCount.tofloat()
	return -1
}

AddThinkToEnt(hTFOR, "IconCountThink")
