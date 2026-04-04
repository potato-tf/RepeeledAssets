local ROOT = getroottable()

foreach(k, v in ::NetProps.getclass())
	if (k != "IsValid" && !(k in ROOT))
		ROOT[k] <- ::NetProps[k].bindenv(::NetProps)

foreach(k, v in ::Entities.getclass())
	if (k != "IsValid" && !(k in ROOT))
		ROOT[k] <- ::Entities[k].bindenv(::Entities)

const TEAM_ANY		= -2

const DEFAULT_ROUTE		= 0
const FASTEST_ROUTE		= 1
const SAFEST_ROUTE		= 2
const RETREAT_ROUTE		= 3

const MISSION_DESTROY_SENTRIES	= 2
const MISSION_SNIPER			= 3
const MISSION_SPY				= 4
const MISSION_ENGINEER			= 5
const MISSION_REPROGRAMMED		= 6

const NUM_TRAVERSE_TYPES		= 9

::ConstructPathToTable <- function( goalArea, hTable )
{
	if ( !goalArea )
		goalArea = null;

	local i = 0;
	//printl("ConstructPathToTable: " + goalArea.area + " / " + goalArea.m_parent.area + " / " + goalArea.m_parent.m_parent.area)
	local area
	for( area = goalArea; (area && area.m_parent); area = area.m_parent )
	{
		hTable["area"+i] <- area.area;
		i++
	}
	
	area = goalArea
	local prevArea
	while (area) 
	{
		//if (prevArea)
		//	printl("is this connected: " + prevArea.area + "/" + area.area + " : " + area.area.IsConnected(prevArea.area, -1))
			
		prevArea = area
		area = area.m_parent
	}
}


