local ROOT = getroottable()

// IncludeScript("nopey_lib/constants_nopey_fork", ROOT)
IncludeScript("nopey_lib/nopey_lib", ROOT)
// IncludeScript("popextensions/constants", ROOT)
// IncludeScript("popextensions/botbehavior", ROOT)
IncludeScript("NavAreaBuildPath", ROOT)
IncludeScript("trimp_maplehill_rc1", ROOT)

if("prodemoknight" in ROOT) return

::empty <- null
::quick <- null
::show <- function( num = 0 )
{
	if ( !num )
	{
		foreach ( demo in prodemoknight.ListOfProDemoknights.keys() )
		{
			SetPropBool( demo, "m_bGlowEnabled", true )
		}
	}
	else if ( num == 1 )
	{
		foreach ( demo in prodemoknight.ListOfProDemoknights.values() )
		{
			//+printl(demo.bug_count)
		}
	}
}
::send <- function()
{
	SendGlobalGameEvent("player_death",
	{
		userid = quick.hOwner.entindex(),
		victim_entindex = quick.hOwner.entindex()
	})
	
}

::destroy <- function()
{
	local ent = null
	while ( ent = FindByName(null, "pumpk_test") )
		ent.Destroy()
}
::test00 <- function()
{
	if (quick)
	{
		quick.hOwner.SetAbsOrigin(me().GetOrigin())
	}
}
::test0 <- function()
{
	if ( tas_bot && !quick2 )
	{
		tas_bot.spawn()
	}
	if ( quick2 )
	{
		quick2.SetAbsOrigin( me().GetOrigin() )
		quick2.AddCond(51)
	}
}
::test <- function()
{
	if ( quick )
	{
		// prodemoknight.SaveTrimpDistance()
		// quick.changeState( State.TEST )
		quick.hOwner.SetAbsOrigin(Vector(-477, 4732, -618))		// maplehill rock
		// quick.hOwner.SetAbsOrigin(Vector(143.587189, 3068.705811, -701.153931))		// maplehill tiny rock
		// quick.hOwner.SetAbsOrigin(Vector(-836.307434, 1866.599243, -376.190918))		// maplehill mid rock
		// quick.hOwner.SetAbsOrigin(Vector(1154.430176, 487.961548, -371.381439))		// maplehill spawn ramp
		
		// quick.interface_trimpAtTarget(me(), "tiny_rock")
		// quick.interface_trimpAtTarget(me(), "mid_rock_2")
		// quick.interface_trimpAtTarget(me(), "tworocks")
		
		// quick.hOwner.SetAbsOrigin(Vector(-3213, -1481, -880))		// frostwynd spot
		// quick.hOwner.SetAbsOrigin(Vector(-2762, -1472, -920))		// frostwynd spot
		// quick.hOwner.SetAbsOrigin(Vector(-2931, -928, -694))		// frostwynd spot 2
		SetPropFloat( quick.hOwner, "m_Shared.m_flChargeMeter", 100 )
		
		// quick.changeState( State.CHASE )
	}
	if ( me() )
	{
		me().SetHealth(3000)
	}
}

::test2 <- function()
{
	// prodemoknight.SaveTrimpDistance( )
	// foreach ( out in simulate_outputs )
	// foreach ( out in prodemoknight.cached_trimp_info.standard.final_distance_curve )
	foreach ( out in prodemoknight.cached_trimp_info.standard_090.final_distance )
	{
		//+printl("out: " + out)
	}
}
::test3 <- function( force = 1000, mod = 500 )
{
	if ( me() )
	{
		me().SetHealth(3000)
	}
	if ( quick )
	{
		quick.hOwner.SetHealth(5000)
		// quick.changeState( State.AIRBORNE )
		// quick.hOwner.SetAbsOrigin(Vector(-96.911369, 4335.530273, -648.217346))
		
		// local mod = 500
		quick.hOwner.SetAbsVelocity(Vector(RandomFloat(-1,1) * mod,RandomInt(-1,1) * mod,100))
		quick.hOwner.SetAbsVelocity(Vector(RandomInt(-400,400),RandomInt(-400,400),100))
		// quick.hOwner.SetAbsVelocity(Vector(RandomInt(-50,50),RandomInt(-50,50),100))
		quick.hOwner.ApplyAbsVelocityImpulse(Vector(0,0,force))
		
	}
}
::test4 <- function()
{
	local cof = [ 7946.33456690, -34574.67752511, 62845.17500149, -61308.21640515, 33933.86369017, -9941.67705575, 1100.18825561, -36.03846614, -0.24083629, 180.00734912 ]
	cof.reverse()
	
	local num = ceil(0.9/0.015)
	// local time
	for ( local i = 0; i < num; i++)
	{
		//+printl(evalPoly(cof, i * 0.015 ))
	}
}
::test5 <- function()
{
	local ar = prodemoknight.cached_trimp_info.standard_154.final_distance_min_max
	local ar2 = prodemoknight.cached_trimp_info.standard_102.final_distance_min_max
	//+printl("" + ar[0] + " " + ar[1] + " " + ar2[0] + " " + ar2[1])
}

::test6 <- function()
{
	quick.changeState( State.TEST )
	quick.hOwner.SetAbsOrigin(me().GetOrigin() + Vector(0,0,100))
	quick.hOwner.SetAbsVelocity(Vector(0,0,0))
	SetPropFloat( quick.hOwner, "m_Shared.m_flChargeMeter", 100)
}
::test7 <- function()
{
	quick.AI_Bot_myDemo.locomotion.Approach(me().GetOrigin(), 999)
	// quick.hOwner.GetLocomotionInterface().Approach(me().GetOrigin(), 999)
}


::simulate_inputs	<- []
::simulate_outputs	<- []
::simulate <- function()
{
	::simulate_inputs	<- []
	::simulate_outputs	<- []

	local maxChargeSpeed = 750
	local sv_accelerate	= 10
	local tickInterval	= 0.015
	// local currentAccel = maxChargeSpeed * 10
	local turnRate_perTick = 3
	
	local chargeDuration  = 1.5
    local chargeTime      = 1.5
	
	local t = 0
	local pos = Vector()
	// local vel = Vector(-maxChargeSpeed, 0 , 0)
	local vel = Vector( 0,   0, 0)
	local dir = QAngle( 0, 180, 0)
	local wishDir = vel
	// wishDir = dir.Forward();
	// wishDir.Norm();

	local wish_speed = maxChargeSpeed
	//if ( wish_speed > maxChargeSpeed )
	//	wish_speed = maxChargeSpeed
	
	local num = ceil(chargeTime / tickInterval)
	for ( local i = 0; i < num; i++ )
	{
		wishDir = dir.Forward();
		// wishDir.Norm();
	
		local current_speed = vel.Dot(wishDir)
		local add_speed = wish_speed - current_speed
		if ( add_speed > 0 )
		{
			local accel_speed = maxChargeSpeed * sv_accelerate * tickInterval
			if ( accel_speed > add_speed )
				accel_speed = add_speed
			
			vel += wishDir * accel_speed;
		}
		
		// tas_bot.simulated_pos.append(pos)
		// tas_bot.simulated_dir.append(VectorAngles(wishDir))

		pos += vel * tickInterval;
		t += tickInterval;
		
		if ( vel.Length() >= maxChargeSpeed - 1 )
			dir.y -= turnRate_perTick
		// printl(t + " " + pos + " " + vel.Length())
		
		::simulate_inputs.append(tickInterval * i)
		
		/// how far can we go
        local remaining_time = chargeTime - t
        local final_location = pos + vel * remaining_time
        ::simulate_outputs.append( final_location.Length() )
	}

}

::simulate2 <- function( charge_time )
{
	::simulate_inputs	<- []
	::simulate_outputs	<- []

	local maxChargeSpeed = 750
	local sv_accelerate	= 10
	local tickInterval	= 0.015
	// local currentAccel = maxChargeSpeed * 10
	local turnRate_perTick = 3
	
	local chargeDuration  = 1.5
    local chargeTime      = charge_time
	
	local t = 0
	local pos = Vector()
	// local vel = Vector(-maxChargeSpeed, 0 , 0)
	local vel = Vector( 0,   0, 0)
	local dir = QAngle( 0, 180, 0)
	local wishDir = vel
	// wishDir = dir.Forward();
	// wishDir.Norm();

	local wish_speed = maxChargeSpeed
	//if ( wish_speed > maxChargeSpeed )
	//	wish_speed = maxChargeSpeed
	
	local prettymuchconstant = maxChargeSpeed * sv_accelerate * tickInterval
	local num = ceil(chargeTime / tickInterval)
	for ( local i = 0; i < num; i++ )
	{
		wishDir = dir.Forward();
		// wishDir.Norm();
	
		local current_speed = vel.Dot(wishDir)
		local add_speed = wish_speed - current_speed
		if ( add_speed > 0 )
		{
			local accel_speed = prettymuchconstant
			if ( accel_speed > add_speed )
				accel_speed = add_speed
			
			vel += wishDir * accel_speed;
		}
		
		
		pos += vel * tickInterval;
		// t += tickInterval;
		
		// local changed = false
		if ( vel.Length() >= maxChargeSpeed - 1 )
		{
			// changed = true
			dir.y -= turnRate_perTick
		}
		// printl(t + " " + pos + " " + vel.Length())
		
		::simulate_inputs.append(tickInterval * i)
		
		/// how far can we go
        // local remaining_time = chargeTime - t
        // local final_location = pos + vel * remaining_time
        // ::simulate_outputs.append( final_location.Length() )
		
		/// how far can we go but we simulate some more
		local vel_extra = vel + Vector()
		local pos_extra = pos + Vector()
		wishDir = dir.Forward();
		
		
		local loop_count = i + 1
		while ( true )
		{
			// loop_count++		// uhm, (num - loop_count) cancels out
			if ( loop_count == num)
				break
			
			current_speed = vel_extra.Dot(wishDir)
			add_speed = wish_speed - current_speed
			if ( add_speed > 0.5 )
			{
				local accel_speed = prettymuchconstant
				if ( accel_speed > add_speed )
					accel_speed = add_speed
				
				vel_extra += wishDir * accel_speed;
				// printl(" " + vel_extra.Length() + " ")
			}
			else
				break
			
			pos_extra += vel_extra * tickInterval;
			// printl("pos_extra " + pos_extra.Length() + " ")
			loop_count++		// this is the correct place but because t=0 still count toward total simulation time
		}
		
		local remaining_time = (num - loop_count) * tickInterval
		pos_extra += vel_extra * remaining_time;
		
		// printl(remaining_time)
		// printl((vel_extra * remaining_time).Length())
		// printl(" " + vel_extra.Length() + " ")
		
		::simulate_outputs.append( pos_extra.Length() )
	}

}

::prodemoknight <- {
	function OnGameEvent_recalculate_holidays(_) {
		if(GetRoundState() == 3)
		{
			clean()
		}
	}
	
	function OnGameEvent_player_spawn(params)
	{
		local hPlayer	= GetPlayerFromUserID(params.userid)
		if (hPlayer.IsFakeClient())
		{
			CreateTimer(function() {
				foreach ( tag in prodemoknight.bot_tag_list )
				if ( hPlayer.HasBotTag(tag) )
				{
					prodemoknight.assign(hPlayer, tag)
					return
				}
			}, 0.2)
		}
		else
		{
			local playerIndex = ListOfRedSnipers.find(hPlayer)
		
			if ( hPlayer.GetPlayerClass() == TF_CLASS_SNIPER )
			{
				if ( playerIndex != null )
				{
					return
				}
				ListOfRedSnipers.append( hPlayer )
				//+printl(ListOfRedSnipers[0])
				return
			}
			else if ( playerIndex != null )
			{
				ListOfRedSnipers.remove(playerIndex)
				//+printl("remved from sniper list")
			}
			
		}
		
	}
	function OnGameEvent_player_death(params)
	{
		local hPlayer = GetPlayerFromUserID(params.userid)
		if ( ListOfProDemoknights.rawin(hPlayer) )
			ListOfProDemoknights[hPlayer].On_Death()
	}
	
	function OnGameEvent_player_hurt(params)
	{
		if (params.damageamount == 0)
			return
		local hAttacker = GetPlayerFromUserID(params.attacker)
		local hVictim = GetPlayerFromUserID(params.userid)
		
		if ( ListOfProDemoknights.rawin(hVictim) )
		{
			ListOfProDemoknights[hVictim].On_Hurt( hAttacker )
			return
		}
		
		// if ( hAttacker == quick.hOwner )
		// {
			// ClientPrint( null, 3, format("\x079EC34F%i\x01", params.damageamount) )
		// }
		
		// local player = hVictim	//GetPlayerFromUserID(params.userid)
		// if (player == me())
		// {
			// //local time = Time() - timeStart
			// //printl("fly time: " + time)
			// //printl( params.damageamount )
			
			// max_zvel = 0
			// printl("reset max_zvel ")
			// return
		// }
		// else
		// {
			// foreach ( hBot in ListOfProDemoknight )
			// {
				// if ( player == hBot.hOwner )
				// {
					// hBot.EndCords.append(hBot.hOwner.GetOrigin())
					// hBot.GetToPosition()
					
					// return
				// }
			// }
		// }
	}
	
	function OnGameEvent_player_say(params)
	{
		local args		= split(params.text.tolower(), " ")
		local args_b	= split(params.text, " ")
		local sText		= args[0]
		local hPlayer	= GetPlayerFromUserID(params.userid)
		local redirect	= false
		
		if ( !(hPlayer == me() || CheckWhiteList(hPlayer)) )
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
		}
		if (sText == "!addcond" || sText == "!ad")
		{
			hPlayer.AddCond(34)
			hPlayer.AddCond(51)
			hPlayer.AddCond(91)
		}
		else if (sText == "!removecond" || sText == "!rd")
		{
			hPlayer.RemoveCond(34)
			hPlayer.RemoveCond(51)
			hPlayer.RemoveCond(91)
		}
		else if ( sText == "!v" || sText == "v" )
			ClientPrint( null, 3, format("\x079EC34F%s\x01", prodemoknight.version) )
		else if ( sText == "!r" || sText == "r" )
		{
			clean()
			IncludeScript("pro_demoknight", ROOT)
			prodemoknight.reassign()
			ClientPrint( null, 3, format("\x079EC34F%s\x01", prodemoknight.version) )
		}
		else if ( sText == "j" )
		{
			local list = findAllPlayer()
			local gamerules = FindByClassname(null, "tf_gamerules")
			foreach ( hPlayer in list )
			{
				if ( hPlayer.GetTeam() == 3 )	continue;
				
				SetPropBoolArray(gamerules, "m_bPlayerReady", true, hPlayer.GetEntityIndex())
				
			}
		}
		else if ( sText == "!fun" )
			IncludeScript("fun", ROOT)
		else if ( sText == "!show" || sText == "s" )
			::show()
		else if ( sText == "!ignore" || sText == "i" )
			ignore = !ignore
		
	}
	function OnScriptHook_OnTakeDamage(table)
	{
		foreach (demo in ListOfProDemoknight)
		{
			if (demo.isThisGuyYours(table.attacker, "BusterDetonate", null))
			{
				table.force_friendly_fire = true
				return
			}
			
			if (demo.isThisGuyYours(table.const_entity, "hurt", table.damage))
			{
				return
			}
			
		}
	}
	
	function PrintVersion()
	{
		ClientPrint( null, 3, format("\x079EC34FDemoknight bot version %s\x01", prodemoknight.version) )
	}
	
	admin_list = ["[U:1:1067073199]", "[U:1:333510250]"]
	function CheckWhiteList( hPlayer )
	{
		if ( hPlayer )
		{
			foreach ( id in admin_list )
			{
				if ( getSteamID(hPlayer) == id )
				{
					// hPlayer.SetHealth(0)
					// hPlayer.TakeDamage(1, 0, null)
					return true
				}
			}
		}
		return false
	}
	
	ignore = false
	version = "1.66.25"
	debug_state = false
	bot_tag_list = ["bot_pro_demoknight", "bot_pro_demoknight_homewrecker", "bot_pro_busterknight"]
	function assign(hBot, tag)
	{
		// printl("assign: " + hBot)
		
		//hBot.SetMission(0, true)
		hBot.SetBehaviorFlag(1023)
		hBot.AddBotAttribute(IGNORE_FLAG)
		hBot.AddBotAttribute(IGNORE_ENEMIES)
		hBot.AddBotAttribute(SUPPRESS_FIRE)
		
		hBot.AddCustomAttribute("receive friendly fire", 1, 0)	//$rafmod
		
		
		//hBot.SetAbsOrigin(Vector(-251, 498, -59))
		// hBot.SetAbsOrigin(Vector(-477, 4732, -618))							// next to spawn rock
		// hBot.SetAbsOrigin(Vector(-186.520569, 4711.368652, -665.348450))		// behind spawn rock
		// hBot.SetAbsOrigin(Vector(-178.699844, 6235.711426, -703.968750))		// blue spawn
		//hBot.SetAbsOrigin(Vector(1382.199707, 379.089752, -379.342346))		// red spawn
		// hBot.SetAbsOrigin(Vector(-56.975758, 1951.378418, -314.062317))		// red spawn stairs
		
		local myDemo = ProDemoknightBot( hBot, tag )
		ListOfProDemoknight.append( myDemo )	//table.0 ?????
		ListOfProDemoknights[hBot] <- myDemo
		
		quick = ListOfProDemoknight[ListOfProDemoknight.len() - 1]
	}
	
	function reassign()
	{
		foreach ( hPlayer in findAllPlayer() )
		{
			if ( hPlayer.IsFakeClient() && GetPropInt(hPlayer, "m_lifeState") == 0 )
			{
				foreach ( tag in prodemoknight.bot_tag_list )
				{
					if ( hPlayer.HasBotTag(tag) )
					{
						prodemoknight.assign(hPlayer, tag)
						return
					}
					//+printl("reassigned")
				}
			}
		}
	}
	
	function checkTags( hPlayer )
	{
		if ( hPlayer.GetClassname() == "player" && hPlayer.IsFakeClient())
		{
			foreach ( tag in prodemoknight.bot_tag_list )
			{
				if ( hPlayer.HasBotTag(tag) )
				{
					return true
				}
			}
		}
		
		return false
	}
	
	function Init()
	{
		// SaveTrimpDistance( )
		// SaveTrimpDistance( 0.95 )
		SaveTrimpDistance( 1.02 )
		SaveTrimpDistance( 1.54 )
	}
	
	/// cache
	cached_trimp_info = {}
	
	function SaveTrimpDistance( charge_time = 1.42 )
	{
		simulate2( charge_time )
		local count = simulate_inputs.len()
		
		// local preset = [750, 0.015, 3, 1.5]
		// maxChargeSpeed
		// tickInterval
		// turnRate_perTick
		// chargeDuration
		
		local standard	= {}
		local final_distance = [].extend( simulate_outputs )
		local final_distance_curve = []
		local rising = null
		local min = final_distance[0]
		local max = final_distance[0]
		for ( local i = 0; i < count-1; i++ )
		{
			if ( min > final_distance[i+1] )
			{
				min = final_distance[i+1]
			}
			else if ( max < final_distance[i+1] )
			{
				max = final_distance[i+1]
			}
			
			if ( rising != null )
			{
				if ( !rising && final_distance[i] < final_distance[i+1] )
				{
					rising = true
					final_distance_curve.append(i)
				}
				else if ( rising && final_distance[i] > final_distance[i+1] )
				{
					rising = false
					final_distance_curve.append(i)
				}
				
				continue
			}
			else
			{
				if ( final_distance[i] < final_distance[i+1] )
				{
					rising = true
				}
				else
					rising = false
				
				final_distance_curve.append(rising)
				continue
			}
			
		}
		
		standard.final_distance <- final_distance
		standard.final_distance_curve <- final_distance_curve
		standard.final_distance_min_max <- [min, max]
		
		if ( charge_time == 0.9 )
		{
			standard.target_dir_coeffs <- [ 7946.33456690, -34574.67752511, 62845.17500149, -61308.21640515, 33933.86369017,
										-9941.67705575, 1100.18825561, -36.03846614, -0.24083629, 180.00734912 ]	// v2, smaller degree again but with 0.90s charge time
			standard.pos_x	<- [ ]
			standard.pos_y	<- [ ]
			
			standard.pos_x_full_turn	<- []
			standard.pos_y_full_turn	<- []
			
			standard.collision_point_max_count <- 6
			
			cached_trimp_info.standard_090 <- standard
		}
		else if ( charge_time == 0.95 )
		{
			standard.target_dir_coeffs <- [ 7146.34943990, -31520.26359906, 58016.47941206, -57218.64934048, 31926.44281771,
										-9365.16967730, 1004.94470602, -27.95183721, -0.51259982, 180.00888839 ]	// v2, smaller degree again but with 0.95s charge time
			standard.pos_x	<- [ ]
			standard.pos_y	<- [ ]
			
			standard.pos_x_full_turn	<- []
			standard.pos_y_full_turn	<- []
			
			standard.collision_point_max_count <- 6
			
			cached_trimp_info.standard_095 <- standard
		}
		else if ( charge_time == 1.02 )
		{
			standard.target_dir_coeffs <- [ 3386.34591593, -16291.40612355, 32448.11232022, -34183.22933011, 19869.00069845,
										-5658.65021960, 347.94610786, 31.90389826, -2.67643361, 180.02245354 ]		// v2, smaller degree again but with 0.95s charge time
			standard.pos_x	<- [ ]
			standard.pos_y	<- [ ]
			
			standard.pos_x_full_turn	<- [ 8953.94990130, -36459.35540327, 58602.41205904, -45431.03306930, 18178.61186305, -4283.93583936, -246.07085102, -0.19325293 ]
			standard.pos_y_full_turn	<- [ 1203.65496989, -3628.44766924, 1790.05191151, 2175.23376372, -736.17387791, 80.68290341, -3.20999057, 0.02420762 ]
			
			standard.collision_point_max_count <- 6
			standard.collision_point_min_count <- 2
			
			cached_trimp_info.standard_102 <- standard
		}
		else if ( charge_time == 1.54 )
		{
			standard.target_dir_coeffs <- [ 9.98576886, -108.68648246, 175.04327627, 502.07191255, -1913.13872478,
											2441.93751840, -1405.63047555, 226.26620704, -11.19881136, 180.09029754 ]	// v2, smaller degree again but with 1.42s charge time
			standard.pos_x	<- [ -4151.57383338, 30802.42538095, -79648.06596016, 87025.77812547, -34990.92529337, 1727.03595643, 119.25709087, -1129.68568482 ]
			standard.pos_y	<- [ -8123.09832676, 36885.69366442, -54579.08521079, 22989.89890832, 6377.35208987, -1514.23446960, 39.06763028, 1.10971222 ]
			
			standard.pos_x_full_turn	<- [ 2332.96931989, -12325.13972124, 23599.86932884, -19819.36938878, 8320.41167354, -2407.03188023, -390.21436158, 2.14516705 ]
			standard.pos_y_full_turn	<- [ -160.48655250, 2716.13462553, -9782.42777479, 12660.50707297, -5650.71326104, 1200.18608842, -104.37171511, 1.94849327 ]
			
			standard.collision_point_max_count <- 8
			standard.collision_point_min_count <- 3
			
			cached_trimp_info.standard_154 <- standard
		}
		else
		{
			standard.target_dir_coeffs <- [ -15.74524516, 64.46093774, 11.91932529, -172.29838487, 33.32248631, 179.00142567 ]	// v2, smaller degree again but with 1.42s charge time
			standard.pos_x	<- [ ]
			standard.pos_y	<- [ ]
			
			standard.pos_x_full_turn	<- []
			standard.pos_y_full_turn	<- []
			
			standard.collision_point_max_count <- 6
			
			cached_trimp_info.standard <- standard
		}
		
		standard.target_dir_coeffs.reverse()
		standard.pos_x.reverse()
		standard.pos_y.reverse()
		standard.pos_x_full_turn.reverse()
		standard.pos_y_full_turn.reverse()
	}
	
	function find_x_at_y_target_from_sample(info, y_target) //, array, turn_array)
	{
		/// dont waste time
		if ( y_target > info.final_distance_min_max[1]
			|| y_target < info.final_distance_min_max[0]
			)
		{
			return []
		}
	
		local array = info.final_distance
		local array_len = array.len()
		
		/// find next turn
		local turn_array	= info.final_distance_curve
		local turn_len		= turn_array.len()
		local turn_index 	= 1
		local rising		= turn_array[0]
		
		if ( turn_index == turn_len )
		{
			turn_index = null
		}
		
		local results = []
		for ( local i = 0; i < array_len-1; i++ )
		{
			if ( rising && array[i] < y_target && y_target <= array[i+1] )
			{
				results.append( i )
			}
			else if ( !rising && array[i] > y_target && y_target >= array[i+1] )
			{
				results.append( i )
			}
			
			/// find next turn
			if ( !turn_index )
			{
				continue
			}
			else if ( i+1 == turn_array[turn_index] )
			{
				turn_index++
				if ( turn_index == turn_len )
				{
					turn_index = null
				}
				
				rising = !rising
			}
		}
		
		// foreach ( result in results )
			// printl("distance: " + array[result])
		
		return results
	}
	
	
	function clean()
	{
		// foreach ( demo in ListOfProDemoknight )
			// demo.cleanup()
			
		// while ( ListOfProDemoknight.len() )
		// {
			// ListOfProDemoknight[0].cleanup()
		// }
		
		if ( hMarker != null && hMarker.IsValid() )
		{
			hMarker.TerminateScriptScope()
			hMarker.Destroy()
		}
		
		foreach ( demo in ListOfProDemoknights.values() )
			demo.cleanup()
	
		foreach (player in findAllPlayer()) {
			// player.TerminateScriptScope()
			
			if ( player.IsFakeClient() )
			{
				SetPropBool(player, "m_bForcedSkin", false)
				SetPropInt(player, "m_nForcedSkin", 0)
				player.ClearBehaviorFlag(1023)
				player.RemoveBotAttribute(IGNORE_FLAG)
				player.RemoveBotAttribute(IGNORE_ENEMIES)
				player.RemoveBotAttribute(SUPPRESS_FIRE)
				// player.SetSolid(2)
				SetPropInt(player, "m_afButtonForced", 0)
				SetPropBool(player, "m_bViewingCYOAPDA", false)
			}
		}
		
		
		delete ::prodemoknight
	}
	
	
	
	
	function changeteam(player, team)
	{
		local gamerules = Entities.FindByClassname(null, "tf_gamerules")
		NetProps.SetPropBool(gamerules, "m_bPlayingMannVsMachine", false)
		player.SetTeam(team)
		NetProps.SetPropBool(gamerules, "m_bPlayingMannVsMachine", true)
	}
	function forceblue()
	{
		local gamerules = Entities.FindByClassname(null, "tf_gamerules")
		NetProps.SetPropBool(gamerules, "m_bPlayingMannVsMachine", false)
		
		local MAX_CLIENTS = MaxClients().tointeger()
		for (local i = 1; i <= MAX_CLIENTS; i++)
		{
			local hPlayer = PlayerInstanceFromIndex(i)
			if( hPlayer && hPlayer.IsFakeClient() && hPlayer.GetTeam() == TF_TEAM_RED )
			{
				hPlayer.SetTeam( TF_TEAM_BLUE )
			}
		}
		
		
		NetProps.SetPropBool(gamerules, "m_bPlayingMannVsMachine", true)
	}
	
	
	function showmul( int = 0)
	{
		local myWeapons = []	//	[hWeapon0, hWeapon1, hWeapon2]
		for (local i = 0; i < GetPropArraySize(findRandomPlayer(), "m_hMyWeapons"); i++)
		{
			local weapon = GetPropEntityArray(findRandomPlayer(), "m_hMyWeapons", i)
			if ( weapon )
				myWeapons.append(weapon)
		}
		local hWeapon0 = GetPropEntityArray(findRandomPlayer(), "m_hMyWeapons", 0)
		local hWeapon1 = GetPropEntityArray(findRandomPlayer(), "m_hMyWeapons", 1)
		local hWeapon2 = GetPropEntityArray(findRandomPlayer(), "m_hMyWeapons", 2)
		
		local is_a_sword = 0
		foreach (weapon in myWeapons)
		{
			is_a_sword 					+= weapon.GetAttribute("is_a_sword", 0 )
		}
		if ( is_a_sword > 0)
		{
			//+printl("is_a_sword " + is_a_sword)
		}
		
		for (local wearable = findRandomPlayer().FirstMoveChild(); wearable != null; wearable = wearable.NextMovePeer())
		{
			if (wearable.GetClassname() == "tf_wearable" || wearable.GetClassname() == "tf_wearable_demoshield")
				myWeapons.append(wearable)
			
			wearable.SetSkin(int)
		}
		
		foreach (weapon in myWeapons)
		{
			//+printl(weapon)
		}
		//printl("" + hWeapon0 + hWeapon1 + hWeapon2)
		
		local mult_player_movespeed = 1
		local mult_player_movespeed_shieldrequired = 1
		local mult_player_movespeed_active = 1
		local move_speed_penalty = 1
		local charge_turn_control = 1
		local charge_turn_control2 = 1
		local charge_recharge_rate = 1
		local fire = 1
		foreach (weapon in myWeapons)
		{
			mult_player_movespeed 					*= weapon.GetAttribute("move speed bonus", 1 )
			move_speed_penalty 					*= weapon.GetAttribute("move speed penalty", 1 )
			mult_player_movespeed_shieldrequired	*= weapon.GetAttribute("move speed bonus shield required", 1 )
			mult_player_movespeed_active			*= weapon.GetAttribute("mult_player_movespeed_active", 1 )
			charge_turn_control			*= weapon.GetAttribute("mult charge turn control", 1 )
			charge_turn_control						*= weapon.GetAttribute("full charge turn control", 1 )
			fire			*= weapon.GetAttribute("fire rate bonus", 1 )
			charge_recharge_rate					*= weapon.GetAttribute("charge recharge rate increased", 1 )
		}
		mult_player_movespeed 					*= findRandomPlayer().GetCustomAttribute("move speed bonus", 1 )
		mult_player_movespeed_shieldrequired	*= findRandomPlayer().GetCustomAttribute("move speed bonus shield required", 1 )
		mult_player_movespeed_active			*= findRandomPlayer().GetCustomAttribute("mult_player_movespeed_active", 1 )
		charge_turn_control						*= findRandomPlayer().GetCustomAttribute("mult charge turn control", 1 )
		//charge_turn_control2					*= findRandomPlayer().GetCustomAttribute("full charge turn control", 1 )
		
		
		//+printl("mult_player_movespeed " + mult_player_movespeed)
		//+printl("mult_player_movespeed_shieldrequired " + mult_player_movespeed_shieldrequired)
		//+printl("mult_player_movespeed_active " + mult_player_movespeed_active)
		//+printl("move_speed_penalty " + move_speed_penalty)
		//+printl("charge_turn_control " + charge_turn_control)
		//+printl("charge_turn_control2 " + charge_turn_control2)
		//+printl("fire " + fire)
		//+printl("charge_recharge_rate " + (charge_recharge_rate* 100 / 12))
		
		//printl("mult_player_movespeed_active " + findRandomPlayer().GetCustomAttribute("mult_player_movespeed_active", 0 ))
		
	}
	
	ListOfProDemoknight		= []
	ListOfProDemoknights	= {}
	ListOfRedSnipers		= []

	//rcon script GetPropEntityArray(findRandomPlayer(), prodemoknight.text, 0).PrimaryAttack()
	//rcon script NetProps.SetPropFloat(GetPropEntityArray(findRandomPlayer(), prodemoknight.text, 0), prodemoknight.text2, 0)
	//rcon script printl(NetProps.GetPropFloat(GetPropEntityArray(findRandomPlayer(), prodemoknight.text, 0), prodemoknight.text2))
	
	//bind q"rcon script prodemoknight.pose(Vector(1,0,-1))";bind e"rcon script prodemoknight.find(Vector(1.5,0,4))"
	testHandle = null
	
	
	function recalculateRedSniperCount()
	{
		//+printl("recalculated")
		ListOfRedSnipers.clear()
		foreach ( player in findAllPlayer(true) )
			if ( player.GetPlayerClass() == TF_CLASS_SNIPER )
				ListOfRedSnipers.append(player)
	}
	
	function EndFramePhasingHandler()
	{
		local demolist = ListOfProDemoknights.values()
		foreach ( demo in demolist )
		{
			// local index = CheckPhasingList.find( demo )
			// if ( index == null )
				demo.circumventSpeedCapByAD43_Think()
		}
		
		foreach ( demo in CheckPhasingList )
		{
			if ( demolist.find( demo ) != null )
				demo.circumventSpeedCap_func( true )
		}
		
		foreach ( demo in demolist )
		{
			demo.DoNotPhaseTheOtherTeam()
		}
		
		CheckPhasingList.clear()
	}
	
	
	// gamerules = FindByClassname(null , "tf_gamerules")
	SentryList = []
	hasCheckedSentriesThisTick = false
	TeleList = {}
	hasCheckedTeliesThisTick = false
	PlayerList = []
	hasCheckedEveryoneThisTick = false
	CheckPhasingList = []
	
	vels = []
	timeStart = 0
	timeStop = 0
	isCharging = false
	ang_prev = null
	startpos = null
	function Think()
	{
		// local tele = FindByClassname(null, "obj_teleporter")
		// if ( tele )
		// {
			// printl(GetPropInt(tele, "m_iObjectMode")) 
		// }
	
		EntFire("tf_gamerules", "RunScriptCode", "prodemoknight.hasCheckedSentriesThisTick = false")
		EntFire("tf_gamerules", "RunScriptCode", "prodemoknight.hasCheckedTeliesThisTick = false")
		EntFire("tf_gamerules", "RunScriptCode", "prodemoknight.hasCheckedEveryoneThisTick = false")
		EntFire("tf_gamerules", "RunScriptCode", "prodemoknight.EndFramePhasingHandler()")
		return -1
		
		if ( !me() )
			return 10
			
		// local sentry = FindByClassname(null, "obj_sentrygun")
		// if ( sentry )
		// {
			
			// printl(GetPropInt(sentry, "m_iState"))
			// printl(GetPropBool(sentry, "m_bCarried"))		// true when it is being picked up
			// printl(GetPropEntity( sentry, "m_hBuilder"))		// always the one who builds it, afaik
			// printl(GetPropEntity( sentry, "m_bCarryDeploy"))	// always null?
		// }
		
		// printl(GetPropInt(me(), "m_nButtons"))
		
		if (me().InCond(17))
		{
			if ( !isCharging )
			{
				timeStart = Time()
				startpos = me().EyeAngles().y
				isCharging = true
			}
			//printl(isCharging)
			
			
			//local speed = me().GetAbsVelocity()
			//speed.z = 0
			
			//if ( speed.Length() < 700 )
			//{
			//	vels.append(speed.Length())
			//	timeStop = Time()
			//}
			
			local ang = me().EyeAngles().y
			if ( ang_prev != null )
			{
				local result = ang - ang_prev
				//+printl("QAngle turn rate: " + result)
			}
			ang_prev = ang
			
			timeStop = Time()
		}
		else
		{
			isCharging = false
			//printl(isCharging)
			if ( vels.len() > 0 )
			{
				//+printl("vel0: " + vels[0])
				//+printl("dur: " + (timeStop - timeStart))
				//+printl((vels[vels.len() - 1] - vels[0])/ (timeStop - timeStart))
				vels.clear()
				
			}
			if ( timeStop != 0 )
			{
				//+printl("turn rate: " + (startpos - ang_prev)/ (timeStop - timeStart))
				timeStop = 0
			}
		}
		
		if ( simulating )
		{
			if ( simulate_delay )
			{
				simulate_delay--
			}
			else
			{
				if (simulated_i >= simulated_len)
				{
					simulating = false
					simulated_i = 0
				}
				if (simulated_i == 1 && simulate_trimp )
				{
					me().AddCond(17)
					SetPropInt(me(), "m_afButtonForced", 0)
				}
				
				me().SnapEyeAngles(simulated_dir_best[simulated_i])
				if ( !simulate_trimp )
				{
					me().SetAbsOrigin(simulate_origin + simulated_pos_best[simulated_i])
					me().SetAbsVelocity(Vector())
				}
				simulated_i++
			}
			
		}
		
		local curr_zvel = me().GetAbsVelocity().z
		if ( curr_zvel > max_zvel )
		{
			//+printl("max_zvel: " + curr_zvel)
			//+printl("z_height: " + me().GetOrigin().z)
			max_zvel = curr_zvel
		}
		
		return -1
	}
	prev_height = 0
	prev_moveup = false
	max_zvel = 0
	
	simulating	= false
	simulated_pos = []
	simulated_dir = []
	simulated_pos_best = []
	simulated_dir_best = []
	simulated_len = 0
	simulated_i = 0
	simulate_origin = null
	simulate_trimp	= false
	simulate_delay 	= 0
	
	function simu(real = false)
	{
		simulate_trimp = real
		simulating = true
		simulate_delay = 1
		simulate_origin = me().GetOrigin()
		
		if (real)
		{
			SetPropInt(me(), "m_afButtonForced", IN_JUMP)
		}
	}
	
	
	
	function IsInFieldOfView(attacker, target, isAimingAt = false, custom_tolerance = null ) {
		local cur_eye_pos = attacker.EyePosition()
		local cur_eye_fwd = attacker.EyeAngles().Forward()
	
		local tolerance = 0.5736 // cos(110/2)
		if ( custom_tolerance != null)
			tolerance = custom_tolerance
		else
			if ( isAimingAt )
				tolerance = 0.999 // cos(2/2)

		local delta = target.GetOrigin() - cur_eye_pos
		delta.Norm()
		if (cur_eye_fwd.Dot(delta) >= tolerance)
			return true

		delta = target.GetCenter() - cur_eye_pos
		delta.Norm()
		if (cur_eye_fwd.Dot(delta) >= tolerance)
			return true

		delta = target.EyePosition() - cur_eye_pos
		delta.Norm()
		return (cur_eye_fwd.Dot(delta) >= tolerance)
	}
	
	hMarker = SpawnEntityFromTable("prop_dynamic", {
			targetname 	= "pumpk"
			model 		= "models/props_halloween/pumpkin_01.mdl"
			solid		= 0
			origin		= "3100 1000 -2000"
		})
		
	
	

	
}
prodemoknight.Init()
// prodemoknight.PrintVersion()
prodemoknight.hMarker.ValidateScriptScope()
prodemoknight.hMarker.GetScriptScope().Think <- function() {
	return prodemoknight.Think()
}
AddThinkToEnt(prodemoknight.hMarker, "Think")

