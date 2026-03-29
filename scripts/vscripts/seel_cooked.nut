printl("[DEBUG] Seelpit's Too-Many-Cooks script activated!")

//////////////////////////////////////////////////////////////////////////
//CHANGES TO FUNCTION REFERENCES
//////////////////////////////////////////////////////////////////////////

//Simplifying references to constants and NetProps.
//Credit: VDC wiki, lite.
foreach (k, v in NetProps.getclass())
    if (k != "IsValid")
        getroottable()[k] <- NetProps[k].bindenv(NetProps);
	
foreach (k, v in Entities.getclass())
    if (k != "IsValid")
        getroottable()[k] <- Entities[k].bindenv(Entities);
		
::ROOT <- getroottable();
if (!("ConstantNamingConvention" in ROOT)) // make sure folding is only done once
{
	foreach (a,b in Constants)
		foreach (k,v in b)
			if (v == null)
				ROOT[k] <- 0;
			else
				ROOT[k] <- v;
}

//////////////////////////////////////////////////////////////////////////
//CONSTANTS
//////////////////////////////////////////////////////////////////////////
const STRING_NETPROP_ITEMDEF = "m_AttributeManager.m_Item.m_iItemDefinitionIndex"

const TF_BOT_TYPE = 1337
::ALL_PLAYERS <- MaxClients().tointeger();

//////////////////////////////////////////////////////////////////////////
//EXECUTING SCRIPT
//////////////////////////////////////////////////////////////////////////

IncludeScript("seel_ins.nut",ROOT)

Convars.SetValue("tf_mvm_engineer_teleporter_uber_duration",2.0)

PrecacheEntityFromTable({ classname = "info_particle_system", effect_name = "drg_cow_explosion_sparkles_charged_blue" })

for (local i = 1; i <= ALL_PLAYERS ; i++)
{
	local player = PlayerInstanceFromIndex(i)
	AddThinkToEnt(player,null)
}

