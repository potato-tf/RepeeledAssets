if(!("SetLibraryVersion" in getroottable()) || ("FatCatLibForce" in ROOT && FatCatLibForce == true))
	IncludeScript("fatcat_library")

// CREDITS
// Standard Chinese		--		Pepper[^▽^] 	(pepper_1656 on Discord)
// Swedish				--		Decimate 		(decimatetf on Discord)
// Russian				--		Liverfull 		(liverfullprod@gmail.com)

::IH_color <- "\x08FFFF00DD"
::IH_text_color <- "\x08FFFFFFBB"
::IH_color_header <- "\x0826c2ffDD"
::IH_text_color_header <- "\x0826beffBB"
::IH_disable_color <- "\x0826beff66"
::IH_error_color <- "\x07D43F3F"

if(!("CHECKPOINT_ERROR" in getroottable()))
	::CHECKPOINT_ERROR <- "\x07bf4137"

if("SetScriptVersion" in getroottable())
	SetScriptVersion("Translations", "1.3.1")

::TRANSLATION_TABLE <- {
	english = {
		IH_TRANSLATE_ITEM		= IH_color + "[%s]" + IH_text_color + "%s"
		IH_INCLUDES				= IH_color_header + "[►]\x0826beffBB Your loadout includes..."
		IH_DIS_MSG_2			= IH_disable_color + "Type '/itemhelp 1' to disable these messages during a wave. \nType '/itemhelp 0' to disable these messages entirely."
		IH_DIS_MSG				= IH_disable_color + "Type '/itemhelp 0' to disable these messages. \nType '/itemhelp 2' to Always display this message."
		IH_BAD_ARGS				= IH_color_header + "[Item Helper]" + IH_error_color + " {Error}\x01 Incorrect arguments!\n/itemhelp 2 - Enable\n/itemhelp 1 - Enable during Wave Setup only\n/itemhelp 0 - Disable"
		IH_OOB_ARG				= IH_color_header + "[Item Helper]" + IH_error_color + " {Error}\x01 Out Of Bounds Value Set! : %s"
		IH_HELP_MSG				= IH_color_header + "[Item Helper]\x01 Item helper provides simple descriptions for each \x03Chaos\x01 Item!" 
		IH_DISABLE				= IH_color_header + "[►]\x01 Item Helper disabled."
		IH_WAVE_SETUP			= IH_color_header + "[►]\x01 Item Helper enabled on Wave Setup only."
		IH_ENABLE 				= IH_color_header + "[►]\x01 Item Helper enabled."
		LOW_METAL 				= "Not enough Metal"
		TOMISLAV_HEAT			= "Tomislav Heat: %s%%"
		STUCK_RESPAWNED 		= "You were respawned to avoid getting stuck."
		ABILITY_READY			= "%s\n► Ready ◄"
		ABILITY_CHARGING		= "%s\n%s"
		ABILITY_CHARGING_MSG	= "Charging: %ss"
		ABILITY_CHARGING_D_MSG	= "Charging: %s%%"
		MEGACRUSH 				= "MEGA-CRUSH"
		VITALRESURGENCE 		= "VITAL RESURGENCE"
		VEHICULARMANNSLAUGHTER 	= "VEHICULAR MANNSLAUGHTER"
		TEST 					= "Test Ability"
		NO_MONEY				= "You can't afford this! (Cost: $%s, you have: $%s)" // Dont Translate this, my own project
		REPROG_BOT_STRONG		= TF_TEAM_COLOR_REPROG_B+"%s\x01 is too resistant and cannot be reprogrammed."
		REPROG_BOT_NOT_SUIT		= TF_TEAM_COLOR_REPROG_B+"%s\x01 is not suitable for combat and cannot be reprogrammed."
		REPROG_BOT_LEAVE		= TF_TEAM_COLOR_SPEC+"%s died."
		REPROG_BOT_MESSAGE 		= TF_TEAM_COLOR_RED+"%s\x01 has reprogrammed "+TF_TEAM_COLOR_REPROG_B+"%s\x01!"
		//---------------------------------------------------------
		CHECKPOINT_CREATED		= "\x077c8cc2Checkpoint created:\x078165cf [/%s]"
		CHECKPOINT_WRONG_MAP	= CHECKPOINT_ERROR+"That checkpoint was not set for this map."
		CHECKPOINT_WRONG_MISS	= CHECKPOINT_ERROR+"That checkpoint was not set for this mission."
		CHECKPOINT_EXPIRE		= CHECKPOINT_ERROR+"That checkpoint has expired."
		CHECKPOINT_RESTORE		= "\x0744CC44Restored to last saved checkpoint."
		CHECKPOINT_RESTORE_HUD	= "Restored to last saved checkpoint."
		//---------------------------------------------------------
		SCATTERGUN_NAME 		= "SCATTERGUN"
		SCATTERGUN_DESC 		= " Standard option for reliable damage. Highly effective at close range."
		//
		FORCENATURE_NAME		= "FORCE-A-NATURE"
		FORCENATURE_DESC		= " Enhanced knockback on hit. Slightly lower DPS than Scattergun."
		//
		SHORTSTOP_NAME 			= "SHORTSTOP"
		SHORTSTOP_DESC 			= " Insane fire rate and guaranteed crits to wet enemies, but slow reload."
		//
		SODAPOPPER_NAME 		= "SODA POPPER"
		SODAPOPPER_DESC 		= " Hold fire to load a quick 4-shot burst."
		//
		BABYFACEBLASTER_NAME	= "BABY FACE'S BLASTER"
		BABYFACEBLASTER_DESC	= " Hold fire to load a massive burst of up to 200 shots, shredding anything at point-blank range. Has very high recoil however."
		//
		BACKSCATTER_NAME		= "BACK SCATTER"
		BACKSCATTER_DESC		= " Full crits on backshots. Does not require ammo and has an endless clip."
		///
		PISTOL_NAME 			= "PISTOL"
		PISTOL_DESC 			= " Fire rockets instead of bullets. Highly effective for mobility."
		//
		BONK_NAME 				= "BONK! ATOMIC PUNCH"
		BONK_DESC 				= " Supercharged drink, granting invulnerability that doesn't remove your ability to attack."
		//
		CRITACOLA_NAME 			= "CRIT-A-COLA"
		CRITACOLA_DESC 			= " Supercharged drink, giving full crits."
		//
		MADMILK_NAME 			= "MAD MILK"
		MADMILK_DESC 			= " Enemies coated in milk are unable to move."
		//
		WINGER_NAME 			= "WINGER"
		WINGER_DESC 			= " Unlimited air jumps while active. Fires a single focused shot that always crits while you are airborne. This shot also pushes enemies away."
		//
		PRETTYBOYS_NAME 		= "PRETTY BOY'S POCKET PISTOL"
		PRETTYBOYS_DESC 		= " Fires rockets that deal damage based on the victim's health. Damage increases as the target becomes injured and is not affected by distance. Alt-Fire: Use Seeker rockets at the cost of -20% damage."
		//
		CLEAVER_NAME 			= "FLYING GUILLOTINE"
		CLEAVER_DESC 			= " Yondu's Arrow: Summon a sentient arrow to assist in battle. Alt-Fire: Disruptor mode, -75% damage."
		//
		MATATEDMILK_NAME 		= "MUTATED MILK"
		MATATEDMILK_DESC 		= " Rapidfire explosive milk jars, dealing damage to enemies. Alt-Fire: Throw a cluster of milk jars at once."
		///
		BAT_NAME 				= "BAT"
		BAT_DESC 				= " Chance to ignore death and teleport to spawn with 1hp."
		//
		SANDMAN_NAME			= "SANDMAN"
		SANDMAN_DESC 			= " Able to rapidfire baseballs with high capacity and fast recharge, dealing significant burst damage to single targets."
		//
		HOLYMACKEREL_NAME		= "HOLY MACKEREL"
		HOLYMACKEREL_DESC		= " Able to mark multiple enemies for death."
		//
		CANDYCANE_NAME 			= "CANDY CANE"
		CANDYCANE_DESC 			= " Utility Item - You have no gravity and can freely fly."
		//
		BOSTONBASHSER_NAME 		= "BOSTON BASHER"
		BOSTONBASHSER_DESC 		= " High risk / High reward. Able to instakill most small enemies, giving 10 second critboost. Enemies connected via medigun beams are also hit. However any miss is instant death."
		//
		SUNONASTICK_NAME		= "SUN-ON-A-STICK"
		SUNONASTICK_DESC		= " Chance to stun enemies or receive a short critboost. Hits all enemies connected via medigun beams. However any miss will stun yourself."
		//
		FANOWAR_NAME 			= "FAN O'WAR"
		FANOWAR_DESC 			= " Utility Item - Swing this melee to lunge yourself forward at high speed. Grants immunity to fall damage."
		//
		ATOMIZER_NAME 			= "ATOMIZER"
		ATOMIZER_DESC 			= " Cannot deal damage with normal attacks, but a successful taunt kill will grant a critboost lasting 3 minutes."
		//
		THREERUNEBLADE_NAME 	= "THREE-RUNE BLADE"
		THREERUNEBLADE_DESC 	= " While active, gain MASSIVE boost to move speed and ability to triple jump. Grants immunity to fall damage."
		//
		UNARMEDCOMBAT_NAME 		= "UNARMED COMBAT"
		UNARMEDCOMBAT_DESC 		= " Every 10 kills, gain a Skeleton minion spell charge (Requires Spellbook)."
		//
		WRAPAASSASSIN_NAME 		= "WRAP ASSASSIN"
		WRAPAASSASSIN_DESC 		= " Able to attack incoming projectiles, reflecting them with ease. Also grants immunity to stun."
		//----------------------------
		//----------------------------
		//----------------------------
		ROCKETLAUNCHER_NAME		= "ROCKET LAUNCHER"
		ROCKETLAUNCHER_DESC		= " Standard option for reliable damage."
		//
		DIRECTHIT_NAME			= "DIRECT HIT"
		DIRECTHIT_DESC			= " Alt-Fire: Launch a small enemy into the air for an easy minicrit follow-up. Rockets have a small amount of aim assist."
		//
		BLACKBOX_NAME			= "BLACK BOX"
		BLACKBOX_DESC			= " Slow down enemies and inflict bleed. This weapon deals x2 damage against Soldier bots."
		//
		ROCKETJUMPER_NAME		= "ROCKET JUMPER"
		ROCKETJUMPER_DESC		= " Slow fire and reload rate, but high damage and large blast radius. Excellent choice for crowd control."
		//
		LIBERTYLAUNCHER_NAME	= "LIBERTY LAUNCHER"
		LIBERTYLAUNCHER_DESC	= " Fires a slow-moving rocket that deals massive damage in large area. Very slow reload and low ammo. This weapon automatically fires when loaded."
		//
		COWMANGLER_NAME			= "COW MANGLER 5000"
		COWMANGLER_DESC			= " Immobilize small enemies on hit. Charged shot freezes enemies for longer. Hold Alt-Fire to supercharge the weapon for a multishot, resulting in even longer freeze."
		//
		ORIGINAL_NAME			= "ORIGINAL"
		ORIGINAL_DESC			= " Hold fire to load a burst-shot of up to 4 rockets. This weapon automatically fires when loaded."
		//
		BEGGARSBAZOOKA_NAME		= "BEGGAR'S BAZOOKA"
		BEGGARSBAZOOKA_DESC		= " Hold fire to load up to 100 rockets before unleashing them in a massive burst. This weapon does NOT overload."
		//
		AIRSTRIKE_NAME			= "AIR STRIKE"
		AIRSTRIKE_DESC			= " Load up to 10 rockets before firing all at once in a fixed spread pattern. These rockets automatically seek enemies."
		///
		SHOTGUN_SOLD_NAME 		= "SHOTGUN - SOLDIER" 
		SHOTGUN_SOLD_DESC 		= " Very fast fire rate and crits while rocket jumping." 
		//
		SHOTGUN_NAME 			= "SHOTGUN" 
		SHOTGUN_DESC 			= " Standard option for reliable damage." 
		//
		BUFFBANNER_NAME 		= "BUFF BANNER" 
		BUFFBANNER_DESC 		= " Unlimited range and significantly increased duration." 
		//
		GUNBOATS_NAME 			= "GUNBOATS" 
		GUNBOATS_DESC 			= " Enables bunnyhopping by holding 'jump' key. Grants immunity to fall damage." 
		//
		BATTALIONS_NAME 		= "BATTALION'S BACKUP" 
		BATTALIONS_DESC 		= " Unlimited range and significantly increased duration." 
		//
		CONCHEROR_NAME 			= "CONCHEROR" 
		CONCHEROR_DESC 			= " Unlimited range and significantly increased duration." 
		//
		RESERVESHOOTER_NAME 	= "RESERVE SHOOTER" 
		RESERVESHOOTER_DESC 	= " Deals a flat 10,000 damage per shot no matter the range with 3s mini-crits on kill. However this weapon cannot be crit boosted, and cannot damage Tanks. Hold Alt-Fire to zoom in." 
		//
		BISON_NAME 				= "RIGHTEOUS BISON" 
		BISON_DESC 				= " Fires a continuous beam of penetrating damage with full auto-aim." 
		//
		MANTREADS_NAME 			= "MANTREADS" 
		MANTREADS_DESC 			= " Major reduction in knockback taken from damage. Air strafing now has massively increased acceleration. Stomp damage buffed and velocity-based." 
		//
		BASEJUMPER_NAME 		= "B.A.S.E. JUMPER" 
		BASEJUMPER_DESC 		= " Able to toggle parachute. Increases resistance to knockback and bullet damage, reducing your vulnerability in the air." 
		//
		PANICATTACK_NAME 		= "PANIC ATTACK" 
		PANICATTACK_DESC 		= " For when you need emergency healing. Immediately restores up to 10,000 health on hit. Taking damage with this weapon active has a chance to trigger a brief self-uber." 
		///
		SHOVEL_NAME 			= "SHOVEL"
		SHOVEL_DESC 			= " Standard option for defense and mobility."
		//
		EQUALIZER_NAME 			= "EQUALIZER"
		EQUALIZER_DESC 			= " Taunt attack deals massive damage and knocks enemies into the air."
		//
		PAINTRAIN_NAME 			= "PAIN TRAIN"
		PAINTRAIN_DESC 			= " Inflict bleed and slowdown on hit. Grants immunity to fall damage."
		//
		HALFZATOICHI_NAME 		= "HALF-ZATOICHI"
		HALFZATOICHI_DESC 		= " Average damage with high health mobility, and increased range."
		//
		MARKETGARDENER_NAME 	= "MARKET GARDENER"
		MARKETGARDENER_DESC 	= " Deals massively increased crit damage. After getting a kill, enter an enraged state and gain extra health, resistance and increased damage on all attacks. However any miss is instant death."
		//
		DISCIPLINARYACTION_NAME = "DISCIPLINARY ACTION"
		DISCIPLINARYACTION_DESC	= " Standard option for defense and mobility."
		//
		ESCAPEPLAN_NAME			= "ESCAPE PLAN"
		ESCAPEPLAN_DESC			= " Standard option for defense and mobility."
		//----------------------------
		//----------------------------
		//----------------------------
		FLAMETHROWER_NAME 		= "FLAMETHROWER"
		FLAMETHROWER_DESC		= " Standard option for reliable damage. Gain a short mini-crit boost on kill."
		//
		BACKBURNER_NAME 		= "BACKBURNER"
		BACKBURNER_DESC			= " Green Fire - Marks enemies for death and stuns airborne enemies for a short time. This weapon deals x2 damage against Pyro bots."
		//
		DEGREASER_NAME 			= "DEGREASER"
		DEGREASER_DESC			= " Long-range flamethrower dealing high direct damage, but 0 afterburn damage. This flamethrower cannot airblast."
		//
		PHLOGISTINATOR_NAME 	= "PHLOGISTINATOR"
		PHLOGISTINATOR_DESC		= " Green Fire - Marks enemies for death and stuns airborne enemies for a short time. Strong against Tanks, but your move speed is reduced."
		//
		RAINBLOWER_NAME 		= "RAINBLOWER"
		RAINBLOWER_DESC			= " Long-range flamethrower dealing low direct damage, but high afterburn damage. Also able to instantly destroy Engineer buildings and burn enemy Pyros. Airblast is weak, but very fast."
		//
		DRAGONSFURY_NAME 		= "DRAGON'S FURY"
		DRAGONSFURY_DESC		= " Significantly increased fire rate and airblast rate."
		//
		NOSTROMONAPALMER_NAME 	= "NOSTROMO NAPALMER"
		NOSTROMONAPALMER_DESC	= " Slow enemies down on hit. Builds 'Mmmph' charge similar to the Phlogistinator, but grants yourself Concheror buff. This flamethrower cannot airblast."
		///
		SHOTGUN_PYRO_NAME 		= "SHOTGUN - PYRO" 
		SHOTGUN_PYRO_DESC 		= " Guaranteed crits against burning enemies." 
		//
		FLAREGUN_NAME 			= "FLARE GUN" 
		FLAREGUN_DESC 			= " Fires a hitscan attack that penetrates enemies. Damage exponentially increases with each penetrated enemy along the path. Also has a chance to stun enemies on hit." 
		//
		DETONATOR_NAME 			= "DETONATOR" 
		DETONATOR_DESC 			= " Flare has infinite explosion radius and will hit anything within line of sight. Forces all spy bots to uncloak and undisguise. Also great choice for mobility." 
		//
		MANMELTER_NAME 			= "MANMELTER" 
		MANMELTER_DESC 			= " Rapid-fire flares specialized to automatically seek out enemies. Unlimited ammo and no reload. Alt-Fire: Launch a burst of flares at once." 
		//
		SCORCHSHOT_NAME 		= "SCORCH SHOT" 
		SCORCHSHOT_DESC 		= " On hit: Deal large damage, extinguish the enemy and inflict knockback. Your target MUST be on fire, or this attack will do nothing. Alt-Fire: Use slow seeker flare." 
		//
		THERMALTHRUSTER_NAME 	= "THERMAL THRUSTER" 
		THERMALTHRUSTER_DESC 	= " Reduced fuel consumption with no launch delay. Able to redeploy in-air and deal massive stomp damage. Gain a brief critboost on kill." 
		//
		GASPASSER_NAME 			= "GAS PASSER" 
		GASPASSER_DESC 			= " Gas meter starts empty and resets on death. Deal 150,000 damage to fill the meter. Explode-on-Ignite deals 105,000 damage." 
		///
		FIREAXE_NAME 			= "FIRE AXE"
		FIREAXE_DESC 			= " Standard option for defense and mobility."
		//	
		AXTINGUISHER_NAME 		= "AXTINGUISHER"
		AXTINGUISHER_DESC		= " Significantly increased damage against burning enemies."
		//
		HOMEWRECKER_NAME 		= "HOMEWRECKER"
		HOMEWRECKER_DESC 		= " Able to instantly destroy Engineer buildings from anywhere with infinite melee range."
		//
		POWERJACK_NAME 			= "POWERJACK"
		POWERJACK_DESC 			= " Fast attacks and move speed. Inflict bleed & ignite enemies on hit and gain mini-crits on kill."
		//
		BACKSCRATCHER_NAME 		= "BACK SCRATCHER"
		BACKSCRATCHER_DESC 		= " Deals lethal damage from behind. After getting a kill, enter an enraged state and gain extra move speed, resistance and increased damage on all attacks."
		//
		VOLCANOFRAGMENT_NAME 	= "SHARPENED VOLCANO FRAGMENT"
		VOLCANOFRAGMENT_DESC 	= " Chance to stun enemies on hit. Also able to burn enemy Pyros"
		//
		POSTALPUMMELER_NAME 	= "POSTAL PUMMELER"
		POSTALPUMMELER_DESC 	= " On hit: Inflict Confusion, causing enemies to walk backward along the bomb path for a short time. Hold Alt-Fire when attacking to teleport back to spawn."
		//
		MAUL_NAME 				= "MAUL"
		MAUL_DESC 				= " On hit: Launch enemies into the air with reduced gravity."
		//
		THIRDDEGREE_NAME 		= "THIRD DEGREE"
		THIRDDEGREE_DESC 		= " Become nearly immune to fire damage while equipped, and gain and additional heavy resistance to all ranged attacks while active."
		//
		LOLLICHOP_NAME 			= "LOLLICHOP"
		LOLLICHOP_DESC 			= " Every 10 kills, gain a Meteor Storm spell charge (Requires Spellbook)."
		//
		NEONANNIHILATOR_NAME 	= "NEON ANNIHILATOR"
		NEONANNIHILATOR_DESC 	= " Your gravity is reduced."
		//
		HOTHAND_NAME 			= "HOT HAND"
		HOTHAND_DESC 			= " Launch enemies into the air on hit."
		//----------------------------
		//----------------------------
		//----------------------------
		GRENADELAUNCHER_NAME 	= "GRENADE LAUNCHER"
		GRENADELAUNCHER_DESC	= " Standard option for reliable damage."
		//
		LOCHNLOAD_NAME 			= "LOCH-N-LOAD"
		LOCHNLOAD_DESC			= " Slow shots but with high burst damage in a large area. Effective for crowd control."
		//
		ALIBABA_NAME			= "ALI BABA'S WEE BOOTIES"
		ALIBABA_DESC			= " Enhanced shield bash damage. Grants immunity to fall damage."
		//
		BOOTLEGGER_NAME			= "BOOTLEGGER"
		BOOTLEGGER_DESC			= " Enhanced shield recharge rate. Grants immunity to fall damage."
		//
		LOOSECANNON_NAME		= "LOOSE CANNON"
		LOOSECANNON_DESC		= " Load up to 4 cannonballs before firing all at once in a vertical spread pattern. Cannonballs explode on contact with the ground."
		//
		IRONBOMBER_NAME			= "IRON BOMBER"
		IRONBOMBER_DESC			= " Ignores enemy resistances and gains a short critboost on kill. Does not require ammo and has an endless clip. Projectiles can bounce off of walls."
		///
		STICKYBOMB_NAME 		= "STICKYBOMB LAUNCHER"
		STICKYBOMB_DESC 		= " Standard option for reliable damage. Able to place 50 bombs."
		//
		SCOTTISHRES_NAME 		= "SCOTTISH RESISTANCE"
		SCOTTISHRES_DESC 		= " Bomb takes 5 seconds to arm and fizzles after 10 seconds, but can deal overwhelming damage with good timing and a full charge."
		//
		STICKYJUMPER_NAME 		= "STICKY JUMPER"
		STICKYJUMPER_DESC 		= " Creates a shutdown field, stunning all enemies hit by the pulse. (Minibosses are immune to stun)"
		//
		CHARGINTARGE_NAME 		= "CHARGIN' TARGE"
		CHARGINTARGE_DESC 		= " Heavy Charge - Superior shield bash damage."
		//
		SPLENDIDSCREEN_NAME 	= "SPLENDID SCREEN"
		SPLENDIDSCREEN_DESC 	= " Rapid Charge - Superior shield recharge rate."
		//
		TIDETURNER_NAME 		= "TIDE TURNER"
		TIDETURNER_DESC 		= " Burst Charge - Superior shield charge move speed."
		//
		QUICKIEBOMB_NAME 		= "QUICKIEBOMB LAUNCHER"
		QUICKIEBOMB_DESC 		= " Auto-fires stickybombs at an insane rate with very fast arm time. Gain mini-crits on kill."
		///
		BOTTLE_NAME 			= "BOTTLE"
		BOTTLE_DESC 			= " Standard option for defense and mobility."
		//
		EYELANDER_NAME 			= "EYELANDER"
		EYELANDER_DESC 			= " High damage with quick attacks gaining crits and mini-crits on kill, but cannot be used as hybrid-knight."
		//
		SKULLCUTTER_NAME 		= "SCOTSMAN'S SKULLCUTTER"
		SKULLCUTTER_DESC 		= " Able to cut through enemy Ubercharge and disrupt Medi-Gun functions. Also able to deal increased damage to enemies of the same class as you."
		//
		CABER_NAME 				= "ULLAPOOL CABER"
		CABER_DESC 				= " Damage increases as you become injured. Guaranteed crits if your health is below 2%. The explosion from this attack will kill you."
		//
		CLAIDHEAMHMOR_NAME 		= "CLAIDHEAMH MOR"
		CLAIDHEAMHMOR_DESC 		= " Every 10 kills, gain a Monoculus spell charge (Requires Spellbook)."
		//
		PERSIANPERSUADER_NAME 	= "PERSIAN PERSUADER"
		PERSIANPERSUADER_DESC 	= " When paired with a shield, grants unlimited shield charging. Shield charge cannot be disrupted by sharp turns or bumping into walls, enemies or other obstacles. Grants immunity to stun."
		//
		NINEIRON_NAME 			= "NESSIE'S NINE IRON"
		NINEIRON_DESC 			= " Has a massive swing arc, able to hit multiple enemies at once in all directions. Deals double crit damage."
		//
		SCOTTISHHANDSHAKE_NAME 	= "SCOTTISH HANDSHAKE"
		SCOTTISHHANDSHAKE_DESC 	= " While active: Resist 90% ranged damage, become immune to knockback and greatly increase max health. However you cannot recover ammo and receive less health from packs."
		//----------------------------
		//----------------------------
		//----------------------------
		MINIGUN_NAME 			= "MINIGUN"
		MINIGUN_DESC 			= " Standard option for reliable damage. Gain a short mini-crit boost on kill."
		//
		NATASCHA_NAME 			= "NATASCHA"
		NATASCHA_DESC 			= " Slow enemies on hit and apply Death Mark."
		//
		BRASSBEAST_NAME 		= "BRASS BEAST"
		BRASSBEAST_DESC 		= " Higher damage with very slow spin-up. Move speed is crippled while deployed. Able to deflect incoming projectiles."
		//
		TOMISLAV_NAME 			= "TOMISLAV"
		TOMISLAV_DESC 			= " Builds 'Heat' by dealing damage. All stats on this weapon are increased based on heat level. However, the weapon begins to cool down if you go too long without dealing damage."
		//
		HUOHEATER_NAME 			= "HUO-LONG HEATER"
		HUOHEATER_DESC 			= " Fires energy beams, igniting enemies on hit"
		//
		GENUINEHUOHEATER_NAME 	= "GENUINE HUO-LONG HEATER"
		GENUINEHUOHEATER_DESC 	= " Fires rockets. Guaranteed crits against burning enemies."
		///
		SHOTGUN_HVY_NAME 		= "SHOTGUN - HEAVY"
		SHOTGUN_HVY_DESC 		= " Single shot with high damage, granting 8 seconds of crits on kill."
		//
		SANDVICH_NAME 			= "SANDVICH"
		SANDVICH_DESC 			= " Restore up to 150,000 health. Any damage taken while holding this item active is fatal."
		//
		DALOKOHSBAR_NAME 		= "DALOKOHS BAR"
		DALOKOHSBAR_DESC 		= " Restore up to 20,000 health. If used while below 350 health you'll gain a large overheal. Passively increases damage taken but gives a chance to self-uber on taking damage."
		//
		BUFFALOSTEAK_NAME 		= "BUFFALO STEAK SANDVICH"
		BUFFALOSTEAK_DESC 		= " Passively grants immunity to critical hits."
		//
		FAMILYBUSINESS_NAME 	= "FAMILY BUSINESS"
		FAMILYBUSINESS_DESC 	= " Unlimited ammo. Attack rate is doubled while receiving a healing effect. Grants a brief critboost and mini-crit boost on kill."
		//
		FISHCAKE_NAME 			= "FISHCAKE"
		FISHCAKE_DESC 			= " Heavy resistance to BULLET damage, but more vulnerable to FIRE and BLAST damage."
		//
		SECONDBANANA_NAME 		= "SECOND BANANA"
		SECONDBANANA_DESC 		= " Heavy resistance to BLAST damage, but more vulnerable to FIRE and BULLET damage."
		///
		FISTS_NAME 				= "FISTS"
		FISTS_DESC 				= " Standard option for defense and mobility. Effective in combat."
		//
		KILLINGGLOVES_NAME 		= "KILLING GLOVES OF BOXING"
		KILLINGGLOVES_DESC 		= " Special Ability: 'Mega-Crush' -  When available, press your action slot key while standing on the bomb to instantly send it back to start. Otherwise, gain temporary move speed buff, defense and crits."
		//
		GLOVESRUNNING_NAME 		= "GLOVES OF RUNNING URGENTLY"
		GLOVESRUNNING_DESC 		= " Passively grants ability to deploy a parachute. While active, gain massively increased jump height, damage resistance and health regen."
		//
		BREADBITE_NAME 			= "BREAD BITE"
		BREADBITE_DESC 			= " Critical hits infect your victim with Corrosion, a permanent debuff that deals damage based on max health and causes the victim to explode into a small corrosive cloud on death, spreading the effect to other enemies."
		//
		WARRIRORSSPIRIT_NAME 	= "WARRIOR'S SPIRIT"
		WARRIRORSSPIRIT_DESC 	= " Left-click to leap high into the air. Land on enemies to deal massive stomp damage. Removes all primary and secondary ammo."
		//
		FISTSOFSTEEL_NAME 		= "FISTS OF STEEL"
		FISTSOFSTEEL_DESC 		= " Become a giant Heavy gauntlet with 250,000 health. You are immune to push forces and can deal heavy damage. Removes all primary and secondary ammo. You can only heal from lunchbox items."
		//
		EVICTIONNOTICE_NAME 	= "EVICTION NOTICE"
		EVICTIONNOTICE_DESC 	= " Gain a rapid healing effect on kill."
		//
		APOCOFISTS_NAME 		= "APOCO-FISTS"
		APOCOFISTS_DESC 		= " Punches push enemies away."
		//
		HOLIDAYPUNCH_NAME 		= "HOLIDAY PUNCH"
		HOLIDAYPUNCH_DESC 		= " While active, all enemies ignore you. Also grants immunity to stun. This weapon cannot deal damage however."
		//----------------------------
		//----------------------------
		//----------------------------
		SHOTGUN_ENGI_NAME		= "SHOTGUN - ENGINEER"
		SHOTGUN_ENGI_DESC 		= " Deal x4 damage to your Sentry's target."
		//
		FRONTIERJUSTICE_NAME 	= "FRONTIER JUSTICE"
		FRONTIERJUSTICE_DESC 	= " Insanely fast fire rate. Clip size matches the max revenge crit count. Reloads faster while receiving any healing effect."
		//
		WIDOWMAKER_NAME 		= "WIDOWMAKER"
		WIDOWMAKER_DESC 		= " Use 2000 metal to fire a wide shot that pushes enemies away."
		//
		POMSON_NAME 			= "POMSON 6000"
		POMSON_DESC 			= " Inflict bleed, ignite and slow enemies down."
		//
		RESCUERANGER_NAME 		= "RESCUE RANGER"
		RESCUERANGER_DESC		= " Uses 20 metal per shot, but never has to reload and increases max metal by 1000."
		///
		WRANGLER_NAME 			= "WRANGLER"
		WRANGLER_DESC 			= " While active: Increased Sentry damage and double Dispenser range."
		//
		SHORTCIRCUIT_NAME 		= "SHORT CIRCUIT"
		SHORTCIRCUIT_DESC 		= " Every 10 kills, gain a Lightning Ball spell charge (Requires Spellbook)"
		///
		WRENCH_NAME 			= "WRENCH"
		WRENCH_DESC 			= " Standard option for reliable damage."
		//
		GUNSLINGER_NAME 		= "GUNSLINGER"
		GUNSLINGER_DESC	 		= " Able to build a secondary Sentry. Triple-punch combo can execute small enemies and deal heavy damage to Giants."
		//
		SOUTHERNHOS_NAME 		= "SOUTHERN HOSPITALITY"
		SOUTHERNHOS_DESC 		= " Replaces normal Sentry with a Flame Sentry. Short ranged, but high damage."
		//
		JAG_NAME 				= "JAG"
		JAG_DESC 				= " Your Sentry has unlimited range."
		//
		EUREKAEFFECT_NAME 		= "EUREKA EFFECT"
		EUREKAEFFECT_DESC 		= " While carrying your Sentry Gun, press 'Reload' key to remotely place it on any wall or ceiling within range."
		//----------------------------
		//----------------------------
		//----------------------------
		SYRINGEGUN_NAME			= "SYRINGE GUN"
		SYRINGEGUN_DESC			= " Gain 0.5% Ubercharge per hit."
		//
		BLUTSAUGER_NAME			= "BLUTSAUGER"
		BLUTSAUGER_DESC			= " Requires and consumes 100% Ubercharge to reprogram a robot to join your team temporarily before self-destructing. Alt-Fire: Manually terminate the reprogramming of all affected bots."
		//
		CRUSADERSCROSSBOW_NAME	= "CRUSADER'S CROSSBOW"
		CRUSADERSCROSSBOW_DESC	= " Gain 0.25% Ubercharge per hit, inflict bleed and gain another 0.5% Ubercharge per tick of bleed damage."
		//
		OVERDOSE_NAME 			= "OVERDOSE"
		OVERDOSE_DESC 			= " Requires and consumes 100% Ubercharge to send a payload that shuts down all nearby small enemies for up to 15s."
		///
		MEDIGUN_NAME			= "MEDI GUN"
		MEDIGUN_DESC			= " Overheal cap raised to x10 the patient's max health. Deploy a long-lasting level 1 Projectile Shield."
		//
		KRITZKRIEG_NAME			= "KRITZKRIEG"
		KRITZKRIEG_DESC			= " Able to drain health from enemies, granting self-healing and building Uber."
		//
		QUICKFIX_NAME			= "QUICK-FIX"
		QUICKFIX_DESC			= " Very fast healing with a level 2 Projectile Shield. Able to build Uber from shield contact damage."
		//
		VACCINATOR_NAME			= "VACCINATOR"
		VACCINATOR_DESC			= " Active healing grants you and the patient 100% resistance to base damage of the selected damage type. Ubercharge grants full immunity to the selected damage type for 30 seconds."
		///
		BONESAW_NAME 			= "BONESAW"
		BONESAW_DESC			= " Standard option for defense and mobility. Gain 10% Uber on hit."
		//
		UBERSAW_NAME 			= "UBERSAW"
		UBERSAW_DESC			= " Inflict bleed on hit. Gain 2% Uber on hit."
		//
		VITASAW_NAME 			= "VITA-SAW"
		VITASAW_DESC			= " Gain an Overheal spell charge on hit (Requires Spellbook). Gain 5% Uber on hit."
		//
		AMPUTATOR_NAME 			= "AMPUTATOR"
		AMPUTATOR_DESC			= " On hit: Your Medigun becomes supercharged and temporarily gains increased heal rate, uber rate and range. Killing an enemy grants a stronger version of this effect."
		//
		SOLEMNVOW_NAME 			= "SOLEMN VOW"
		SOLEMNVOW_DESC			= " Infinite range, hits all enemies connected via Medigun beams and deals x200 damage to Medic bots. Gain 5% Uber for each enemy hit."
		//----------------------------
		//----------------------------
		//----------------------------
		SNIPERRIFLE_NAME 		= "SNIPER RIFLE"
		SNIPERRIFLE_DESC 		= " Fully charged headshot deals 450,000 damage."
		//
		MACHINA_NAME 			= "MACHINA"
		MACHINA_DESC 			= " Very slow to charge, but can shred Tanks at full charge. Killing enemies fills a rage meter that grants a 1-second critboost. Pair the critboost with a full charge to instantly destroy most Tanks you'll encounter."
		//
		HITMANSHEATMAKER_NAME 	= "HITMAN'S HEATMAKER"
		HITMANSHEATMAKER_DESC 	= " Rapidfire without unscoping. No damage on bodyshot."
		//
		AWPERHAND_NAME 			= "AWPER HAND"
		AWPERHAND_DESC 			= " Fire explosive rounds and generate rage on kills. At 100% rage, press 'reload' to gain increased max health and health regen. Rifle only charges when enemies are in your scope."
		//
		HUNTSMAN_NAME 			= "HUNTSMAN"
		HUNTSMAN_DESC 			= " Fire 5 arrows at once. Deal massive burn damage if a Pyro ignites your arrow."
		//
		SYDNEYSLEEPER_NAME 		= "SYDNEY SLEEPER"
		SYDNEYSLEEPER_DESC 		= " Fire a special dart that cripples the movement of non-giants and makes enemies unable to receive healing from Medic bots."
		//
		BAZAARBARGAIN_NAME 		= "BAZAAR BARGAIN"
		BAZAARBARGAIN_DESC 		= " Killing enemies of the same class in a row increases fire rate, stacking up to 3. Killing another class resets the combo."
		//
		FORTIFIEDCOMPOUND_NAME 	= "FORTIFIED COMPOUND"
		FORTIFIEDCOMPOUND_DESC 	= " Reduced damage over Huntsman, but fires faster, penetrates and crits wet enemies."
		//
		CLASSIC_NAME 			= "CLASSIC"
		CLASSIC_DESC 			= " Fire as fast as you can pull the trigger, or charge a single shot with insane explosive headshot power that obliterates all non-giant bots in the area."
		///
		SMG_NAME 				= "SMG"
		SMG_DESC 				= " Able to headshot for greatly increased damage. Alt-Fire: Zoom in and gain 100% accuracy at the cost of halved fire rate."
		//
		RAZORBACK_NAME 			= "RAZORBACK"
		RAZORBACK_DESC 			= " Very fast recharge and applies Jarate to your attacker."
		//
		JARATE_NAME 			= "JARATE"
		JARATE_DESC 			= " Instant recharge, slows enemies down."
		//
		DARWIN_NAME 			= "DARWIN'S DANGER SHIELD"
		DARWIN_DESC 			= " Nearly immune to FIRE damage, but take 50% more damage from BULLET and BLAST."
		//
		COZYCAMPER_NAME 		= "COZY CAMPER"
		COZYCAMPER_DESC 		= " Minor increase in move speed, max health and health regen. Immune to afterburn."
		//
		CLEANERSCARBINE_NAME 	= "CLEANER'S CARBINE"
		CLEANERSCARBINE_DESC 	= " Mini-crit boost lasts 30 seconds."
		//
		BEAUTYMARK_NAME 		= "SELF-AWARE BEAUTY MARK"
		BEAUTYMARK_DESC 		= " Rain down holy hellfire with flaming arrows. Alt-Fire: Throw a cluster of flaming arrows at once."
		///
		KUKRI_NAME 				= "KUKRI"
		KUKRI_DESC 				= " Standard option for defense and mobility."
		//
		TRIBALMANSSHIV_NAME 	= "TRIBALMAN'S SHIV"
		TRIBALMANSSHIV_DESC 	= " Utility Item - You have no gravity and can freely fly."
		//
		BUSHWACKA_NAME 			= "BUSHWACKA"
		BUSHWACKA_DESC 			= " Infinite melee range and guaranteed crits against burning enemies."
		//
		SHAHANSHAH_NAME 		= "SHAHANSHAH"
		SHAHANSHAH_DESC 		= " Left-click to send yourself flying upward, good for reaching high places. You are also immune to fall damage."
		//----------------------------
		//----------------------------
		//----------------------------
		REVOLVER_NAME 			= "REVOLVER"
		REVOLVER_DESC 			= " On hit: Apply multiple debuffs, cause enemies to take increased damage for a short time, deplete enemy Medic Ubercharge and force Spy bots to undisguise. Can stun airborne enemies."
		//
		AMBASSADOR_NAME 		= "AMBASSADOR"
		AMBASSADOR_DESC 		= " Deal massive headshot damage. Damage is doubled if you are not disguised."
		//
		LETRANGER_NAME 			= "L'ETRANGER"
		LETRANGER_DESC 			= " Able to execute any non-giant in a single shot. Zero damage to Giants or Tanks however."
		//
		ENFORCER_NAME 			= "ENFORCER"
		ENFORCER_DESC 			= " Ignores damage resistances and stores a crit for every backstab or building destroyed with a Sapper."
		//
		DIAMONDBACK_NAME 		= "DIAMONDBACK"
		DIAMONDBACK_DESC 		= " Creates a black hole to pull enemies in."
		///
		SAPPER_NAME 			= "SAPPER"
		SAPPER_DESC 			= " Max stun radius and duration. Fast recharge."
		//
		REDTAPE_NAME 			= "RED-TAPE RECORDER"
		REDTAPE_DESC 			= " Instantly destroys Engineer buildings, but can only sap one enemy at a time."
		///
		KNIFE_NAME 				= "KNIFE"
		KNIFE_DESC 				= " While active, the Knife drains your health but grants immunity to ALL damage. Kills restore health."
		//
		YOURETERNALREWARD_NAME 	= "YOUR ETERNAL REWARD"
		YOURETERNALREWARD_DESC 	= " Damage increases as you become injured and crits while your health is below 10%, but only for front stabs. Resist 90% damage."
		//
		KUNAI_NAME 				= "CONNIVER'S KUNAI"
		KUNAI_DESC 				= " Infinite melee range. Backstabs trigger an explosion, dealing extra damage to nearby targets."
		//
		BIGEARNER_NAME 			= "BIG EARNER"
		BIGEARNER_DESC 			= " You have a massive amount of health and 'missed' swings cause you to heal rapidly, however you receive friendly fire from your teammates."
		//
		WANGAPRICK_NAME 		= "WANGA PRICK"
		WANGAPRICK_DESC 		= " Killing an enemy causes you to immediately enter cloak for a few seconds. You can attack enemies while in this cloak state and chain kills to remain invisible. No disguise."
		//
		SHARPDRESSER_NAME 		= "SHARP DRESSER"
		SHARPDRESSER_DESC 		= " Backstabs trigger an explosion, dealing extra damage to nearby targets."
		//
		SPYCICLE_NAME 			= "SPY-CICLE"
		SPYCICLE_DESC 			= " 'Missed' swing causes you to leap into the air for free surf-stabs, but you cannot disguise. Deals massive damage to Giants on backstab."
		///
		INVISWATCH_NAME 		= "INVIS WATCH"
		INVISWATCH_DESC 		= " Infinite cloak, +10% faster move speed."
		//
		DEADRINGER_NAME 		= "DEAD RINGER"
		DEADRINGER_DESC 		= " Triggers a short burst of move speed when activated, allowing you to dash in any direction. Incoming damage reduced by 80% while dashing."
		//
		CLOAKANDDAGGER_NAME		= "CLOAK AND DAGGER"
		CLOAKANDDAGGER_DESC		= " Instant cloak and decloaking."
		//----------------------------
		//----------------------------
		//----------------------------
		FRYINGPAN_NAME 				= "FRYING PAN"
		FRYINGPAN_DESC 				= " Deal x30 damage to enemies of the same class as you and gain crits on kill."
		//
		SAXXY_NAME 					= "SAXXY"
		SAXXY_DESC 					= " Deal x30 damage to enemies of the same class as you and gain crits on kill."
		//
		MEMORYMAKER_NAME 			= "MEMORY MAKER"
		MEMORYMAKER_DESC			= " Deal x30 damage to enemies of the same class as you and gain crits on kill."
		//
		CONOBJECTOR_NAME			= "CONSCIENTIOUS OBJECTOR"
		CONOBJECTOR_DESC			= " Every 10 kills, roll a random spell (Requires Spellbook)."
		//
		FREEDOMSTAFF_NAME 			= "FREEDOM STAFF"
		FREEDOMSTAFF_DESC 			= " Small chance on taking damage to dodge the attack and become ubered for 3s."
		//
		BATOUTTAHELL_NAME 			= "BAT OUTTA HELL"
		BATOUTTAHELL_DESC 			= " While active, you are invulnerable to all incoming damage and generate a massive overheal pool, but you are completely vulnerable to knockback."
		//
		HAMSHANK_NAME 				= "HAM SHANK"
		HAMSHANK_DESC 				= " Special Ability: 'Vital Resurgence' -  When available, press your action slot key to instantly gain 10x overheal and become immune to knockback for 20 seconds."
		//
		NECROSMASHER_NAME 			= "NECRO SMASHER"
		NECROSMASHER_DESC 			= " Special Ability: 'Vehicular Mannslaughter' -  When available, press your action slot key to enter Bumper-Car mode. While in Bumper-Car mode you are invulnerable, regenerate health and can run enemies over."
		//
		CROSSINGGAURD_NAME 			= "CROSSING GUARD"
		CROSSINGGAURD_DESC 			= " Gain massive resistance to all melee attacks, including backstabs."
		//
		PRINNYMACHETE_NAME 			= "PRINNY MACHETE"
		PRINNYMACHETE_DESC 			= " Utility Item - Swing this melee to lunge yourself forward at high speed. Grants immunity to fall damage."
		//------------------------------------
	}
	schinese = {
		IH_TRANSLATE_ITEM		= IH_color + "[%s]" + IH_text_color + "%s"
		IH_INCLUDES				= IH_color_header + "[►]\x0826beffBB 你的武器配置包括了..."
		IH_DIS_MSG_2			= IH_disable_color + "输入 '/itemhelp 1' 可在回合中隐藏武器配置信息. \n输入 '/itemhelp 0' 可隐藏武器配置信息."
		IH_DIS_MSG				= IH_disable_color + "输入 '/itemhelp 0' 可隐藏武器配置信息. \n输入 '/itemhelp 2' 可持续显示武器配置信息."
		IH_BAD_ARGS				= IH_color_header + "[武器配置]" + IH_error_color + " {错误}\x01 参数错误!\n/itemhelp 2 - 显示\n/itemhelp 1 - 仅在准备阶段显示\n/itemhelp 0 - 隐藏e"
		IH_OOB_ARG				= IH_color_header + "[武器配置]" + IH_error_color + " {错误}\x01 设置超出范围值! : %s"
		IH_HELP_MSG				= IH_color_header + "[武器配置]\x01 武器配置信息会显示 \x03每一把 \x01 武器的特殊改动!" 
		IH_DISABLE				= IH_color_header + "[►]\x01 已隐藏武器配置信息."
		IH_WAVE_SETUP			= IH_color_header + "[►]\x01 武器配置信息仅在准备阶段显示."
		IH_ENABLE 				= IH_color_header + "[►]\x01 已显示武器配置信息."
		LOW_METAL 				= "金属不足"
		TOMISLAV_HEAT			= "汤姆斯拉夫 热量: %s%%"
		STUCK_RESPAWNED 		= "为避免卡住, 已将你重生至其他区域."
		ABILITY_READY			= "%s\n► 就绪 ◄"
		ABILITY_CHARGING		= "%s\n%s"
		ABILITY_CHARGING_MSG	= "冷却中: %s秒"
		ABILITY_CHARGING_D_MSG	= "冷却中: %s%%"
		MEGACRUSH 				= "粉碎之拳"
		VITALRESURGENCE 		= "生机勃发"
		VEHICULARMANNSLAUGHTER 	= "车载屠宰场"
		TEST 					= "测试用能力"
		NO_MONEY				= "You can't afford this! (Cost: $%s, you have: $%s)" // Dont Translate this, my own project
		REPROG_BOT_STRONG		= TF_TEAM_COLOR_REPROG_B+"%s\x01 抵抗了你的重编程."
		REPROG_BOT_NOT_SUIT		= TF_TEAM_COLOR_REPROG_B+"%s\x01 不适合战斗且无法被重编程."
		REPROG_BOT_LEAVE		= TF_TEAM_COLOR_SPEC+"%s 死亡."
		REPROG_BOT_MESSAGE 		= TF_TEAM_COLOR_RED+"%s\x01 重编程了 "+TF_TEAM_COLOR_REPROG_B+"%s\x01!"
		//--------------------------------------------------------- // TODO: TRANSLATE
		CHECKPOINT_CREATED		= "\x077c8cc2Checkpoint created:\x078165cf [/%s]"
		CHECKPOINT_WRONG_MAP	= CHECKPOINT_ERROR+"That checkpoint was not set for this map."
		CHECKPOINT_WRONG_MISS	= CHECKPOINT_ERROR+"That checkpoint was not set for this mission."
		CHECKPOINT_EXPIRE		= CHECKPOINT_ERROR+"That checkpoint has expired."
		CHECKPOINT_RESTORE		= "\x0744CC44Restored to last saved checkpoint."
		CHECKPOINT_RESTORE_HUD	= "Restored to last saved checkpoint."
		//---------------------------------------------------------
		SCATTERGUN_NAME 		= "猎枪"
		SCATTERGUN_DESC 		= "标准的输出选择. 对近距离敌人更加有效."
		//
		FORCENATURE_NAME		= "自然之力"
		FORCENATURE_DESC		= "提升击退效果. 但输出能力比猎枪稍低."
		//
		SHORTSTOP_NAME 			= "游击手"
		SHORTSTOP_DESC 			= "大幅度提升开火速度并在命中湿身的敌人时必定暴击, 但装填速度降低."
		//
		SODAPOPPER_NAME 		= "苏打炮手"
		SODAPOPPER_DESC 		= "按住开火键可连射最多四发霰弹."
		//
		BABYFACEBLASTER_NAME	= "娃娃脸的冲击波"
		BABYFACEBLASTER_DESC	= "按住开火键可最多连发200发霰弹, 对近距离敌人造成极大伤害. 但后坐力大幅度提升."
		//
		BACKSCATTER_NAME		= "偷袭之力"
		BACKSCATTER_DESC		= "攻击敌人后背时必定暴击. 不需要弹药."
		///
		PISTOL_NAME 			= "手枪"
		PISTOL_DESC 			= "发射火箭弹. 能够进一步提升机动性."
		//
		BONK_NAME 				= "原子能饮料"
		BONK_DESC 				= "超充能你的饮料, 持续时间内给予无敌且仍能攻击."
		//
		CRITACOLA_NAME 			= "爆击可乐"
		CRITACOLA_DESC 			= "超充能你的饮料, 持续时间内给予暴击."
		//
		MADMILK_NAME 			= "疯狂的牛奶"
		MADMILK_DESC 			= "被牛奶效果影响的敌人将无法移动."
		//
		WINGER_NAME 			= "边锋球员"
		WINGER_DESC 			= "手持时可无限跳跃. 发射单发霰弹且在空中时必定暴击. 攻击附带击退效果."
		//
		PRETTYBOYS_NAME 		= "帅气男孩的袖珍手枪"
		PRETTYBOYS_DESC 		= "发射火箭弹, 敌人生命值越低造成伤害越高. 攻击不受距离衰减. 次要开火键:发射一枚-20%伤害的追踪火箭."
		//
		CLEAVER_NAME 			= "混混的菜刀"
		CLEAVER_DESC 			= "勇度箭矢: 召唤一根箭矢为你而战. 次要开火键: 干扰模式, 但-75%伤害."
		//
		MATATEDMILK_NAME 		= "突变牛奶"
		MATATEDMILK_DESC 		= "连续丢出会爆炸的奶瓶, 对敌人造成伤害. 次要开火键: 一次丢出大量奶瓶."
		///
		BAT_NAME 				= "球棒"
		BAT_DESC 				= "在死亡时有几率以1点生命值立刻重生."
		//
		SANDMAN_NAME			= "睡魔"
		SANDMAN_DESC 			= "能连续发射多枚冷却速度大幅度提升的棒球, 对单一敌人造成爆发伤害."
		//
		HOLYMACKEREL_NAME		= "圣灵鲭鱼"
		HOLYMACKEREL_DESC		= "能够给多个敌人打上死亡标记."
		//
		CANDYCANE_NAME 			= "糖果手杖"
		CANDYCANE_DESC 			= "功能物品 - 可以无限飞行且不受重力影响."
		//
		BOSTONBASHSER_NAME 		= "波士顿狼牙棒"
		BOSTONBASHSER_DESC 		= "高风险/高回报. 能够秒杀大多数普通机器人,并获得 10 秒暴击. 同时攻击被治疗链连接的敌人. 挥空后会杀死自己."
		//
		SUNONASTICK_NAME		= "太阳之杖"
		SUNONASTICK_DESC		= "攻击有几率能够眩晕敌人或给予自身短时间暴击. 同时攻击被治疗链连接的敌人. 挥空后会眩晕自己."
		//
		FANOWAR_NAME 			= "军配扇"
		FANOWAR_DESC 			= "功能物品 - 挥舞时会向前高速推动自己. 免疫摔落伤害."
		//
		ATOMIZER_NAME 			= "原子能球棒"
		ATOMIZER_DESC 			= "普通攻击无法造成伤害, 在成功造成嘲讽击杀后获得3分钟的暴击."
		//
		THREERUNEBLADE_NAME 	= "符文剑"
		THREERUNEBLADE_DESC 	= "手持时, 大幅提升移动速度并获得三段跳. 免疫摔落伤害."
		//
		UNARMEDCOMBAT_NAME 		= "一臂之力"
		UNARMEDCOMBAT_DESC 		= "每 10 次击杀会为你生成骷髅魔法书(需要装备法术书)."
		//
		WRAPAASSASSIN_NAME 		= "包装纸杀手"
		WRAPAASSASSIN_DESC 		= "挥舞时能够反弹飞行物. 穿戴时免疫眩晕."
		//----------------------------
		//----------------------------
		//----------------------------
		ROCKETLAUNCHER_NAME		= "火箭发射器"
		ROCKETLAUNCHER_DESC		= "标准的输出选择."
		//
		DIRECTHIT_NAME			= "精确打击者"
		DIRECTHIT_DESC			= "次要开火键: 发射一枚可以击飞小型机器人的火箭以进行后续的连击. 提升武器的辅助瞄准能力."
		//
		BLACKBOX_NAME			= "黑匣子"
		BLACKBOX_DESC			= "攻击可以减速敌人并施加流血效果. 此武器对士兵机器人造成 2 倍伤害."
		//
		ROCKETJUMPER_NAME		= "火箭伞兵"
		ROCKETJUMPER_DESC		= "降低开火速度与装填速度, 大幅提升伤害与爆炸范围. 对集群的敌人更加有效."
		//
		LIBERTYLAUNCHER_NAME	= "自由推进炮"
		LIBERTYLAUNCHER_DESC	= "乞丐式装填. 发射飞行速度极慢但伤害与爆炸范围极高的火箭. 大幅降低装填速度与备弹量."
		//
		COWMANGLER_NAME			= "绞牛机 5000"
		COWMANGLER_DESC			= "攻击能使小型机器人停顿. 蓄力攻击的停顿效果提升. 继续按住次要攻击键能够多次发射蓄力飞弹, 造成的更强停顿效果."
		//
		ORIGINAL_NAME			= "正宗雷神之锤火箭发射器"
		ORIGINAL_DESC			= "乞丐式装填. 按住开火键可连射最多四发火箭."
		//
		BEGGARSBAZOOKA_NAME		= "乞丐的火箭筒"
		BEGGARSBAZOOKA_DESC		= "按住开火键可装填最多 100 发火箭. 此武器不会炸膛."
		//
		AIRSTRIKE_NAME			= "空袭火箭筒"
		AIRSTRIKE_DESC			= "以固定的散射分布发射最多 10 枚火箭. 火箭能够追踪敌人."
		///
		SHOTGUN_SOLD_NAME 		= "霰弹枪 - 士兵" 
		SHOTGUN_SOLD_DESC 		= "在火箭跳式必定暴击且大幅提升开火速度." 
		//
		SHOTGUN_NAME 			= "霰弹枪" 
		SHOTGUN_DESC 			= "标准的输出选择." 
		//
		BUFFBANNER_NAME 		= "战旗" 
		BUFFBANNER_DESC 		= "极大幅度提升增益范围与持续时间." 
		//
		GUNBOATS_NAME 			= "炮艇" 
		GUNBOATS_DESC 			= "按住 '跳跃' 键可自动连跳. 免疫摔落伤害." 
		//
		BATTALIONS_NAME 		= "军队的支援" 
		BATTALIONS_DESC 		= "极大幅度提升增益范围与持续时间." 
		//
		CONCHEROR_NAME 			= "征服者战旗" 
		CONCHEROR_DESC 			= "极大幅度提升增益范围与持续时间." 
		//
		RESERVESHOOTER_NAME 	= "预备役射手" 
		RESERVESHOOTER_DESC 	= "按住次要攻击键可以缩放. 造成不受距离影响影响的高额伤害并在击杀时候获得 3 秒迷你暴击. 无法暴击, 无法对坦克造成伤害." 
		//
		BISON_NAME 				= "正义野牛" 
		BISON_DESC 				= "能够连射并能够追踪敌人的穿透光束." 
		//
		MANTREADS_NAME 			= "踏步靴" 
		MANTREADS_DESC 			= "极大幅降低伤害导致的击退效果. 大幅提升空中转向能力. 提升踩踏造成的伤害并能根据自身速度进一步提升." 
		//
		BASEJUMPER_NAME 		= "极限降落伞" 
		BASEJUMPER_DESC 		= "能够多次打开降落伞. 提升击退抗性与子弹伤害抗性, 在空中会受到额外的伤害." 
		//
		PANICATTACK_NAME 		= "恐慌打击" 
		PANICATTACK_DESC 		= "紧急时候的回复手段. 命中时立刻恢复 10000 点生命值. 手持此武器时受到伤害时会有几率获得无敌." 
		///
		SHOVEL_NAME 			= "铁锹"
		SHOVEL_DESC 			= "标准选择, 提升移动速度与防御."
		//
		EQUALIZER_NAME 			= "十字镐"
		EQUALIZER_DESC 			= "嘲讽攻击会造成极大伤害并将敌人击飞至空中."
		//
		PAINTRAIN_NAME 			= "钉棍"
		PAINTRAIN_DESC 			= "攻击可以减速敌人并施加流血效果. 免疫摔落伤害."
		//
		HALFZATOICHI_NAME 		= "座头市之刀"
		HALFZATOICHI_DESC 		= "造成基础伤害并提升基础生命值与移动速度, 提升攻击范围."
		//
		MARKETGARDENER_NAME 	= "市场花园铁锹"
		MARKETGARDENER_DESC 	= "大幅提升暴击伤害. 造成击杀后, 提升生命值, 伤害抗性以及所有武器的伤害. 挥空后会杀死自己."
		//
		DISCIPLINARYACTION_NAME = "指挥官的军鞭"
		DISCIPLINARYACTION_DESC	= "标准选择, 提升移动速度与防御."
		//
		ESCAPEPLAN_NAME			= "逃生计划镐"
		ESCAPEPLAN_DESC			= "标准选择, 提升移动速度与防御."
		//----------------------------
		//----------------------------
		//----------------------------
		FLAMETHROWER_NAME 		= "火焰喷射器"
		FLAMETHROWER_DESC		= "标准的输出选择. 击杀时获得一段时间的迷你暴击."
		//
		BACKBURNER_NAME 		= "偷袭烈焰喷射器"
		BACKBURNER_DESC			= "绿焰 - 攻击能够标记敌人且能短暂击晕空中的敌人. 此武器对火焰兵机器人造成 2 倍伤害."
		//
		DEGREASER_NAME 			= "脱油剂"
		DEGREASER_DESC			= "提升攻击距离以及直接命中的伤害, 无法造成后续燃烧伤害. 无法气爆."
		//
		PHLOGISTINATOR_NAME 	= "燃素喷射器"
		PHLOGISTINATOR_DESC		= "绿焰 - 攻击能够标记敌人且能短暂击晕空中的敌人. 提升对坦克的伤害, 但降低自身移动速度."
		//
		RAINBLOWER_NAME 		= "彩虹喷灯"
		RAINBLOWER_DESC			= "提升攻击距离但降低直接命中的伤害, 提升后续燃烧伤害. 大幅度提升对建筑的伤害并能点燃火焰兵机器人. 降低气爆能力但提升气爆冷却速度."
		//
		DRAGONSFURY_NAME 		= "龙之怒焰"
		DRAGONSFURY_DESC		= "大幅提升开火速度以及气爆速度."
		//
		NOSTROMONAPALMER_NAME 	= "诺斯魔焰"
		NOSTROMONAPALMER_DESC	= "攻击能够减速敌人. 造成火焰伤害可以积攒 '呜唔' 值, 能够给予自身征服者战旗效果. 无法气爆."
		///
		SHOTGUN_PYRO_NAME 		= "霰弹枪 - 火焰兵" 
		SHOTGUN_PYRO_DESC 		= "攻击燃烧的敌人时必定暴击." 
		//
		FLAREGUN_NAME 			= "信号枪" 
		FLAREGUN_DESC 			= "发射能够穿透敌人的子弹. 每穿透一个敌人伤害都会大幅度提升. 攻击有几率击晕敌人." 
		//
		DETONATOR_NAME 			= "起爆者" 
		DETONATOR_DESC 			= "极大幅度提升爆炸范围. 使范围内所有间谍机器人立刻解除伪装与隐形. 提升对自身的推动力." 
		//
		MANMELTER_NAME 			= "熔人枪" 
		MANMELTER_DESC 			= "连射出能够追踪敌人的信号弹. 不需要弹药. 次要开火键: 一次发射多发信号弹." 
		//
		SCORCHSHOT_NAME 		= "焦化枪" 
		SCORCHSHOT_DESC 		= "命中燃烧的敌人时大幅提升伤害, 为敌人灭火且击退敌人. 攻击未燃烧的敌人时无任何效果. 次要开火键: 发射缓慢追踪敌人的信号弹." 
		//
		THERMALTHRUSTER_NAME 	= "热能推进器" 
		THERMALTHRUSTER_DESC 	= "降低能量消耗并提升动作速度. 能在空中再次启动并提升踩踏伤害. 击杀敌人时获得一段时间暴击." 
		//
		GASPASSER_NAME 			= "纵火者的油桶" 
		GASPASSER_DESC 			= "起始充能为空且死亡时清空充能. 造成 150,000 伤害以充能. 大幅提升汽油爆炸伤害." 
		///
		FIREAXE_NAME 			= "消防斧"
		FIREAXE_DESC 			= "标准选择, 提升移动速度与防御."
		//	
		AXTINGUISHER_NAME 		= "火焰战斧"
		AXTINGUISHER_DESC		= "大幅提升对燃烧敌人的伤害."
		//
		HOMEWRECKER_NAME 		= "拆迁者"
		HOMEWRECKER_DESC 		= "大幅提升攻击距离与对建筑的伤害."
		//
		POWERJACK_NAME 			= "强力千斤顶"
		POWERJACK_DESC 			= "提升移动速度与攻击速度. 攻击可以施加流血与点燃效果. 击杀时获得一段时间的迷你暴击."
		//
		BACKSCRATCHER_NAME 		= "不求人"
		BACKSCRATCHER_DESC 		= "攻击敌人后背时大幅提升伤害. 杀敌后提升移动速度, 伤害抗性以及所有武器的伤害."
		//
		VOLCANOFRAGMENT_NAME 	= "熔岩战斧"
		VOLCANOFRAGMENT_DESC 	= "攻击有几率击晕敌人."
		//
		POSTALPUMMELER_NAME 	= "明信片打手"
		POSTALPUMMELER_DESC 	= "命中后: 施加混乱, 短时间内使敌人往炸弹路线的反方向前进. 按住次要开火键攻击会立刻传送至出生点."
		//
		MAUL_NAME 				= "破坏锤"
		MAUL_DESC 				= "命中后: 使敌人击飞至空中."
		//
		THIRDDEGREE_NAME 		= "三度烧伤"
		THIRDDEGREE_DESC 		= "大幅提升自身火焰伤害抗性, 手持时提升非近战伤害抗性."
		//
		LOLLICHOP_NAME 			= "锋利的波板糖"
		LOLLICHOP_DESC 			= "每 10 次击杀会为你生成火雨魔法书(需要装备法术书)."
		//
		NEONANNIHILATOR_NAME 	= "霓虹杀手"
		NEONANNIHILATOR_DESC 	= "降低自身重力."
		//
		HOTHAND_NAME 			= "灼热之手"
		HOTHAND_DESC 			= "命中敌人时会使其击飞."
		//----------------------------
		//----------------------------
		//----------------------------
		GRENADELAUNCHER_NAME 	= "榴弹发射器"
		GRENADELAUNCHER_DESC	= "标准的输出选择."
		//
		LOCHNLOAD_NAME 			= "双管榴弹发射器"
		LOCHNLOAD_DESC			= "降低开火速度并提升伤害与爆炸范围. 对集群的敌人更加有效."
		//
		ALIBABA_NAME			= "阿里巴巴的尖头靴"
		ALIBABA_DESC			= "提升移动速度, 跳跃高度与护盾冲锋距离. 提供额外的伤害抗性, 护盾充能速度以及冲撞伤害."
		// TODO: Update! " Enhanced shield bash damage. Grants immunity to fall damage."
		//
		BOOTLEGGER_NAME			= "海盗头子的假腿"
		BOOTLEGGER_DESC			= "提升移动速度, 跳跃高度与护盾冲锋距离. 大幅提升近战伤害抗性但受到额外的暴击伤害."
		// TODO: Update! " Enhanced shield recharge rate. Grants immunity to fall damage."
		//
		LOOSECANNON_NAME		= "脱缰巨炮"
		LOOSECANNON_DESC		= "以固定的散射分布发射最多 4 枚炮弹. 炮弹在接触物体表面时立刻爆炸."
		//
		IRONBOMBER_NAME			= "铁弹发射器"
		IRONBOMBER_DESC			= "攻击无视敌人的伤害抗性并在击杀时获得一段时间的暴击. 不需要弹药. 榴弹会在墙面反弹."
		///
		STICKYBOMB_NAME 		= "黏性炸弹发射器"
		STICKYBOMB_DESC 		= "标准的输出选择. 可以放置最多 50 枚粘弹."
		//
		SCOTTISHRES_NAME 		= "苏格兰防御者"
		SCOTTISHRES_DESC 		= "粘弹需要 5 秒就绪并在 10 秒后自毁, 但极大幅度提升伤害."
		//
		STICKYJUMPER_NAME 		= "黏弹跳跃者"
		STICKYJUMPER_DESC 		= "放置一个眩晕力场, 发射能够击晕敌人的冲击波. (首领单位免疫击晕)"
		//
		CHARGINTARGE_NAME 		= "冲锋盾"
		CHARGINTARGE_DESC 		= "大幅提升爆炸伤害抗性, 但会受到额外的火焰伤害和子弹伤害. 获得额外的击退抗性与暴击抗性."
		// TODO: Update! " Heavy Charge - Superior shield bash damage."
		//
		SPLENDIDSCREEN_NAME 	= "辉煌护盾"
		SPLENDIDSCREEN_DESC 	= "大幅提升火焰伤害抗性, 但会受到额外的爆炸伤害和子弹伤害. 获得额外的击退抗性与暴击抗性."
		// TODO: Update! " Rapid Charge - Superior shield recharge rate."
		//
		TIDETURNER_NAME 		= "力挽狂澜"
		TIDETURNER_DESC 		= "大幅提升子弹伤害抗性, 但会受到额外的爆炸伤害和火焰伤害. 获得额外的击退抗性与暴击抗性."
		// TODO: Update! " Burst Charge - Superior shield charge move speed."
		//
		QUICKIEBOMB_NAME 		= "快速黏弹发射器"
		QUICKIEBOMB_DESC 		= "大幅提升开火速度以及粘弹就绪时间. 击杀时获得一段时间的迷你暴击."
		///
		BOTTLE_NAME 			= "瓶子"
		BOTTLE_DESC 			= "标准选择, 提升移动速度与防御."
		//
		EYELANDER_NAME 			= "苏格兰长剑"
		EYELANDER_DESC 			= "提升伤害与攻击速度并在击杀时获得一段时间的暴击, 无法使用榴弹."
		//
		SKULLCUTTER_NAME 		= "苏格兰颅骨切割者"
		SKULLCUTTER_DESC 		= "对与你同职业的敌人造成 10 倍伤害. 击杀时获得一段时间的暴击."
		// TODO: Update! " Able to cut through enemy Ubercharge and disrupt Medi-Gun functions. Also able to deal increased damage to enemies of the same class as you."
		//
		CABER_NAME 				= "木柄手榴弹"
		CABER_DESC 				= "生命值越低此武器伤害越高. 生命值低于 2% 时必定暴击. 手榴弹的爆炸会杀死你."
		//
		CLAIDHEAMHMOR_NAME 		= "摩尔巨剑"
		CLAIDHEAMHMOR_DESC 		= "每 10 次击杀会为你生成魔眼魔法书(需要装备法术书)."
		//
		PERSIANPERSUADER_NAME 	= "波斯弯刀"
		PERSIANPERSUADER_DESC 	= "携带护盾时可以无限冲锋. 急速转向或碰撞墙面, 敌人或其他障碍时不会使冲锋停止. 免疫击晕."
		//
		NINEIRON_NAME 			= "尼斯的九号铁杆"
		NINEIRON_DESC 			= "提升横向近战攻击范围, 同时攻击范围内的所有敌人. 造成 2 倍的暴击伤害."
		//
		SCOTTISHHANDSHAKE_NAME 	= "苏格兰式握手"
		SCOTTISHHANDSHAKE_DESC 	= "手持时: 获得90%非近战伤害抗性, 获得击退免疫并大幅度提升生命上限. 无法获得弹药且从医疗包获得的生命值降低."
		//----------------------------
		//----------------------------
		//----------------------------
		MINIGUN_NAME 			= "转轮机枪"
		MINIGUN_DESC 			= "标准的输出选择. 击杀时获得一段时间的迷你暴击."
		//
		NATASCHA_NAME 			= "娜塔莎转轮机枪"
		NATASCHA_DESC 			= "攻击会使敌人减速并打上死亡标记."
		//
		BRASSBEAST_NAME 		= "黄铜猛兽"
		BRASSBEAST_DESC 		= "大幅降低枪管预热速度但伤害提升. 枪管旋转时无法移动. 攻击能够击落飞行物."
		//
		TOMISLAV_NAME 			= "汤姆斯拉夫"
		TOMISLAV_DESC 			= "造成伤害会积攒'热量'. 武器性能会随着热量逐渐提升. 在一段时间未造成伤害后会逐渐损失热量."
		//
		HUOHEATER_NAME 			= "火龙转轮机枪"
		HUOHEATER_DESC 			= "发射能量光束, 攻击会使敌人着火"
		//
		GENUINEHUOHEATER_NAME 	= "纯正 火龙转轮机枪"
		GENUINEHUOHEATER_DESC 	= "发射火箭弹. 攻击燃烧的敌人时必定暴击."
		///
		SHOTGUN_HVY_NAME 		= "霰弹枪 - 机枪手"
		SHOTGUN_HVY_DESC 		= "发射单发高伤害霰弹, 击杀后获得 8 秒暴击."
		//
		SANDVICH_NAME 			= "三明治"
		SANDVICH_DESC 			= "恢复 150,000 点生命值. 手持此物品时受到伤害会立刻死亡."
		//
		DALOKOHSBAR_NAME 		= "达勒克斯巧克力块"
		DALOKOHSBAR_DESC 		= "恢复 20,000 点生命值. 当生命值低于 350 点时会获得大量超量生命值. 携带时增加受到的伤害但受到伤害时会有几率获得无敌."
		//
		BUFFALOSTEAK_NAME 		= "水牛排三明治"
		BUFFALOSTEAK_DESC 		= "携带时免疫暴击伤害."
		//
		FAMILYBUSINESS_NAME 	= "家族运营枪"
		FAMILYBUSINESS_DESC 	= "不需要弹药. 在受到治疗时获得 2 倍的开火速度. 击杀时获得一段时间的暴击."
		//
		FISHCAKE_NAME 			= "炸鱼饼"
		FISHCAKE_DESC 			= "大幅提升子弹伤害抗性, 但会受到额外的爆炸伤害和火焰伤害."
		//
		SECONDBANANA_NAME 		= "第二名的香蕉"
		SECONDBANANA_DESC 		= "大幅提升爆炸伤害抗性, 但会受到额外的火焰伤害和子弹伤害."
		///
		FISTS_NAME 				= "拳头"
		FISTS_DESC 				= "标准选择, 提升移动速度与防御."
		//
		KILLINGGLOVES_NAME 		= "杀戮拳击手套"
		KILLINGGLOVES_DESC 		= "特殊能力: '粉碎之拳' -  当可用时, 站在炸弹上按下动作键会立刻重置炸弹. 不站在炸弹上时会给予自身临时的移动速度, 伤害抗性与暴击."
		//
		GLOVESRUNNING_NAME 		= "紧急逃跑手套"
		GLOVESRUNNING_DESC 		= "携带此武器时能够使用降落伞. 手持时, 大幅度提升跳跃高度, 伤害抗性与生命值恢复."
		//
		BREADBITE_NAME 			= "咬人的面包"
		BREADBITE_DESC 			= "暴击时会为敌人施加感染效果, 会根据其最大生命值造成伤害. 被感染的敌人死亡时会爆炸, 并将感染传播给附近的单位."
		//
		WARRIRORSSPIRIT_NAME 	= "勇士之魂"
		WARRIRORSSPIRIT_DESC 	= "按下左键可以向上推动自己. 攻击能够踩踏敌人造成高额伤害. 无法使用机枪与霰弹枪."
		//
		FISTSOFSTEEL_NAME 		= "钢铁手套"
		FISTSOFSTEEL_DESC 		= "变成拥有 250,000 点生命值的巨型机器人. 免疫击退并能造成较高的近战伤害. 无法使用机枪与霰弹枪. 只能使用副武器的食物恢复生命值."
		//
		EVICTIONNOTICE_NAME 	= "驱逐警告"
		EVICTIONNOTICE_DESC 	= "击杀时会获得持续的生命恢复."
		//
		APOCOFISTS_NAME 		= "天灾之拳"
		APOCOFISTS_DESC 		= "攻击能够击退敌人."
		//
		HOLIDAYPUNCH_NAME 		= "欢乐拳套"
		HOLIDAYPUNCH_DESC 		= "手持时, 所有的敌人都会无视你. 免疫击晕. 此武器无法造成伤害."
		//----------------------------
		//----------------------------
		//----------------------------
		SHOTGUN_ENGI_NAME		= "霰弹枪 - 工程师"
		SHOTGUN_ENGI_DESC 		= "对被步哨枪攻击的敌人 4 倍伤害."
		//
		FRONTIERJUSTICE_NAME 	= "边境裁决者"
		FRONTIERJUSTICE_DESC 	= "极大幅提升开火速度. 会随着复仇暴击的层数获得额外的弹匣容量. 在受到治疗效果时提升装填速度."
		//
		WIDOWMAKER_NAME 		= "寡妇制造者"
		WIDOWMAKER_DESC 		= "花费 2000 金属发射能够击退敌人的大范围射击."
		//
		POMSON_NAME 			= "歼灭者 6000"
		POMSON_DESC 			= "攻击会施加流血效果, 点燃效果并会减速敌人."
		//
		RESCUERANGER_NAME 		= "火线救兵"
		RESCUERANGER_DESC		= "每次攻击消耗 20 金属, 不需要装填且最大金属量提升至 1000."
		///
		WRANGLER_NAME 			= "遥控手柄"
		WRANGLER_DESC 			= "手持时: 提升步哨枪伤害并大幅增加补给器范围."
		//
		SHORTCIRCUIT_NAME 		= "短路发生器"
		SHORTCIRCUIT_DESC 		= "每 10 次击杀会为你生成电球魔法书(需要装备法术书)"
		///
		WRENCH_NAME 			= "扳手"
		WRENCH_DESC 			= "标准的输出选择."
		//
		GUNSLINGER_NAME 		= "枪炮工之臂"
		GUNSLINGER_DESC	 		= "允许建造两座步哨枪. 近战三连击能够秒杀小型机器人或对巨型机器人造成高伤害."
		//
		SOUTHERNHOS_NAME 		= "南部的款待"
		SOUTHERNHOS_DESC 		= "将普通步哨枪替换为火焰步哨枪. 攻击范围缩小, 但伤害提升."
		//
		JAG_NAME 				= "尖齿扳手"
		JAG_DESC 				= "大幅提升步哨攻击范围."
		//
		EUREKAEFFECT_NAME 		= "传送扳手"
		EUREKAEFFECT_DESC 		= "当携带步哨枪时, 按下 '装填' 键将其远程放置在有效范围内的任何墙壁或天花板上."
		//----------------------------
		//----------------------------
		//----------------------------
		SYRINGEGUN_NAME			= "注射枪"
		SYRINGEGUN_DESC			= "攻击命中会获得 0.5% Ubercharge充能."
		//
		BLUTSAUGER_NAME			= "吸血鬼针筒枪"
		BLUTSAUGER_DESC			= "需要花费 100% Ubercharge充能以发射, 可以一段时间内将部分机器人重编程为友军, 持续时间结束时死亡. 次要开火键: 消灭所有受重编程影响的目标."
		//
		CRUSADERSCROSSBOW_NAME	= "十字军之弩"
		CRUSADERSCROSSBOW_DESC	= "攻击命中会获得 0.25% Ubercharge充能, 攻击能够施加流血效果并在每次流血时获得 0.5% Ubercharge充能."
		//
		OVERDOSE_NAME 			= "过载注射枪"
		OVERDOSE_DESC 			= "需要花费 100% Ubercharge充能以发射, 可以发射出眩晕机器人 15秒 的爆炸."
		///
		MEDIGUN_NAME			= "医疗枪"
		MEDIGUN_DESC			= "能够为治疗对象提供其 10 倍最大生命值的超量治疗. 获得持续时间较长的 1 级能量护盾."
		//
		KRITZKRIEG_NAME			= "闪电战医疗枪"
		KRITZKRIEG_DESC			= "可以吸取敌人的生命值, 恢复自身生命值与Ubercharge充能."
		//
		QUICKFIX_NAME			= "快速医疗枪"
		QUICKFIX_DESC			= "提供较快的治疗速度并获得 2 级能量护盾. 能量护盾造成伤害会提供Ubercharge充能."
		//
		VACCINATOR_NAME			= "疫苗注射枪"
		VACCINATOR_DESC			= "治疗时会为你与治疗对象提供 100% 所选伤害类型的抗性. Ubercharge能够完全免疫所选伤害类型的伤害, 持续 30 秒."
		///
		BONESAW_NAME 			= "骨锯"
		BONESAW_DESC			= "标准选择, 提升移动速度与防御. 攻击命中会获得 10% Ubercharge充能."
		//
		UBERSAW_NAME 			= "过载充能锯"
		UBERSAW_DESC			= "攻击能够施加流血效果. 攻击命中会获得 2% Ubercharge充能."
		//
		VITASAW_NAME 			= "维塔锯"
		VITASAW_DESC			= "命中时为你生成治疗魔法书 (需要装备法术书). 攻击命中会获得 5% Ubercharge充能."
		//
		AMPUTATOR_NAME 			= "器官切割器"
		AMPUTATOR_DESC			= "命中时: 超充能你的医疗枪, 短时间内提升治疗速度, Ubercharge积攒速度与持续时间. 使用此武器消灭敌人会给予更强的效果."
		//
		SOLEMNVOW_NAME 			= "希波克拉底雕像"
		SOLEMNVOW_DESC			= "极大幅提升攻击距离, 同时攻击被治疗链连接的敌人 并对医生机器人造成 200 倍伤害. 攻击命中会获得 5% Ubercharge充能."
		//----------------------------
		//----------------------------
		//----------------------------
		SNIPERRIFLE_NAME 		= "狙击步枪"
		SNIPERRIFLE_DESC 		= "满蓄力的爆头造成 450,000 点伤害."
		//
		MACHINA_NAME 			= "鬼械神狙"
		MACHINA_DESC 			= "充能速度极慢, 满充能时大幅提升对坦克的伤害. 消灭敌人会获得持续 1 秒的暴击充能. 在满充能时激活暴击充能能够重创坦克."
		//
		HITMANSHEATMAKER_NAME 	= "职业杀手的手感"
		HITMANSHEATMAKER_DESC 	= "连射不受开镜与否的限制. 射击身体时无法造成伤害."
		//
		AWPERHAND_NAME 			= "高手的 AWP"
		AWPERHAND_DESC 			= "发射爆炸弹药. 消灭敌人会积攒充能. 满充能时按下 '装填' 键可提升最大生命值与生命恢复. 只有在瞄准敌人时才能蓄力."
		//
		HUNTSMAN_NAME 			= "猎人短弓"
		HUNTSMAN_DESC 			= "一次发射 5 支箭矢. 大幅提升己方火焰兵点燃箭矢后的燃烧伤害."
		//
		SYDNEYSLEEPER_NAME 		= "悉尼沉睡者"
		SYDNEYSLEEPER_DESC 		= "发射能够停顿普通机器人的飞镖弹. 被飞镖弹命中的敌人无法被医生治疗."
		//
		BAZAARBARGAIN_NAME 		= "市场还价者"
		BAZAARBARGAIN_DESC 		= "消灭同一职业的机器人会提升开火速度, 最多叠加 3 层. 消灭其他职业的机器人会重置层数."
		//
		FORTIFIEDCOMPOUND_NAME 	= "强化复合弓"
		FORTIFIEDCOMPOUND_DESC 	= "降低造成的伤害但开火速度提升, 弓箭能够穿透敌人并在攻击湿身的敌人时必定暴击."
		//
		CLASSIC_NAME 			= "经典狙击步枪"
		CLASSIC_DESC 			= "按下攻击键的速度越快开火速度越快, 满蓄力的爆头攻击会秒杀范围内的小型机器人."
		///
		SMG_NAME 				= "SMG"
		SMG_DESC 				= "攻击能够爆头. 次要开火键: 缩放视野并极大幅度提升精准度但会 -50% 开火速度."
		//
		RAZORBACK_NAME 			= "电击背脊盾"
		RAZORBACK_DESC 			= "大幅度提升冷却速度并在受到攻击时为敌人施加尿液效果."
		//
		JARATE_NAME 			= "瓶手道尿瓶"
		JARATE_DESC 			= "大幅提升充能速度, 尿液能够减速敌人."
		//
		DARWIN_NAME 			= "达尔文的危险之盾"
		DARWIN_DESC 			= "大幅提升火焰伤害抗性, 但会受到 +50% 的子弹伤害和爆炸焰伤害."
		//
		COZYCAMPER_NAME 		= "惬意蹲坑汉"
		COZYCAMPER_DESC 		= "穿戴时提升移动速度, 最大生命值与生命恢复. 免疫后续燃烧伤害."
		//
		CLEANERSCARBINE_NAME 	= "扫荡者卡宾"
		CLEANERSCARBINE_DESC 	= "迷你暴击持续时间延长至 30 秒."
		//
		BEAUTYMARK_NAME 		= "迷人的生命体"
		BEAUTYMARK_DESC 		= "发射出附加火焰的箭矢. 次要开火键: 一次发射多发燃烧箭矢."
		///
		KUKRI_NAME 				= "反曲刀"
		KUKRI_DESC 				= "标准选择, 提升移动速度与防御."
		//
		TRIBALMANSSHIV_NAME 	= "部落砍刀"
		TRIBALMANSSHIV_DESC 	= "功能物品 - 可以无限飞行且不受重力影响."
		//
		BUSHWACKA_NAME 			= "灌木丛"
		BUSHWACKA_DESC 			= "极大幅度提升近战距离并在攻击燃烧的敌人时必定暴击."
		//
		SHAHANSHAH_NAME 		= "诸王之王"
		SHAHANSHAH_DESC 		= "按下左键可以向上推动自己, 用于寻找高处的点位. 免疫摔落伤害."
		//----------------------------
		//----------------------------
		//----------------------------
		REVOLVER_NAME 			= "左轮手枪"
		REVOLVER_DESC 			= "命中时: 施加多项减益, 使敌人受到更多伤害, 移除医生的Ubercharge充能并使间谍机器人解除伪装. 可以击晕空中的敌人."
		//
		AMBASSADOR_NAME 		= "大使手枪"
		AMBASSADOR_DESC 		= "大幅提升爆头伤害. 未伪装时提升 2 倍的爆头伤害."
		//
		LETRANGER_NAME 			= "陌生人"
		LETRANGER_DESC 			= "单次攻击可以秒杀普通机器人. 无法对坦克或巨型机器人造成伤害.次要开火键: 发射一枚钩爪."
		//
		ENFORCER_NAME 			= "执法者"
		ENFORCER_DESC 			= "攻击无视敌人的伤害抗性并在背刺或使用电子工兵摧毁建筑时储存暴击."
		//
		DIAMONDBACK_NAME 		= "菱背响尾蛇"
		DIAMONDBACK_DESC 		= "发射一个黑洞吸引机器人."
		///
		SAPPER_NAME 			= "电子工兵"
		SAPPER_DESC 			= "提升持续时间与作用范围. 并提升充能速度."
		//
		REDTAPE_NAME 			= "官僚式录音机"
		REDTAPE_DESC 			= "瞬间摧毁建筑, 但一次只能瘫痪一台机器人."
		///
		KNIFE_NAME 				= "刀子"
		KNIFE_DESC 				= "手持时, 免疫所有伤害但会持续流失生命值. 击杀敌人会恢复生命值."
		//
		YOURETERNALREWARD_NAME 	= "永生的回报"
		YOURETERNALREWARD_DESC 	= "生命值越低此武器伤害越高并在生命值低于 10% 时必定暴击, 只能攻击敌人的正前方. 获得 90% 全伤害抗性."
		//
		KUNAI_NAME 				= "密谋者的苦无"
		KUNAI_DESC 				= "极大幅度提升近战距离. 背刺会造成爆炸, 伤害附近的敌人."
		//
		BIGEARNER_NAME 			= "暴利杀手"
		BIGEARNER_DESC 			= "大幅提升生命上限且在挥空后持续恢复生命值. 会受到友方火力的伤害."
		//
		WANGAPRICK_NAME 		= "巫毒刺钉"
		WANGAPRICK_DESC 		= "击杀敌人会使你立刻隐形. 可以在隐身时攻击. 无法伪装."
		//
		SHARPDRESSER_NAME 		= "袖藏剑"
		SHARPDRESSER_DESC 		= "背刺会造成爆炸, 伤害附近的敌人."
		//
		SPYCICLE_NAME 			= "神奇的冰锥"
		SPYCICLE_DESC 			= "挥空后会向上推动自己, 无法伪装. 大幅增加对巨型机器人的背刺伤害."
		///
		INVISWATCH_NAME 		= "隐形手表"
		INVISWATCH_DESC 		= "隐身时间无限, +10% 移动速度."
		//
		DEADRINGER_NAME 		= "死亡之铃"
		DEADRINGER_DESC 		= "免疫摔落伤害, +20%伤害抗性, +100%隐身恢复速度."
		//
		CLOAKANDDAGGER_NAME		= "隐形刺客"
		CLOAKANDDAGGER_DESC		= "能够立刻进入隐形与解除隐形."
		//----------------------------
		//----------------------------
		//----------------------------
		FRYINGPAN_NAME 				= "平底煎锅"
		FRYINGPAN_DESC 				= "对与你同职业的敌人造成 30 倍伤害并在击杀时获得一段时间的暴击."
		//
		SAXXY_NAME 					= "萨氏金像奖小金人"
		SAXXY_DESC 					= "对与你同职业的敌人造成 30 倍伤害并在击杀时获得一段时间的暴击."
		//
		MEMORYMAKER_NAME 			= "回忆制造者"
		MEMORYMAKER_DESC			= "对与你同职业的敌人造成 30 倍伤害并在击杀时获得一段时间的暴击."
		//
		CONOBJECTOR_NAME			= "和平示威牌"
		CONOBJECTOR_DESC			= "每 10 次击杀会为你生成随机的魔法书(需要装备法术书)."
		//
		FREEDOMSTAFF_NAME 			= "自由权杖"
		FREEDOMSTAFF_DESC 			= "受到攻击时有小概率闪避该攻击并获得 3 秒的无敌."
		//
		BATOUTTAHELL_NAME 			= "恐怖骸骨"
		BATOUTTAHELL_DESC 			= "手持时, 免疫所有来源的伤害并逐渐获得超量生命值, 但大幅提升受到的击退效果."
		//
		HAMSHANK_NAME 				= "美味火腿"
		HAMSHANK_DESC 				= "特殊能力: '生机勃发' -  当可用时, 按下动作键获得 10 倍的超量生命值并在 20 秒内免疫击退."
		//
		NECROSMASHER_NAME 			= "大力碎尸锤"
		NECROSMASHER_DESC 			= "特殊能力: '车载屠宰场' -  当可用时, 按下动作键可以驾驶碰碰车. 在使用碰碰车时免疫所有伤害, 持续恢复生命值并可以碾压敌人."
		//
		CROSSINGGAURD_NAME 			= "铁轨管制员"
		CROSSINGGAURD_DESC 			= "大幅提升近战伤害抗性, 包括背刺."
		//
		PRINNYMACHETE_NAME 			= "普利尼砍刀"
		PRINNYMACHETE_DESC 			= "功能物品 - 挥舞时会向前高速推动自己. 免疫摔落伤害."
		//------------------------------------
	}
	swedish = {
		IH_TRANSLATE_ITEM		= IH_color + "[%s]" + IH_text_color + "%s"
		IH_INCLUDES				= IH_color_header + "[►]\x0826beffBB Din utrustning inkluderar..."
		IH_DIS_MSG_2			= IH_disable_color + "Skriv '/itemhelp 1' för att avaktivera dessa meddelanden under en våg. \nSkriv '/itemhelp 0' för att avaktivera dessa meddelanden helt."
		IH_DIS_MSG				= IH_disable_color + "Skriv '/itemhelp 0' för att avaktivera dessa meddelanden. \nSkriv '/itemhelp 2' för att Alltid visa detta meddelande."
		IH_BAD_ARGS				= IH_color_header + "[Föremålshjälpare]" + IH_error_color + " {Fel}\x01 Fel argument!\n/itemhelp 2 - Aktivera\n/föremålshjälp 1 - Sätt på under Våg Förberedelse endast\n/itemhelp 0 - Avaktivera"
		IH_OOB_ARG				= IH_color_header + "[Föremålshjälpare]" + IH_error_color + " {Fel}\x01 Värde Utanför Gränsen Inställd! : %s"
		IH_HELP_MSG				= IH_color_header + "[Föremålshjälpare]\x01 Föremålshjälpare ger en enkel beskrivning för vajre \x03Chaos\x01 Föremål!" 
		IH_DISABLE				= IH_color_header + "[►]\x01 Föremålshjälpare avaktiverad."
		IH_WAVE_SETUP			= IH_color_header + "[►]\x01 Föremålshjälpare aktiverad på Våg Förberedelse endast."
		IH_ENABLE 				= IH_color_header + "[►]\x01 Föremålshjälpare aktiverad."
		LOW_METAL 				= "Inte tillräckligt med Metall"
		TOMISLAV_HEAT			= "Tomislav Värme: %s%%"
		STUCK_RESPAWNED 		= "Du återskapades till för undvika att fastna."
		ABILITY_READY			= "%s\n► Redo ◄"
		ABILITY_CHARGING		= "%s\n%s"
		ABILITY_CHARGING_MSG	= "Laddar: %ss"
		ABILITY_CHARGING_D_MSG	= "Laddar: %s%%"
		MEGACRUSH 				= "MEGA-KROSS"
		VITALRESURGENCE 		= "LIVSGÖRANDE ÅTERUPPSTÅENDE"
		VEHICULARMANNSLAUGHTER 	= "FORDRON MANNSSLAKT"
		TEST 					= "Test Ability"
		NO_MONEY				= "You can't afford this! (Cost: $%s, you have: $%s)" // Dont Translate this, my own project
		REPROG_BOT_STRONG		= TF_TEAM_COLOR_REPROG_B+"%s\x01 motstås för mycket och kan inte omprogrammeras."
		REPROG_BOT_NOT_SUIT		= TF_TEAM_COLOR_REPROG_B+"%s\x01 inte lämplig för strid och kan inte omprogrammeras."
		REPROG_BOT_LEAVE		= TF_TEAM_COLOR_SPEC+"%s dog."
		REPROG_BOT_MESSAGE 		= TF_TEAM_COLOR_RED+"%s\x01 har omprogrammerats "+TF_TEAM_COLOR_REPROG_B+"%s\x01!"
		//---------------------------------------------------------
		CHECKPOINT_CREATED		= "\x077c8cc2Checkpoint created:\x078165cf [/%s]"
		CHECKPOINT_WRONG_MAP	= CHECKPOINT_ERROR+"Den punkten var inte inställd för denna karta."
		CHECKPOINT_WRONG_MISS	= CHECKPOINT_ERROR+"Den punkten var inte inställd för detta uppdrag."
		CHECKPOINT_EXPIRE		= CHECKPOINT_ERROR+"Den punkten har tagit slut."
		CHECKPOINT_RESTORE		= "\x0744CC44Restored till senaste sparade punkt."
		CHECKPOINT_RESTORE_HUD	= "Återställde till senaste sparade punkt."
		//---------------------------------------------------------
		SCATTERGUN_NAME 		= "HAGELBÖSSA"
		SCATTERGUN_DESC 		= " Standard val för pålitig skada. Väldigt effekter på nära håll."
		//
		FORCENATURE_NAME		= "NATURKRAFT"
		FORCENATURE_DESC		= " Förbättrad knuff vid träff. Lite mindre Skada Per Sekund än Hagelbösan."
		//
		SHORTSTOP_NAME 			= "SHORTSTOP"
		SHORTSTOP_DESC 			= " Sjuk eldgivningshastighet och garanderade kritiska träffar på blöta fiender, men en långsam omladdning."
		//
		SODAPOPPER_NAME 		= "LÄSKPOPPAREN"
		SODAPOPPER_DESC 		= " Håll ner eldgivning till att alla en snabb 4-skotts utbrott."
		//
		BABYFACEBLASTER_NAME	= "BARNANSIKTETS BLÄSTARE"
		BABYFACEBLASTER_DESC	= " Håll ner eldgivning till att ladda ett massivt utbrott av upp till 200 skott, som dödar alla vid nära håll. Har väldigt hög rekyl dock."
		//
		BACKSCATTER_NAME		= "RYGGSPLITAREN"
		BACKSCATTER_DESC		= " Fulla kritiska träffar vid ryggskott. Kräver ingen ammunition och har ett oändligt magasin."
		///
		PISTOL_NAME 			= "PISTOL"
		PISTOL_DESC 			= " Avfyrar raketer istället för kulor. Väldigt effekter för rörelse."
		//
		BONK_NAME 				= "BONK! ATOMIC PUNCH"
		BONK_DESC 				= " Superladdad dricka, ger osårbarhet som inte tar bort din förmåga att attackera."
		//
		CRITACOLA_NAME 			= "CRIT-A-COLA"
		CRITACOLA_DESC 			= " Superladdad dricka, ger fulla kritiska träffar."
		//
		MADMILK_NAME 			= "MANISK MJÖLK"
		MADMILK_DESC 			= " Fiender täckta i mjölk kan inte röra på sig."
		//
		WINGER_NAME 			= "YTTERN"
		WINGER_DESC 			= " Oändligt med lufthopp medans den är aktiv. Avfyrar ett enda fokuserat skott som alltid utdelar ett kritiskt skott medans du är i luften. Detta skott puttar fiender bort."
		//
		PRETTYBOYS_NAME 		= "SNYGGINGENS PANGPISTOL"
		PRETTYBOYS_DESC 		= " Avfyrar raketer som utdelar skada baserat på offrets hälsa. Skada ökas medans målet blir skadad och inte påverkad av avstånd. Alternativattack: Använd Spårande raketer med kostnaden av -20% skada."
		//
		CLEAVER_NAME 			= "FLYGANDE GILIJOTINEN"
		CLEAVER_DESC 			= " Yondus Pil: Skapar en medveten pil som assisterar i strid. Alternativattack: Störningsläge, -75% skada."
		//
		MATATEDMILK_NAME 		= "MUTERAD MJÖLK"
		MATATEDMILK_DESC 		= " Konstrakt avfyrande explosiva mjölkburkar, som utdelar skada mot fiender. Alternativattack: Kasta en kluster av mjölkburkar på samma gång."
		///
		BAT_NAME 				= "SLAGTRÄ"
		BAT_DESC 				= " Chans att ignorera döden och teleportera till återskapning med 1 hälsa."
		//
		SANDMAN_NAME			= "JOHN BLUND"
		SANDMAN_DESC 			= " Kan avfyra basebollar snabbt med hög kompetens och snabb omladdning, som utdelar ett stort utbrott skada till ett enda mål."
		//
		HOLYMACKEREL_NAME		= "FINA FISKEN"
		HOLYMACKEREL_DESC		= " Kan markera flera fiender för döden."
		//
		CANDYCANE_NAME 			= "POLKAGRISEN"
		CANDYCANE_DESC 			= " Utilitetsföremål - Du har ingen gravitation och kan flyga fritt."
		//
		BOSTONBASHSER_NAME 		= "BOSTANBANKAREN"
		BOSTONBASHSER_DESC 		= " Hög risk / Hög belöning. Kan omedelbart döda de flesta små fiender, som ger en 10 sekunders kritisk laddning. Fiender kopplade via häslovapen ståle kan också träffas. Dock alla missar är en omedelbar död."
		//
		SUNONASTICK_NAME		= "SOLSTICKAN"
		SUNONASTICK_DESC		= " Chans att bedöva fiender eller få en kort kritisk laddning. Träffar alla fiender kopplade via hälsovapen strålar. Dock alla missar kommer bedöva dig själv."
		//
		FANOWAR_NAME 			= "KRIGSFJÄRDERN"
		FANOWAR_DESC 			= " Utilitetsföremål - Svinga detta närstridsvapen till att kasta dig själv frampt med hög hastighet. Get immunitet mot fallskada."
		//
		ATOMIZER_NAME 			= "ATOMISERAREN"
		ATOMIZER_DESC 			= " Kan inte utdela skada med normala attacker, men ett lyckat dödshån kommer ge en kritisk laddnings om varar i 3 minuter."
		//
		THREERUNEBLADE_NAME 	= "TRERUNS-SVÄRD"
		THREERUNEBLADE_DESC 	= " Medans den är aktiv, gå en MASSIV ökning till rörelsehastighet och förmågan att trippelhoppa. Get immunitet mot fallskada."
		//
		UNARMEDCOMBAT_NAME 		= "OBEVÄPNAD STRID"
		UNARMEDCOMBAT_DESC 		= " Varje 10 döende träffar, få en Skelett hejduk förtrollningsladdning (Kräver Trolleribok)."
		//
		WRAPAASSASSIN_NAME 		= "OMSLAGSMÖRDAREN"
		WRAPAASSASSIN_DESC 		= " Kan attackera inkommande projektiler, reflekterar de lätt. Ger också immunitet mot bedövning."
		//----------------------------
		//----------------------------
		//----------------------------
		ROCKETLAUNCHER_NAME		= "RAKETGEVÄR"
		ROCKETLAUNCHER_DESC		= " Standardval för pålitig skada."
		//
		DIRECTHIT_NAME			= "DIREKTA TRÄFFEN"
		DIRECTHIT_DESC			= " Alternativattack: Avfyra en liten fiende i luften för en enkel mini-kritisk träff efteråt. Raketer har en liten mängd sikteshjälp."
		//
		BLACKBOX_NAME			= "SVARTA LÅDAN"
		BLACKBOX_DESC			= " Sakta ner fiender och utdela blöd. Detta vapen utdelar x2 skada mot Soldatbotar."
		//
		ROCKETJUMPER_NAME		= "RAKETHOPPAREN"
		ROCKETJUMPER_DESC		= " Långsam eldgivning och omladdningshastighet, men hög skada och stor explosionsradie. Utmärkt val för gruppkontroll."
		//
		LIBERTYLAUNCHER_NAME	= "FRIHETSGEVÄRET"
		LIBERTYLAUNCHER_DESC	= " Avfyrar en långsam-rörlig raket som utdelar massiv skada i ett stort område. Väldig långsam omladdning och låg ammunition. Detta vapen avfyras automatiskt när den är laddad."
		//
		COWMANGLER_NAME			= "KOMANGLAREN 5000"
		COWMANGLER_DESC			= " Immobiliserar små fiender vid träff. Laddade skott stopper fiender längre. Håll ner Alternativattack för att superladda vapnet för ett multiskott, som stoppar de mycket längre."
		//
		ORIGINAL_NAME			= "ORIGINALET"
		ORIGINAL_DESC			= " Håll ner eldgivning till att ladda ett uttrbottsskott med upp till 4 raketer. Detta vapen avfyras automatiskt när den är laddad."
		//
		BEGGARSBAZOOKA_NAME		= "RUINERADES RAKETGEVÄR"
		BEGGARSBAZOOKA_DESC		= " Håll ner eldgivning för att ladda upp till 100 raketer innan man släpper du i ett massivt utbrott. Detta vapen laddas INTE över."
		//
		AIRSTRIKE_NAME			= "LUFTANGREPPET"
		AIRSTRIKE_DESC			= " Ladda upp till 10 raketer innan man avfyrar alla på en gång i ett fixerat spridmönster. Dessa raketer går efter fiender automatiskt."
		///
		SHOTGUN_SOLD_NAME 		= "HAGELGEVÄR - SOLDAT" 
		SHOTGUN_SOLD_DESC 		= " Very fast fire rate and crits while rocket jumping." 
		//
		SHOTGUN_NAME 			= "HAGELGEVÄR" 
		SHOTGUN_DESC 			= " Standardval för pålitig skada." 
		//
		BUFFBANNER_NAME 		= "BUFFBANERET" 
		BUFFBANNER_DESC 		= " Oändligt avstånd och har mycket ökad varaktighet." 
		//
		GUNBOATS_NAME 			= "KANONBÅTARNA" 
		GUNBOATS_DESC 			= " Aktiverar kaninhopp genom att hålla ner 'hopp' tangenten. Ger immunitet mot fallskada." 
		//
		BATTALIONS_NAME 		= "BATALJONENS FÖRSTÄRKNING" 
		BATTALIONS_DESC 		= " Oändligt avstånd och har mycket ökad varaktighet." 
		//
		CONCHEROR_NAME 			= "TRUMPETSNÄCKA" 
		CONCHEROR_DESC 			= " Oändligt avstånd och har mycket ökad varaktighet." 
		//
		RESERVESHOOTER_NAME 	= "RESERVSKJUTAREN" 
		RESERVESHOOTER_DESC 	= " Utdelar en stadig 10,000 skada per skott oavsett avståndet med 3s mini-kritiska träffar vid döende träff. Dock detta vapen kan inte laddas med kritiska träffar, och kan inte skada Pansarvagnar. Håll ner Alternativattack för att zooma in." 
		//
		BISON_NAME 				= "RÄTTSKAFFENS BISONOXE" 
		BISON_DESC 				= " Avfyrar en konstant stråle av penetrerande skada med fulla auto-träffsäkning." 
		//
		MANTREADS_NAME 			= "MANSTÖVLARNA" 
		MANTREADS_DESC 			= " Stor minskning i knuff tagen från skada. Luftrörelser har nu en massivt ökad acceleration. Stampskada förstärkt och velocitet-baserad." 
		//
		BASEJUMPER_NAME 		= "B.A.S.E-HOPPAREN" 
		BASEJUMPER_DESC 		= " Kan växla fallskärmen. Ökad motstånd mot knuff och skada mot kulor, som minskar din sårbarhet i luften." 
		//
		PANICATTACK_NAME 		= "PANIKATTACKEN" 
		PANICATTACK_DESC 		= " För när du behöver helande i nöden. Omedelbart återställer upp till 10,000 hälsa vid träff. Att ta skada med detta vapen aktiv har en chans att sätta på en kort själv-uber." 
		///
		SHOVEL_NAME 			= "SKYFFEL"
		SHOVEL_DESC 			= " Standardval för försvar och rörelse."
		//
		EQUALIZER_NAME 			= "UTJÄMNAREN"
		EQUALIZER_DESC 			= " Hånattacker utdelar massiv skada och knuffar fiender upp i luften."
		//
		PAINTRAIN_NAME 			= "PLÅGTÅGET"
		PAINTRAIN_DESC 			= " Utdelar blöd och saktar ner vid träff. Ger immunitet mot fallskada."
		//
		HALFZATOICHI_NAME 		= "HALF-ZATOICHI"
		HALFZATOICHI_DESC 		= " Vanlig skada med en hög hälsomobilitet, och ökad räckvidd."
		//
		MARKETGARDENER_NAME 	= "TRÄGÅRDSMÄSTAREN"
		MARKETGARDENER_DESC 	= " Utdelar massivt ökad kritisk skada. Efter man får en döende träff, ge dig in i ett argt tillstånd och få extra hälsa, motstånd och ökad skada på alla attacker. Dock alla missar är en omedelbar död."
		//
		DISCIPLINARYACTION_NAME = "DISCIPLINSÅTGÄRDEN"
		DISCIPLINARYACTION_DESC	= " Standardval för försvar och rörelse."
		//
		ESCAPEPLAN_NAME			= "FLYKTPLANEN"
		ESCAPEPLAN_DESC			= " Standardval för försvar och rörelse."
		//----------------------------
		//----------------------------
		//----------------------------
		FLAMETHROWER_NAME 		= "ELDKASTARE"
		FLAMETHROWER_DESC		= " Standardval för pålitig skada. Få en liten mini-kritisk laddning vid döende träff."
		//
		BACKBURNER_NAME 		= "RYGGBRÄNNAREN"
		BACKBURNER_DESC			= " Grön Eld - Markerar fiender för döden och bedövar fiender i luften en kort stund. Detta vpane utdelar x2 skada mot Pyrobotar."
		//
		DEGREASER_NAME 			= "AVFETTAREN"
		DEGREASER_DESC			= " Lång-avstånd eldkastare som utdelar hög direkt skada, med 0 efterbrand. Denna kastare kan inte utföra luftstötar."
		//
		PHLOGISTINATOR_NAME 	= "FLOGISTONERAREN"
		PHLOGISTINATOR_DESC		= " Grön Eld - Markerar fiender för döden och bedövar fiender i luften en kort stund. Stark mot Pansarvagnar, men din rörelsehastighet är minskad."
		//
		RAINBLOWER_NAME 		= "RAINBLOWER"
		RAINBLOWER_DESC			= " Lång-avstånd eldkastare som utdelar låg direkt skada, men med hög efterbrand skada. Kan också omedelbart förstöra Ingenjörbyggnader och bränna fiende Pyros. Luftstöten är svag, men väldigt snabb."
		//
		DRAGONSFURY_NAME 		= "DRAKENS RASERI"
		DRAGONSFURY_DESC		= " Mycket ökad eldgivningshastighet och luftstöthastighet."
		//
		NOSTROMONAPALMER_NAME 	= "NOSTROMO-ELDKASTAREN"
		NOSTROMONAPALMER_DESC	= " Saktar ner fiender vid träff. Bygger 'Mmmph' laddning likt Flogistoneraren, men ger dig Trumpetsnäckans förstärkning. Denna eldkastare kan inte utföra luftstötar."
		///
		SHOTGUN_PYRO_NAME 		= "HAGELGEVÄR - PYRO" 
		SHOTGUN_PYRO_DESC 		= " Garanterade kritiska träffar mot brinnande fiender." 
		//
		FLAREGUN_NAME 			= "SIGNALPISTOL" 
		FLAREGUN_DESC 			= " Avfyrar en träffskann attack som penetrerar fiender. Skada ökas exponentiellt med varje penetrerad fiende längst vägen. Har också en chans att bedöva fiender vid träff." 
		//
		DETONATOR_NAME 			= "DETONATORN" 
		DETONATOR_DESC 			= " Blosset har en oändlig explosionsradie och kommer träffa allt inom siktlinje. Tvingar alla Spionbotar att avslöja sig och sluta förklä sig. Också ett bra val för rörelse." 
		//
		MANMELTER_NAME 			= "MÄNNISKOSMÄLTAREN" 
		MANMELTER_DESC 			= " Snabbt-avfyrande specialiserad till att automatiskt följa fiender. Oändligt ammunition och ingen omladdning. Alternativattack: Avfyra ett utbrott av bloss på en gång." 
		//
		SCORCHSHOT_NAME 		= "SVEDSKOTTET" 
		SCORCHSHOT_DESC 		= " Vid träff: Utdela en stor mängd skada, som släcker fienden och utdelar knuff. Ditt mål MUSTA vara på eld, eller denna attack kommer inte göra något. Alternativattack: Använd långsamma följande bloss." 
		//
		THERMALTHRUSTER_NAME 	= "HÖGTRYCKET" 
		THERMALTHRUSTER_DESC 	= " Minskade bränsle användning utan någon fördröjning. Kan återanvändas i luften och utdelar massiv stampskada. Gå en kort kritisk laddning vid träff." 
		//
		GASPASSER_NAME 			= "BENSINDUNKEN" 
		GASPASSER_DESC 			= " Gasmätaren börjar tom och återställs när man dör. Utdela 150,000 skada till att fylla mätaren. Exploderar-vid-Antändning utdelar 105,000 skada." 
		///
		FIREAXE_NAME 			= "BRANDYXA"
		FIREAXE_DESC 			= " Standardval för försvar och rörelse."
		//	
		AXTINGUISHER_NAME 		= "BRANDSLAKTAREN"
		AXTINGUISHER_DESC		= " Mycket ökad skada mot fiender som brinner."
		//
		HOMEWRECKER_NAME 		= "HEMRIVAREN"
		HOMEWRECKER_DESC 		= " Kan omedelbart förstöra Ingenjörbyggnader överallt med oändligt närstridsavstånd."
		//
		POWERJACK_NAME 			= "ELDOMKRAFTEN"
		POWERJACK_DESC 			= " Snabba attacker och rörelsehastighet. Utdelar blöd & tänder fiender vid träff och ger en mini-kritisk laddning vid döende träff."
		//
		BACKSCRATCHER_NAME 		= "RYGGKLIAREN"
		BACKSCRATCHER_DESC 		= " Utdelar dödlig skada bakifrån. Efter man får en döende träff, ge dig in ett argt tillstånd och få extra rörelsehastighet, motstånd och ökad skada på alla attacker."
		//
		VOLCANOFRAGMENT_NAME 	= "VÄSSAD VULKANBIT"
		VOLCANOFRAGMENT_DESC 	= " Chans till att bedöva fiender vid träff. Kan också bränna fiende Pyros"
		//
		POSTALPUMMELER_NAME 	= "POSTPUCKLAREN"
		POSTALPUMMELER_DESC 	= " Vid träff: Utdela Förvirrning, orsakr fiender att gå baklänges längst bombvägen en kort stånd. Håll ner Alternativattack när man attackerar för att teleportera tillbaks till återskapningsrummet."
		//
		MAUL_NAME 				= "SLÄGGAN"
		MAUL_DESC 				= " Vid träff: Kasta fiender upp i luften med minskad gravitation."
		//
		THIRDDEGREE_NAME 		= "TREDJA GRADEN"
		THIRDDEGREE_DESC 		= " Bli nästan immun mot eldskada medans den är utrustad, och få ett extra tungt motstånd mot alla attacker från långt håll medans den är aktiv."
		//
		LOLLICHOP_NAME 			= "SLICKEPINAN"
		LOLLICHOP_DESC 			= " Varje 10 döende träffar, få en Meteor Stormförtrollning laddning (Kräver Trolleribok)."
		//
		NEONANNIHILATOR_NAME 	= "NEONFÖRINTAREN"
		NEONANNIHILATOR_DESC 	= " Din gravitation är minskad."
		//
		HOTHAND_NAME 			= "ÖRFILEN"
		HOTHAND_DESC 			= " Kasta fiender upp i luften vid träff."
		//----------------------------
		//----------------------------
		//----------------------------
		GRENADELAUNCHER_NAME 	= "GRANATKASTARE"
		GRENADELAUNCHER_DESC	= " Standardval för pålitig skada."
		//
		LOCHNLOAD_NAME 			= "LOCH-N-LOAD"
		LOCHNLOAD_DESC			= " Långsamma skott men med hög snabbt skada i ett stort område. Effektivt för gruppkontroll."
		//
		ALIBABA_NAME			= "ALI BABAS LILLA STÖVLAR"
		ALIBABA_DESC			= " Förbättad sköldkollision skada. Ger immunitet mot fallskada."
		//
		BOOTLEGGER_NAME			= "SPRITSMUGGLAREN"
		BOOTLEGGER_DESC			= " Förbättrad sköldomladdnings hastighet. Ger immunitet mot fallskada."
		//
		LOOSECANNON_NAME		= "LADDAD KANON"
		LOOSECANNON_DESC		= " Ladda upp till 4 kanonbollar innan man avfyrar alla på en gång i ett verktikalt spridmönster. Kanonbollar exploderar vid kontakt med marken."
		//
		IRONBOMBER_NAME			= "JÄRNBOMBAREN"
		IRONBOMBER_DESC			= " Ignorerar fienders motstånd och ger en kort kritisk laddning vid döende träff. Kräver ingen ammunition och har ett oändligt magasin. Projektiler kan studsa från väggar."
		///
		STICKYBOMB_NAME 		= "KLISTERBOMBKASTARE"
		STICKYBOMB_DESC 		= " Standardval för pålitig skada. Kan lägga ut 50 bomber."
		//
		SCOTTISHRES_NAME 		= "SKOTSKA MOTSTÅNDET"
		SCOTTISHRES_DESC 		= " Bomber tar 5 sekunder till att armera och fräser efter 10 sekunder, men kan utdela överväldlig skada med bra tajming och en full laddning."
		//
		STICKYJUMPER_NAME 		= "KLISTERBOMBSHOPPAREN"
		STICKYJUMPER_DESC 		= " Skaparen ett avstängningsfält, som bedövar alla fiender träffar av pulsen. (Minibossar är immuna till denna bedövning)"
		//
		CHARGINTARGE_NAME 		= "ANFALLSSKÖLDEN"
		CHARGINTARGE_DESC 		= " Tungt Anfall - Utmärkt sköldkollision skada."
		//
		SPLENDIDSCREEN_NAME 	= "STRÅLANDE SKYDDET"
		SPLENDIDSCREEN_DESC 	= " Snabbt Anfall - Utmärkt sköldomladdnings hastighet."
		//
		TIDETURNER_NAME 		= "VINDVÄNDAREN"
		TIDETURNER_DESC 		= " Utbrott Anfall - Utmärkt sköldanfall rörelsehastighet."
		//
		QUICKIEBOMB_NAME 		= "KVICKBOMBSKJUTAREN"
		QUICKIEBOMB_DESC 		= " Auto-avfyrar klisterbomber med en sjuk hastighet med väldigt snabb armeringstid. Få mini-kritiska träffar vid döende träff."
		///
		BOTTLE_NAME 			= "FLASKA"
		BOTTLE_DESC 			= " Standardval för försvar och rörelse."
		//
		EYELANDER_NAME 			= "ÖGLÄNDAREN"
		EYELANDER_DESC 			= " Hög skada med snabba attacker som ger kritiska och mini-kritiska träffar vid döende träff, men kan inte användas som en hybrid-riddare."
		//
		SKULLCUTTER_NAME 		= "SKOTTENS SKALLSKÄRARE"
		SKULLCUTTER_DESC 		= " Kan skära igenom fiendens Uberladdning och störa Hälsovapen funktioner. Kan också utdela ökad skda mot fiender som är samma klass som dig."
		//
		CABER_NAME 				= "ULLAPOOL-CABER"
		CABER_DESC 				= " Skada ökas ju mer skadad du är. Garanterade kritiska träffar om din hälsa är under 2%. Explosionen från denna attack kommer döda dig."
		//
		CLAIDHEAMHMOR_NAME 		= "CLAIDHEAMH MOR"
		CLAIDHEAMHMOR_DESC 		= " Varje 10 döende träffar, få en Monoculus förtrollningsladdning (Kräver Trolleribok)."
		//
		PERSIANPERSUADER_NAME 	= "ÖSTERLÄNDSKA ÖVERTALAREN"
		PERSIANPERSUADER_DESC 	= " När den paras ihop med en sköld, så ger den oändlig sköldanfall. Sklödanfallet kan inte avbrytas med skarpa svängningar eller genom att krocka in i väggar, fiender eller andra hinder. Ger immunitet mot bedövningar."
		//
		NINEIRON_NAME 			= "NESSIES JÄRNNIA"
		NINEIRON_DESC 			= " Har en massiv svingbåge, som kan träffa flera fiender på samma gång i alla riktningar. Utdelar dubbel kritisk skada."
		//
		SCOTTISHHANDSHAKE_NAME 	= "SKOTSKA HANDSLAGET"
		SCOTTISHHANDSHAKE_DESC 	= " Medans den är aktiv: Motstå 90% skada från avstånd, bli immun mot knuff och öka din maxhälsa stort. Dock du kan inte fylla på din ammunition och får mindre hälsa från kit."
		//----------------------------
		//----------------------------
		//----------------------------
		MINIGUN_NAME 			= "MINIGUN"
		MINIGUN_DESC 			= " Standardval för pålitlig skada. Få en kort mini-kritisk laddning vid döende träff."
		//
		NATASCHA_NAME 			= "NATASCHA"
		NATASCHA_DESC 			= " Saka ner fiender vid träff och lägg till Dödsmarkering."
		//
		BRASSBEAST_NAME 		= "MÄSSINGSMONSTRET"
		BRASSBEAST_DESC 		= " Högre skada med varje lånsam uppsnurrning. Rörelsehastighet är borta medans den är igång. Kan avleda inkommande projektiler."
		//
		TOMISLAV_NAME 			= "TOMISLAV"
		TOMISLAV_DESC 			= " Bygger 'Värme' genom att utdela skada. Alla attributer på detta vapen är ökade baserat på värmenivån. Dock, vapnet börjar kylas ner om du inte utdelar skada efter en lång stund."
		//
		HUOHEATER_NAME 			= "ELDDRAKSVÄRMAREN"
		HUOHEATER_DESC 			= " Avfyrar energistrålar, som tänder fiender vid träff"
		//
		GENUINEHUOHEATER_NAME 	= "ÄKTA ELDDRAKSVÄRMAREN"
		GENUINEHUOHEATER_DESC 	= " Avfyrar raketer. Garanterade kritiska träffar mot fiender som brinner."
		///
		SHOTGUN_HVY_NAME 		= "HAGELGEVÄR - TUNG ARTILLERIST"
		SHOTGUN_HVY_DESC 		= " Singlärt skott med hög skada, som ger 8 sekunder av kritiska träffar vid döende träff."
		//
		SANDVICH_NAME 			= "SMÖRGÅSEN"
		SANDVICH_DESC 			= " Återställ upp till 150,000 hälsa. All skada tagen medans man håller detta föremål aktivt är dödligt."
		//
		DALOKOHSBAR_NAME 		= "DALOKOHSKAKAN"
		DALOKOHSBAR_DESC 		= " Återställ upp till 20,000 hälsa. Om den används under 350 hälsa så kommer du få en stor överhälsa. Ökar passivt skadan tagen men ger en chans att sig själv själv-uber när man tar skada."
		//
		BUFFALOSTEAK_NAME 		= "BUFFELBIFFSMÖRGÅS"
		BUFFALOSTEAK_DESC 		= " Passivt ger immunitet mot kritiska träffar."
		//
		FAMILYBUSINESS_NAME 	= "FAMILIJENS ENSAK"
		FAMILYBUSINESS_DESC 	= " Oändlig ammunition. Attackhastigheten är dubblad medans man får en helande effekt. Ger en kort kritisk laddning och mini-kritisk laddning vid döende träff."
		//
		FISHCAKE_NAME 			= "FISKKAKA"
		FISHCAKE_DESC 			= " Tungt motstånd mot KULOR, men mer sårbar mot ELD och EXPLOSIONER."
		//
		SECONDBANANA_NAME 		= "ANDRA BANANEN"
		SECONDBANANA_DESC 		= " Tungt motstånd mot EXPLOSIONER, men mer sårbar mot ELD och KULOR."
		///
		FISTS_NAME 				= "KNYTNÄVAR"
		FISTS_DESC 				= " Standardval för försvar och rörelse. Effektiv i strid."
		//
		KILLINGGLOVES_NAME 		= "KALINIS GRYMMA BOXNINGSHANDSKAR"
		KILLINGGLOVES_DESC 		= " Specialförmåga: 'Mega-Kross' -  När den är tillgänglig, tryck din åtgärdstangent medans du står på bomben för att omedelbart skciak tillbaks den till starten. Annars, få en temporör rörelsehastighet förstärkning, skydd och kritiska träffar."
		//
		GLOVESRUNNING_NAME 		= "GORBATJOVS RUSHANDE UPPERCUT"
		GLOVESRUNNING_DESC 		= " Passivt ger förmågan att ta fram en fallskärm. Medans den är aktiv, få en massiv ökad hopphöjd, skademotstånd och hälsoåterställning."
		//
		BREADBITE_NAME 			= "BRÖDBETTET"
		BREADBITE_DESC 			= " Kritiska träffar infekterar ditt offer med Frätning, en permanent negativ effekt som utdelar skada baserat på max hälsan och orsakar offret att explodera till ett litet frätande moln när den dör, som kan sprida effekten till andra fiender."
		//
		WARRIRORSSPIRIT_NAME 	= "KRIGARENS ANDA"
		WARRIRORSSPIRIT_DESC 	= " Vänsterklicka för att hoppa högt upp i luften. Landar man på fiender så utdelas massiv stampskada. Tar bort all primär och sekundär ammunition."
		//
		FISTSOFSTEEL_NAME 		= "STÅLNÄVARNA"
		FISTSOFSTEEL_DESC 		= " Bli en stor Tung Artillerist järnhandske med 250,000 hälsa. Du är immun mot knuff och kan utdela stor skada. Tar bort all primär och sekundär ammunition. Du kan bära läkas från lunchlådor."
		//
		EVICTIONNOTICE_NAME 	= "VRÄKNINGSBESKEDET"
		EVICTIONNOTICE_DESC 	= " Gå en snabb helande effekt vid döende träff."
		//
		APOCOFISTS_NAME 		= "APOCO-NÄVAR"
		APOCOFISTS_DESC 		= " Slag puttar bort fiender."
		//
		HOLIDAYPUNCH_NAME 		= "JULKLAPPEN"
		HOLIDAYPUNCH_DESC 		= " Medans en är aktiv, alla fiender kommer ignorera dig. Ger också immunitet mot bedövningar. Detta vapen kan dock inte utdela skada."
		//----------------------------
		//----------------------------
		//----------------------------
		SHOTGUN_ENGI_NAME		= "HAGELGEVÄR - INGENGÖR"
		SHOTGUN_ENGI_DESC 		= " Utdelar x4 skada mot ditt Vaktgevärs mål."
		//
		FRONTIERJUSTICE_NAME 	= "VÄSTERNRÄTTVISAN"
		FRONTIERJUSTICE_DESC 	= " Sjuk snabb eldgivningshastighet. Magasinstorlek matchar den kritiska max hämnd mängden. Laddar om snabbare medans man får alla läkande effekter."
		//
		WIDOWMAKER_NAME 		= "ÄNKMAKAREN"
		WIDOWMAKER_DESC 		= " Använd 2000 metall för att avfyra ett brett skott som puttar bort fiender."
		//
		POMSON_NAME 			= "POMSON 6000"
		POMSON_DESC 			= " Utdela blöd, eld och sakta ner fiender."
		//
		RESCUERANGER_NAME 		= "RÄDDAREN I NÖDEN"
		RESCUERANGER_DESC		= " Använder 20 metall per skott, men behöver aldrig laddas om och ökar max metallen med 1000."
		///
		WRANGLER_NAME 			= "GRÄLMAKAREN"
		WRANGLER_DESC 			= " Medans den är aktiv: Öka Vaktgevär skada och dubbla Utmatarräckvidd."
		//
		SHORTCIRCUIT_NAME 		= "KORTSLUTNINGEN"
		SHORTCIRCUIT_DESC 		= " Varje 10 döende träffar, få en Blixtboll förtrollningsladdning (Kräver Trolleribok)"
		///
		WRENCH_NAME 			= "SKIFTNYCKEL"
		WRENCH_DESC 			= " Standardval för pålitig skada."
		//
		GUNSLINGER_NAME 		= "REVOLVERMANNEN"
		GUNSLINGER_DESC	 		= " Kan bygga ett sekundärt Vaktgevär. Trippelslag kombo kan förgöra små fiender och utdela stor skada mot Jättar."
		//
		SOUTHERNHOS_NAME 		= "SÖDERNS GÄSTFRIHET"
		SOUTHERNHOS_DESC 		= " Ersätter det normala Vaktgeväret med ett Eld Vaktgevär. Kort avstånd, men hög skada."
		//
		JAG_NAME 				= "JACKEN"
		JAG_DESC 				= " Ditt Vaktgevär har oändligt med räckvidd."
		//
		EUREKAEFFECT_NAME 		= "AHA-UPPLEVELSEN"
		EUREKAEFFECT_DESC 		= " Medans du bär ditt Vaktgevär, tryck 'Omladdning' tangenten till att avlägset lägga den på en vägg eller ett tak inom räckvidd ey to remotely place it on any wall or ceiling within range."
		//----------------------------
		//----------------------------
		//----------------------------
		SYRINGEGUN_NAME			= "SPRUTGEVÄR"
		SYRINGEGUN_DESC			= " Få 0.5% Uberladdning per träff."
		//
		BLUTSAUGER_NAME			= "BLUTSAUGER"
		BLUTSAUGER_DESC			= " Kräver och använder 100% Uberladdninig till att omprogrammera en robot till att gå med i ditt lag temporärt innan den själv sprängs. Alternativattack: Manuellt avbryta omprogrammeringen på alla påverkade robotar."
		//
		CRUSADERSCROSSBOW_NAME	= "KORSRIDDARENS ARMBOSRT"
		CRUSADERSCROSSBOW_DESC	= " Få 0.25% Uberladdning per träff, utdela blöd och få en till 0.5% Uberladdning per tick av blödskada."
		//
		OVERDOSE_NAME 			= "ÖVERDOSERINGEN"
		OVERDOSE_DESC 			= " Kräver och använder 100% Uberladdning till att skicka en bomb som stänger ner alla nära små fiender för upp till 15s."
		///
		MEDIGUN_NAME			= "HÄLSOVAPEN"
		MEDIGUN_DESC			= " Överhälsa ökad till x10 av patientens max hälsa. Lägg ut en långvarande nivå 1 Projektilsköld."
		//
		KRITZKRIEG_NAME			= "KRITZKRIEG"
		KRITZKRIEG_DESC			= " Kan tömma hälsa från fiender, och ger själv-läkande och bygger Uber."
		//
		QUICKFIX_NAME			= "SNABBFIXAREN"
		QUICKFIX_DESC			= " Väldigt snabbt läkande med nivå 2 Projektilsköld. Kan bygga Uber från sköld kontaktskada."
		//
		VACCINATOR_NAME			= "VACCINATÖREN"
		VACCINATOR_DESC			= " Aktiva läkningar ger dig och patienten 100% motstånd mot grundskadan av den valda typen. Uberladdning ger full immunitet mot den valda skadetypen i 30 sekunder."
		///
		BONESAW_NAME 			= "BENSÅG"
		BONESAW_DESC			= " Standardval för försvar och rörelse. Ger 10% Uber vid träff."
		//
		UBERSAW_NAME 			= "UBERSÅGEN"
		UBERSAW_DESC			= " Utdela blöd vid träff. Få 2% Uber vid träff."
		//
		VITASAW_NAME 			= "VITA-SÅGEN"
		VITASAW_DESC			= " Få en Överhälsa förtrollningsladdning vid träff (Kräver Trolleribok). Få 5% Uber vid träff."
		//
		AMPUTATOR_NAME 			= "AMPUTERAREN"
		AMPUTATOR_DESC			= " Vid träff: Ditt Hälsovapen blir superladdad och får temporärt ökad läkningshastighet, uberhastighet och räckvidd. Dödar man en fiende så får man en starkare version av denna effekt."
		//
		SOLEMNVOW_NAME 			= "HÖGTIDLIGA LÖFTET"
		SOLEMNVOW_DESC			= " Oändligt räckvidd, träffar alla fiender kopplade via Hälsovapen strålar och utdelar x200 skada mot Sjukvårdarbotar. Få 5% Uber för varje fiende träffad."
		//----------------------------
		//----------------------------
		//----------------------------
		SNIPERRIFLE_NAME 		= "KRYPSKYTTEGEVÄR"
		SNIPERRIFLE_DESC 		= " Fullt laddade huvudskott utdelar 450,000 skada."
		//
		MACHINA_NAME 			= "MACHINA"
		MACHINA_DESC 			= " Tar lång tid att ladda, men kan riva Pansarvagnar vid full laddning. Dödar man fiender så laddas en vrede mätare som ger en 1-sekund kritisk laddning. Para ihop den kritiska laddningen med en full laddning för att omedelbart förstöra de flesta Pansarvagnar som du kommer möta."
		//
		HITMANSHEATMAKER_NAME 	= "TORPEDENS TRONGA"
		HITMANSHEATMAKER_DESC 	= " Snabb eldgivning utan att sikta ut. Ingen skada på kroppskott."
		//
		AWPERHAND_NAME 			= "AWPEKAREN"
		AWPERHAND_DESC 			= " Avfyrar explosiva rundor och genererar vrede vid döende träffar. Vid 100% vrede, tryck 'omladdning' till att få ökad max hälsa och hälsoåterställning. Geväret laddar bara när fiender är i ditt sikte."
		//
		HUNTSMAN_NAME 			= "JÄGAREN"
		HUNTSMAN_DESC 			= " Avfyrar 5 pilar på samma gång. Utdelar massiv brandskada om en Pyro tänder din pil."
		//
		SYDNEYSLEEPER_NAME 		= "SYDNEY-SÖVAREN"
		SYDNEYSLEEPER_DESC 		= " Avfyrar en speciell pil som förlamar rörelser av icke-jättar och gör så att finder inte kan få läkande från Sjukvårdarbotar."
		//
		BAZAARBARGAIN_NAME 		= "BASARSFYNDET"
		BAZAARBARGAIN_DESC 		= " Dödar man fiender med samma klass på rad så ökas eldgivningshastigheten, staplas upp till 3. Dödar man en annan klass så återställs kombon."
		//
		FORTIFIEDCOMPOUND_NAME 	= "FÖRSTÄRKTA FÖRENINGEN"
		FORTIFIEDCOMPOUND_DESC 	= " Minskade skadan över Jägaren, men avfyrar snabbare, penetrerar och utdelar kritiska träffar på våta fiender."
		//
		CLASSIC_NAME 			= "KLASSIKERN"
		CLASSIC_DESC 			= " Avfyrar så snabbt som du kan trycka avtryckaren, eller ladda ett enda skott med sjuk explosiv huvudskottskraft som förgör alla icke-jättar robotar i området."
		///
		SMG_NAME 				= "KPIST"
		SMG_DESC 				= " Kan utdela huvudskot för en stor mängd ökad skada. Alternativattack: Zooma in och gå 100% träffsäkerhet med kostnaden av halva eldgivningshastigheten."
		//
		RAZORBACK_NAME 			= "RAZORBACK"
		RAZORBACK_DESC 			= " Väldigt snabbt omladdning och lägger Jarate på din attackerare."
		//
		JARATE_NAME 			= "JARATE"
		JARATE_DESC 			= " Omedelbar omladdning, saktar ner fiender."
		//
		DARWIN_NAME 			= "DARWINS FAROSKÖLD"
		DARWIN_DESC 			= " Nästan immun mot ELD, men tar 50% mer skada från KULOR och EXPLOSIONER."
		//
		COZYCAMPER_NAME 		= "KRYPSKYTTENS KRYPIN"
		COZYCAMPER_DESC 		= " Små ökningar i din rörelsehastighet, max hälsa och hälsoåterställning. Immun mot efterbrand."
		//
		CLEANERSCARBINE_NAME 	= "UNDANRÖJARENS UMGÄNGE"
		CLEANERSCARBINE_DESC 	= " Mini-kritisk laddning varar i 30 sekunder."
		//
		BEAUTYMARK_NAME 		= "SJÄLVMEDVETNA SKÖNHETSFLÄCKEN"
		BEAUTYMARK_DESC 		= " Regna ner helig helveteseld med flammande pilar. Alternativattack: Kasta en kluster av flammande pilar på en gång."
		///
		KUKRI_NAME 				= "KUKRI"
		KUKRI_DESC 				= " Standardval för försvar och rörelse."
		//
		TRIBALMANSSHIV_NAME 	= "STAMHERRENS HANDGJORDA KNIV"
		TRIBALMANSSHIV_DESC 	= " Utilitetsföremål - Du har ingen gravitation och kan flyga fritt."
		//
			WACKA_NAME 			= "BUSHWACKA"
		BUSHWACKA_DESC 			= " Oändligt närstridsräckvidd och aranterade kritiska träffar mot brinnande fiender."
		//
		SHAHANSHAH_NAME 		= "SHAHANSHAHEN"
		SHAHANSHAH_DESC 		= " Vänsterklicka för att skicka dig själv flygandes uppåt, bra för att nå höga ställen. Du är också immun mot fallskada."
		//----------------------------
		//----------------------------
		//----------------------------
		REVOLVER_NAME 			= "REVOLVER"
		REVOLVER_DESC 			= " Vid träff: Utdelar flera negativa effekter, orsakar fiender att ta ökad skada en kort stund, tömmer fiende Sjukvårdarens Uberladdning och tvingar Spionbotar att sluta förklä sig. Kan bedöva fiender som är i luften."
		//
		AMBASSADOR_NAME 		= "AMBASSADÖREN"
		AMBASSADOR_DESC 		= " Utdela stor huvudskott skada. Skadan är dubblad om du inte är förklädd."
		//
		LETRANGER_NAME 			= "FRÄMLINGEN"
		LETRANGER_DESC 			= " Kan förgöra alla icke-jättar i ett enda skott. Noll skada mot Jättar eller Pansarvagnar dock."
		//
		ENFORCER_NAME 			= "VERKSTÄLLAREN"
		ENFORCER_DESC 			= " Ignorerar skademotstånd och lagrar en kritisk träff för varje rygghugg eller byggnad förstörd med en Sapper."
		//
		DIAMONDBACK_NAME 		= "DIAMONDBACK"
		DIAMONDBACK_DESC 		= " Skapar ett svart hål som drar in fiender."
		///
		SAPPER_NAME 			= "SAPPER"
		SAPPER_DESC 			= " Maximal bedövningsradie och varaktighet. Snabb omladdning."
		//
		REDTAPE_NAME 			= "AVVECKLAREN"
		REDTAPE_DESC 			= " Omedelbart förstör Ingenjörens byggnader, man kan vara sappa en fiende åt gången."
		///
		KNIFE_NAME 				= "KNIV"
		KNIFE_DESC 				= " Medans den är aktiv, Kniven tömmer din hälsa men ger immunitet mot ALL skada. Döende träffar återställer hälsa."
		//
		YOURETERNALREWARD_NAME 	= "EVIGHETSBELÖNINGEN"
		YOURETERNALREWARD_DESC 	= " Skadan ökas ju mer skadad du är och utdelar kritiska träffar medans din hälsa är under 10%, men bara för hugg från framsidan. Motstår 90% skada."
		//
		KUNAI_NAME 				= "KONSPIRATÖRENS"
		KUNAI_DESC 				= " Oändlig närstridsräckvidd. Rygghugg orsakar en explosion, som utdelar extra skada mot mål i närheten."
		//
		BIGEARNER_NAME 			= "STÖRA LÖNTAGAREN"
		BIGEARNER_DESC 			= " Du har en massiv mängd hälsa och 'missade' svingar gör att du läks snabbt, dock du tar skada från dina lagkamrater."
		//
		WANGAPRICK_NAME 		= "WANGASTICKET"
		WANGAPRICK_DESC 		= " Dödar man en fiende så gör den att du döljs omedelbart i några sekunder. Du kan attackera fiender medans du är dold och döende träffar i rad kommer hålla dig osynlig. Inga förklädnad."
		//
		SHARPDRESSER_NAME 		= "PRYDLIGA KLINGAN"
		SHARPDRESSER_DESC 		= " Rygghugg orsakar en explosion, som gör extra skada mot fiender i närheten."
		//
		SPYCICLE_NAME 			= "SMYGTAPPEN"
		SPYCICLE_DESC 			= " 'Missade' svingar gör att du hoppar upp i luften för gratis surf-hugg, men du kan inte förklä dig. Utdelar massiv skada mot Jättar på rygghugg."
		///
		INVISWATCH_NAME 		= "OSYNLIGHETSKLOCKAN"
		INVISWATCH_DESC 		= " Oändlig döljning, +10% snabbare rörelsehastighet."
		//
		DEADRINGER_NAME 		= "DÖDSRINGAREN"
		DEADRINGER_DESC 		= " Ger en kort rörelsehastighet när den aktiveras, som tillåter dig att rusa i vilket riktning som helst. Inkommande skada minskad med 80% medans man rusar."
		//
		CLOAKANDDAGGER_NAME		= "STOPPURET"
		CLOAKANDDAGGER_DESC		= " Omedelbar döljning och avslöjning."
		//----------------------------
		//----------------------------
		//----------------------------
		FRYINGPAN_NAME 				= "STEKPANNA"
		FRYINGPAN_DESC 				= " Utdelar x30 skada mot fiender som är samma klass som dig och få kritiska träffar vid en döende träff."
		//
		SAXXY_NAME 					= "SAXXYN"
		SAXXY_DESC 					= " Utdelar x30 skada mot fiender som är samma klass som dig och få kritiska träffar vid en döende träff."
		//
		MEMORYMAKER_NAME 			= "MINNESSSKAPARE"
		MEMORYMAKER_DESC			= " Utdelar x30 skada mot fiender som är samma klass som dig och få kritiska träffar vid en döende träff."
		//
		CONOBJECTOR_NAME			= "VAPENVÄGRAREN"
		CONOBJECTOR_DESC			= " Varje 10 döende träffar, rulla en slumpmässig förtrollning (Kräver Trolleribok)."
		//
		FREEDOMSTAFF_NAME 			= "FRIHETSSTAVEN"
		FREEDOMSTAFF_DESC 			= " Liten chans när man tar skada att man undviker attacken och blir uberladdad i 3s."
		//
		BATOUTTAHELL_NAME 			= "BAT OUTTA HELL"
		BATOUTTAHELL_DESC 			= " Medans den är aktiv, du är osårbar mot all inkommande skada och genererar en massiv överhälsa, men du är helt sårbar mot knuff."
		//
		HAMSHANK_NAME 				= "KNIVIGA KALLSKÄNKAN"
		HAMSHANK_DESC 				= " Specialförmåga: 'Livsgörande Återuppstående' -  När den är tillgänglig, tryck din åtgärdsplats tangent för att omedelbart få 10x överhälsa och bli immun mot knuff i 20 sekunder."
		//
		NECROSMASHER_NAME 			= "KUSLIGA KLUBBAN"
		NECROSMASHER_DESC 			= " Specialförmåga: 'Fordon Mannsslakt' -  När den är tillgänlig, tryck din åtgärdsplats tangent till att gå in i Krockbils läge. Medans du är i Krockbils läge så är du sårbar, återställer hälsa och kan köra över fiender."
		//
		CROSSINGGAURD_NAME 			= "ÖVERGÅNGSVAKTEN"
		CROSSINGGAURD_DESC 			= " Få massiv motstånd mot alla närstridsattacker, inkluderat rygghugg."
		//
		PRINNYMACHETE_NAME 			= "PRINNY-MACHETE"
		PRINNYMACHETE_DESC 			= " Utilitetsföremål - Svinga detta närstridsvapen för att kasta dig själv framåt med hög fart. Ger immunitet mot fallskada."
		//------------------------------------
	}
	russian = {
		IH_TRANSLATE_ITEM		= IH_color + "[%s]" + IH_text_color + "%s"
		IH_INCLUDES				= IH_color_header + "[►]\x0826beffBB Ваше снаряжение включает в себя..."
		IH_DIS_MSG_2			= IH_disable_color + "Введите '/itemhelp 1' чтобы отключить данные сообщения во время волны. \nType '/itemhelp 0' чтобы полностью отключить данные сообщения"
		IH_DIS_MSG				= IH_disable_color + "Введите '/itemhelp 0' чтобы отключить данные сообщения. \nType '/itemhelp 2' чтобы эти сообщения показывались вновь."
		IH_BAD_ARGS				= IH_color_header + "[Item Helper]" + IH_error_color + " {Error}\x01 Incorrect arguments!\n/itemhelp 2 - Enable\n/itemhelp 1 - Enable during Wave Setup only\n/itemhelp 0 - Disable"
		IH_OOB_ARG				= IH_color_header + "[Item Helper]" + IH_error_color + " {Error}\x01 Out Of Bounds Value Set! : %s"
		IH_HELP_MSG				= IH_color_header + "[Item Helper]\x01 Помощник по предметам показывает краткое описание каждого \x03Chaos\x01 предмета!" 
		IH_DISABLE				= IH_color_header + "[►]\x01 Помощник по предметам отключён."
		IH_WAVE_SETUP			= IH_color_header + "[►]\x01 Помощник по предметам включён только во время подготовки."
		IH_ENABLE 				= IH_color_header + "[►]\x01 Помощник по предметам включён."
		LOW_METAL 				= "Недостаточно металла"
		TOMISLAV_HEAT			= "Нагрев Томислава: %s%%"
		STUCK_RESPAWNED 		= "Вы были возрождены, чтобы избежать застревания."
		ABILITY_READY			= "%s\n► Готово ◄"
		ABILITY_CHARGING		= "%s\n%s"
		ABILITY_CHARGING_MSG	= "Заряд: %ss"
		ABILITY_CHARGING_D_MSG	= "Заряд: %s%%"
		MEGACRUSH 				= "МЕГА-РАЗРУШЕНИЕ"
		VITALRESURGENCE 		= "ЖИЗНЕННОЕ ВОЗРОЖДЕНИЕ"
		VEHICULARMANNSLAUGHTER 	= "ТРАНСПОРТНОЕ СРЕДСТВО"
		TEST 					= "Test Ability"
		NO_MONEY				= "You can't afford this! (Cost: $%s, you have: $%s)" // Dont Translate this, my own project
		REPROG_BOT_STRONG		= TF_TEAM_COLOR_REPROG_B+"%s\x01 слишком устойчив и не может быть перепрограммирован."
		REPROG_BOT_NOT_SUIT		= TF_TEAM_COLOR_REPROG_B+"%s\x01 не подходит для боя и не может быть перепрограммирован."
		REPROG_BOT_LEAVE		= TF_TEAM_COLOR_SPEC+"%s уничтожен."
		REPROG_BOT_MESSAGE 		= TF_TEAM_COLOR_RED+"%s\x01 перепрограммировал "+TF_TEAM_COLOR_REPROG_B+"%s\x01!"
		//---------------------------------------------------------
		CHECKPOINT_CREATED		= "\x077c8cc2Контрольная точка была установлена:\x078165cf [/%s]"
		CHECKPOINT_WRONG_MAP	= CHECKPOINT_ERROR+"Эта контрольная точка не была установлена для этой карты."
		CHECKPOINT_WRONG_MISS	= CHECKPOINT_ERROR+"Эта контрольная точка не была установлена для этой миссии."
		CHECKPOINT_EXPIRE		= CHECKPOINT_ERROR+"Срок действия этой контрольной точки истёк."
		CHECKPOINT_RESTORE		= "\x0744CC44Последняя сохранённая контрольная точка была восстановлена."
		CHECKPOINT_RESTORE_HUD	= "Последняя сохранённая контрольная точка была восстановлена."
		//---------------------------------------------------------
		SCATTERGUN_NAME 		= "ОБРЕЗ"
		SCATTERGUN_DESC 		= " Стандартный вариант для надёжного урона. Чрезвычайно эффективен на ближней дистанции."
		//
		FORCENATURE_NAME		= "НЕУМОЛИМАЯ СИЛА"
		FORCENATURE_DESC		= " Усиленное отбрасывание при попадании. Слегка ниже урон в секунду, чем у Обреза."
		//
		SHORTSTOP_NAME 			= "ПРЕРЫВАТЕЛЬ"
		SHORTSTOP_DESC 			= " Бешеная скорострельность и гарантированные криты по мокрым роботам, но медленная перезарядка."
		//
		SODAPOPPER_NAME 		= "ГАЗИРОВЩИК"
		SODAPOPPER_DESC 		= " Удерживайте клавишу атаки, чтобы зарядить быструю очередь из 4 выстрелов."
		//
		BABYFACEBLASTER_NAME	= "ОБРЕЗ МАЛЫША"
		BABYFACEBLASTER_DESC	= " Удерживайте клавишу атаки, чтобы зарядить мощную очередь до 200 выстрелов, уничтожая всё в упор. Имеет очень высокую отдачу."
		//
		BACKSCATTER_NAME		= "СПИНОБРЕЗ"
		BACKSCATTER_DESC		= " Криты за выстрелы в спину. Не требует боеприпасов и имеет бесконечный магазин."
		///
		PISTOL_NAME 			= "ПИСТОЛЕТ"
		PISTOL_DESC 			= " Стреляет ракетами вместо пуль. Чрезвычайно эффективен для мобильности."
		//
		BONK_NAME 				= "БОНК! АТОМНЫЙ ЗАЛП"
		BONK_DESC 				= " Сверхзаряженный напиток, дарующий неуязвимость, которая не мешает вам атаковать."
		//
		CRITACOLA_NAME 			= "КРИТОКОЛА"
		CRITACOLA_DESC 			= " Сверхзаряженный напиток, дающий криты."
		//
		MADMILK_NAME 			= "ЗЛОМОЛОКО"
		MADMILK_DESC 			= " Облитые роботы не могут передвигаться."
		//
		WINGER_NAME 			= "Окрыленный"
		WINGER_DESC 			= " Бесконечные прыжки, когда оружие активно. Стреляет одним сфокусированным выстрелом, который всегда наносит крит и отталкивает роботов, пока вы в воздухе."
		//
		PRETTYBOYS_NAME 		= "ДАМСКИЙ ПИСТОЛЕТ КРАСАВЧИКА"
		PRETTYBOYS_DESC 		= " Выпускает ракеты, урон которых зависит от здоровья цели. Урон увеличивается, когда цель ранена, и не зависит от расстояния. Алтернативная атака: использовать самонаводящиеся ракеты (-20 % урона)."
		//
		CLEAVER_NAME 			= "ЛЕТАЮЩАЯ ГИЛЬОТИНА"
		CLEAVER_DESC 			= " Стрела Йонду: призвать разумную стрелу для помощи в бою. Альтернатиная атака: режим разрушителя, -75 % урона."
		//
		MATATEDMILK_NAME 		= "МУТИРОВАВШЕЕ МОЛОКО"
		MATATEDMILK_DESC 		= " Быстрометательные взрывающиеся банки с молоком, наносящие урон роботам. Альтернативная атака: бросить сразу несколько банок."
		///
		BAT_NAME 				= "BAT"
		BAT_DESC 				= " Шанс игнорировать смерть и телепортироваться к месту возрождения с 1 ОЗ."
		//
		SANDMAN_NAME			= "ДРЁМА"
		SANDMAN_DESC 			= " Позволяет быстро метать большие бейсбольные мячи, нанося значительный взрывной урон по одиночным целям."
		//
		HOLYMACKEREL_NAME		= "ПОДДАЙ ЛЕЩА"
		HOLYMACKEREL_DESC		= " Позволяет нанести метку смерти сразу на несколько роботов."
		//
		CANDYCANE_NAME 			= "КАРАМЕЛЬНАЯ ТРОСТЬ"
		CANDYCANE_DESC 			= " Предмет экипировки — гравитация отсутствует. Позволяет свободно летать."
		//
		BOSTONBASHSER_NAME 		= "БОСТОНСКИЙ РАЗДОЛБАЙ"
		BOSTONBASHSER_DESC 		= " Высокий риск - высокая награда. Позволяет убивать с одного удара большинство мелких роботов, давая 10-секундное усиление критами. Роботы, связанные лучом медика, также получают урон. Однако любой промах — мгновенная смерть."
		//
		SUNONASTICK_NAME		= "СОЛНЦЕ НА ПАЛОЧКЕ"
		SUNONASTICK_DESC		= " Шанс оглушить роботов или получить кратковременное усиление критами. Поражает всех роботов, связанных лучами медика. Однако любой промах оглушит вас самих."
		//
		FANOWAR_NAME 			= "ВЕЕР ВОЙНЫ"
		FANOWAR_DESC 			= " Предмет экипировки — при атаке позволяет стремительно броситься вперёд. Дарует иммунитет к урону от падения."
		//
		ATOMIZER_NAME 			= "РАСЩЕПИТЕЛЬ"
		ATOMIZER_DESC 			= " Не может наносить урон обычными атаками, но успешная насмешка с атакой дарует усиление критами на 3 минуты."
		//
		THREERUNEBLADE_NAME 	= "ТРЕХРУННЫЙ МЕЧ"
		THREERUNEBLADE_DESC 	= " Пока оружие активно, даёт ОГРОМНЫЙ бонус к скорости передвижения и возможность тройного прыжка. Дарует иммунитет к урону от падения."
		//
		UNARMEDCOMBAT_NAME 		= "ГОЛАЯ РУКА"
		UNARMEDCOMBAT_DESC 		= " Каждые 10 убийств дают заклинание призыва скелета (требуется Книга заклинаний)."
		//
		WRAPAASSASSIN_NAME 		= "ОБЁРТОЧНЫЙ УБИЙЦА"
		WRAPAASSASSIN_DESC 		= " Позволяет атаковать летящие снаряды, легко отражая их. Также дарует иммунитет к оглушению."
		//----------------------------
		//----------------------------
		//----------------------------
		ROCKETLAUNCHER_NAME		= "РАКЕТОМЁТ"
		ROCKETLAUNCHER_DESC		= " Стандартный вариант для надёжного урона."
		//
		DIRECTHIT_NAME			= "ПРЯМОЕ ПОПАДАНИЕ"
		DIRECTHIT_DESC			= " Альтернативная атака: подбросьте небольшого робота в воздух для лёгкого добивания мини-критом. Ракеты обладают небольшой помощью в прицеливании."
		//
		BLACKBOX_NAME			= "ЧЁРНЫЙ ЯЩИК"
		BLACKBOX_DESC			= " Замедляет роботов и наносит эффект кровотечения. Наносит удвоенный урон по роботам-солдатам."
		//
		ROCKETJUMPER_NAME		= "ТРЕНИРОВОЧНЫЙ РАКЕТОМЁТ"
		ROCKETJUMPER_DESC		= " Медленная скорость стрельбы и перезарядки, но высокий урон и большой радиус взрыва. Эффективен против толпы."
		//
		LIBERTYLAUNCHER_NAME	= "ОСВОБОДИТЕЛЬ"
		LIBERTYLAUNCHER_DESC	= " Выпускает медленно движущуюся ракету, наносящую огромный урон по большой площади. Очень медленная перезарядка и малый боезапас. Автоматически выпускает ракеты при полной обойме."
		//
		COWMANGLER_NAME			= "ЛИНЧЕВАТЕЛЬ СКОТА 5000"
		COWMANGLER_DESC			= " Обездвиживает мелких роботов при попадании. Заряженный выстрел оглушает роботов дольше обычного. Удерживайте клавишу альтернативной атаки, чтобы перезарядить оружие для многоснарядного выстрела, что приводит к ещё более длительному оглушению."
		//
		ORIGINAL_NAME			= "ПРАРОДИТЕЛЬ"
		ORIGINAL_DESC			= "Удерживайте клавишу атаки, чтобы зарядить очередь до 4 ракет. Стреляет автоматически при полной обойме."
		//
		BEGGARSBAZOOKA_NAME		= "БАЗУКА БРОДЯГИ"
		BEGGARSBAZOOKA_DESC		= " Удерживайте клавишу атаки, чтобы зарядить до 100 ракет, прежде чем выпустить их мощным залпом. Это оружие НЕ подвержено осечке."
		//
		AIRSTRIKE_NAME			= "АВИАУДАР"
		AIRSTRIKE_DESC			= " Зарядите до 10 ракет, прежде чем выпустить их все за раз по точной траектории. Самонаводящиеся ракеты."
		///
		SHOTGUN_SOLD_NAME 		= "ДРОБОВИК - СОЛДАТ" 
		SHOTGUN_SOLD_DESC 		= " Очень высокая скорострельность и криты во время прыжка на ракете." 
		//
		SHOTGUN_NAME 			= "ДРОБОВИК" 
		SHOTGUN_DESC 			= " Стандартный вариант для надёжного урона." 
		//
		BUFFBANNER_NAME 		= "ВДОХНОВЛЯЮЩЕЕ ЗНАМЯ" 
		BUFFBANNER_DESC 		= " Бесконечная дальность и значительно увеличенная продолжительность действия." 
		//
		GUNBOATS_NAME 			= "ШТУРМБОТИНКИ" 
		GUNBOATS_DESC 			= " Позволяют совершать bunnyhop, удерживая клавишу прыжка. Дарует иммунитет к урону от падения." 
		//
		BATTALIONS_NAME 		= "ПОДДЕРЖКА БАТАЛЬОНА" 
		BATTALIONS_DESC 		= " Бесконечная дальность и значительно увеличенная продолжительность действия."
		//
		CONCHEROR_NAME 			= "ЗАВОЕВАТЕЛЬ" 
		CONCHEROR_DESC 			= " Бесконечная дальность и значительно увеличенная продолжительность действия."
		//
		RESERVESHOOTER_NAME 	= "ОФИЦЕР ЗАПАСА" 
		RESERVESHOOTER_DESC 	= " Наносит ровно 10 000 урона за выстрел независимо от дистанции с мини-критами на 3 секунды за убийство. Однако это оружие не может получить усиление критами и не может наносить урон Танкам. Удерживайте клавишу альтернативной атаки, чтобы прицелиться." 
		//
		BISON_NAME 				= "БЛАГОЧЕСТИВЫЙ БИЗОН" 
		BISON_DESC 				= " Выпускает непрерывный луч пронзающего урона с автоприцеливанием." 
		//
		MANTREADS_NAME 			= "ЛЮДОДАВЫ" 
		MANTREADS_DESC 			= " Значительное снижение отбрасывания от получаемого урона. Воздушное маневрирование теперь имеет значительно увеличенное ускорение. Урон от приземления усилен и зависит от скорости." 
		//
		BASEJUMPER_NAME 		= "ПАРАШЮТИСТ" 
		BASEJUMPER_DESC 		= " Позволяет раскрыть парашют. Увеличивает сопротивление к отбрасыванию и имеет сопротивляемость пулям, снижая уязвимость в воздухе." 
		//
		PANICATTACK_NAME 		= "ПАНИЧЕСКАЯ АТАКА" 
		PANICATTACK_DESC 		= " Срочное лечение. Мгновенно восстанавливает до 10 000 здоровья при попадании. Получение урона с оружием в руках имеет шанс вызвать кратковременный убер-заряд." 
		///
		SHOVEL_NAME 			= "ЛОПАТА"
		SHOVEL_DESC 			= " Стандартный вариант для защиты и мобильности."
		//
		EQUALIZER_NAME 			= "УРАВНИТЕЛЬ"
		EQUALIZER_DESC 			= " Насмешка с атакой наносит огромный урон и подбрасывает роботов в воздух."
		//
		PAINTRAIN_NAME 			= "КОСТЫЛЬ"
		PAINTRAIN_DESC 			= " Наносит кровотечение и замедление при попадании. Дарует иммунитет к урону от падения"
		//
		HALFZATOICHI_NAME 		= "ПОЛУДЗАТОИТИ"
		HALFZATOICHI_DESC 		= " Средний урон с высокой мобильностью, здоровьем и увеличенному радиусу атаки."
		//
		MARKETGARDENER_NAME 	= "ЗЕМЛЕКОП"
		MARKETGARDENER_DESC 	= " Наносит значительно увеличенный критический урон. После убийства Вы впадаете в состояние ярости и получаете дополнительные ОЗ, сопротивляемость и увеличенный урон от всех атак. Однако любой промах — мгновенная смерть."
		//
		DISCIPLINARYACTION_NAME = "ДИСЦИПЛИНАРНОЕ ВЗЫСКАНИЕ"
		DISCIPLINARYACTION_DESC	= " Стандартный вариант для защиты и мобильности."
		//
		ESCAPEPLAN_NAME			= "ПЛАН ЭВАКУАЦИИ"
		ESCAPEPLAN_DESC			= " Стандартный вариант для защиты и мобильности."
		//----------------------------
		//----------------------------
		//----------------------------
		FLAMETHROWER_NAME 		= "ОГНЕМЁТ"
		FLAMETHROWER_DESC		= " Стандартный вариант для надёжного урона. Даёт кратковременное усиление мини-критами за убийство."
		//
		BACKBURNER_NAME 		= "ДОЖИГАТЕЛЬ"
		BACKBURNER_DESC			= " Зелёное пламя — помечает роботов меткой смерти и оглушает роботов в воздухе на короткое время. Это оружие наносит удвоенный урон по роботам-поджигателям."
		//
		DEGREASER_NAME 			= "ЧИСТИЛЬЩИК"
		DEGREASER_DESC			= " Дальнобойный огнемёт, наносящий большой прямой урон, но 0 урона от догорания. Не может использовать сжатый воздух."
		//
		PHLOGISTINATOR_NAME 	= "ФЛОГИСТОНАТОР"
		PHLOGISTINATOR_DESC		= " Зелёный огонь — помечает роботов меткой смерти и оглушает роботов в воздухе на короткое время. Силён против Танков, но сниженная скорость передвижения."
		//
		RAINBLOWER_NAME 		= "РАДУЖИГАТЕЛЬ"
		RAINBLOWER_DESC			= " Дальнобойный огнемёт, наносящий маленький прямой урон, но большой от догорания. Также способен мгновенно уничтожать постройки роботов-инженеров и поджигать роботов-поджигателей. Небольшая сила отталкивания при помощи сжатого воздуха, но без задержки."
		//
		DRAGONSFURY_NAME 		= "ЯРОСТЬ ДРАКОНА"
		DRAGONSFURY_DESC		= " Значительно увеличенная скорострельность и частота использования сжатого воздуха."
		//
		NOSTROMONAPALMER_NAME 	= "НОСТРОМСКИЙ ПЛАМЕМЕТ"
		NOSTROMONAPALMER_DESC	= " Замедляет роботов при попадании. Накапливает заряд 'Mmmph', как у Флогистонатора, но даёт бафф Завоевателя. Не может использовать сжатый воздух."
		///
		SHOTGUN_PYRO_NAME 		= "ДРОБОВИК - ПОДЖИГАТЕЛЬ" 
		SHOTGUN_PYRO_DESC 		= " Гарантированные криты по горящим роботам." 
		//
		FLAREGUN_NAME 			= "РАКЕТНИЦА" 
		FLAREGUN_DESC 			= " Выпускает атаку с определением попадания (hitscan), которая пронзает роботов. Урон экспоненциально увеличивается с каждым пронзённых роботов на пути. Есть шанс оглушить роботов при попадании." 
		//
		DETONATOR_NAME 			= "ДЕТОНАТОР" 
		DETONATOR_DESC 			= " Снаряд имеет бесконечный радиус взрыва и поражает всё, что находится в прямой видимости. Заставляет всех роботов-шпионов выйти из невидимости и снять маскировку. Отличный выбор для мобильности." 
		//
		MANMELTER_NAME 			= "ЛЮДОПЛАВ" 
		MANMELTER_DESC 			= " Быстрострельные снаряды с автонаведением. Бесконечный боезапас и отсутствие перезарядки. Альтернативная атака: выпустить сразу несколько снарядов." 
		//
		SCORCHSHOT_NAME 		= "ОБЖИГАЮЩИЙ ВЫСТРЕЛ" 
		SCORCHSHOT_DESC 		= " При попадании: наносит большой урон, тушит робота и отбрасывает его. Ваша цель ОБЯЗАТЕЛЬНО должна гореть, иначе этот снаряд ничего не сделает. Алтернативная атака: использовать медленный самонаводящийся снаряд." 
		//
		THERMALTHRUSTER_NAME 	= "ТЕРМИЧЕСКАЯ ТЯГА" 
		THERMALTHRUSTER_DESC 	= " Уменьшенный расход топлива без задержки. Возможность повторного использования в воздухе и нанесение огромного урона от приземления на роботов. Даёт кратковременное усиление критами за убийство." 
		//
		GASPASSER_NAME 			= "ЗАПАСНОЙ БАК" 
		GASPASSER_DESC 			= " Нанесите 150 000 урона, чтобы заполнить шкалу. Взрыв при поджигании газа наносит 105 000 урона." 
		///
		FIREAXE_NAME 			= "ПОЖАРНЫЙ ТОПОР"
		FIREAXE_DESC 			= " Стандартный вариант для защиты и мобильности."
		//	
		AXTINGUISHER_NAME 		= "Огнетопор"
		AXTINGUISHER_DESC		= " Значительно увеличенный урон по горящим роботам."
		//
		HOMEWRECKER_NAME 		= "КРУШИТЕЛЬ"
		HOMEWRECKER_DESC 		= " Позволяет мгновенно уничтожать постройки роботов-инженеров с бесконечным радиусом атаки."
		//
		POWERJACK_NAME 			= "РАЗЪЕДИНИТЕЛЬ"
		POWERJACK_DESC 			= " Быстрые атаки и скорость передвижения. Наносит кровотечение и поджигает роботов при попадании, даёт мини-криты за убийство."
		//
		BACKSCRATCHER_NAME 		= "СПИНОЧЁС"
		BACKSCRATCHER_DESC 		= " Наносит смертельный урон, атакуя со спины. После убийства Вы впадаете в состояние ярости и получаете дополнительную скорость передвижения, сопротивляемость к урону и увеличенный урон от всех атак."
		//
		VOLCANOFRAGMENT_NAME 	= "ЗАОСТРЕННЫЙ ОСКОЛОК ВУЛКАНА"
		VOLCANOFRAGMENT_DESC 	= "Шанс оглушить роботов при попадании. Поджигает роботов-поджигателей."
		//
		POSTALPUMMELER_NAME 	= "ПОЧТОВЫЙ ДЕБОШИР"
		POSTALPUMMELER_DESC 	= " При попадании: вызывает замешательство, заставляя роботов на короткое время идти задом наперёд. Удерживайте клавишу альтернативной атаки, чтобы телепортироваться обратно в зону возрождения."
		//
		MAUL_NAME 				= "МОЛОТ"
		MAUL_DESC 				= " При попадании: подбрасывает роботов в воздух с пониженной гравитацией."
		//
		THIRDDEGREE_NAME 		= "ТРЕТЬЯ СТЕПЕНЬ"
		THIRDDEGREE_DESC 		= " Вы почти неуязвимы к огню, а также получаете дополнительную высокую сопротивляемость ко всем атакам с дальнего боя, пока оружие находится в руках."
		//
		LOLLICHOP_NAME 			= "КЛЕДЕНЕЦ"
		LOLLICHOP_DESC 			= " Каждые 10 убийств дают заклинание метеоритного дождя (требуется Книга заклинаний)."
		//
		NEONANNIHILATOR_NAME 	= "НЕОНОВЫЙ АННИГИЛЯТОР"
		NEONANNIHILATOR_DESC 	= " Ваша гравитация снижена."
		//
		HOTHAND_NAME 			= "ГОРЯЧАЯ РУКА"
		HOTHAND_DESC 			= " Подбрасывает роботов в воздух при попадании."
		//----------------------------
		//----------------------------
		//----------------------------
		GRENADELAUNCHER_NAME 	= "ГРАНАТОМЁТ"
		GRENADELAUNCHER_DESC	= " Стандартный вариант для надёжного урона."
		//
		LOCHNLOAD_NAME 			= "ПОДКИДЫШ"
		LOCHNLOAD_DESC			= " Медленные выстрелы, но высокий взрывной урон по большой площади. Эффективен против толпы."
		//
		ALIBABA_NAME			= "БОТИНОЧКИ АЛИ-БАБЫ"
		ALIBABA_DESC			= " Повышенная скорость передвижения, высота прыжка и заряд рывка. Даёт дополнительную сопротивляемость к урону, ускоренную перезарядку щита и повышенный урон от удара щитом."
		// TODO: Update! " Enhanced shield bash damage. Grants immunity to fall damage."
		//
		BOOTLEGGER_NAME			= "БУТЛЕГЕР"
		BOOTLEGGER_DESC			= " Повышенная скорость передвижения, высота прыжка и заряд рывка. Даёт огромную сопротивляемость к атакам ближнего боя, но уязвимость к критическим атакам."
		// TODO: Update! " Enhanced shield recharge rate. Grants immunity to fall damage."
		//
		LOOSECANNON_NAME		= "ПУШКА БЕЗ ЛАФЕТА"
		LOOSECANNON_DESC		= " Зарядите до 4 ядер, прежде чем выпустить их все за раз по вертикали. Ядра взрываются при контакте с землёй."
		//
		IRONBOMBER_NAME			= "ЖЕЛЕЗНЫЙ БОМБАРДИР"
		IRONBOMBER_DESC			= " Игнорирует сопротивляемость роботов и даёт кратковременное усиление критами за убийство. Не требует боеприпасов и имеет бесконечный магазин. Снаряды могут отскакивать от стен."
		///
		STICKYBOMB_NAME 		= "ЛИПУЧКОМЁТ"
		STICKYBOMB_DESC 		= " Стандартный вариант для надёжного урона. Позволяет разместить до 50 бомб-липучек."
		//
		SCOTTISHRES_NAME 		= "ШОТЛАНДСКОЕ СОПРОТИВЛЕНИЕ"
		SCOTTISHRES_DESC 		= " Снаряд взводится 5 секунд и затухает через 10 секунд, но при хорошем расчёте времени и полной зарядке может нанести сокрушительный урон."
		//
		STICKYJUMPER_NAME 		= "ТРЕНИРОВОЧНЫЙ ЛИПУЧКОМЁТ"
		STICKYJUMPER_DESC 		= "Создаёт поле отключения роботов задетых импульсом, оглушая их. (Мини-боссы невосприимчивы к оглушению)."
		//
		CHARGINTARGE_NAME 		= "ШТУРМОВОЙ ЩИТ"
		CHARGINTARGE_DESC 		= " Высокая сопротивляемость к урону от взрыва, но повышенная уязвимость к огню и пулям. Также даёт дополнительную сопротивляемость к отбрасыванию и критам."
		// TODO: Update! " Heavy Charge - Superior shield bash damage."
		//
		SPLENDIDSCREEN_NAME 	= "РОСКОШНОЕ ПРИКРЫТИЕ"
		SPLENDIDSCREEN_DESC 	= "Высокая сопротивляемость к урону от огня, но повышенная уязвимость к взрывам и пулям. Также даёт дополнительную сопротивляемость к отбрасыванию и критам."
		// TODO: Update! " Rapid Charge - Superior shield recharge rate."
		// 
		TIDETURNER_NAME 		= "ВЕРНЫЙ ШТУРВАЛ"
		TIDETURNER_DESC 		= " Высокая сопротивляемость к урону от пуль, но повышенная уязвимость к огню и взрывам. Также даёт дополнительную сопротивляемость к отбрасыванию и критам."
		// TODO: Update! " Burst Charge - Superior shield charge move speed."
		//
		QUICKIEBOMB_NAME 		= "БЫСТРОМЁТ"
		QUICKIEBOMB_DESC 		= " Автоматически стреляет липучками с безумной скоростью и очень сокращённым временем подрыва. Даёт мини-криты за убийство."
		///
		BOTTLE_NAME 			= "БУТЫЛКА"
		BOTTLE_DESC 			= " Стандартный вариант для защиты и мобильности."
		//
		EYELANDER_NAME 			= "ОДНОГЛАЗЫЙ ГОРЕЦ"
		EYELANDER_DESC 			= " Высокий урон с ускоренными атаками, получая криты и мини-криты за убийство. Убирает боеприпасы основного и дополнительного оружия."
		//
		SKULLCUTTER_NAME 		= "ШОТЛАНДСКИЙ ГОЛОВОРЕЗ"
		SKULLCUTTER_DESC 		= " Способен пробить вражеский убер-заряд и прервать лечение. Также наносит урон в десятикратном размере по роботам того же класса, что и вы."
		// TODO: Update! " Able to cut through enemy Ubercharge and disrupt Medi-Gun functions. Also able to deal increased damage to enemies of the same class as you."
		//
		CABER_NAME 				= "АЛЛАПУЛЬСКОЕ БРЕВНО"
		CABER_DESC 				= " Урон увеличивается по мере получаемого урона. Гарантированные криты, если ваше здоровье ниже 2 %. Взрыв бревна мгновенно убивает."
		//
		CLAIDHEAMHMOR_NAME 		= "КЛЕЙМОР"
		CLAIDHEAMHMOR_DESC 		= " Каждые 10 убийств дают заклинание призыва ГЛАЗАСТУСА (требуется Книга заклинаний)."
		//
		PERSIANPERSUADER_NAME 	= "ПЕРСИДСКИЙ ЗАКЛИНАТЕЛЬ"
		PERSIANPERSUADER_DESC 	= " В паре со щитом дарует бесконечный заряд рывка. Рывок не прерывается резкими поворотами или столкновениями со стенами, роботами и другими препятствиями. Дарует иммунитет к оглушению."
		//
		NINEIRON_NAME 			= "ЖЕЛЕЗНАЯ ДЕВЯТКА НЕССИ"
		NINEIRON_DESC 			= " Имеет огромную дугу замаха, способную поражать сразу нескольких роботов во всех направлениях. Всегда наносит двойной критический урон."
		//
		SCOTTISHHANDSHAKE_NAME 	= "ШОТЛАНДСКОЕ РУКОБИТИЕ"
		SCOTTISHHANDSHAKE_DESC 	= " Пока активно в руках: сопротивление 90 % урона с дальних дистанций, иммунитет к отбрасыванию и большое увеличение максимального здоровья. Однако вы не можете пополнять боезапас и получаете меньше здоровья от аптечек."
		//----------------------------
		//----------------------------
		//----------------------------
		MINIGUN_NAME 			= "ПУЛЕМЁТ"
		MINIGUN_DESC 			= " Стандартный вариант для надёжного урона. Даёт кратковременное усиление мини-критами за убийство."
		//
		NATASCHA_NAME 			= "НАТАША"
		NATASCHA_DESC 			= " Замедляет роботов при попадании и накладывает метку смерти."
		//
		BRASSBEAST_NAME 		= "ЛАТУННЫЙ МОНСТР"
		BRASSBEAST_DESC 		= " Более высокий урон при очень медленной раскрутке. Скорость передвижения сильно снижена при раскручивании ствола. Способен отражать летящие снаряды.."
		//
		TOMISLAV_NAME 			= "ТОМИСЛАВ"
		TOMISLAV_DESC 			= " Накапливает «Нагрев» за нанесённый урон. Все характеристики оружия увеличиваются в зависимости от уровня нагрева. Однако, если долго не наносить урон, оружие начинает остывать."
		//
		HUOHEATER_NAME 			= "ОГНЕННЫЙ ДРАКОН"
		HUOHEATER_DESC 			= " Выпускает энергетические лучи, поджигающие роботов при попадании."
		//
		GENUINEHUOHEATER_NAME 	= "ОГНЕННЫЙ ДРАКОН ВЫСШЕЙ ПРОБЫ"
		GENUINEHUOHEATER_DESC 	= " Выпускает ракеты. Гарантированные криты по горящим роботам."
		///
		SHOTGUN_HVY_NAME 		= "ДРОБОВИК - ПУЛЕМЁТЧИК"
		SHOTGUN_HVY_DESC 		= " Одиночный выстрел с высоким уроном, дарующий 8 секунд критов за убийство."
		//
		SANDVICH_NAME 			= "БУТЕРБРОД"
		SANDVICH_DESC 			= " Восстанавливает до 150 000 единиц здоровья. Любой урон, полученный с Бутербродом в руках, смертельный."
		//
		DALOKOHSBAR_NAME 		= "ПЛИТКА «ДАЛОКОШ»"
		DALOKOHSBAR_DESC 		= " Восстанавливает до 20 000 единиц здоровья. При использовании с уровнем здоровья ниже 350 даёт сверхлечение. Пассивно увеличивает получаемый урон, но даёт шанс на убер-заряд при получении урона."
		//
		BUFFALOSTEAK_NAME 		= "БУТЕРБРОД ИЗ МЯСА БУЙВОЛА"
		BUFFALOSTEAK_DESC 		= " Пассивно дарует иммунитет к критическим попаданиям."
		//
		FAMILYBUSINESS_NAME 	= "СЕМЕЙНОЕ ДЕЛО"
		FAMILYBUSINESS_DESC 	= " Бесконечный боезапас. Скорострельность удваивается во время получения лечения. Даёт кратковременное усиление критами и мини-критами за убийство."
		//
		FISHCAKE_NAME 			= "РЫБНЫЙ БАТОНЧИК"
		FISHCAKE_DESC 			= " Высокое сопротивление урону от пуль, но повышенная уязвимость к урону от огня и взрывов."
		//
		SECONDBANANA_NAME 		= "УТЕШИТЕЛЬНЫЙ БАНАН"
		SECONDBANANA_DESC 		= " Высокое сопротивление к урону от взрывов, но повышенная уязвимость к урону от огня и пуль."
		///
		FISTS_NAME 				= "КУЛАКИ"
		FISTS_DESC 				= " Стандартный вариант для защиты и мобильности. Эффективны в бою."
		//
		KILLINGGLOVES_NAME 		= "КУЛАКИ ГРОЗНОГО БОКСЁРА"
		KILLINGGLOVES_DESC 		= " Особая способность: «Мега-разрушение» — когда доступна, нажмите клавишу действия, стоя на бомбе, чтобы мгновенно отправить её на базу. Даёт временное усиление скорости, сопротивляемости к урону и от критов."
		//
		GLOVESRUNNING_NAME 		= "ГОРЯЩИЕ РУКАВИЦЫ УСКОРЕНИЯ"
		GLOVESRUNNING_DESC 		= " Пассивно дарует способность раскрывать парашют. Пока активно в руках, сильно увеличивает высоту прыжка, сопротивление урону и регенерацию здоровья."
		//
		BREADBITE_NAME 			= "КУСАЙ-ХЛЕБ"
		BREADBITE_DESC 			= " Критические попадания заражают жертву коррозией - постоянным эффектом, который наносит урон, основываясь на максимальном здоровье. При смерти жертва взрывается, выпуская облако коррозии и распространяя эффект на других роботов."
		//
		WARRIRORSSPIRIT_NAME 	= "ВОИНСКИЙ ДУХ"
		WARRIRORSSPIRIT_DESC 	= " Альтернативная атака подбрасывает вас в воздух. При приземлении на роботов наносит огромный урон. Убирает все боеприпасы для основного и дополнительного оружия."
		//
		FISTSOFSTEEL_NAME 		= "СТАЛЬНЫЕ КУЛАКИ"
		FISTSOFSTEEL_DESC 		= " Превращает вас в гигантского робота-пулемётчика с 250 000 здоровья. Иммунитет к отталкиванию и способность наносить огромный урон. Удаляет все боеприпасы для основного и дополнительного оружия. Лечиться можно только при помощи лакомства."
		//
		EVICTIONNOTICE_NAME 	= "УВЕДОМЛЕНИЕ О ВЫСЕЛЕНИИ"
		EVICTIONNOTICE_DESC 	= " Даёт быстрое исцеление за убийство."
		//
		APOCOFISTS_NAME 		= "КУЛАКОПОКАЛИПСИС"
		APOCOFISTS_DESC 		= " Удары отталкивают роботов."
		//
		HOLIDAYPUNCH_NAME 		= "ПРАЗДНИЧНЫЙ УДАР"
		HOLIDAYPUNCH_DESC 		= " Пока активно в руках, все роботы игнорируют вас. Также дарует иммунитет к оглушению. Однако это оружие не может наносить урон."
		//----------------------------
		//----------------------------
		//----------------------------
		SHOTGUN_ENGI_NAME		= "ДРОБОВИК - ИНЖЕНЕР"
		SHOTGUN_ENGI_DESC 		= " Наносит 4-хкратный урон по цели вашей Турели."
		//
		FRONTIERJUSTICE_NAME 	= "САМОСУД"
		FRONTIERJUSTICE_DESC 	= " Безумно высокая скорострельность. Размер магазина соответствует количеству накопленных критических ударов мести. Перезаряжается быстрее при получении любого лечения."
		//
		WIDOWMAKER_NAME 		= "ОВДОВИТЕЛЬ"
		WIDOWMAKER_DESC 		= " Расходует 2000 единиц металла на горизонтальный широкий выстрел, который отталкивает роботов."
		//
		POMSON_NAME 			= "ПОМСОН 6000"
		POMSON_DESC 			= " Вызывает кровотечение, поджигает и замедляет роботов."
		//
		RESCUERANGER_NAME 		= "СПАСАТЕЛЬ"
		RESCUERANGER_DESC		= "Расходует 20 металла на выстрел, но не требует перезарядки и увеличивает максимальный запас металла на 1000."
		///
		WRANGLER_NAME 			= "ПОВОДЫРЬ"
		WRANGLER_DESC 			= " Пока активен в руках: увеличенный урон Турели и двойная дальность Раздатчика."
		//
		SHORTCIRCUIT_NAME 		= "КОРОТКОЕ ЗАМЫКАНИЕ"
		SHORTCIRCUIT_DESC 		= " Каждые 10 убийств дают заклинание шаровой молнии (требуется Книга заклинаний)."
		///
		WRENCH_NAME 			= "ГАЕЧНЫЙ КЛЮЧ"
		WRENCH_DESC 			= " Стандартный вариант для надёжного урона."
		//
		GUNSLINGER_NAME 		= "ОРУЖЕЙНИК"
		GUNSLINGER_DESC	 		= " Позволяет построить вторую Турель. Серия из трёх ударов может уничтожить мелких роботов и нанести большой урон гигантским роботам."
		//
		SOUTHERNHOS_NAME 		= "ЮЖНОЕ ГОСТЕПРИИМСТВО"
		SOUTHERNHOS_DESC 		= " Заменяет обычную Турель на Огненную Турель. Малая дальность, но высокий урон."
		//
		JAG_NAME 				= "ОСТРОЗУБ"
		JAG_DESC 				= "Ваша Турель имеет бесконечную дальность."
		//
		EUREKAEFFECT_NAME 		= "ОЗАРЕНИЕ"
		EUREKAEFFECT_DESC 		= " Пока вы переносите Турель, нажмите клавишу перезарядки', чтобы установить её дистанционно на любую стену или потолок в пределах досягаемости."
		//----------------------------
		//----------------------------
		//----------------------------
		SYRINGEGUN_NAME			= "ШПРИЦЕМЁТ"
		SYRINGEGUN_DESC			= " Даёт 0,5 % убер-заряда за попадание."
		//
		BLUTSAUGER_NAME			= "КРОВОПИЙЦА"
		BLUTSAUGER_DESC			= " Требует и расходует 100 % убер-заряда, чтобы перепрограммировать робота и заставить его временно перейти на вашу сторону, после чего он самоуничтожится. Альтернативная атака: принудительно завершить перепрограммирование всех затронутых ботов."
		//
		CRUSADERSCROSSBOW_NAME	= "АРБАЛЕТ КРЕСТОНОСЦА"
		CRUSADERSCROSSBOW_DESC	= " Даёт 0,25 % убер-заряда за попадание, наносит кровотечение и ещё 0,5% убер-заряда за каждую секунду урона от кровотечения."
		//
		OVERDOSE_NAME 			= "ПЕРЕДОЗ"
		OVERDOSE_DESC 			= " Требует и расходует 100 % убер-заряда, который отключает всех мелких роботов поблизости на срок до 15 секунд."
		///
		MEDIGUN_NAME			= "ЛЕЧЕБНАЯ ПУШКА"
		MEDIGUN_DESC			= " Максимальный избыточный запас здоровья увеличен до 10-тикратного от максимального здоровья пациента. Разворачивает долгодействующий щит от снарядов 1-го уровня."
		//
		KRITZKRIEG_NAME			= "КРИЦКРИГ"
		KRITZKRIEG_DESC			= " Позволяет высасывать здоровье из роботов, обеспечивая самолечение и накопление убер-заряда."
		//
		QUICKFIX_NAME			= "БЫСТРОПРАВ"
		QUICKFIX_DESC			= " Очень быстрое лечение и щит от снарядов 2-го уровня. Позволяет накапливать убер-заряд за счёт урона от соприкосновения роботов со щитом."
		//
		VACCINATOR_NAME			= "ВАКЦИНАТОР"
		VACCINATOR_DESC			= " Активное лечение дарует вам и пациенту 100 % сопротивляемость базовому урону выбранного типа. Убер-заряд дарует полную невосприимчивость к выбранному типу урона на 30 секунд."
		///
		BONESAW_NAME 			= "ПИЛА"
		BONESAW_DESC			= " Стандартный вариант для защиты и мобильности. Даёт 10 % убер-заряда за попадание."
		//
		UBERSAW_NAME 			= "УБЕР-ПИЛА"
		UBERSAW_DESC			= " Наносит кровотечение при попадании. Даёт 2 % убер-заряда за попадание."
		//
		VITASAW_NAME 			= "ВИТА=ПИЛА"
		VITASAW_DESC			= " Даёт заклинание сверхлечения при попадании (требуется Книга заклинаний). Даёт 5 % убер-заряда за попадание."
		//
		AMPUTATOR_NAME 			= "АМПУТАТОР"
		AMPUTATOR_DESC			= " При попадании: ваша Лечебная пушка перезаряжается и временно получает увеличенную скорость лечения, скорость накопления убер-заряда и дальность лечения. Убийство роботов даёт усиленную версию этого эффекта."
		//
		SOLEMNVOW_NAME 			= "СВЯЩЕННАЯ КЛЯТВА"
		SOLEMNVOW_DESC			= " Бесконечная дальность, поражает всех роботов, связанных лучами Лечебной пушки, и наносит 200-тикратный урон роботам-медикам. Даёт 5 % убер-заряда за каждого поражённого робота."
		//----------------------------
		//----------------------------
		//----------------------------
		SNIPERRIFLE_NAME 		= "СНАЙПЕРСКАЯ ВИНТОВКА"
		SNIPERRIFLE_DESC 		= " Полностью заряженный выстрел в голову наносит 450 000 урона."
		//
		MACHINA_NAME 			= "МАХИНА"
		MACHINA_DESC 			= " Очень медленная зарядка, но на полном заряде может уничтожать Танки. Убийства роботов заполняют шкалу ярости, которая даёт 1-секундное усиление критами. Совместите усиление критов с полным зарядом, чтобы мгновенно уничтожать большинство Танков."
		//
		HITMANSHEATMAKER_NAME 	= "РАЗЖИГАТЕЛЬ РАЗБОЙНИКА"
		HITMANSHEATMAKER_DESC 	= " Быстрая стрельба без выхода из прицеливания. Отсутствие урона при попадании в тело."
		//
		AWPERHAND_NAME 			= "СЛОНОБОЙ"
		AWPERHAND_DESC 			= " Выпускает взрывчатые заряды и накапливает ярость за убийства. При 100 % ярости нажмите клавишу перезарядки, чтобы получить повышенное максимальное здоровье и регенерацию здоровья. Слонобой заряжается когда роботы находятся в вашем прицеле."
		//
		HUNTSMAN_NAME 			= "ОХОТНИК"
		HUNTSMAN_DESC 			= " Выпускает 5 стрел за раз. Наносит огромный урон от огня, если поджигатель подожжёт вашу стрелу."
		//
		SYDNEYSLEEPER_NAME 		= "СИДНЕЙСКИЙ СОНЯ"
		SYDNEYSLEEPER_DESC 		= " Выпускает специальный дротик, который сильно замедляет гигантских роботов и не даёт им получать лечение от роботов-медиков"
		//
		BAZAARBARGAIN_NAME 		= "БАЗАРНАЯ БЕЗДЕЛУШКА"
		BAZAARBARGAIN_DESC 		= " Убийства роботов одного класса подряд увеличивают скорострельность, накапливая эффект до 3 раз. Убийство другого класса сбрасывает эффект."
		//
		FORTIFIEDCOMPOUND_NAME 	= "УКРЕПЛЕННЫЙ СОСТАВНОЙ ЛУК"
		FORTIFIEDCOMPOUND_DESC 	= " Урон ниже, чем у Охотника, но стреляет быстрее, пронзает и наносит криты по мокрым роботам."
		//
		CLASSIC_NAME 			= "КЛАССИКА"
		CLASSIC_DESC 			= " Скорострельность пропорциональна скорости нажатия клавиши атаки. Заряжайте один выстрел с безумной взрывной силой в голову, зажав клавишу атаки, который позволит уничтожить всех роботов (кроме гигантов) в области."
		///
		SMG_NAME 				= "ПИСТОЛЕТ-ПУЛЕМЁТ"
		SMG_DESC 				= " Позволяет стрелять в голову с сильно увеличенным уроном. Альтернативная атака: приближение прицеливания и 100 % точность, но -50 % скорострельности."
		//
		RAZORBACK_NAME 			= "БРОНЕПАНЦИРЬ"
		RAZORBACK_DESC 			= " Очень быстрая перезарядка. Обливает цель Банкате."
		//
		JARATE_NAME 			= "БАНКАТЕ"
		JARATE_DESC 			= " Мгновенная перезарядка, замедляет роботов."
		//
		DARWIN_NAME 			= "ДАРВИНИСТСКИЙ ЩИТ"
		DARWIN_DESC 			= " Почти полная невосприимчивость к огню, но на 50 % больше урона от пуль и взрывов."
		//
		COZYCAMPER_NAME 		= "НАБОР ДЛЯ КЕМПИНГА"
		COZYCAMPER_DESC 		= " Небольшое увеличение скорости передвижения, максимального здоровья и регенерации здоровья. Иммунитет к догоранию."
		//
		CLEANERSCARBINE_NAME 	= "КАРАБИН ЧИСТИЛЬЩИКА"
		CLEANERSCARBINE_DESC 	= " Усиление мини-критами длится 30 секунд."
		//
		BEAUTYMARK_NAME 		= "РОДИНКА С САМОСОЗНАНИЕМ"
		BEAUTYMARK_DESC 		= " Священный адский огонь из пылающих стрел. Альтернативная атака: бросить сразу несколько пылающих стрел."
		///
		KUKRI_NAME 				= "КУКРИ"
		KUKRI_DESC 				= " Стандартный вариант для защиты и мобильности."
		//
		TRIBALMANSSHIV_NAME 	= "ЗАТОЧКА ДИКАРЯ"
		TRIBALMANSSHIV_DESC 	= " Предмет экипировки — у вас отсутствует гравитация. Позволяет свободно летать."
		//
		BUSHWACKA_NAME 			= "КУСТОЛОМ"
		BUSHWACKA_DESC 			= " Бесконечнй радиус ближнего боя и гарантированные криты по горящим роботам."
		//
		SHAHANSHAH_NAME 		= "ШАХАНШАХ"
		SHAHANSHAH_DESC 		= " Альтернативная атака: отправить себя вверх, хорошо для достижения высоких мест. Иммунитет к урону от падения."
		//----------------------------
		//----------------------------
		//----------------------------
		REVOLVER_NAME 			= "REVOLVER"
		REVOLVER_DESC 			= " При попадании: накладывает несколько ослабляющих эффектов, заставляет роботов получать повышенный урон на короткое время, расходует убер-заряд вражеского медика и заставляет роботов-шпионов снять маскировку. Может оглушать роботов, находящихся в воздухе."
		//
		AMBASSADOR_NAME 		= "АМБАССАДОР"
		AMBASSADOR_DESC 		= " Наносит огромный урон при попадании в голову. Урон удваивается, если вы не под маскировкой."
		//
		LETRANGER_NAME 			= "НЕЗНАКОМЕЦ"
		LETRANGER_DESC 			= " Позволяет убить с одного выстрела любого робота, кроме гигантских роботов. Наносит 0 урона гигантским роботам и Танкам."
		//
		ENFORCER_NAME 			= "ПРИНУДИТЕЛЬ"
		ENFORCER_DESC 			= " Игнорирует сопротивляемость урону и гарантирует крит за каждый удар в спину или уничтоженную Жучком постройку робота-инженера."
		//
		DIAMONDBACK_NAME 		= "АЛМАЗНЫЙ ЗМЕЙ"
		DIAMONDBACK_DESC 		= " Создаёт чёрную дыру, затягивающую роботов."
		///
		SAPPER_NAME 			= "ЖУЧОК"
		SAPPER_DESC 			= " Максимальный радиус оглушения и длительность. Быстрая перезарядка."
		//
		REDTAPE_NAME 			= "Откатофон"
		REDTAPE_DESC 			= " Мгновенно уничтожает постройки робота-инженера. Можно использовать только на одного робота за раз."
		///
		KNIFE_NAME 				= "НОЖ"
		KNIFE_DESC 				= " Пока активен в руках, Нож высасывает ваше здоровье, но дарует иммунитет ко ВСЕМУ урону. Убийства восстанавливают здоровье."
		//
		YOURETERNALREWARD_NAME 	= "ВЕЧНЫЙ ПОКОЙ"
		YOURETERNALREWARD_DESC 	= " Урон увеличивается по мере получения вами урона. Когда ваше здоровье ниже 10 %, наносит критические удары, но только при ударах спереди. 90 % сопротивление входящему урону."
		//
		KUNAI_NAME 				= "КУНАЙ ЗАГОВОРЩИКА"
		KUNAI_DESC 				= " Бесконечная дальность радиуса атаки. Удары в спину заставляют роботов взрываться, нанося дополнительный урон ближайшим целям."
		//
		BIGEARNER_NAME 			= "ГЛАВНЫЙ ДЕЛЕЦ"
		BIGEARNER_DESC 			= " У вас огромный запас здоровья, а промахи вызывают быстрое исцеление, однако вы получаете урон от своих же союзников."
		//
		WANGAPRICK_NAME 		= "ИГОЛКА ВУДУ"
		WANGAPRICK_DESC 		= " Убийство робота заставляет вас немедленно войти в режим невидимости на несколько секунд. Вы можете атаковать роботов и продлевать невидимость уничтожением роботов. Не позволяет использовать маскировку."
		//
		SHARPDRESSER_NAME 		= "ОДЕТЫЙ С ИГОЛОЧКИ"
		SHARPDRESSER_DESC 		= " Удары в спину зставляет роботов взрываться, нанося дополнительный урон ближайшим целям."
		//
		SPYCICLE_NAME 			= "СОСУЛЬКА"
		SPYCICLE_DESC 			= " Промах заставляет вас подпрыгнуть в воздух. Вы не можете маскироваться. Наносит огромный урон гигантским роботам при ударе в спину."
		///
		INVISWATCH_NAME 		= "ЧАСЫ НЕВИДИМОСТИ"
		INVISWATCH_DESC 		= " Бесконечная невидимость, +10 % к скорости передвижения."
		//
		DEADRINGER_NAME 		= "ЗВОН СМЕРТИ"
		DEADRINGER_DESC 		= " При активации даёт коротковременную большую прибавку к скорости передвижения. Получаемый урон во время прибавки снижен на 80 %."
		//
		CLOAKANDDAGGER_NAME		= "ПЛАЩ И КИНЖАЛ"
		CLOAKANDDAGGER_DESC		= " Мгновенная невидимость и выход из невидимости."
		//----------------------------
		//----------------------------
		//----------------------------
		FRYINGPAN_NAME 				= "СКОВОРОДА"
		FRYINGPAN_DESC 				= " Наносит 30-кратный урон роботам того же класса, что и вы, и даёт криты за убийство."
		//
		SAXXY_NAME 					= "САКСИ"
		SAXXY_DESC 					= " Наносит 30-кратный урон роботам того же класса, что и вы, и даёт криты за убийство."
		//
		MEMORYMAKER_NAME 			= "СОЗДАТЕЛЬ ВОСПОМИНАНИЙ"
		MEMORYMAKER_DESC			= " Наносит 30-кратный урон роботам того же класса, что и вы, и даёт криты за убийство."
		//
		CONOBJECTOR_NAME			= "ИДЕЙНЫЙ УКЛОНИСТ"
		CONOBJECTOR_DESC			= " Каждые 10 убийств дают случайное заклинание (требуется Книга заклинаний)"
		//
		FREEDOMSTAFF_NAME 			= "ПОСОХ СВОБОДЫ"
		FREEDOMSTAFF_DESC 			= " Небольшой шанс при получении урона уклониться от атаки и стать неуязвимым на 3 секунды."
		//
		BATOUTTAHELL_NAME 			= "ДУБИНА ИЗ АДА"
		BATOUTTAHELL_DESC 			= " Пока активно в руках, вы неуязвимы для всего входящего урона и получаете огромный запас сверхздоровья, но становитесь полностью уязвимы к отталкиванию."
		//
		HAMSHANK_NAME 				= "СВИНОЙ ОКОРОК"
		HAMSHANK_DESC 				= " Особая способность: Жизненное возрождение — когда доступно, нажмите клавишу действия, чтобы мгновенно получить 10-кратный избыточный запас здоровья и иммунитет к отбрасыванию на 20 секунд."
		//
		NECROSMASHER_NAME 			= "ТРУПОКОЛОТУШКА"
		NECROSMASHER_DESC 			= " Особая способность: Транспортное средство — когда доступно, нажмите клавишу действия, чтобы сесть в бамперную машинку. В машинке вы неуязвимы, восстанавливаете здоровье и можете давить роботов."
		//
		CROSSINGGAURD_NAME 			= "РЕГУЛИРОВЩИК"
		CROSSINGGAURD_DESC 			= " Даёт огромное сопротивление всем атакам ближнего боя, включая удары в спину."
		//
		PRINNYMACHETE_NAME 			= "МАЧЕТЕ ПРИННИ"
		PRINNYMACHETE_DESC 			= " Предмет экипировки — атакуйте этим оружием, чтобы стремительно броситься вперёд. Дарует иммунитет к урону от падения."
		//------------------------------------
	}
}
printl("Translations Loaded\n")

printl("Counting translations . . .\n")
local TranslationCounts = {}
foreach (language, table in TRANSLATION_TABLE)
{
	TranslationCounts[language] <- table.len()
	printl(format("[\"%s\" has %i entrys]", language, table.len()))
}
foreach (lang, length in TranslationCounts)
{
	if(length != TRANSLATION_TABLE.english.len())
		printf("Warning, the language \"%s\" has a different amount of translation strings! %+i\n", lang, length - TRANSLATION_TABLE.english.len())
}
