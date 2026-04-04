::trimp_extent <- class {
	origin	= Vector()
	maxs	= Vector()

	constructor(origin, maxs)
	{
		this.origin = origin
		this.maxs 	= maxs
	}
	
}

::trimp_spot_info <- {
	spawn_rock = {
		// 760 -539.3 -527 -538 -546 -528 -537 -527 = -534
		// z speed when leaving is 760
		// z height when leaving is -534
		// xy speed when leaving is 490
		// TaccelChange is when you leave the ramp starting from right click
		// accel1 is xy speed / TaccelChange
		z_speed		= 760,
		z_height	= -534,
		start_pos	= Vector(-127.176323, 4637.787598, -692.257507)
		start_dir	= QAngle(2.508011, -96.109344, 0)
		start_dir_mins	= QAngle(0, -148, 0)
		start_dir_maxs	= QAngle(0, -60, 0)		// very high angle? -70
		tickInterval	= 0.015
		along_direction	= null
		TaccelChange = 0.3,
		accel1 = 490 / 0.3
		simplejump	= false
		extraMove	= true
		buster_scale	= 2.5
		
		//mark1 (vector : (-1074.031250, 4563.968750, -447.968750)
		//mark2 (vector : (-1639.968750, 3702.016113, -511.968750)
		extent = [trimp_extent(Vector(-1871.968750, 3224.031250, -521.968750), Vector(1318.387451, 675.443115, 10.000000)),
				  trimp_extent(Vector(-452.400269, 2924.049805, -708.674744), Vector(940.369019, 355.633301, 110.217102)),
				  ]
		//(vector : (-1111.968750, 2520.031250, -565.801575) (vector : (1599.937500, 315.937500, 137.695679)
		//(vector : (342.003906, 3384.031250, -569.968750) (vector : (273.964844, 386.278320, 10.000000)
		
		destination = [1313, 4486, 4483, 4485, 4668, 668, 673, 112, 4670, 1969, 248, 310, 
					   4498, 4495, 307, 47, 894, 4497, 65, 1969, 12, 4503, 4504, 4502, 2093, 520, 4501, 4496, 310, 9, 66, 498, 2061,
					   5471, 4645, 593, 5475, 368, 1144, 3451, 103, 4649, 4652, 3453, 769, 5478, 5479, 5474, 233, 374, 5118, 274, 595, 361, 171, 5483, 163,
					   572, 52, 271, 3246, 442, 4230, 3292, 1751, 4281, 4235, 355, 1596, 1556, 1093, 351, 4654, 286, 226, 348, 1172, 4445, 1090, 4240, 573, 3258, 342, 4236, 5114, 4446, 4430, 4641, 4229, 258, 4282, 432, 5112, 569, 4633, 153,
					   4655, 630, 4447, 52, 445, 4252, 1753, 15, 4448, 3267, 353, 3738, 4240, 1085, 231, 87, 804, 5557, 3732, 1171, 351, 5555,
					   5493, 5503, 285, 43, 5514,
					   
					   3083, 435, 202, 295, 5558, 747, 3059, 3084, 1862, 1562, 5560, 1029, 136, 137, 37, 
					   ]
		destination_extent = [trimp_extent(Vector(-328.105469, 2761.887695, -514.003906), Vector(800.841553, 1254.106445, 404.963867)),
							  trimp_extent(Vector(1.305401, 1542.222046, -471.118225), Vector(501.721466, 1355.087524, 686.694031)),
							  
							  trimp_extent(Vector(-1119.646606, 2488.373047, -760.334290), Vector(1125.315674, 741.909180, 673.303345)),
							  trimp_extent(Vector(-509.064240, 2890.552246, -745.595398), Vector(1159.716919, 909.942383, 797.298950)),
							  trimp_extent(Vector(-1902.300171, 3217.001465, -521.968750), Vector(1360.040649, 691.311279, 522.725403)),
							  trimp_extent(Vector(-1416.293945, 3735.666992, -457.968750), Vector(342.262695, 828.301758, 365.421112)),
							  trimp_extent(Vector(-1069.796387, 1678.307007, -454.653198), Vector(1072.669800, 435.189087, 852.179199)),
							  trimp_extent(Vector(-919.965210, 2075.333984, -382.688599), Vector(463.169830, 402.847656, 598.557983)),
							  
							  ]
		
		
		accel2		= 7500
		totalTime	= 0,
		distance	= Vector()
		forward		= Vector()
		targetPos	= Vector()	
		speedCap	= 750
		turnRate	= 66.7 * 1
		
	}
	
	tiny_rock = {
		
		z_speed		= 464,
		z_height	= -607,
		start_pos	= Vector(487.990692, 3029.074707, -689.685364)
		start_dir	= QAngle(0, -105, 0)
		start_dir_mins	= QAngle(0, -110, 0)
		start_dir_maxs	= QAngle(0, -97, 0)
		tickInterval	= 0.015
		along_direction	= Vector(-1,0,0)
		TaccelChange = 0.3,
		accel1 = 224 / 0.3
		simplejump	= false
		extraMove	= true
		buster_scale	= 2.5
		
		extent = [trimp_extent(Vector(-767.310181, 2921.560303, -576.435425), Vector(501, 314, 100))]
		destination = [1639, 4643, 4632, 4637, 4644, 769, 3453, 171, 274, 3052, 361, 163, 368, 344]
		destination_extent = [trimp_extent(Vector(-929.755798, 2745.847900, -681.496826), Vector(702.937378, 486.398438, 382.506531))]
	}
	
	mid_rock_1 = {
		
		z_speed		= 450,
		z_height	= -300,
		start_pos	= Vector(-734.281860, 1825.440430, -367.071777)
		start_dir	= QAngle(0, -95, 0)
		start_dir_mins	= QAngle(0, -120, 0)
		start_dir_maxs	= QAngle(0, -80, 0)
		tickInterval	= 0.015
		along_direction	= null
		TaccelChange = 0.16,
		accel1 = 700 / 0.16
		simplejump	= false
		extraMove	= false
		buster_scale	= 5
		
		extent = []
		destination = [23, 3015, 429, 4421, 539, 1027, 736, 3030, 1020, 2993, 3016, 541, 3043, 1026, 433, 1016, 1545, 3017,
					   341, 1022, 2982, 1549, 340, 1033, 199, 544, 543, 51, 337, 2972, 1546, 4424, 739, 1023, 4420, 4538, 134, 338, 4422, 4423,
					   
					   2690, 1513, 2959, 427, 2949, 1527, 4374, 4415, 1470, 968, 988, 4392, 262, 1026, 1022, 161, 327, 1019, 1018, 261, 723, 2659, 
					   543, 339, 709, 2776, 4538, 714, 2694, 976, 4388, 958, 2639, 323, 419, 1467, 2529, 4381, 2979, 2801, 1503, 2447, 2681, 4416, 
					   722, 417, 265, 701, 4382, 1518, 1427, 328, 2653, 960, 415, 1528, 2932, 2926, 999, 2903, 2442, 973, 1014, 4373, 4387, 422, 2898, 
					   2782, 707, 2765, 51, 2781, 2691, 2466, 989, 2630, 1023, 322, 2680, 2439, 2622, 2677, 2674, 2671, 4272, 2906, 2448, 715, 956, 
					   963, 1480, 1000, 4391, 537, 2950, 2775, 2687, 1481, 1495, 991, 734, 414, 2527, 2656, 4378, 986, 1460, 2445, 325, 263, 959, 326, 
					   1472, 2643, 222, 961, 336, 719, 2609, 703, 2993, 4537, 160, 
					   ]
		destination_extent = [trimp_extent(Vector(-1650.125488, 1458.380005, -458.671265), Vector(599.222656, 339.666016, 619.878357)),
								trimp_extent(Vector(-1709.220337, 834.388367, -300.455750), Vector(345.633911, 658.341370, 550.086548)),
								trimp_extent(Vector(-2600.494873, 1191.021240, -283.368103), Vector(1000.730591, 309.760864, 674.408569)),
								trimp_extent(Vector(-1383.295776, 1179.125122, -396.540588), Vector(100.292480, 288.065186, 677.137390)),
								trimp_extent(Vector(-1295.936035, 1269.220947, -385.414337), Vector(93.093628, 217.557251, 735.799072)),
								trimp_extent(Vector(-1216.370605, 1355.286255, -416.307343), Vector(84.306519, 110.079346, 806.730713)),
								trimp_extent(Vector(-1135.984009, 1415.105225, -346.124969), Vector(48.601440, 59.154175, 498.037903)),
								]
	}
	
	mid_rock_2 = {
		z_speed		= 350,
		z_height	= -300,
		start_pos	= Vector(-815.443176, 1696.613403, -360.298828)
		start_dir	= QAngle(0, 45, 0)
		start_dir_mins	= QAngle(0, 30, 0)
		start_dir_maxs	= QAngle(0, 55, 0)
		tickInterval	= 0.015
		along_direction	= null
		TaccelChange = 0.15,
		accel1 = 720 / 0.15
		simplejump	= false
		extraMove	= false
		buster_scale	= 3
		
		extent = []
		destination = [569, 344, 4468, 137, 4644, 226, 4643, 5112, 348, 4465, 361, 1639, 342, 158, 4637, 4633, 163, 4282, 4236, 432, 4281, 
					   442, 4632, 769, 3052, 4635, 946, 153, 3246, 1596, 274, 4466, 4641, 37, 1556, 20, 3021, 4467, 5558, 5560,]
		destination_extent = [trimp_extent(Vector(-941.610474, 1927.789551, -653.646851), Vector(537.635193, 1324.707520, 684.770020)),
								trimp_extent(Vector(-1124.794189, 2500.014893, -623.352234), Vector(250.078430, 758.315674, 847.674133)),
								]
	}
	
	plate = {
		z_speed		= 350,
		z_height	= -300,
		start_pos	= Vector(-160.465622, 2568.391357, -474.706360)
		start_dir	= null
		start_dir_mins	= QAngle(0, -105, 0)
		start_dir_maxs	= null
		tickInterval	= 0.015
		along_direction	= null
		TaccelChange = 0.15,
		accel1 = 720 / 0.15
		simplejump	= false
		extraMove	= false
		buster_scale = 2
		
		extent = [ ]
		destination = [3083, 435, 202, 295, 5558, 747, 3059, 3084, 1862, 1562, 5560, 1029, 136, 137, 37, ]
		destination_extent = [trimp_extent(Vector(-880.480652, 2355.404297, -399.554657), Vector(265.877930, 255.717285, 168.555710)),
								trimp_extent(Vector(-1118.065674, 1747.216431, -384.870636), Vector(1000.371948, 756.411499, 505.021515)),
								]
	}
	
	spawn = {
		z_speed		= 350,
		z_height	= -300,
		start_pos	= Vector(-505.301575, 5849.360840, -703.968750)
		//start_pos	= Vector(-471.356323, 5596.846191, -703.968750)
		start_dir	= null
		start_dir_mins	= QAngle(0, -135, 0)
		start_dir_maxs	= null
		tickInterval	= 0.015
		along_direction	= null
		TaccelChange = 0.15,
		accel1 = 720 / 0.15
		simplejump	= true
		extraMove	= true
		buster_scale	= 1
		
		extent = [trimp_extent(Vector(-853.875366, 3909.557861, -713.894836), Vector(605.532410, 1040.134521, 133.653809))]
		destination = [400, 587, 2213, 3508, 4362, 591, 4438, 1272, 3428, 191, 1105, 4332, 1379, 220, 768, 586, 363, 1104, 2270, 3469, 4269, 3514, 401, 3430, 32, 513, 97, 4361, 4331, 507, 403, 4437, 1630, 1390, 189, 205, 1113, 257, 4561, 114, 4270, 1112, 2242, 402, 3424, 3422, 3477, 1110, 941, 192, 96, 188, 2302, 1111, 370, 275, 406, 404, 4562, 1628, 398, 3418, 1108, 273,]
		destination_extent = [trimp_extent(Vector(-1009.447937, 3903.549561, -860.346252), Vector(826.371094, 1343.434814, 642.439880))]
	}
	
	tworocks = {
		z_speed		= 350,
		z_height	= -300,
		start_pos	= Vector(-433.718292, 3759.607666, -684.544495)
		start_dir	= QAngle(0, -40, 0)
		start_dir_mins	= QAngle(0, -27, 0)
		start_dir_maxs	= QAngle(0, -70, 0)
		tickInterval	= 0.015
		along_direction	= null
		TaccelChange = 0.15,
		accel1 = 720 / 0.15
		simplejump	= false
		extraMove	= false
		buster_scale	= 3
		approachInstruction	= [Vector(-477.448181, 3939.350342, -696.097595), Vector(-433.718292, 3759.607666, -684.544495)]
		
		extent = [trimp_extent(Vector(-341.660278, 3029.067627, -699.623657), Vector(829.646118, 590.848145, 44.779419))]
		destination = [3563, 787, 233, 4283, 4649, 1144, 103, 1691, 172, 595, 3496, 5475, 5511, 3480, 5478, 234, 599, 453, 4648, 590, 375, 5485, 5516, 5512, 5474, 3567, 5118, 373, 122, 1115, 4652, 5518, 5483, 4436, 450, 171, 374, 593, 604, 4630, 4435, 4645, ]
		destination_extent = [trimp_extent(Vector(-341.280579, 2889.408936, -752.936768), Vector(835.409790, 783.303223, 180.199005))]	//267
	}
	
	redspawnramp = {
		z_speed		= 631,
		z_height	= -59,
		start_pos	= Vector(947.400452, 468.113800, -350.725037)
		start_dir	= null	//QAngle(0, -180, 0)
		start_dir_mins	= QAngle(0, -135, 0)
		start_dir_maxs	= null	//QAngle(0, -135, 0)
		tickInterval	= 0.015
		along_direction	= null
		TaccelChange = 0.15,
		accel1 = 720 / 0.15
		simplejump	= true
		extraMove	= true
		buster_scale	= 1
		
		extent = [trimp_extent(Vector(-341.660278, 3029.067627, -699.623657), Vector(829.646118, 590.848145, 44.779419))]
		destination = [4891, 2875, 1568, 19, 3106, 4888, 3123, 3109, 536, 4885, 3107, 5575, 1575, 165, 1571, 2868, 2870, 1572, 4892, 268, 2869, 1510, 5578, 
					   4890, 552, 1511, 197, 203, 1509, 4883, 1047, 347, 729,]
		destination_extent = [trimp_extent(Vector(136.533752, 247.543335, -329.295715), Vector(436.526123, 554.341003, 555.442749)),
								trimp_extent(Vector(-1184.900513, 280.611481, -200.959747), Vector(1428.801147, 941.399414, 445.966187)),
								// trimp_extent(),
								]
	}
	
	stairstoredspawn = {
		z_speed		= 631,
		z_height	= -51,
		start_pos	= Vector(-224.852692, 1647.553833, -375.968750)
		start_dir	= null	//QAngle(0, -180, 0)
		start_dir_mins	= QAngle(0, -90, 0)
		start_dir_maxs	= null	//QAngle(0, -135, 0)
		tickInterval	= 0.015
		along_direction	= null
		TaccelChange = 0.15,
		accel1 = 720 / 0.15
		simplejump	= true
		extraMove	= true
		buster_scale	= 1
		approachInstruction = [Vector(-227.828415, 1935.924927, -383.940460), Vector(-224.852692, 1647.553833, -375.968750),]
		
		extent = [trimp_extent(Vector(-319.177979, 280.031250, -137.968750), Vector(236.833252, 471.611206, 50))]
		destination = [5221, 4883, 5220, 4803, 5145, 4720, 5120, 4702, 5122,]
		destination_extent = [trimp_extent(Vector(-354.540985, 260.239655, -267.210022), Vector(331.860474, 989.541870, 532.934631))]
	}
}

//bind q +jumpcharge;rcon script me().SnapEyeAngles(QAngle(0,-110,0));impulse 101
//rcon script prodemoknight.ListOfProDemoknight[0].interface_trimpAtTarget( me() , "tworocks ")

::manual_move <- {
	spawn_rock = {
		start_pos	= Vector(-389.718262, 4447.876953, -649.416321)
		approachInstruction = [Vector(-406.972260, 4348.039062, -659.389282), Vector(-375.709778, 4391.048828, -649.328491), Vector(-290.067200, 4518.112305, -564.169128), Vector(41.520458, 4503.226562, -562.353271),]
		jump_extent = [null,
						trimp_extent(Vector(-484.110931, 4368.942383, -690.422119), Vector(275.396423, 197.124512, 62.242310)), 
						trimp_extent(Vector(-231.460770, 4457.916504, -564.011963), Vector(6.102966, 140.800781, 25.358704)),
						]
		
		destination_extent = [Vector(-390.266571, 4491.868652, -615), Vector(484.525391, 15.410645, 175.319855)]
	}
}