::NavAreaBuildPath <- function( startArea, goalArea, goalPos, costFunc, closestArea = null, maxPathLength = 0.0, teamID = TEAM_ANY, ignoreNavBlockers = false ) {
	if ( closestArea )
	{
		closestArea = startArea
	}
	
	if (startArea == null)
		return false
	
	//startArea.SetParent( null )		/// optimize
	startArea.m_parent = null
	startArea.m_parentHow = NUM_TRAVERSE_TYPES
	
	if (goalArea != null && goalArea.IsBlocked( teamID, ignoreNavBlockers ))
		goalArea = null
	
	if (goalArea == null && goalPos == null)
		return false
	
	// if we are already in the goal area, build trivial path
	if ( startArea == goalArea )	/// check
	{
		return true;
	}
	
	// determine actual goal position
	local actualGoalPos = (goalPos) ? goalPos : goalArea.GetCenter()
	
	
	// start search
	ClearSearchLists()

	// compute estimate of path length
	/// @todo Cost might work as "manhattan distance"
	// startArea.SetTotalCost( (startArea.GetCenter() - actualGoalPos).Length() )	/// optimize
	startArea.m_totalCost = (startArea.GetCenter() - actualGoalPos).Length()
	
	local initCost = costFunc.operator( startArea, null, null, null, -1.0 );	
	if (initCost < 0.0)
		return false;
	//startArea.SetCostSoFar( initCost );		/// optimize
	startArea.m_costSoFar = initCost;
	startArea.m_pathLengthSoFar = 0.0;

	startArea.AddToOpenList();
	
	// keep track of the area we visit that is closest to the goal
	local closestAreaDist = startArea.m_totalCost;
	
	// do A* search
	while( !CTFNavArea.IsOpenListEmpty() )
	{
		// get next area to check
		local area = CTFNavArea.PopOpenList();


		// don't consider blocked areas
		if ( area.IsBlocked( teamID, ignoreNavBlockers ) )
			continue;

		// check if we have found the goal area or position
		if (area == goalArea || (goalArea == null && goalPos && area.ContainsOrigin( goalPos )))
		{
			if (closestArea)
			{
				closestArea = area;
			}

			return true;
		}

		// search adjacent areas
		enum SearchType
		{
			SEARCH_FLOOR	//, SEARCH_LADDERS, SEARCH_ELEVATORS
		};
		local searchWhere = SearchType.SEARCH_FLOOR;
		local searchIndex = 0;

		local dir = NORTH;
		local floorList = area.GetAdjacentAreas( NORTH );
		local floorList_len = floorList.len()

		local ladderUp = true;
		local ladderList = null;
		//enum { AHEAD = 0, LEFT, RIGHT, BEHIND, NUM_TOP_DIRECTIONS };
		//local ladderTopDir = AHEAD;
		local bHaveMaxPathLength = ( maxPathLength > 0.0 );
		local length = -1;
		
		while( true )
		{
			local newArea = null;
			local how;
			local ladder = null;
			local elevator = null;

			//
			// Get next adjacent area - either on floor or via ladder
			//
			//if ( searchWhere == SEARCH_FLOOR )
			//{
				// if exhausted adjacent connections in current direction, begin checking next direction
				if ( searchIndex >= floorList_len )
				{
					++dir;

					if ( dir == NUM_DIRECTIONS )
					{
						// checked all directions on floor - check ladders next
						//searchWhere = SEARCH_LADDERS;

						//ladderList = area->GetLadders( CNavLadder::LADDER_UP );
						//searchIndex = 0;
						//ladderTopDir = AHEAD;
						
						break
					}
					else
					{
						// start next direction
						floorList = area.GetAdjacentAreas( dir );
						floorList_len = floorList.len()
						searchIndex = 0;
					}

					continue;
				}

				local floorConnect = floorList[searchIndex];		/// verify
				newArea = floorConnect;								//floorConnect.area;
				//length = floorConnect.length;						/// unimplemented. https://github.com/ValveSoftware/source-sdk-2013/blob/master/src/game/server/nav_file.cpp#L728 connect->length = ( connect->area->GetCenter() - GetCenter() ).Length();
				how = dir;
				++searchIndex;

				//if ( IsX360() && searchIndex < floorList->Count() )
				//{
				//	PREFETCH360( floorList->Element( searchIndex ).area, 0  );
				//}
			//}
			//else if ( searchWhere == SEARCH_LADDERS )
			//{
				/// unimplemented
			//}
			//else // if ( searchWhere == SEARCH_ELEVATORS )
			//{
				/// unimplemented
			//}


			// don't backtrack
			assert( newArea );
			if ( newArea == area.m_parent )
				continue;
			if ( newArea == area ) // self neighbor?
				continue;

			// don't consider blocked areas
			if ( newArea.IsBlocked( teamID, ignoreNavBlockers ) )
				continue;

			local newCostSoFar = costFunc.operator( newArea, area, ladder, elevator, length );

			// NaNs really mess this function up causing tough to track down hangs. If
			//  we get inf back, clamp it down to a really high number.
			//DebuggerBreakOnNaN_StagingOnly( newCostSoFar );
			//if ( IS_NAN( newCostSoFar ) )
			//	newCostSoFar = 1e30;
			
			if ( newCostSoFar == 1.0/0 )
				newCostSoFar = 1e30;

			// check if cost functor says this area is a dead-end
			if ( newCostSoFar < 0.0 )
				continue;

			// Safety check against a bogus functor.  The cost of the path
			// A...B, C should always be at least as big as the path A...B.
			//// // l("bogus functor: " + newCostSoFar + " : " + area.m_costSoFar + " " + area.area)
			//assert( newCostSoFar >= area.m_costSoFar );	/// optimize

			// And now that we've asserted, let's be a bit more defensive.
			// Make sure that any jump to a new area incurs some pathfinsing
			// cost, to avoid us spinning our wheels over insignificant cost
			// benefit, floating point precision bug, or busted cost functor.
			local minNewCostSoFar = area.m_costSoFar * 1.00001 + 0.00001;
			newCostSoFar = MAX( newCostSoFar, minNewCostSoFar );
				
			// stop if path length limit reached
			if ( bHaveMaxPathLength )
			{
				// keep track of path length so far
				local deltaLength = ( newArea.GetCenter() - area.GetCenter() ).Length();
				local newLengthSoFar = area.m_pathLengthSoFar + deltaLength;
				if ( newLengthSoFar > maxPathLength )
					continue;
				
				newArea.m_pathLengthSoFar = newLengthSoFar;
			}

			if ( ( newArea.IsOpen() || newArea.IsClosed() ) && newArea.m_costSoFar <= newCostSoFar )
			{
				// this is a worse path - skip it
				continue;
			}
			else
			{
				// compute estimate of distance left to go
				//local distSq = ( newArea.GetCenter() - actualGoalPos ).LengthSqr();
				//local newCostRemaining = ( distSq > 0.0 ) ? FastSqrt( distSq ) : 0.0 ;
				local newCostRemaining = ( newArea.GetCenter() - actualGoalPos ).Length();

				// track closest area to goal in case path fails
				if ( closestArea && newCostRemaining < closestAreaDist )
				{
					closestArea = newArea;
					closestAreaDist = newCostRemaining;
				}
				
				//newArea.SetCostSoFar( newCostSoFar );		/// optimize
				newArea.m_costSoFar = newCostSoFar;
				//newArea.SetTotalCost( newCostSoFar + newCostRemaining );
				newArea.m_totalCost = newCostSoFar + newCostRemaining;
				
				// doesn't do anything
				// if ( newArea.IsClosed() )
				// {
					// newArea.RemoveFromClosedList();
				// }

				if ( newArea.IsOpen() )
				{
					// area already on open list, update the list order to keep costs sorted
					newArea.UpdateOnOpenList();
				}
				else
				{
					newArea.AddToOpenList();
				}

				//newArea.SetParent( area, how );		/// optimize
				newArea.m_parent = area
				newArea.m_parentHow = how
			}
		}

		// we have searched this area
		area.AddToClosedList();
	}

	return false;
}