enum State
{	//0						//3							// 5					//7									//10
	IDLE, DEEPIDLE, CLEANUP, GOTOTRIMPSPOT, TRIMPSTRAFE, AIRSTRAFE, AIRBORNE, SIMULATETRIMP, CIRCLESENTRY, CAMPTELE, BUSTER, DETONATING, CHARGEATTARGET, CHASE, AVOID, TEST
};
::ProDemoknightBot <- class 
{
	hOwner 		= null
	hWeapon		= null
	AI_Bot_myDemo	= null
	hateSentries	= false
	// hasMissionSuicideBomber	= false
	bot_type	= null
	bot_scale	= 1
	
	ListOfSpots		= null
	
	hasCharge		= false
	requestCharge	= false
	attackPending	= false
	tryBashing		= false
	strafing		= true
	movingToPosition	= false
	persistent_hasCharge_check = 0
	just_out_of_charge	= false
	
	should_attack	= false
	
	strafeDelay		= 0
	
	meleeRange		= 48
	swingTime		= 0.2
	chargeLevel		= 0
	mins			= null
	maxs			= null
	hull_center		= null
	
	my_point_of_attack	= 0
	chargeDuration	= 1.5
	maxSpeed		= 280
	maxChargeSpeed	= 750
	acceleration = 3000
	turnRate_perTick = 1
	shieldRechargeRate_perTick = 1
	
	time_to_reach_target = 0
	targetPos			= null
	targetTrimpPos		= null
	targetAvoid			= null
	arrived				= false
	prepare				= false
	meleeThisGuy		= null
	
	EndCords = []
	targetTrimp			= null
	targetSentry		= null
	targetTele			= null
	// SentryList = []
	immediateThreats	= {}
	
	immediateTarget	= null
	
	moving_time = 0
	moving_opposite_time = 0
	
	immediateThreatsAttack_timeout_timer = CreateTimer(@() {}, 0.1)
	prepareFor_chargeAtTarget_timer		 = CreateTimer(@() {}, 0.1)
	lockon_timer 					= CreateTimer(@() {}, 0.1)
	lenient_TRIMPSTRAFE_timer		= CreateTimer(@() {}, 0.1)
	wait_before_forcedAttack_timer	= CreateTimer(@() {}, 0.1)
	// wait_before_ipad_timer			= CreateTimer(@() {}, 0.1)
	wait_after_ipad_timer			= CreateTimer(@() {}, 0.1)
	temp_non_solid_timer			= CreateTimer(@() {}, 0.1)
	
	wait_1_frame	= false
	wait_x_frame	= null
	simulating	= false
	//simulated_pos = []
	//simulated_dir = []
	simulated_pos_best = []
	simulated_dir_best = []
	simulated_len = 0
	simulated_i = 0
	simulate_origin = null
	simulate_trimp	= false
	
	tickInterval = 0.015
	sv_gravity	= -800
	tf_bot_suicide_bomb_range = 300
	
	
	current_state	= State.IDLE	// IDLE	// TEST
	// last_state		= State.IDLE
	isChasing		= false
	CHASElastSeen	= 0
	IDLE_time		= 0
	ipad_time		= false
	bUseiPadWhileIdle	= true
	closestThreat_lastAttack = 0
	closestThreat_Attack	= 0
	forcedAttack	= false
	
	current_trimpSpot = trimp_spot_info.spawn_rock
	
	circumventSpeedCap	= true		//$rafmod
	circumventByAD43	= true
	circumventing		= false
	ForceNoAD43			= false
	isNonSolid			= false
	timeNonSolid		= 0
	timeToStopPhasingOtherDemos = 0
	no_SUPPRESS_FIRE	= false
	
	constructor(hOwner, bot_type)
	{
		this.hOwner = hOwner
		//this.hWeapon = GetPropEntityArray(hOwner, "m_hMyWeapons", 2)
		
		AI_Bot_myDemo = AI_Bot_ProDemoknight( hOwner, this )
		
		maxChargeSpeed = GetMaxChargeSpeed()		// also fetch turn speed here
		acceleration = maxChargeSpeed * 10
		mins	= hOwner.GetBoundingMins()
		maxs	= hOwner.GetBoundingMaxs()
		hull_center = (mins + maxs) * 0.5
		// hOwner.SetModelScale(1.75, 0)
		bot_scale = hOwner.GetModelScale()
		
		simulated_pos_best = []
		simulated_dir_best = []
		jukeTargetFacing = []
		juke_comparePastTick = (0.15 / tickInterval).tointeger()
		past_location = [Vector()]
		
		ListOfSpots = ::trimp_spot_info
		
		this.hOwner.ValidateScriptScope()
		this.hOwner.GetScriptScope().me <- this
		this.hOwner.GetScriptScope().Think <- function()
		{
			return me.Think()
		}
		AddThinkToEnt(this.hOwner, "Think")
		
		
		targetTrimp = me()
		
		if ( !circumventSpeedCap )
			circumventByAD43 = false
			
		if ( circumventByAD43 )
		{
			SetPropBool(hOwner, "m_bForcedSkin", true)
			SetPropInt(hOwner, "m_nForcedSkin", 1)
		}
		
		this.bot_type			= bot_type
		if ( bot_type == "bot_pro_demoknight_homewrecker" || bot_type == "bot_pro_busterknight" )
			this.hateSentries = true
		// this.hasMissionSuicideBomber = hOwner.GetMission() == MISSION_DESTROY_SENTRIES ? true : false
		
		// this.hOwner.SetModelScale(1, 0)
		TakeOver(true, true)
		IDLE_time					= AI_Bot_myDemo.time
		// timeToStopPhasingOtherDemos	= AI_Bot_myDemo.time
	}
	
	circumvent_timeout_timer = CreateTimer(@() {}, 0.1)
	function circumventSpeedCap_func( state )
	{
		if (state)
		{
			// if ( circumvent_timeout_timer.IsValid() )
				// return
			
			if ( !circumventing )
			{
				circumventing = true
				//hOwner.SetTeam( TEAM_SPECTATOR )
				//hOwner.ForceChangeTeam(2, false)
				hOwner.AddCond(43)
				
				if ( hOwner.InCond(35) )
				{
					hOwner.RemoveCond(35)
					hOwner.AddCond(35)
				}
				
				// printl("circumventSpeedCap_func: True")
			}
		}
		else
		{
			if ( circumventing )
			{
				// why did i bother
				// local vel = hOwner.GetAbsVelocity()
				// vel.Norm()
				// vel *= 999
				// hOwner.SetAbsVelocity(vel)
				
				circumventing = false
				//hOwner.SetTeam( TEAM_SPECTATOR )
				// local gamerules = Entities.FindByClassname(null, "tf_gamerules")
				// NetProps.SetPropBool(gamerules, "m_bPlayingMannVsMachine", false)
				// hOwner.ForceChangeTeam(3, false)
				// NetProps.SetPropBool(gamerules, "m_bPlayingMannVsMachine", true)
				hOwner.RemoveCond(43)
				
				// circumvent_timeout_timer = CreateTimer(@() {}, 2)
				// printl("circumventSpeedCap_func: False")
			}
		}
	}
	function circumvent_timeout()
	{
		if ( circumvent_timeout_timer.IsValid() )
		{
			circumvent_timeout_timer.Destroy()
		}
	
		ForceNoAD43 = true
		circumventSpeedCap_func( false )
		local ref = this
		circumvent_timeout_timer = CreateTimer(@() ref.ForceNoAD43 = false, 0.2)
	}
	
	function temporaryNonSolid()
	{
		if ( !isNonSolid )
		{
			isNonSolid = true
			// hOwner.SetSolid(0)
			// circumventSpeedCap_func( true )
			
		}
		timeNonSolid = AI_Bot_myDemo.time
		
		// if ( temp_non_solid_timer.IsValid() )
			// temp_non_solid_timer.Destroy()
			
		// local ref = this.hOwner
		// temp_non_solid_timer = CreateTimer(@() ref.SetSolid(2), 1 )
	}
	function checkAABBCollide( targetWrapper, speed = 2000 )
	{
		local targetOrigin
		local targetMaxs	
		if ( targetWrapper instanceof ::ProDemoknightBot )
		{
			if ( !AI_Bot_myDemo.IsAlive(targetWrapper.hOwner) )
			{
				return false
			}
			
			// recreate target's AABB
			targetOrigin	= targetWrapper.AI_Bot_myDemo.cur_pos + targetWrapper.mins
			targetMaxs		= targetWrapper.maxs - targetWrapper.mins
		}
		else
		{
			local mins = targetWrapper.GetBoundingMins()
			targetOrigin	= targetWrapper.GetOrigin() + mins
			targetMaxs		= targetWrapper.GetBoundingMaxs() - mins
		}
		
		
		// create my slightly oversized AABB
		local widenBy	= ceil( ( speed * 2 ) * tickInterval )
		local widenVector = Vector( widenBy, widenBy, widenBy )
		local origin	= AI_Bot_myDemo.cur_pos + mins - widenVector
		local maxs		= this.maxs - mins + widenVector * 2 + origin
		// local maxs		= this.maxs - mins + widenVector
		// printl(maxs)
		// maxs += origin
		
		
		
		// get corners of target
		local corners = collectBottomCornersOfExtent( trimp_extent(targetOrigin, targetMaxs) )
		
		local increaseZ = Vector( 0,0,targetMaxs.z )
		for ( local i = 0; i < 4; i++ )
		{
			corners.append(corners[i] + increaseZ)
		}
		
		// local maxs += origin
		//printl("targetPos: " + targetPos + " " + dest_ext.origin + " " + dest_ext.maxs)
		foreach ( corner in corners )
		{
			if ( corner.x >= origin.x && corner.x <= maxs.x &&
				 corner.y >= origin.y && corner.y <= maxs.y &&
				 corner.z >= origin.z && corner.z <= maxs.z )
			{
				return true
			}
		}
		
		return false
	}
	function DoNotLetOtherDemosStopMe()
	{
		// foreach ( demo in prodemoknight.ListOfProDemoknights.values() )
		// {
			// demo.temporaryNonSolid()
			// demo.circumventSpeedCap_func( true )
			// demo.ForceNoAD43 = true
		// }
		// return
	
		local index = prodemoknight.CheckPhasingList.find( this )
		if ( index == null )
		{
			prodemoknight.CheckPhasingList.append( this )
		}
		else
		{
			return
		}
	
		// local cur_speed = hOwner.GetAbsVelocity().Length()
		foreach ( demo in prodemoknight.ListOfProDemoknights.values() )
		{
			// if ( demo == this )
				// continue
			
			if ( checkAABBCollide(demo, AI_Bot_myDemo.cur_speed) )	//, cur_speed
			{
				demo.temporaryNonSolid()
				demo.DoNotLetOtherDemosStopMe()		// WARNING: potential inf loop?
				// SetPropBool( demo.hOwner, "m_bGlowEnabled", true )
			}
		}
	}
	function DoNotPhaseTheOtherTeam()
	{
		if ( !circumventing )
			return
		
		// local player_list = findAllPlayer()
		collectAllPlayers()
		foreach ( player in prodemoknight.PlayerList )
		{
			if ( player.GetTeam() == AI_Bot_myDemo.team
				|| !AI_Bot_myDemo.IsAlive(player)
				|| prodemoknight.ListOfProDemoknights.keys().find(player) != null
				) continue
			
			if ( checkAABBCollide(player, AI_Bot_myDemo.cur_speed) )
			{
				circumvent_timeout()
				return
			}
		}
		
		
	}
	function circumventSpeedCapByAD43_Think()
	{
		if ( circumventSpeedCap && !ForceNoAD43 )
		{
			if ( (AI_Bot_myDemo.cur_speed > 950 || isNonSolid) && !hOwner.InCond(51) )
			{
				circumventSpeedCap_func( true )
				if ( timeToStopPhasingOtherDemos > AI_Bot_myDemo.time )
				{
					DoNotLetOtherDemosStopMe()
				}
			}
			else
			{
				circumventSpeedCap_func( false )
			}
			
			if ( isNonSolid && timeNonSolid + 0.09 < AI_Bot_myDemo.time )
			{
				isNonSolid = false
				// ForceNoAD43 = false
			}
		}
		
		// local hor_vel = AI_Bot_myDemo.cur_vel - Vector(0,0,AI_Bot_myDemo.cur_vel.z)
		// local hor_speed = hor_vel.Length()
		// if ( hor_speed > 309 )
			// printl("hor_speed: " + hor_speed + " speed: " + AI_Bot_myDemo.cur_speed)
	}
	
	
	function changeState(new_state)
	{
		if ( current_state == new_state )
			return
		
		switch ( current_state )
		{
			case State.IDLE:
				if ( ipad_time )
				{
					exitIDLE( new_state )
					new_state = State.DEEPIDLE
				}
				break
			case State.CHASE:
				isChasing = false
			case State.GOTOTRIMPSPOT:
				curr_point = null
				break
			case State.CIRCLESENTRY:
				forceCrouch = false
				SetPropInt(hOwner, "m_afButtonForced", 0)
				break
			case State.CHARGEATTARGET:
			case State.TRIMPSTRAFE:
				hasCharge 			= false
				wait_for_crit		= false
				just_out_of_charge	= true
				break
			// case State.AIRBORNE:
				// SetPropFloat(hOwner, "m_Shared.m_flChargeMeter", 0)
				// break
			
		}
		
		local i
		local evaluate_new_state = new_state
		for ( i = 0; i < 10; i++ )
		{
			switch ( new_state )
			{
				case State.IDLE:
					IDLE_time = AI_Bot_myDemo.time
					break
				case State.CHASE:
					if ( hateSentries )
					{
						collectSentries()
						if ( prodemoknight.SentryList.len() )
						{
							new_state = interface_fightThisSentry( FindClosestSentry(1e30), true )
						}
						else if ( bot_type == "bot_pro_busterknight" )
						{
							new_state = State.DETONATING
							// StartDetonate()
						}
					}
					break
				case State.GOTOTRIMPSPOT:
					arrived = false
					prepare = false
				case State.BUSTER:
					findTarget_wait = AI_Bot_myDemo.time
					break
				case State.AIRBORNE:
					// CalcForSimpleCharge()
					State_AIRBORNE_delay_by_x_ticks = 2
					AI_Bot_myDemo.locomotion.Jump()
					break
			}
			
			if ( evaluate_new_state == new_state )	// no more change, move on
				break
			else
				evaluate_new_state = new_state
		}
		if ( i == 10 )
		{
			//+printl("WARNING!!!!!!!!!!!!!!!!!!: stuck looping state?")
		}
		
		if ( prodemoknight.debug_state )
		{
			//+printl("--------------------")
			local x = 5
			while ( x != 0)
			{
				local tabl = getstackinfos(x)
				if (tabl)
				{
					//+printl(getstackinfos(x).func)
				}
				x--
			}
			//+printl("changing to " + new_state)
			//+printl("--------------------")
		}
		
		current_state = new_state
	}
	
	test_count = 0
	function Think()
	{
		// return -1
		// printl(GetPropInt(hOwner, "m_nButtons"))
		
		// if ( !hasCharge )
			// printl("its off: " + hasCharge + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		// printl("okay")
		
		
		if ( current_state == State.TEST )
		{
			// if ( !(hOwner.GetFlags() & FL_ONGROUND) )
				// changeState( State.AIRBORNE )
			
			local look = hOwner.EyeAngles().Forward()
			look.z = 0
			look.Norm()
			local vel = hOwner.GetAbsVelocity()
			vel.z = 0
			vel.Norm()
			local texttoprint = "dot: " + look.Dot(vel)
			
			AI_Bot_myDemo.OnUpdate()
			look = AI_Bot_myDemo.cur_eye_fwd
			look.z = 0
			look.Norm()
			vel = AI_Bot_myDemo.cur_vel
			vel.z = 0
			vel.Norm()
			texttoprint += " dot2: " + look.Dot(vel)
			//+printl(texttoprint)
			
			AI_Bot_myDemo.locomotion.Approach( Vector(RandomInt(-10, 10),RandomInt(-10, 10),0) + AI_Bot_myDemo.cur_pos , 999)
			
			
			
			// prodemoknight.debug_state = true
			return 1
			// return 0.1
			// return -1
		}
		
		if ( current_state == State.DETONATING )
		{
			StartDetonate()
			circumventSpeedCap_func( false )
			return 10
		}
		else if ( bot_type == "bot_pro_busterknight" && targetSentry && targetSentry.IsValid() )
		{
			local sentryPos = getSentryPos( targetSentry )
			if ( (sentryPos - AI_Bot_myDemo.cur_pos).Length() < tf_bot_suicide_bomb_range/3 )
				changeState( State.DETONATING )
		}
		// else if ( bot_type == "bot_pro_busterknight" && AI_Bot_myDemo.locomotion.IsStuck() )
			// changeState( State.DETONATING )
		
		AI_Bot_myDemo.OnUpdate()
		checkStuck()
		checkStuck2()
		ManageSpy_Think()
		
		// if ( current_state == State.AIRBORNE )
		// {
			
		// }
		// else if ( false )
		// {
			// if ( me() )	// me()
			// {
				// local mepos = me().GetOrigin()
				// local dist = AI_Bot_myDemo.cur_pos - mepos
				// dist.z = 0
				
				// if (AI_Bot_myDemo.time - test_count < 2)
				// {
					// if ( dist.Length() < 10 )
					// {
						// printl("reached !!!!!!!!!!!!!!!: " + (AI_Bot_myDemo.time - test_count) )
					// }
					
					// if ( abs(AI_Bot_myDemo.cur_pos.z - mepos.z) < 10 )
					// {
						// printl("reached XXXXXXXXXXXXXXX: " + (AI_Bot_myDemo.time - test_count) )
					// }
				// }
			// }
		// }
		
		// circumventSpeedCapByAD43_Think()
		
		
		if ( no_SUPPRESS_FIRE )
		{
			no_SUPPRESS_FIRE = false
			hOwner.AddBotAttribute(SUPPRESS_FIRE)
		}
		
		// it says check but not actually bruh
		if ( persistent_hasCharge_check && hasCharge )
		{
			// printl("persistent_hasCharge_check " + persistent_hasCharge_check)
			persistent_hasCharge_check--
			hasCharge = false
		}
		else
		{
			persistent_hasCharge_check = 0
		}
		
		// because shield users have their m2 held down, we have to manually manage this
		if ( !hasCharge )
		{
			chargeLevel = GetPropFloat(hOwner, "m_Shared.m_flChargeMeter")
			if ( chargeLevel == 100)
				hasCharge = true
			else
				hasCharge = false
		}
		// printl("chargeLevel: " + chargeLevel)
		

		if ( current_state == State.IDLE )
		{
			if ( bUseiPadWhileIdle && !ipad_time && IDLE_time + 2 < AI_Bot_myDemo.time )
			{
				ipad_time = true
				SetPropBool(hOwner, "m_bViewingCYOAPDA", true)
			}
			
			findTarget()
			// if ( !findTarget() )
				// return 5
		}
		
		
		if ( should_attack )
		{
			if ( NetProps.GetPropFloat(hWeapon, "m_flNextPrimaryAttack") < AI_Bot_myDemo.time )
			{
				meleeThisGuy = null
				// should_attack = false
			}
		
			if ( !meleeThisGuy )
			{
				local ThreatList = AI_Bot_myDemo.FindVisibleThreat(100000000, false)
				if ( targetSentry && targetSentry.IsValid() )
					ThreatList.append(targetSentry)
				
				foreach ( threat in ThreatList )
				{
					if ( amICloseEnoughInT(threat) )
					{
						meleeThisGuy = threat
						startAttack()
						// printl(" ///////////////----- " + (AI_Bot_myDemo.time - test_count) )
						
						if ( circumventByAD43 )
						{
							local ref = this
							CreateTimer( @() ref.circumvent_timeout(), 0.19 )
						}
						break
					}
				}
			}
			
			if ( meleeThisGuy && meleeThisGuy.IsValid()
				&& current_state != State.AIRSTRAFE
				&& current_state != State.CHARGEATTARGET
				&& current_state != State.CAMPTELE )
			{
				AI_Bot_myDemo.SnapAt( meleeThisGuy )
				
				// if ( !lockon_timer.IsValid() )
				// {
					// local ref = this
					// lockon_timer = CreateTimer(function() {ref.should_attack = false
														   // ref.meleeThisGuy = null}, 0.9)	/// this will hardcap the swing interval to 0.9
					// printl("locking into this guy.............")
				// }
				
				OnTargetDeath( meleeThisGuy )
			}
		}
		
		if ( current_state == State.CIRCLESENTRY )
		{
			fightSentry_think()
		}
		else if ( current_state == State.BUSTER )
		{
			buster_think()
		}
		else if ( current_state == State.CAMPTELE )
		{
			CAMPTELE_think()
		}
		else if ( current_state == State.AVOID )
		{
			should_attack = true
			AVOID_Think()
		}
		else if ( current_state == State.CHASE )
		{
			//printl("chasing")
			CHASE_Think()
		}
		else if ( current_state == State.CHARGEATTARGET )
		{
			chargeAtTarget_think()
		}
		else if ( current_state == State.GOTOTRIMPSPOT )
		{
			GOTOTRIMPSPOT_Think()
		}
		else if ( current_state == State.TRIMPSTRAFE )
		{
			TRIMPSTRAFE_Think()
		}
		else if ( current_state == State.AIRSTRAFE )
		{
			AIRSTRAFE_Think()
		}
		else if ( current_state == State.AIRBORNE )
		{
			AIRBORNE_Think()
		}
		
		if ( current_state == State.SIMULATETRIMP )
		{
			if (simulated_i >= simulated_len)
			{
				simulated_i = 0
				changeState( State.IDLE )
			}
			
			// if ( simulated_i == 0)
			// {
				// prodemoknight.simu(true)
			// }
			//if (simulated_i == 0 && simulate_trimp )
			//{
				//me().AddCond(17)
				//SetPropInt(me(), "m_afButtonForced", 0)
			//}
			
			hOwner.SnapEyeAngles(simulated_dir_best[simulated_i])
			//me().SnapEyeAngles(simulated_dir_best[simulated_i])
			//if ( !simulate_trimp )
			//{
			//	me().SetAbsOrigin(simulate_origin + simulated_pos_best[simulated_i])
			//	me().SetAbsVelocity(Vector())
			//}
			simulated_i++
		}
		// startOfCharge()
		// refine()
		
		
		// keeping track of my velocity direction change to compensate
		local vel_dir = VectorAngles(hOwner.GetAbsVelocity()).y
		vel_dir_prev = vel_dir
		
		if ( current_state == State.CLEANUP )
		{
			cleanup()
		}
		
		return -1
	}
	
	function exitIDLE( new_state )
	{
		ipad_time = false
		hOwner.AddCond(87)
		SetPropBool(hOwner, "m_bViewingCYOAPDA", false)
		local ref = this
		wait_after_ipad_timer = CreateTimer(function() {
			if ( ref )
			{
				ref.hOwner.RemoveCond(87)
				ref.changeState( new_state )
			}
		}, 1.8 )
	}
	
	State_AIRBORNE_delay_by_x_ticks = 0
	can_do_AIRBORNE_trimp = false
	AIRBORNE_halted		= false
	SimpleCharge_Timer	=	null
	save_angle = null
	function AIRBORNE_Think()
	{
		if (hOwner.GetFlags() & FL_ONGROUND)
		{
			changeState( State.CHASE )
			if ( SimpleCharge_Timer && SimpleCharge_Timer.IsValid() )
				SimpleCharge_Timer.Destroy()
			
			return
		}
		
		// SetPropFloat(hOwner, "m_Shared.m_flChargeMeter", 100)
		
		if ( State_AIRBORNE_delay_by_x_ticks > 0 )
		{
			State_AIRBORNE_delay_by_x_ticks--
			can_do_AIRBORNE_trimp = false
			AIRBORNE_halted = false
		}
		else if ( !State_AIRBORNE_delay_by_x_ticks )
		{
			local time_until_have_charge = 0
			if ( !hasCharge )
			{
				// time_until_have_charge = (100 - chargeLevel) / shieldRechargeRate_perTick * tickInterval
				
				if ( chargeLevel < 80 )
				{
					time_until_have_charge = (80 - chargeLevel) / shieldRechargeRate_perTick * tickInterval
				}
			}
			
			// printl("chargeLevel: " + chargeLevel)
		
			State_AIRBORNE_delay_by_x_ticks = -1
			can_do_AIRBORNE_trimp = CalcForSimpleCharge( time_until_have_charge )
			
			if ( can_do_AIRBORNE_trimp )
			{
				SetPropFloat(hOwner, "m_Shared.m_flChargeMeter", 100)
				ForceNoAD43 = false
			}
			
			// save_angle = CalcClosestCardinalAngle( AI_Bot_myDemo.cur_eye_fwd * 1, AI_Bot_myDemo.cur_vel * 1)
			// hOwner.SnapEyeAngles( VectorAngles(save_angle) )
			// save_angle = CalcClosestCardinalAngle( hOwner.EyeAngles().Forward(), hOwner.GetAbsVelocity())
			// printl("angle: " + save_angle)
			hOwner.SnapEyeAngles( VectorAngles(CalcClosestCardinalAngle( AI_Bot_myDemo.cur_eye_fwd * 1, AI_Bot_myDemo.cur_vel * 1)) )
		}
		
		if ( can_do_AIRBORNE_trimp )
		{
			local backward = AI_Bot_myDemo.cur_vel * -1
			// local backward = hOwner.GetAbsVelocity() * -1
			backward.z = 0
			local dir = save_angle.Forward()
			
			// local texttoprint = "cancelling speed: " + backward.Length() + " " + AIRBORNE_halted
			// printl(texttoprint)
			
			if ( !AIRBORNE_halted )
			{
				AI_Bot_myDemo.locomotion.Approach(backward+AI_Bot_myDemo.cur_pos, 999)
				
				if ( backward.Length() < 30 )
				{
					AIRBORNE_halted = true
				}
			}
			else
			{
				AI_Bot_myDemo.locomotion.Approach(AI_Bot_myDemo.cur_pos + dir*100, 999)
			}
		}
		
		// if ( !targetTrimp || !targetTrimp.IsValid() )
			// targetTrimp = me()
			
		// if ( targetTrimp )
		// {
			// local vel = hOwner.GetAbsVelocity()
			// local target_pos = targetTrimp.GetOrigin()
			// local timeToZ = calcTimeToTargetZ(AI_Bot_myDemo.cur_pos.z, target_pos.z + 15, vel.z, sv_gravity)
			// if ( timeToZ )
			// {
				// printl( timeToZ )
				// printl( timeToZ + AI_Bot_myDemo.time)
			// }
		// }
	}
	function CalcClosestCardinalAngle( unit_vector, other_vector )
	{
		other_vector.z = 0
		other_vector.Norm()
		
		if ( !other_vector.LengthSqr() )
				return unit_vector
		
		local cardinals = [other_vector, Vector(other_vector.y, -other_vector.x),
							other_vector * -1, Vector(-other_vector.y, other_vector.x) ]
		
		unit_vector.z = 0
		unit_vector.Norm()
		
		// foreach ( cardinal_vector in cardinals )
		// {
			// printl("dot: " + other_vector.Dot(cardinal_vector))
			// printl("cardinal_vector: " + cardinal_vector)
		// }
		
		foreach ( cardinal_vector in cardinals )
		{
			if ( cardinal_vector.Dot(unit_vector) >= 0.707 )
				return cardinal_vector
		}
		
		//+printl("WARNING:!!!!!! this shouldn't happen")
		return Vector(1,0,0)
	}
	
	// timeToForgetSpy = 5
	function ManageSpy_Think()
	{
		AI_Bot_myDemo.ManageSpy_Think()
	}
	
	max_stuck_count = 3
	current_stuck_count = 0
	stuck_check_timeout = CreateTimer(@() {}, 0.1)
	function checkStuck()
	{
		// printl(current_stuck_count)
		if ( AI_Bot_myDemo.locomotion.IsStuck() )
		{
			if ( !stuck_check_timeout.IsValid() )
			{
				current_stuck_count += 1
				stuck_check_timeout = CreateTimer(@() {}, 3)
				hOwner.SetAbsVelocity(Vector())
			}
		}
		else if ( current_stuck_count )
		{
			current_stuck_count = 0
			if ( stuck_check_timeout.IsValid() )
				stuck_check_timeout.Destroy()
			
			return
		}
		
		if ( current_stuck_count >= max_stuck_count )
		{
			if ( bot_type == "bot_pro_busterknight" )
			{
				changeState( State.DETONATING )
				return
			}
			else
			{
				hOwner.SetHealth( 0 )
				hOwner.TakeDamageCustom(hOwner, hOwner, null, Vector(), Vector(), 1, 0, TF_DMG_CUSTOM_TELEFRAG)		// telefrag is forced
			}
				
		}
	}
	
	past_location = []
	stuck_check_2_timeout = CreateTimer(@() {}, 0.1)
	function checkStuck2()
	{
		if ( !stuck_check_2_timeout.IsValid() )
		{
			if ( (past_location[0] - AI_Bot_myDemo.cur_pos).LengthSqr() < 150 * 150 )
			{
				past_location.append( AI_Bot_myDemo.cur_pos )
			}
			else
			{
				past_location.clear()
				past_location.append( AI_Bot_myDemo.cur_pos )
			}
			
			local len = past_location.len()
			if ( len > 2 )
			{
				if ( len > 5)
				{
					if ( bot_type == "bot_pro_busterknight" )
					{
						changeState( State.DETONATING )
						return
					}
					else
					{
						// hOwner.SetHealth( 0 )
						// hOwner.TakeDamageCustom(hOwner, hOwner, null, Vector(), Vector(), 1, 0, TF_DMG_CUSTOM_TELEFRAG)		// telefrag is forced
						SetPropBool( hOwner, "m_bGlowEnabled", true )
					}
				}
				else
				{
					hOwner.SetAbsVelocity(Vector())
					// printl("WARNING!!!!!!!!!!!!!!!!!!!!!!!!: unstuck")
				}
			}
			stuck_check_2_timeout = CreateTimer(@() {}, 2)
		}
	}
	
	function checkNumberAdvantage( target )
	{
		if ( !target )
			return false
		
		local targetPos	= target.GetOrigin()
		local distance	= ( targetPos - AI_Bot_myDemo.cur_pos ).LengthSqr()
		distance += 100*100	// tolerance
		
		foreach ( demoknight in prodemoknight.ListOfProDemoknights.values() )
		{
			if ( demoknight == this )
				continue
				
			if ( ( demoknight.AI_Bot_myDemo.cur_pos - targetPos ).LengthSqr() < distance )
				return true
		}
		return false
	}
	
	// loop_count = 0
	function canChargeToTarget( target )
	{
		// loop_count = 0
		
		local pos_start = AI_Bot_myDemo.cur_eye_pos
		local pos_end
		if ( target.GetClassname() == "obj_sentrygun" )
			pos_end   = getSentryPos( target )
		else
			pos_end   = target.EyePosition()

		
		local area_start = GetNavArea(pos_start, 300.0)
		local area_end   = GetNavArea(pos_end, 300.0)

		if (!area_start)
			area_start = GetNearestNavArea(pos_start, 128.0, false, true)
		if (!area_end)
			area_end   = GetNearestNavArea(pos_end, 128.0, false, true)

		if (!area_start || !area_end)
			return false
			
		// printl("hmmm?")
		if ( target.GetAbsVelocity().z == 0 )
		{
			local diff = GetCTFNavAreaWrapper(area_end).GetZ( pos_end.x, pos_end.y ) - target.GetOrigin().z
			if ( abs(diff) > 18 )
				return false
		}
			
		if ( area_start == area_end )
			return true
			
		local dx = pos_end.x - pos_start.x;
		local dy = pos_end.y - pos_start.y;
		
		local dir		= pos_end - pos_start
		// local dir		= Vector(pos_end.x, pos_end.y, 0) - Vector(pos_start.x, pos_start.y, 0)
		local rotation	= VectorAngles(Vector(pos_end.x, pos_end.y, 0) - Vector(pos_start.x, pos_start.y, 0))
		local increment	= RotatePosition( Vector(), rotation, Vector(5,0,0) )
		local incrementT = increment.x / dx
		// printl(increment)
		
		local curr_pos = pos_start
		local curr_nav
		local prev_nav
		local this_nav
		
		local T
		
		while ( true )
		{
			// loop_count++
			
			curr_pos = pos_start + dir * T
			this_nav = GetNavArea(curr_pos, 256.0)

			// if ( !this_nav )
				// this_nav = GetNearestNavArea(curr_pos, 128.0, false, true)
			
			if ( !this_nav )
			{
				return false
			}
			
			if ( !curr_nav || this_nav != curr_nav.area )
			{
				prev_nav = curr_nav
				curr_nav = GetCTFNavAreaWrapper(this_nav)
				
				if ( prev_nav )
				{
					if ( prev_nav.ComputeAdjacentConnectionHeightChange(curr_nav) > 18 )
						return false
				}
				
				if ( curr_nav.area == area_end )
					return true
					
				if ( T > 1)
					return false
				// Assert( T <= 1 )
				
				// find the next nav area
				local result = LineBoxIntersection(pos_start, pos_end, dx, dy, curr_nav)
				// Assert(result, "LineBoxIntersection failed somehow")
				if ( result )
				{
					// if ( !fun.hMarker )
						// fun.CreateMarker()
					// fun.hMarker.SetAbsOrigin(Vector(result.x, result.y, curr_nav.m_nwCorner.z))
				}
				else
				{
					return false
				}
				
				// curr_pos = pos_start + dir * (result.z + incrementT)
				T = (result.z + incrementT)
			}
			else
			{
				T += incrementT
				continue
			}
			
			
		}
			
		// local nav = GetCTFNavAreaWrapper(area_start)
		// printl("" + nav.m_nwCorner + " " + nav.m_seCorner )
		// printl(LineBoxIntersection(pos_start, pos_end, nav))
		
		
		
	}
	
	function LineBoxIntersection(start, end, dx, dy, nav)
	{
		// local dx = end.x - start.x;
		// local dy = end.y - start.y;

		local tValues	= [];
		local points	= [];
		local t
		local x
		local y

		// Avoid division by zero
		if ( dx != 0.0 ) {
			// Left edge (x = minx)
			t = (nav.m_nwCorner.x - start.x) / dx;
			if ( t >= 0.0 && t <= 1.0 ) {
				y = start.y + t * dy;
				if (y >= nav.m_nwCorner.y && y <= nav.m_seCorner.y) {
					// tValues.append(t);
					points.append(Vector(nav.m_nwCorner.x, y, t));
				}
			}
			// Right edge (x = maxx)
			t = (nav.m_seCorner.x - start.x) / dx;
			if ( t >= 0.0 && t <= 1.0 ) {
				y = start.y + t * dy;
				if (y >= nav.m_nwCorner.y && y <= nav.m_seCorner.y) {
					// tValues.append(t);
					points.append(Vector(nav.m_seCorner.x, y, t));
				}
			}
		}

		if ( dy != 0.0 ) {
			// Bottom edge (y = miny)
			t = (nav.m_nwCorner.y - start.y) / dy;
			if ( t >= 0.0 && t <= 1.0 ) {
				x = start.x + t * dx;
				if (x >= nav.m_nwCorner.x && x <= nav.m_seCorner.x) {
					// tValues.append(t);
					points.append(Vector(x, nav.m_nwCorner.y, t));
				}
			}
			// Top edge (y = maxy)
			t = (nav.m_seCorner.y - start.y) / dy;
			if ( t >= 0.0 && t <= 1.0 ) {
				x = start.x + t * dx;
				if (x >= nav.m_nwCorner.x && x <= nav.m_seCorner.x) {
					// tValues.append(t);
					points.append(Vector(x, nav.m_seCorner.y, t));
				}
			}
		}

		// if (tValues.empty()) return false;

		// Find the *exit point* (the larger t value)
		local maxT = 0;
		local maxPoint = null;
		// for (local i = 0; i < tValues.size(); ++i) {
		foreach ( value in points )
		{
			if ( value.z > maxT )
			{
				maxT = value.z;
				maxPoint = value;
			}
		}

		// outPoint = maxPoint;
		// return true;
		
		return maxPoint
	}

	
	findTarget_wait	= 0
	function findTarget()
	{
		// collectTelies()
		// local tele = FindClosestTele()
		// if ( tele )
		// {
			// interface_campTele( tele )
			// return true
		// }
		
		local closestThreat = AI_Bot_myDemo.FindClosestThreat(1e30, false)
		collectSentries()
		if ( !closestThreat && !prodemoknight.SentryList.len() )
			return false
		
		local spotAndTarget = {}
		local ListOfTargets
		
		if ( (closestThreat && !hateSentries) || hateSentries )
		{
			foreach ( spot in ListOfSpots )
			{
				ListOfTargets = collectReachableTrimpTargets( spot )
				if ( !ListOfTargets.len() )
					continue
				else if ( AI_Bot_myDemo.CanIMoveToThisSpot( spot.start_pos ) )
					spotAndTarget[spot] <- ListOfTargets
			}
		}
		
		if ( !spotAndTarget.len() && hateSentries )
		foreach ( spot in ListOfSpots )
		{
			ListOfTargets = collectReachableTrimpTargetsUHHH( spot )
			if ( !ListOfTargets.len() )
				continue
			else if ( AI_Bot_myDemo.CanIMoveToThisSpot( spot.start_pos ) )
				spotAndTarget[spot] <- ListOfTargets
		}
		
		
		local closestSpot		= null
		local closestSpotSafe	= null
		local closestSpotLength = 1e30
		local distance
		
		// caching threat list to hopefully stop the your taking too long thing
		AI_Bot_myDemo.cur_threat_list = AI_Bot_myDemo.FindVisibleThreat(1e30, false)
		
		foreach ( spot, ListOfTargets in spotAndTarget )
		{
			distance = (spot.start_pos - AI_Bot_myDemo.cur_pos).LengthSqr()
			if ( distance < closestSpotLength )
			{
				/// add another check to see if its safe to reach there
				if ( distance	< 6250000  		// cap the distance or it goes insane, 2500 * 2500
					&& AI_Bot_myDemo.UpdatePathAndMove(spot.start_pos, false, true)
				)
				{
					closestSpotSafe = spot
				}
			
				closestSpot = spot
				closestSpotLength = distance
			}
		}
		
		if ( closestSpotSafe )
		{
			goToTrimpSpot( closestSpotSafe )
			return true
		}
		else if ( closestSpot )
		{
			goToTrimpSpot( closestSpot )
			return true
		}
		
		// local checkedSentry = false
		if ( hateSentries )
		{	
			// checkedSentry = true
			local sentry = FindClosestSentry(1e30)
			if ( sentry )
			{
				interface_fightThisSentry( sentry )
				return true
			}
			else if ( bot_type == "bot_pro_busterknight" )
			{
				changeState( State.DETONATING )
				return true
			}
			else if ( closestThreat )
			{
				changeState( State.CHASE )
				return true
			}
		}
		else
		{
			if ( closestThreat )
			{
				changeState( State.CHASE )
				return true
			}
			
			targetSentry = FindClosestSentry(3000 * 3000)
			if ( targetSentry )
			{
				interface_fightThisSentry( targetSentry )
				return true
			}
		}
		
		return false
	}
	
	function collectReachableTrimpSpotToTarget( target )
	{
		if ( target == null )
			return []
		if ( !target.IsValid() )
			return []
		
		local targetPos = getSentryPos( target )
		
		local spots = []
		
		foreach ( spot in ListOfSpots )
		{
			// local skip = false
			foreach ( dest_ext in spot.destination_extent )
			{
				local maxs = dest_ext.maxs + dest_ext.origin
				//printl("targetPos: " + targetPos + " " + dest_ext.origin + " " + dest_ext.maxs)
				if ( targetPos.x >= dest_ext.origin.x && targetPos.x <= maxs.x &&
					 targetPos.y >= dest_ext.origin.y && targetPos.y <= maxs.y &&
					 targetPos.z >= dest_ext.origin.z && targetPos.z <= maxs.z )
				{
					spots.append(spot)
					// skip = true
					break
				}
			}
			// if ( skip )
				// continue
		}
		
		return spots
	}
	
	function collectReachableTrimpTargets(spot)
	{
		local targets
		if ( hateSentries )
		{			
			collectSentries()
			targets = prodemoknight.SentryList
		}
		else
		{
			targets = AI_Bot_myDemo.FindVisibleThreat(1e30, false)
		}
		
		local targetPos
		local ListOfTargets = []
		foreach (target in targets)
		{
			targetPos = getSentryPos( target )
			foreach ( dest_ext in spot.destination_extent )
			{
				local maxs = dest_ext.maxs + dest_ext.origin
				if ( targetPos.x >= dest_ext.origin.x && targetPos.x <= maxs.x &&
					 targetPos.y >= dest_ext.origin.y && targetPos.y <= maxs.y &&
					 targetPos.z >= dest_ext.origin.z && targetPos.z <= maxs.z )
				{
					// printl("checking extent")
					ListOfTargets.append(target)
					break
				}
			}
		}
		return ListOfTargets
	}
	function collectReachableTrimpTargetsUHHH(spot)
	{
		// if ( hateSentries )
		// {
			local ListOfSentries = []
			
			collectSentries()		// be aware of this, this function is only being called at one place and that place called collectSentries() before this
			foreach ( sentry in prodemoknight.SentryList )
			{
				if ( isTargetWithinTrimpArea( sentry, spot ) )
				{
					ListOfSentries.append(sentry)
				}
			}
			
			return ListOfSentries
		// }
	}
	
	// rcon script prodemoknight.ListOfProDemoknight[0].interface_trimpAtTarget(me(), "spawn " )
	function interface_trimpAtTarget( target = me() , trimpSpot = "tiny_rock")
	{
		if (typeof trimpSpot == "string")
		{
			trimpSpot = rstrip(trimpSpot)
			current_trimpSpot = ListOfSpots[trimpSpot]
		}
		else if (typeof trimpSpot == "table")
		{
			current_trimpSpot = trimpSpot
		}
		
		targetTrimp = target
		changeState( State.GOTOTRIMPSPOT )
	}
	function interface_chargeAtTarget( target = me() )
	{
		// if ( prepareFor_chargeAtTarget_timer.IsValid() )
			// return false
		
		if ( hasCharge && canChargeToTarget( target ) )
		{
			targetTrimp = target
			changeState( State.CHARGEATTARGET )
			
			AI_Bot_myDemo.SnapAt(target)
		
			startCharge()
			local ref = this
			// prepareFor_chargeAtTarget_timer = CreateTimer(@() ref.startCharge(), 0.1)
			
			lenient_TRIMPSTRAFE_timer = CreateTimer(@() ref.changeState( State.IDLE ), 0.1)
			return true
		}
		else
		{
			return false
		}
	}
	function interface_campTele( tele )
	{
		targetTele = tele
		changeState( State.CAMPTELE )
	}
	function evaluateChargeStrat( target, distanceSqr = 1500 * 1500 )
	{
		if ( hasCharge )
		{
			local closestSpot = null
			local closestSpotDistance = distanceSqr
			local distance
			local spotsToTarget = collectReachableTrimpSpotToTarget( target )
			foreach ( spot in spotsToTarget )
			{
				if ( !AI_Bot_myDemo.CanIMoveToThisSpot( spot.start_pos ) )
					continue
				
				distance = (AI_Bot_myDemo.cur_pos - spot.start_pos).LengthSqr()
				if ( distance < closestSpotDistance )
				{
					closestSpot = spot
					closestSpotDistance = distance
				}
			}
			
			
			distance = ( getSentryPos( target ) - AI_Bot_myDemo.cur_pos).LengthSqr()
			if ( closestSpot && distance * 1.5 > closestSpotDistance )
			{
				interface_trimpAtTarget(target, closestSpot)
				return true
			}
			else if ( amIInChargeDistance( target ) )	//distance < 700 * 700
			{
				return interface_chargeAtTarget(target)
			}
		}
		
		return false
	}
	
	function chargeAtTarget_think()
	{
		if ( !targetTrimp || !targetTrimp.IsValid() )
		{
			changeState( State.IDLE )
			return
		}
		
		if ( hOwner.InCond(17) )
		{
			if ( lenient_TRIMPSTRAFE_timer.IsValid() )
				lenient_TRIMPSTRAFE_timer.Destroy()
			
			if ( chargeLevel < 40 )
			{
				if ( targetTrimp.GetClassname() == "player" && targetTrimp.GetPlayerClass() != TF_CLASS_HEAVYWEAPONS)
					should_attack = true
			}
			else
			{
				if ( targetTrimp.GetClassname() == "obj_sentrygun" )
					should_attack = true
				else
					should_attack = false
			}
			
			local cur_eye_ang = hOwner.EyeAngles()
			local targetDir = getSentryPos( targetTrimp ) - AI_Bot_myDemo.cur_pos
			local diffAngleAccelToTar = DiffQAngle( cur_eye_ang, VectorAngles(targetDir) );
			local turn = MIN(fabs(diffAngleAccelToTar), turnRate_perTick);
			if ( diffAngleAccelToTar < 0 )
			{
				cur_eye_ang.y += turn
			}
			else 
			{
				cur_eye_ang.y -= turn
			}
			hOwner.SnapEyeAngles(cur_eye_ang)
		}
		else
		{
			if ( !lenient_TRIMPSTRAFE_timer.IsValid() )
			{
				if ( hOwner.GetFlags() & FL_ONGROUND )
				{
					changeState( State.CHASE )
					return
				}
			}
		}
	}
	
	function goToTrimpSpot(trimpSpot)
	{
		targetTrimp = null
		current_trimpSpot = trimpSpot
		changeState( State.GOTOTRIMPSPOT )
	}
	
	
	function IsTargetCloseEnoughInT( target, timeleft = null, targetRange = 0 )
	{
		if ( !AI_Bot_myDemo.IsVisible(target) )
			return false
			
		
		local targetSpeed = 330
		local toTarget = target.GetOrigin() - AI_Bot_myDemo.cur_pos
		toTarget.Norm()
		local t = timeleft
		
		local targetHalfBounding = target.GetBoundingMaxs().x
		local targetPos = target.GetOrigin()
		local targetVel = target.GetAbsVelocity()
		local offset	= target.GetBoundingMaxs().z - targetHalfBounding
		targetPos.z		+= offset
		
		local targetVelAlong = targetVel.Dot( toTarget * -1 )
		targetVel = toTarget * -1 * targetVelAlong
		local targetG = toTarget * -1 * targetSpeed * 10
		
		local future_targetPos 	//= targetPos + targetVel * t + targetG * t*t * 0.5
		if ( t <= (targetSpeed - targetVelAlong)/(targetSpeed * 10) )
		{
			future_targetPos = targetPos + targetVel * t + targetG * t * t * 0.5
		}
		else
		{
			local distance = targetSpeed * t - pow( (targetSpeed - targetVelAlong), 2 ) / ( 2*(targetSpeed * 10) )
			future_targetPos = targetPos + toTarget * -1 * distance
			
		}
			// fun.hMarker.SetAbsOrigin(future_targetPos)
		
		
		local myVel = hOwner.GetAbsVelocity()
		local myVelAlong = myVel.Dot( toTarget )
		
		local myVel	= toTarget * myVelAlong
		local myPos = AI_Bot_myDemo.cur_eye_pos
		// if ( circumventSpeedCap && circumventByAD43 )
		// {
			// if ( myVel.LengthSqr() > 1000000 )
			// {
				// myVel.Norm()
				// myVel *= 1000
			// }
		// }
		
		// local g		= Vector(0, 0, -800)
		// if (hOwner.GetFlags() & FL_ONGROUND)
		// {
			// g.z = 0
		// }
		local g	= toTarget * maxSpeed * 10
		
		local future_myPos		//= myPos + myVel * t +  g * t*t * 0.5
		if ( t <= (maxSpeed - myVelAlong)/(maxSpeed * 10) )
		{
			future_myPos = myPos + myVel * t + g * t * t * 0.5
		}
		else
		{
			local distance = maxSpeed * t - pow( (maxSpeed - myVelAlong), 2 ) / ( 2*(maxSpeed * 10) )
			future_myPos = myPos + toTarget * distance
			
		}
		
		offset -= targetHalfBounding
		if ( future_myPos.z < future_targetPos.z && future_myPos.z >= future_targetPos.z - offset)
			future_targetPos.z = future_myPos.z
		else if ( future_myPos.z < future_targetPos.z - offset )
			future_targetPos.z -= offset
		
		// local range = meleeRange + targetHalfBounding	// 
		local range = targetRange
		if ( (future_myPos - future_targetPos).LengthSqr() < range * range )
		{
			// we shouldn't do it here but every time this function is called, it does the same thing
			// hOwner.RemoveBotAttribute(SUPPRESS_FIRE)
			//printl("SUPPRESS_FIRE")
		
			return true
		}
		
		return false
	}
	
	function amICloseEnoughInT( target, reverse = false, timeleft = null, targetRange = 0 )
	{
		if ( !AI_Bot_myDemo.IsVisible(target) )
			return false
			
		local t = swingTime
		local g		= Vector(0, 0, -800)
		local myVel = AI_Bot_myDemo.cur_vel * 1
		if (hOwner.GetFlags() & FL_ONGROUND)
		{
			g.z	= 0
			
			if ( AI_Bot_myDemo.cur_speed > maxSpeed )
			{
				myVel.Norm()
				myVel *= maxSpeed
			}
			
		}
		
		local targetHalfBounding = target.GetBoundingMaxs().x
		local targetVel = target.GetAbsVelocity()
		// local range = meleeRange + targetHalfBounding	//
		local targetG = Vector()
		if ( reverse )
		{
			local targetSpeed = 330
			
			local toTarget = target.GetOrigin() - AI_Bot_myDemo.cur_pos
			toTarget.Norm()
			
			myVel	= toTarget
			myVel  *= maxSpeed
			g		= toTarget * maxSpeed * 10
			
			local targetVelAlong = targetVel.Dot( toTarget * -1 )
			// printl(targetVelAlong)
			
			targetVel = toTarget * -1 * targetVelAlong
			// targetVel *= targetSpeed
			targetG = toTarget * -1 * targetSpeed * 10
			
			t = timeleft
			
			range = targetRange
		}
		
		// local targetHalfBounding = target.GetBoundingMaxs().x
		local targetPos = target.GetOrigin()
		// local targetVel = target.GetAbsVelocity()
		local offset	= target.GetBoundingMaxs().z - targetHalfBounding
		targetPos.z		+= offset
		
		local future_targetPos = targetPos + targetVel * t + targetG * t*t * 0.5
		
		// local myVel = hOwner.GetAbsVelocity()
		local myPos = AI_Bot_myDemo.cur_eye_pos
		// if ( circumventSpeedCap && circumventByAD43 )
		// {
			// if ( myVel.LengthSqr() > 1000000 )
			// {
				// myVel.Norm()
				// myVel *= 1000
			// }
		// }
		
		// local g		= Vector(0, 0, -800)
		// if (hOwner.GetFlags() & FL_ONGROUND)
		// {
			// g.z = 0
		// }
		
		local future_myPos = myPos + myVel * t +  g * t*t * 0.5
		//local v = (myVel.x + g.x*t,
		//			myVel.y + g.y*t,
		//			myVel.z + g.z*t)
		
		offset -= targetHalfBounding
		if ( future_myPos.z < future_targetPos.z && future_myPos.z >= future_targetPos.z - offset)
			future_targetPos.z = future_myPos.z
		else if ( future_myPos.z < future_targetPos.z - offset )
			future_targetPos.z -= offset
		
		local range = meleeRange + targetHalfBounding + 20	// 
		if ( (future_myPos - future_targetPos).LengthSqr() < range * range )
		{
			return true
		}
		
		return false
	}
	
	function amICloseEnough( target )
	{
		if ( !AI_Bot_myDemo.IsVisible(target) )
			return false
		
		local targetHalfBounding = target.GetBoundingMaxs().x
		local targetPos = target.GetOrigin()
		local offset	= target.GetBoundingMaxs().z - targetHalfBounding
		targetPos.z		+= offset
		
		
		local myPos = hOwner.EyePosition()
		
		
		
		offset -= targetHalfBounding
		if ( myPos.z < targetPos.z && myPos.z >= targetPos.z - offset)
			targetPos.z = myPos.z
		else if ( myPos.z < targetPos.z - offset )
			targetPos.z -= offset
		
		local range = meleeRange + targetHalfBounding	// 
		
		if ( (myPos - targetPos).LengthSqr() < range * range )
		{
			return true
		}
		
		return false
	}
	
	targetSpeed = 500
	targetDistance = 400
	function amITooFast( targetSpeed, targetDistance, myVel, distanceToTarget )
	{
		// local myVel = hOwner.GetAbsVelocity()
		// myVel.z = 0
		// myVel = myVel.Length()
		
		// local t = timeleft
		// local g = maxSpeed * 10
		// local future_myPos = myPos + myVel * t +  g * t*t * 0.5
		
		if ( myVel < targetSpeed )
			return false
		
		local accel = maxSpeed * 10 * 0.7
		local timeToDecelerate = ( myVel - targetSpeed ) / accel
		local distanceToDecelerate = myVel * timeToDecelerate - accel * timeToDecelerate * timeToDecelerate * 0.5
		// printl("timeToDecelerate and distanceToDecelerate" + timeToDecelerate + " " + distanceToDecelerate)
		if ( distanceToTarget < targetDistance + distanceToDecelerate )
			return true
			
		return false
	}
	function amIInChargeDistance( target )
	{
		local timeToAccelerate = ( maxChargeSpeed + maxSpeed ) / acceleration
		local distanceTravelledWhileAccel = ( maxChargeSpeed * maxChargeSpeed - maxSpeed * maxSpeed ) / ( 2 * acceleration )
		
		local timeRemaining = chargeDuration - timeToAccelerate
		local distanceTravelledAtConstSpeed = timeRemaining * maxChargeSpeed
		
		local targetDir = ( getSentryPos( target ) - AI_Bot_myDemo.cur_pos )
		local distanceToTarget = targetDir.Length()
		
		targetDir.Norm()
		local targetEffectiveSpeed = targetDir.Dot( target.GetAbsVelocity() )
		targetEffectiveSpeed = targetEffectiveSpeed > 0 ? targetEffectiveSpeed : 0
		
		local targetDistance = targetEffectiveSpeed * chargeDuration + distanceToTarget
		if ( targetDistance < distanceTravelledWhileAccel + distanceTravelledAtConstSpeed )
			return true
		
		return false
	}
	
	function simu()
	{
		//simulate_trimp = real
		simulating = true
		//simulate_origin = me().GetOrigin()
		
		prodemoknight.simu(true)
		
	}
	function tptoheight()
	{
		local pos = hOwner.GetOrigin()
		hOwner.SetAbsOrigin(Vector(pos.x, pos.y, me().GetOrigin().z))
		hOwner.SetAbsVelocity(Vector())
		
	}
	
	function moveToSpot(spot, simple_approach = false)
	{
		local targetPos
		if ( typeof spot == "Vector" )
			targetPos = spot
		else
			targetPos = spot.start_pos
		
		local cur_speed_sqr = hOwner.GetAbsVelocity().LengthSqr()
		
		local scale = 1
		// if ( bot_scale != 1 )
			// scale *= bot_scale * bot_scale * 2.5
		
		if ( cur_speed_sqr > 200 && (AI_Bot_myDemo.cur_pos - targetPos).LengthSqr() < 32 * 32 * scale )
		{
			return
		}
		
		if ( cur_speed_sqr > 100)
		{
			if ( !simple_approach )
				return AI_Bot_myDemo.UpdatePathAndMove(targetPos)
			else
			{
				simple_approach_func(spot.approachInstruction, spot.rawin("jump_extent") ? spot.jump_extent : false )
				// printl("move simple")
			}
			moving_time = AI_Bot_myDemo.time
		}
		else
		{
			if (moving_time < AI_Bot_myDemo.time + 0.5)
			{
				// every 0.5s
				local alternate = ( (Time() - moving_time) / 0.5 ).tointeger() % 2 == 0
				
				if ( !alternate )
				{
					local area_start = GetNavArea(AI_Bot_myDemo.cur_pos, 128.0)
					if (!area_start)
						area_start = GetNearestNavArea(AI_Bot_myDemo.cur_pos, 128.0, false, true)
					
					if (!area_start)
					{
						//+printl("houston we have a problem")
						return -1
					}
					
					local randompos = area_start.FindRandomSpot()
					hOwner.GetLocomotionInterface().Approach(randompos, 999)
					//printl("move random")
				}
				else
				{
					local backward = (AI_Bot_myDemo.cur_pos - targetPos)
					backward.Norm()
					
					hOwner.GetLocomotionInterface().Approach(AI_Bot_myDemo.cur_pos + backward * 100, 999)
					//printl("move opposite")
				}
			}
		}
	}
	
	function startAttack(bluff = false)
	{
		if ( NetProps.GetPropFloat(hWeapon, "m_flNextPrimaryAttack") > AI_Bot_myDemo.time )
			return
		
		// printl("startAttack called")
		my_point_of_attack = AI_Bot_myDemo.time
		no_SUPPRESS_FIRE = true
		hOwner.RemoveBotAttribute(SUPPRESS_FIRE)
		hOwner.PressFireButton(0.015)
		// wait_1_frame = true
		
		forcedAttack = false
		
	}
	function startCharge( jump = false )
	{
		if ( !hasCharge )
			return false
		
		// 	does nothing because the level doesn't go below
		// 100 on the next tick so it will be set to true again
		// 	ideally we should delay the check here but i'm feeling optimizing
		// today so imma handle the two states that uses the charge
		// CHARGEATTARGET, TRIMPSTRAFE
		hasCharge	= false
		// okay i finally made a check here
		persistent_hasCharge_check = 8
		
		// chargeLevel	= 0
		if (jump)
			hOwner.GetLocomotionInterface().Jump()
		
		// NetProps.SetPropFloat(hOwner, "m_Shared.m_flChargeMeter", 100)
		// requestCharge = true
		// hOwner.PressAltFireButton(0.2)
		
		no_SUPPRESS_FIRE = true
		hOwner.RemoveBotAttribute(SUPPRESS_FIRE)
		hOwner.PressAltFireButton(0.015)
		// wait_1_frame = true 
		
		// wait_x_frame = 2
		return true
	}
	
	function useTrimpSpot(spot)
	{
		if ( !spot.rawin("occupied") )
		{
			spot.occupied <- false
		}
	
		if ( !arrived )
		{
			local closestThreat
			if ( !hateSentries )
			{
				closestThreat = AI_Bot_myDemo.FindClosestThreat(400 * 400, false)
			}
			else
			{
				collectSentries()
				closestThreat = FindClosestSentry(400 * 400)
			}
			if ( closestThreat )
			{
				changeState( State.CHASE )
				spot.occupied = false
				return false
			}
			
			moveToSpot( spot , spot.rawin("approachInstruction") )
			///
		
			if ( !hasCharge )
				return false
			
			if ( spot.occupied )
				return false
			
			// printl(( spot.start_pos - AI_Bot_myDemo.cur_pos ).LengthSqr())
			local scale = 1
			if ( bot_scale != 1 )
			{
				if ( spot.rawin( "buster_scale" ) )
					scale *= bot_scale * bot_scale * spot.buster_scale
				else
					scale *= bot_scale * bot_scale * 5
			}
			
			if ( ( spot.start_pos - AI_Bot_myDemo.cur_pos ).LengthSqr() < 90 * scale )	
			{
				if ( !targetTrimp || !targetTrimp.IsValid() )
				{
					local ListOfTargets = collectReachableTrimpTargets(spot)
					if ( !ListOfTargets.len() )
					{
						// changeState( State.IDLE )
						spot.occupied = false
						arrived = false
						prepare = false
						return null
					}
					
					/// i should add a function that choose the best target
					// if ( hateSentries )
					// {
						// foreach ( target in ListOfTargets )
						// {
							// if ( target.GetClassname() == "obj_sentrygun" )
							// {
								// targetTrimp = target
								// break
							// }
						// }
					// }
					
					// if ( !targetTrimp )
					// {
						targetTrimp = ListOfTargets[0]
					// }
				}
				
				// spot.occupied = true
				// printl("i have reached my destination, prepare myself")
				arrived = true
				prepare = true
				//targetPos = null
				
				local angle
				if ( !spot.start_dir && !spot.start_dir_maxs )
				{
					angle = spot.start_dir_mins
				}
				else
				{
					angle = spot.start_dir
					
					local optimalAngleOffset = FindStartAngleWrapper( spot, getSentryPos( targetTrimp ) )
					if ( optimalAngleOffset == null )
					{
						//+printl("can't reach..................")
						arrived = false
						prepare = false
						return null
					}
					
					if ( spot.start_dir_mins && spot.start_dir_maxs )
					{
						if ( optimalAngleOffset >= 0)
						{
							local maxdiff = DiffQAngle(spot.start_dir_maxs, spot.start_dir)
							//+printl("min: " + maxdiff + " " + optimalAngleOffset)
							optimalAngleOffset = MIN(maxdiff, optimalAngleOffset)
						}
						else
						{
							local maxdiff = DiffQAngle(spot.start_dir_mins, spot.start_dir)
							//+printl("max: " + maxdiff + " " + optimalAngleOffset)
							optimalAngleOffset = MAX(maxdiff, optimalAngleOffset)
						}
					}
					
					angle.y += optimalAngleOffset
				
				}
				hOwner.SnapEyeAngles(angle)
				// printl("bot's angle " + angle.y)
				//printl("recorded angle " + prodemoknight.simulated_dir_best[0].y)
				
				hOwner.SetAbsVelocity(Vector())
				
				if ( true )
				{
				if ( !RandomInt(0,9) ) 
					SetPropBool(hOwner, "m_bViewingCYOAPDA", true)
				else if ( bot_type == "bot_pro_busterknight" )
					SetPropBool(hOwner, "m_bViewingCYOAPDA", true)
				
				local ref = this
				CreateTimer(function() {
					ref.startCharge( true )
					ref.prepare = false
					SetPropBool(ref.hOwner, "m_bViewingCYOAPDA", false)
					if ( ref.circumventByAD43 )
						ref.timeToStopPhasingOtherDemos = ref.AI_Bot_myDemo.time + 1.5
					
					//ref.simu()
					//prodemoknight.simu(true)
				}, 0.4)
				}
				
			}
			//else if ( ( spot.start_pos - AI_Bot_myDemo.cur_pos ).LengthSqr() < 10000 )
		}
			
		if ( prepare )
		{
			//local forward = AI_Bot_myDemo.cur_pos + AI_Bot_myDemo.cur_eye_fwd * 10
			if ( !spot.extraMove )
				return false
			
			local forward = (spot.start_pos - AI_Bot_myDemo.cur_pos)
			forward.Norm()
			hOwner.GetLocomotionInterface().Approach(spot.start_pos + forward * 100, 999)
			// SetPropInt(hOwner, "m_afButtonForced", IN_FORWARD)
		}
		
		if ( arrived && !prepare )
		{
			// SetPropInt(hOwner, "m_afButtonForced", 0)
			arrived = false
			spot.occupied = false
			return true
		}
		return false
		
	}
	
	max_zvel = 0
	max_zvel_buffer_timer = CreateTimer(@() {}, 0.1)
	max_zvel_destroy_timer = CreateTimer(@() {}, 0.1)
	function startOfCharge()
	{
		if ( hOwner.InCond(17) )
		{
			if ( !isCharging )
			{
				isCharging = true
				timeStart = Time()
			}
			
		}
		else
		{
			isCharging = false
		}
	}
	function refine()
	{
		local hor_vel	= hOwner.GetAbsVelocity()
		local curr_zvel = hor_vel.z
		hor_vel.z = 0
		if ( curr_zvel > max_zvel )
		{
			
			local z_height = this.hOwner.GetOrigin().z
			local curr_time = Time() - timeStart
			
			max_zvel = curr_zvel
			
			
			if ( max_zvel_buffer_timer.IsValid() )
			{
				max_zvel_buffer_timer.Destroy()
			}
			if ( max_zvel_destroy_timer.IsValid() )
			{
				max_zvel_destroy_timer.Destroy()
			}
			max_zvel_buffer_timer = CreateTimer(function() {
				//+printl("max_zvel: " + curr_zvel)
				//+printl("z_height: " + z_height)
				//+printl("time to climb: " + curr_time)
				//+printl("horizontal vel: " + hor_vel.Length())
			}, 1)
			
			local thisref = this
			max_zvel_destroy_timer = CreateTimer(function() thisref.max_zvel = 0, 2)
		}
	}
	
	compare_timeout = CreateTimer(@() {}, 0.1)
	function compare()
	{
		if ( compare_timeout.IsValid() )
			return
		
		if (simulated_i >= simulated_len)
		{
			simulated_i = 0
			compare_timeout = CreateTimer(@() {}, 2)
		}
		
		//+printl("dir diff: " + DiffQAngle(simulated_dir_best[simulated_i], hOwner.EyeAngles()))
		
		//hOwner.SnapEyeAngles(simulated_dir_best[simulated_i])
		//me().SnapEyeAngles(simulated_dir_best[simulated_i])
		//if ( !simulate_trimp )
		//{
		//	me().SetAbsOrigin(simulate_origin + simulated_pos_best[simulated_i])
		//	me().SetAbsVelocity(Vector())
		//}
		simulated_i++
	}
	
	vel_dir_prev = null
	ang_prev = null
	function testTurn()
	{
		if ( hOwner.InCond(17) )
		{
			if ( !isCharging )
			{
				timeStart = Time()
				startpos = hOwner.EyeAngles().y
			}
			isCharging = true
			
			local ang = hOwner.EyeAngles().y
			local veldir = VectorAngles(hOwner.GetAbsVelocity()).y
			if ( ang_prev != null )
			{
				local result = ang - ang_prev
				local result2 = veldir - vel_dir_prev
				//+printl("bot QAngle turn rate: " + result)
				//+printl("bot QAngle vel dir change: " + result2)
			}
			ang_prev	= ang
			//vel_dir_prev = veldir
			
			timeStop = Time()
		}
		
		else if ( false )
		{
			isCharging = false
			if ( timeStop != 0 )
			{
				//+printl("dur: " + (timeStop - timeStart))
				//+printl((startpos - ang_prev)/ (timeStop - timeStart))
				timeStop = 0
			}
		}
		return -1
		
	}
	
	function GetToPosition(target = findRandomPlayer())
	{
		movingToPosition = true
		targetTrimp = target
		targetPos = Vector(-127.176323, 4637.787598, -692.257507)
		hOwner.SnapEyeAngles(QAngle(2.508011, -96.109344, 0))
		//hOwner.SnapEyeAngles(QAngle(0, 10, 0))
		//rcon script foreach ( cord in prodemoknight.ListOfProDemoknight[0].EndCords) printl(cord)
	}
	
	function charge()
	{
		NetProps.SetPropFloat(hOwner, "m_Shared.m_flChargeMeter", 100)
		requestCharge = true
	}
	function lookat()
	{
		AI_Bot_myDemo.OnUpdate()
		AI_Bot_myDemo.SnapAt(me())
	}
	
	
	vels = []
	timeStart = 0
	timeStop = 0
	isCharging = false
	startpos = Vector()
	initialSpeed = 0
	actual_distance_prev = 0
	distance_prev = 0
	function calculateDistanceToTarget(timeStart)
	{
		local distance
		local delta = Time() - timeStart
		//printl(delta + " " + maxChargeSpeed + " " + initialSpeed + " " + acceleration)
		if ( delta <= (maxChargeSpeed - initialSpeed)/acceleration)
		{
			distance = initialSpeed * delta + (acceleration * delta * delta)/ 2
		}
		else
		{
			distance = maxChargeSpeed * delta - pow( (maxChargeSpeed - initialSpeed), 2 ) / ( 2*acceleration )
		}
	}
	
	function calculateDistanceToTarget_think()
	{
		if (hOwner.InCond(17))
		{
			if ( !isCharging )
			{
				timeStart = Time()
				startpos = AI_Bot_myDemo.cur_pos
				initialSpeed = hOwner.GetAbsVelocity().Length()
			}
			
			isCharging = true
			
			local speed = hOwner.GetAbsVelocity()
			speed.z = 0
			
			if ( speed.Length() < 700 )
			{
				vels.append(speed.Length())
				timeStop = Time()
			}
			
			local distance
			local delta = Time() - timeStart
			//printl(delta + " " + maxChargeSpeed + " " + initialSpeed + " " + acceleration)
			if ( delta <= (maxChargeSpeed - initialSpeed)/acceleration)
			{
				distance = initialSpeed * delta + (acceleration * delta * delta)/ 2
			}
			else
			{
				distance = maxChargeSpeed * delta - pow( (maxChargeSpeed - initialSpeed), 2 ) / ( 2*acceleration )
			}
			
			
			local actual_distance = ( AI_Bot_myDemo.cur_pos - startpos ).Length()
			//+printl("distance: " + actual_distance + " " + distance)
			
			
			local del0 = actual_distance - actual_distance_prev
			local del1 = distance - distance_prev
			local del2 = actual_distance - distance
			//+printl("delta: " + del0 + " " + del1 )
			//+printl("delta2: " + del2 )
			//+printl("")
			actual_distance_prev = actual_distance
			distance_prev = distance
			
		}
		else
		{
			isCharging = false
			if ( vels.len() > 0 )
			{
				//+printl("vel0: " + vels[0])
				//+printl("dur: " + (timeStop - timeStart))
				//+printl("huhuh" + (vels[vels.len() - 1] - vels[0])/ (timeStop - timeStart))
				vels.clear()
				
			}
		}
		return -1
		
	}
	
	lastJukeTarget = null
	jukeTargetFacing = []
	juke_comparePastTick = 0
	function juke( target )
	{
		local targetPos		= target.GetOrigin()
		local current_angle	= target.EyeAngles().y
		local current_tick	= GetPropInt(hOwner, "m_nSimulationTick")
		if ( lastJukeTarget != target )
		{
			lastJukeTarget = target
			jukeTargetFacing.clear()
		}
		// else
		// {
			jukeTargetFacing.append([current_angle, current_tick])
		// }
	
		local juke_distance = ( hOwner.GetBoundingMaxs().x + target.GetBoundingMaxs().x ) * 1.8
		if ( (AI_Bot_myDemo.cur_pos - targetPos).LengthSqr() < juke_distance * juke_distance )
		{
			local move_dir = Vector()
			move_dir.x = 0.5
			while ( true )
			{
				if ( jukeTargetFacing.len() == 1 )
				{
					AI_Bot_myDemo.UpdatePathAndMove(targetPos)
					break
				}
				
				if ( jukeTargetFacing[0][1] < current_tick - juke_comparePastTick )
				{
					jukeTargetFacing.remove(0)
					continue
				}
				else
				{
					if ( DiffQAngle(current_angle, jukeTargetFacing[0][0]) > 0 )
					{
						move_dir.y = 1
					}
					else
					{
						move_dir.y = -1
					}
					break
				}
			}
			
			local right = RotatePosition(Vector(), VectorAngles(move_dir), AI_Bot_myDemo.cur_eye_fwd)
			AI_Bot_myDemo.locomotion.Approach(AI_Bot_myDemo.cur_pos + right, 999)
			// printl("YEAAA!!!")
		}
		else
		{
			AI_Bot_myDemo.UpdatePathAndMove(targetPos)
		}
		
		
		
	}
	
	function GOTOTRIMPSPOT_Think()
	{
		if ( findTarget_wait + 5 < AI_Bot_myDemo.time  )
		{
			findTarget_wait = AI_Bot_myDemo.time
			if ( !collectReachableTrimpTargets(current_trimpSpot).len()
				&& !( hateSentries && collectReachableTrimpTargetsUHHH(current_trimpSpot).len() )
			)
			{
				local prev_trimpSpot = current_trimpSpot
				if ( findTarget() )
				{
					if ( prev_trimpSpot != current_trimpSpot && prev_trimpSpot.rawin("occupied"))
						prev_trimpSpot.occupied = false
						
					// arrived = false
					// prepare = false
					
					return
				}
			}
		}
		
		if ( !(hOwner.GetFlags() & FL_ONGROUND) && hOwner.InAirDueToKnockback() )
		{
			changeState( State.AIRBORNE )
			return
		}
		
		
		local result = useTrimpSpot( current_trimpSpot )
		if ( result )
		{
			changeState( State.TRIMPSTRAFE )
			// changeState( State.SIMULATETRIMP )
			//+printl("Start strafing..........")
			
			local ref = this
			lenient_TRIMPSTRAFE_timer = CreateTimer(@() ref.changeState( State.IDLE ), 0.5)
		}
		else if ( result == null )
			changeState( State.IDLE )

	}
	
	function AIRSTRAFE_Think()
	{
		if ( !targetTrimp || !targetTrimp.IsValid() )
		{
			// if ( !targetSentry || !targetSentry.IsValid() )
			// {
				changeState( State.IDLE )
				return
			// }
		}
		
		if ( hOwner.GetFlags() & FL_ONGROUND )
		{
			if ( m_detonateTimer.IsValid() )
			{
				changeState( State.DETONATING )
				return
			}
			interface_fightThisSentry( targetTrimp )
		}
	
		local vel = hOwner.GetAbsVelocity()
		local dir = VectorAngles( vel )
		NetProps.SetPropVector(hOwner, "pl.v_angle", dir + Vector())
		hOwner.SnapEyeAngles(dir)
		
		
		local move_dir = Vector()
		
		local targetPos = getSentryPos( targetTrimp )
		targetPos.z += targetTrimp.GetBoundingMaxs().z
		
		
		local timeToZ = calcTimeToTargetZ(AI_Bot_myDemo.cur_pos.z, targetPos.z, vel.z, sv_gravity)
		if ( timeToZ == null)
		{
			interface_fightThisSentry( targetTrimp )
			return
		}
		vel.z = 0
		local vel_length = vel.Length()
		
		local targetDir = targetPos - AI_Bot_myDemo.cur_pos
		targetDir.z = 0
		
		local distanceToTarget = targetDir.Length()
		local distanceTravelInT = vel_length * timeToZ
		// local timeToXY = calcTimeToTargetZ(0, distanceToTarget, vel_length, -maxSpeed * 10 )
		// if ( distanceTravelInT > distanceToTarget * 1.2 )
		
		if ( amITooFast(targetSpeed, targetDistance, vel_length, distanceToTarget) || ( distanceTravelInT > distanceToTarget && distanceTravelInT < targetDistance && vel_length > 100 ))
		{
			// printl("overshoot")
			move_dir.x = -1
			// move_dir = Vector( -1, 0, 0)
		}
		
		if ( side_of( vel, targetDir ) > 1 )
			move_dir.y = 1
		else if ( side_of( vel, targetDir ) < -1 )
			move_dir.y = -1
		
		if ( timeToZ < 2 && bot_type == "bot_pro_busterknight" )
			StartDetonate()
		
		local right = RotatePosition(Vector(), VectorAngles(move_dir), AI_Bot_myDemo.cur_eye_fwd)
		AI_Bot_myDemo.locomotion.Approach(AI_Bot_myDemo.cur_pos + right, 999)
	}
	
	wait_for_crit = false
	function TRIMPSTRAFE_Think()
	{
		// air strafing think
		//compare()
		
		
		if ( wait_for_crit && chargeLevel > 40 )
		{
			should_attack = false
		}
		else
			should_attack = true
		
		if ( hOwner.InCond(17) )
		{
			// printl("compare: " + save_angle + " " + hOwner.EyeAngles())
		
			local targetPos
			local isFightingSentry = false
			if ( !targetTrimp || !targetTrimp.IsValid() )
			{
				if ( !targetSentry || !targetSentry.IsValid() )
				{
					// printl("we dont have a target somehow")
					changeState( State.IDLE )
					return
				}
				else
				{
					isFightingSentry = true
					targetPos = getSentryPos( targetSentry )
					targetPos.z += targetSentry.GetBoundingMaxs().z
					
					targetTrimp = targetSentry
				}
			
			}
			else
			{
				if ( targetTrimp.GetClassname() == "obj_sentrygun" )
				{
					isFightingSentry = true
					targetPos = getSentryPos( targetTrimp )
					targetPos.z += targetTrimp.GetBoundingMaxs().z
				}
				else
				{
					targetPos = targetTrimp.GetOrigin()
				}
			}
			
			if ( lenient_TRIMPSTRAFE_timer.IsValid() )
				lenient_TRIMPSTRAFE_timer.Destroy()
			
			local vel = hOwner.GetAbsVelocity()
			if ( isFightingSentry )
			{
				local timeToZ = calcTimeToTargetZ(AI_Bot_myDemo.cur_pos.z, targetPos.z, vel.z, sv_gravity)
				if ( timeToZ != null)
				{
					if ( AI_Bot_myDemo.cur_pos.z > current_trimpSpot.z_height + 20
						&& timeToZ < 2
						&& amICloseEnoughInT( targetTrimp, false, timeToZ )
						&& bot_type == "bot_pro_busterknight"
					)
						StartDetonate()
				
					local targetDir = targetPos - AI_Bot_myDemo.cur_pos
					targetDir.z = 0
					vel.z = 0
					
					local distanceToTarget = targetDir.Length()
					local distanceTravelInT = vel.Length() * timeToZ
					// if ( distanceTravelInT > distanceToTarget * 2 )
					if ( amITooFast(targetSpeed, targetDistance, vel.Length(), distanceToTarget) )
					{
						startAttack()
						changeState( State.AIRSTRAFE )
					}
					
				}
			}
			vel.z = 0
			
			// CompareSimulation_Think()
			
			if ( vel.Length() >= maxChargeSpeed - 1 || current_trimpSpot.simplejump )
			{
				local result = CalculateOptimalAngle_LimitedTurn( targetPos, AI_Bot_myDemo.cur_pos, vel, AI_Bot_myDemo.cur_eye_ang )
				local cur_eye_ang = AI_Bot_myDemo.cur_eye_ang + QAngle()
				cur_eye_ang.y = result
				
				CleanQAngle( cur_eye_ang )
				hOwner.SnapEyeAngles(cur_eye_ang)
			}
			
			//printl(vel.Length())
		}
		else
		{
			if ( !lenient_TRIMPSTRAFE_timer.IsValid() )
			{
				if ( hOwner.GetFlags() & FL_ONGROUND )
				{
					if ( m_detonateTimer.IsValid() )
					{
						changeState( State.DETONATING )
						return
					}
					changeState( State.CHASE )
				}
					// changeState( State.IDLE )
				else if ( hateSentries )
					changeState( State.AIRSTRAFE )
			}
		}
	}
	
	function CalculateOptimalAngle_LimitedTurn( targetPos, cur_pos, cur_vel, cur_dir )
	{
		local targetDir = targetPos - cur_pos
		local diffAngleVelTar = DiffQAngle( VectorAngles(cur_vel), VectorAngles(targetDir) );
		local diffAngleVelTar_PostSimulation
		
		local sv_accelerate	= 10
		local pos = Vector() + cur_pos
		local vel = Vector() + cur_vel
		local dir = Vector() + cur_dir
		// wishDir = dir.Forward();
		// wishDir.Norm();
		
		// if ( fabs(cur_dir.y) > 180 )
		// {
			// printl("cur_dir is larger than 180: " + cur_dir.y)
		// }
		
		if ( fabs(diffAngleVelTar) < 0.05 )
		{
			// printl("dead on ==============================")
			return cur_dir.y
		}
		else if ( diffAngleVelTar < 0 )
			dir.y += turnRate_perTick
		else
			dir.y -= turnRate_perTick
		
		
		local wish_speed = maxChargeSpeed
		//if ( wish_speed > maxChargeSpeed )
		//	wish_speed = maxChargeSpeed
		local wishDir = dir.Forward()
		
		local count = 0
		if ( fabs(diffAngleVelTar) < 20 )
		while ( true )
		{
			// wishDir = dir.Forward();
			// wishDir.Norm();
		
			local current_speed = vel.Dot(wishDir)
			local add_speed = wish_speed - current_speed
			if ( add_speed > 0 )
			{
				local accel_speed = maxChargeSpeed * sv_accelerate * tickInterval
				if ( accel_speed > add_speed )
					accel_speed = add_speed
				
				vel += wishDir * accel_speed;
			}
			else	// finish without changing side
			{
				break
			}
			
			pos += vel * tickInterval;
			
			targetDir = targetPos - pos
			diffAngleVelTar_PostSimulation = DiffQAngle( VectorAngles(vel), VectorAngles(targetDir) );
			
			count++
			if ( count == 15)
			{
				//+printl("limit reached")
				break
			}
			
			if ( diffAngleVelTar * diffAngleVelTar_PostSimulation < 0 )	// crosses
			{
				// printl("crosses after: " + count + "\n diffAngleVelTar: " + diffAngleVelTar + "\n diffAngleVelTar_PostSimulation: " + diffAngleVelTar_PostSimulation)
				
				current_speed = cur_vel.Dot(cur_dir.Forward())
				add_speed = wish_speed - current_speed
				// printl("-------------- add_speed: " + add_speed)
				if ( add_speed < 1)		// basically no turn with no input its safe to adjust here
				{
					// adding limit
					if ( fabs(diffAngleVelTar) > turnRate_perTick )
					{
						if ( diffAngleVelTar > 0 )
							return cur_dir.y + turnRate_perTick
						else
							return cur_dir.y - turnRate_perTick
					}
					return cur_dir.y - diffAngleVelTar
				}
				
				
				return cur_dir.y
			}
		}
		
		// printl("the correct direction is: " + dir.y)
		return dir.y
		
	}
	
	function collectAllPlayers()
	{
		if ( prodemoknight.hasCheckedEveryoneThisTick )
			return
		
		prodemoknight.hasCheckedEveryoneThisTick = true
	
		prodemoknight.PlayerList.clear()
		prodemoknight.PlayerList = findAllPlayer()
	}
	
	function OnTargetDeath( target )
	{
		if ( !target.IsValid() || AI_Bot_ProDemoknight.IsAlive(target) )
			return false
		
		collectSentries()
		local closestSentry = FindClosestSentry(1000 * 1000)
		
		if ( closestSentry )
		{
			// printl("i fught")
			interface_fightThisSentry( closestSentry )
			return true
		}
	}
	bug_count = 0
	function getSentryPos( sentry )
	{
		if ( !sentry.IsValid() )
		{
			bug_count += 1
			//+printl("lets take a shot every time this happens: " + bug_count)
			return Vector()
		}
		
		local rawpos = sentry.GetOrigin()
		if ( sentry.GetClassname() != "obj_sentrygun" )
			return rawpos
		
		if ( GetPropBool( sentry, "m_bCarried") )
			return getSentryOwnerPos( sentry )
		
		if ( !GetPropInt( sentry, "m_iState") )	// == 0
		{
			if ( !rawpos.LengthSqr() )			// == Vector()
				return getSentryOwnerPos( sentry )
			else
				return rawpos
		}
		
		return rawpos
	}
	function getSentryOwnerPos( sentry )
	{
		local carrier = GetPropEntity( sentry, "m_hBuilder")
		if ( carrier )
		{
			// printl(carrier.GetOrigin())
			return carrier.GetOrigin()
		}
		else
		{
			//+printl("WARNING!!!!!!!!!!!!!!!!!!!!: no carrier?")
			return Vector()
		}
	}
	function collectTelies()
	{
		if ( prodemoknight.hasCheckedTeliesThisTick )
			return
			
		prodemoknight.TeleList.clear()
		local tele = FindByClassname(null, "obj_teleporter")
		
		while (tele)
		{
			if ( !tele.IsValid() ||
				tele.GetTeam() == AI_Bot_myDemo.team ||
				GetPropInt(tele, "m_iState") < 2 ||
				GetPropInt(tele, "m_iObjectMode") != 1
				)
			{
				tele = FindByClassname( tele, "obj_teleporter" )
				continue
			}
			else
			{
				prodemoknight.TeleList[tele] <- false
				tele = FindByClassname( tele, "obj_teleporter" )
			}
			
			
			
		}
		
		prodemoknight.hasCheckedTeliesThisTick = true
	}
	function collectSentries()
	{
		if ( prodemoknight.hasCheckedSentriesThisTick )
			return
		
	
		prodemoknight.SentryList.clear()
		local sentry = FindByClassname(null, "obj_sentrygun")
		
		while (sentry)
		{
			if ( !sentry.IsValid() || sentry.GetTeam() == AI_Bot_myDemo.team )
			{
				sentry = FindByClassname( sentry, "obj_sentrygun" )
				continue
			}
			else
			{
				prodemoknight.SentryList.append( sentry )
				sentry = FindByClassname( sentry, "obj_sentrygun" )
			}
			
		}
		
		prodemoknight.hasCheckedSentriesThisTick = true
	}
	function FindClosestTele( closestTeleDistanceSqr = 1e30 )
	{
		local closestSentry
		local distance
		// collectTelies()
		foreach ( sentry in prodemoknight.TeleList.keys() )
		{
			// printl("theres a sentry")
			// if (  )
			
			distance = (getSentryPos( sentry ) - AI_Bot_myDemo.cur_pos).LengthSqr()
			if ( distance < closestTeleDistanceSqr )
			{
				closestSentry = sentry
				distance = closestTeleDistanceSqr
			}
		}
		return closestSentry
		
	}
	function FindClosestSentry( closestSentryDistanceSqr = 1e30 )
	{
		local closestSentry
		local distance
		// collectSentries()
		foreach ( sentry in prodemoknight.SentryList )
		{
			// printl("theres a sentry")
			// if (  )
			
			distance = (getSentryPos( sentry ) - AI_Bot_myDemo.cur_pos).LengthSqr()
			if ( distance < closestSentryDistanceSqr )
			{
				closestSentry = sentry
				distance = closestSentryDistanceSqr
			}
		}
		return closestSentry
		
	}
	function trimpToSentry( sentry )
	{
		changeState( State.CIRCLESENTRY )
		targetSentry = sentry
		targetTrimp = null
	}
	function interface_fightThisSentry( sentry, DoNotChangeState = false )
	{
		local state
		if ( bot_type == "bot_pro_busterknight" )
		{
			if ( m_detonateTimer.IsValid() )
				state = State.DETONATING
			else
				state = State.BUSTER
		}
		else
			{ state = State.CIRCLESENTRY }
		
		targetSentry = sentry
		should_attack = true
		
		if ( DoNotChangeState )
			return state
		else
			changeState( state )
	}
	
	forceCrouch = false
	function fightSentry_think()
	{
		if ( !targetSentry.IsValid() )
		{
			changeState( State.IDLE )
			forceCrouch = false
			SetPropInt(hOwner, "m_afButtonForced", 0)
			return
		}
		should_attack = true
		
		hOwner.RemoveCond(7)	// do not taunt when there is a sentry nearby
		
		local sentryPos = getSentryPos( targetSentry )
		sentryPos.z 	+= targetSentry.GetBoundingMaxs().z
		
		// fun.hMarker.SetAbsOrigin(sentryPos)
		// AI_Bot_myDemo.OnUpdate()
		//if ( (getSentryPos( targetSentry ) - AI_Bot_myDemo.cur_pos).LengthSqr() > 100 )
		
		if ( sentryPos.z - 5 < AI_Bot_myDemo.cur_pos.z && (sentryPos - AI_Bot_myDemo.cur_pos).LengthSqr() < 64 * 64 )
		{
			//printl("arrived")
			if ( !forceCrouch )
			{
				forceCrouch = true
				SetPropInt(hOwner, "m_afButtonForced", IN_DUCK)
			}
			
			//rcon script me().SnapEyeAngles(VectorAngles(Vector(1,0,0)));rcon script me().SetAbsOrigin(prodemoknight.prodemoknight.SentryList[0].GetOrigin() + Vector(0,0,67))
			// at dir(1,0,0) bone 3 y is 89.983604
			// -> +90 offset
			//prodemoknight.SentryList[0].GetBoneAngles(3)
			local rotation = targetSentry.GetBoneAngles(3).y + 90
			if ( rotation > 180)
				rotation -= 360
			else if ( rotation < -180)
				rotation += 360
			
			local offset = RotatePosition( Vector(), QAngle(0, rotation, 0), Vector(20, 0, 0) )
			
			if ( (sentryPos + offset - AI_Bot_myDemo.cur_pos).LengthSqr() > 5*5 )
				hOwner.GetLocomotionInterface().Approach(sentryPos + offset, 9999)
			
		}
		else	// ( sentryPos.z - 5 > AI_Bot_myDemo.cur_pos.z || (sentryPos - AI_Bot_myDemo.cur_pos).LengthSqr() > 32 * 32 )
		{
			AI_Bot_myDemo.UpdatePathAndMove( sentryPos )
			if ( forceCrouch )
			{
				forceCrouch = false
				SetPropInt(hOwner, "m_afButtonForced", 0)
			}
			
			if ( hasCharge && amIInChargeDistance( targetSentry ) )
				interface_chargeAtTarget( targetSentry )
		}
		
		// if ( amICloseEnoughInT( targetSentry ) )
		// {
			// hOwner.SnapEyeAngles(VectorAngles(sentryPos - AI_Bot_myDemo.cur_eye_pos))
			// hOwner.PressFireButton(0.2)
		// }
	}
	
	function buster_think()
	{
		
		if ( !targetSentry || !targetSentry.IsValid() )
		{
			changeState( State.IDLE )
			return
		}
		
		if ( findTarget_wait + 0.5 < AI_Bot_myDemo.time  )
		{
			if ( hasCharge && evaluateChargeStrat( targetSentry, 100000 * 100000 ) )
				return
			
			collectSentries()
			targetSentry = FindClosestSentry(1e30)
			
			findTarget_wait = AI_Bot_myDemo.time
		}
		
		
		// if ( hOwner.GetFlags() & FL_ONGROUND )
		// {}
		// else
		// {
			// printl("UUHHHHHHHHHHHHHHHMMMMMMMMMMMMMMMM")
			// changeState( State.AIRSTRAFE )
			// return
		// }
		
		// local save = getSentryPos( targetSentry )
		// save.z += 5
		// me().SetAbsOrigin(save)
		
		AI_Bot_myDemo.UpdatePathAndMove( getSentryPos( targetSentry ) )
		
	}
	function CAMPTELE_think()
	{
		if ( !targetTele || !targetTele.IsValid() || GetPropInt(targetTele, "m_iState") < 2 )
		{
			targetTele = null
			changeState( State.IDLE )
			return
		}
		
		AI_Bot_myDemo.SnapAt( targetTele )
		
		local telePos	= getSentryPos( targetTele )
		local toTarget	= telePos - AI_Bot_myDemo.cur_pos
		toTarget.z = 0
		local distanceSqr	= toTarget.LengthSqr()
		toTarget.Norm()
		
		
		if ( distanceSqr > 200 * 200 )
		{
			// if ( distanceSqr < 80 * 80 && toTarget.Dot( hOwner.GetAbsVelocity() ) > 100 )
			// {
				// local backward = toTarget * -100
				// AI_Bot_myDemo.UpdatePathAndMove( AI_Bot_myDemo.cur_pos + backward )
			// }
			// else
			// {
				// AI_Bot_myDemo.UpdatePathAndMove( telePos )
			// }
			moveToSpot( telePos, false )
		}
		else
		{
			local backward = toTarget * -80
			local movehere = telePos + backward
			telePos.z = AI_Bot_myDemo.cur_pos.z
				
			if ( hOwner.GetAbsVelocity().Length() > 100 )
			{}
			else if ( ( movehere - AI_Bot_myDemo.cur_pos ).LengthSqr() > 32 * 32 )	// 90
			{
				moveToSpot( movehere, false )
			}
			else if ( ( telePos - AI_Bot_myDemo.cur_pos ).LengthSqr() < 70 * 70 )
			{
				AI_Bot_myDemo.UpdatePathAndMove( movehere + backward, false )
			}
		}
		
	}
	
	function AVOID_Think()
	{
		// local targetAvoid = AI_Bot_myDemo.FindClosestThreat(3000 * 3000, false)
		if ( !AI_Bot_myDemo.IsAlive(targetAvoid) || !targetAvoid.InCond(40) || AI_Bot_myDemo.FindClosestThreat(6000 * 6000, false) != targetAvoid )
		{
			changeState( State.CHASE )
			return
		}
		
		// local closestThreat_weapon = targetAvoid.GetActiveWeapon()
		
		local targetRange = targetAvoid.GetActiveWeapon().GetAttribute("is_a_sword", 48 ) + hOwner.GetBoundingMaxs().x + 36
		local backward = (AI_Bot_myDemo.cur_pos - targetAvoid.GetOrigin())
		local distanceSqr = backward.LengthSqr()
		backward.Norm()
		
		local canTargetAttackMeIn02 = IsTargetCloseEnoughInT(targetAvoid, swingTime, targetRange )
		if ( canTargetAttackMeIn02 )
		{
			// printl("hes dangerous avoid him")
			AI_Bot_myDemo.locomotion.Approach( AI_Bot_myDemo.cur_pos + backward * 100 , 999)
		}
		// local look_dir = RotatePosition(Vector(), QAngle(0,90,0), backward * -1)
		hOwner.SnapEyeAngles(VectorAngles(backward * -1))
	}
	
	function CHASE_Think()
	{
		if ( !isChasing )
		{
			CHASElastSeen = AI_Bot_myDemo.time
			isChasing = true
		}
		else if ( CHASElastSeen + 5 < AI_Bot_myDemo.time )
		{ 
			changeState( State.IDLE )
			return
		}
		
		if ( !(hOwner.GetFlags() & FL_ONGROUND) )
		{
			changeState( State.AIRBORNE )
			return
		}
		
		local closestThreat = AI_Bot_myDemo.FindClosestThreat(1e30, false)	// 6000 * 6000,
		if ( closestThreat && closestThreat.InCond(40) )
		{
			changeState( State.AVOID )
			targetAvoid = closestThreat
			return -1
		}
		
		local closestThreatPos
		if ( closestThreat )
			closestThreatPos = closestThreat.GetOrigin()
		
		collectSentries()
		local closestSentry = FindClosestSentry()
		if ( closestSentry )
		{
			local closestSentryDistance = (getSentryPos(closestSentry) - AI_Bot_myDemo.cur_pos).Length()
			if ( closestThreatPos &&
				closestSentryDistance < 1000 &&
				(closestThreatPos - AI_Bot_myDemo.cur_pos).Length() > closestSentryDistance * 4
			)
			{
				interface_fightThisSentry( closestSentry )
			}
		}
		
		if ( !closestThreat )	//|| (closestThreat.GetOrigin() - AI_Bot_myDemo.cur_eye_pos).LengthSqr() > 1800*1800)
		{
			changeState( State.IDLE )
		}
		else
		{
			AI_Bot_myDemo.SnapAt(closestThreat)
			
			// if ( my_point_of_attack + swingTime < AI_Bot_myDemo.time )
				// printl("what am i doing")
			
			local closestThreat_weapon = closestThreat.GetActiveWeapon()
			local isTargetLookingAtMe = prodemoknight.IsInFieldOfView( closestThreat, hOwner )
			local numberAdvantage	= checkNumberAdvantage( closestThreat )
			// printl("isTargetLookingAtMe: " + isTargetLookingAtMe)
			if (closestThreat_weapon											&&
				closestThreat_weapon.IsMeleeWeapon()							&&
				closestThreat_weapon.GetClassname() != "tf_weapon_laser_pointer" &&
				closestThreat_weapon.GetClassname() != "tf_weapon_buff_item"	&&	// && my_point_of_attack + swingTime < AI_Bot_myDemo.time)	// already finished my attack, do not run at target
				isTargetLookingAtMe	&&
				!numberAdvantage )
			{	//
				should_attack = false
				
				local closestThreat_currAttack = NetProps.GetPropFloat(closestThreat_weapon, "m_flNextPrimaryAttack")
				local targetRange = closestThreat_weapon.GetAttribute("is_a_sword", 48 ) + hOwner.GetBoundingMaxs().x + 36
				
				if ( closestThreat_lastAttack != closestThreat_currAttack )
				{	// he just pressed attack
					closestThreat_lastAttack = closestThreat_currAttack
					closestThreat_Attack	= AI_Bot_myDemo.time
					
				}
				
				local backward = (AI_Bot_myDemo.cur_pos - closestThreat.GetOrigin())
				local distanceSqr = backward.LengthSqr()
				backward.Norm()
				local point_of_attack = closestThreat_Attack + swingTime
				local canTargetAttackMe = IsTargetCloseEnoughInT(closestThreat, point_of_attack - AI_Bot_myDemo.time, targetRange )
				
				
				if ( (my_point_of_attack + swingTime > AI_Bot_myDemo.time) ||										// im swinging
					 ( point_of_attack < AI_Bot_myDemo.time && closestThreat_lastAttack > AI_Bot_myDemo.time ) ||	// threat has attacked and has not reset
					 forcedAttack )								// so i don't wait forever for my opponent to attack
				{												
					// printl("attacking")
					local actualRange = meleeRange + closestThreat.GetBoundingMaxs().x + 36
					
					if ( distanceSqr > actualRange * actualRange )
						AI_Bot_myDemo.locomotion.Approach(closestThreat.GetOrigin(), 999)
					else if ( distanceSqr < targetRange * targetRange - 1000 && !just_out_of_charge )
						AI_Bot_myDemo.locomotion.Approach( AI_Bot_myDemo.cur_pos + backward * 64 , 999)
						
					if ( just_out_of_charge && my_point_of_attack + swingTime < AI_Bot_myDemo.time )
					{
						/// being managed here is kinda not okay, but this is the only place that use it
						just_out_of_charge = false
					}
					
					if ( wait_before_forcedAttack_timer.IsValid() )
						wait_before_forcedAttack_timer.Destroy()
				}
				else if ( point_of_attack > AI_Bot_myDemo.time && canTargetAttackMe)
				{
					// if ( backward.Dot(hOwner.GetAbsVelocity()) < 0 )
						// hOwner.SetAbsVelocity(Vector())
					AI_Bot_myDemo.locomotion.Approach( AI_Bot_myDemo.cur_pos + backward * 64 , 999)
					
					if ( wait_before_forcedAttack_timer.IsValid() )
						wait_before_forcedAttack_timer.Destroy()
					// printl("dodging")
				}
				// else if ( distanceSqr > targetRange * targetRange || ( point_of_attack < AI_Bot_myDemo.time && closestThreat_lastAttack > AI_Bot_myDemo.time ) )	// threat has attacked and has not reset
				// {
					// if ( hOwner.GetAbsVelocity().LengthSqr() < 100)
					// {
						// AI_Bot_myDemo.locomotion.Approach(closestThreat.GetOrigin(), 999)
					// }
					// else
					// {
						// AI_Bot_myDemo.UpdatePathAndMove(closestThreat.GetOrigin())
					// }
				// }
				// else
				// {
					// AI_Bot_myDemo.locomotion.Approach( AI_Bot_myDemo.cur_pos + backward * 64 , 999)
					// printl("im too close")
				// }
				
				else
				{
					// maintain distance just out side of target range
					local canTargetAttackMeIn02 = IsTargetCloseEnoughInT(closestThreat, swingTime, targetRange )
					
					if ( canTargetAttackMeIn02 )	// very effective
					// if ( distanceSqr < targetRange * targetRange + 1000)
						AI_Bot_myDemo.locomotion.Approach( AI_Bot_myDemo.cur_pos + backward * 64 , 999)
					else if ( distanceSqr > targetRange * targetRange + 2000 )
						AI_Bot_myDemo.locomotion.Approach(closestThreat.GetOrigin(), 999)
						
					if ( !wait_before_forcedAttack_timer.IsValid() )
					{
						local ref = this
						wait_before_forcedAttack_timer = CreateTimer(@() ref.forcedAttack = true, RandomFloat( 1 , 5 ))
					}
				}
				
				// canTargetAttackMe = IsTargetCloseEnoughInT(closestThreat, point_of_attack - AI_Bot_myDemo.time, targetRange )
				if ( !canTargetAttackMe && amICloseEnoughInT(closestThreat) )
				{
					startAttack()
					if ( circumventByAD43 )
					{
						// circumventSpeedCap_func( false )
						circumvent_timeout()
					}
				}
			}
			else 
			{
				should_attack = true
				if ( (AI_Bot_myDemo.cur_pos - closestThreat.GetOrigin()).LengthSqr() < 300 * 300 )
				{
					juke( closestThreat )
				}
				else
				{
					if ( hOwner.GetAbsVelocity().LengthSqr() < 100 )	// 100
					{
						AI_Bot_myDemo.locomotion.Approach(closestThreat.GetOrigin(), 999)
					}
					else
					{
						AI_Bot_myDemo.UpdatePathAndMove(closestThreat.GetOrigin())
					}
				}
			}
			
			if ( AI_Bot_myDemo.IsVisible(closestThreat) )
				CHASElastSeen = AI_Bot_myDemo.time
				
			if ( hasCharge )
				evaluateChargeStrat( closestThreat )
			
			if ( amICloseEnough(closestThreat) )
			{
				startAttack()
				if ( circumventByAD43 )
				{
					// circumventSpeedCap_func( false )
					circumvent_timeout()
				}
			}
		}
	}
	
	
	function GetMaxChargeSpeed()		// also fetch turn rate and other stuff
	{
		local myWeapons = []
		for (local i = 0; i < GetPropArraySize(hOwner, "m_hMyWeapons"); i++)
		{
			local weapon = GetPropEntityArray(hOwner, "m_hMyWeapons", i)
			if ( weapon )
			{
				myWeapons.append(weapon)
				
				if ( weapon.IsMeleeWeapon() )
				{
					hWeapon = weapon
					meleeRange = weapon.GetAttribute("is_a_sword", 48 )
						
				}
			}
			
		}
		
		// local is_a_sword = 0
		// foreach (weapon in myWeapons)
		// {
			// is_a_sword 					+= weapon.GetAttribute("is_a_sword", 0 )
		// }
		// if ( is_a_sword > 0)
			// meleeRange = 72
		
		for (local wearable = hOwner.FirstMoveChild(); wearable != null; wearable = wearable.NextMovePeer())
		{
			if (wearable.GetClassname() == "tf_wearable" || wearable.GetClassname() == "tf_wearable_demoshield")
				myWeapons.append(wearable)
		}
		
		local mult_player_movespeed = 1
		local mult_player_movespeed_shieldrequired = 1
		local mult_player_movespeed_active = 1
		local charge_turn_control = 1
		local charge_recharge_rate = 1
		foreach (weapon in myWeapons)
		{
			mult_player_movespeed 					*= weapon.GetAttribute("move speed bonus", 1 )
			mult_player_movespeed 					*= weapon.GetAttribute("move speed penalty", 1 )
			mult_player_movespeed_shieldrequired	*= weapon.GetAttribute("move speed bonus shield required", 1 )
			mult_player_movespeed_active			*= weapon.GetAttribute("mult_player_movespeed_active", 1 )
			charge_turn_control						*= weapon.GetAttribute("mult charge turn control", 1 )
			charge_turn_control						*= weapon.GetAttribute("full charge turn control", 1 )
			charge_recharge_rate					*= weapon.GetAttribute("charge recharge rate increased", 1 )
		}
		mult_player_movespeed 					*= hOwner.GetCustomAttribute("move speed bonus", 1 )
		mult_player_movespeed 					*= hOwner.GetCustomAttribute("move speed penalty", 1 )
		mult_player_movespeed_shieldrequired	*= hOwner.GetCustomAttribute("move speed bonus shield required", 1 )
		mult_player_movespeed_active			*= hOwner.GetCustomAttribute("mult_player_movespeed_active", 1 )
		charge_turn_control						*= hOwner.GetCustomAttribute("mult charge turn control", 1 )
		charge_recharge_rate					*= hOwner.GetCustomAttribute("charge recharge rate increased", 1 )
		
		turnRate_perTick *= charge_turn_control		/// fetch here
		maxSpeed		*= mult_player_movespeed * mult_player_movespeed_shieldrequired * mult_player_movespeed_active
		shieldRechargeRate_perTick = charge_recharge_rate * 100 / 12 * tickInterval
		
		local result = 750 * mult_player_movespeed * mult_player_movespeed_shieldrequired * mult_player_movespeed_active
		//+printl(result)
		return result > 750 ? 750 : floor(result)
		
	}
	
	isTakeOver = false
	function TakeOver( bool, forced = false )
	{
		if ( bool )
		{
			if ( !isTakeOver || forced )
			{
				if ( !forced )
					isTakeOver = true
				hOwner.SetMission(0, true)
				// hOwner.SetBehaviorFlag(1023)
				// hOwner.AddBotAttribute(IGNORE_FLAG)
				// hOwner.AddBotAttribute( IGNORE_ENEMIES )
				// printl("start taking over")
			}
		}
		else
		{
			if ( isTakeOver || forced )
			{
				if ( !forced )
					isTakeOver = false
				hOwner.SetMission( MISSION_DESTROY_SENTRIES , true)
				hOwner.ClearBehaviorFlag(1023)
				hOwner.RemoveBotAttribute( IGNORE_ENEMIES )
				// printl("stop taking over")
			}
		}
	}
	
	curr_point = null
	last_simple_approach_use = 0
	function simple_approach_func( map, jump_extents = false )
	{
		if ( !map.len() )
			return false
		if ( !map.find(curr_point) )
			curr_point = map[0]
		
		local index = map.find(curr_point)
		if ((curr_point - AI_Bot_myDemo.cur_pos).LengthSqr() < 16*16) {
			index++
			if (index >= map.len()) {
				return false
			}
			curr_point = map[index]
		}
		
		
		
		if ( jump_extents )
		{
			foreach ( jump_extent in jump_extents )
			if ( index < jump_extents.len() && jump_extents[index] )
			{
				local jump_extent = jump_extents[index]
				local maxs = jump_extent.maxs + jump_extent.origin
				//printl("targetPos: " + targetPos + " " + jump_extent.origin + " " + jump_extent.maxs)
				if ( AI_Bot_myDemo.cur_pos.x >= jump_extent.origin.x && AI_Bot_myDemo.cur_pos.x <= maxs.x &&
					 AI_Bot_myDemo.cur_pos.y >= jump_extent.origin.y && AI_Bot_myDemo.cur_pos.y <= maxs.y &&
					 AI_Bot_myDemo.cur_pos.z >= jump_extent.origin.z && AI_Bot_myDemo.cur_pos.z <= maxs.z )
				{
					// printl("checking extent")
					AI_Bot_myDemo.locomotion.Jump()
				}
			}
		}
		else
		{
			local DoNotJump = false
			index = index == 0 ? 0 : index--
			if ( index != 0 && (map[index-1] - AI_Bot_myDemo.cur_pos).LengthSqr() < 16*16 )
				DoNotJump = true
			
			if ( hOwner.GetAbsVelocity().Length() < 50 && !DoNotJump )
			{
				AI_Bot_myDemo.locomotion.Jump()
			}
		}
		
		if ( map.find(curr_point) == 0 )
		{
			return moveToSpot(curr_point)
		}
		
		// fun.CreateMarker()			// do not run this here
		// fun.hMarker.SetAbsOrigin(curr_point)
		AI_Bot_myDemo.locomotion.Approach(curr_point, 999)
		return true
	}
	
	function cleanup()
	{
		changeState( State.CLEANUP )
		
		// if ( !hOwner || !hOwner.IsValid() )
		// {
			// local index = findIndex()
			// if ( index != null )
				// prodemoknight.ListOfProDemoknight.remove(index)
				
			// prodemoknight.ListOfProDemoknights.rawdelete(hOwner)
			// return
		// }
		
		try
		{
			if ( circumventByAD43 )
			{
				SetPropBool(hOwner, "m_bForcedSkin", false)
				SetPropInt(hOwner, "m_nForcedSkin", 0)
			}
			
			// if ( wait_before_ipad_timer.IsValid() )
				// wait_before_ipad_timer.Destroy()
			// if ( wait_after_ipad_timer.IsValid() )
				// wait_after_ipad_timer.Destroy()
			// hOwner.SetSolid(2)
			SetPropInt(hOwner, "m_afButtonForced", 0)
			SetPropBool(hOwner, "m_bViewingCYOAPDA", false)
			
			hOwner.ClearBehaviorFlag(1023)
			hOwner.RemoveBotAttribute(IGNORE_FLAG)
			hOwner.RemoveBotAttribute(IGNORE_ENEMIES)
			hOwner.RemoveBotAttribute(SUPPRESS_FIRE)
		}
		catch(e)
		{
			//+printl("-----------X ermmm: i SHOULD deal with this X-----------")
			//+printl(e)
		}
		
		local index = findIndex()
		if ( index != null )
			prodemoknight.ListOfProDemoknight.remove(index)
			
		prodemoknight.ListOfProDemoknights.rawdelete(hOwner)
		
		if ( hOwner && hOwner.IsValid() )
		{
			hOwner.TerminateScriptScope()
		}
	}
	
	function findIndex()
	{
		return prodemoknight.ListOfProDemoknight.find(this)
	}
	function isThisGuyYours(hPlayer, reason, actor = null)
	{
		if ( hOwner == hPlayer )
		{
			if (reason == "death")
			{
				// cleanup()
				changeState( State.CLEANUP )
			}
			else if (reason == "hurt")
			{
				if ( !actor )
					return true
				
				if ( typeof actor == "float" )
				{
					if ( actor > hOwner.GetHealth() && bot_type == "bot_pro_busterknight" )
						changeState( State.DETONATING )
				}
				else
				{
					if ( current_state == State.GOTOTRIMPSPOT )
						evaluateChargeStrat( actor )
				}
				
			}
			else if (reason == "BusterDetonate")
			{
				if ( bot_type == "bot_pro_busterknight" )
				{
					return true
				}
				return false
			}
			else if ( reason == "StartDetonate" )
			{
				if ( bot_type == "bot_pro_busterknight" )
					changeState( State.DETONATING )
				else
				{
					die()
				}
			}
			return true		// Yuh Uh
		}
		else
			return false	// Nuh Uh
	}
	
	function On_Death()
	{
		changeState( State.CLEANUP )
	}
	function On_Hurt( actor )
	{
		if ( !actor )
			return false
		
		if ( typeof actor == "float" )
		{
			if ( actor > hOwner.GetHealth() && bot_type == "bot_pro_busterknight" )
				changeState( State.DETONATING )
		}
		else
		{
			if ( current_state == State.GOTOTRIMPSPOT && !hateSentries )
				evaluateChargeStrat( actor )
		}
	}
	
	function die()
	{
		hOwner.SetHealth(0)
		hOwner.TakeDamage( 1, DMG_BLAST, null )
		cleanup()
	}
	
	
	
	
	// Simulate one strafe run (same as before)
	function SimulateAirStrafe(forwardDir, targetPos, accel1, accel2, TaccelChange, speedCap, turnRate, totalTime, tickInterval)
	{
		local lookingAtTarget = false
		local overturning = true
		local overshoot = false
		local directionChange	= 0
		local direction			= 0
		local targetPosDup = targetPos + Vector()
		
		prodemoknight.simulated_pos.clear()
		prodemoknight.simulated_dir.clear()
		
		local vel = Vector(0, 0, 0);
		local pos = Vector(0, 0, 0);
		local wishDir = forwardDir;
		wishDir.Norm();
		local currentAccel = accel1;
		
		local vel_dir_prev = 0

		local targetDir = Vector(targetPosDup.x, targetPosDup.y, 0)
		//printl("IMPORTANT PART HERE: " + targetDir)
		targetDir.Norm();
		local t = 0.0;
		while (t < totalTime)
		{
			if (t >= TaccelChange)
				currentAccel = accel2;
			
			
			//printl(wishDir)
			if (vel.Length() >= maxChargeSpeed - 1)
			{
				//local diffAngleVelTar = acos(clamp(vel.Dot(targetDir), -1.0, 1.0));
				local diffAngleVelTar = DiffQAngle ( VectorAngles(vel), VectorAngles(targetDir) );
				local maxTurn = turnRate * tickInterval;
				
				//printl("vel: " + VectorAngles(vel))
				//printl("targetDir: " + targetDir)
				//printl("diffAngleVelTar: " + diffAngleVelTar)
				
				
				//printl("diffAngleVelTar: " + diffAngleVelTar)
				
				local dir = VectorAngles(wishDir)
				
				// bandage because i cant figure out the formula for counter strafing
				local deltaVelDir = (vel_dir_prev - VectorAngles(vel).y)
				local counterStrafe = false
				if ( deltaVelDir && turnRate_perTick < 10 )
				{
					if ( fabs(diffAngleVelTar) < fabs(deltaVelDir) * 5)
					{
						counterStrafe = true
						// printl(" counter strafe ")
						if (deltaVelDir > 0)
						{
							dir.y += turnRate_perTick
						}
						else 
						{
							dir.y -= turnRate_perTick
						}
						wishDir = dir.Forward();
						wishDir.Norm();
					}
				}
				
				if (fabs(diffAngleVelTar) >= 0.001 && !counterStrafe)
				{
					if ( diffAngleVelTar * direction <= 0 )
					{
						// our last direction is differnt from current direction
						directionChange++
						
						direction = diffAngleVelTar
						
						if ( directionChange > 2 )
						{
							return { vel = Vector(), pos = Vector() , overshoot = false};
						}
						
					}
					
					lookingAtTarget = false
					
					local current_speed = maxChargeSpeed - acceleration * tickInterval	// ( - accel_speed )
					targetDir.Norm()
					
					local OptimalAngle = ReverseDotProduct( vel, current_speed )	// optimal angle
					Assert(OptimalAngle, "oops")
					
					local crossAC = side_of(vel, targetDir)
					if ( crossAC * side_of(vel, OptimalAngle.B1) > 0)
						OptimalAngle = OptimalAngle.B1
					else if ( crossAC * side_of(vel, OptimalAngle.B2) > 0 )
						OptimalAngle = OptimalAngle.B2
					else
						Assert(false, "i missed direction check somehow")
						
					// difference in angle to optimal angle
					local diffAngleAccelOpt = DiffQAngle( dir, VectorAngles(OptimalAngle) );
					
					
					// find WishDir that points vel to target
					//local ToTargetAngle = ComputeOptimalWishDir(vel, targetDir)
					//local diffAngleAccelToTar = DiffQAngle( dir, VectorAngles(ToTargetAngle) );
					
					
					local turn = MIN(fabs(diffAngleAccelOpt), maxTurn);
					turn = MIN(fabs(diffAngleVelTar), turn);
					//turn = MIN(fabs(diffAngleAccelToTar), turn)
					if ( diffAngleAccelOpt < 0 )
					{
						//printl("OFF SIDE!!!!!!!!!!!")
						dir.y += turn
					}
					else 
					{
						dir.y -= turn
					}
					//printl("diffAngleVelTar : " + diffAngleAccelOpt)
					//printl("diffAngleAccelToTar : " + diffAngleAccelToTar)
					
					wishDir = dir.Forward();
					wishDir.Norm();
				}
				else
				{
					lookingAtTarget = true
					overturning = false
				}
			}
			
			vel_dir_prev = VectorAngles(vel).y
			
			local wish_speed = maxChargeSpeed
			//if ( wish_speed > maxChargeSpeed )
			//	wish_speed = maxChargeSpeed
			
			local current_speed = vel.Dot(wishDir)
			local add_speed = wish_speed - current_speed
			if ( add_speed > 0 )
			{
				local accel_speed = currentAccel * tickInterval
				if ( accel_speed > add_speed )
					accel_speed = add_speed
				
				vel += wishDir * accel_speed;
			}
			
			//float current_speed = velocity.Dot(wish_direction)
			//float add_speed = wish_speed - current_speed
			//if ( add_speed <= 0 )
			//	return
			
			//float accel_speed = maxSpeedPerTick
			//if ( accel_speed > add_speed )
			//	accel_speed = add_speed
			
			//velocity += wish_direction * accel_speed;
			
			
			prodemoknight.simulated_pos.append(pos)
			prodemoknight.simulated_dir.append(VectorAngles(wishDir))

			pos += vel * tickInterval;
			t += tickInterval;
			
			// we are behind the target, we have overshot
			//if ( pos.Length() > targetPos.Length() )
			//	overshoot = true
			
			targetDir = targetPosDup - pos
			targetDir.Norm()
			//printl("IMPORTANT PART HERE 2 : " + targetPosDup)
			
		}
		prodemoknight.simulated_len = prodemoknight.simulated_pos.len()
		simulated_len = prodemoknight.simulated_len
		
		
		if  ( lookingAtTarget && !overturning)
		{
			overshoot = false
		}
		else if ( !lookingAtTarget && !overturning || overturning)
		{
			overshoot = true
		}
		//printl("overshoot: " + overshoot)
		
		return { vel = vel, pos = pos , overshoot = overshoot};
	}
	
	// Find starting angle that reaches target distance at totalTime
	function FindStartAngle(forwardDir, mins, maxs, targetPos, distance, accel1, accel2, TaccelChange, speedCap, turnRate, totalTime, tickInterval, alongDirection, allowDirectMoveCheck)
	{
		local targetDir = targetPos + Vector()
		//local low = -PI / 2; // left strafe limit
		//local high = PI / 2; // right strafe limit
		local isRight = true
		local low = maxs	//90
		local high = mins	//-90
		
		if ( side_of(forwardDir, targetDir) > 0 )
		{
			if ( !isRight )
			{
				isRight = true
				
				local swap = low
				low = high
				high = swap
			}
		}
		else {
			if ( isRight )
			{
				isRight = false
				
				local swap = low
				low = high
				high = swap
			}
		}
		
		local bestAngle = 0.0;
		local bestError = 9999999.0;
		local result
		local error
		if ( allowDirectMoveCheck )
		{
			result = SimulateAirStrafe(targetDir, targetPos, accel1, accel2, TaccelChange, speedCap, turnRate, totalTime, tickInterval);
			
			if ( alongDirection )
			{
				local projected0 = ProjectPointOntoVector(result.pos, Vector(), alongDirection)
				local projected1 = ProjectPointOntoVector(targetPos, Vector(), alongDirection)
				error = (projected0 - projected1).Length();
			}
			else
				error = (result.pos - targetPos).Length();
			
			//+printl("isRight: " + isRight)
			//+printl("overshoot: " + result.overshoot)
			if (result.overshoot)
			{
				// overshoot the target even we take the slowest path (direct)
				// just take that path
				//+printl("overshoot target even we take the slowest path (direct)")
				
				return VectorAngles(targetDir).y - VectorAngles(forwardDir).y
			}
			else
			{
				bestAngle = VectorAngles(targetDir).y - VectorAngles(forwardDir).y
				bestError = error
			}
		}
		
		prodemoknight.simulated_dir_best.clear()
		prodemoknight.simulated_pos_best.clear()
		this.simulated_dir_best.clear()
		this.simulated_pos_best.clear()
		for (local i = 0; i < prodemoknight.simulated_len; i++)
		{
			prodemoknight.simulated_dir_best.append(prodemoknight.simulated_dir[i])
			prodemoknight.simulated_pos_best.append(prodemoknight.simulated_pos[i])
			
			this.simulated_dir_best.append(prodemoknight.simulated_dir[i])
			this.simulated_pos_best.append(prodemoknight.simulated_pos[i])
		}
			
			
		for (local i = 0; i < 20; i++) // 20 iterations ~ good enough
		{
			if ( abs( DiffQAngle(low, high) ) < 1 )
			{
				//+printl("iiiiiiiiiiiiiiii " + i)
				break
			}
			// printl("DiffQAngle " + DiffQAngle(low, high))
			
			local mid = (low + high) * 0.5;
			//local startDir = Rotate2D(forwardDir, mid);
			
			local rotation = QAngle(0, mid, 0)
			local startDir = RotatePosition( Vector(), rotation, forwardDir )
			//printl("forwardDir " + forwardDir)
			//printl("startDir " + startDir)
			
			result = SimulateAirStrafe(startDir, targetPos, accel1, accel2, TaccelChange, speedCap, turnRate, totalTime, tickInterval);
			
			if ( side_of(startDir, targetDir) > 0 )
			{
				if ( !isRight )
				{
					isRight = true
					
					local swap = low
					low = high
					high = swap
				}
			}
			else {
				if ( isRight )
				{
					isRight = false
					
					local swap = low
					low = high
					high = swap
				}
			}
			
			// printl("isRight: " + isRight)
			// printl("overshoot: " + result.overshoot)
			// printl("low: " + low)
			// printl("high: " + high)
			
			// Adjust bounds
			if (result.overshoot)
			{
				high = mid; // overshot target
				//continue
			}
			else
				low = mid;  // undershot target
				
			
			if ( alongDirection )
			{
				local projected0 = ProjectPointOntoVector(result.pos, Vector(), alongDirection)
				local projected1 = ProjectPointOntoVector(targetPos, Vector(), alongDirection)
				error = (projected0 - projected1).Length();
			}
			else
				error = (result.pos - targetPos).Length();

			// printl("error: " + error)
			// printl("mid: " + mid)
			//printl("result.overshoot: " + result.overshoot)
			if ( error < bestError )
			{
				bestError = error;
				bestAngle = mid;
				
				prodemoknight.simulated_dir_best.clear()
				prodemoknight.simulated_pos_best.clear()
				this.simulated_dir_best.clear()
				this.simulated_pos_best.clear()
				for (local i = 0; i < prodemoknight.simulated_len; i++)
				{
					prodemoknight.simulated_dir_best.append(prodemoknight.simulated_dir[i])
					prodemoknight.simulated_pos_best.append(prodemoknight.simulated_pos[i])
					
					this.simulated_dir_best.append(prodemoknight.simulated_dir[i])
					this.simulated_pos_best.append(prodemoknight.simulated_pos[i])
				}
				
			}

			
		}
		return bestAngle;
	}
	
	function FindStartAngleWrapper(spot, targetTrimpPos)
	{
		local TaccelChange = spot.TaccelChange
		local timeToZ	= calcTimeToTargetZ(spot.z_height, targetTrimpPos.z, spot.z_speed, -800)
		if ( timeToZ == null)
			return null			// couldn't reach
		
		local totalTime = timeToZ + TaccelChange;
		//+printl("calcTimeToTargetZ: " + totalTime)
		targetTrimpPos.z = 0
		
		local myPos = AI_Bot_myDemo.cur_pos
		myPos.z = 0
		
		local forward = spot.start_dir.Forward();
		forward.z = 0
		
		local targetPos  = targetTrimpPos - myPos	// because the origin is my feet, pos and dir are equal
		
		local distance = ( myPos - targetTrimpPos ).Length();
		local accel1 = spot.accel1;
		local accel2 = acceleration;
		
		local speedCap = maxChargeSpeed;
		local turnRate = 66.7 * turnRate_perTick;
		local tickInterval = 0.015;
		local alongDirection = spot.along_direction;
		
		local allowDirectMoveCheck
		local maxs
		local mins
		if (spot.start_dir_maxs && spot.start_dir_mins)
		{
			if (side_of( targetPos, spot.start_dir_maxs.Forward() ) >= 0 && side_of( targetPos, spot.start_dir_mins.Forward() ) <= 0 )
				allowDirectMoveCheck = true
			else
				allowDirectMoveCheck = false
			
			maxs = DiffQAngle(spot.start_dir_maxs, spot.start_dir)
			mins = DiffQAngle(spot.start_dir_mins, spot.start_dir)
		}
		else
		{
			allowDirectMoveCheck = true
			maxs = 90
			mins = -90
		}
			
			
		//+printl("allowDirectMoveCheck: " + allowDirectMoveCheck)
		
		
		local startAng = FindStartAngle(forward, mins, maxs, targetPos, distance, accel1, accel2, TaccelChange, speedCap, turnRate, totalTime, tickInterval, alongDirection, allowDirectMoveCheck);
		//+printl("Optimal starting strafe angle (deg): " + startAng);

		return startAng
	}
	
	
	function ComputeWishDir(velocity, desiredDir)
	{
		local vdir = Vector(velocity.x, velocity.y, 0)
		local ddir = Vector(desiredDir.x, desiredDir.y, 0)
		vdir.Norm()
		ddir.Norm()

		// Bisector between v and desiredDir — turns smoothly while preserving speed
		local wishDir = vdir + ddir;
		wishDir.Norm()
		
		// Edge cases: if vlen is tiny or angle > 90°, fall back to desiredDir
		if ( vdir.Dot(ddir) < 0.0 )
			wishDir = ddir;

		return wishDir;
	}
	
	function ComputeOptimalWishDir( velocity, desireDir )	/// verify
	{
		local vNorm = Vector(velocity.x, velocity.y, 0)
		local dNorm = Vector(desireDir.x, desireDir.y, 0)
		vNorm.Norm()
		dNorm.Norm()
		local vLen = velocity.Length();

		local cosTheta = clamp(vNorm.Dot(dNorm), -1.0, 1.0);
		local sinTheta = sqrt(1 - cosTheta * cosTheta);

		local phi = atan2(sinTheta, cosTheta + vLen / maxChargeSpeed);

		// Determine side to rotate
		local side = side_of(vNorm, dNorm) < 0 ? -1.0 : 1.0;

		local rotation = side * phi * 180 / Pi
		return RotatePosition( Vector(), QAngle(0, rotation, 0), vNorm )
		//return Rotate(vNorm, side * phi);
	}
	
	function CalcPosWithSlowToHalt(time_to_slowdown, velocity, position)
	{
		local sv_airaccelerate = 10
		local acceleration = maxSpeed * sv_airaccelerate
		local acceleration_vector = velocity * -1
		acceleration_vector.z = 0
		acceleration_vector.Norm()
		acceleration_vector *= acceleration
		acceleration_vector.z = sv_gravity
		
		// local initialSpeed = velocity*1
		// initialSpeed.z = 0
		//+printl("velocity.z: " + velocity.z)
		
		local time_until_stop = sqrt(velocity.x*velocity.x + velocity.y*velocity.y)/acceleration
		
		if ( time_to_slowdown < time_until_stop)
		{
			position += velocity * time_to_slowdown + (acceleration_vector * time_to_slowdown * time_to_slowdown)* 0.5
		}
		else
		{
			position += velocity * time_until_stop + (acceleration_vector * time_until_stop * time_until_stop)* 0.5
		}
		
		return position
	}
	
	function CalcForSimpleCharge( time_until_have_charge )
	{
		local chargeTime_0 = 1.54
		local chargeTime_1 = 1.42
		local chargeTime_2 = 1.02
		local chargeTime_3 = 0.95
		local chargeTime_4 = 0.90
		local chargeTime_list = [chargeTime_0, chargeTime_2]
		local smallest_charge_time = chargeTime_list[chargeTime_list.len() - 1]
		// local min_charge_time = MAX(smallest_charge_time, time_until_have_charge)
		
		local ListOfTargets = AI_Bot_myDemo.FindVisibleThreat(1e30, false)
		local vel = hOwner.GetAbsVelocity()
		// local timeToGrounded = calcTimeToTargetZ(AI_Bot_myDemo.cur_pos.z, GetGround( AI_Bot_myDemo.cur_pos ).z, vel.z, sv_gravity)
		
		local Target_Info = {}
		
		// printl("timeToGrounded: " + timeToGrounded)
		
		/// find time needed to reach target
		foreach ( target in ListOfTargets )
		{
			local table = {}
			
			local target_pos = target.GetOrigin()
			local timeToZ	= calcTimeToTargetZ(AI_Bot_myDemo.cur_pos.z, target_pos.z + 15, AI_Bot_myDemo.cur_vel.z, sv_gravity, true )
			table.timeToZ_0 <- timeToZ
			
			timeToZ	= calcTimeToTargetZ(AI_Bot_myDemo.cur_pos.z, target_pos.z - 52, AI_Bot_myDemo.cur_vel.z, sv_gravity, true )
			table.timeToZ_1 <- timeToZ
			
			
			/// allot some time for each target here
			local consider = table.timeToZ_0
			
			for ( local x = 0; x < 2; x++ )
			{
				if ( consider )	// timeToZ_0, timeToZ_1
				{
					for ( local i = consider.len(); i > 0; )	//i--
						if ( consider[--i] < smallest_charge_time + time_until_have_charge )
							consider.remove(i)
					
					if ( !consider.len() )
						consider = null
				}
				if ( !x )
					consider = table.timeToZ_1
			}
			
			
			if ( !table.timeToZ_0 && !timeToZ )
			{
				continue			// can't reach
			}
			
			table.distance_xyz <- target_pos - AI_Bot_myDemo.cur_pos
			
			Target_Info[target] <- table
		}
		
		// printl("test: " + Target_Info.values()[0][0])
		// printl("test: " + Target_Info.keys()[0])
		
		
		/// given the time allotted we know how far we can go
		/// compare that to actual target distance and adjust the allotted time if we cant reach
		local distance_xy
		local distance
		local ticks
		local ticks_len
		// local targetAng
		
		local timey = []
		local found = false
		local time = 0
		local allowed_times
		foreach ( target in Target_Info.keys() )
		{
			timey = [Target_Info[target].timeToZ_0, Target_Info[target].timeToZ_1]
			found = false
			
			// distance_xy = Target_Info[target].distance_xyz - Vector(0,0,Target_Info[target].distance_xyz.z)
			// distance	= distance_xy.Length()
			
			// /// uhm, this is not clean
			// if ( distance > prodemoknight.cached_trimp_info.standard_154.final_distance_min_max[1] )
			// {
				// printl("failed::: Cant reach :---------")
				// Target_Info.rawdelete( target )
				// continue
			// }
			// else if ( distance < prodemoknight.cached_trimp_info.standard_154.final_distance_min_max[0] )
			// {
				// if ( distance < prodemoknight.cached_trimp_info.standard_102.final_distance_min_max[0] )
				// {
					// printl("failed::: too close :---------")
					// Target_Info.rawdelete( target )
					// continue
				// }
				// else
				// {
					// printl(" using closer trimp :---------")
					// allowed_times = [smallest_charge_time]
				// }
			// }
			// else
			// {
				// allowed_times = [].extend( chargeTime_list )
			// }
			
			// allowed_times = [smallest_charge_time]
			allowed_times = [].extend( chargeTime_list )
			
			local first = true
			
			foreach ( timeToZ in timey )
			{
				if ( first )
					first = false
				else
					allowed_times = [smallest_charge_time]
				
				if ( !timeToZ )
					continue
				
				foreach ( time_given in allowed_times )
				{
					// foreach ( timeToZ_ in timeToZ )
					for ( local times_index = timeToZ.len() - 1; times_index != -1; times_index-- )
					{
						// local free_time = timeToZ[times_index] - time_given - time_until_have_charge
						local time_until_charge = timeToZ[times_index] - time_given
						
						
						if ( time_until_charge >= time_until_have_charge )
						{
							// local texttoprint2 = ""
							// local texttoprint = ""
							// if (Target_Info[target].timeToZ_0)
							// {
								// foreach ( fff in Target_Info[target].timeToZ_0 )
									// texttoprint2 += fff + " "
								// texttoprint += " " + Target_Info[target].timeToZ_0.len()
							// }
							// else
								// texttoprint += " null"
							// if (Target_Info[target].timeToZ_1)
							// {
								// foreach ( fff in Target_Info[target].timeToZ_1 )
									// texttoprint2 += fff + " "
								// texttoprint += " " + Target_Info[target].timeToZ_1.len()
							// }
							// else
								// texttoprint += " null"
							// texttoprint2 += "\n"
							// texttoprint += "\n"
							// printl(texttoprint2 + texttoprint)
							
							local future_pos = CalcPosWithSlowToHalt(time_until_charge, AI_Bot_myDemo.cur_vel*1, AI_Bot_myDemo.cur_pos*1)
							local distance_xyz = target.GetOrigin() - future_pos
							distance_xyz.z = target.GetOrigin().z - AI_Bot_myDemo.cur_pos.z
							
							/// do stuff
							local angle = CalcOffsetAndCheckForCollision( distance_xyz, time_given, timeToZ[times_index], AI_Bot_myDemo.cur_vel.z )
							if ( angle )
							{
								found = true
								
								Target_Info[target].angle			<- angle
								Target_Info[target].time_to_charge	<- time_until_charge
								Target_Info[target].future_pos	<- future_pos
								// timeToZ[times_index] -= time_given
								
								// printl("future_pos: -----------------------------" + future_pos)
								// prodemoknight.hMarker.SetAbsOrigin(future_pos)
								// me().SetAbsOrigin(future_pos)
								
								break
							}
						}
						else
						{
							continue
						}
					}
					if ( found )
					{
						break
					}
				}
				if ( found )
				{
					break
				}
			}
			
			if ( !found )
				Target_Info.rawdelete( target )
				
			// continue
		}
		
		/// now calculate when we should start for each reachable target
		/// pick the first available target
		local prime_target = null
		local least_time_till_charge = 100
		foreach ( target in Target_Info.keys() )
		{
			if ( least_time_till_charge > Target_Info[target].time_to_charge )
			{
				prime_target = target
				least_time_till_charge = Target_Info[target].time_to_charge
			}
		}
		
		if ( prime_target )
		{
			should_attack = false
			targetTrimp = prime_target
			// hOwner.SnapEyeAngles(Target_Info[prime_target].angle)
			save_angle = Target_Info[prime_target].angle
			// printl("------------------------------\nthe correct direction is: " + Target_Info[prime_target].angle)
			
			// local angle = Target_Info[prime_target][3]
			local ref = this
			SimpleCharge_Timer = CreateTimer(function() {
				ref.hOwner.SnapEyeAngles(Target_Info[prime_target].angle)
				ref.startCharge( )
				ref.changeState( State.TRIMPSTRAFE )
				ref.lenient_TRIMPSTRAFE_timer = CreateTimer(@() ref.changeState( State.IDLE ), 0.5)
				ref.wait_for_crit = true
				if ( ref.circumventByAD43 )
					ref.timeToStopPhasingOtherDemos = ref.AI_Bot_myDemo.time + 1.5
				
				//+printl("predicted location: " + Target_Info[prime_target].future_pos + " actual: " + ref.hOwner.GetOrigin() + " diff: " + (Target_Info[prime_target].future_pos - ref.AI_Bot_myDemo.cur_pos).Length())
				
				// printl("XXXXXXXXXXXXXXX" + (ref.hOwner.EyeAngles() - angle) )
				ref.test_count = ref.AI_Bot_myDemo.time
				// ref.sim_pos = Vector() + ref.AI_Bot_myDemo.cur_pos
				// ref.sim_pos_total = Vector()
				// ref.sim_vel = Vector()
				// ref.sim_dir = QAngle() + ref.AI_Bot_myDemo.cur_eye_ang
				// ref.sim_dir.x = 0
				// ref.sim_dir.z = 0
				// printl("GetAbsVelocity: " + ref.hOwner.GetAbsVelocity())
				
				// ref.save_angle = Target_Info[prime_target].angle
			}, Target_Info[prime_target].time_to_charge)
			
			return true
		}
		else
		{
			return false
		}
	}
	
	function CalcOffsetAndCheckForCollision( distance_xyz, time_total, time_to_target, current_v_velocity )
	{
		local info	= null
		// local base_point_count	= 2
		local point_count		= null
		local degree_unit		= null
		
		local ticks_time_total	= ceil(time_total / tickInterval)
		
		switch ( time_total )
		{
			case 0.9:
				info = prodemoknight.cached_trimp_info.standard_090
				break
			case 0.95:
				info = prodemoknight.cached_trimp_info.standard_095
				break
			case 1.02:
				info = prodemoknight.cached_trimp_info.standard_102
				break
			case 1.42:
				info = prodemoknight.cached_trimp_info.standard
				break
			case 1.54:
				info = prodemoknight.cached_trimp_info.standard_154
				break
			default:
				return null
		}
		
		local distance_xy = distance_xyz - Vector( 0, 0, distance_xyz.z )
		local ticks		= prodemoknight.find_x_at_y_target_from_sample(info, distance_xy.Length())
		local ticks_len	= ticks.len()
		
		local angle = null
		local targetAng = VectorAngles( distance_xy )
		local time_to_start		= time_to_target - time_total
		local initial_height	= CalcZAtTargetTime( AI_Bot_myDemo.cur_pos.z + hull_center.z, time_to_start, current_v_velocity, sv_gravity )
		local current_pos_xy	= AI_Bot_myDemo.cur_pos - Vector(0,0, AI_Bot_myDemo.cur_pos.z)
		local initial_point		= current_pos_xy + Vector(0,0,initial_height)
		local end_point			= AI_Bot_myDemo.cur_pos + distance_xyz
		
		// local tick_index = -1
		
		// uncomment this to start with smaller angle first
		// this is less flashy but its more consistent for now
		// ticks.reverse()
		while ( ticks_len )		//
		{
			// tick_index++
			// if ( tick_index == ticks_len )
				// break
		
			local time_to_turn = ticks[--ticks_len] * tickInterval
			
			local diff = evalPoly(info.target_dir_coeffs, time_to_turn) - 180
			angle = QAngle(0, targetAng.y + diff, 0)
			CleanQAngle( angle )
			
			/// check collision here
			/// generate points
			if ( info.collision_point_max_count <= info.collision_point_min_count )
			{
				point_count = info.collision_point_min_count
			}
			else
			{
				degree_unit = 180 / info.collision_point_max_count
				point_count = ::MAX( info.collision_point_min_count, ceil( fabs(diff/degree_unit) ) )
				//+printl("point_count " + point_count)
			}
			
			// check if we will use the straight part
			// local pos_x_end_turn = null
			// local pos_y_end_turn = null
			// local pos_z_end_turn = null
			local point_end_turn_right	= null
			local point_end_turn_left	= null
			local v_end_turn_to_target_right = null
			local v_end_turn_to_target_left	= null
			if ( ticks[ticks_len] < ceil( ticks_time_total * (1.0*point_count/(point_count+1)) ) )
			{
				// yes we will
				//+printl("yes we will")
				local pos_x_end_turn = evalPoly(info.pos_x_full_turn, time_to_turn) * -1
				local pos_y_end_turn = evalPoly(info.pos_y_full_turn, time_to_turn)
				local pos_z_end_turn = CalcZAtTargetTime( AI_Bot_myDemo.cur_pos.z + hull_center.z, time_to_start + time_to_turn, current_v_velocity, sv_gravity )
				
				point_end_turn_right = RotatePosition(Vector(), angle, Vector( pos_x_end_turn, pos_y_end_turn, 0 ) ) + AI_Bot_myDemo.cur_pos
				point_end_turn_right.z = pos_z_end_turn
				v_end_turn_to_target_right = end_point - point_end_turn_right
				
				point_end_turn_left = RotatePosition(Vector(), QAngle(0, targetAng.y - diff, 0), Vector( pos_x_end_turn, -1 * pos_y_end_turn, 0 ) ) + AI_Bot_myDemo.cur_pos
				point_end_turn_left.z = pos_z_end_turn
				v_end_turn_to_target_left = end_point - point_end_turn_left
			}
			
			
			/// now get actual coords of points
			local hit	= false
			// local isRight = true
			local x_coeff = -1
			local y_coeff = 1
			local point
			local prev_point = initial_point
			// local p_array = [initial_point]
			local pos_x		= null
			local pos_y		= null
			local pos_z		= null
			local time_at_point = null
			local pos_x_array = []
			local pos_y_array = []
			local pos_z_array = []
			local time_array = []
			local time_count = 0
			local x_y_count = 0
			// local v_end_turn_to_target	= null
			
			foreach ( isRight in [true, false] )	// one for each side
			{
				for ( local i = 0; i < point_count; i++ )
				{
					if ( time_count == i )	/// we haven't calculated this
					{
						time_at_point = ceil( ticks_time_total * (1.0*(i+1)/(point_count+1)) ) * tickInterval
						time_array.append(time_at_point)
						
						/// now calculate polys
						// it is a simplified version
						// the poly is a constant turn all the way, but we stop at time_to_turn
						// from that point onward simply extrapolate from there to target
						if ( time_at_point <= time_to_turn )
						{
							pos_x = evalPoly(info.pos_x_full_turn, time_at_point)
							pos_y = evalPoly(info.pos_y_full_turn, time_at_point)
							
							pos_x_array.append( pos_x )
							pos_y_array.append( pos_y )
							
							pos_z = CalcZAtTargetTime( AI_Bot_myDemo.cur_pos.z + hull_center.z, time_to_start + time_at_point, current_v_velocity, sv_gravity )
							pos_z_array.append( pos_z )
							
							// time_count++
							x_y_count++
						}
						else
						{
							
							
						}
						
						
						
						time_count++
						
					}
					else
					{
						time_at_point = time_array[i]
						
						if ( x_y_count > i )
						{
							pos_x		= pos_x_array[i]
							pos_y		= pos_y_array[i]
							pos_z		= pos_z_array[i]
						}
					}
					
					// if ( time_at_point <= time_to_turn )
					if ( x_y_count > i )
					{
						// if ( !isRight )
						// {
							// printl("this is left: " + y_coeff)
						// }
						
						pos_x *= x_coeff
						pos_y *= y_coeff
						
						point = RotatePosition(Vector(), angle, Vector( pos_x, pos_y, 0 ) ) + AI_Bot_myDemo.cur_pos
						point.z = pos_z
					}
					else
					{
						local time_since_end_turn = time_at_point - time_to_turn
							// printl("time_since_end_turn: " + time_since_end_turn)
							
						if ( isRight )
						{
							point = point_end_turn_right + v_end_turn_to_target_right * (time_since_end_turn /(time_total - time_to_turn))
						}
						else
						{
							point = point_end_turn_left + v_end_turn_to_target_left * (time_since_end_turn /(time_total - time_to_turn))
						}
					}
					// printl("time_at_point: " + time_at_point)
					
					// SpawnEntityFromTable("prop_dynamic", {	// local hMarker = 
						// targetname 	= "pumpk_test"
						// model 		= "models/props_halloween/pumpkin_01.mdl"
						// solid		= 0
						// origin		= point
					// })
					// printl("point: " + point + " i: " + i + " time_at_point: " + time_at_point)
					// printl("what: " + ceil( ticks_time_total * (1.0*(i+1)/(point_count+1)) ))
					
					// rcon script me().SetAbsOrigin( (empty = FindByName(empty, rstrip("pumpk_test "))).GetOrigin() )
					
					/// check los here
					if ( CheckPlayerCollision( prev_point, point ) )	//prev_point && 
					{
						// hit!
						hit = true
						break
					}
					prev_point = point
					
				}
				
				// SpawnEntityFromTable("prop_dynamic", {	// local hMarker = 
					// targetname 	= "pumpk_test"
					// model 		= "models/props_halloween/pumpkin_01.mdl"
					// solid		= 0
					// origin		= end_point
				// })
				
				// final los check
				if ( hit || CheckPlayerCollision( prev_point, end_point ) )
				{
					// continue
				}
				else
				{
					return angle
				}
				
				if ( isRight )
				{
					hit = false
					prev_point = initial_point
					y_coeff = -1
					
					angle.y = targetAng.y - diff
					CleanQAngle( angle )
				}
			}
			
			// sim_timetoturn = ticks[ticks_len]
			
			
			// break0
		}
		// return new_an
		// return angle
		return null
	}
	function CheckPlayerCollision(start, end)
	{
		// if (target == null) return false
		local trace = {
			start  = start,
			end    = end,
			// mask   = CONST.MASK_PLAYERSOLID,
			mask   = (CONTENTS_SOLID|CONTENTS_MOVEABLE|CONTENTS_PLAYERCLIP|CONTENTS_WINDOW|CONTENTS_GRATE),
			// ignore = me
		}
		TraceLineEx(trace)
		// printl("TraceLineEx: " + TraceLineEx(trace))
		// printl("TraceLineEx: " + start + "  " + end)
		// TraceLine
		
		// prodemoknight.hMarker.SetAbsOrigin(trace.pos)
		// printl(trace.hit)
		// printl("hello?")
		return trace.hit
	}
	
	// sim_vel = null
	// sim_pos = null
	// sim_pos_total	= null
	// sim_dir	= null
	// sim_timetoturn	= null
	// function CompareSimulation_Think()
	// {
		// local wish_speed = maxChargeSpeed
		// local sv_accelerate = 10
		// local wishDir = sim_dir.Forward();
	
		// local current_speed = sim_vel.Dot(wishDir)
		// local add_speed = wish_speed - current_speed
		// if ( add_speed > 0 )
		// {
			// local accel_speed = maxChargeSpeed * sv_accelerate * tickInterval
			// if ( accel_speed > add_speed )
				// accel_speed = add_speed
			
			// sim_vel += wishDir * accel_speed;
		// }
		
		
		// sim_pos += sim_vel * tickInterval;
		// sim_pos_total += sim_vel * tickInterval;
		
		// if ( sim_vel.Length() >= maxChargeSpeed - 1 && sim_timetoturn-- > 0)
		// {
			// sim_dir.y = turnRate_perTick
			
			// if ( sim_dir.y > 180)
				// sim_dir.y -= 360
			// else if ( sim_dir.y <= -180)
				// sim_dir.y += 360
		// }
		
		// printl("pos diff: " + (AI_Bot_myDemo.cur_pos - sim_pos) + " " + sim_pos_total)
	// }
	
	function collectBottomCornersOfExtent( ext )
	{
		local cornerList = [ext.origin]
		cornerList.append( ext.origin + Vector(ext.maxs.x, 			0, 0) )
		cornerList.append( ext.origin + Vector(			0, ext.maxs.y, 0) )
		cornerList.append( ext.origin + Vector(ext.maxs.x, ext.maxs.y, 0) )
		return cornerList
	}
	function calculateConeAndMaxDistance( spot )
	{
		local center = 0
		local half = 0
		local maxRange = 0
			
		if ( spot.rawin("des_dir_center") && spot.rawin("des_dir_half_angle") && spot.rawin("range") )
		{
			center = spot.des_dir_center
			half = spot.des_dir_half_angle
			maxRange = spot.range
		}
		else
		{
			// get all corners
			local corners = []
			foreach ( ext in spot.destination_extent )
				corners.extend( collectBottomCornersOfExtent( ext ) )
		
			local vector
			local angles = []
			local range = 0
			foreach ( corner in corners )
			{
				vector = corner - spot.start_pos
				vector.z = 0
				range = vector.LengthSqr()
				if ( range > maxRange )
					maxRange = range
				if ( range < 10 )
					continue
				
				angles.append( atan2(vector.y, vector.x) )	//  * 180 / Pi
			}
			angles.sort(@(a, b) a <=> b)
			local extended = []
			extended.extend( angles )
			foreach ( angle in angles )
			{
				// printl(angle)
				extended.append( angle + 2 * Pi )	// + 360
			}
			
			local minSpan = 1e30
			local bestStart = 0 
			local n = angles.len()
			
			for ( local i = 0; i < n; i++ )
			{
				local span = extended[i + n - 1] - extended[i]
				if ( span < minSpan )
				{
					minSpan = span
					bestStart = extended[i]
				}
					
			}
			while ( bestStart >= 180 )
				bestStart -= 360
			while ( bestStart < -180 )
				bestStart += 360
				
			// local left = bestStart
			// local right = bestStart + minSpan
			
			// me().SetAbsOrigin(spot.start_pos)
			// me().SnapEyeAngles(QAngle(0, left, 0))
			// CreateTimer( @() me().SnapEyeAngles(QAngle(0, right, 0)), 1)
			
			center = bestStart + minSpan / 2
			half = minSpan / 2
			
			spot.des_dir_center <- center
			spot.des_dir_half_angle <- half
			spot.range <- maxRange
		}
		
		return [ center, half, maxRange ]
	}
	function isTargetWithinTrimpArea( target, spot)
	{
		local targetDir = target.GetOrigin() - spot.start_pos
		targetDir.z = 0
		
		local limits = calculateConeAndMaxDistance( spot )
		if ( targetDir.LengthSqr() > limits[2] )
			return false
		
		local centerDir = Vector( cos(limits[0]), sin(limits[0]), 0 )
		targetDir.Norm()
		
		if ( targetDir.Dot( centerDir ) < cos( limits[1] ) )
			return false
		
		return true
	}
	
	m_detonateTimer = CreateTimer(@() {}, 0.1)
	function StartDetonate()
	{
		if ( m_detonateTimer.IsValid() )
			return
			
		if ( hOwner.GetTeam() != TEAM_SPECTATOR)
		{
			hOwner.SetHealth( 1 )
		}
		else
		{
			//+printl("WARNING!!!!!!!!!!!!!!!!!!!!!!!!: rare spec buster bug???")
			cleanup()
			return
		}
			
		SetPropInt(hOwner, "m_takedamage", 0)
			
		// if ( current_state != State.GOTOTRIMPSPOT )
		if ( current_state == State.DETONATING )
			hOwner.HandleTauntCommand(0)
		local ref = this
		m_detonateTimer = CreateTimer(@() ref.Detonate(), 2)
		hOwner.EmitSound( "MvM.SentryBusterSpin" )
	}
	
	function Detonate()
	{
		circumvent_timeout()
		circumventSpeedCap_func( false )
	
		local AbsAngles = hOwner.GetAbsAngles().Forward()
		DispatchParticleEffect( "explosionTrail_seeds_mvm", AI_Bot_myDemo.cur_pos, AbsAngles )
		DispatchParticleEffect( "fluidSmokeExpl_ring_mvm", AI_Bot_myDemo.cur_pos, AbsAngles )
		
		hOwner.EmitSound( "MvM.SentryBusterExplode" )
		
		ScreenShake( AI_Bot_myDemo.cur_pos, 25.0, 5.0, 5.0, 1000.0, SHAKE_START, true );
		
		local victimVector = []
		
		collectAllPlayers()
		foreach ( hPlayer in prodemoknight.PlayerList )
		{
			if ( AI_Bot_myDemo.IsAlive( hPlayer ) )
			{
				victimVector.append(hPlayer)
			}
		}
		
		
		local buildingEnt = null;
		local ent_name = "obj_sentrygun"
		for ( local i = 0; i < 3; i++)
		{
			if ( i == 1 )
				ent_name = "obj_dispenser"
			else if ( i == 2 )
				ent_name = "obj_teleporter"
		
			while ( buildingEnt = FindByClassname(buildingEnt, ent_name) )
			{
				if ( buildingEnt.IsValid() )
					victimVector.append(buildingEnt);
			}
		
		}
		
		
		
		hOwner.SetMission( 0, false )
		SetPropInt(hOwner, "m_takedamage", 1)
		
		// local gamerules = FindByClassname(null, "tf_gamerules")
		// NetProps.SetPropBool(gamerules, "m_bPlayingMannVsMachine", false)
		
		foreach ( victim in victimVector )
		{
			if ( !victim || !victim.IsValid() )
				continue
			
			local toVictim = WorldSpaceCenter(victim) - WorldSpaceCenter(hOwner)
			
			if ( toVictim.LengthSqr() > tf_bot_suicide_bomb_range * tf_bot_suicide_bomb_range )
				continue;
				
			if ( victim.GetClassname() == "player" )
			{
				ScreenFade( victim, 255, 255, 255, 255, 1.0, 0.1, 1)	// FFADE_IN
			}
			
			if ( IsLineOfFireClear( hOwner, victim ) )
			{
				if ( victim.GetClassname() == "player" && victim.IsFakeClient() && victim.HasBotTag("bot_pro_busterknight") )	//&& prodemoknight.checkTags(victim) )
				{
					if ( victim == hOwner )
						continue
					
					prodemoknight.ListOfProDemoknights[victim].StartDetonate()
						
					// foreach ( demo in prodemoknight.ListOfProDemoknight )
					// {
						// if ( demo == this )
							// continue
						
						// if ( demo.isThisGuyYours(victim, "StartDetonate") )
							// break
					// }
				}
				else
				{
						//$rafmod
					local hasFriendlyFire = false
					if ( victim.GetClassname() == "player" )
					{
						if ( victim.GetCustomAttribute("receive friendly fire", 0) )	//$rafmod) 
						{
							hasFriendlyFire = true
						}
						else
						{
							victim.AddCustomAttribute("receive friendly fire", 1, 0)
						}
					}
				
					toVictim.Norm()
					
					if ( victim.GetClassname() == "player" && victim.IsFakeClient() && victim.GetTeam() == AI_Bot_myDemo.team && victim.IsMiniBoss() )
					{
						victim.TakeDamage( 600, DMG_BLAST, hOwner )
						// victim.AddCustomAttribute("receive friendly fire", 0, 0)	//$rafmod
					}
					else
					{
						local damage = MAX( victim.GetMaxHealth(), victim.GetHealth() )
						
						victim.TakeDamage( 4 * damage, DMG_BLAST, hOwner )
					}
					
					if ( victim && victim.IsValid() && victim.GetClassname() == "player" && !hasFriendlyFire )
						victim.RemoveCustomAttribute("receive friendly fire")
				}
			}
		}
		// NetProps.SetPropBool(gamerules, "m_bPlayingMannVsMachine", true)
		
		
		hOwner.SetHealth( 0 )
		// hOwner.TakeDamage(0, DMG_PREVENT_PHYSICS_FORCE | DMG_NEVERGIB , hOwner)	// :CommitSuicide( false, true )
		// hOwner.TakeDamage(1, TF_DMG_CUSTOM_TELEFRAG, null)
		hOwner.TakeDamageCustom(hOwner, hOwner, null, Vector(), Vector(), 1, 0, TF_DMG_CUSTOM_TELEFRAG)		// telefrag is forced
		
		if ( AI_Bot_myDemo.IsAlive(hOwner) )
		{
			hOwner.ForceChangeTeam( TEAM_SPECTATOR, false )
		}
		
		cleanup()
	}
	
}


