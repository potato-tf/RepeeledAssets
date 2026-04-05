local ROOT = getroottable()

IncludeScript("nopey_lib/nopey_lib", ROOT)
// IncludeScript("popextensions/botbehavior", ROOT)
//IncludeScript("NavAreaBuildPath", ROOT)

if("prosniper" in ROOT) return

::prosniper <- {
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
				if (hPlayer.HasBotTag("jbirds_pro_sniper"))
				{
					prosniper.assign(hPlayer)
				}
			}, 0.2)
			
			//+printl("this runs")
		}
		else
		{
			// if ( me() )
				// runthis()
			// printl("run?")
			
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
		foreach (proSniper in ListOfProSnipers)
			if (proSniper.isThisGuyYours(hPlayer, "death"))
				break
	}


	function assign(hBot)
	{
		//+printl("assign: " + hBot)
		
		ListOfProSnipers.append( ProSniperBot(hBot) )
	}
	
	function clean()
	{
		foreach (player in findAllPlayer()) {
			player.TerminateScriptScope()
		}
		
		//+printl("!!!!!!!!!!!!!!!!!!!!!!!" + hMarker)
		if ( hMarker != null && hMarker.IsValid() )
			hMarker.Destroy()
			
		delete ::prosniper
	}
	
	a = [1, 2, 3]
	
	
	
	function find( pos = Vector() )
	{
		//+printl("class num: " + birded.ListOfBirds[0].hOwner.GetPlayerClass())
		
		local tray = head_data[birded.ListOfBirds[0].hOwner.GetPlayerClass()]
		local middlePoint = ( tray.mins + tray.maxs )  * (0.5)
		
		//+printl("middlePoint: " + middlePoint)
		
		local boneIndex = birded.ListOfBirds[0].hOwner.LookupBone("bip_head")
		//+printl(boneIndex)
		//+printl("boneIndex: " + boneIndex)
		//+printl("tray.bone: " + tray.bone)
		
		//bot.GetLocomotionInterface().FaceTowards(birded.ListOfBirds[0].hOwner.GetBoneOrigin(tray.bone) - middlePoint)
		
				
		local rotation = birded.ListOfBirds[0].hOwner.EyeAngles()
		rotation.x = 0
		local middle = RotatePosition( Vector(), rotation, tray.middle )
		//local des = birded.ListOfBirds[0].hOwner.GetBoneOrigin(tray.bone) + middle
		
		
		local vec = birded.ListOfBirds[0].hOwner.GetBoneOrigin(tray.bone)	+ middle // + middlePoint
		//local vec = birded.ListOfBirds[0].hOwner.EyePosition()
		
		//rcon script findRandomPlayer().SnapEyeAngles(VectorAngles(birded.ListOfBirds[0].hOwner.GetBoneOrigin(10) - findRandomPlayer().EyePosition()))
		findRandomPlayer().SnapEyeAngles(VectorAngles(vec - findRandomPlayer().EyePosition() + pos))
	}
	
	function pose(dir = Vector())
	{
		birded.ListOfBirds[0].hOwner.SnapEyeAngles(VectorAngles(dir))
		birded.ListOfBirds[0].hOwner.SetAbsOrigin(birded.ListOfBirds[0].hOwner.GetOrigin() + Vector(0,0,30))
		
		//birded.ListOfBirds[0].hOwner.SetAbsOrigin(birded.ListOfBirds[0].hOwner.GetOrigin() + Vector(0,0,30))
		//SetPropInt(birded.ListOfBirds[0].hOwner, "m_afButtonForced", IN_DUCK)
	}
	
	ListOfProSnipers	= []
	ListOfRedSnipers	= []
	
	accurate = true
	
	text = "m_hMyWeapons"
	text2 = "m_flNextPrimaryAttack"
	text3 = "m_flFirstPrimaryAttack"
	text9 = "m_flNextSecondaryAttack"
	
	text10 = "m_afButtonDisabled"
	text11 = "m_Shared.m_flChargeMeter"
	text12 = "m_iStunFlags"
	text13 = "m_iTeamNum"
	text14 = "m_nForcedSkin"
	text15 = "m_bForcedSkin"
	text16 = "m_bJumping"
	text17 = "is_a_sword"
	
	
	text4 = "m_flLastFireTime"
	text5 = "m_bDucked"
	text6 = "m_bDuckToggled"
	text7 = "m_afButtonForced"
	text8 = "m_nButtons"
	
	//rcon script GetPropEntityArray(findRandomPlayer(), prosniper.text, 0).PrimaryAttack()
	//rcon script NetProps.SetPropFloat(GetPropEntityArray(findRandomPlayer(), prosniper.text, 0), prosniper.text2, 0)
	//rcon script printl(NetProps.GetPropFloat(GetPropEntityArray(findRandomPlayer(), prosniper.text, 0), prosniper.text2))
	
	//bind q"rcon script prosniper.pose(Vector(1,0,-1))";bind e"rcon script prosniper.find(Vector(1.5,0,4))"
	testHandle = null
	head_data = {
		[TF_CLASS_SCOUT] = {
			name = "bip_head"
			bone = 6
			mins = Vector(-5.5, -9, -7.0500001907349)
			maxs = Vector(5.5, 4, 4.9499998092651)
			middle = Vector(3,0,4)
		},
		[TF_CLASS_SOLDIER] = {
			name = "bip_head"
			bone = 6
			mins = Vector(-6.25, -9, -7.5500001907349)
			maxs = Vector(6.25, 5, 5.4499998092651)
			middle = Vector(1.5,0,4)
		},
		[TF_CLASS_PYRO] = 
		{
			name = "bip_head"
			bone = 6
			mins = Vector(-6, -9.5, -8)
			maxs = Vector(6, 3.5, 5)
			middle = Vector(3,-1,2)
		},
		[TF_CLASS_DEMOMAN] = 
		{
			name = "bip_head"
			bone = 16
			mins = Vector(-6, -8, -7.5)
			maxs = Vector(6, 5, 4.5)
			middle = Vector(3,0,3)
		},
		[TF_CLASS_HEAVYWEAPONS] = 
		{
			name = "bip_head"
			bone = 11
			mins = Vector(-6, -9.3500003814697, -8.6999998092651)
			maxs = Vector(6, 4.6500000953674, 4.3000001907349)
			middle = Vector(3,0,4)
		},
		[TF_CLASS_ENGINEER] = 
		{
			name = "bip_head"
			bone = 8
			mins = Vector(-6, -11, -8)
			maxs = Vector(6, 4, 6)
			middle = Vector(1,0,4)
		},
		[TF_CLASS_MEDIC] = 
		{
			name = "bip_head"
			bone = 6
			mins = Vector(-5, -8, -7.5)
			maxs = Vector(5, 5, 3.5)
			middle = Vector(2,0,2)
		},
		[TF_CLASS_SNIPER] = 
		{
			name = "bip_head"
			bone = 6
			mins = Vector(-6, -10.5, -7.5500001907349)
			maxs = Vector(6, 3.5, 5.4499998092651)
			middle = Vector(1,0,2)
		},
		[TF_CLASS_SPY] = 
		{
			name = "bip_head"
			bone = 6
			mins = Vector(-5, -7.75, -7.5)
			maxs = Vector(5, 3.75, 3.5)
			middle = Vector(3,0,2)
		},
	}
	
	function recalculateRedSniperCount()
	{
		//+printl("recalculated")
		ListOfRedSnipers.clear()
		foreach ( player in findAllPlayer(true) )
			if ( player.GetPlayerClass() == TF_CLASS_SNIPER )
				ListOfRedSnipers.append(player)
	}
	
	function Think()
	{
		// foreach ( redSniper in ListOfRedSnipers )
		// {
			// foreach ( proSniper in ListOfProSnipers )
			// {
				// if ( redSniper.InCond( TF_COND_ZOOMED ) && IsInFieldOfView( redSniper, proSniper.hOwner, true ) && !proSniper.hOwner.InCond(51) )
				// {
					// proSniper.challagedByASniper = true
				// }
				// else
				// {
					// proSniper.challagedByASniper = false
				// }
			// }	
		// }
		
		local hWeapon = GetPropEntityArray(me(), "m_hMyWeapons", 0)
		if (lastfire != NetProps.GetPropFloat(hWeapon, "m_flLastFireTime"))
		{
			//+printl("fired")
			lastfire = NetProps.GetPropFloat(hWeapon, "m_flLastFireTime")
		}
		
		return -1
	}
	lastfire = 0
	
	function runthis()
	{
		if ( me() )
		{
			me().ValidateScriptScope()
			me().GetScriptScope().Think <- function()
			{
				return prosniper.Think()
			}
			AddThinkToEnt(me(), "Think")
		}
	}
	// nonnne = runthis()
	
	
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
::ProSniperBot <- class 
{
	hOwner 		= null
	hWeapon		= null
	AI_Bot_mySniper	= null
	
	isAiming	= false
	isFired		= false
	isBlock		= false
	isTakeOver	= false
	PredictingAndShoot	= false
	challagedByASniper	= false
	aim_time	= 0
	m_flLastFireTime = 0
	
	immediateTarget	= null
	
	//scope_timer = CreateTimer(@() {}, 1)
	
	block_delay_timer = CreateTimer(@() {}, 1)
	snap_after_takeover_timer = CreateTimer(@() {}, 1)
	duck_timer = CreateTimer(@() {}, 1)
	duck_timeout_timer = CreateTimer(@() {}, 1)
	duck_eligible_timer = CreateTimer(@() {}, 1)
	gaze_timer = CreateTimer(@() {}, 1)
	
	
	
	constructor(hOwner)
	{
		this.hOwner = hOwner
		this.hWeapon = GetPropEntityArray(hOwner, "m_hMyWeapons", 0)
		
		AI_Bot_mySniper = AI_Bot_ProSniper( hOwner, this, prosniper.accurate )
		
		this.hOwner.ValidateScriptScope()
		this.hOwner.GetScriptScope().me <- this
		this.hOwner.GetScriptScope().Think <- function()
		{
			return me.Think()
		}
		AddThinkToEnt(this.hOwner, "Think")
		
	}
	function Think()
	{
		//return -1
		AI_Bot_mySniper.OnUpdate()
		
		// forget everything, I WANT THIS GUY DEAD
		// if ( PredictingAndShoot && !isFired)
		// {
			// TakeOver( true )
			// if ( !isAiming )
			// {
				// isAiming = true
				// aim_time = AI_Bot_mySniper.time
				
				// hOwner.PressAltFireButton(0.01)
			// }
			
			
			// if ( AI_Bot_mySniper.PredictingAndShoot() )
			// {
				// printl("predict shot")
			
				// PredictingAndShoot = false
				// isFired = true
				// m_flLastFireTime = NetProps.GetPropFloat(hWeapon, "m_flLastFireTime")
				
				// if ( !isBlock )
				// {
					// isBlock = true
					
					// if ( !block_delay_timer.IsValid() )
					// {
						// local ref = hWeapon
						// block_delay_timer = CreateTimer(@() NetProps.SetPropFloat(ref, "m_flNextPrimaryAttack", Time() + 1000), 0.2)
					// }
				// }
			// }
			
			// return -1
		// }
		
		if ( isTakeOver )
		{
			local threat = AI_Bot_mySniper.FindClosestThreat(600*600, true, findAllPlayer(true))
			if ( threat )
			{
				local dir = ( AI_Bot_mySniper.cur_pos - threat.GetOrigin() )
				dir.Norm()
				
				hOwner.GetLocomotionInterface().Approach( AI_Bot_mySniper.cur_pos + dir * 100, 999)
			}
		}
		
		local ThreatList = AI_Bot_mySniper.FindVisibleThreat(9999, true, false)
		foreach (threat in ThreatList)
		{
			//if ( threat.GetPlayerClass() == TF_CLASS_SNIPER )
			//{
				if ( threat.InCond( TF_COND_ZOOMED ) && prosniper.IsInFieldOfView( threat, hOwner, true ) && !hOwner.InCond(51) )
				{
					challagedByASniper = true
					break
				}
				else
				{
					challagedByASniper = false
				}
			//}
		}
		
		//printl("is this guy really ducking: " + (hOwner.GetFlags() & FL_DUCKING))
		
		if ( !PredictingAndShoot )
			AI_Bot_mySniper.checkingForSpysStatus()
		
		
		// if there is an uncloaked disguised spy, he will get marked with IsActive to be tracked
		// if we want to track but do not have up to date info about him, we have lost him, ignore
		// if he is cloaked while i am tracking him, target him now but also mark him as lost
		local current_frame = GetFrameCount()
		foreach ( player, status in AI_Bot_mySniper.ListOfSpiesInView )
		{
			
			if ( status.IsInView )
			{
				if ( status.lastest_tick_in_sight == current_frame )
				{
					// we are still tracking this guy
				}
				else
				{
					// not updated anymore, we can ignore
					status.IsInView = false
				}
			}
			else
			{
				AI_Bot_mySniper.ListOfSpiesInView[player].IsStealthed	= player.IsStealthed()
			}
			
			// if ( !AI_Bot_mySniper.IsInFieldOfView(player, false, hOwner.InCond( TF_COND_ZOOMED ) ) )
			// {
				// printl("not in my view, ignore")
				// continue
			// }
				
			if ( status.IsInView || AI_Bot_mySniper.IsInFieldOfView(player, false, hOwner.InCond( TF_COND_ZOOMED )) )
			{
			if ( status.IsStealthed != status.IsStealthed_last_tick )
			{
				if ( status.IsStealthed )
				{
					// he just cloaked, that's a spy
					//+printl("HES CLOAKED!!!!!!")
					local index = AI_Bot_mySniper.ListOfNoticedSpies.find(player)
					if ( index != null )
						AI_Bot_mySniper.ListOfNoticedSpies.remove(index)
					
					// if ( status.IsInView )
					// {
						status.IsInView = false
						
						/// begin prediction
						local pos = player.GetBoneOrigin(prosniper.head_data[TF_CLASS_SPY].bone)
						local vel = player.GetAbsVelocity()
						local ang = player.EyeAngles()
						local time_losing_track = Time()
						
						AI_Bot_mySniper.GatherInfo(pos, vel, ang, time_losing_track)
						PredictingAndShoot = true
						TakeOver( true )
						
						//bind q "+attack2; hurtme -1; rcon script me().SetSpyCloakMeter(100); "
					// }
				}
				else {
					// he decloaked
					//+printl("HES DECLOAKED!!!!!!")
					// if ( status.IsInView )
					// {
					if ( AI_Bot_mySniper.ListOfNoticedSpies.find(player) == null )
						AI_Bot_mySniper.ListOfNoticedSpies.append(player)
					// }
				}
			}
			}
			status.IsStealthed_last_tick = status.IsStealthed	// this is the only place that updates this, do not remove
		}
		//printl()
		
		if ( hOwner.InCond( TF_COND_ZOOMED ) && !isFired )
		{
			if ( !isAiming )
			{
				isAiming = true
				aim_time = AI_Bot_mySniper.time
				isBlock = false
				
				hOwner.PressAltFireButton(0.01)
				
				// if ( PredictingAndShoot )
				// {
					// TakeOver(true)
				// }
			}
			
			local result = false
			if ( PredictingAndShoot )
				result = AI_Bot_mySniper.PredictingAndShoot()
			else
				result = AI_Bot_mySniper.TryToSnap( immediateTarget )
			
			if ( !result )
			{
				result = CheckForBuilding()
			}
			
			if ( result )
			{
				//+printl("flick shot end")
				
				PredictingAndShoot = false
				isFired = true
				m_flLastFireTime = NetProps.GetPropFloat(hWeapon, "m_flLastFireTime")
				
				duck_eligible_timer = CreateTimer(@() {}, 5)
			}
		
		}
		else
		{
			if ( challagedByASniper && !duck_timeout_timer.IsValid() && duck_eligible_timer.IsValid() )
			{
				SetPropInt(hOwner, "m_afButtonForced", IN_DUCK)
				local ref = hOwner
				duck_timer = CreateTimer(@() SetPropInt(ref, "m_afButtonForced", 0), 0.5)
				duck_timeout_timer = CreateTimer(@() {}, 2)
			}
			
			if ( !isBlock )
			{
				isBlock = true
				
				if ( !block_delay_timer.IsValid() )
				{
					local ref = hWeapon
					block_delay_timer = CreateTimer(@() NetProps.SetPropFloat(ref, "m_flNextPrimaryAttack", Time() + 1000), 0.2)
				}
			}
			
			if ( hOwner.InCond( TF_COND_ZOOMED ) )
			{
				if ( gaze_timer.IsValid() )
					AI_Bot_mySniper.gaze()
			}
			else	// not aiming
			{
				if ( isAiming )
				{
					isAiming = false
					isFired = false
					TakeOver( false )
				}
				
				if ( PredictingAndShoot )
				{
					if ( AI_Bot_mySniper.info_time_gather + 2 < AI_Bot_mySniper.time )
					{
						hOwner.PressAltFireButton(0.1)
						PredictingAndShoot = false
					}
					else
					{
						hOwner.PressAltFireButton(10)
						return -1
					}
				}
				
				local threat = AI_Bot_mySniper.FindClosestThreat(1e30, true, ThreatList)
				if ( threat )
				{
					local distance = ( threat.GetOrigin() - hOwner.GetOrigin() ).LengthSqr()
					if ( distance < 200 * 200 )
					{
						hOwner.PressAltFireButton(10)
						//printl("do not chase target, i should quickscope instead")
					}
					else
					{
						// if my closest enemy is a spy i notice, let the script take over me
						if ( AI_Bot_mySniper.ListOfNoticedSpies.find( threat ) != null )
						{
							//printl("THIS RUNS????????")
							TakeOver( true )
							hOwner.PressAltFireButton(0.2)
							//immediateTarget = threat
							
							//local ref = hOwner
							//snap_after_takeover_timer = CreateTimer(@() ref.SnapEyeAngles(VectorAngles(threat.EyePosition() - ref.EyePosition())), 0.5)
							return -1
						}
						else
						{
							TakeOver( false )
						}
					}
				}
				else
				{
					if ( AI_Bot_mySniper.ListOfNoticedSpies.len() > 0 )
					{
						TakeOver( true )
						hOwner.PressAltFireButton(0.2)
					}
				}
				
				
			}
		}
		
		return -1
	}
	
	function TakeOver( bool, forced = false )
	{
		if ( isTakeOver != bool || forced )
		{
			if ( !forced )
				isTakeOver = bool
			if ( bool )
			{
				hOwner.SetMission(0, true)
				hOwner.SetBehaviorFlag(1023)
				hOwner.AddBotAttribute(IGNORE_FLAG)
				hOwner.AddBotAttribute( IGNORE_ENEMIES )
				//+printl("start taking over")
			}
			else
			{
				hOwner.SetMission(3, true)
				hOwner.ClearBehaviorFlag(1023)
				hOwner.RemoveBotAttribute( IGNORE_ENEMIES )
				//+printl("stop taking over")
			}
		}
	}
	
	
	function CheckForBuilding()
	{
		local max = 100000
		local start_calc = hOwner.EyePosition()
		local EyeAngles_fwd = hOwner.EyeAngles().Forward()
		local end_calc = start_calc + EyeAngles_fwd * max
		
		local trace = {
			start  = start_calc,
			// end    = target.EyePosition(),
			end    = end_calc,
			// mask   = (CONTENTS_SOLID|CONTENTS_MOVEABLE|CONTENTS_WINDOW|CONTENTS_DEBRIS|CONTENTS_MONSTER),	//MASK_OPAQUE,
			// mask   = (CONTENTS_SOLID|CONTENTS_DEBRIS|CONTENTS_HITBOX),
			mask   = -1,	//MASK_ALL
			// ignore = bot
			ignore = hOwner
		}
		TraceLineEx(trace)
		
		if ( trace.hit )
		{
			local classname = trace.enthit.GetClassname()
			// printl(classname)
			if ( classname == "obj_sentrygun" || classname == "obj_dispenser" || classname == "obj_teleporter" )
			{
				
				if (aim_time + 0.2 < AI_Bot_mySniper.time)
				{
					
					SetPropFloat(hWeapon, "m_flNextPrimaryAttack", 0)
					//printl(NetProps.GetPropFloat(instance.hWeapon, "m_flNextPrimaryAttack"))
					
					//instance.hWeapon.PrimaryAttack()
					hOwner.PressFireButton(0.01)
					
					gaze_timer = CreateTimer(@() {}, 0.1)
					
					// printl("flick shot")
					return true
					
					// return ( instance.m_flLastFireTime != NetProps.GetPropFloat(instance.hWeapon, "m_flLastFireTime") )
				}
			}
		}
		return false
	}
		
	function isThisGuyYours(hPlayer, reason)
	{
		if ( hOwner == hPlayer )
		{
			if (reason == "death")
			{
				hOwner.TerminateScriptScope()
			}
			return true		// Yuh Uh
		}
		else
			return false	// Nuh Uh
	}
	
	
}