::CTFBotPathCost <- class {
	m_me = null;
	m_routeType = 0;
	m_stepHeight = 18;
	m_maxJumpHeight = 72;
	m_maxDropHeight = 1000;
	
	constructor( me, routeType )
	{
		m_me = me;
		m_routeType = routeType;
		m_stepHeight = me.GetLocomotionInterface().GetStepHeight()
		m_maxJumpHeight = me.GetLocomotionInterface().GetMaxJumpHeight()
		m_maxDropHeight = me.GetLocomotionInterface().GetDeathDropHeight()
	}
	
	function operator(baseArea, fromArea, ladder, elevator, length)
	{
		local area = baseArea
		
		if ( fromArea == null )
		{
			// first area in path, no cost
			return 0.0
		}
		else
		{
			if ( !m_me.GetLocomotionInterface().IsAreaTraversable( area.getArea() ) )
			{
				return -1.0
			}
			
			// in training, avoid capturing the point until the human trainee does so
			/// unimplemented
			
			// don't path through enemy spawn rooms
			if ( ( m_me.GetTeam() == TF_TEAM_RED && area.HasAttributeTF( TF_NAV_SPAWN_ROOM_BLUE ) ) ||
				 ( m_me.GetTeam() == TF_TEAM_BLUE && area.HasAttributeTF( TF_NAV_SPAWN_ROOM_RED ) ) )
			{
				if ( GetRoundState() != GR_STATE_TEAM_WIN )
				{
					return -1.0;
				}
			}
			
			// compute distance traveled along path so far
			local dist;

			if ( ladder )
			{
				//dist = ladder->m_length;
			}
			else if ( length > 0.0 )
			{
				dist = length;
			}
			else
			{
				dist = ( area.GetCenter() - fromArea.GetCenter() ).Length();
			}
			
			
			// check height change
			local deltaZ = fromArea.ComputeAdjacentConnectionHeightChange( area );
			
			if ( deltaZ >= m_stepHeight )
			{
				if ( deltaZ >= m_maxJumpHeight )
				{
					// too high to reach
					return -1.0;
				}

				// jumping is slower than flat ground
				local jumpPenalty = 2.0;
				dist *= jumpPenalty;
			}
			else if ( deltaZ < -m_maxDropHeight )
			{
				// too far to drop
				return -1.0;
			}
			
			// add a random penalty unique to this character so they choose different routes to the same place
			local preference = 1.0;
			
			if ( m_routeType == DEFAULT_ROUTE && !m_me.IsMiniBoss() ) 
			{
				// this term causes the same bot to choose different routes over time,
				// but keep the same route for a period in case of repaths
				local timeMod = ( Time() / 10 ).tointeger() + 1;
				preference = 1.0 + 50.0 * ( 1.0 + cos( m_me.entindex() * area.GetID() * timeMod ) );
			}
			
			//if ( m_routeType == SAFEST_ROUTE )
			//{
				/// unimplemented
			//}
			
			//if ( m_me.GetPlayerClass() == TF_CLASS_SPY )
			//{
				/// unimplemented
			//}
			
			local cost = ( dist * preference )
			
			if ( area.HasAttributes( NAV_MESH_FUNC_COST ) )
			{
				cost *= area.ComputeFuncNavCost_alt( m_me );	/// optimize
				//DebuggerBreakOnNaN_StagingOnly( cost );
			}
			
			//// // l("cost : " + cost + " " + area.m_costSoFar + " " + area.area)
			return cost + fromArea.m_costSoFar;
		}
	}
}

