::ROOT        <- getroottable()
::MAX_CLIENTS <- MaxClients().tointeger()

foreach(k, v in ::Entities.getclass())
	if(k != "IsValid" && !(k in ROOT))
		ROOT[k] <- ::Entities[k].bindenv(::Entities)

foreach(k, v in ::NetProps.getclass())
	if(k != "IsValid" && !(k in ROOT))
		ROOT[k] <- ::NetProps[k].bindenv(::NetProps)

if(!("ConstantNamingConvention" in ROOT))
	foreach(a, b in Constants)
		foreach(k, v in b)
			ROOT[k] <- v != null ? v : 0


local UNOFFICIAL_CONSTANTS = {
	FLT_MAX = 3.402823466e+38
	INT_MAX = 2147483647

	MASK_PLAYERSOLID_BRUSHONLY = 81931

	LIFE_ALIVE = 0
	LIFE_DEAD  = 2

	FFADE_IN = 1

	TF_DEATH_FEIGN_DEATH = 32
}
foreach(k,v in UNOFFICIAL_CONSTANTS)
	if(!(k in ROOT))
		ROOT[k] <- v

local hWorld = First()
hWorld.ValidateScriptScope()
local hWorld_scope = hWorld.GetScriptScope()

::RangeScript <- {
	function CleanupRangeScript(hBot = null)
	{
		for(local hScript; hScript = FindByName(hScript, "rangescript_think");)
		{
			local hScript_scope = hScript.GetScriptScope()
			if(!hBot || hScript_scope.hBot == hBot)
			{
				SetPropString(hScript_scope.hBot, "m_PlayerClass.m_iszClassIcon", hScript_scope.sIconLast)
				DispatchParticleEffectOn(hScript_scope.hBot, null)
				hScript.Destroy()
			}
		}
	}
	function OnGameEvent_recalculate_holidays(_)
	{
		if(GetRoundState() == GR_STATE_PREROUND)
		{
			CleanupRangeScript()
			delete ::RangeScript
		}
	}

	PlayerArray = []
	function OnGameEvent_player_activate(params)
	{
		local Remove = []
		foreach(i, hPlayer in PlayerArray)
			if(!hPlayer.IsValid())
				Remove.append(i)
		foreach(i in Remove)
			PlayerArray.remove(i)

		local hPlayer = GetPlayerFromUserID(params.userid)

		if(!hPlayer) return

		PlayerArray.append(hPlayer)
		PlayerArray.sort(function(hCurrent, hNext)
		{
			local iCurrent = hCurrent.entindex()
			local iNext    = hNext.entindex()
			if(iCurrent > iNext)
				return 1
			else if(iCurrent < iNext)
				return -1
			return 0
		})
	}
	function OnGameEvent_player_disconnect(params)
	{
		local hPlayer = GetPlayerFromUserID(params.userid)
		local iIndex  = PlayerArray.find(hPlayer)
		if(iIndex != null)
			PlayerArray.remove(iIndex)
	}

	function OnGameEvent_player_hurt(params)
	{
		if(params.health > 0)
			return

		local hVictim = GetPlayerFromUserID(params.userid)
		if(hVictim)
			CleanupRangeScript(hVictim)
	}

	function MarkForPurge(hEnt) SetPropBool(hEnt, "m_bForcePurgeFixedupStrings", true)
	function CreateByClassnameSafe(sClassname)
	{
		local hEnt = CreateByClassname(sClassname)
		MarkForPurge(hEnt)
		return hEnt
	}
	function SpawnEntityFromTableSafe(sClassname, KeyValues)
	{
		local hEnt = SpawnEntityFromTable(sClassname, KeyValues)
		MarkForPurge(hEnt)
		return hEnt
	}

	function ClearStringFromPool(sString)
	{
		local hDummy = CreateByClassnameSafe("info_target")
		hDummy.KeyValueFromString("targetname", sString)
		hDummy.Destroy()
	}
	function DelayFunction(hTarget, Scope, flDelay, func)
	{
		local sFuncName = UniqueString()
		hWorld_scope[sFuncName] <- function()
		{
			delete hWorld_scope[sFuncName]
			if(!hTarget)
				func.call(Scope || ROOT)
			else if(hTarget.IsValid())
				func.call(Scope || { self = hTarget })
		}
		EntFireByHandle(hWorld, "CallScriptFunction", sFuncName, flDelay, null, null)
		ClearStringFromPool(sFuncName)
	}

	function ChangeAttributes(hBot, sEvent)
	{
		if(!hBot.IsAlive())
			return

		local RevertPlayerArray = []
		foreach(hPlayer in PlayerArray)
			if(hPlayer != hBot && hPlayer.IsAlive() && hPlayer.IsBotOfType(TF_BOT_TYPE))
			{
				RevertPlayerArray.append(hPlayer)
				SetPropInt(hPlayer, "m_lifeState", LIFE_DEAD)
			}

		local hInterface = SpawnEntityFromTableSafe("point_populator_interface", {})
		hInterface.AcceptInput("ChangeBotAttributes", sEvent, null, null)
		hInterface.Destroy()

		foreach(hPlayer in RevertPlayerArray)
			SetPropInt(hPlayer, "m_lifeState", LIFE_ALIVE)
	}

	function ClearPlayerWeapons(hPlayer)
	{
		for(local i = 0; i < 8; i++)
		{
			local hHeldWeapon = GetPropEntityArray(hPlayer, "m_hMyWeapons", i)
			if(!hHeldWeapon)
				continue
			hHeldWeapon.Destroy()
			SetPropEntityArray(hPlayer, "m_hMyWeapons", null, i)
		}
		SetPropEntity(hPlayer, "m_hActiveWeapon", null)
	}
	function GivePlayerWeapon(hPlayer, sClassname, iItemIndex)
	{
		local hWeapon = CreateByClassnameSafe(sClassname)
		SetPropInt(hWeapon, "m_AttributeManager.m_Item.m_iItemDefinitionIndex", iItemIndex)
		SetPropBool(hWeapon, "m_AttributeManager.m_Item.m_bInitialized", true)
		SetPropBool(hWeapon, "m_bValidatedAttachedEntity", true)
		hWeapon.SetTeam(hPlayer.GetTeam())
		hWeapon.DispatchSpawn()

		for (local i = 0; i < 8; i++)
		{
			local hHeldWeapon = GetPropEntityArray(hPlayer, "m_hMyWeapons", i)
			if(!hHeldWeapon || (hHeldWeapon.GetSlot() != hWeapon.GetSlot()))
				continue
			hHeldWeapon.Destroy()
			SetPropEntityArray(hPlayer, "m_hMyWeapons", null, i)
			break
		}

		hPlayer.Weapon_Equip(hWeapon)
		hPlayer.Weapon_Switch(hWeapon)

		return hWeapon
	}

	function DispatchParticleEffectOn(hEntity, sName, iAttachment = null, iAttachmentType = null)
	{
		if(!sName) { hEntity.AcceptInput("DispatchEffect", "ParticleEffectStop", null, null); return }
		local hParticle = CreateByClassnameSafe("trigger_particle")
		hParticle.KeyValueFromString("particle_name", sName)
		if(iAttachment)
			hParticle.KeyValueFromString("attachment_name", iAttachment)
		hParticle.KeyValueFromInt("attachment_type", iAttachment == null ? 1 : (iAttachmentType == null ? 4 : iAttachmentType))
		hParticle.KeyValueFromInt("spawnflags", 64)
		hParticle.DispatchSpawn()
		hParticle.AcceptInput("StartTouch", null, hEntity, hEntity)
		hParticle.Destroy()
	}

	// excludes mad milk because thats just how the game was coded
	function IsStealthedOrDisguised(hPlayer) return (hPlayer.IsStealthed() || hPlayer.InCond(TF_COND_DISGUISED)) && !hPlayer.InCond(TF_COND_BURNING) && !hPlayer.InCond(TF_COND_URINE) && !hPlayer.InCond(TF_COND_STEALTHED_BLINK) && !hPlayer.InCond(TF_COND_BLEEDING)

	function OnGameEvent_player_spawn(params)
	{
		local hPlayer = GetPlayerFromUserID(params.userid)
		if(hPlayer.IsBotOfType(TF_BOT_TYPE))
			DelayFunction(null, this, -1, @() PostBotSpawn(hPlayer))
	}
	function PostBotSpawn(hBot)
	{
		if(hBot.HasBotTag("bot_rangescript"))
			ApplyRangeScriptToBot(hBot)
	}

	BehaviorList = {}

	function ApplyRangeScriptToBot(hBot)
	{
		local hThinkEnt = CreateByClassnameSafe("info_target")
		SetPropString(hThinkEnt, "m_iName", "rangescript_think")
		hThinkEnt.ValidateScriptScope()
		local hThinkEnt_scope = hThinkEnt.GetScriptScope()

		DispatchParticleEffectOn(hBot, "utaunt_signalinterference_parent")

		hThinkEnt_scope.hBot      <- hBot
		hThinkEnt_scope.sIconLast <- GetPropString(hBot, "m_PlayerClass.m_iszClassIcon")

		local sCurrentEvent    = ""
		local flTimeNext       = 0
		local iHealthBelowLast = INT_MAX
		hThinkEnt_scope.Think <- function()
		{
			if(!self.IsValid())
				return

			if(!hBot.IsAlive())
			{
				self.Destroy()
				return
			}

			// fix for banners
			local flTime = Time()
			local hActiveWeapon = hBot.GetActiveWeapon()
			if(hActiveWeapon && hActiveWeapon.GetClassname() == "tf_weapon_buff_item")
			{
				if(GetPropInt(hBot, "m_nButtons") & IN_ATTACK && flTime >= GetPropFloat(hActiveWeapon, "m_flNextPrimaryAttack"))
					SetPropInt(hBot, "m_afButtonDisabled", IN_ATTACK)
			}
			else if(GetPropInt(hBot, "m_afButtonDisabled") & IN_ATTACK)
				SetPropInt(hBot, "m_afButtonDisabled", 0)

			// dont change so fast
			if(flTime < flTimeNext)
				return -1

			// find valid player
			local hTarget
			local vecEye     = hBot.EyePosition()
			local vecForward = hBot.EyeAngles().Forward()
			local iTeamNum   = hBot.GetTeam()
			local flDot      = 0.75
			foreach(hPlayer in RangeScript.PlayerArray)
				if(hPlayer.IsAlive() && !RangeScript.IsStealthedOrDisguised(hPlayer) && hPlayer.GetTeam() != iTeamNum && hPlayer.GetDisguiseTeam() != iTeamNum)
				{
					local vecTargetCenter = hPlayer.GetCenter()
					local vecTowards      = vecTargetCenter - vecEye
					vecTowards.Norm()
					local flDotNew = vecTowards.Dot(vecForward)
					if(flDotNew > flDot)
					{
						local Trace = {
							start = vecEye
							end   = vecTargetCenter
							mask  = MASK_PLAYERSOLID_BRUSHONLY
						}
						TraceLineEx(Trace)
						if(Trace.fraction == 1.0)
						{
							flDot   = flDotNew
							hTarget = hPlayer
						}
					}
				}

			if(hTarget)
			{
				// find valid event
				local iHealth      = hBot.GetHealth()
				local iHealthBelow = INT_MAX
				local flRange      = (hTarget.GetCenter() - vecEye).Length()
				local flMaxRange   = FLT_MAX
				local sValidEvent  = ""
				local ValidEventTable
				foreach(sEvent, Table in RangeScript.BehaviorList)
				{
					if("IfHealthBelow" in Table)
					{
						if(iHealth <= Table.IfHealthBelow && Table.IfHealthBelow <= iHealthBelow)
							iHealthBelow = Table.IfHealthBelow
						else continue
					}
					else if(iHealthBelow != INT_MAX)
						continue

					if("Range" in Table)
					{
						if(flRange <= Table.Range && Table.Range <= flMaxRange)
							flMaxRange = Table.Range
						else continue
					}
					else if(flMaxRange != FLT_MAX)
						continue

					ValidEventTable = Table
					sValidEvent     = sEvent
				}

				// event is different
				if(sValidEvent != sCurrentEvent)
				{
					sCurrentEvent = sValidEvent
					flTimeNext    = flTime + 0.25

					if("Model" in ValidEventTable)
						hBot.SetCustomModelWithClassAnimations(ValidEventTable.Model)
					if("ClassIcon" in ValidEventTable)
						SetPropString(hBot, "m_PlayerClass.m_iszClassIcon", ValidEventTable.ClassIcon)
					if("Weapon" in ValidEventTable)
					{
						hBot.RemoveCond(TF_COND_AIMING)
						hBot.RemoveCond(TF_COND_TAUNTING)
						RangeScript.ClearPlayerWeapons(hBot)
						RangeScript.GivePlayerWeapon(hBot, ValidEventTable.Weapon[0], ValidEventTable.Weapon[1])
					}
					if("WeaponAttributes" in ValidEventTable)
					{
						local hWeapon = hBot.GetActiveWeapon()
						if(hWeapon)
							foreach(sKey, Value in ValidEventTable.WeaponAttributes)
							{
								if(typeof Value == "string")
									hBot.AcceptInput("$AddItemAttribute", format("%s|%s", sKey, Value), null, null)
								else
									hWeapon.AddAttribute(sKey, Value, -1)
							}
					}

					RangeScript.ChangeAttributes(hBot, sValidEvent)

					// visual effects

					RangeScript.DispatchParticleEffectOn(hBot, "utaunt_signalinterference_parent")

					local hItem = GetPropEntity(hBot, "m_hItem")
					if(hItem)
						hItem.AcceptInput("SetParentAttachment", "flag", null, null)

					EmitSoundEx({
						sound_name  = ")weapons/vaccinator_toggle.wav"
						entity      = hBot
						filter      = RECIPIENT_FILTER_GLOBAL
						sound_level	= 90
					})

					local flScale = 1.2
					local hSprite = RangeScript.SpawnEntityFromTableSafe("env_glow", {
						origin     = hBot.GetOrigin() + Vector(0, 0, 82) * hBot.GetModelScale() * 0.5
						model      = "effects/conc_warp.vmt"
						rendermode = 1
						spawnflags = 1
						scale      = flScale
					})
					hSprite.ValidateScriptScope()
					hSprite.GetScriptScope().Think <- function()
					{
						SetPropFloat(self, "m_flSpriteScale", flScale -= 0.1)
						if(flScale <= 0.0)
							self.Destroy()
						return -1
					}
					AddThinkToEnt(hSprite, "Think")

					if(iHealthBelow != iHealthBelowLast)
					{
						iHealthBelowLast = iHealthBelow
						SetPropFloat(hBot, "m_Shared.m_flRageMeter", 100)

						foreach(hPlayer in RangeScript.PlayerArray)
						{
							if(hPlayer.IsFakeClient())
								continue

							for(local i = 1; i <= 2; i++)
								EmitSoundEx({
									sound_name  = "npc/combine_gunship/ping_search.wav"
									entity      = hPlayer
									filter      = RECIPIENT_FILTER_SINGLE_PLAYER
								})
							ScreenFade(hPlayer, 255, 63, 63, 30, 0.5, 0.5, FFADE_IN)
						}
					}
				}
			}

			return -1
		}
		AddThinkToEnt(hThinkEnt, "Think")
	}
}
__CollectGameEventCallbacks(RangeScript)

for(local i = 1; i <= MAX_CLIENTS; i++)
{
	local hPlayer = PlayerInstanceFromIndex(i)
	if(!hPlayer) continue
	RangeScript.PlayerArray.append(hPlayer)
}

PrecacheSound(")weapons/vaccinator_toggle.wav")
PrecacheSound("npc/combine_gunship/ping_search.wav")