local ROOT = getroottable()

// stupid script
if( !("nopey_lib" in ROOT) )
{
	::nopey_lib <- 0
}
else if ( ::nopey_lib == 1 )
{
	return
}
else
{
	::nopey_lib = 1
}

IncludeScript("nopey_lib/constants_nopey_fork", ROOT)

::findAllPlayer <- function(onlyRealPlayer = false)
{
	local bigList = []
	local MAX_CLIENTS = MaxClients().tointeger()
	for (local i = 1; i <= MAX_CLIENTS; i++)
	{
		local hPlayer = PlayerInstanceFromIndex(i)
		if(hPlayer && (!hPlayer.IsFakeClient() || !onlyRealPlayer))
		{
			bigList.append(hPlayer)
		}
	}
	return bigList
}

::findAllBots <- function()
{
	local bigList = []
	local MAX_CLIENTS = MaxClients().tointeger()
	for (local i = 1; i <= MAX_CLIENTS; i++)
	{
		local hPlayer = PlayerInstanceFromIndex(i)
		if(hPlayer && hPlayer.IsFakeClient())
		{
			bigList.append(hPlayer)
		}
	}
	return bigList
}

::findRandomPlayer <- function()
{
	local MAX_CLIENTS = MaxClients().tointeger()
	local skip = false
	for (local i = 1; i <= MAX_CLIENTS; i++)
	{
		local hPlayer = PlayerInstanceFromIndex(i)
		if(hPlayer && !hPlayer.IsFakeClient())
		{
			if (skip)
			{
				skip = false
				continue
			}
			return hPlayer
		}
	}
}

::findRandomBot <- function()
{
	local MAX_CLIENTS = MaxClients().tointeger()
	local skip = false
	for (local i = 1; i <= MAX_CLIENTS; i++)
	{
		local hPlayer = PlayerInstanceFromIndex(i)
		if(hPlayer && hPlayer.IsFakeClient())
		{
			if (skip)
			{
				skip = false
				continue
			}
			return hPlayer
		}
	}
}

::IsAlive <- function(player) {
	return GetPropInt(player, "m_lifeState") == 0
}

::CreateTimer <- function(func, delay = 1)
{
	local timer = Entities.CreateByClassname( "logic_timer" )

	// set refire time
	timer.KeyValueFromFloat( "RefireTime", delay )

	timer.ValidateScriptScope()
	local scope = timer.GetScriptScope()
	
	// add a reference to the function
	scope.OnTimer <- func
	scope.Destroy <- function() 
	{
		try
		{
			timer.Destroy()
		} catch (e) {
			printl(e)
		}
	}

	// connect the OnTimer output,
	// every time the timer fires the output, the function is executed
	timer.ConnectOutput( "OnTimer", "OnTimer" )
	timer.ConnectOutput( "OnTimer", "Destroy" )

	// start the timer
	EntFireByHandle( timer, "Enable", "", 0, null, null )
	EntFireByHandle( timer, "Disable", "", delay+0.01, null, null )
	
	return timer

}

const MAX_WEAPONS = 8
::GivePlayerWeapon <- function(player, classname, item_id)
{
	local weapon = CreateByClassname(classname)
	SetPropInt(weapon, "m_AttributeManager.m_Item.m_iItemDefinitionIndex", item_id)
	SetPropBool(weapon, "m_AttributeManager.m_Item.m_bInitialized", true)
	SetPropBool(weapon, "m_bValidatedAttachedEntity", true)
	weapon.SetTeam(player.GetTeam())
	if ( classname == "tf_weapon_builder" && item_id == 28)
	{
		SetPropInt(weapon, "m_iObjectType", 2)
		SetPropInt(weapon, "m_iObjectMode", 0)
		SetPropBoolArray(weapon, "m_aBuildableObjectTypes", true, 0)
		SetPropBoolArray(weapon, "m_aBuildableObjectTypes", true, 1)
		SetPropBoolArray(weapon, "m_aBuildableObjectTypes", true, 2)
		SetPropBoolArray(weapon, "m_aBuildableObjectTypes", false, 3)
		SetPropEntity(weapon, "m_hBuilder", player)
	}
	weapon.DispatchSpawn()

	// remove existing weapon in same slot
	for (local i = 0; i < MAX_WEAPONS; i++)
	{
		local held_weapon = GetPropEntityArray(player, "m_hMyWeapons", i)
		if (held_weapon == null)
			continue
		if (held_weapon.GetSlot() != weapon.GetSlot())
			continue
		held_weapon.Destroy()
		SetPropEntityArray(player, "m_hMyWeapons", null, i)
		break
	}

	player.Weapon_Equip(weapon)
	player.Weapon_Switch(weapon)

	return weapon
}

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