CTFNavArea <- class {

	//function _newmember(index, value, attributes, isstatic) {
		//// // ("New member declared: " + index + 
		//	  ", isstatic=" + isstatic + 
		//	  ", attributes=" + attributes + 
		//	  ", value type=" + typeof value + "\n");
	//	if (attributes != null)
			//// // l("this is an oddity?")
	//	if (index == "m_openList")
	//	{
			
			//// // l("this is an oddity???????????")
	//		return
	//	}
		
		
		////// // l(m_openList)
		// store manually
	//	rawset(index, value);
	//}
	
	
	area = null
	
	m_parent = null
	m_parentHow = 0
	
	m_totalCost = 0
	m_costSoFar = 0
	m_pathLengthSoFar = 0
	
	m_funcNavCostVector = null
	m_nwCorner			= Vector()
	m_seCorner			= Vector()
	m_neZ				= 0
	m_swZ				= 0
	m_invDxCorners		= 0
	m_invDyCorners		= 0
	
	m_prevOpen		= null
	m_nextOpen		= null
	m_openMarker	= 0
	m_marker	= 0
	
	constructor(area) {
		this.area = area
		m_nwCorner = area.GetCorner(0)
		m_seCorner = area.GetCorner(2)
		m_neZ				= area.GetCorner(1).z
		m_swZ				= area.GetCorner(3).z
		m_invDxCorners		= 0
		m_invDyCorners		= 0
		
		if ( ( m_seCorner.x - m_nwCorner.x ) > 0 && ( m_seCorner.y - m_nwCorner.y ) > 0 )
		{
			m_invDxCorners = 1.0 / ( m_seCorner.x - m_nwCorner.x );
			m_invDyCorners = 1.0 / ( m_seCorner.y - m_nwCorner.y );
		}
		else
		{
			m_invDxCorners = m_invDyCorners = 0;
		}
		
		m_funcNavCostVector = []
		
	}
	
	//function test()
		////// // l(rawget(m_openList))
	
	function getArea()
		return area
	
	
	function HasAttributeTF(arg)
		return area.HasAttributeTF(arg)
	
	function HasAttributes(arg)
		return area.HasAttributes(arg)
	
	function GetCenter()
		return area.GetCenter()
	
	function GetID()
		return area.GetID()
	
	function IsBlocked( team, affects_flow )
		return area.IsBlocked( team, affects_flow )
	
	function GetAdjacentAreas( dir )
	{
		local table = {}
		area.GetAdjacentAreas( dir, table )
		
		local floorList = []
		foreach (floor in table)
			floorList.append(GetCTFNavAreaWrapper(floor))
		
		return floorList
	}
	
	function ComputeAdjacentConnectionHeightChange(destinationArea)
	{
		// find which side it is connected on
		local dir;
		for( dir=0; dir<NUM_DIRECTIONS; ++dir )
		{
			if ( area.IsConnected( destinationArea.getArea(), dir ) )
				break
		}
		
		if ( dir == NUM_DIRECTIONS )
			return FLT_MAX
		
		local myEdge = Vector()
		local halfWidth = { value = 0};
		ComputePortal( destinationArea, dir, myEdge, halfWidth );

		local otherEdge = Vector()
		destinationArea.ComputePortal( this, OppositeDirection( dir ), otherEdge, halfWidth );
		
		return otherEdge.z - myEdge.z
	}
	function ComputePortal( to, dir, center, halfWidth )
	{
		if ( dir == NORTH || dir == SOUTH )
		{
			if ( dir == NORTH )
			{
				center.y = m_nwCorner.y;
			}
			else
			{
				center.y = m_seCorner.y;
			}

			local left = MAX( m_nwCorner.x, to.m_nwCorner.x );
			local right = MIN( m_seCorner.x, to.m_seCorner.x );

			// clamp to our extent in case areas are disjoint
			if ( left < m_nwCorner.x )
			{
				left = m_nwCorner.x;
			}
			else if ( left > m_seCorner.x )
			{
				left = m_seCorner.x;
			}

			if ( right < m_nwCorner.x )
			{
				right = m_nwCorner.x;
			}
			else if ( right > m_seCorner.x )
			{
				right = m_seCorner.x;
			}

			center.x = ( left + right )/2.0
			halfWidth.value = ( right - left )/2.0
		}
		else	// EAST or WEST
		{
			if ( dir == WEST )
			{
				center.x = m_nwCorner.x;
			}
			else
			{
				center.x = m_seCorner.x;
			}

			local top = MAX( m_nwCorner.y, to.m_nwCorner.y );
			local bottom = MIN( m_seCorner.y, to.m_seCorner.y );

			// clamp to our extent in case areas are disjoint
			if ( top < m_nwCorner.y )
			{
				top = m_nwCorner.y;
			}
			else if ( top > m_seCorner.y )
			{
				top = m_seCorner.y;
			}

			if ( bottom < m_nwCorner.y )
			{
				bottom = m_nwCorner.y;
			}
			else if ( bottom > m_seCorner.y )
			{
				bottom = m_seCorner.y;
			}

			center.y = (top + bottom)/2.0
			halfWidth.value = (bottom - top)/2.0
		}

		center.z = GetZ_fast2( center.x, center.y, dir);	/// optimize
	}
	function GetZ( x, y )
	{
		// guard against division by zero due to degenerate areas
	//#ifdef _X360 
		// do the compare-against-zero on the integer unit to avoid a fcmp
		// IEEE754 float positive zero is simply 0x00. There is also a 
		// floating-point negative zero (-0.0f == 0x80000000), but given 
		// how m_inv is computed earlier, that's not a possible value for
		// it here, so we don't have to check for that.
		//
		// oddly, the compiler isn't smart enough to do this on its own
	//	if ( *reinterpret_cast<const unsigned *>(&m_invDxCorners) == 0 ||
	//		 *reinterpret_cast<const unsigned *>(&m_invDyCorners) == 0 )
	//		return m_neZ;
	//#else
		if (m_invDxCorners == 0.0 || m_invDyCorners == 0.0)
			return m_neZ;
	//#endif

		local u = (x - m_nwCorner.x) * m_invDxCorners
		local v = (y - m_nwCorner.y) * m_invDyCorners

		// clamp Z values to (x,y) volume
		
		if (u < 0.0) u = 0.0
		else if (u > 1.0) u = 1.0

		if (v < 0.0) v = 0.0
		else if (v > 1.0) v = 1.0

		local northZ = m_nwCorner.z + u * (m_neZ - m_nwCorner.z)
		local southZ = m_swZ + u * (m_seCorner.z - m_swZ)

		return northZ + v * (southZ - northZ)
	}
	function GetZ_fast2(x, y, dir)
	{
		switch ( dir )
		{
			case NORTH: // NW → NE
			{
				local u = (x - m_nwCorner.x) * m_invDxCorners;
				if (u < 0.0) u = 0.0;
				else if (u > 1.0) u = 1.0;
				return m_nwCorner.z + u * (m_neZ - m_nwCorner.z);
			}

			case SOUTH: // SW → SE
			{
				local u = (x - m_nwCorner.x) * m_invDxCorners;
				if (u < 0.0) u = 0.0;
				else if (u > 1.0) u = 1.0;
				return m_swZ + u * (m_seCorner.z - m_swZ);
			}

			case WEST: // NW → SW
			{
				local u = (y - m_nwCorner.y) * m_invDyCorners;
				if (u < 0.0) u = 0.0;
				else if (u > 1.0) u = 1.0;
				return m_nwCorner.z + u * (m_swZ - m_nwCorner.z);
			}

			case EAST: // NE → SE
			{
				local u = (y - m_nwCorner.y) * m_invDyCorners;
				if (u < 0.0) u = 0.0;
				else if (u > 1.0) u = 1.0;
				return m_neZ + u * (m_seCorner.z - m_neZ);
			}

			default:
				return m_neZ;
		}
	
		
	}
	function OppositeDirection( dir )
	{
		switch( dir )
		{
			case NORTH: return SOUTH
			case SOUTH: return NORTH
			case EAST:	return WEST
			case WEST:	return EAST
			default: break
		}

		return NORTH;
	}
	
	function ComputeFuncNavCost_alt( who )
	{
		local funcCost = 1.0

		local avoid_count = 0
		foreach (cost in m_funcNavCostVector)
		{
			local mul = cost.GetCostMultiplier_alt( who )
			if ( mul == 1)
				continue
			
			if ( mul )
				avoid_count--
			else
				avoid_count++
		}
		
		return funcCost * pow( 25, avoid_count );
	}
	// function ComputeFuncNavCost( who )
	// {
		// local funcCost = 1.0

		// /// causes inf or 0 if there are too many of the same type in a row
		// for( local i=0; i<m_funcNavCostVector.len(); ++i )
		// {
			// if ( m_funcNavCostVector[i] != null )
			// {
				// funcCost *= m_funcNavCostVector[i].GetCostMultiplier( who )
			// }
		// }
		
		// return funcCost
	// }
	// function ComputeFuncNavCost_mod( who )
	// {
		// local funcCost = 1.0

		// /// causes inf or 0 if there are too many of the same type in a row
		// foreach ( cost in m_funcNavCostVector)
		// {
			// if ( cost != null )
			// {
				// funcCost *= cost.GetCostMultiplier( who )
			// }
		// }
		
		// return funcCost
	// }
	
	
	
	
	
	// function ClearAllNavCostEntities()
	// {
		// m_funcNavCostVector.clear()
	// }
	
	// function AddFuncNavCostEntity(cost)
	// {
		// m_funcNavCostVector.append( cost )
	// }

	
	// function GetParent()
	// {
		// return m_parent
	// }
	// function GetParentHow()
	// {
		// return m_parentHow
	// }
	// function GetTotalCost()
	// {
		// return m_totalCost
	// }
	// function GetCostSoFar()
	// {
		// return m_costSoFar
	// }
	// function GetPathLengthSoFar()
	// {
		// return m_pathLengthSoFar
	// }
	
	
	// function SetParent( parent, how = NUM_TRAVERSE_TYPES )
	// {
		// m_parent = parent
		// m_parentHow = how
	// }
	

	// function SetTotalCost( value )
	// {
		// assert (value >= 0.0) // && !IS_NAN(value))
		
		// m_totalCost = value
	// }
	
	// function SetCostSoFar( value )
	// {
		// assert (value >= 0.0) // && !IS_NAN(value))
		
		// m_costSoFar = value
	// }
	
	// function SetPathLengthSoFar( value )
	// {
		// assert (value >= 0.0) // && !IS_NAN(value))
		
		// m_pathLengthSoFar = value
	// }
	
	function AddToOpenList()
	{
		assert ( (m_openList && m_openList.m_prevOpen == null) || m_openList == null )
		
		if ( IsOpen() )
		{
			// already on list
			return;
		}

		// mark as being on open list for quick check
		m_openMarker = m_masterMarker;

		// if list is empty, add and return
		if ( m_openList == null )
		{
			m_openList = this;
			m_openListTail = this;
			this.m_prevOpen = null;
			this.m_nextOpen = null;
			return;
		}

		// insert self in ascending cost order
		local area, last = null;
		for( area = m_openList; area; area = area.m_nextOpen )
		{
			if ( m_totalCost < area.m_totalCost )
			{
				break;
			}
			last = area;
		}

		if ( area )
		{
			// insert before this area
			this.m_prevOpen = area.m_prevOpen;

			if ( this.m_prevOpen )
			{
				this.m_prevOpen.m_nextOpen = this;
			}
			else
			{
				m_openList = this;
			}

			this.m_nextOpen = area;
			area.m_prevOpen = this;
		}
		else
		{
			// append to end of list
			last.m_nextOpen = this;
			this.m_prevOpen = last;
		
			this.m_nextOpen = null;

			m_openListTail = this;
		}
		
		assert( (m_openList && m_openList.m_prevOpen == null) || m_openList == null );
	}
	
	function AddToClosedList()
		Mark()
		
	function Mark()		
		m_marker = m_masterMarker
		
	function IsOpen()
		return (m_openMarker == m_masterMarker) // ? true : false;
		
	function IsClosed()
	{
		if (IsMarked() && !IsOpen())
			return true;

		return false;
	}
	function IsMarked()
		return (m_marker == m_masterMarker) // ? true : false;
		
	function IsOpenListEmpty()
	{
		assert ( (m_openList && m_openList.m_prevOpen == null) || m_openList == null )
		return (!m_openList)	// ? false : true;
	}
	function PopOpenList()
	{
		assert ( (m_openList && m_openList.m_prevOpen == null) || m_openList == null )

		if ( m_openList )
		{
			local area = m_openList;
		
			// disconnect from list
			area.RemoveFromOpenList();
			area.m_prevOpen = null;
			area.m_nextOpen = null;

			assert ( (m_openList && m_openList.m_prevOpen == null) || m_openList == null )
			
			return area;
		}

		assert ( (m_openList && m_openList.m_prevOpen == null) || m_openList == null )

		return null;
	}
	
	function RemoveFromOpenList()
	{
		if ( m_openMarker == 0 )
		{
			// not on the list
			return;
		}

		if ( m_prevOpen )
		{
			m_prevOpen.m_nextOpen = m_nextOpen;
		}
		else
		{
			m_openList = m_nextOpen;
		}
		
		if ( m_nextOpen )
		{
			m_nextOpen.m_prevOpen = m_prevOpen;
		}
		else
		{
			m_openListTail = m_prevOpen;
		}
		
		// zero is an invalid marker
		m_openMarker = 0;
	}
	// function RemoveFromClosedList()
	// {
	// // since "closed" is defined as visited (marked) and not on open list, do nothing
	// }
	
	function UpdateOnOpenList()
	{
		// since value can only decrease, bubble this area up from current spot
		while( m_prevOpen && this.m_totalCost < m_prevOpen.m_totalCost )
		{
			// swap position with predecessor
			local other = m_prevOpen;
			local before = other.m_prevOpen;
			local after  = this.m_nextOpen;

			this.m_nextOpen = other;
			this.m_prevOpen = before;

			other.m_prevOpen = this;
			other.m_nextOpen = after;

			if ( before )
			{
				before.m_nextOpen = this;
			}
			else
			{
				m_openList = this;
			}

			if ( after )
			{
				after.m_prevOpen = other;
			}
			else
			{
				m_openListTail = this;
			}
		}
	}
	
}
m_masterMarker 	<- 1
m_openList 		<- null
m_openListTail 	<- null