::SeelCook <-
{
	Cleanup = function()
	{
		// cleanup any persistent changes here
		Convars.SetValue("tf_mvm_engineer_teleporter_uber_duration",5.0)
		// keep this at the end
		delete ::SeelCook;
	}

	// mandatory events
	OnGameEvent_recalculate_holidays = function(_) { if (GetRoundState() == 3) Cleanup() }
	OnGameEvent_mvm_wave_complete = function(_) { Cleanup() }

	OnGameEvent_player_death = function(params)
	{
		local hDied = GetPlayerFromUserID(params.userid)
		
		if ( !(hDied.IsBotOfType(TF_BOT_TYPE)) ) return;
		
		local hScope = hDied.GetScriptScope()
		
		if ( hDied.HasBotTag("teleporter_bot") )
		{
			EntFire("spawnbot_telein","Enable","",0.8)
			SpawnTele(hDied,"spawnbot_telein")
		}
	}
	
	//Functions taken from the example page, because the math is HARD and bc why reinvent the wheel?
	function VectorAngles(forward)
	{
		local yaw, pitch
		if (forward.y == 0.0 && forward.x == 0.0)
		{
			yaw = 0.0
			if (forward.z > 0.0)
				pitch = 270.0
			else
				pitch = 90.0
		}
		else
		{
			yaw = (atan2(forward.y, forward.x) * 180.0 / Constants.Math.Pi)
			if (yaw < 0.0)
				yaw += 360.0
			
			pitch = (atan2(-forward.z, forward.Length2D()) * 180.0 / Constants.Math.Pi)
			
			if (pitch < 0.0)
				pitch += 360.0
		}

		return QAngle(pitch, yaw, 0.0)
	}
	function ForceTaunt(player, taunt_id)
	{
		local weapon = Entities.CreateByClassname("tf_weapon_bat")
		local active_weapon = player.GetActiveWeapon()
		player.StopTaunt(true)
		player.RemoveCond(7)
		weapon.DispatchSpawn()
		NetProps.SetPropInt(weapon, "m_AttributeManager.m_Item.m_iItemDefinitionIndex", taunt_id)
		NetProps.SetPropBool(weapon, "m_AttributeManager.m_Item.m_bInitialized", true)
		NetProps.SetPropBool(weapon, "m_bForcePurgeFixedupStrings", true)
		NetProps.SetPropEntity(player, "m_hActiveWeapon", weapon)
		player.HandleTauntCommand(0)
		NetProps.SetPropEntity(player, "m_hActiveWeapon", active_weapon)
		weapon.Kill()
	}
	//Function taken from popextensions to have human animations :3
	function PlayerRobotModel(player, model)
	{
		player.ValidateScriptScope()
		local scope = player.GetScriptScope()

		local wearable = CreateByClassname("tf_wearable")
		SetPropString(wearable, "m_iName", "__bot_bonemerge_model")
		SetPropInt(wearable, "m_nModelIndex", PrecacheModel(model))
		SetPropBool(wearable, "m_bValidatedAttachedEntity", true)
		SetPropBool(wearable, STRING_NETPROP_ITEMDEF, true)
		SetPropEntity(wearable, "m_hOwnerEntity", player)
		wearable.SetTeam(player.GetTeam())
		wearable.SetOwner(player)
		DispatchSpawn(wearable)
		EntFireByHandle(wearable, "SetParent", "!activator", -1, player, player)
		SetPropInt(wearable, "m_fEffects", EF_BONEMERGE|EF_BONEMERGE_FASTCULL)
		scope.wearable <- wearable

		SetPropInt(player, "m_nRenderMode", kRenderTransColor)
		SetPropInt(player, "m_clrRender", 0)

		scope.ModelThink <- function()
		{
			if ( !(self.IsAlive()) )
			{
				SetPropString(self, "m_iszScriptThinkFunction", "")
				AddThinkToEnt(self,null)
			}
			if (wearable.IsValid() && (player.IsTaunting() || wearable.GetMoveParent() != player))
				EntFireByHandle(wearable, "SetParent", "!activator", -1, player, player)
			
			return -1
		}
		AddThinkToEnt(player,"ModelThink")
	}
	
	// Function from Runtime Optimization! *Almost* no rafmod, bar the use of a $TeleportWhere keyvalue.
	function SpawnTele(hBot,iszWhere)
	{
		local traceStartPos = hBot.GetOrigin() + Vector(0, 0, 20)
		local traceEndPos = hBot.GetOrigin() + Vector(0, 0, -2000)
		printl("AbsOrigin: "+hBot.GetOrigin().tostring()+", edited to: "+traceStartPos.tostring())
		
		local tbTrace = {
			start = traceStartPos,
			end = traceEndPos,
			hullmin = hBot.GetBoundingMins()
			hullmax = hBot.GetBoundingMaxs()
			mask = 131083 //MASK_NPCWORLDSTATIC: SOLID, WINDOW, MONSTERCLIP, GRATE; aka only world.
		}
		TraceHull(tbTrace)
		printl("Trace finished!")
		
		if (tbTrace.hit)
		{
			printl("Trace hit at "+tbTrace.endpos.tostring())
			local hTele = SpawnEntityFromTable("obj_teleporter",
			{
				targetname = "tp"
				spawnflags = 2
				teamnum = 3
				origin = tbTrace.endpos
				teleportertype = 2
				"$TeleportWhere" : iszWhere
			})
			hTele.SetSolid(0)
			EntFire("tp","RemoveHealth",5000,5)
		}
	}
	function CTFPlayer_AlwaysAimAtBotWithTag(sTag)
	{
		local hBot = null
		for (local i = 1; i <= ALL_PLAYERS ; i++)
		{
			local player = PlayerInstanceFromIndex(i)
			if (player == null) continue
			if ( !(player.IsBotOfType(TF_BOT_TYPE)) ) continue
			if ( !(player.IsAlive()) ) continue
			
			if (player.HasBotTag(sTag))
				hBot = player
		}
		
		if (hBot == null) 
			return
		
		this.GetScriptScope().hTarget <- hBot
		this.GetScriptScope().AimThink <- function()
		{
			if ( !(hTarget.IsAlive()) && self.IsAlive() )
			{
				self.SetUseBossHealthBar(true)
				EntFireByHandle(self, "SetCustomModelWithClassAnimations", format("models/player/%s.mdl", "soldier"), 0.015, null, null)
				EntFireByHandle(self, "RunScriptCode", format("SeelCook.PlayerRobotModel(self, `models/bots/%s/bot_%s.mdl`)", "soldier_boss", "soldier_boss"), 0.015, null, null)
				EntFireByHandle(self, "RunScriptCode", "SeelCook.ForceTaunt(self,31441)", 0.03, null, null)
				// self.SetCustomModelWithClassAnimations("models/bots/soldier_boss/bot_soldier_boss.mdl")
				SINS.ChangeClassIconAndWavebar(self,"soldier_burstfire_spammer")
				SINS.ChangeIconFlags("soldier_burstfire_spammer",25)
				
				self.RemoveBotAttribute(1024) //IGNORE_ENEMIES
				self.RemoveBotAttribute(8192) //ALWAYS_FIRE_WEAPON
				self.ClearAllWeaponRestrictions() //automatically, primaryonly
				
				self.SetHealth(16000)
				self.AddCondEx(52,5.2,null)
				
				self.DropFlag(true)
				
				EntFire("!activator","RunScriptCode","DispatchParticleEffect(`drg_cow_explosion_sparkles_charged_blue`,self.GetOrigin()+Vector(0,0,80),self.EyeAngles().Forward())",0,self)
				local soundlevel = (40 + (20 * log10(1200 / 36.0))).tointeger();
				PrecacheSound("misc/ks_tier_03_kill_01.wav")
				EmitSoundEx({ sound_name = "misc/ks_tier_03_kill_01.wav" })
				
				printl("Target or self no longer alive, removing think and becoming AGGRESSIVE.")
				SetPropString(self, "m_iszScriptThinkFunction", "")
				AddThinkToEnt(self,null)
			}
			
			//Faked uber bc the Soldier refuses to actually pop it???
			//Another medic moment I guess.
			self.AddCondEx(52,0.2,self)
			self.PressFireButton(2)
			
			local vecDir = hTarget.GetOrigin() - self.GetOrigin()
			vecDir.Norm()
			local angLook = SeelCook.VectorAngles(vecDir)
			self.SnapEyeAngles(angLook)
			
			return -1
		}
		AddThinkToEnt(this,"AimThink")
	}
}
foreach ( key, value in SeelCook )
{
	if ( typeof( value ) == "function" && startswith( key, "CTFPlayer_" ) )
	{
		local func_name = key.slice(10);
		CTFPlayer[ func_name ] <- value;
		CTFBot[ func_name ] <- value;
		delete SeelCook[ key ];
	}
}
__CollectGameEventCallbacks(SeelCook);