::VectorAngles <- function(forward) {
	local yaw, pitch
	if ( forward.y == 0.0 && forward.x == 0.0 ) {
		yaw = 0.0
		if (forward.z > 0.0)
			pitch = 270.0
		else
			pitch = 90.0
	}
	else {
		yaw = (atan2(forward.y, forward.x) * 180.0 / Pi)
		// if (yaw < 0.0)
			// yaw += 360.0
		if (yaw > 180.0)
			yaw -= 360.0
		pitch = (atan2(-forward.z, forward.Length2D()) * 180.0 / Pi)
		//if (pitch < 0.0)
		//	pitch += 360.0
	}

	return QAngle(pitch, yaw, 0.0)
}

::AnglesToVector <- function(angles) {
	local pitch = angles.x * Pi / 180.0
	local yaw = angles.y * Pi / 180.0
	local x = cos(pitch) * cos(yaw)
	local y = cos(pitch) * sin(yaw)
	local z = -sin(pitch)
	return Vector(x, y, z)
}

::WorldSpaceCenter <- function(ent)
{
	local origin = ent.GetOrigin()
	origin += (ent.GetBoundingMaxs() + ent.GetBoundingMins()) * 0.5
	
	return origin
}

::IsLineOfFireClear <- function(attacker, ent)
{
	if (ent == null) return false
	local trace = {
		start  = attacker.EyePosition(),
		end    = WorldSpaceCenter(ent),
		mask   = MASK_OPAQUE,
		ignore = attacker
	}
	TraceLineEx(trace)
	return !trace.hit
}

::GetLookAtPos <- function(hPlayer, max, playerCollide = false)
{
	local start_calc = hPlayer.EyePosition()
	local EyeAngles_fwd = hPlayer.EyeAngles().Forward()
	local end_calc = start_calc + EyeAngles_fwd * max
	local result
	
	local trace =
	{
		start = start_calc,
		end = end_calc,
		ignore = hPlayer,
		mask = 1107296257, // CONTENTS_SOLID|CONTENTS_MONSTER|CONTENTS_HITBOX
		
	};
	
	if (playerCollide)
	{
		result = start_calc + EyeAngles_fwd * max * TraceLinePlayersIncluded(start_calc, end_calc, hPlayer)
	}
	else
		result = start_calc + EyeAngles_fwd * max * TraceLine(start_calc, end_calc, null)
	//printl(result)
	//hMarker.SetAbsOrigin(result)
	return result
}