function ClearSearchLists() {
	MakeNewMarker()
	
	m_openList = null;
	m_openListTail = null;
}
function MakeNewMarker() {
	++m_masterMarker
	if (m_masterMarker == 0)
		m_masterMarker = 1
}

CFuncNavCost <- class {
	cost 		= null
	isPrefer 	= false
	m_team 		= 0
	m_tags		= []
	
	constructor(cost) {
		this.cost = cost
		isPrefer = cost.GetClassname() == "func_nav_prefer" ? true : false
		m_team = NetProps.GetPropInt(cost, "m_team")
		
		//m_tags = []
		
		m_tags = split(NetProps.GetPropString(cost, "m_iszTags"), " ")
		//foreach (tag in m_tags)
		//	//// // (tag + "/")
			
		////// // l("")
		
	}
	
	
	//--------------------------------------------------------------------------------------------------------
	// Return pathfind cost multiplier for the given actor
	function GetCostMultiplier_alt( who )
	{
		if ( IsApplicableTo( who ) )
		{
			return isPrefer
		}

		return 1.0
	}
	function GetCostMultiplier( who )
	{
		if ( IsApplicableTo( who ) )
		{
			if ( isPrefer )
				return 0.04		// 1/25th
			else
				return 25.0
		}

		return 1.0
	}
	
	//--------------------------------------------------------------------------------------------------------
	// Return true if this cost applies to the given actor
	function IsApplicableTo( who )
	{
		if ( !who )
		{
			return false
		}
		
		if ( m_team > 0 )
		{
			if ( who.GetTeam() != m_team )
			{
				return false
			}
		}
		
		//ifdef TF_DLL
		// TODO: Make group comparison efficient and move to base combat character
		local bot = who;
		if ( bot.IsFakeClient() )	/// verify if IsFakeClient() checks for CTFBot
		{
			if ( HasTheFlag(bot) )
			{
				if ( HasTag( "bomb_carrier" ) )
				{
					return true
				}

				// check custom bomb_carrier tags for this bot
				foreach ( tag in m_tags )
				{
					if ( V_stristr( tag, "bomb_carrier" ) )
					{
						if ( bot.HasBotTag( tag ) )
						{
							return true
						}
					}
				}

				// the bomb carrier only pays attention to bomb_carrier costs
				return false
			}

			if ( bot.HasMission( MISSION_DESTROY_SENTRIES ) )
			{
				if ( HasTag( "mission_sentry_buster" ) )
				{
					return true
				}
			}
			
			if ( bot.HasMission( MISSION_SNIPER ) )
			{
				if ( HasTag( "mission_sniper" ) )
				{
					return true
				}
			}
			
			if ( bot.HasMission( MISSION_SPY ) )
			{
				if ( HasTag( "mission_spy" ) )
				{
					return true;
				}
			}

			if ( bot.HasMission( MISSION_REPROGRAMMED ) )
			{
				return false
			}

			if ( !bot.IsOnAnyMission() )
			{
				if ( HasTag( "common" ) )
				{
					return true
				}
			}

			if ( HasTag( GetClassName( bot.GetPlayerClass() ) ) )
			{
				return true
			}

			// check custom tags for this bot
			//for( local i=0; i<m_tags.len(); ++i )
			//{
			//	if ( bot.HasBotTag( m_tags[i] ) )
			//	{
			//		return true
			//	}
			//}
			
			// check custom tags for this bot
			foreach ( tag in m_tags )
				if ( bot.HasBotTag( tag ) )
					return true
			

			// this cost doesn't apply to me
			return false
		}
		//endif

		return false
	}
	
	
	//--------------------------------------------------------------------------------------------------------
	function HasTag( groupname )
	{
		foreach ( tag in m_tags )
			if ( tag == groupname )
				return true

		return false
	}
	
	//--------------------------------------------------------------------------------------------------------
	function HasTheFlag( who )
	{
		// collect all flag carriers
		local carriers = []
		local flag = Entities.FindByClassname(null, "item_teamflag")
		
		while (flag)
		{
			local carrier = GetPropEntity(flag, "m_hOwnerEntity")
			if ( carrier )
				carriers.append( carrier )
			
			flag = Entities.FindByClassname(flag, "item_teamflag")
		}
		
		foreach ( carrier in carriers )
			if ( carrier == who )
				return true
		
		return false
	}
	
	function GetClassName( iClass )
	{
		assert ( iClass < TF_CLASS_COUNT_ALL )
		
		switch( iClass )
		{
			case TF_CLASS_UNDEFINED: 	return ""
			case TF_CLASS_SCOUT: 		return "scout"
			case TF_CLASS_SNIPER: 		return "sniper"
			case TF_CLASS_SOLDIER: 		return "soldier"
			case TF_CLASS_DEMOMAN: 		return "demoman"
			case TF_CLASS_MEDIC: 		return "medic"
			case TF_CLASS_HEAVYWEAPONS: return "heavyweapons"
			case TF_CLASS_PYRO: 		return "pyro"
			case TF_CLASS_SPY: 			return "spy"
			case TF_CLASS_ENGINEER: 	return "engineer"
			case TF_CLASS_CIVILIAN: 	return "civilian"
		}
		return ""
		
		
	//function GetPlayerClassData( m_iClass )->m_szClassName
	}
	
	/// verify
	function V_stristr(str, search)
	{
		if (str == null || search == null)
			return null;

		local lowerStr = str.tolower();
		local lowerSearch = search.tolower();

		local idx = lowerStr.find(lowerSearch);
		if (idx == null)
			return null;

		return true;
		//return idx; // same as strstr returning pointer offset
	}
}


