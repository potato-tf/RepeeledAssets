IncludeScript("fatcat_library")
PrecacheSound("weapons/teleporter_send.wav")
PrecacheSound("weapons/teleporter_receive.wav")

SetScriptVersion("longbow_sentry", "1.0.6")

///// Events! /////
::longbow_events <- {
	function OnScriptEvent_HumanSpawn(params)
	{
		local player = params.player
		if(player.GetWeaponIDXInSlot(SLOT_MELEE) != TF_WEAPON_EUREKA_EFFECT) return

		player.AddThink(LongBowSentry, "LongbowSentry")
	}
}
__CollectGameEventCallbacks(longbow_events)

//// Player Think ////
function LongBowSentry()
{
	if(self.GetWeaponIDXInSlot(SLOT_MELEE) != TF_WEAPON_EUREKA_EFFECT)
	{
		self.RemoveThink("LongbowSentry")
		return 500
	}
	local m_iMetal = self.GetMetal()
	local building_blueprint = GetPropEntity(self.GetWeaponInSlotNew(SLOT_PDA), "m_hObjectBeingBuilt")
	if(!IsBuildingValid(building_blueprint)) // checks for null building, and "m_bServerOverridePlacement"
		return -1
	
	if(GetPropInt(building_blueprint, "m_iObjectType") != OBJ_SENTRY)
		return -1

	local mins = GetPropVector(building_blueprint, "m_Collision.m_vecMins")
	local maxs = GetPropVector(building_blueprint, "m_Collision.m_vecMaxs") + Vector(0, 0, 10)

	if(!self.IsPressingButton(IN_RELOAD) || !self.IsOnGround())
		return -1

	if(m_iMetal <= 499)
	{
		self.TranslateToHud("LOW_METAL")
		return -1
	}

	local trace =
	{
		start = 	self.EyePosition()
		end = 		self.EyePosition() + self.EyeAngles().Forward() * 1190
		mask =		MASK_CUSTOM_PLAYERSOLID
		hullmin =	mins
		hullmax = 	maxs
		ignore = 	self
	}
	TraceHull(trace)
	if(!trace.hit) return -1
		// if(IsListenServer()) DebugDrawLine_vCol(trace.startpos, trace.endpos, Vector(255, 0, 0), false, 10)

	if(IsPointInRespawnRoom(trace.endpos))  return -1

	local hulltrace =
	{
		start = 	trace.endpos
		end = 		trace.endpos
		mask =		MASK_SHOT_HULL
		hullmin = 	mins
		hullmax =	maxs
	}
	TraceHull(hulltrace)
	if(hulltrace.hit)
	{
		// if(IsListenServer()) DebugDrawBox(hulltrace.start, mins, maxs, 255, 0, 255, 0, 60)
		return -1
	}

	self.GetActiveWeapon().PrimaryAttack()

	local particle = SpawnEntityFromTable("info_particle_system", {
		effect_name = "dxhr_sniper_rail_red",
		origin = building_blueprint.GetCenter(),
		start_active = 1
	})
	SetPropEntityArray(particle, "m_hControlPointEnts", building_blueprint, 0)
	SetPropEntityArray(particle, "m_hControlPointEnts", building_blueprint, 1)
	EntFireNew(particle, "Kill", null, 6)
	building_blueprint.Teleport(true, trace.endpos, false, QAngle(), false, Vector())

	local particle2 = SpawnEntityFromTable("info_particle_system", {
		effect_name = "teleported_red",
		origin = building_blueprint.GetOrigin(),
		angles = Vector(0, -90, 0)
		start_active = 1
	})

	// if (IsListenServer()) ShowAABB(building_blueprint, Vector4D(255, 125, 0, 0), 10)

	GetScope(building_blueprint).think <- function() {
		if(GetBuilder(self).GetWeaponIDXInSlotNew(SLOT_MELEE) != TF_WEAPON_EUREKA_EFFECT)
		{
			ClearThinks(self)
			return
		}
		foreach (bot in GetAllPlayers(TF_TEAM_PVE_INVADERS, [self.GetOrigin() + Vector(0, 0, 24), 100], true))
		{
			if(bot.InCond(TF_COND_INVULNERABLE_HIDE_UNLESS_DAMAGED))
			{
				self.TakeDamage(self.GetMaxHealth() * 10, 0, bot)
				ClearThinks(self)
				return
			}
		}
		return -1
	}
	AddThinkToEnt(building_blueprint, "think")

	EmitSoundEx({
		sound_name = "weapons/teleporter_send.wav"
		entity = self
		volume = 0.5
		sound_level = MATH.ConvertRadiusToSndLvl(1000)
	})
	EmitSoundEx({
		sound_name = "weapons/teleporter_receive.wav"
		entity = building_blueprint
		sound_level = MATH.ConvertRadiusToSndLvl(2500)
	})
	self.SetMetal(m_iMetal - 500)
	return -1
}