::GetLookAtPosADV <- function(hPlayer, max, both_team = false, return_hit = false)
{
	if ( !hPlayer )
		return null
		
	local start_calc = hPlayer.EyePosition()
	local EyeAngles_fwd = hPlayer.EyeAngles().Forward()
	local end_calc = start_calc + EyeAngles_fwd * max
	local result
	
	local trace =
	{
		start = start_calc,
		end = end_calc,
		ignore = hPlayer,
		mask = 1107296257, // CONTENTS_SOLID|CONTENTS_MONSTER|CONTENTS_HITBOX
		filter = function(entity)
		{
			// if player is on blu team, accept the hit
			if (entity.IsPlayer())
			{
				if (both_team)
					return TRACE_STOP;
				if (entity.GetTeam() == 3)
					return TRACE_STOP;
			}
			return TRACE_CONTINUE;
		}
	};

	TraceLineFilter(trace);
	
	if (trace.hit)
	{
		if (return_hit)
		{
			//if (trace.enthit.IsPlayer())
				return trace.enthit
			//else
			//	return null
		}
		
		if (trace.enthit.IsPlayer())
			result = Vector(trace.enthit.GetOrigin().x, trace.enthit.GetOrigin().y, (trace.enthit.GetOrigin().z+trace.enthit.EyePosition().z)/2)
		else
			result = start_calc + EyeAngles_fwd * max * trace.fraction
			
		
		//printl(trace.enthit);
	}
	else
	{
		DebugDrawLine(trace.start, trace.endpos, 0, 255, 0, false, 5.0);
		result = start_calc + EyeAngles_fwd * max
		//printl("no hit");
	}
	
	
	//printl(result)
	//hMarker.SetAbsOrigin(result)
	return result
}
::FindGround <- function(hPlayer, max, both_team = false, return_hit = false)
{
	local start_calc = hPlayer.EyePosition()
	local downward = Vector( 0, 0, -1 )
	local end_calc = start_calc + EyeAngles_fwd * max
	local result
	
	local trace =
	{
		start = start_calc,
		end = end_calc,
		ignore = hPlayer,
		mask = 1107296257, // CONTENTS_SOLID|CONTENTS_MONSTER|CONTENTS_HITBOX
		filter = function(entity)
		{
			// if player is on blu team, accept the hit
			if (entity.IsPlayer())
			{
				if (both_team)
					return TRACE_STOP;
				if (entity.GetTeam() == 3)
					return TRACE_STOP;
			}
			return TRACE_CONTINUE;
		}
	};

	TraceLineFilter(trace);
	
	if (trace.hit)
	{
		if (return_hit)
		{
			//if (trace.enthit.IsPlayer())
				return trace.enthit
			//else
			//	return null
		}
		
		if (trace.enthit.IsPlayer())
			result = Vector(trace.enthit.GetOrigin().x, trace.enthit.GetOrigin().y, (trace.enthit.GetOrigin().z+trace.enthit.EyePosition().z)/2)
		else
			result = start_calc + EyeAngles_fwd * max * trace.fraction
			
		
		//printl(trace.enthit);
	}
	else
	{
		DebugDrawLine(trace.start, trace.endpos, 0, 255, 0, false, 5.0);
		result = start_calc + EyeAngles_fwd * max
		//printl("no hit");
	}
	
	
	//printl(result)
	//hMarker.SetAbsOrigin(result)
	return result
}

::GetGround <- function( pos )
{
	local trace = {
		start = pos,
		end = pos + Vector( 0, 0, -99999 ),
		mask = MASK_SOLID_BRUSHONLY,
		ignore = null,
	}
	TraceLineEx(trace)
	
	if ( !trace.hit )
	{
		printl("trace failed")
		//return false
	}
	
	//birded.hMarker.SetAbsOrigin(trace.pos)
	return trace.pos
}

::calcTimeToTargetZ <- function(x0, xd, v0, a, return_result = false)
{
	// Return the time t > 0 when the object at x0 with initial velocity v0 and
	// constant acceleration a reaches xd *while moving backward* (v(t) < 0).
	// If no such arrival exists, return null.

	// All units must be consistent. Positive velocity means "forward".
	 
	local EPS = 1e-12;
	// handle the zero-acceleration (a == 0) case
	if (fabs(a) < EPS)
	{
		if (fabs(v0) < EPS)
			return null

		local t = (xd - x0) / v0;
		if (t > 0.0 && v0 < 0.0)
			return t; // moving backward already

		// Cannot reach xd while moving backward
		return null
	}

	// Solve quadratic: (1/2)a t² + v0 t + (x0 - xd) = 0
	local disc = v0 * v0 - 2.0 * a * (x0 - xd);
	if (disc < 0.0)
		return null				// no real roots

	local sqrt_d = sqrt(MAX(0.0, disc));

	// Two possible roots
	local t1 = (-v0 + sqrt_d) / a;
	local t2 = (-v0 - sqrt_d) / a;
	
	if ( return_result )
		return [t1, t2]

	local bestT = -1.0;
	foreach ( t in [t1, t2] )
	{
		if (t > 0.0)
		{
			local v_t = v0 + a * t;
			if (v_t < 0.0) 		// moving backward at this time
			{
				if (t > bestT)
					bestT = t;	// keep the later (second) arrival
			}
		}
	}

	if (bestT < 0.0)
		return null

	return bestT;
}