g_AreaWrappers <- {}
::GetCTFNavAreaWrapper <- function(area)
{
    if (!area) return null;

    // If wrapper already exists, return it
    if (area in g_AreaWrappers)
        return g_AreaWrappers[area];

    // Otherwise, create and store new wrapper
    local wrapper = CTFNavArea(area);
    g_AreaWrappers[area] <- wrapper;
    return wrapper;
}

g_CostWrappers <- {}
::GetCostWrapper <- function(ent)
{
    if (!ent) return null;

    // If wrapper already exists, return it
    if (ent in g_CostWrappers)
        return g_CostWrappers[ent];

    // Otherwise, create and store new wrapper
    local wrapper = CFuncNavCost(ent);
    g_CostWrappers[ent] <- wrapper;
    return wrapper;
}

// Rebuild nav area, func_nav_cost mapping in VScript
::UpdateAllNavCostDecoration <- function ()
{
	// Get all func_nav_cost entities
	local costEnt = null;
	local costList = [];

	while ( costEnt = Entities.FindByClassname(costEnt, "func_nav_avoid") )
	{
		local isDisabled = NetProps.GetPropBool(costEnt, "m_isDisabled")
		////// // l("func_nav_avoid " + isDisabled)
		if ( costEnt.IsValid() && !isDisabled )
			costList.append(costEnt);
	}
	while ( costEnt = Entities.FindByClassname(costEnt, "func_nav_prefer") )
	{
		local isDisabled = NetProps.GetPropBool(costEnt, "m_isDisabled")
		////// // l("func_nav_prefer " + isDisabled)
		if ( costEnt.IsValid() && !isDisabled )
			costList.append(costEnt);
	}
	

	// Clear previous markings
    foreach (area in g_AreaWrappers)
    {
        // area.ClearAllNavCostEntities()
        area.m_funcNavCostVector.clear()
    }

	// For each cost volume
	foreach (cost in costList)
	{
		local origin = cost.GetOrigin();
		local mins = cost.GetBoundingMins();
		local maxs = cost.GetBoundingMaxs();

		// Convert local bounds to world coords
		local worldMin = origin + mins;
		local worldMax = origin + maxs;

		// For each nav area near the extent
		local table = {}
		NavMesh.GetNavAreasOverlappingEntityExtent(cost, table)
		foreach ( k, area in table )
		{
			local center = area.GetCenter()
			
			if ( center.x >= worldMin.x && center.x <= worldMax.x &&
                 center.y >= worldMin.y && center.y <= worldMax.y &&
                 center.z >= worldMin.z && center.z <= worldMax.z )
            {
                // Center is inside cost volume
				local ctfnavarea = GetCTFNavAreaWrapper(area)
				local costwrapper = GetCostWrapper(cost)
				
				// ctfnavarea.AddFuncNavCostEntity(costwrapper)
				ctfnavarea.m_funcNavCostVector.append( costwrapper )
            }
		}
		
	}
	
	foreach (nav in g_AreaWrappers)
		printl(nav.getArea())
	
		
}
function MAX( x, y )
{
	return x > y ? x : y
}
function MIN( x, y )
{
	return x > y ? y : x
}