__CollectGameEventCallbacks(prodemoknight)


::AI_Bot_ProDemoknight <- class {
	function constructor( bot, instance ) {
		this.bot       = bot
		this.scope     = bot.GetScriptScope()
		this.team      = bot.GetTeam()
		this.cur_pos	 = bot.GetOrigin()
		this.cur_eye_ang = bot.EyeAngles()
		this.cur_eye_pos = bot.EyePosition()
		this.cur_eye_fwd = bot.EyeAngles().Forward()
		this.cur_vel     = bot.GetAbsVelocity()
		this.cur_speed   = cur_vel.Length()
		this.locomotion = bot.GetLocomotionInterface()
		
		this.time = Time()
		this.cur_threat_list	= []
		
		this.path_points	= []
		this.path_index		= 0
		this.path_areas		= {}
		this.g_SpyWrapper	= {}
		
		this.path_recompute_time = 0.0
		
		//this.navdebug = false
		
		//this.mins = bot.GetBoundingMins()
		//this.maxs = bot.GetBoundingMaxs()
		
		this.instance = instance
	}
	
	bot       = null
	scope     = null
	team      = null
	cur_pos		= null
	cur_eye_ang = null
	cur_eye_pos = null
	cur_eye_fwd = null
	cur_vel		= null
	cur_speed	= null
	locomotion = null
	
	cur_threat_list = []
	
	time = 0
	
	path_points = []
	path_index = 0
	path_areas = {}
	
	path_recompute_time = 0
	
	navdebug = false
	
	instance	= null
	ListOfNoticedSpies	= []
	ListOfSpiesInView	= {}
	immediateTarget 	= null
	g_SpyWrapper		= {}
	
	info_pos	= Vector()
	info_vel	= Vector()
	info_ang	= QAngle()
	info_time_gather = 0
	
	function GatherInfo(pos, vel, ang, time_gather)
	{
		info_pos	= pos
		info_vel	= vel
		info_ang	= ang
		info_time_gather = time_gather
	}
	
	function PredictingAndShoot()
	{
		
		local tray = prodemoknight.head_data[TF_CLASS_SPY]
		
		local rotation = info_ang
		rotation.x = 0
		local middle = RotatePosition( Vector(), rotation, tray.middle )
		local des = info_pos + middle + info_vel * ( time - info_time_gather )
		local dir = VectorAngles(des - cur_eye_pos)
		
		prodemoknight.hMarker.SetAbsOrigin(des)
		bot.GetLocomotionInterface().FaceTowards( des )
		if (instance.aim_time + 0.2 < time)
		{
			bot.SnapEyeAngles(dir)
			NetProps.SetPropVector(bot, "pl.v_angle", dir + Vector())
			NetProps.SetPropFloat(instance.hWeapon, "m_flNextPrimaryAttack", 0)
			//printl(NetProps.GetPropFloat(instance.hWeapon, "m_flNextPrimaryAttack"))
			
			//instance.hWeapon.PrimaryAttack()
			bot.PressFireButton(0.01)
			
			//printl("predict shot")
			
			return ( instance.m_flLastFireTime != NetProps.GetPropFloat(instance.hWeapon, "m_flLastFireTime") )
		}
	}
	
	function TryToSnap( immediateTarget )
	{
		local ThreatList = FindVisibleThreat(9999, true, true)
		
		if ( !ThreatList.len() )
		{
			if ( ListOfNoticedSpies.len() > 0 )
			{
				local spy_threat = FindCloserSpyThreat()
				bot.GetLocomotionInterface().FaceTowards( spy_threat.EyePosition() )
				
				local pitch = VectorAngles(spy_threat.EyePosition() - cur_eye_pos).x
				local dir = QAngle(pitch, cur_eye_ang.y, cur_eye_ang.z)
				NetProps.SetPropVector(bot, "pl.v_angle", dir + Vector())
				
				ThreatList.append( spy_threat )
			}
		}
		
		foreach ( threat in ThreatList )
		{
			if ( IsInFieldOfView( threat, true ) )
			{
				local tray = prodemoknight.head_data[threat.GetPlayerClass()]
				
				local rotation = threat.EyeAngles()
				rotation.x = 0
				local middle = RotatePosition( Vector(), rotation, tray.middle )
				local des = threat.GetBoneOrigin(tray.bone) + middle
				local dir = VectorAngles(des - cur_eye_pos)
				
				bot.GetLocomotionInterface().FaceTowards( des )
				if (instance.aim_time + 0.2 < time)
				{
					bot.SnapEyeAngles(dir)
					NetProps.SetPropVector(bot, "pl.v_angle", dir + Vector())
					NetProps.SetPropFloat(instance.hWeapon, "m_flNextPrimaryAttack", 0)
					//printl(NetProps.GetPropFloat(instance.hWeapon, "m_flNextPrimaryAttack"))
					
					//instance.hWeapon.PrimaryAttack()
					bot.PressFireButton(0.01)
					
					//+printl("flick shot")
					return true
					
					return ( instance.m_flLastFireTime != NetProps.GetPropFloat(instance.hWeapon, "m_flLastFireTime") )
				}
			}
		}
		
		return false
	}
	
	function checkingForSpysStatus()
	{
		foreach ( hSpy in ListOfNoticedSpies )
		{
			if ( !IsAlive(hSpy) || !IsVisible( hSpy ))
			{
				local index = ListOfNoticedSpies.find(hSpy)
				if ( index != null )
					ListOfNoticedSpies.remove(index)
			}
		}
		
		if ( !ListOfNoticedSpies.len() )
			instance.TakeOver( false )
	}
	
	function SnapAt(target)
	{
		local targetPos
		
		if ( typeof target == "Vector" )
			targetPos = target
		else if ( target.GetClassname() == "player" )
			targetPos = target.EyePosition()
		else if ( target.GetClassname() == "obj_teleporter" )
			targetPos = target.GetOrigin() + Vector(0, 0, 68)
		else
			targetPos = instance.getSentryPos( target )
			
		local dir = VectorAngles(targetPos - cur_eye_pos)
		NetProps.SetPropVector(bot, "pl.v_angle", dir + Vector())
		bot.SnapEyeAngles(dir)
	}
	
	function IsAlive(player) {
		return GetPropInt(player, "m_lifeState") == 0
	}
	
	function IsInFieldOfView(target, isAimingAt = false, isScoping = false) {
		local tolerance = 0.5736 	// cos(110/2)
		if ( isAimingAt )
			tolerance = 0.999 		// cos(2/2)
		if ( isScoping )
			tolerance = 0.99357			// cos(13/2)

		local delta = target.GetOrigin() - cur_eye_pos
		delta.Norm()
		if (cur_eye_fwd.Dot(delta) >= tolerance)
			return true

		delta = target.GetCenter() - cur_eye_pos
		delta.Norm()
		if (cur_eye_fwd.Dot(delta) >= tolerance)
			return true

		delta = target.EyePosition() - cur_eye_pos
		delta.Norm()
		return (cur_eye_fwd.Dot(delta) >= tolerance)
	}

	function IsVisible(target) {
		if (target == null) return false
		local trace = {
			start  = bot.EyePosition(),
			end    = target.EyePosition(),
			mask   = MASK_OPAQUE,
			ignore = bot
		}
		TraceLineEx(trace)
		return !trace.hit
	}
	
	function IsVisibleFromPoint(target, point) {
		if (target == null) return false
		local trace = {
			start  = point,
			end    = target.EyePosition(),
			mask   = MASK_OPAQUE,
			ignore = bot
		}
		TraceLineEx(trace)
		return !trace.hit
	}
	
	function IsThreatVisible(target, isScoping = false) {
		return IsInFieldOfView(target, false, isScoping) && IsVisible(target)
	}
	
	function GetThreatDistanceSqr(target) {
		return (target.GetOrigin() - cur_pos).LengthSqr()
	}
	function GetThreatDistanceSqrFromPoint(target, point) {
		return (target.GetOrigin() - point).LengthSqr()
	}
	
	function FindClosestThreat( min_dist_sqr, must_be_visible = true ) {
		local closestThreat = null
		local closestThreatDist = min_dist_sqr
		
		local ListOfTargets = FindVisibleThreat( min_dist_sqr, must_be_visible )

		local dist
		foreach ( player in ListOfTargets )
		{
			dist = GetThreatDistanceSqr( player )
			if ( dist < closestThreatDist )
			{
				closestThreat = player
				closestThreatDist = dist
			}
		}
		return closestThreat
	}
	
	
	function IsThreatOnMyPath(min_dist_sqr, point) {
		local closestThreatDist = min_dist_sqr
		// local ListOfTargets = cur_threat_list

		foreach (player in cur_threat_list) {

			local dist = GetThreatDistanceSqrFromPoint(player, point)
			if (dist < closestThreatDist) {
				return true
			}
		}
		return false
	}
	
	
	function FindCloserSpyThreat() {
		local closestThreat = null
		local closestThreatDist = 1e30

		foreach ( spy in ListOfNoticedSpies ) {
		
			local dist = GetThreatDistanceSqr(spy)
			if (dist < closestThreatDist) {
				closestThreat = spy
				closestThreatDist = dist
			}
		}
		return closestThreat
	}
	
	function FindVisibleThreat(min_dist_sqr, must_be_visible = true) {
		local ThreatList = []
		
		instance.collectAllPlayers()
		local players = [].extend(prodemoknight.PlayerList)
		
		// i have spotted these spies, just inject into the list here
		foreach ( spyWrapper in g_SpyWrapper )
		{
			if ( spyWrapper.spotted )
			{
				ThreatList.append(spyWrapper.spy)
				players.remove( players.find( spyWrapper.spy ) )
			}
		}
		if ( prodemoknight.ignore )
		{
			local me = me()
			if ( me )
				players.remove( players.find( me ) )
		}
		
		foreach (player in players) {
			
			
			// if ( ListOfSpiesInView.rawin(player) )
			// {
				// ThreatList.append(player)
				// continue
			// }

			if (player == bot || !IsAlive(player) || player.GetTeam() == team || (must_be_visible && !IsThreatVisible(player))) continue
			
			if ( player.GetPlayerClass() == TF_CLASS_SPY )
			{
				// he's a spy
				if ( !IsThisASpy(player) )
					continue	// he's not suspicious, ignore
				
				EntFireByHandle(bot, "SpeakResponseConcept", "TLK_PLAYER_CLOAKEDSPY", 0, null, null)
			}
			
			local breaky = false
			foreach ( tag in prodemoknight.bot_tag_list )
			{
				if ( player.IsFakeClient() && player.HasBotTag(tag) )
				{
					breaky = true
					break
				}
			}
			if (breaky) continue
			
			ThreatList.append(player)
			
		}
		return ThreatList
	}
	
	function IsThisASpy(player)
	{
		local isStealthed = player.IsStealthed()
		
		if ( player.InCond(9) )
		{
			if ( IsThreatVisible( player ) )
			{
				// UpdateSpyWrapper( player, time, isStealthed, true )
				return true
			}
			else
			{
				return false
			}
		}
		local disguisedAs = player.GetDisguiseTarget()
		if ( disguisedAs && disguisedAs.GetTeam() != player.GetTeam() )	// cannot write disguisedAs.GetTeam() == team because you sometimes disguise as a spec
		{
			// he's disguised
			// return false
			local distance = ( player.GetOrigin() - bot.GetOrigin() ).LengthSqr()
			if ( !isStealthed )
			{
				if ( distance < 700 * 700 )	// a disguised spy is close
				{
					// local delta = player.GetAbsVelocity()
					// if ( delta.LengthSqr() > 90000)	// 300 * 300	// he's running
					// {
						// delta.Norm()
						// local target_fwd = (cur_pos - player.GetOrigin())
						// if (target_fwd.Dot(delta) >= 0.4226)	// cos (130/2)	// he's running at me
						// {
						local targetSpeed = player.GetAbsVelocity()
						local target_fwd = cur_pos - player.GetOrigin()
						target_fwd.Norm()
						if ( targetSpeed.Dot(target_fwd) > 200 )		// he's moving toward me fast enough
						{
							if ( prodemoknight.IsInFieldOfView(player, bot, false, 0.766) )	// cos(80/2)	// he's looking at me
							{
								if ( IsThreatVisible( player ) )							// i can see him
								{
									// if ( ListOfNoticedSpies.find(player) == null )
										// ListOfNoticedSpies.append(player)
									// ListOfSpiesInView[player] <- time
									// UpdateSpyWrapper( player, time, isStealthed, false )
									
									return true		///
								}
							}
						}
						// }
					// }
				}
			}
		}
		else if ( !player.IsStealthed() )
			return true
		
		return false
	}
	
	function ManageSpy_Think()
	{
		foreach ( spyWrapper in g_SpyWrapper )
		{
			if ( !g_SpyWrapper.spotted )
				continue
			
			if ( spyWrapper.timeToForgetSpy < time || !IsAlive( spyWrapper.spy ) )
			{
				spyWrapper.spotted = false
				continue
			}
			
			if ( spyWrapper.OnUpdateStealth(time) )
				continue
		}
	}
	
	function UpdateSpyWrapper(spy, time, isStealthed, shimmer)
	{
		if ( !spy )	return
		
		if ( spy in g_SpyWrapper )
		{
			g_SpyWrapper[spy].UpdateSpyWrapper( time, isStealthed, shimmer )
		}
		
		g_SpyWrapper[spy] <- SpyAware( spy, time )
		return
	}
	
	function CanIMoveToThisSpot( pos_end )
	{
		local area_start = GetNavArea(cur_pos, 128.0)
		local area_end   = GetNavArea(pos_end, 128.0)

		if (!area_start)
			area_start = GetNearestNavArea(cur_pos, 128.0, false, true)
			
		return GetNavAreasFromBuildPath(area_start, area_end, pos_end, 0.0, team, false, path_areas)
	}
	
	function UpdatePathAndMove(target_pos, advanced = false, check_clear = false)
	{
		local dist_to_target = (target_pos - cur_pos).Length()

		if (path_recompute_time < time || check_clear) {
			if ( !check_clear )
				ResetPath()

			local pos_start = cur_pos
			local pos_end   = GetGround( target_pos )
			pos_end.z += 50

			local area_start = GetNavArea(pos_start, 128.0)
			local area_end   = GetNavArea(pos_end, 128.0)

			if (!area_start)
				area_start = GetNearestNavArea(pos_start, 128.0, false, true)
			if (!area_end)
				area_end   = GetNearestNavArea(pos_end, 128.0, false, true)

			if (!area_start || !area_end)
				return false
			
			// target is in their spawn room, don't bother
			if ( ( bot.GetTeam() == TF_TEAM_RED && area_end.HasAttributeTF( TF_NAV_SPAWN_ROOM_BLUE ) ) ||
				 ( bot.GetTeam() == TF_TEAM_BLUE && area_end.HasAttributeTF( TF_NAV_SPAWN_ROOM_RED ) ) )
			{
				if ( GetRoundState() != GR_STATE_TEAM_WIN )
				{
					return false;
				}
			}
			
			if (advanced)
			{
				path_recompute_time = time + 1
				local closestArea = null;
				local functor = CTFBotPathCost(bot, 0)
				
				local result
				try
					result = NavAreaBuildPath(GetCTFNavAreaWrapper(area_start), GetCTFNavAreaWrapper(area_end), pos_end, functor, closestArea, 0.0, team, false)
				catch(e)
				{
					//+printl(e)
					//+printl("IT FAILLLEDDD!!!!!!!, TOO EXPENSIVE")
					return false
				}
				
				if ( !result )
				{
					//+printl("false: can't find a path")
					return false
				}
				else
				{
					// ConstructPathToTable(GetCTFNavAreaWrapper(area_end), path_areas)
					//printl("path_areas" + path_areas.len())
					path_areas.append(true)
				}
			}
			else
			{
				if (!GetNavAreasFromBuildPath(area_start, area_end, pos_end, 0.0, team, false, path_areas))
					return false
			}
			
			if (area_start != area_end && !path_areas.len())
				return false

			// Construct path_points
			else {
				if (advanced)
				{
					//local area = GetCTFNavAreaWrapper(area_end)
					local color = Vector(255,255,255)
					if (getSteamName(bot) == "Medic One")
						color = Vector(255,255,255)
					else
						color = Vector(255,255,0)
					for (local area = GetCTFNavAreaWrapper(area_end); area && area.m_parent; area = area.m_parent)
					{
						path_points.append(PopExtPathPoint(area.area, area.GetCenter(), area.GetParentHow()))
						
						DebugDrawLine_vCol(area.GetCenter(), area.m_parent.GetCenter(), color, true, 2)
					}
					//printl("path_points " + path_points.len())
				}
				else
				{
					//path_points.clear()
					
					path_areas["area"+path_areas.len()] <- area_start
					local area = path_areas["area0"]
					local area_count = path_areas.len()
					
					// Initial run grabbing area center
					for (local i = 0; i < area_count && area; ++i) {
						// Don't add a point for the end area
						if (i > 0)
							path_points.append(PopExtPathPoint(area, area.GetCenter(), area.GetParentHow()))

						area = area.GetParent()
					}
					//printl("path_points " + path_points.len())
				}
				
				path_points.reverse()
				path_points.append(PopExtPathPoint(area_end, pos_end, 9)) // NUM_TRAVERSE_TYPES

				// Go through again and replace center with border point of next area
				local path_count = path_points.len()
				for (local i = 0; i < path_count; ++i) {
					local path_from = path_points[i]
					local path_to = (i < path_count - 1) ? path_points[i + 1] : null

					if (path_to) {
						local dir_to_from = path_to.area.ComputeDirection(path_from.area.GetCenter())
						local dir_from_to = path_from.area.ComputeDirection(path_to.area.GetCenter())

						local to_c1 = path_to.area.GetCorner(dir_to_from)
						local to_c2 = path_to.area.GetCorner(dir_to_from + 1)
						local fr_c1 = path_from.area.GetCorner(dir_from_to)
						local fr_c2 = path_from.area.GetCorner(dir_from_to + 1)

						local minarea = {}
						local maxarea = {}
						if ( (to_c1 - to_c2).Length() < (fr_c1 - fr_c2).Length() ) {
							minarea.area <- path_to.area
							minarea.c1 <- to_c1
							minarea.c2 <- to_c2

							maxarea.area <- path_from.area
							maxarea.c1 <- fr_c1
							maxarea.c2 <- fr_c2
						}
						else {
							minarea.area <- path_from.area
							minarea.c1 <- fr_c1
							minarea.c2 <- fr_c2

							maxarea.area <- path_to.area
							maxarea.c1 <- to_c1
							maxarea.c2 <- to_c2
						}

						// Get center of smaller area's edge between the two
						local vec = minarea.area.GetCenter()
						if (dir_to_from == 0 || dir_to_from == 2) { // GO_NORTH, GO_SOUTH
							vec.y = minarea.c1.y
							vec.z = minarea.c1.z
						}
						else if (dir_to_from == 1 || dir_to_from == 3) { // GO_EAST, GO_WEST
							vec.x = minarea.c1.x
							vec.z = minarea.c1.z
						}

						path_from.pos = vec;
					}
				}
			}
			
			if ( check_clear )
			{
				foreach ( point in path_points )
				{
					if ( IsThreatOnMyPath(700 * 700, point.pos) )
					{
						//+printl("there is someone on my path")
						return false
					}
				}
				return true
			}
			
			// Base recompute off distance to target
			local dist = ceil(dist_to_target / 500.0)
			local mod
			if (advanced)
			{
				// Every 500hu away increase our recompute time by 1s
				mod = 1 * dist
			}
			else
			{
				// Every 500hu away increase our recompute time by 0.1s
				mod = 0.1 * dist
				if (mod > 1) mod = 1
			}

			path_recompute_time = time + mod
		}

		if (navdebug) {
			for (local i = 0; i < path_points.len(); ++i) {
				DebugDrawLine(path_points[i].pos, path_points[i].pos + Vector(0, 0, 32), 0, 0, 255, false, 0.075)
			}
			local area = path_areas["area0"]
			local area_count = path_areas.len()

			for (local i = 0; i < area_count && area; ++i) {
				local x = ((area_count - i - 0.0) / area_count) * 255.0
				area.DebugDrawFilled(0, x, 0, 50, 0.075, true, 0.0)

				area = area.GetParent()
			}
		}
		if (!path_points.len())
			return false
		
		if (path_index == null)
			path_index = 0
		
		local pointTol = path_index != path_points.len() - 1 ? 64.0 : 16.0		// 64.0 : 16.0
		// printl("pointTol: " + pointTol)
		if ((path_points[path_index].pos - bot.GetOrigin()).Length() < pointTol) {
			++path_index
			if (path_index >= path_points.len()) {
				ResetPath()
				return
			}
		}

		local point = path_points[path_index].pos;
		// fun.hMarker.SetAbsOrigin(point)
		//uberchain.hMarker.SetAbsOrigin(point)
		//ClientPrint(null, 3, format("\x079EC34F%s\x01", point.tostring()))
		locomotion.Approach(point, 999)
		
		if (bot.GetOrigin().z < point.z - 18 && bot.GetAbsVelocity().Length() < 10)
		{
			locomotion.Jump()
			// printl("needed a jump")
		}
		
		return true

		//local look_pos = Vector(point.x, point.y, cur_eye_pos.z);
		//if (threat != null)
		//	LookAt(look_pos, 600.0, 1500.0);
		//else
		//	LookAt(look_pos, 350.0, 600.0);

		// calc lookahead point

		// set eyeang based on lookahead
		// set loco on lookahead if no obstacles found
		// if found obstacle, modify loco
	}
	
	mymap = null
	curr_point = null
	last_simple_approach_use = 0
	function simple_approach( map )
	{
		if ( !map.len() )
			return false
		mymap = map
		
		local distance
		local closestPointDistance = 1000000
		if ( last_simple_approach_use + 2.5 <  time )
		{
			curr_point = null
			foreach ( point in mymap )
			{
				distance = (point - cur_pos).LengthSqr()
				if ( distance < 100*100 && distance < closestPointDistance )
				{
					closestPointDistance = distance
					curr_point = point
				}
			}
			if ( !curr_point )
				curr_point = mymap[0]
		}
		last_simple_approach_use = time
		
		if ((curr_point - cur_pos).LengthSqr() < 32*32) {
			local index = mymap.find(curr_point) + 1
			if (index >= mymap.len()) {
				return false
			}
			curr_point = mymap[index]
		}
		
		local DoNotJump = false
		// index = index == 0 ? 0 : index--
		if ( index != 0 && (mymap[index-1] - cur_pos).LengthSqr() < 32*32 )
			DoNotJump = true
		
		if ( !DoNotJump && bot.GetAbsVelocity().Length() < 10 )
		{
			locomotion.Jump()
			// printl("needed a jump")
		}
		
		if ( mymap.find(curr_point) == 0)
		{
			return instance.moveToSpot(curr_point)
		}
		
		// fun.hMarker.SetAbsOrigin(curr_point)
		locomotion.Approach(curr_point, 999)
		return true
	}
	
	
	
	function OnUpdate() {
		cur_pos     = bot.GetOrigin()
		cur_vel     = bot.GetAbsVelocity()
		cur_speed   = cur_vel.Length()
		cur_eye_pos = bot.EyePosition()
		cur_eye_ang = bot.EyeAngles()
		cur_eye_fwd = cur_eye_ang.Forward()

		time = Time()

		//SwitchToBestWeapon()
		//DrawDebugInfo()
		
		return -1
	}
	function ResetPath()
	{
		path_areas.clear()
		path_points.clear()
		path_index = null
		path_recompute_time = 0
	}
}