__CollectGameEventCallbacks(prosniper)


::AI_Bot_ProSniper <- class {
	function constructor( bot, instance, accuracy = false ) {
		this.bot       = bot
		this.scope     = bot.GetScriptScope()
		this.team      = bot.GetTeam()
		this.cur_pos	 = bot.GetOrigin()
		this.cur_eye_ang = bot.EyeAngles()
		this.cur_eye_pos = bot.EyePosition()
		this.cur_eye_fwd = bot.EyeAngles().Forward()
		this.locomotion = bot.GetLocomotionInterface()
		
		this.time = Time()
		
		this.path_points = []
		this.path_index = 0
		this.path_areas = {}
		
		this.path_recompute_time = 0.0
		
		//this.navdebug = false
		
		//this.mins = bot.GetBoundingMins()
		//this.maxs = bot.GetBoundingMaxs()
		
		this.instance = instance
		this.accurate = accuracy
	}
	
	bot       = null
	scope     = null
	team      = null
	cur_pos		= null
	cur_eye_ang = null
	cur_eye_pos = null
	cur_eye_fwd = null
	locomotion = null
	
	time = 0
	
	path_points = []
	path_index = 0
	path_areas = {}
	
	path_recompute_time = 0
	
	navdebug = false
	
	instance	= null
	accurate	= false
	accuracy_override	= null
	ListOfNoticedSpies	= []
	ListOfSpiesInView	= {}
	immediateTarget 	= null
	
	info_pos	= Vector()
	info_vel	= Vector()
	info_ang	= QAngle()
	info_time_gather = 0
	
	gaze_threat = null
	gaze_dir = null
	
	function GatherInfo(pos, vel, ang, time_gather)
	{
		info_pos	= pos
		info_vel	= vel
		info_ang	= ang
		info_time_gather = time_gather
	}
	
	function PredictingAndShoot()
	{
		// printl("predicting")
		local tray = prosniper.head_data[TF_CLASS_SPY]
		
		local rotation = info_ang
		rotation.x = 0
		local middle = RotatePosition( Vector(), rotation, tray.middle )
		local des = info_pos + middle + info_vel * ( time - info_time_gather )
		local dir = VectorAngles(des - cur_eye_pos)
		gaze_dir = dir
		
		// prosniper.hMarker.SetAbsOrigin(des)
		bot.GetLocomotionInterface().FaceTowards( des )
		if (instance.aim_time + 0.2 < time)
		{
			bot.SnapEyeAngles(dir)
			NetProps.SetPropVector(bot, "pl.v_angle", dir + Vector())
			NetProps.SetPropFloat(instance.hWeapon, "m_flNextPrimaryAttack", 0)
			//printl(NetProps.GetPropFloat(instance.hWeapon, "m_flNextPrimaryAttack"))
			
			//instance.hWeapon.PrimaryAttack()
			bot.PressFireButton(0.01)
			
			accuracy_override = false
			local ref = accuracy_override
			instance.gaze_timer = CreateTimer(@() ref = null, 1)
			
			//printl("predict shot")
			
			if ( instance.m_flLastFireTime != NetProps.GetPropFloat(instance.hWeapon, "m_flLastFireTime") )
			{
				//+printl(instance.m_flLastFireTime + " " + NetProps.GetPropFloat(instance.hWeapon, "m_flLastFireTime"))
				return true
			}
			
			return ( instance.m_flLastFireTime != NetProps.GetPropFloat(instance.hWeapon, "m_flLastFireTime") )
		}
	}
	
	function TryToSnap( immediateTarget )
	{
		local ThreatList = FindVisibleThreat(9999, true, true)
		
		// local notice_spy = false
		if ( !ThreatList.len() )
		{
			if ( ListOfNoticedSpies.len() > 0 )
			{
				local spy_threat = FindCloserSpyThreat()
				bot.GetLocomotionInterface().FaceTowards( spy_threat.EyePosition() )
				
				local pitch = VectorAngles(spy_threat.EyePosition() - cur_eye_pos).x
				local dir = QAngle(pitch, cur_eye_ang.y, cur_eye_ang.z)
				gaze_dir = dir
				NetProps.SetPropVector(bot, "pl.v_angle", dir + Vector())
				
				ThreatList.append( spy_threat )
				// notice_spy = true
			}
		}
		
		foreach ( threat in ThreatList )
		{
			if ( IsInFieldOfView( threat, true ) || ( instance.isTakeOver && instance.aim_time + 1.5 < time ) )
			{
				gaze_threat = threat
				local tray = prosniper.head_data[threat.GetPlayerClass()]
				
				local rotation = threat.EyeAngles()
				rotation.x = 0
				local middle = RotatePosition( Vector(), rotation, tray.middle )
				local des = threat.GetBoneOrigin(tray.bone) + middle
				local dir = VectorAngles(des - cur_eye_pos)
				gaze_dir = dir
				
				bot.GetLocomotionInterface().FaceTowards( des )
				if (instance.aim_time + 0.2 < time)
				{
					bot.SnapEyeAngles(dir)
					NetProps.SetPropVector(bot, "pl.v_angle", dir + Vector())
					NetProps.SetPropFloat(instance.hWeapon, "m_flNextPrimaryAttack", 0)
					//printl(NetProps.GetPropFloat(instance.hWeapon, "m_flNextPrimaryAttack"))
					
					//instance.hWeapon.PrimaryAttack()
					bot.PressFireButton(0.01)
					
					instance.gaze_timer = CreateTimer(@() {}, 0.1)
					
					//+printl("flick shot")
					return true
					
					return ( instance.m_flLastFireTime != NetProps.GetPropFloat(instance.hWeapon, "m_flLastFireTime") )
				}
				break
			}
		}
		
		return false
	}
	
	function gaze()
	{
		//+printl("gazing")
		if ( !gaze_dir )
		{
			instance.gaze_timer.Destroy()
			return
		}
		
		// evaluate accuracy
		local accuracy = accurate
		if ( accuracy_override )
		{
			accuracy = true
		}
		else if ( accuracy_override != null )
		{
			accuracy = false
		}
		
		if ( accuracy && gaze_threat )
		{
			// if ( !gaze_threat )
			// {
				// instance.gaze_timer.Destroy()
				// return
			// }
			
			local tray = prosniper.head_data[gaze_threat.GetPlayerClass()]
		
			local rotation = gaze_threat.EyeAngles()
			rotation.x = 0
			local middle = RotatePosition( Vector(), rotation, tray.middle )
			local des = gaze_threat.GetBoneOrigin(tray.bone) + middle
			local dir = VectorAngles(des - cur_eye_pos)
			gaze_dir = dir
		}
		bot.SnapEyeAngles(gaze_dir)
		NetProps.SetPropVector(bot, "pl.v_angle", gaze_dir + Vector())
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
	
	function IsThreatVisible(target, isScoping = false) {
		return IsInFieldOfView(target, false, isScoping) && IsVisible(target)
	}
	
	function GetThreatDistanceSqr(target) {
		return (target.GetOrigin() - cur_pos).LengthSqr()
	}
	
	function FindClosestThreat(min_dist_sqr, must_be_visible = true, threatList = []) {
		local closestThreat = null
		local closestThreatDist = min_dist_sqr

		foreach (player in threatList) {
		
			if ( !IsAlive(player) || player.GetTeam() == team || (must_be_visible && !IsThreatVisible(player))) continue

			local dist = GetThreatDistanceSqr(player)
			if (dist < closestThreatDist) {
				closestThreat = player
				closestThreatDist = dist
			}
		}
		return closestThreat
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
	
	function FindVisibleThreat(min_dist_sqr, must_be_visible = true, isScoping = true) {
		//local closestThreat = null
		//local closestThreatDist = min_dist_sqr
		local ThreatList = []
		//ListOfSpiesInView.clear()
		//ListOfNoticedSpies.clear()

		foreach (player in findAllPlayer(true)) {

			if (player == bot || !IsAlive(player) || player.GetTeam() == team || (must_be_visible && !IsThreatVisible(player, isScoping))) continue
			
			if ( player.GetPlayerClass() == TF_CLASS_SPY )
			{
				// he's a spy
				if ( !IsThisASpy(player) )
					continue	// he's not suspicious, ignore
					
				EntFireByHandle(bot, "SpeakResponseConcept", "TLK_PLAYER_CLOAKEDSPY", 0, null, null)
			}
			ThreatList.append(player)
			
		}
		return ThreatList
	}
	
	function IsThisASpy(player)
	{
		local disguisedAs = player.GetDisguiseTarget()
		if ( disguisedAs && disguisedAs.GetTeam() != player.GetTeam() )	// cannot write disguisedAs.GetTeam() == team because you sometimes disguise as a spec
		{
			// he's disguised
			local distance = ( player.GetOrigin() - bot.GetOrigin() ).LengthSqr()
			if ( !player.IsStealthed() )
			{
				if ( distance < 700 * 700 )	// a disguised spy is close
				{
					local delta = player.GetAbsVelocity()
					if ( delta.LengthSqr() > 90000)	// 300 * 300	// he's running
					{
						delta.Norm()
						local target_fwd = (cur_pos - player.GetOrigin())
						if (target_fwd.Dot(delta) >= 0.4226)	// cos (130/2)	// he's running at me
						{
							if ( prosniper.IsInFieldOfView(player, bot, false, 0.766) )	// cos(80/2)
							{
								// he's looking at me
								if ( ListOfNoticedSpies.find(player) == null )
									ListOfNoticedSpies.append(player)
								
								return true		///
							}
						}
					}
				}
			}
		}
		else if ( !player.IsStealthed() )
			return true
		
		// not suspicious enough but keeping track incase he cloaked away
		//ListOfSpiesInView[player] = player.IsStealthed()
		
		if ( !(player in ListOfSpiesInView) )
		{
			ListOfSpiesInView[player] <- {
				lastest_tick_in_sight			= GetFrameCount(),
				IsStealthed				= player.IsStealthed(),
				IsStealthed_last_tick	= player.IsStealthed(),
				IsInView				= true									// i wanna keeping track of all spy cloak status
			}
		}
		else
		{
			ListOfSpiesInView[player].lastest_tick_in_sight	= GetFrameCount()
			ListOfSpiesInView[player].IsStealthed	= player.IsStealthed()
			ListOfSpiesInView[player].IsInView		= true
		}
		
		return false
	}
	
	function OnUpdate() {
		cur_pos     = bot.GetOrigin()
		//cur_vel     = bot.GetAbsVelocity()
		//cur_speed   = cur_vel.Length()
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