::CalcZAtTargetTime <- function(x0, t, v0, a)
{
	// (1/2)a t² + v0 t + x0 = xd
	return a * t * t / 2 + v0 * t + x0
}

::DiffQAngle <- function( Angle1, Angle2 )
{
	local result
	if ( typeof Angle1 == "QAngle" )
		result = Angle1.y - Angle2.y;
	else
		result = Angle1 - Angle2
	 
	if ( result > 180)
		result -= 360
	else if ( result <= -180)
		result += 360
		
	return result
}
::CleanQAngle <- function( qangle )
{
	local consider = qangle.y
	
	if ( consider > 180)
		consider -= 360
	else if ( consider <= -180)
		consider += 360
	
	qangle.y = consider
}

::ProjectPointOntoVector <- function(Point, Origin, Direction) {
    local denom = Direction.Dot(Direction);
    if (denom == 0.0)
		return Origin; // degenerate direction

    local t = (Point - Origin).Dot(Direction) / denom;
    return Origin + Direction * t;
}

::side_of <- function(v1, v2)
{
	local cross = v1.x * v2.y - v1.y * v2.x
	
	return cross
	//rcon script printl(prodemoknight.ListOfProDemoknight[0].side_of( me().EyeAngles().Forward() , prodemoknight.ListOfProDemoknight[0].hOwner.GetOrigin() - me().GetOrigin() ))
}

::ReverseDotProduct <- function( A, d ) {
    local a2 = A.x * A.x + A.y * A.y;
    local a = sqrt(a2);
    if (a == 0.0)
		return null; // invalid, A is zero vector
    if (fabs(d) > a)
		return null; // impossible, |d| > |A|

    local sqrtTerm = sqrt(MAX(0.0, a2 - d * d));

    // Perpendicular vector to A
    local p = Vector2D(-A.y, A.x);

    local invA2 = 1.0 / a2;
    local scaleA = d * invA2;
    local scaleP = sqrtTerm * invA2;

    // Two possible directions
    local B1 = Vector(
        scaleA * A.x + scaleP * p.x,
        scaleA * A.y + scaleP * p.y, 0
    )

    local B2 = Vector(
        scaleA * A.x - scaleP * p.x,
        scaleA * A.y - scaleP * p.y, 0
    )

    return {B1 = B1, B2 = B2};
}

::ReverseDotProduct_simple <- function( a, d ) {
    if ( a == 0.0 || fabs(d) > a )
        return null;		// invalid case

    local Bx = d / a;
    local ByTerm = sqrt(MAX(0.0, 1.0 - Bx * Bx));

    local B1 = Vector(Bx,  ByTerm, 0);
	//local B2 = Vector(Bx, -ByTerm, 0);
	
    return VectorAngles(B1).y;
}

::WhenYouNeedTheSameVectorDiffAngle <- function( vel, mag )
{
	local vel_length = vel.Length()
	
	if ( mag == 0 )
		return null
	
	if ( mag > 2 * vel_length )
		return null
	
	// Unit vector in direction of r
    local r_hat_x = vel.x / vel_length
    local r_hat_y = vel.y / vel_length
	
	// Perpendicular unit vector (rotate 90°)
    local u_x = r_hat_y
    local u_y = -r_hat_x
	
	// Compute angle components
    local cos_theta = -mag / (2 * vel_length)
    local sin_theta = sqrt(1 - cos_theta*cos_theta)
	
	// First solution
    local v1 = Vector(
        mag * (cos_theta * r_hat_x + sin_theta * u_x),
        mag * (cos_theta * r_hat_y + sin_theta * u_y),
		0
    )

    // Second solution
    local v2 = Vector(
        mag * (cos_theta * r_hat_x - sin_theta * u_x),
        mag * (cos_theta * r_hat_y - sin_theta * u_y),
		0
    )
	
	return {B1 = v1, B2 = v2};
}