SpyAware <- class {
	constructor( spy, time ) {

		this.spy	= spy
		this.time 	= time
		// this.how 	= how
	}
	
	spy		= null
	time	= null
	spotted	= true
	timeToForgetSpy	= 0
	isStealthed		= false
	isStealthedPrev	= false
	shimmer			= false
	
	function OnUpdateStealth( time )
	{
		if ( isStealthedPrev != isStealthed && isStealthed == true )
		{
			timeToForgetSpy = time + 1.5
			return true
		}
		
		isStealthedPrev = isStealthed
		return false
	}
	
	function UpdateSpyWrapper( time, isStealthed, shimmer )
	{
		if ( timeToForgetSpy < time + 5 )
			this.timeToForgetSpy = time + 5
		
		this.spotted	= true
		this.isStealthed	= isStealthed
		this.shimmer		= shimmer
	}
}

// ::UpdateSpyWrapper <- function(spy, time)
// {
	// if ( !spy )	return
	
	// if (spy in g_SpyWrapper)
        // g_SpyWrapper[spy].time = time
		
	// local wrapper = SpyAware( spy, time );
    // g_SpyWrapper[spy] <- wrapper
    // return
// }

::PopExtPathPoint <- class  {

	constructor( area, pos, how ) {

		this.area = area
		this.pos  = pos
		this.how  = how
	}

	area = null
	pos  = null
	how  = null
}

