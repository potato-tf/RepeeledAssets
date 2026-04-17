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
const MASK_NPCWORLDSTATIC = 0x2000B // CONTENTS_SOLID|CONTENTS_WINDOW|CONTENTS_MONSTERCLIP|CONTENTS_GRATE; aka only world.
::ALL_PLAYERS <- MaxClients().tointeger();

//////////////////////////////////////////////////////////////////////////
//EXECUTING SCRIPT
//////////////////////////////////////////////////////////////////////////

IncludeScript("seel_ins.nut",ROOT)

Convars.SetValue("tf_mvm_engineer_teleporter_uber_duration",2.0)

PrecacheSound("misc/ks_tier_03_kill_01.wav")
PrecacheEntityFromTable({ classname = "info_particle_system", effect_name = "drg_cow_explosion_sparkles_charged_blue" })

for (local i = 1; i <= ALL_PLAYERS ; i++)
{
	local player = PlayerInstanceFromIndex(i)
	if (!player)
		continue

	NetProps.SetPropBool(player, "m_bForcePurgeFixedupStrings", true)
	AddThinkToEnt(player, null)
}

::SeelCook <-
{
	Cleanup = function()
	{
		// cleanup any persistent changes here
		Convars.SetValue("tf_mvm_engineer_teleporter_uber_duration", 5.0) // TODO: Should probably store the original value in case the server changes it
		for (local i = 1; i <= ALL_PLAYERS; i++)
		{
			local player = PlayerInstanceFromIndex(i)
			if (!player)
				continue

			local scope = player.GetScriptScope()
			if (scope && "wearable" in scope && scope.wearable.IsValid())
				scope.wearable.Destroy()

			SetPropInt(player, "m_nRenderMode", kRenderNormal)
			SetPropInt(player, "m_clrRender", 0xFFFFFFFF)

			AddThinkToEnt(player, null)
			player.TerminateScriptScope()
		}
		// keep this at the end
		delete ::SeelCook;
	}

	// mandatory events
	OnGameEvent_recalculate_holidays = function(_) { if (GetRoundState() == GR_STATE_PREROUND) Cleanup() }
	OnGameEvent_mvm_wave_complete = function(_) { Cleanup() }

	OnGameEvent_player_death = function(params)
	{
		local hDied = GetPlayerFromUserID(params.userid)

		if ( !(hDied.IsBotOfType(TF_BOT_TYPE)) ) return;

		if ( hDied.HasBotTag("teleporter_bot") )
		{
			EntFire("spawnbot_telein","Enable","",0.8)
			SpawnTele(hDied,"spawnbot_telein")
		}

		local scope = hDied.GetScriptScope()
		if (scope && "wearable" in scope)
		{
			if (scope.wearable.IsValid())
				scope.wearable.Destroy()
			delete scope.wearable
		}

		SetPropInt(hDied, "m_nRenderMode", kRenderNormal)
		SetPropInt(hDied, "m_clrRender", 0xFFFFFFFF)
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
		player.RemoveCond(TF_COND_TAUNTING)
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
		SetPropBool(wearable, "m_bForcePurgeFixedupStrings", true)
		SetPropInt(wearable, "m_nModelIndex", PrecacheModel(model))
		SetPropBool(wearable, "m_bValidatedAttachedEntity", true)
		wearable.SetTeam(player.GetTeam())
		wearable.SetOwner(player)
		wearable.DispatchSpawn()
		wearable.AcceptInput("SetParent", "!activator", player, null)
		SetPropInt(wearable, "m_fEffects", EF_BONEMERGE|EF_BONEMERGE_FASTCULL)
		scope.wearable <- wearable

		SetPropInt(player, "m_nRenderMode", kRenderTransColor)
		SetPropInt(player, "m_clrRender", 0)
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
			mask = MASK_NPCWORLDSTATIC
		}
		TraceHull(tbTrace)
		printl("Trace finished!")

		if (tbTrace.hit)
		{
			printl("Trace hit at "+tbTrace.endpos.tostring())
			local hTele = SpawnEntityFromTable("obj_teleporter",
			{
				spawnflags = 2
				teamnum = 3
				origin = tbTrace.endpos
				teleportertype = 2
				"$TeleportWhere" : iszWhere
			})
			NetProps.SetPropBool(hTele, "m_bForcePurgeFixedupStrings", true)
			hTele.SetSolid(SOLID_NONE)
			EntFireByHandle(hTele, "RemoveHealth", "5000", 5.0, null, null)
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

		hBot.ValidateScriptScope()
		this.GetScriptScope().hTarget <- hBot
		this.GetScriptScope().AimThink <- function()
		{
			if ( !(hTarget.IsAlive()) && self.IsAlive() )
			{
				self.SetUseBossHealthBar(true)
				self.SetCustomModelWithClassAnimations("models/player/soldier.mdl")
				SeelCook.PlayerRobotModel(self, "models/bots/soldier_boss/bot_soldier_boss.mdl")
				EntFireByHandle(self, "RunScriptCode", "SeelCook.ForceTaunt(self, 31441)", 0.03, null, null) // Taunt: Unleashed Rage
				SINS.ChangeClassIconAndWavebar(self, "soldier_burstfire_spammer")
				SINS.ChangeIconFlags("soldier_burstfire_spammer", FLAG_MAINWAVE|FLAG_GIANT|FLAG_CRIT)

				self.RemoveBotAttribute(IGNORE_ENEMIES|ALWAYS_FIRE_WEAPON)
				self.ClearAllWeaponRestrictions() //automatically, primaryonly

				self.SetHealth(16000)
				self.AddCondEx(TF_COND_INVULNERABLE_USER_BUFF, 5.2, null)

				self.DropFlag(true)

				DispatchParticleEffect("drg_cow_explosion_sparkles_charged_blue", self.GetOrigin() + Vector(0.0, 0.0, 80.0), self.EyeAngles().Forward())
				EmitSoundEx({ sound_name = "misc/ks_tier_03_kill_01.wav" })

				printl("Target or self no longer alive, removing think and becoming AGGRESSIVE.")
				SetPropString(self, "m_iszScriptThinkFunction", "")
				AddThinkToEnt(self,null)
				return 1.0
			}

			//Faked uber bc the Soldier refuses to actually pop it???
			//Another medic moment I guess.
			self.AddCondEx(TF_COND_INVULNERABLE_USER_BUFF, 0.2, self)
			self.PressFireButton(2.0)

			local vecDir = hTarget.GetOrigin() - self.GetOrigin()
			vecDir.Norm()
			local angLook = SeelCook.VectorAngles(vecDir)
			self.SnapEyeAngles(angLook)

			return -1.0
		}
		AddThinkToEnt(this, "AimThink")
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