::circle_segment_intersections <- function(Ao, Bo, Co, r)
{
	local A = Ao + Vector(0,0,-Ao.z)
	local B = Bo + Vector(0,0,-Bo.z)
	local C = Co + Vector(0,0,-Co.z)
	
	local d = B - A
	local f = A - C

	local a = d.Dot(d)
	local b = 2 * f.Dot(d)
	local c = f.Dot(f) - r*r

	local disc = b*b - 4*a*c
	if (disc < 0)
		return []

	disc = sqrt(disc)

	local t1 = (-b - disc) / (2*a)
	local t2 = (-b + disc) / (2*a)

	local points = []
	foreach (t in [t1, t2])
		if (0 <= t && t <= 1)
			points.append(A + d*t)

	return points
}

::evalPoly <- function(coeffs, x)
{
	local result = 0.0;
	local xpow  = 1.0;
	for (local i = 0; i < coeffs.len(); i++)
	{
		result += coeffs[i] * xpow;
		xpow   *= x;
	}
	return result;
}

::getSteamID <- function(hPlayer)
{
	return NetProps.GetPropString(hPlayer, "m_szNetworkIDString")
}

::getSteamName <- function(hPlayer)
{
	return NetProps.GetPropString(hPlayer, "m_szNetname")
}

::findPlayerByName <- function(name, bFindBot = false)
{
	if ( bFindBot )
	{
		foreach ( hPlayer in findAllBots() )
			if (getSteamName(hPlayer).tolower().find(rstrip(name.tolower())) != null)
				return hPlayer
	}
	else
	{
		foreach (hPlayer in findAllPlayer(true))
		{
			if (getSteamName(hPlayer).tolower().find(rstrip(name.tolower())) != null)
				return hPlayer
		
		}
	}
	return null
	
}
::findPlayerBySteamID <- function(steamID)
{
	foreach (hPlayer in findAllPlayer(true))
	{
		if (getSteamID(hPlayer) == steamID)
			return hPlayer
	}
	return null
	
}

::PlayerManager <- Entities.FindByClassname(null, "tf_player_manager")
::GetPlayerUserID <- function(player)
{
	return NetProps.GetPropIntArray(PlayerManager, "m_iUserID", player.entindex())
}

::me <- function()
{
	return findPlayerBySteamID("[U:1:837970416]")
}

::showAllConds <- function( who = me() )
{
	for (local i = 0; i < 150; i++)
	{
		if ( who.InCond(i) )
			printl(i)
	}
}


::clamp <- function(num, min, max)
{
	if (num < min)
		return min
	else if (num > max)
		return max
	return num
}
::MIN <- function( x, y )
{
	return x > y ? y : x
}
::MAX <- function( x, y )
{
	return x > y ? x : y
}

::extent_origin_max <- class {
	origin	= Vector()
	maxs	= Vector()

	constructor(origin, maxs)
	{
		this.origin = origin
		this.maxs 	= maxs
	}
	
}

::lib <- {
	
}
local ROOT = getroottable()
//IncludeScript("robotvoicelines", ROOT)

const EFL_USER 					= 1048576
//fun.hExplosion.GetScriptScope().printall <- function()
//{
//	if("lib" in ROOT)
//		lib.printall()
//	return -1
//}
//AddThinkToEnt(fun.hExplosion, "printall")
//script_execute lib
//script lib.CreateTimer(fun.nuke)

IncludeScript("nopey_lib/trace_filter_nopey_fork")

if ( ::nopey_lib == 0 )
	IncludeScript("nopey_lib/nopey_lib", ROOT)