::Bonk <- {
	// function OnGameEvent_player_spawn(params)
	// {
		// local hPlayer	= GetPlayerFromUserID(params.userid)
		// if (hPlayer.IsFakeClient())
		// {
			// CreateTimer(function() {
				// foreach ( tag in Bonk.bot_tag_list )
				// if ( hPlayer.HasBotTag(tag) )
				// {
					// Bonk.assign(hPlayer, tag)
					// return
				// }
			// }, 0.2)
			
			// printl("this runs")
		// }
	// }
	
	function OnGameEvent_player_hurt(params)
	{
		if (params.damageamount == 0)
			return
		local hAttacker = GetPlayerFromUserID(params.attacker)
		local hVictim = GetPlayerFromUserID(params.userid)
		
		if ( !hAttacker )
			return
		
		if ( !hAttacker.IsFakeClient() )
			return
		
		if ( hAttacker.HasBotTag("bot_squash") )
		{
			if ( hVictim.GetClassname() == "player" )
				Squash(hVictim)
		}
	}
	
	bot_tag_list = ["bot_squish", "bot_squash"]
	function assign(hBot, tag)
	{
		// printl("assign: " + hBot)
		ListOfBonkers.append( ProDemoknightBot( hBot, tag ) )
	}
	
	ListOfBonkers = []
	ListOfSquishers = []
	ListOfSquashers = []
	
	function Squash( hPlayer = me() )
	{
		local scale = hPlayer.GetCustomAttribute("torso scale", 1 )
		scale = scale > 0.2 ? scale - 0.2 : 0
		
		hPlayer.StunPlayer(5, 0, TF_STUN_LOSER_STATE, null)
		hPlayer.AddCustomAttribute("torso scale", scale, 0)
	}
}

__CollectGameEventCallbacks(Bonk)