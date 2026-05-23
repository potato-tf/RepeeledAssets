if(!("SetLibraryVersion" in getroottable()) || ("FatCatLibForce" in ROOT && FatCatLibForce == true))
	IncludeScript("fatcat_library")

// CREDITS
// Standard Chinese		--		Pepper[^▽^] 	(pepper_1656 on Discord)
// Traditional Chinese  --		quality			(bonkthequality on Discord)
// Swedish				--		Decimate 		(decimatetf on Discord)
// Russian				--		Liverfull 		(liverfullprod@gmail.com)
// Polish				--		Kimmy 		 	(steamcommunity.com/id/KimmyPL)
// Japanese				--		Calamari        (steamcommunity.com/id/Bipedal_Calamari)
// Danish  				--		Thyme			(thyme1 on Discord)
// Spanish  			--		Ryo				(steamcommunity.com/id/ryo567)

::IH_color <- "\x08FFFF00DD"
::IH_text_color <- "\x08FFFFFFBB"
::IH_color_header <- "\x0826c2ffDD"
::IH_text_color_header <- "\x0826beffBB"
::IH_disable_color <- "\x0826beff66"
::IH_error_color <- "\x07D43F3F"

if(!("CHECKPOINT_ERROR" in getroottable()))
	::CHECKPOINT_ERROR <- "\x07bf4137"

if("SetScriptVersion" in getroottable())
	SetScriptVersion("Translations", "1.5.0")

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
		//---------------------------------------------------------
		CHECKPOINT_CREATED		= "\x077c8cc2已设置检查点:\x078165cf [/%s]"
		CHECKPOINT_WRONG_MAP	= CHECKPOINT_ERROR+"此检查点设置为另一地图."
		CHECKPOINT_WRONG_MISS	= CHECKPOINT_ERROR+"此检查点设置为另一任务."
		CHECKPOINT_EXPIRE		= CHECKPOINT_ERROR+"检查点信息已过期."
		CHECKPOINT_RESTORE		= "\x0744CC44已恢复至最近保存的检查点."
		CHECKPOINT_RESTORE_HUD	= "已恢复至最近保存的检查点."
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
		ALIBABA_DESC			= "提升护盾冲撞伤害. 免疫摔落伤害."
		//
		//
		BOOTLEGGER_NAME			= "海盗头子的假腿"
		BOOTLEGGER_DESC			= "提升护盾冷却速度. 免疫摔落伤害."
		//
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
		CHARGINTARGE_DESC 		= "重击冲锋 - 大幅提升护盾冲撞伤害."
		//
		//
		SPLENDIDSCREEN_NAME 	= "辉煌护盾"
		SPLENDIDSCREEN_DESC 	= "连续冲锋 - 大幅提升护盾冷却速度."
		//
		//
		TIDETURNER_NAME 		= "力挽狂澜"
		TIDETURNER_DESC 		= "爆发冲锋 - 大幅提升冲锋速度."
		//
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
		SKULLCUTTER_DESC 		= "能够无视Ubercharge效果并干扰敌人的医疗枪. 对与你同职业的敌人造成额外的伤害."
		//
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
		DEADRINGER_DESC 		= "在激活时获得短时间的爆发冲刺, 允许你往任何方向冲刺. 冲刺时-80%受到的伤害."
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
	tchinese = {
		IH_TRANSLATE_ITEM		= IH_color + "[%s]" + IH_text_color + "%s"
		IH_INCLUDES				= IH_color_header + "[►]\x0826beffBB 你的裝備配置包含了..."
		IH_DIS_MSG_2			= IH_disable_color + "輸入 '/itemhelp 1' 以在回合中隱藏訊息. \n輸入 '/itemhelp 0' 以完全隱藏此訊息."
		IH_DIS_MSG				= IH_disable_color + "輸入 '/itemhelp 0' 以隱藏這些訊息. \n輸入 '/itemhelp 2' 以持續顯示此訊息."
		IH_BAD_ARGS				= IH_color_header + "[裝備配置]" + IH_error_color + " {錯誤}\x01 參數出錯！!\n/itemhelp 2 -顯示\n/itemhelp 1 - 僅在回合準備階段中顯示\n/itemhelp 0 - 隱藏"
		IH_OOB_ARG				= IH_color_header + "[裝備配置]" + IH_error_color + " {錯誤}\x01 超出配置最大範圍！ : %s"
		IH_HELP_MSG				= IH_color_header + "[裝備配置]\x01 裝備配置會顯示的改動 \x03每個武器\x01 的改動!"
		IH_DISABLE				= IH_color_header + "[►]\x01 以隱藏裝備配置訊息."
		IH_WAVE_SETUP			= IH_color_header + "[►]\x01 裝備配置訊息只在準備階段顯示."
		IH_ENABLE 				= IH_color_header + "[►]\x01 已啟用裝備配置訊息."
		LOW_METAL 				= "金屬不足"
		TOMISLAV_HEAT			= "托米斯拉夫 熱量: %s%%"
		STUCK_RESPAWNED 		= "已將你重生，以防你被卡住."
		ABILITY_READY			= "%s\n► 就緒 ◄"
		ABILITY_CHARGING		= "%s\n%s"
		ABILITY_CHARGING_MSG	= "冷卻: %ss"
		ABILITY_CHARGING_D_MSG	= "冷卻: %s%%"
		MEGACRUSH 				= "超級粉碎"
		VITALRESURGENCE 		= "強力再生"
		VEHICULARMANNSLAUGHTER 	= "肇事屠宰"
		TEST 					= "Test Ability"
		REPROG_BOT_STRONG		= TF_TEAM_COLOR_REPROG_B+"%s\x01 抵抗了你的重構."
		REPROG_BOT_NOT_SUIT		= TF_TEAM_COLOR_REPROG_B+"%s\x01 不適合戰鬥且無法被重構."
		REPROG_BOT_LEAVE		= TF_TEAM_COLOR_SPEC+"%s 死亡."
		REPROG_BOT_MESSAGE 		= TF_TEAM_COLOR_RED+"%s\x01 已重構了 "+TF_TEAM_COLOR_REPROG_B+"%s\x01!"
		//---------------------------------------------------------
		CHECKPOINT_CREATED      = "\x077c8cc2Checkpoint created:\x078165cf [/%s]"
        CHECKPOINT_WRONG_MAP    = CHECKPOINT_ERROR+"此檢查點不在此地圖."
        CHECKPOINT_WRONG_MISS   = CHECKPOINT_ERROR+"此檢查點不在此任務."
        CHECKPOINT_EXPIRE       = CHECKPOINT_ERROR+"檢查點已過期."
        CHECKPOINT_RESTORE      = "\x0744CC44已恢復至最近儲存的檢查點"
        CHECKPOINT_RESTORE_HUD  = "已恢復至最近儲存的檢查點."
		//---------------------------------------------------------
		SCATTERGUN_NAME 		= "雙管霰彈槍"
		SCATTERGUN_DESC 		= "能造成不俗傷害的武器，近距離效果更強."
		//
		FORCENATURE_NAME		= "自然之力"
		FORCENATURE_DESC		= "擊中時提升擊退效果，dps稍微低於雙管霰彈槍."
		//
		SHORTSTOP_NAME 			= "游擊手"
		SHORTSTOP_DESC 			= "極高額的開火速度且能對浸濕的敵人造成暴擊，但裝填速度緩慢."
		//
		SODAPOPPER_NAME 		= "汽水槍手"
		SODAPOPPER_DESC 		= "按住開火鍵進行一次4連速射."
		//
		BABYFACEBLASTER_NAME	= "型男霰彈槍"
		BABYFACEBLASTER_DESC	= "按住開火鍵以進行一次最大到200發的高額連射，穿透任何近距離的目標，但有高額後坐."
		//
		BACKSCATTER_NAME		= "背襲霰彈槍"
		BACKSCATTER_DESC		= "背後射擊造成全額暴擊，不需要彈藥且彈夾無限."
		///
		PISTOL_NAME 			= "手槍"
		PISTOL_DESC 			= "發射物改為火箭，大幅增加機動性."
		//
		BONK_NAME 				= "Bonk! 原子能量飲料"
		BONK_DESC 				= "超級充能飲料，允許你獲得無敵的同時進行攻擊."
		//
		CRITACOLA_NAME 			= "爆擊可樂"
		CRITACOLA_DESC 			= "超級充能飲料，獲得全額暴擊."
		//
		MADMILK_NAME 			= "瘋狂牛奶"
		MADMILK_DESC 			= "被牛奶覆蓋的敵人無法移動."
		//
		WINGER_NAME 			= "御風遊俠"
		WINGER_DESC 			= "使用時獲得無限空中跳躍. 發射一發專注的射擊，在空中時能造成暴擊，該攻擊也能擊退敵人."
		//
		PRETTYBOYS_NAME 		= "俊男掌心雷"
		PRETTYBOYS_DESC 		= "發射能依目標生命造成傷害的火箭，目標生命越低造成的傷害越高，此傷害無視距離，次要開火：發射一枚傷害減少20%的火箭"
		//
		CLEAVER_NAME 			= "斷頭血刃"
		CLEAVER_DESC 			= "勇度之箭：召喚一個自主追蹤的箭協助作戰，次要開火：干擾模式，傷害-75%."
		//
		MATATEDMILK_NAME 		= "突變牛奶"
		MATATEDMILK_DESC 		= "快速投擲爆炸性的牛奶瓶，對敵人造成傷害，次要開火：一次投擲大量牛奶瓶."
		///
		BAT_NAME 				= "球棒"
		BAT_DESC 				= "有機會免死一次且以一血的狀態回到重生點."
		//
		SANDMAN_NAME			= "睡魔"
		SANDMAN_DESC 			= "允許連續發射有著高容量和快速充能的棒球，可以對單體目標造成可觀的傷害."
		//
		HOLYMACKEREL_NAME		= "尚方寶鯖"
		HOLYMACKEREL_DESC		= "允許對多個目標打上死亡印記."
		//
		CANDYCANE_NAME 			= "拐杖糖"
		CANDYCANE_DESC 			= "特殊物品：使你重力歸零且能自由飛翔."
		//
		BOSTONBASHSER_NAME 		= "波士頓狼牙棒"
		BOSTONBASHSER_DESC 		= "高風險 / 高回報. 可以瞬間擊殺大部分小型敵人，獲得10秒暴擊加成，被醫療槍連接的敵人也會受到傷害，但是每次揮空都會殺死你."
		//
		SUNONASTICK_NAME		= "炎日法杖"
		SUNONASTICK_DESC		= "擊中時有機會擊暈敵人或短暫獲得暴擊加成，攻擊所有被醫療槍連接的敵人，但每次揮空都會擊暈你."
		//
		FANOWAR_NAME 			= "鐵軍扇"
		FANOWAR_DESC 			= "特殊武器：揮舞時可以使你向前高速衝刺，免疫摔傷."
		//
		ATOMIZER_NAME 			= "原子棒"
		ATOMIZER_DESC 			= "無法正常造成傷害，但每次嘲諷殺成功時會獲得3分鐘的暴擊加成."
		//
		THREERUNEBLADE_NAME 	= "盧恩古刃"
		THREERUNEBLADE_DESC 	= "使用時，獲得巨額移動速度加成且能三段跳，免疫摔傷."
		//
		UNARMEDCOMBAT_NAME 		= "一臂之力"
		UNARMEDCOMBAT_DESC 		= "每擊殺10個敵人，獲得骷髏召喚術（需裝備魔法書）."
		//
		WRAPAASSASSIN_NAME 		= "包裝紙殺手"
		WRAPAASSASSIN_DESC 		= "允許對彈射物進行攻擊，並將其反彈回去，同時免疫擊暈."
		//----------------------------
		//----------------------------
		//----------------------------
		ROCKETLAUNCHER_NAME		= "火箭發射器"
		ROCKETLAUNCHER_DESC		= "能造成不俗傷害的武器."
		//
		DIRECTHIT_NAME			= "直擊火箭"
		DIRECTHIT_DESC			= "次要開火：把一名小型敵人射到空中以更易造成小爆擊. 火箭有輕微的追蹤效果."
		//
		BLACKBOX_NAME			= "黑盒子"
		BLACKBOX_DESC			= "能夠造成減速和流血效果. 對火箭兵機器人傷害加倍."
		//
		ROCKETJUMPER_NAME		= "火箭跳躍者"
		ROCKETJUMPER_DESC		= "開火和裝填速度緩慢，但有高額傷害和爆炸範圍，非常適合對付大量目標."
		//
		LIBERTYLAUNCHER_NAME	= "自由推進者"
		LIBERTYLAUNCHER_DESC	= "發射一枚飛行緩慢但能在大範圍造成巨額傷害的火箭，裝填速度極其緩慢且只有少量彈藥，此武器在已裝填的情況下會自動開火."
		//
		COWMANGLER_NAME			= "要牛命5000"
		COWMANGLER_DESC			= "擊中能使目標動彈不得,蓄力攻擊能控制更長時間，按住次要開火鍵來發射多重攻擊，並額外加長控制時間."
		//
		ORIGINAL_NAME			= "原型雷神火砲"
		ORIGINAL_DESC			= "按住開火鍵以進行一次最多4發火箭的速射. 此武器在已裝填的情況下會自動開火."
		//
		BEGGARSBAZOOKA_NAME		= "街友火箭砲"
		BEGGARSBAZOOKA_DESC		= "按住開火鍵以裝填最多100發的火箭，隨後以極高速的連射全打出去，此武器不會過載裝填."
		//
		AIRSTRIKE_NAME			= "空襲火箭"
		AIRSTRIKE_DESC			= "最多可裝填10發火箭，並以固定散步發射，這些火箭會自動追蹤目標."
		///
		SHOTGUN_SOLD_NAME 		= "散彈槍 - 火箭兵"
		SHOTGUN_SOLD_DESC 		= "火箭跳時獲得高額開火速度與暴擊."
		//
		SHOTGUN_NAME 			= "散彈槍"
		SHOTGUN_DESC 			= "能造成不俗傷害的武器."
		//
		BUFFBANNER_NAME 		= "增幅旗幟"
		BUFFBANNER_DESC 		= "無限範圍和大幅增加持續時間."
		//
		GUNBOATS_NAME 			= "鐵砲護靴"
		GUNBOATS_DESC 			= "允許按住跳躍鍵以進行兔子跳，大幅提升台階高度，免疫跌倒傷害."
		//
		BATTALIONS_NAME 		= "營隊後援"
		BATTALIONS_DESC 		= "無限範圍和大幅增加持續時間."
		//
		CONCHEROR_NAME 			= "家徽旗"
		CONCHEROR_DESC 			= "無限範圍和大幅增加持續時間."
		//
		RESERVESHOOTER_NAME 	= "後勤防空員"
		RESERVESHOOTER_DESC 	= "造成無視距離的10000點傷害且擊殺獲得3秒小暴擊加成，但此武器無法被暴擊加成和對坦克造成傷害，按住次要開火鍵來瞄準."
		//
		BISON_NAME 				= "正義狂牛"
		BISON_DESC 				= "發射全自動瞄準的連續的可穿透敵人的激光."
		//
		MANTREADS_NAME 			= "踏板戰靴"
		MANTREADS_DESC 			= "大幅減少受傷帶來的擊退，空中轉向能大幅提升加速度，踐踏傷害提升且能按速度額外提升."
		//
		BASEJUMPER_NAME 		= "低空跳傘員"
		BASEJUMPER_DESC 		= "可以打開降落傘，獲得擊退和子彈抗性，使你在空中更堅固."
		//
		PANICATTACK_NAME 		= "背水散彈槍"
		PANICATTACK_DESC 		= "需要瞬間治療的選擇，擊中時最多能恢復10000點生命，使用此武器時受傷有機會短暫進入uber."
		///
		SHOVEL_NAME 			= "鐵鍬"
		SHOVEL_DESC 			= "防禦和機動性的標準選擇."
		//
		EQUALIZER_NAME 			= "傷害均衡十字鎬"
		EQUALIZER_DESC 			= "嘲諷攻擊造成巨額傷害且能把敵人擊飛到空中."
		//
		PAINTRAIN_NAME 			= "天堂路"
		PAINTRAIN_DESC 			= "擊中造成減速和流血. 免疫跌倒傷害."
		//
		HALFZATOICHI_NAME 		= "半盲劍俠"
		HALFZATOICHI_DESC 		= "造成傷害，且有更高生命值，並擴大攻擊範圍."
		//
		MARKETGARDENER_NAME 	= "市場花園園丁"
		MARKETGARDENER_DESC 	= "造成高額加成的暴擊傷害，殺死敵人可進入狂暴，獲得額外生命，抗性和傷害加成，但揮空會殺死你."
		//
		DISCIPLINARYACTION_NAME = "紀律行動"
		DISCIPLINARYACTION_DESC	= "防禦和機動性的標準選擇."
		//
		ESCAPEPLAN_NAME			= "速度均衡十字鎬"
		ESCAPEPLAN_DESC			= "防禦和機動性的標準選擇."
		//----------------------------
		//----------------------------
		//----------------------------
		FLAMETHROWER_NAME 		= "火焰噴射器"
		FLAMETHROWER_DESC		= "能造成不俗傷害的武器. 擊殺獲得短暫小爆擊加成."
		//
		BACKBURNER_NAME 		= "背後火焰發射器"
		BACKBURNER_DESC			= "綠焰：打上死亡標記且能短暫擊暈空中敵人. 對火焰兵機器人傷害加倍."
		//
		DEGREASER_NAME 			= " 除油者"
		DEGREASER_DESC			= "能造成高額直擊傷害的長距離火焰噴射器, 但餘火傷害歸零. 此火焰噴射器無法壓縮氣爆."
		//
		PHLOGISTINATOR_NAME 	= "燃素噴射器"
		PHLOGISTINATOR_DESC		= "綠焰：打上死亡標記且能短暫擊暈空中敵人. 對坦克非常有效，但減少你的移動速度."
		//
		RAINBLOWER_NAME 		= "彩虹放射器"
		RAINBLOWER_DESC			= "造成少量直擊傷害的長距離火焰噴射器, 但餘火傷害更高. 且能立即摧毀工程師的建築、點燃敵方火焰兵. 壓縮氣爆較弱，但發射速度很快."
		//
		DRAGONSFURY_NAME 		= "龍之怒"
		DRAGONSFURY_DESC		= "大幅提升開火和壓縮氣爆速度."
		//
		NOSTROMONAPALMER_NAME 	= "諾斯托羅莫火焰噴射器"
		NOSTROMONAPALMER_DESC	= "击中能减速敌人，擊中能減速敵人，增加像是燃素噴射器mmmph的充能, 但改為獲得家徽旗的增益. 此火焰噴射器無法壓縮氣爆."
		///
		SHOTGUN_PYRO_NAME 		= "散彈槍 - 火焰兵"
		SHOTGUN_PYRO_DESC 		= "對著火的目標必定暴擊."
		//
		FLAREGUN_NAME 			= "信號槍"
		FLAREGUN_DESC 			= "攻擊即時命中且能穿透敵人. 傷害會隨著穿透的敵人數量而指數增加傷害. 同時有機會使目標暈眩."
		//
		DETONATOR_NAME 			= "爆破信號槍"
		DETONATOR_DESC 			= "信號彈的爆炸半徑改為無限並會擊中視線範圍內的所有目標. 強迫所有間諜機器人解除隱形和偽裝. 同時提供高額機動性."
		//
		MANMELTER_NAME 			= "要人命死光槍"
		MANMELTER_DESC 			= "高速發射能自動追蹤敵人的信號彈. 擁有無限彈藥，無需裝填. 次要攻擊: 一次發射大量信號彈."
		//
		SCORCHSHOT_NAME 		= "灼熱信號槍"
		SCORCHSHOT_DESC 		= "擊中時：造成大量傷害，滅掉目標身上的火焰並造成強力擊退，你的目標必須已著火，不然攻擊無法造成任何效果，次要攻擊：發射一枚緩慢但能追踪的信號彈."
		//
		THERMALTHRUSTER_NAME 	= "熱能推進器"
		THERMALTHRUSTER_DESC 	= "減少燃料消耗並取消發射間隔. 允許在空中再次使用並造成巨額踐踏傷害. 擊殺時獲得短暫暴擊加成."
		//
		GASPASSER_NAME 			= "瓦斯罐"
		GASPASSER_DESC 			= "充能從零開始且死亡時重置，需要造成150000傷害才能填滿，點燃爆炸造成105000傷害."
		///
		FIREAXE_NAME 			= "消防斧"
		FIREAXE_DESC 			= "防禦和機動性的標準選擇."
		//
		AXTINGUISHER_NAME 		= "火斧"
		AXTINGUISHER_DESC		= "大幅提升對著火目標的傷害."
		//
		HOMEWRECKER_NAME 		= "家用破壞者"
		HOMEWRECKER_DESC 		= "允許從任何位置立即破壞工程師的建築且有無限範圍."
		//
		POWERJACK_NAME 			= "強力千斤頂"
		POWERJACK_DESC 			= "高攻速和移動速度，擊中造成燃燒和流血且擊殺獲得小暴擊."
		//
		BACKSCRATCHER_NAME 		= "不求人"
		BACKSCRATCHER_DESC 		= "背後攻擊能造成致命傷害，擊殺可進入狂暴，獲得額外速度，抗性和傷害."
		//
		VOLCANOFRAGMENT_NAME 	= "熔岩巨斧"
		VOLCANOFRAGMENT_DESC 	= "有機會擊暈敵人."
		//
		POSTALPUMMELER_NAME 	= "掛號專員"
		POSTALPUMMELER_DESC 	= "擊中時: 造成混亂，使敵人在短時間內往炸彈路徑的反方向行走. 攻擊時按住次要攻擊鍵可以傳送回重生點."
		//
		MAUL_NAME 				= "巨型釘錘"
		MAUL_DESC 				= "擊中可擊飛敵人，揮空則擊飛自己."
		//
		THIRDDEGREE_NAME 		= "三度灼傷"
		THIRDDEGREE_DESC 		= "裝備時讓你近乎免疫火焰傷害，同時啟用時獲得高額遠程傷害抗性."
		//
		LOLLICHOP_NAME 			= "棒棒斧"
		LOLLICHOP_DESC 			= "每擊殺10個敵人，獲得隕雨召喚術 (需要裝備魔法書)."
		//
		NEONANNIHILATOR_NAME 	= "震電之寶"
		NEONANNIHILATOR_DESC 	= "減少你受到的重力."
		//
		HOTHAND_NAME 			= "炙手可熱"
		HOTHAND_DESC 			= "擊中可擊飛敵人."
		//----------------------------
		//----------------------------
		//----------------------------
		GRENADELAUNCHER_NAME 	= "榴彈發射器"
		GRENADELAUNCHER_DESC	= "能造成不俗傷害的武器."
		//
		LOCHNLOAD_NAME 			= "直擊榴彈"
		LOCHNLOAD_DESC			= "發射緩慢卻能造成大範圍的高額傷害的榴彈，適合對付大群敵人."
		//
		ALIBABA_NAME			= "阿里巴巴尖頭靴"
		ALIBABA_DESC			= "強化速度，跳躍高度和盾牌衝刺，提供額外的傷害抗性，盾牌充能和盾撞傷害."
		//
		BOOTLEGGER_NAME			= "私藏海盜靴"
		BOOTLEGGER_DESC			= "強化速度，跳躍高度和盾牌衝刺. 額外提供高額的近戰抗性，但受到更多的暴擊傷害."
		//
		LOOSECANNON_NAME		= "脫韁火炮"
		LOOSECANNON_DESC		= "可一次裝填最多4發砲彈且以垂直散步全射出去. 砲彈會在碰到地面時爆炸"

		IRONBOMBER_NAME			= "迫擊鐵砲"
		IRONBOMBER_DESC			= "無視傷害抗性且擊殺獲得暴擊加成，無需彈藥且有無限彈夾，投射物可以在牆壁之間反彈."
		///
		STICKYBOMB_NAME 		= "黏性炸彈發射器"
		STICKYBOMB_DESC 		= "能造成不俗傷害的武器. 可以放置50發黏彈."
		//
		SCOTTISHRES_NAME 		= "蘇格蘭式防禦黏彈"
		SCOTTISHRES_DESC 		= "黏彈需要5秒鐘準備且10秒後自毀，但擊中能造成巨額傷害."
		//
		STICKYJUMPER_NAME 		= "黏彈跳躍者"
		STICKYJUMPER_DESC 		= "製造一個靜止力場，擊暈範圍內所有敵人（小領袖敵人免疫此效果）"
		//
		CHARGINTARGE_NAME 		= "衝擊刺盾"
		CHARGINTARGE_DESC 		= "重擊衝鋒：大幅提升盾牌衝撞傷害."
		//
		SPLENDIDSCREEN_NAME 	= "輝煌戰盾"
		SPLENDIDSCREEN_DESC 	= "連續衝鋒：衝鋒冷卻時間大幅減少."
		//
		TIDETURNER_NAME 		= "潮汐戰舵"
		TIDETURNER_DESC 		= "爆發衝鋒：大幅提升衝鋒速度."
		//
		QUICKIEBOMB_NAME 		= "速成黏彈發射器"
		QUICKIEBOMB_DESC 		= "自動以高額射速發射準備時間極短的黏彈，擊殺獲得小暴擊加成."
		///
		BOTTLE_NAME 			= "瓶子"
		BOTTLE_DESC 			= "防禦和機動性的標準選擇."
		//
		EYELANDER_NAME 			= "魔眼闊劍"
		EYELANDER_DESC 			= "高傷害且能快速攻擊，擊殺能獲得暴擊，但無法使用榴彈."
		//
		SKULLCUTTER_NAME 		= "蘇格蘭頭骨切割者"
		SKULLCUTTER_DESC 		= "攻擊可無視Ubercharge且能幹擾敵人的醫療槍，對相同職業的敵人造成額外傷害."
		//
		CABER_NAME 				= "阿勒浦木製手榴彈"
		CABER_DESC 				= "傷害會隨著你的受傷程度而提升，生命低於2%獲得暴擊加成，此武器的爆炸能殺死你."
		//
		CLAIDHEAMHMOR_NAME 		= "蓋爾巨劍"
		CLAIDHEAMHMOR_DESC 		= "每擊殺10個敵人，獲得魔眼召喚術（需要裝備魔法書）"
		//
		PERSIANPERSUADER_NAME 	= "波斯使者"
		PERSIANPERSUADER_DESC 	= "和盾牌一起裝備時，獲得無限衝鋒，衝鋒無法因急轉，撞到牆壁，敵人或是其他障礙而停下，免疫擊暈."
		//
		NINEIRON_NAME 			= "尼斯九號鐵桿"
		NINEIRON_DESC 			= "提升攻擊範圍且能同時攻擊多名敵人，暴擊傷害加倍."
		//
		SCOTTISHHANDSHAKE_NAME 	= "蘇格蘭式握手禮"
		SCOTTISHHANDSHAKE_DESC 	= "使用時，獲得90%遠程傷害抗性，免疫擊退且獲得高額最大生命，但你無法補充彈藥且補血包提供的生命減少."
		//----------------------------
		//----------------------------
		//----------------------------
		MINIGUN_NAME 			= "格林機槍"
		MINIGUN_DESC 			= "能造成不俗傷害的武器. 擊殺獲得短暫小暴擊加成."
		//
		NATASCHA_NAME 			= "娜塔莎"
		NATASCHA_DESC 			= "擊中造成減速並打上死亡標記."
		//
		BRASSBEAST_NAME 		= "黃銅野獸"
		BRASSBEAST_DESC 		= "預熱時間增加但造成更高傷害，槍管旋轉時無法移動，可擊落飛行物."
		//
		TOMISLAV_NAME 			= "托米斯拉夫"
		TOMISLAV_DESC 			= "造成傷害能累積熱量，熱量越高，此武器的各項數值越高，但若長時間未造成傷害則會開始冷卻."
		//
		HUOHEATER_NAME 			= "龍火重機槍"
		HUOHEATER_DESC 			= "發射能量光束，點燃敵人"
		//
		GENUINEHUOHEATER_NAME 	= "正統 龍火重機槍"
		GENUINEHUOHEATER_DESC 	= "發射火箭，對著火的敵人必定暴擊."
		///
		SHOTGUN_HVY_NAME 		= "散彈槍 - 重裝兵"
		SHOTGUN_HVY_DESC 		= "單發高傷害，擊殺獲得8秒暴擊."
		//
		SANDVICH_NAME 			= "三明治"
		SANDVICH_DESC 			= "恢復最多150000點生命值，使用此物品時受到的任何傷害都能殺死你."
		//
		DALOKOHSBAR_NAME 		= "美味巧克力"
		DALOKOHSBAR_DESC 		= "恢復最多20000點生命，使用時若生命低於350則獲得高額過量治療。被動：你會受到更多傷害但受傷有機會進入uber."
		//
		BUFFALOSTEAK_NAME 		= "水牛排三明治"
		BUFFALOSTEAK_DESC 		= "被動：免疫暴擊."
		//
		FAMILYBUSINESS_NAME 	= "家族事業"
		FAMILYBUSINESS_DESC 	= "無限彈藥。受到治療時開火速度加倍，擊殺獲得暴擊加成."
		//
		FISHCAKE_NAME 			= "太空魚酥餅"
		FISHCAKE_DESC 			= "獲得高額子彈抗性，但受到更多爆炸和火焰傷害."
		//
		SECONDBANANA_NAME 		= "第二蕉"
		SECONDBANANA_DESC 		= "獲得高額爆炸抗性，但受到更多火焰和子彈傷害."
		///
		FISTS_NAME 				= "拳頭"
		FISTS_DESC 				= "防禦和機動性的標準選擇."
		//
		KILLINGGLOVES_NAME 		= "殺人拳套"
		KILLINGGLOVES_DESC 		= "特殊技能：超級粉碎 - 當可用時，在炸彈上按下動作鍵可以立即重置炸彈，同時短暫給予速度，抗性和暴擊加成s."
		//
		GLOVESRUNNING_NAME 		= "狂奔手套"
		GLOVESRUNNING_DESC 		= "被動：可使用降落傘，使用時，獲得巨額跳躍高度，抗性和生命恢復加成n."
		//
		BREADBITE_NAME 			= "咬咬麵包拳"
		BREADBITE_DESC 			= "暴擊擊中讓目標受到腐蝕, 能讓敵人永久持續受到最大生命一定比例的傷害並在死亡後爆炸成一朵腐蝕雲, 使其傳播給其他目標."
		//
		WARRIRORSSPIRIT_NAME 	= "戰士之魂"
		WARRIRORSSPIRIT_DESC 	= "左鍵可以躍至高空，落到目標時造成巨額摔傷. 移除所有主武器和副武器的彈藥."
		//
		FISTSOFSTEEL_NAME 		= "鐵拳"
		FISTSOFSTEEL_DESC 		= "變成一個擁有250000生命的巨型重裝拳擊手，獲得免疫擊退且能造成高額傷害，移除所有主武器和副武器彈藥，只能從午餐盒類物品來回血."
		//
		EVICTIONNOTICE_NAME 	= "驅逐警告"
		EVICTIONNOTICE_DESC 	= "擊殺恢復大量生命."
		//
		APOCOFISTS_NAME 		= "末世戰拳"
		APOCOFISTS_DESC 		= "拳擊能擊退敵人."
		//
		HOLIDAYPUNCH_NAME 		= "快樂拳"
		HOLIDAYPUNCH_DESC 		= "使用時，所有敵人都會無視你，免疫眩暈，但此武器無法造成傷害."
		//----------------------------
		//----------------------------
		//----------------------------
		SHOTGUN_ENGI_NAME		= "散彈槍 - 工程師"
		SHOTGUN_ENGI_DESC 		= "對你步哨的目標造成4倍傷害."
		//
		FRONTIERJUSTICE_NAME 	= "邊疆正義"
		FRONTIERJUSTICE_DESC 	= "開火速度極快。獲得基於復仇暴擊的彈夾，受到治療時裝填速度加快."
		//
		WIDOWMAKER_NAME 		= "黑寡夫"
		WIDOWMAKER_DESC 		= "消耗2000金屬，以發射能擊退敵人的大範圍射擊."
		//
		POMSON_NAME 			= "潘森 6000"
		POMSON_DESC 			= "擊中造成流血，點燃和減速."
		//
		RESCUERANGER_NAME 		= "遊騎兵援隊"
		RESCUERANGER_DESC		= "每發消耗20金屬，不需要裝填且最大金屬提升至1000."
		///
		WRANGLER_NAME 			= "牧馬者遙控器"
		WRANGLER_DESC 			= "使用時：提升步哨傷害和加倍補給器的範圍."
		//
		SHORTCIRCUIT_NAME 		= "脈衝電場放射儀"
		SHORTCIRCUIT_DESC 		= "每擊殺10個敵人，獲得磁暴漩渦術 (需要裝備魔法書)"
		///
		WRENCH_NAME 			= "扳手"
		WRENCH_DESC 			= "能造成不俗傷害的武器."
		//
		GUNSLINGER_NAME 		= "機械槍手"
		GUNSLINGER_DESC	 		= "允許建造第二台步哨，三拳連擊可以處決小型機器人和對巨型機器人造成高額傷害."
		//
		SOUTHERNHOS_NAME 		= "南方盛情"
		SOUTHERNHOS_DESC 		= "步哨改為火焰步哨，射程短但傷害高."
		//
		JAG_NAME 				= "鉤爪扳手"
		JAG_DESC 				= "步哨擁有無限範圍."
		//
		EUREKAEFFECT_NAME 		= "靈光乍現"
		EUREKAEFFECT_DESC 		= "當你搬運你的步哨時，按下裝填鍵以在任何牆壁或天花板放置步哨."
		//----------------------------
		//----------------------------
		//----------------------------
		SYRINGEGUN_NAME			= "注射槍"
		SYRINGEGUN_DESC			= "擊中獲得0.5% Ubercharge."
		//
		BLUTSAUGER_NAME			= "嗜血針槍"
		BLUTSAUGER_DESC			= "消耗100% Ubercharge 來重構一個機器人, 讓其短暫為你作戰"
		//
		CRUSADERSCROSSBOW_NAME	= "聖十字弩弓"
		CRUSADERSCROSSBOW_DESC	= "擊中時獲得0.25% Ubercharge, 並造成流血同時每次流血傷害額外獲得0.5% Ubercharge."
		//
		OVERDOSE_NAME 			= "超速注射槍"
		OVERDOSE_DESC 			= "消耗100% Ubercharge以發送一個推車，讓周圍的機器人停機最多15秒."
		///
		MEDIGUN_NAME			= "醫療槍"
		MEDIGUN_DESC			= "超量治療上限改為10倍，可部署長時間持續的等級1能量護盾."
		//
		KRITZKRIEG_NAME			= "爆擊製造者"
		KRITZKRIEG_DESC			= "允許吸取敵人的生命值，為自己治療和獲得Uber."
		//
		QUICKFIX_NAME			= "快速治療者"
		QUICKFIX_DESC			= "治療速度極快且有等級2的能量護盾，能從護盾接觸傷害獲得Uber."
		//
		VACCINATOR_NAME			= "疫苗接種者"
		VACCINATOR_DESC			= "治療給你和目標獲得100%所選種類的傷害抗性，Ubercharge則能在30秒內完全免疫該種傷害."
		///
		BONESAW_NAME 			= "骨鋸"
		BONESAW_DESC			= "防禦和機動性的標準選擇. 擊中獲得10% Uber."
		//
		UBERSAW_NAME 			= "超能骨鋸"
		UBERSAW_DESC			= "擊中造成流血. 擊中獲得2%Uber."
		//
		VITASAW_NAME 			= "還魂鋸"
		VITASAW_DESC			= "擊中獲得集體治癒術 (需要裝備魔法書). 擊中獲得5% Uber."
		//
		AMPUTATOR_NAME 			= "截肢鋸"
		AMPUTATOR_DESC			= "擊中時：你的醫療槍獲得超級充能，短暫強化治療，uber累積和範圍，擊殺敵人可獲得更強的效果."
		//
		SOLEMNVOW_NAME 			= "神聖誓言"
		SOLEMNVOW_DESC			= "無限範圍，對所有倍醫療強連結的敵人造成傷害並對醫療兵機器人造成200倍傷害. 每擊中一個敵人就獲得5% Uber."
		//----------------------------
		//----------------------------
		//----------------------------
		SNIPERRIFLE_NAME 		= "狙擊槍"
		SNIPERRIFLE_DESC 		= "完全充能的爆頭造成450000傷害."
		//
		MACHINA_NAME 			= "神授貫殺獵槍"
		MACHINA_DESC 			= "充能速度很慢，但滿充能可對坦克造成高額傷害，擊殺獲得1秒暴擊加成，在暴擊加成下滿充能射擊能重創坦克."
		//
		HITMANSHEATMAKER_NAME 	= "全面狙殺令"
		HITMANSHEATMAKER_DESC 	= "高速連射且不用開鏡，命中身體沒有傷害."
		//
		AWPERHAND_NAME 			= "AWP"
		AWPERHAND_DESC 			= "發射爆炸彈藥且擊殺能累積充能，充能滿時可以按下裝填鍵來提升最大生命和生命恢復，只有瞄準鏡裡有敵人才能充能."
		//
		HUNTSMAN_NAME 			= "獵人長弓"
		HUNTSMAN_DESC 			= "一次發射5支箭，若火焰兵點燃你的箭則能造成巨額燃燒傷害."
		//
		SYDNEYSLEEPER_NAME 		= "雪梨沉睡者"
		SYDNEYSLEEPER_DESC 		= "發射一枚能阻止敵方小型機器人移動、接受醫療兵機器人治療的飛鏢."
		//
		BAZAARBARGAIN_NAME 		= "巴剎長槍"
		BAZAARBARGAIN_DESC 		= "擊殺相同職業的敵人能加快開火速度，最多疊加3次，擊殺其他兵種會重置."
		//
		FORTIFIEDCOMPOUND_NAME 	= "強化組合弓"
		FORTIFIEDCOMPOUND_DESC 	= "傷害低於獵人長弓, 但開火速度更快，能穿透和對打濕的敵人暴擊."
		//
		CLASSIC_NAME 			= "典雅絕殺獵槍"
		CLASSIC_DESC 			= "開火速度隨著按下開火鍵的速度而提升, 或是充能一發擁有極高爆炸爆頭的攻擊，以湮滅一切範圍內的非巨型機器人."
		///
		SMG_NAME 				= "衝鋒槍"
		SMG_DESC 				= "可以爆頭，次要開火：進入瞄準模式以獲得100%準確度，但開火速度砍半."
		//
		RAZORBACK_NAME 			= "劍脊野豬盾"
		RAZORBACK_DESC 			= "充能速度很快，且能對攻擊施加瓶手道效果."
		//
		JARATE_NAME 			= "瓶手道"
		JARATE_DESC 			= "充能速度極快，且能減速敵人."
		//
		DARWIN_NAME 			= "達爾文鱷魚盾"
		DARWIN_DESC 			= "幾乎免疫火焰傷害，但子彈和爆炸會對你額外造成50%傷害."
		//
		COZYCAMPER_NAME 		= "舒適的露營家"
		COZYCAMPER_DESC 		= "稍微提升最大生命，速度和生命恢復，免疫餘火."
		//
		CLEANERSCARBINE_NAME 	= "湮滅者卡賓槍"
		CLEANERSCARBINE_DESC 	= "小暴擊加成持續30秒."
		//
		BEAUTYMARK_NAME 		= "有自我意識的美妙有機體"
		BEAUTYMARK_DESC 		= "降下附有聖之獄焰的箭矢，次要開火:一次發射多重箭矢."
		///
		KUKRI_NAME 				= "喀爾克大彎刀"
		KUKRI_DESC 				= "防禦和機動性的標準選擇."
		//
		TRIBALMANSSHIV_NAME 	= "部落戰刀"
		TRIBALMANSSHIV_DESC 	= "特殊物品：你無視重力且可以自由飛翔."
		//
		BUSHWACKA_NAME 			= "布伊刀"
		BUSHWACKA_DESC 			= "無限近戰範圍且能對著火的敵人暴擊."
		//
		SHAHANSHAH_NAME 		= "王中之王"
		SHAHANSHAH_DESC 		= "左鍵可使你飛至高空，適合到達高處，你同時免疫摔傷."
		//----------------------------
		//----------------------------
		//----------------------------
		REVOLVER_NAME 			= "左輪手槍"
		REVOLVER_DESC 			= "擊中能附加多種負面效果, 使敵人受到傷害增加，減少醫療兵機器人的uber充能且強制讓間諜機器人解除偽裝，可以擊暈空中的敵人."
		//
		AMBASSADOR_NAME 		= "全能大使"
		AMBASSADOR_DESC 		= "爆頭造成巨額傷害，非偽裝時傷害加倍."
		//
		LETRANGER_NAME 			= "局外人左輪"
		LETRANGER_DESC 			= "允許你一擊處決所有非巨型機器人. 對坦克和巨型機器人無效."
		//
		ENFORCER_NAME 			= "脅威使"
		ENFORCER_DESC 			= "無視任何傷害抗性並且能透過背刺或使用電子破壞器摧毀建築獲得暴擊充能."
		//
		DIAMONDBACK_NAME 		= "鑽紋響尾蛇"
		DIAMONDBACK_DESC 		= "產生一個能吸引敵人的黑洞."
		///
		SAPPER_NAME 			= "電子破壞器"
		SAPPER_DESC 			= "獲得滿等的影響範圍和持續時間. 充能更快."
		//
		REDTAPE_NAME 			= "倒轉錄音機"
		REDTAPE_DESC 			= "瞬間摧毀工程師的建築，但只能一次影響一個機器人."
		///
		KNIFE_NAME 				= "刀子"
		KNIFE_DESC 				= "使用時，會使你不斷流失生命但使你免疫任何傷害，擊殺可以恢復生命."
		//
        YOURETERNALREWARD_NAME 	= "您的永恆獎賞"
		YOURETERNALREWARD_DESC 	= "當你受傷時增加其傷害且生命低於10%獲得暴擊，但此增益只能適用於正面擊中，獲得90%的傷害抗性."
		//
		KUNAI_NAME 				= "陰謀苦無"
		KUNAI_DESC 				= "攻擊範圍變為無限，背刺能造成爆炸，對周圍的敵人造成額外傷害."
		//
		BIGEARNER_NAME 			= "暴利之刃"
		BIGEARNER_DESC 			= "獲得巨額生命上限且空揮時大幅治療自身，但你會受到友方的誤傷."
		//
		WANGAPRICK_NAME 		= "巫毒咒錐"
		WANGAPRICK_DESC 		= "擊殺敵人時能使你立即持續幾秒的隱形，隱形期間可以攻擊敵人且連殺可以維持隱形，無法使用偽裝."
		//
		SHARPDRESSER_NAME 		= "刺客袖劍"
		SHARPDRESSER_DESC 		= "背刺能造成爆炸，對周圍的敵人造成額外傷害."
		//
		SPYCICLE_NAME 			= "寒冽冰錐"
		SPYCICLE_DESC 			= "空揮能讓你躍至空中從而進行空中背刺, 但你無法偽裝. 背刺巨型機器人能造成高額傷害."
		///
		INVISWATCH_NAME 		= "隱形手錶"
		INVISWATCH_DESC 		= "無限隱形時間, +10%移動速度."
		//
		DEADRINGER_NAME 		= "死亡送終者"
		DEADRINGER_DESC 		= "啟動時短暫獲得高額移動速度，允許你往任何方向衝刺，衝刺時受到的傷害減少80%."
		//
		CLOAKANDDAGGER_NAME		= "隱身匕首"
		CLOAKANDDAGGER_DESC		= "能立即進入並解除隱形."
		//----------------------------
		//----------------------------
		//----------------------------
		FRYINGPAN_NAME 				= "油炸平底鍋"
		FRYINGPAN_DESC 				= "對和你相同職業的目標造成30倍傷害同時擊殺時獲得暴擊."
		//
		SAXXY_NAME 					= "薩氏金像獎小金人"
		SAXXY_DESC 					= "對和你相同職業的目標造成30倍傷害同時擊殺時獲得暴擊."
		//
		MEMORYMAKER_NAME 			= "過往回憶"
		MEMORYMAKER_DESC			= "對和你相同職業的目標造成30倍傷害同時擊殺時獲得暴擊."
		//
		CONOBJECTOR_NAME			= "良心反對者的舉牌"
		CONOBJECTOR_DESC			= "每擊殺10個敵人，隨機抽出一個魔咒 (需要裝備魔法書)."
		//
		FREEDOMSTAFF_NAME 			= "自由權杖"
		FREEDOMSTAFF_DESC 			= "受到傷害時小幾率閃避此次傷害並獲得3秒無敵."
		//
		BATOUTTAHELL_NAME 			= "地獄骨杖"
		BATOUTTAHELL_DESC 			= "使用時使你免疫所有傷害且獲得高額超量治療, 但極度提升受到的擊退."
		//
		HAMSHANK_NAME 				= "帶骨火腿肉"
		HAMSHANK_DESC 				= "特殊技: '強力再生' -  當可用時，按下動作鍵可獲得10倍的超量治療且在20秒內免疫擊退."
		//
		NECROSMASHER_NAME 			= "滅絕之錘"
		NECROSMASHER_DESC 			= "特殊技: '肇事屠宰' -  當可用時，按下動作鍵以進入碰碰車模式，在該模式下獲得無敵，生命恢復且能碾過敵人"
		//
		CROSSINGGAURD_NAME 			= "此路不通"
		CROSSINGGAURD_DESC 			= "獲得包含背刺在內的高額近戰抗性."
		//
		PRINNYMACHETE_NAME 			= "普利尼短刀"
		PRINNYMACHETE_DESC 			= "實用工具 - 揮動武器能高速向前衝刺，免疫摔傷."
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
	polish = {
		IH_TRANSLATE_ITEM		= IH_color + "[%s]" + IH_text_color + "%s"
		IH_INCLUDES				= IH_color_header + "[►]\x0826beffBB Twoje wyposażenie składa się z..."
		IH_DIS_MSG_2			= IH_disable_color + "Wpisz „/itemhelp 1”, by wyłączyć te wiadomości podczas fali. \nWpisz „/itemhelp 0”, by całkowicie wyłączyć te wiadomości."
		IH_DIS_MSG				= IH_disable_color + "Wpisz „/itemhelp 0”, by wyłączyć te wiadomości. \nWpisz „/itemhelp 2”, by zawsze wyświetlać tę wiadomość."
		IH_BAD_ARGS				= IH_color_header + "[Asystent przedmiotów]" + IH_error_color + " {Error}\x01 Błędne argumenty!\n/itemhelp 2 - włącz\n/itemhelp 1 - włącz tylko podczas przygotowania przed falą\n/itemhelp 0 - wyłącz"
		IH_OOB_ARG				= IH_color_header + "[Asystent przedmiotów]" + IH_error_color + " {Error}\x01 Wprowadzono wartość poza zakresem! : %s"
		IH_HELP_MSG				= IH_color_header + "[Asystent przedmiotów]\x01 Asystent przedmiotów zapewnia krótkie opisy dla każdego \x03Chaos\x01 przedmiotu!"
		IH_DISABLE				= IH_color_header + "[►]\x01 Asystent przedmiotów jest wyłączony."
		IH_WAVE_SETUP			= IH_color_header + "[►]\x01 Asystent przedmiotów jest włączony tylko podczas przygotowania przed falą."
		IH_ENABLE 				= IH_color_header + "[►]\x01 Asystent przedmiotów jest włączony."
		LOW_METAL 				= "Za mało metalu"
		TOMISLAV_HEAT			= "Nagrzanie Tomisława: %s%%"
		STUCK_RESPAWNED 		= "Odrodzono cię, by zapobiec utknięciu."
		ABILITY_READY			= "%s\n► Gotów ◄"
		ABILITY_CHARGING		= "%s\n%s"
		ABILITY_CHARGING_MSG	= "Ładowanie: %ss"
		ABILITY_CHARGING_D_MSG	= "Ładowanie: %s%%"
		MEGACRUSH 				= "MEGAZGNIOT"
		VITALRESURGENCE 		= "WITALNE ODRODZENIE"
		VEHICULARMANNSLAUGHTER 	= "POJAZDOWA MASAKRA"
		TEST 					= "Zdolność testowa"
		NO_MONEY				= "You can't afford this! (Cost: $%s, you have: $%s)" // Dont Translate this, my own project
		REPROG_BOT_STRONG		= TF_TEAM_COLOR_REPROG_B+"%s\x01 ma za dużą odporność i nie można go przeprogramować."
		REPROG_BOT_NOT_SUIT		= TF_TEAM_COLOR_REPROG_B+"%s\x01 nie jest przystosowany do walki i nie można go przeprogramować."
		REPROG_BOT_LEAVE		= TF_TEAM_COLOR_SPEC+"%s zginął."
		REPROG_BOT_MESSAGE 		= TF_TEAM_COLOR_RED+"%s\x01 przeprogramował "+TF_TEAM_COLOR_REPROG_B+"%s\x01!"
		//---------------------------------------------------------
		CHECKPOINT_CREATED		= "\x077c8cc2Utworzono punkt kontrolny:\x078165cf [/%s]"
		CHECKPOINT_WRONG_MAP	= CHECKPOINT_ERROR+"Ten punkt kontrolny nie został ustawiony dla tej mapy."
		CHECKPOINT_WRONG_MISS	= CHECKPOINT_ERROR+"Ten punkt kontrolny nie został ustawiony dla tej misji."
		CHECKPOINT_EXPIRE		= CHECKPOINT_ERROR+"Ten punkt kontrolny wygasł."
		CHECKPOINT_RESTORE		= "\x0744CC44Przywrócono do ostatniego zapisanego punktu kontrolnego."
		CHECKPOINT_RESTORE_HUD	= "Przywrócono do ostatniego zapisanego punktu kontrolnego."
		//---------------------------------------------------------
		SCATTERGUN_NAME 		= "DUBELTÓWKA"
		SCATTERGUN_DESC 		= " Standardowa opcja zapewniająca solidne obrażenia. Bardzo skuteczna na bliskim dystansie."
		//
		FORCENATURE_NAME		= "SIŁA NATURY"
		FORCENATURE_DESC		= " Zwiększony odrzut przy trafieniu we wroga. Zadaje nieco mniejsze obrażenia na sekundę w porównaniu do dubeltówki."
		//
		SHORTSTOP_NAME 			= "WSTRZYMYWACZ"
		SHORTSTOP_DESC 			= " Bardzo duża szybkostrzelność i zadaje trafienia krytyczne mokrym wrogom, ale wolne przeładowanie."
		//
		SODAPOPPER_NAME 		= "BUZOWNIK"
		SODAPOPPER_DESC 		= " Przytrzymaj przycisk strzału, by załadować serię szybkich 4 strzałów."
		//
		BABYFACEBLASTER_NAME	= "BROWNING BABY FACE'A"
		BABYFACEBLASTER_DESC	= " Przytrzymaj przycisk strzału, by załadować aż do 200 pocisków, niszcząc wszystko na krótkim dystansie. Ma bardzo duży odrzut."
		//
		BACKSCATTER_NAME		= "DUPELTÓWKA"
		BACKSCATTER_DESC		= " Trafienia krytyczne przy trafieniu wrogów od tyłu. Nie wymaga amunicji i posiada nieskończony magazynek."
		///
		PISTOL_NAME 			= "PISTOLET"
		PISTOL_DESC 			= " Strzela rakietami zamiast pociskami. Bardzo przydatny do przemieszczania się."
		//
		BONK_NAME 				= "BONK! ATOMOWY KOP"
		BONK_DESC 				= " Supernaładowany napój, zapewniający niewrażliwość na obrażenia bez odbierania możliwości atakowania podczas trwania efektu."
		//
		CRITACOLA_NAME 			= "KRYT-O-COLA"
		CRITACOLA_DESC 			= " Supernaładowany napój zapewniający trafienia krytyczne."
		//
		MADMILK_NAME 			= "WŚCIEKŁE MLEKO"
		MADMILK_DESC 			= " Wrogowie pokryci mlekiem nie mogą się poruszać."
		//
		WINGER_NAME 			= "SKRZYDŁOWY"
		WINGER_DESC 			= " Nieograniczona ilość skoków w powietrzu, gdy broń jest dobyta. Wystrzeliwuje pojedynczy, precyzyjny strzał, który zadaje obrażenia krytyczne, gdy znajdujesz się w powietrzu. Strzał dodatkowo odpycha wrogów."
		//
		PRETTYBOYS_NAME 		= "PORĘCZNY PISTOLET PRETTY BOYA"
		PRETTYBOYS_DESC 		= " Wystrzeliwuje rakiety zadające obrażenia zależne od zdrowia wroga. Obrażenia rosną, gdy przeciwnik jest ranny i zadaje te same obrażenia niezależnie od odległości do wroga. Atak alternatywny: użyj rakiet naprowadzających zadających -20% obrażeń."
		//
		CLEAVER_NAME 			= "LATAJĄCA GILOTYNA"
		CLEAVER_DESC 			= " Strzała Yondu: przywołaj świadomą strzałę do pomocy w walce. Atak alternatywny: tryb zakłócający, -75% obrażeń."
		//
		MATATEDMILK_NAME 		= "ZMUTOWANE MLEKO"
		MATATEDMILK_DESC 		= " Szybkostrzelne wybuchowe słoiki z mlekiem, zadające obrażenia wrogom. Atak alternatywny: rzuć kilkoma słoikami naraz."
		///
		BAT_NAME 				= "KIJ"
		BAT_DESC 				= " Szansa na uniknięcie śmierci i teleportowanie do strefy odradzania z 1 pkt. zdrowia."
		//
		SANDMAN_NAME			= "PIASKUN"
		SANDMAN_DESC 			= " Pozwala na szybkie miotanie piłek baseballowych, z dużym zapasem piłek i ich szybkim odnawianiem, zadając pojedynczym wrogom duże obrażenia serią piłek."
		//
		HOLYMACKEREL_NAME		= "ŚWIĘTA MAKRELA"
		HOLYMACKEREL_DESC		= " Może nakładać piętna śmierci na wielu wrogów naraz."
		//
		CANDYCANE_NAME 			= "CUKROWE LASKI"
		CANDYCANE_DESC 			= " Przedmiot pomocniczy – grawitacja nie oddziałuje na tobie i możesz swobodnie latać."
		//
		BOSTONBASHSER_NAME 		= "BOSTOŃSKI TŁUCZEK"
		BOSTONBASHSER_DESC 		= " Duże ryzyko/duża nagroda. Może natychmiast zabić większość słabszych wrogów, przyznając 10 sekund trafień krytycznych, jednak chybienie kończy się natychmiastową śmiercią. Wrogowie połączeni wiązką mediguna również są trafiani."
		//
		SUNONASTICK_NAME		= "SŁOŃCE NA PATYKU"
		SUNONASTICK_DESC		= " Szansa na ogłuszenie wrogów lub otrzymanie trafień krytycznych, jednak chybienie ogłusza ciebie. Wrogowie połączeni wiązką mediguna również są trafiani."
		//
		FANOWAR_NAME 			= "WACHLARZ WOJENNY"
		FANOWAR_DESC 			= " Przedmiot pomocniczy – zamachnij się tą bronią, by wybić się do przodu z dużą prędkością. Zapewnia odporność na obrażenia od upadku."
		//
		ATOMIZER_NAME 			= "ATOMIZER"
		ATOMIZER_DESC 			= " Nie może zadawać obrażeń zwykłymi atakami, ale udane zabójstwo zabójczą drwiną zapewnia trafienia krytyczne na 3 minuty."
		//
		THREERUNEBLADE_NAME 	= "TRÓJRUNICZNE OSTRZE"
		THREERUNEBLADE_DESC 	= " Gdy broń jest dobyta, zyskujesz OGROMNE zwiększenie szybkości ruchu i możliwość wykonania potrójnego skoku. Zapewnia odporność na obrażenia od upadku."
		//
		UNARMEDCOMBAT_NAME 		= "RĘKODZIEŁO"
		UNARMEDCOMBAT_DESC 		= " Co 10 zabójstw otrzymujesz ładunek zaklęcia przywołania szkieletowego sługi (wymaga założenia księgi zaklęć)."
		//
		WRAPAASSASSIN_NAME 		= "PAKUJĄCY ZABÓJCA"
		WRAPAASSASSIN_DESC 		= " Pozwala atakować nadciągające pociski i z łatwością je odbijać. Zapewnia również odporność na ogłuszenie."
		//----------------------------
		//----------------------------
		//----------------------------
		ROCKETLAUNCHER_NAME		= "WYRZUTNIA RAKIET"
		ROCKETLAUNCHER_DESC		= " Standardowa opcja zapewniająca solidne obrażenia."
		//
		DIRECTHIT_NAME			= "CELNY STRZAŁ"
		DIRECTHIT_DESC			= " Atak alternatywny: wystrzel słabszego wroga w powietrze, by łatwo zadać mu obrażenia minikrytyczne w powietrzu. Rakiety mają niewielkie wspomaganie celowania."
		//
		BLACKBOX_NAME			= "CZARNA SKRZYNKA"
		BLACKBOX_DESC			= " Spowalnia wrogów i wywołuje u nich krwawienie. Zadaje 2x większe obrażenia robożołnierzom."
		//
		ROCKETJUMPER_NAME		= "RAKIETOWY SKOCZEK"
		ROCKETJUMPER_DESC		= " Niska szybkostrzelność i wolne przeładowanie, lecz zadaje duże obrażenia i posiada duży promień wybuchu. Świetna opcja do kontrolowania grup przeciwników."
		//
		LIBERTYLAUNCHER_NAME	= "WYRZUTNIA WOLNOŚCI"
		LIBERTYLAUNCHER_DESC	= " Wystrzeliwuje wolno lecącą rakietę, która zadaje ogromne obrażenia na dużym obszarze. Bardzo wolne przeładowanie i mała ilość amunicji. Strzela automatycznie po załadowaniu."
		//
		COWMANGLER_NAME			= "WYŻYMACZKA KRÓW 5000"
		COWMANGLER_DESC			= " Unieruchamia słabszych wrogów przy trafieniu. Naładowany strzał unieruchamia wrogów na dłużej. Przytrzymaj atak alternatywny, by supernaładować broń i oddać serię strzałów, co skutkuje jeszcze dłuższym efektem unieruchomienia."
		//
		ORIGINAL_NAME			= "PIERWOWZÓR"
		ORIGINAL_DESC			= " Przytrzymaj przycisk strzału, by załadować serię aż do 4 rakiet. Strzela automatycznie po załadowaniu."
		//
		BEGGARSBAZOOKA_NAME		= "BAZOOKA BIEDAKA"
		BEGGARSBAZOOKA_DESC		= " Przytrzymaj przycisk strzału, by załadować aż do 100 rakiet i puść przycisk, by szybko je wystrzelić. Przeładowanie komory NIE doprowadzi do eksplozji."
		//
		AIRSTRIKE_NAME			= "ATAK POWIETRZNY"
		AIRSTRIKE_DESC			= " Załaduj aż do 10 rakiet i wystrzel je naraz w stałym wzorze rozrzutu. Rakiety automatycznie naprowadzają się na wrogów."
		///
		SHOTGUN_SOLD_NAME 		= "STRZELBA - ŻOŁNIERZ"
		SHOTGUN_SOLD_DESC 		= " Bardzo duża szybkostrzelność i trafienia krytyczne podczas rakietowych skoków."
		//
		SHOTGUN_NAME 			= "STRZELBA"
		SHOTGUN_DESC 			= " Standardowa opcja zapewniająca solidne obrażenia."
		//
		BUFFBANNER_NAME 		= "SZTANDAR CHWAŁY"
		BUFFBANNER_DESC 		= " Nieograniczony zasięg i znacznie wydłużony czas trwania efektu."
		//
		GUNBOATS_NAME 			= "KANONIERKI"
		GUNBOATS_DESC 			= " Umożliwia wykonywanie „bunnyhopów” poprzez przytrzymanie klawisza skoku. Zapewnia odporność na obrażenia od upadku."
		//
		BATTALIONS_NAME 		= "WSPARCIE BATALIONU"
		BATTALIONS_DESC 		= " Nieograniczony zasięg i znacznie wydłużony czas trwania efektu."
		//
		CONCHEROR_NAME 			= "SASHIMONO STRACEŃCA"
		CONCHEROR_DESC 			= " Nieograniczony zasięg i znacznie wydłużony czas trwania efektu."
		//
		RESERVESHOOTER_NAME 	= "REZERWISTA"
		RESERVESHOOTER_DESC 	= " Zadaje stałe 10 000 pkt. obrażeń na strzał niezależnie od odległości i przyznaje 3 sekundy trafień minikrytycznych po zabiciu wroga. Nie może uzyskać krytycznych obrażeń i nie zadaje obrażeń czołgom. Przytrzymaj atak alternatywny, by przybliżyć widok."
		//
		BISON_NAME 				= "PRAWY BIZON"
		BISON_DESC 				= " Wystrzeliwuje ciągłą wiązkę penetrującą wrogów z pełnym automatycznym celowaniem."
		//
		MANTREADS_NAME 			= "MIAŻDŻYCIELE"
		MANTREADS_DESC 			= " Znacznie redukuje odrzut przy otrzymywaniu obrażeń. Skręcanie w powietrzu ma teraz znacznie większe przyspieszenie. Obrażenia od upadku na wroga są zwiększone i zależą od szybkości spadania noszącego."
		//
		BASEJUMPER_NAME 		= "SPADOCHRONOWY SKOCZEK"
		BASEJUMPER_DESC 		= " Umożliwia wielokrotne otwieranie i zamykanie spadochronu w powietrzu. Zwiększa odporność na odrzut i naboje, zmniejszając podatność na ataki będąc w powietrzu."
		//
		PANICATTACK_NAME 		= "ATAK PANIKI"
		PANICATTACK_DESC 		= " Gdy potrzebujesz natychmiastowego leczenia. Natychmiast odnawia do 10 000 pkt. zdrowia przy trafieniu we wroga. Otrzymywanie obrażeń, gdy broń jest dobyta, ma szansę na aktywowanie krótkiego ładunku ÜberCharge."
		///
		SHOVEL_NAME 			= "SAPERKA"
		SHOVEL_DESC 			= " Standardowa opcja zapewniająca ochronę i mobilność."
		//
		EQUALIZER_NAME 			= "WYRÓWNYWACZ"
		EQUALIZER_DESC 			= " Zabójcza drwina zadaje ogromne obrażenia i wyrzuca wrogów w powietrze."
		//
		PAINTRAIN_NAME 			= "PAŁKA SOKISTY"
		PAINTRAIN_DESC 			= " Wywołuje krwawienie i spowalnia wrogów przy trafieniu. Zapewnia odporność na obrażenia od upadku."
		//
		HALFZATOICHI_NAME 		= "PRAWIE ZATOICHI"
		HALFZATOICHI_DESC 		= " Średnie obrażenia, duża mobilność i zwiększony zasięg ataku."
		//
		MARKETGARDENER_NAME 	= "OGRODNIK Z ARNHEM"
		MARKETGARDENER_DESC 	= " Znacznie zwiększone obrażenia krytyczne. Po zabiciu wroga wchodzisz w stan furii, otrzymując dodatkowe zdrowie, odporność i zwiększone obrażenia do wszystkich ataków. Chybienie kończy się natychmiastową śmiercią."
		//
		DISCIPLINARYACTION_NAME = "POSTĘPOWANIE DYSCYPLINARNE"
		DISCIPLINARYACTION_DESC	= " Standardowa opcja zapewniająca ochronę i mobilność."
		//
		ESCAPEPLAN_NAME			= "PLAN UCIECZKI"
		ESCAPEPLAN_DESC			= " Standardowa opcja zapewniająca ochronę i mobilność."
		//----------------------------
		//----------------------------
		//----------------------------
		FLAMETHROWER_NAME 		= "MIOTACZ OGNIA"
		FLAMETHROWER_DESC		= " Standardowa opcja zapewniająca solidne obrażenia. Po zabiciu wroga zyskujesz trafienia minikrytyczne na krótki czas."
		//
		BACKBURNER_NAME 		= "DUPALACZ"
		BACKBURNER_DESC			= " Zielony ogień – nakłada na wrogów piętno śmierci i ogłusza znajdujących się w powietrzu przeciwników na krótki czas. Zadaje 2x większe obrażenia robopyro."
		//
		DEGREASER_NAME 			= "ODTŁUSZCZACZ"
		DEGREASER_DESC			= " Miotacz ognia o dużym zasięgu z dużymi obrażeniami bezpośrednimi, lecz bez obrażeń od podpalenia. Nie posiada podmuchu sprężonego powietrza."
		//
		PHLOGISTINATOR_NAME 	= "FLOGISTYNATOR"
		PHLOGISTINATOR_DESC		= " Zielony ogień – nakłada na wrogów piętno śmierci i ogłusza znajdujących się w powietrzu przeciwników na krótki czas. Skuteczny przeciwko czołgom, ale zmniejsza twoją szybkość ruchu."
		//
		RAINBLOWER_NAME 		= "TĘCZOMIOT"
		RAINBLOWER_DESC			= " Miotacz ognia o dużym zasięgu i z niskimi obrażeniami bezpośrednimi, lecz dużymi obrażeniami od podpalenia. Może natychmiast niszczyć konstrukcje Inżyniera i podpalać wrogich Pyro. Podmuch sprężonego powietrza jest słaby, ale czas oczekiwania na jego kolejne użycie jest bardzo krótki."
		//
		DRAGONSFURY_NAME 		= "SMOCZA FURIA"
		DRAGONSFURY_DESC		= " Znacznie zwiększona szybkostrzelność i skrócony czas oczekiwania na kolejne użycie podmuchu sprężonego powietrza."
		//
		NOSTROMONAPALMER_NAME 	= "NAPALM Z NOSTROMO"
		NOSTROMONAPALMER_DESC	= " Spowalnia wrogów przy trafieniu. Buduje ładunek „Mmmph” podobnie jak Flogistynator, ale przyznaje efekt Sashimona straceńca. Nie posiada podmuchu sprężonego powietrza."
		///
		SHOTGUN_PYRO_NAME 		= "STRZELBA - PYRO"
		SHOTGUN_PYRO_DESC 		= " Zadaje trafienia krytyczne płonącym wrogom."
		//
		FLAREGUN_NAME 			= "PISTOLET SYGNAŁOWY"
		FLAREGUN_DESC 			= " Wystrzeliwuje pocisk w linii prostej, który penetruje wrogów. Obrażenia pocisku są zwiększane z każdym kolejnym trafionym po drodze przeciwnikiem. Ma też szansę ogłuszyć wrogów przy trafieniu."
		//
		DETONATOR_NAME 			= "DETONATOR"
		DETONATOR_DESC 			= " Flara ma nieskończony promień wybuchu i trafia w każdego wroga w jej polu widzenia. Zmusza wszystkich roboszpiegów do usunięcia swoich przebrań i wyłączenia niewidzialności. Świetna opcja zapewniająca mobilność."
		//
		MANMELTER_NAME 			= "CZŁEKOROZTAPIACZ"
		MANMELTER_DESC 			= " Szybkostrzelne flary automatycznie namierzające wrogów. Nieskończona amunicja i brak przeładowania. Atak alternatywny: wystrzel naraz serię wielu flar."
		//
		SCORCHSHOT_NAME 		= "PIEKĄCA PALBA"
		SCORCHSHOT_DESC 		= " Przy trafieniu we wroga: zadaje duże obrażenia, gasi wroga i odrzuca go. Przeciwnik musi być podpalony, w przeciwnym razie atak nie zadziała. Atak alternatywny: użyj wolnej samonaprowadzającej flary."
		//
		THERMALTHRUSTER_NAME 	= "CIEPLNY CIĄG"
		THERMALTHRUSTER_DESC 	= " Zmniejszone zużycie paliwa i brak opóźnienia startu. Umożliwia ponowne użycie plecaka w powietrzu i zadaje ogromne obrażenia przeciwnikowi, na którym wylądujesz. Po zabiciu wroga otrzymujesz na krótki czas trafienia krytyczne."
		//
		GASPASSER_NAME 			= "CIEPLNY CIĄG"
		GASPASSER_DESC 			= " Wskaźnik benzyny jest na początku pusty i resetuje się przy śmierci. Wymaga 150 000 pkt. obrażeń do napełnienia. Wybuch po podpaleniu zadaje 105 000 pkt. obrażeń."
		///
		FIREAXE_NAME 			= "TOPÓR STRAŻACKI"
		FIREAXE_DESC 			= " Standardowa opcja zapewniająca ochronę i mobilność."
		//
		AXTINGUISHER_NAME 		= "POSKRAMIACZ PŁOMIENI"
		AXTINGUISHER_DESC		= " Znacznie zwiększone obrażenia przeciw płonącym wrogom."
		//
		HOMEWRECKER_NAME 		= "BURZYCIEL"
		HOMEWRECKER_DESC 		= " Umożliwia natychmiastowe niszczenie konstrukcji Inżyniera z dowolnego miejsca dzięki nieograniczonemu zasięgowi ataku."
		//
		POWERJACK_NAME 			= "LEWAREK"
		POWERJACK_DESC 			= " Duża szybkość ataku i poruszania się. Wywołuje krwawienie i podpala wrogów przy trafieniu oraz zapewnia trafienia minikrytyczne po zabiciu przeciwnika."
		//
		BACKSCRATCHER_NAME 		= "DRAPACZKA"
		BACKSCRATCHER_DESC 		= " Zadaje śmiertelne obrażenia z tyłu. Po zabiciu wroga wchodzisz w stan furii, zyskując dodatkową szybkość ruchu, odporność i zwiększone obrażenia do wszystkich ataków."
		//
		VOLCANOFRAGMENT_NAME 	= "NAOSTRZONY FRAGMENT WULKANU"
		VOLCANOFRAGMENT_DESC 	= " Szansa na ogłuszenie wrogów przy trafieniu. Może podpalać wrogich Pyro."
		//
		POSTALPUMMELER_NAME 	= "POCZTOWY POGROMCA"
		POSTALPUMMELER_DESC 	= " Przy trafieniu we wroga: wywołuje dezorientację, powodując, że wrogowie przez krótki czas cofają się wzdłuż ścieżki przenoszenia bomby. Przytrzymanie ataku alternatywnego podczas ataku teleportuje cię z powrotem do strefy odradzania."
		//
		MAUL_NAME 				= "MAUL"
		MAUL_DESC 				= " Przy trafieniu we wroga: wyrzuca go w powietrze ze zmniejszoną siłą grawitacji."
		//
		THIRDDEGREE_NAME 		= "TRZECI STOPIEŃ"
		THIRDDEGREE_DESC 		= " Stajesz się niemal całkowicie odporny na obrażenia od ognia, gdy broń jest wyposażona, a także zyskujesz dużą odporność na wszystkie ataki dystansowe, gdy broń jest dobyta."
		//
		LOLLICHOP_NAME 			= "LIZASIEK"
		LOLLICHOP_DESC 			= " Co 10 zabójstw otrzymujesz ładunek zaklęcia deszcz meteorytów (wymaga założenia księgi zaklęć)."
		//
		NEONANNIHILATOR_NAME 	= "NISZCZYCIEL"
		NEONANNIHILATOR_DESC 	= " Twoja grawitacja jest zmniejszona."
		//
		HOTHAND_NAME 			= "GORĄCY PLASKACZ"
		HOTHAND_DESC 			= " Wyrzuca wrogów w powietrze przy trafieniu."
		//----------------------------
		//----------------------------
		//----------------------------
		GRENADELAUNCHER_NAME 	= "GRANATNIK"
		GRENADELAUNCHER_DESC	= " Standardowa opcja zapewniająca solidne obrażenia."
		//
		LOCHNLOAD_NAME 			= "LOCH-N-LOAD"
		LOCHNLOAD_DESC			= " Niska szybkostrzelność, ale duże obrażenia na wielkim obszarze. Dobrze się sprawdza w kontrolowaniu grup przeciwników."
		//
		ALIBABA_NAME			= "MALUTKIE BUTKI ALI BABY"
		ALIBABA_DESC			= " Zwiększone obrażenia od uderzenia tarczą. Zapewniają odporność na obrażenia od upadku."
		//
		BOOTLEGGER_NAME			= "KUTERNOGA"
		BOOTLEGGER_DESC			= " Zwiększona szybkość odnawiania szarży. Zapewnia odporność na obrażenia od upadku."
		//
		LOOSECANNON_NAME		= "DZIAŁO NAWALONE"
		LOOSECANNON_DESC		= " Załaduj do 4 kul armatnich, a następnie wystrzel wszystkie naraz w pionowym układzie rozrzutu. Kule armatnie eksplodują przy kontakcie z ziemią."
		//
		IRONBOMBER_NAME			= "ŻELAZNY BOMBARDIER"
		IRONBOMBER_DESC			= " Ignoruje odporności wrogów i przyznaje trafienia krytyczne po zabiciu przeciwnika. Nie wymaga amunicji i ma nieskończony magazynek. Pociski mogą odbijać się od ścian."
		///
		STICKYBOMB_NAME 		= "WYRZUTNIA BOMB SAMOPRZYLEPNYCH"
		STICKYBOMB_DESC 		= " Standardowa opcja zapewniająca solidne obrażenia. Można rozmieścić do 50 bomb samoprzylepnych."
		//
		SCOTTISHRES_NAME 		= "SZKOCKI OPÓR"
		SCOTTISHRES_DESC 		= " Bomba uzbraja się po 5 sekundach i wygasa po 10 sekundach, ale przy dobrym wyczuciu czasu i pełnym naładowaniu może zadawać ogromne obrażenia."
		//
		STICKYJUMPER_NAME 		= "BOMBOWY SKOCZEK"
		STICKYJUMPER_DESC 		= " Tworzy wyłączające pole, ogłuszając wszystkich wrogów trafionych impulsem (minibossowie są odporni na ogłuszenie)."
		//
		CHARGINTARGE_NAME 		= "TARCZA SZARŻY"
		CHARGINTARGE_DESC 		= " Mocna szarża – zwiększone obrażenia od uderzenia tarczą."
		//
		SPLENDIDSCREEN_NAME 	= "PRZEŚWIETNY PUKLERZ"
		SPLENDIDSCREEN_DESC 	= " Odnawiana szarża – zwiększona szybkość odnawiania szarży."
		//
		TIDETURNER_NAME 		= "STERBURTA"
		TIDETURNER_DESC 		= " Szybka szarża – zwiększona szybkość ruchu podczas szarży."
		//
		QUICKIEBOMB_NAME 		= "WYRZUTNIK SZYBKOBOMB"
		QUICKIEBOMB_DESC 		= " Automatycznie wystrzeliwuje bomby samoprzylepne z ekstremalną szybkostrzelnością i bardzo szybkim czasem uzbrajania. Przyznaje trafienia minikrytyczne po zabiciu wroga."
		///
		BOTTLE_NAME 			= "BUTELKA"
		BOTTLE_DESC 			= " Standardowa opcja zapewniająca ochronę i mobilność."
		//
		EYELANDER_NAME 			= "WYSZCZERBIEC"
		EYELANDER_DESC 			= " Duże obrażenia i szybkie ataki przyznające trafienia krytyczne i minikrytyczne po zabiciu wroga, lecz bez możliwości gry jako „hybrid-knight”."
		//
		SKULLCUTTER_NAME 		= "CZEREPOŁAMACZ SZKOTA"
		SKULLCUTTER_DESC 		= " Może przebijać się przez ÜberCharge wroga i zakłócać działanie mediguna. Zadaje także zwiększone obrażenia przeciwnikom tej samej klasy co ty."
		//
		CABER_NAME 				= "ULLAPOOLSKI PAL"
		CABER_DESC 				= " Zadawane obrażenia zwiększają się wraz z utratą twojego zdrowia. Poniżej 2% zdrowia zapewnia trafienia krytyczne. Eksplozja z takiego ataku powoduje twoją śmierć."
		//
		CLAIDHEAMHMOR_NAME 		= "CLAIDHEAMH MÒR"
		CLAIDHEAMHMOR_DESC 		= " Co 10 zabójstw otrzymujesz zaklęcia Monoculus (wymaga założenia księgi zaklęć)."
		//
		PERSIANPERSUADER_NAME 	= "PERSKA PERSWAZJA"
		PERSIANPERSUADER_DESC 	= " W połączeniu z tarczą zapewnia nieograniczoną szarżę. Szarża nie może zostać przerwana przez ostre skręcanie ani zderzenia ze ścianami, wrogami czy innymi przeszkodami. Zapewnia odporność na ogłuszenie."
		//
		NINEIRON_NAME 			= "ŻELAZNA NESSIE"
		NINEIRON_DESC 			= " Posiada ogromny zasięg zamachu, pozwalając trafić wielu wrogów naraz we wszystkich kierunkach. Zadaje podwójne obrażenia krytyczne."
		//
		SCOTTISHHANDSHAKE_NAME 	= "SZKOCKI UŚCISK DŁONI"
		SCOTTISHHANDSHAKE_DESC 	= " Gdy broń jest dobyta, 90% odporności na obrażenia z dystansu, odporność na odrzut i znaczny wzrost maksymalnego zdrowia. Nie możesz jednak odzyskiwać amunicji i otrzymujesz mniej zdrowia z apteczek."
		//----------------------------
		//----------------------------
		//----------------------------
		MINIGUN_NAME 			= "MINIGUN"
		MINIGUN_DESC 			= " Standardowa opcja zapewniająca solidne obrażenia. Po zabiciu wroga zyskujesz trafienia minikrytyczne na krótki czas."
		//
		NATASCHA_NAME 			= "NATASZA"
		NATASCHA_DESC 			= " Spowalnia wrogów przy trafieniu i nakłada piętno śmierci."
		//
		BRASSBEAST_NAME 		= "MOSIĘŻNA BESTIA"
		BRASSBEAST_DESC 		= " Zwiększone obrażenia, ale bardzo wolne rozkręcanie lufy. Szybkość poruszania jest ograniczona, gdy broń jest dobyta. Umożliwia odbijanie pocisków."
		//
		TOMISLAV_NAME 			= "TOMISŁAW"
		TOMISLAV_DESC 			= " Buduje ładunek „Nagrzanie” poprzez zadawanie obrażeń wrogom. Wszystkie statystyki tej broni rosną wraz z poziomem nagrzania. Zaczyna się schładzać, jeśli zbyt długo nie zadajesz obrażeń."
		//
		HUOHEATER_NAME 			= "WEJŚCIE SMOKA"
		HUOHEATER_DESC 			= " Wystrzeliwuje wiązki energii, podpalając wrogów przy trafieniu."
		//
		GENUINEHUOHEATER_NAME 	= "WEJŚCIE SMOKA (ORYGINAŁ)"
		GENUINEHUOHEATER_DESC 	= " Wystrzeliwuje rakiety. Zadaje obrażenia krytyczne płonącym wrogom."
		///
		SHOTGUN_HVY_NAME 		= "STRZELBA - GRUBY"
		SHOTGUN_HVY_DESC 		= " Pojedynczy strzał zadający duże obrażenia i przyznający trafienia krytyczne na 8 sekund po zabiciu wroga."
		//
		SANDVICH_NAME 			= "KANAPKA"
		SANDVICH_DESC 			= " Przywraca do 150 000 pkt. zdrowia. Każde otrzymane obrażenia, gdy ten przedmiot jest dobyty, powodują natychmiastową śmiercią."
		//
		DALOKOHSBAR_NAME 		= "TABLICZKA LADYCZEKO"
		DALOKOHSBAR_DESC 		= " Przywraca do 20 000 pkt. zdrowia. Użycie poniżej 350 pkt. zdrowia przyzna duże nadleczenie. Pasywnie zwiększa otrzymywane obrażenia, ale ma szansę na aktywowanie krótkiego ładunku ÜberCharge otrzymaniu obrażeń."
		//
		BUFFALOSTEAK_NAME 		= "STEK Z BIZONA"
		BUFFALOSTEAK_DESC 		= " Pasywnie zapewnia odporność na trafienia krytyczne."
		//
		FAMILYBUSINESS_NAME 	= "RODZINNY INTERES"
		FAMILYBUSINESS_DESC 	= " Nieskończona amunicja. Szybkostrzelność jest podwojona podczas otrzymywania leczenia. Przyznaje na krótki czas trafienia krytyczne i minikrytyczne po zabiciu wroga."
		//
		FISHCAKE_NAME 			= "CIASTKO RYBNE"
		FISHCAKE_DESC 			= " Duża odporność na obrażenia od NABOJÓW, ale większa podatność na obrażenia od OGNIA i EKSPLOZJI."
		//
		SECONDBANANA_NAME 		= "BANAN POCIESZENIA"
		SECONDBANANA_DESC 		= " Duża odporność na obrażenia od EKSPLOZJI, ale większa podatność na obrażenia od OGNIA i NABOJÓW."
		///
		FISTS_NAME 				= "PIĘŚCI"
		FISTS_DESC 				= " Standardowa opcja zapewniająca ochronę i mobilność. Skuteczne w walce."
		//
		KILLINGGLOVES_NAME 		= "KRYTYCZNE GRZMOTY BOKSERSKIE"
		KILLINGGLOVES_DESC 		= " Zdolność specjalna: „Megazgniot” – gdy jest dostępna, naciśnij klawisz działania stojąc na bombie, by natychmiast odesłać ją na początek. W przeciwnym razie otrzymasz tymczasowy bonus do szybkości ruchu, obrony i trafienia krytyczne."
		//
		GLOVESRUNNING_NAME 		= "GORĄCE RĘKAWICE UCIEKINIERA"
		GLOVESRUNNING_DESC 		= " Pasywnie umożliwia użycie spadochronu. Gdy broń jest dobyta, zyskujesz zwiększoną wysokość skoku, odporność na obrażenia i regenerację zdrowia."
		//
		BREADBITE_NAME 			= "CHLEBOGRYZARKA"
		BREADBITE_DESC 			= " Trafienia krytyczne nakładają na wroga efekt korozji - permanentny negatywny efekt, który zadaje obrażenia zależne od maksymalnego zdrowia i powodujący, że po śmierci przeciwnik eksploduje, pozostawiając małą żrącą chmurę, rozprzestrzeniając efekt na innych wrogów."
		//
		WARRIRORSSPIRIT_NAME 	= "DUSZA WOJOWNIKA"
		WARRIRORSSPIRIT_DESC 	= " Naciśnij lewy przycisk myszy, by wykonać wysoki skok. Wylądowanie na wrogach zadaje im ogromne obrażenia. Usuwa całą amunicję broni podstawowej i pomocniczej."
		//
		FISTSOFSTEEL_NAME 		= "PIĘŚCI ZE STALI"
		FISTSOFSTEEL_DESC 		= " Przekształca cię w gigantycznego pięściarza z 250 000 pkt. zdrowia. Jesteś odporny na odrzut i możesz zadawać duże obrażenia. Usuwa całą amunicję broni podstawowej i pomocniczej. Możesz leczyć się wyłącznie za pomocą własnych artykułów spożywczych."
		//
		EVICTIONNOTICE_NAME 	= "NAKAZ EKSMISJI"
		EVICTIONNOTICE_DESC 	= " Otrzymujesz szybkie leczenie po zabiciu wroga."
		//
		APOCOFISTS_NAME 		= "PIĄCHOKALIPSA"
		APOCOFISTS_DESC 		= " Ciosy odrzucają wrogów."
		//
		HOLIDAYPUNCH_NAME 		= "ŚWIĄTECZNY WIGOR"
		HOLIDAYPUNCH_DESC 		= " Gdy broń jest dobyta, wszyscy wrogowie ignorują cię. Zapewnia odporność na ogłuszenie. Nie zadaje żadnych obrażeń."
		//----------------------------
		//----------------------------
		//----------------------------
		SHOTGUN_ENGI_NAME		= "STRZELBA - INŻYNIER"
		SHOTGUN_ENGI_DESC 		= " Zadaje 4x większe obrażenia celowi twojego działka strażniczego."
		//
		FRONTIERJUSTICE_NAME 	= "SAMOSĄD"
		FRONTIERJUSTICE_DESC 	= " Szaleńczo duża szybkostrzelność. Pojemność magazynka równa się maksymalnej liczbie trafień krytycznych zemsty. Przeładowuje się szybciej podczas otrzymywania jakiegokolwiek leczenia."
		//
		WIDOWMAKER_NAME 		= "LIKWIDATOR"
		WIDOWMAKER_DESC 		= " Zużyj 2000 jedn. metalu, by wystrzelić rozproszony strzał odpychający wrogów."
		//
		POMSON_NAME 			= "POMSON 6000"
		POMSON_DESC 			= " Wywołuje krwawienie, podpala i spowalnia wrogów."
		//
		RESCUERANGER_NAME 		= "RYZYKOWNY RATUNEK"
		RESCUERANGER_DESC		= " Zużywa 20 jedn. metalu na strzał, ale nigdy nie wymaga przeładowania i zwiększa maksymalną ilość metalu o 1000 jednostek."
		///
		WRANGLER_NAME 			= "POSKRAMIACZ"
		WRANGLER_DESC 			= " Gdy broń jest dobyta, zwiększone obrażenia działka strażniczego i 2x większy zasięg działania zasobnika."
		//
		SHORTCIRCUIT_NAME 		= "KRÓTKIE SPIĘCIE"
		SHORTCIRCUIT_DESC 		= " Co 10 zabójstw otrzymujesz ładunek zaklęcia piorun kulisty (wymaga założenia księgi zaklęć)."
		///
		WRENCH_NAME 			= "KLUCZ"
		WRENCH_DESC 			= " Standardowa opcja zapewniająca solidne obrażenia."
		//
		GUNSLINGER_NAME 		= "JEDNORĘKI BANDYTA"
		GUNSLINGER_DESC	 		= " Umożliwia budowanie dodatkowego działka strażniczego. Trzy kolejne trafienia pod rząd mogą natychmiast zabijać słabszych wrogów i zadają ogromne obrażenia gigantom."
		//
		SOUTHERNHOS_NAME 		= "POŁUDNIOWA GOŚCINNOŚĆ"
		SOUTHERNHOS_DESC 		= " Zamienia normalne działko strażnicze na ogniste działko. Krótki zasięg, ale duże obrażenia."
		//
		JAG_NAME 				= "KIEŁ"
		JAG_DESC 				= " Działko strażnicze ma nieograniczony zasięg ataku."
		//
		EUREKAEFFECT_NAME 		= "EFEKT EUREKI"
		EUREKAEFFECT_DESC 		= " Podczas przenoszenia działka strażniczego wciśnij klawisz przeładowania, by zdalnie umieścić je na dowolnej ścianie lub suficie w twoim zasięgu."
		//----------------------------
		//----------------------------
		//----------------------------
		SYRINGEGUN_NAME			= "PISTOLET STRZYKAWKOWY"
		SYRINGEGUN_DESC			= " Każde trafienie we wroga przyznaje 0,5% ładunku ÜberCharge."
		//
		BLUTSAUGER_NAME			= "BLUTSAUGER"
		BLUTSAUGER_DESC			= " Wymaga i zużywa 100% ładunku ÜberCharge, by przeprogramować robota, który tymczasowo dołączy do twojej drużyny, po czym ulegnie samozniszczeniu. Atak alternatywny: usuń przeprogramowanie ze wszystkich swoich robotów."
		//
		CRUSADERSCROSSBOW_NAME	= "KUSZA KRZYŻOWCA"
		CRUSADERSCROSSBOW_DESC	= " Każde trafienie przyznaje 0,25% ładunku ÜberCharge, wywołuje krwawienie i przyznaje dodatkowe 0,5% ładunku ÜberCharge na każdą instancję obrażeń od krwawienia."
		//
		OVERDOSE_NAME 			= "KOŃSKA DAWKA"
		OVERDOSE_DESC 			= " Wymaga i zużywa 100% ładunku ÜberCharge, by wysłać ładunek wyłączający wszystkich pobliskich słabszych wrogów nawet na 15 sekund."
		///
		MEDIGUN_NAME			= "MEDIGUN"
		MEDIGUN_DESC			= " Limit nadleczenia zwiększony do 10x maksymalnego zdrowia pacjenta. Aktywuje długotrwałą tarczę przeciw pociskom poziomu 1."
		//
		KRITZKRIEG_NAME			= "KRITZKRIEG"
		KRITZKRIEG_DESC			= " Może wysysać zdrowie z wrogów, przyznając samoleczenie i budując ładunek ÜberCharge."
		//
		QUICKFIX_NAME			= "QUICK-FIX"
		QUICKFIX_DESC			= " Bardzo szybkie leczenie oraz tarcza przeciw pociskom poziomu 2. Może budować ładunek ÜberCharge poprzez zadawanie obrażeń za pomocą tarczy."
		//
		VACCINATOR_NAME			= "ZASZCZEPIACZ"
		VACCINATOR_DESC			= " Podczas leczenia ty i twój pacjent zyskujecie 100% odporności na podstawowe obrażenia wybranego rodzaju. ÜberCharge zapewnia pełną odporność na obrażenia wybranego rodzaju na 30 sekund."
		///
		BONESAW_NAME 			= "PIŁA DO KOŚCI"
		BONESAW_DESC			= " Standardowa opcja zapewniająca ochronę i mobilność. Każde trafienie we wroga przyznaje 10% ładunku ÜberCharge."
		//
		UBERSAW_NAME 			= "ÜBERPIŁA"
		UBERSAW_DESC			= " Przy trafieniu we wroga wywołuje krwawienie. Przyznaje 2% ładunku ÜberCharge przy trafieniu we wroga."
		//
		VITASAW_NAME 			= "VITA-PIŁA"
		VITASAW_DESC			= " Otrzymujesz ładunek zaklęcia nadleczenie przy trafieniu we wroga (wymaga założenia księgi zaklęć). Przyznaje 5% ładunku ÜberCharge przy trafieniu we wroga."
		//
		AMPUTATOR_NAME 			= "AMPUTATOR"
		AMPUTATOR_DESC			= " Przy trafieniu we wroga, twój medigun zostaje supernaładowany, tymczasowo zyskując zwiększone tempo leczenia, ładowania ÜberCharge i zasięg leczenia. Zabicie wroga przyznaje silniejszą wersję tego efektu."
		//
		SOLEMNVOW_NAME 			= "UROCZYSTA PRZYSIĘGA"
		SOLEMNVOW_DESC			= " Nieograniczony zasięg ataku, trafia wszystkich wrogów połączonych z celem promieniem mediguna i zadaje 200x większe obrażenia robomedykom. Przyznaje 5% ładunku ÜberCharge za każdego trafionego wroga."
		//----------------------------
		//----------------------------
		//----------------------------
		SNIPERRIFLE_NAME 		= "KARABIN SNAJPERSKI"
		SNIPERRIFLE_DESC 		= " W pełni naładowany strzał w głowę zadaje 450 000 pkt. obrażeń."
		//
		MACHINA_NAME 			= "MACHINA"
		MACHINA_DESC 			= " Bardzo wolne tempo ładowania strzału, ale przy pełnym naładowaniu zadaje duże obrażenia czołgom. Zabijanie wrogów wypełnia pasek furii, który przyznaje 1 sekundę trafień krytycznych. Połączenie trafień krytycznych z pełnym naładowaniem strzału pozwala natychmiast niszczyć większość napotkanych czołgów."
		//
		HITMANSHEATMAKER_NAME 	= "ZABAWKA ZAWODOWCA"
		HITMANSHEATMAKER_DESC 	= " Duża szybkostrzelność bez oddalenia widoku przy celowaniu przez lunetę. Nie zadaje obrażeń przy trafieniu w ciało."
		//
		AWPERHAND_NAME 			= "ALE WIELKA PUKAWKA"
		AWPERHAND_DESC 			= " Strzela wybuchowymi pociskami i generuje furie poprzez zabijanie wrogów. Przy w pełni naładowanej furii naciśnij klawisz przeładowania, by zwiększyć regenerację i maksymalne zdrowie. Strzał ładuje się tylko wtedy, gdy wrogowie znajdują się na twoim celowniku."
		//
		HUNTSMAN_NAME 			= "ŁOWCA"
		HUNTSMAN_DESC 			= " Wystrzeliwuje 5 strzał naraz. Zadaje ogromne obrażenia od podpalenia, jeśli Pyro podpali twoją strzałę."
		//
		SYDNEYSLEEPER_NAME 		= "SYDNEJSKI USYPIACZ"
		SYDNEYSLEEPER_DESC 		= " Wystrzeliwuje specjalną strzałkę, która spowalnia szybkość ruchu wszystkich wrogów (oprócz gigantów) i uniemożliwia przeciwnikom otrzymywanie leczenia od robomedyków."
		//
		BAZAARBARGAIN_NAME 		= "DALEKOSIĘŻNY DŻEZAIL"
		BAZAARBARGAIN_DESC 		= " Zabijanie z rzędu wrogów tej samej klasy zwiększa szybkostrzelność (maks. 3). Zabicie innej klasy resetuje kombo."
		//
		FORTIFIEDCOMPOUND_NAME 	= "BOJOWY ŁUK BLOCZKOWY"
		FORTIFIEDCOMPOUND_DESC 	= " Zmniejszone obrażenia w porównaniu do Łowcy, ale strzela szybciej, penetruje wrogów i zadaje obrażenia krytyczne mokrym przeciwnikom."
		//
		CLASSIC_NAME 			= "Klasyk"
		CLASSIC_DESC 			= " Strzela tak szybko, jak szybko pociągasz za spust, albo ładuje pojedynczy strzał wywołujący ogromny wybuchowy strzał w głowę, który niszczy wszystkich wrogów w promieniu wybuchu (oprócz gigantów)."
		///
		SMG_NAME 				= "PM"
		SMG_DESC 				= " Może zadawać znacznie większe obrażenia przy strzale w głowę. Atak alternatywny: przybliżenie i 100% celności kosztem zmniejszenia szybkostrzelności o połowę."
		//
		RAZORBACK_NAME 			= "ANTYKLINGA"
		RAZORBACK_DESC 			= " Bardzo szybki czas odnawiania i nakłada efekt Sikwondo na wroga, który cię zaatakował."
		//
		JARATE_NAME 			= "Sikwondo"
		JARATE_DESC 			= " Natychmiastowy czas odnawiania i spowalnia wrogów."
		//
		DARWIN_NAME 			= "DARWIŃSKA TARCZA OCHRONNA"
		DARWIN_DESC 			= " Zapewnia niemal pełną odporność na obrażenia od OGNIA, ale otrzymujesz o 50% więcej obrażeń od NABOJÓW i EKSPLOZJI."
		//
		COZYCAMPER_NAME 		= "WYGODNICKI WCZASOWICZ"
		COZYCAMPER_DESC 		= " Lekko zwiększona szybkość ruchu, regenerację i maksymalne zdrowie. Zapewnia odporność na podpalenie."
		//
		CLEANERSCARBINE_NAME 	= "SPLUWA SPRZĄTACZA"
		CLEANERSCARBINE_DESC 	= " Trafienia minikrytyczne trwają przez 30 sekund."
		//
		BEAUTYMARK_NAME 		= "SAMOŚWIADOMY PIEPRZYK"
		BEAUTYMARK_DESC 		= " Ześlij deszcz świętego ognia płonącymi strzałami. Atak alternatywny: wystrzeliwuje naraz salwę płonących strzał."
		///
		KUKRI_NAME 				= "KUKRI"
		KUKRI_DESC 				= " Standardowa opcja zapewniająca ochronę i mobilność."
		//
		TRIBALMANSSHIV_NAME 	= "PLEMIENNE OSTRZE"
		TRIBALMANSSHIV_DESC 	= " Przedmiot pomocniczy – grawitacja nie oddziałuje na tobie i możesz swobodnie latać."
		//
		BUSHWACKA_NAME 			= "BANDYTA Z BUSZU"
		BUSHWACKA_DESC 			= " Nieograniczony zasięg ataku i zadaje trafienia krytyczne płonącym wrogom."
		//
		SHAHANSHAH_NAME 		= "SZACHINSZACH"
		SHAHANSHAH_DESC 		= " Naciśnij lewy przycisk myszy, by wykonać wysoki skok, ułatwiając sobie dostęp do wysoko położonych miejsc. Zapewnia odporność na obrażenia od upadku."
		//----------------------------
		//----------------------------
		//----------------------------
		REVOLVER_NAME 			= "REWOLWER"
		REVOLVER_DESC 			= " Przy trafieniu we wroga: nakłada kilka negatywnych efektów; sprawia, że wrogowie przez krótki czas otrzymują zwiększone obrażenia, wyczerpuje ÜberCharge wrogich Medyków i zmusza roboszpiegów do usunięcia swoich przebrań. Może ogłuszać znajdujących się w powietrzu przeciwników."
		//
		AMBASSADOR_NAME 		= "AMBASADOR"
		AMBASSADOR_DESC 		= " Zadaje ogromne obrażenia przy strzale w głowę. Obrażenia są podwójne, jeśli nie jesteś przebrany."
		//
		LETRANGER_NAME 			= "L'ETRANGER"
		LETRANGER_DESC 			= " Może zabijać każdego słabszego wroga jednym strzałem. Nie zadaje jednak żadnych obrażeń gigantom ani czołgom."
		//
		ENFORCER_NAME 			= "EGZEKUTOR"
		ENFORCER_DESC 			= " Ignoruje odporności na obrażenia i gromadzi jeden strzał krytyczny za każde dźgnięcie w plecy lub zniszczenie konstrukcji przy użyciu sapera."
		//
		DIAMONDBACK_NAME 		= "GRZECHOTNIK"
		DIAMONDBACK_DESC 		= " Tworzy czarną dziurę, która wciąga wrogów."
		///
		SAPPER_NAME 			= "SAPER"
		SAPPER_DESC 			= " Maksymalny zasięg i czas trwania ogłuszenia. Szybki czas odnawiania."
		//
		REDTAPE_NAME 			= "MAGNETOFON URZĘDASA"
		REDTAPE_DESC 			= " Natychmiast niszczy konstrukcje Inżyniera, ale może sapować tylko jednego wroga naraz."
		///
		KNIFE_NAME 				= "NÓŻ"
		KNIFE_DESC 				= " Gdy broń jest dobyta, stopniowo wysysa twoje zdrowie, ale zapewnia odporność na WSZYSTKIE obrażenia. Zabijanie wrogów przywraca zdrowie."
		//
		YOURETERNALREWARD_NAME 	= "OSTATECZNA NAGRODA"
		YOURETERNALREWARD_DESC 	= " Zadawane obrażenia rosną wraz ze spadkiem twojego poziomu zdrowia. Poniżej 10% zdrowia zadajesz obrażenia krytyczne, ale tylko od ataków z przodu. Zapewnia 90% odporności na obrażenia."
		//
		KUNAI_NAME 				= "KUNAI KRĘTACZA"
		KUNAI_DESC 				= " Nieograniczony zasięg ataku. Dźgnięcia w plecy wywołują eksplozję, zadając dodatkowe obrażenia pobliskim wrogom."
		//
		BIGEARNER_NAME 			= "GRUBA RYBA"
		BIGEARNER_DESC 			= " Masz ogromną ilość zdrowia, a „chybione” zamachy powodują szybkie leczenie, jednak otrzymujesz obrażenia od ognia sojuszniczego."
		//
		WANGAPRICK_NAME 		= "KŁUJKA VOODOO"
		WANGAPRICK_DESC 		= " Zabicie wroga natychmiast aktywuje niewidzialność na kilka sekund. Możesz atakować przeciwników będąc niewidzialnym, by wydłużyć czas trwania niewidzialność. Nie możesz używać przebrań."
		//
		SHARPDRESSER_NAME 		= "ZABÓJCZA ELEGANCJA"
		SHARPDRESSER_DESC 		= " Dźgnięcia w plecy wywołują eksplozję, zadając dodatkowe obrażenia pobliskim wrogom."
		//
		SPYCICLE_NAME 			= "ZAMROŻONY AGENT"
		SPYCICLE_DESC 			= " „Chybiony” zamach powoduje, że wybijasz się w powietrze, umożliwiając wykonywanie tzw. „surf-stabów”, ale nie możesz używać przebrań. Dźgnięcia w plecy zadają ogromne obrażenia gigantom."
		///
		INVISWATCH_NAME 		= "ZEGAREK NIEWIDZIALNOŚCI"
		INVISWATCH_DESC 		= " Nieograniczona niewidzialność i +10% szybkości ruchu."
		//
		DEADRINGER_NAME 		= "DZWON ZMARŁEGO"
		DEADRINGER_DESC 		= " Aktywacja wywołuje krótki zryw, pozwalający na odskok w dowolnym kierunku. Podczas odskoku otrzymywane obrażenia są zmniejszone o 80%."
		//
		CLOAKANDDAGGER_NAME		= "PELERYNA NOŻOWNIKA"
		CLOAKANDDAGGER_DESC		= " Natychmiastowa aktywacja i dezaktywacja niewidzialności."
		//----------------------------
		//----------------------------
		//----------------------------
		FRYINGPAN_NAME 				= "PATELNIA"
		FRYINGPAN_DESC 				= " Zadaje 30x większe obrażenia wrogom tej samej klasy co ty oraz przyznaje trafienia krytyczne po zabiciu wroga."
		//
		SAXXY_NAME 					= "SAXXY"
		SAXXY_DESC 					= " Zadaje 30x większe obrażenia wrogom tej samej klasy co ty oraz przyznaje trafienia krytyczne po zabiciu wroga."
		//
		MEMORYMAKER_NAME 			= "WSPOMNIENIOTWÓRCA"
		MEMORYMAKER_DESC			= " Zadaje 30x większe obrażenia wrogom tej samej klasy co ty oraz przyznaje trafienia krytyczne po zabiciu wroga."
		//
		CONOBJECTOR_NAME			= "OBDŻEKTOR"
		CONOBJECTOR_DESC			= " Co 10 zabójstw otrzymujesz losowe zaklęcie (wymaga założenia księgi zaklęć)."
		//
		FREEDOMSTAFF_NAME 			= "KOSTUR WOLNOŚCI"
		FREEDOMSTAFF_DESC 			= " Niewielka szansa przy otrzymaniu obrażeń na uniknięcie ataku i uzyskanie ÜberCharge na 3 sekundy."
		//
		BATOUTTAHELL_NAME 			= "PIEKIELNA PAŁKA"
		BATOUTTAHELL_DESC 			= " Gdy broń jest dobyta, zapewnia pełną niewrażliwość na obrażenia oraz ogromne nadleczenie, lecz jesteś podatny na odrzut."
		//
		HAMSHANK_NAME 				= "ZAKOSZONA GOLONKA"
		HAMSHANK_DESC 				= " Zdolność specjalna: „Witalne odrodzenie” – gdy jest dostępna, naciśnij klawisz działania, by natychmiast uzyskać 10x nadleczenia i odporność na odrzut przez 20 sekund."
		//
		NECROSMASHER_NAME 			= "NEKROZGNIATACZ"
		NECROSMASHER_DESC 			= " Zdolność specjalna: „Pojazdowa masakra” – gdy jest dostępna, naciśnij klawisz działania, by wskoczyć do samochodziku. W tym stanie jesteś niewrażliwy na obrażenia, regenerujesz zdrowie i możesz rozjeżdżać wrogów."
		//
		CROSSINGGAURD_NAME 			= "ZAWIADOWCA"
		CROSSINGGAURD_DESC 			= " Zyskujesz ogromną odporność na wszystkie ataki wręcz, w tym dźgnięcia w plecy."
		//
		PRINNYMACHETE_NAME 			= "MACZETA PRINNYCH"
		PRINNYMACHETE_DESC 			= " Przedmiot pomocniczy – zamachnij się tą bronią, by wybić się do przodu z dużą prędkością. Zapewnia odporność na obrażenia od upadku."
		//------------------------------------
	}
	japanese = {
		IH_TRANSLATE_ITEM		= IH_color + "[%s]" + IH_text_color + "%s"
		IH_INCLUDES				= IH_color_header + "[►]\x0826beffBB 装備内容："
		IH_DIS_MSG_2			= IH_disable_color + "Type '/itemhelp 1' ウェーブ中にこれらのメッセージを表示しないようにする \nType '/itemhelp 0' これらのメッセージを完全に無効にする"
		IH_DIS_MSG				= IH_disable_color + "Type '/itemhelp 0' これらのメッセージを非表示にする \nType '/itemhelp 2' このメッセージを常に表示する"
		IH_BAD_ARGS				= IH_color_header + "[Item Helper]" + IH_error_color + " {エラー}\x01 引数が正しくありません!\n/itemhelp 2 - Enable\n/itemhelp 1 - セットアップ中のみ有効にする\n/itemhelp 0 - Disable"
		IH_OOB_ARG				= IH_color_header + "[Item Helper]" + IH_error_color + " {エラー}\x01 範囲外の値が設定されました! : %s"
		IH_HELP_MSG				= IH_color_header + "[Item Helper]\x01 アイテムヘルパーは、各カオスアイテムについて簡単な説明を提供します \x03Chaos\x01 Item!"
		IH_DISABLE				= IH_color_header + "[►]\x01 アイテムヘルパーが無効になっています"
		IH_WAVE_SETUP			= IH_color_header + "[►]\x01 アイテムヘルパーは、セットアップ中のみ有効になっています"
		IH_ENABLE 				= IH_color_header + "[►]\x01 アイテムヘルパーが有効になっています"
		LOW_METAL 				= "メタルが足りません"
		TOMISLAV_HEAT			= "Tomislav　ヒート: %s%%"
		STUCK_RESPAWNED 		= "スタック解消のため、リスポーンしました."
		ABILITY_READY			= "%s\n► 準備完了 ◄"
		ABILITY_CHARGING		= "%s\n%s"
		ABILITY_CHARGING_MSG	= "チャージ: %ss"
		ABILITY_CHARGING_D_MSG	= "チャージ: %s%%"
		MEGACRUSH 				= "メガクラッシュ"
		VITALRESURGENCE 		= "バイタル・リサージェンス"
		VEHICULARMANNSLAUGHTER 	= "バンパーカー・マンズローター"
		TEST 					= "Test Ability" // Dont Translate this
		NO_MONEY				= "You can't afford this! (Cost: $%s, you have: $%s)" // Dont Translate this, my own project
		REPROG_BOT_STRONG		= TF_TEAM_COLOR_REPROG_B+"%s\x01 耐性があり、再プログラムできませんでした"
		REPROG_BOT_NOT_SUIT		= TF_TEAM_COLOR_REPROG_B+"%s\x01 戦闘には適しておらず、再プログラムもできませんでした"
		REPROG_BOT_LEAVE		= TF_TEAM_COLOR_SPEC+"%s died."
		REPROG_BOT_MESSAGE 		= TF_TEAM_COLOR_RED+"%s\x01 再プログラム完了 "+TF_TEAM_COLOR_REPROG_B+"%s\x01!"
		//---------------------------------------------------------
		CHECKPOINT_CREATED		= "\x077c8cc2Checkpoint created:\x078165cf [/%s]"
		CHECKPOINT_WRONG_MAP	= CHECKPOINT_ERROR+"そのチェックポイントは、このマップでは設定されていません"
		CHECKPOINT_WRONG_MISS	= CHECKPOINT_ERROR+"そのチェックポイントは、今回の任務のために設置されたものではありません"
		CHECKPOINT_EXPIRE		= CHECKPOINT_ERROR+"そのチェックポイントは期限が切れています"
		CHECKPOINT_RESTORE		= "\x0744CC44最後に保存されたチェックポイントに戻りました"
		CHECKPOINT_RESTORE_HUD	= "最後に保存されたチェックポイントに戻りました"
		//---------------------------------------------------------
		SCATTERGUN_NAME 		= "散弾銃"
		SCATTERGUN_DESC 		= " 安定したダメージを与えられる頼もしい選択肢　特に至近距離での威力が抜群である"
		//
		FORCENATURE_NAME		= "フォース・ア・ネイチャー"
		FORCENATURE_DESC		= " 弾の命中時にノックバック付くが、散弾銃よりはDPSが低くなっている"
		//
		SHORTSTOP_NAME 			= "SHORTSTOP"
		SHORTSTOP_DESC 			= " とんでもない発射速度で、濡れている敵に対してクリティカルヒットする、だがリロードが遅い"
		//
		SODAPOPPER_NAME 		= "ソーダポッパー"
		SODAPOPPER_DESC 		= " メイン攻撃キーで4連バーストを素早く装填する"
		//
		BABYFACEBLASTER_NAME	= "ベビーフェイス・ブラスター"
		BABYFACEBLASTER_DESC	= " メイン攻撃キーを押し続けると最大200発の連射が可能で、至近距離ならあらゆるものを粉砕する、ただし反動が非常に強い"
		//
		BACKSCATTER_NAME		= "バックスキャッター"
		BACKSCATTER_DESC		= " 背後から撃てば必ずクリティカルヒットとなり弾薬は不要で、弾倉の容量は無限だ"
		///
		PISTOL_NAME 			= "ピストル"
		PISTOL_DESC 			= " 弾丸の代わりにロケット弾を発射する、機動力においては非常に効果的だ"
		//
		BONK_NAME 				= "喉ごしガツン! アトミックパンチ"
		BONK_DESC 				= " 強化されたソーダ...効果中攻撃能力を失うことなく、無敵の状態を付与される"
		//
		CRITACOLA_NAME 			= "クリティコーラ"
		CRITACOLA_DESC 			= " 強化されたソーダ...効果中クリティカルを付与される"
		//
		MADMILK_NAME 			= "MAD MILK"
		MADMILK_DESC 			= " このミルク？を浴びた敵は動けなくなる"
		//
		WINGER_NAME 			= "ウィンガー"
		WINGER_DESC 			= " 発動中は空中ジャンプが無制限になり空中にいる間、常にクリティカルヒットとなる一発の集中射撃を放つ事ができる、しかもこの攻撃には敵を吹き飛ばす効果もある"
		//
		PRETTYBOYS_NAME 		= "プリティ・ボーイズ・ポケット・ピストル"
		PRETTYBOYS_DESC 		= " ターゲットの体力を基にダメージを与えるロケット弾を発射する事ができる　ターゲットが負傷するにつれてダメージが増加し、距離の影響を受けない　サブ攻撃キー：ダメージが20%減少する代わりに、追尾ロケットを使用する"
		//
		CLEAVER_NAME 			= "フライングギロチン"
		CLEAVER_DESC 			= "ヨンドゥの矢：知性を持つ矢を召喚し、戦闘を支援する　サブ攻撃キー：破壊者モード、与ダメージ-75%。"
		//
		MATATEDMILK_NAME 		= "ミュータテッド・ミルク"
		MATATEDMILK_DESC 		= " 連射でミルク？瓶を投げ、敵にダメージを与える。サブ攻撃キー：ミルク？瓶の束を一気に投げつける"
		///
		BAT_NAME 				= "バット"
		BAT_DESC 				= " 死を無効化し、HP1でスポーン地点へテレポートするチャンスを得られる"
		//
		SANDMAN_NAME			= "SANDMAN"
		SANDMAN_DESC 			= " 大容量かつ高速リチャージにより、野球のボールを連射することができ、単体のターゲットに多大なバーストダメージを与える"
		//
		HOLYMACKEREL_NAME		= "HOLY MACKEREL"
		HOLYMACKEREL_DESC		= " 複数の敵に「死のマーキング」を付けることができる"
		//
		CANDYCANE_NAME 			= "キャンディケーン"
		CANDYCANE_DESC 			= " 便利アイテム - 重力がなくなり、自由に飛ぶことができる"
		//
		BOSTONBASHSER_NAME 		= "ボストン・バッシャー"
		BOSTONBASHSER_DESC 		= " ハイリスク・ハイリターン　ほとんどの小型敵を一撃で倒すことができ、10秒間のクリティカル率上昇効果を得られる　メディガンのビームでつながっている敵にもダメージが及ぶ　ただし一度でも外すと即死する"
		//
		SUNONASTICK_NAME		= "サン・オン・ア・スティック"
		SUNONASTICK_DESC		= " 敵をスタンさせたり、短時間のクリティカル率上昇効果を得たりするチャンスを得る　メディガンのビームでつながっている敵にもダメージが及ぶ　ただし外れた場合は自分がスタン状態になる"
		//
		FANOWAR_NAME 			= "ファン・オウォー"
		FANOWAR_DESC 			= " 便利アイテム - この近接武器を振りかざすと高速で前方に突進する　落下ダメージを無効化する"
		//
		ATOMIZER_NAME 			= "アトマイザー"
		ATOMIZER_DESC 			= " 通常攻撃ではダメージを与えることができませんが、タウントキルに成功すると、3分間クリティカル率上昇効果が得られる"
		//
		THREERUNEBLADE_NAME 	= "3つのルーンブレード"
		THREERUNEBLADE_DESC 	= " 発動中は、移動速度が大幅に上昇し、3段ジャンプが可能になる　落下ダメージを無効化する"
		//
		UNARMEDCOMBAT_NAME 		= "アンアームドコンバット"
		UNARMEDCOMBAT_DESC 		= " 10キルごとに、スケルトン召喚の呪文チャージを1つ獲得する（魔術書が必要）"
		//
		WRAPAASSASSIN_NAME 		= "ラップアサシン"
		WRAPAASSASSIN_DESC 		= " 飛んでくる投射物を軽々と打ち返すことができる　また、スタン効果を無効化する"
		//----------------------------
		//----------------------------
		//----------------------------
		ROCKETLAUNCHER_NAME		= "ロケットランチャー"
		ROCKETLAUNCHER_DESC		= " 安定したダメージを与えられる頼もしい選択肢"
		//
		DIRECTHIT_NAME			= "ダイレクトヒット"
		DIRECTHIT_DESC			= " サブ攻撃キー：敵を空中に打ち上げ、簡単にミニクリティカルを叩き込める　ロケット弾にはわずかな照準アシスト機能が付く"
		//
		BLACKBOX_NAME			= "BLACK BOX"
		BLACKBOX_DESC			= " 敵の動きを鈍らせ、出血ダメージを与える　この武器はソルジャーボットに対して2倍のダメージを与える"
		//
		ROCKETJUMPER_NAME		= "ROCKET JUMPER"
		ROCKETJUMPER_DESC		= " 発射速度とリロード速度は遅いものの、威力が大きく、爆風範囲も広い　群衆に対して最適な選択肢だ"
		//
		LIBERTYLAUNCHER_NAME	= "リバティー・ランチャー"
		LIBERTYLAUNCHER_DESC	= " 移動速度の遅いロケットを発射し、広範囲に甚大なダメージを与える　リロード速度が非常に遅く、弾薬も少ない　この武器は装填されると自動的に発射される"
		//
		COWMANGLER_NAME			= "カウ・マングラー 5000"
		COWMANGLER_DESC			= " 命中すると小型の敵を動けなくする　チャージショットは敵の動きをより長く停止させる　サブ攻撃キーを押しながら発射すると武器がオーバーチャージされ、連射が可能になり、停止時間がさらに長くなる"
		//
		ORIGINAL_NAME			= "オリジナル"
		ORIGINAL_DESC			= " メイン攻撃キーを長押しすると、最大4発のロケット弾を装填できます　装填が完了すると、この武器は自動的に発射される"
		//
		BEGGARSBAZOOKA_NAME		= "ベガーのバズーカ"
		BEGGARSBAZOOKA_DESC		= " メイン攻撃キー長押しで発射を留め、最大100発のロケット弾を装填し、一斉に放て　過充填なし"
		//
		AIRSTRIKE_NAME			= "エアストライク"
		AIRSTRIKE_DESC			= " 最大10発のロケット弾を装填し、固定された散弾パターンで一斉に発射する　ロケット弾は自動的に敵を追尾する"
		///
		SHOTGUN_SOLD_NAME 		= "ショットガン - ソルジャー"
		SHOTGUN_SOLD_DESC 		= " ロケットジャンプ中は、発射速度が非常に速く、クリティカルヒットも発生しやすくなる"
		//
		SHOTGUN_NAME 			= "ショットガン"
		SHOTGUN_DESC 			= " 安定したダメージを与えられる頼もしい選択肢"
		//
		BUFFBANNER_NAME 		= "バフ・バナー"
		BUFFBANNER_DESC 		= " バフの射程が無制限になり、持続時間が大幅に延長された"
		//
		GUNBOATS_NAME 			= "GUNBOATS"
		GUNBOATS_DESC 			= " ジャンプキーを押し続ける事でバニーホップが可能にする　落下ダメージを無効化する"
		//
		BATTALIONS_NAME 		= "BATTALION'S BACKUP"
		BATTALIONS_DESC 		= " バフの射程が無制限になり、持続時間が大幅に延長された"
		//
		CONCHEROR_NAME 			= "カンケラー"
		CONCHEROR_DESC 			= " バフの射程が無制限になり、持続時間が大幅に延長された"
		//
		RESERVESHOOTER_NAME 	= "リザーブ・シューター"
		RESERVESHOOTER_DESC 	= " 射程に関係なく、1発につき10,000の固定ダメージを与え、敵を倒すと3秒間ミニクリティカルが発生する　ただし、この武器はクリティカル倍率の恩恵を受けず、タンクにはダメージを与えられない　サブ攻撃キーでズームイン使用可能"
		//
		BISON_NAME 				= "ライチャス・バイソン"
		BISON_DESC 				= " 完全自動照準で、貫通ダメージを与えるビームを連続して発射する"
		//
		MANTREADS_NAME 			= "マントレッズ"
		MANTREADS_DESC 			= " ダメージによるノックバックが大幅に軽減され、空中ストレイフの加速力が大幅にアップした　踏みつけ攻撃のダメージが強化され、移動速度に比例するようになった"
		//
		BASEJUMPER_NAME 		= "B.A.S.E. ジャンパー"
		BASEJUMPER_DESC 		= " パラシュートの開閉が可能　ノックバックや銃弾によるダメージへの耐性が上がり、空中の無防備な状態を軽減"
		//
		PANICATTACK_NAME 		= "パニック・アタック"
		PANICATTACK_DESC 		= " 緊急で回復が必要な時に命中すると、最大10,000のHPを即座に回復する　この武器が有効な状態でダメージを受けると、短時間のセルフ・ユーバーが発動する可能性がある"
		///
		SHOVEL_NAME 			= "シャベル"
		SHOVEL_DESC 			= " 防御と機動性のための標準的な選択肢"
		//
		EQUALIZER_NAME 			= "イコライザー"
		EQUALIZER_DESC 			= " タウント攻撃は、大ダメージを与え、敵を空中に吹き飛ばす"
		//
		PAINTRAIN_NAME 			= "ペイントレイン"
		PAINTRAIN_DESC 			= " 命中すると出血と移動速度低下を付与する　落下ダメージを無効化する"
		//
		HALFZATOICHI_NAME 		= "ハーフ座頭市"
		HALFZATOICHI_DESC 		= " 平均的なダメージを与え高い体力と機動性を兼ね備え、攻撃範囲も拡大された"
		//
		MARKETGARDENER_NAME 	= "マーケットガーデナー"
		MARKETGARDENER_DESC 	= " クリティカルダメージが大幅に上昇する　敵を倒すとレイジ状態となり、HPと耐性が上昇し、すべての攻撃のダメージが増加する　ただし、攻撃が外れると即死する"
		//
		DISCIPLINARYACTION_NAME = "懲戒ムチ"
		DISCIPLINARYACTION_DESC	= " 防御と機動性のための標準的な選択肢"
		//
		ESCAPEPLAN_NAME			= "ESCAPE PLAN"
		ESCAPEPLAN_DESC			= " 防御と機動性のための標準的な選択肢"
		//----------------------------
		//----------------------------
		//----------------------------
		FLAMETHROWER_NAME 		= "火炎放射器"
		FLAMETHROWER_DESC		= " 安定したダメージを与えられる頼もしい選択肢　敵を倒すと、短時間ミニクリティカルボーナスが得られる"
		//
		BACKBURNER_NAME 		= "バックバーナー"
		BACKBURNER_DESC			= " グリーンファイア - 敵に「死のマーキング」を付け、空中の敵を短時間スタンさせる　この武器はパイロボットに対して2倍のダメージを与える"
		//
		DEGREASER_NAME 			= "DEGREASER"
		DEGREASER_DESC			= " 長距離火炎放射器で、高い炎ダメージを与えるが、炎上ダメージは0である　この火炎放射器はエアブラストを発動できない"
		//
		PHLOGISTINATOR_NAME 	= "フロギストネイター"
		PHLOGISTINATOR_DESC		= " グリーンファイア - 敵に「死のマーキング」を付け、空中の敵を短時間スタンさせる　タンクに対して強力だが、移動速度が低下する"
		//
		RAINBLOWER_NAME 		= "レインブロワー"
		RAINBLOWER_DESC			= " 長距離の火炎放射器で、炎ダメージは低いが、炎上ダメージは高い　また、エンジニアの建造物を瞬時に破壊したり、敵のパイロを炎上したりすることもできる　エアブラストの威力は弱いものの、非常に速い"
		//
		DRAGONSFURY_NAME 		= "ドラゴンズフューリー"
		DRAGONSFURY_DESC		= " 発射速度とエアブラスト速度が大幅に増加"
		//
		NOSTROMONAPALMER_NAME 	= "ノストロモ・ナパーマー"
		NOSTROMONAPALMER_DESC	= " 命中すると敵の移動速度を低下させる　フロギストネイターと同様に「Mmmph」チャージを蓄積し、自身に「カンケラー」バフを付与する　この火炎放射器はエアブラストを発動できない"
		///
		SHOTGUN_PYRO_NAME 		= "ショットガン - パイロ"
		SHOTGUN_PYRO_DESC 		= " 燃えているプレイヤーに対して 100% クリティカルヒット"
		//
		FLAREGUN_NAME 			= "フレアガン"
		FLAREGUN_DESC 			= " 敵を貫通するヒットスキャン攻撃を発動する　経路上の敵を貫通するたびに、ダメージが指数関数的に増加する　また、命中時に敵をスタンさせる可能性がある"
		//
		DETONATOR_NAME 			= "雷管"
		DETONATOR_DESC 			= " フレア弾の爆発範囲は無限で、視界内にあるあらゆる対象に命中する　すべてのスパイボットをステルス状態から解除し、変装を解除させる　機動性を高めるのにも最適な選択肢だ"
		//
		MANMELTER_NAME 			= "マンメルター"
		MANMELTER_DESC 			= " 敵を自動的に探知する高速発射型フレア弾を発射する　弾薬は無制限で、リロードも不要　サブ攻撃キー：フレア弾を一斉に発射する"
		//
		SCORCHSHOT_NAME 		= "スコーチ・ショット"
		SCORCHSHOT_DESC 		= " 命中時：大ダメージを与え、敵の炎を消化し、ノックバックさせる　ターゲットが炎に包まれていなければならず、そうでない場合、効果を発揮しない　サブ攻撃キー：低速追尾フレア弾を発射する"
		//
		THERMALTHRUSTER_NAME 	= "サーマルスラスター"
		THERMALTHRUSTER_DESC 	= " 発射の遅延がなく、燃料消費も抑えられる　空中での再展開が可能で、踏みつけによる大ダメージを与えることができる　敵を倒すと、一時的にクリティカル率が高まる"
		//
		GASPASSER_NAME 			= "ガスパサー"
		GASPASSER_DESC 			= " メーターは空の状態から始まり、死亡時にリセットされる　150,000のダメージを与えるとメーターが満タンとなる　「点火時に爆発」の効果で105,000のダメージを与える"
		///
		FIREAXE_NAME 			= "消防斧"
		FIREAXE_DESC 			= " 防御と機動性のための標準的な選択肢"
		//
		AXTINGUISHER_NAME 		= "アクスティングイシャー"
		AXTINGUISHER_DESC		= " 燃えている敵へのダメージが大幅に増加する"
		//
		HOMEWRECKER_NAME 		= "ホームレッカー"
		HOMEWRECKER_DESC 		= " 近接攻撃の射程が無限であるため、どこからでもエンジニアの建造物を瞬時に破壊できる"
		//
		POWERJACK_NAME 			= "POWERJACK"
		POWERJACK_DESC 			= " 素早い攻撃と移動速度、命中時に敵に出血と炎上効果を与え、敵を倒すとミニクリティカルを獲得する"
		//
		BACKSCRATCHER_NAME 		= "バックスクラッチャー"
		BACKSCRATCHER_DESC 		= " 背後から致命的なダメージを与える　敵を倒すとレイジ状態となり、移動速度と耐性が上昇し、すべての攻撃のダメージが増加する"
		//
		VOLCANOFRAGMENT_NAME 	= "研ぎ澄まされた火山の破片"
		VOLCANOFRAGMENT_DESC 	= " 攻撃が命中した際に敵をスタンさせる可能性がある　また、敵のパイロに炎上効果を与えることもできる"
		//
		POSTALPUMMELER_NAME 	= "ポスタル・パメラー"
		POSTALPUMMELER_DESC 	= " 命中時：混乱状態を付与し、敵を短時間、爆弾の軌跡に沿って後退させる　攻撃時にサブ攻撃キーを押したままにすると、スポーン地点へテレポートする"
		//
		MAUL_NAME 				= "モール"
		MAUL_DESC 				= " 命中時：敵を空中に吹き飛ばし、重力を低下させる"
		//
		THIRDDEGREE_NAME 		= "サードディグリー"
		THIRDDEGREE_DESC 		= " 装備中は火ダメージに対してほぼ無敵となり、発動中はすべての遠距離攻撃に対して追加の重耐性が付与される"
		//
		LOLLICHOP_NAME 			= "ロリチョップ"
		LOLLICHOP_DESC 			= " 10キルごとに、メテオストームの呪文チャージを1つ獲得する（魔術書が必要）"
		//
		NEONANNIHILATOR_NAME 	= "ネオンアナイレイター"
		NEONANNIHILATOR_DESC 	= " 重力が軽減される"
		//
		HOTHAND_NAME 			= "ホットハンド"
		HOTHAND_DESC 			= " 命中時に敵を空中に吹き飛ばす"
		//----------------------------
		//----------------------------
		//----------------------------
		GRENADELAUNCHER_NAME 	= "グレネードランチャー"
		GRENADELAUNCHER_DESC	= " 安定したダメージを与えられる頼もしい選択肢"
		//
		LOCHNLOAD_NAME 			= "ロックンロード"
		LOCHNLOAD_DESC			= " 発射速度は遅いものの、広範囲に高い瞬間火力を発揮する　群衆に対し効果的"
		//
		ALIBABA_NAME			= "ALI BABA'S WEE BOOTIES"
		ALIBABA_DESC			= " シールドバッシュのダメージが増加し　落下ダメージを無効化する"
		//
		BOOTLEGGER_NAME			= "ブートレガー"
		BOOTLEGGER_DESC			= " シールドのチャージ回復速度が向上し　落下ダメージを無効化する"
		//
		LOOSECANNON_NAME		= "ルースキャノン"
		LOOSECANNON_DESC		= " 最大4発の砲弾を装填し、垂直方向に一斉射撃できる　砲弾は地面に接触すると爆発する"
		//
		IRONBOMBER_NAME			= "アイアンボンバー"
		IRONBOMBER_DESC			= " 敵の耐性を無視し、敵を倒すと短時間クリティカル率アップの効果を得る　弾薬を消費せず、弾倉は無限である　弾は壁に跳ね返る"
		///
		STICKYBOMB_NAME 		= "粘着爆弾ランチャー"
		STICKYBOMB_DESC 		= " 安定したダメージを与えられる頼もしい選択肢　50個の爆弾を設置可能"
		//
		SCOTTISHRES_NAME 		= "スコットランドレジスタンス"
		SCOTTISHRES_DESC 		= " 爆弾は起爆までに5秒かかり、10秒後に不発となるが、タイミングをうまく合わせ、フルチャージすれば圧倒的なダメージを与えることができる"
		//
		STICKYJUMPER_NAME 		= "スティッキージャンパー"
		STICKYJUMPER_DESC 		= " 停止フィールドを生成し、衝撃波が当たったすべての敵をスタン状態にする（ミニボスにはスタン効果が効きません）"
		//
		CHARGINTARGE_NAME 		= "チャージン・ターゲット"
		CHARGINTARGE_DESC 		= " ヘビーチャージ - シールドバッシュのダメージが大幅に増加する"
		//
		SPLENDIDSCREEN_NAME 	= "スプレンディッド・スクリーン"
		SPLENDIDSCREEN_DESC 	= " 急速チャージ - シールドの回復速度が大幅に向上"
		//
		TIDETURNER_NAME 		= "タイド・ターナー"
		TIDETURNER_DESC 		= " バーストチャージ - シールドチャージ時の移動速度が向上"
		//
		QUICKIEBOMB_NAME 		= "クイックボムランチャー"
		QUICKIEBOMB_DESC 		= " 粘着爆弾を信じられないほどの速さで自動発射し、チャージ時間も極めて短い　敵を倒すとミニクリティカルが発生する"
		///
		BOTTLE_NAME 			= "ボトル"
		BOTTLE_DESC 			= " 防御と機動性のための標準的な選択肢"
		//
		EYELANDER_NAME 			= "アイランダー"
		EYELANDER_DESC 			= " 素早い攻撃で高いダメージを与え、敵を倒すとクリティカルやミニクリティカルが発生するが、ハイブリッドナイトとしては使用できない"
		//
		SKULLCUTTER_NAME 		= "スコッツマンズ・スカルカッター"
		SKULLCUTTER_DESC 		= " 敵のオーバーチャージを無効化し、メディガンの機能を妨害できる　また、自分と同じクラスの敵に対して、より大きなダメージを与えることができる"
		//
		CABER_NAME 				= "ウラプール・ケイバー"
		CABER_DESC 				= " ダメージは、負傷するにつれて増加し、体力が2%未満の場合、必ずクリティカルヒットとなる　この攻撃による爆発で、お前は死に至る"
		//
		CLAIDHEAMHMOR_NAME 		= "クレイドヒーム・モア"
		CLAIDHEAMHMOR_DESC 		= " 10キルごとに、モノキュラーズ召喚の呪文チャージを1つ獲得する（魔術書が必要）"
		//
		PERSIANPERSUADER_NAME 	= "ペルシャ・パースエイダー"
		PERSIANPERSUADER_DESC 	= " シールドと組み合わせると、シールドのチャージが無制限になる　急な方向転換や、壁、敵、その他の障害物への衝突によってシールドのチャージが中断されることもなくなる　スタン効果を無効化する"
		//
		NINEIRON_NAME 			= "ネッシーのナインアイアン"
		NINEIRON_DESC 			= " スイングの軌道が広範囲に及び、あらゆる方向の複数の敵を同時に攻撃できる　クリティカルダメージが2倍になる"
		//
		SCOTTISHHANDSHAKE_NAME 	= "スコティッシュ・ハンドシェイク"
		SCOTTISHHANDSHAKE_DESC 	= " 発動中：遠距離攻撃のダメージを90%軽減し、ノックバックを無効化し、最大HPを大幅に増加させる　ただし、弾薬を回復できず、敵グループから得られるHP回復量も減少する"
		//----------------------------
		//----------------------------
		//----------------------------
		MINIGUN_NAME 			= "ミニガン"
		MINIGUN_DESC 			= " 安定したダメージを与えられる頼もしい選択肢　敵を倒すと、短時間ミニクリティカルボーナスが得られる"
		//
		NATASCHA_NAME 			= "ナターシャ"
		NATASCHA_DESC 			= " 命中時に敵の移動速度を低下させ、「死のマーキング」を付与する"
		//
		BRASSBEAST_NAME 		= "ブラス・ビースト"
		BRASSBEAST_DESC 		= " ダメージは高いが、銃身回転開始まで非常に時間がかかる　展開中は移動速度が大幅に低下するが、飛来する投射物を弾き返すことができる"
		//
		TOMISLAV_NAME 			= "TOMISLAV"
		TOMISLAV_DESC 			= " ダメージを与えることで「ヒート」が蓄積される　この武器のすべてのステータスは、ヒートレベルに応じて上昇する　ただし、一定時間ダメージを与え続けると、武器は冷却され始めます"
		//
		HUOHEATER_NAME 			= "フオロングヒーター"
		HUOHEATER_DESC 			= " エネルギービームを発射し、命中した敵に火をつける"
		//
		GENUINEHUOHEATER_NAME 	= "ジェニュイン フオロングヒーター"
		GENUINEHUOHEATER_DESC 	= " ロケット弾を発射する　炎に包まれた敵に対しては必ずクリティカルヒットとなる"
		///
		SHOTGUN_HVY_NAME 		= "ショットガン - ヘビー"
		SHOTGUN_HVY_DESC 		= " 一撃で高いダメージを与え、敵を倒すと8秒間クリティカル率が上昇する"
		//
		SANDVICH_NAME 			= "サンドヴィッチ"
		SANDVICH_DESC 			= " 最大150,000のHPを回復する。このアイテムの効果発動中に受けたダメージは、すべて致命傷となる"
		//
		DALOKOHSBAR_NAME 		= "ダロコス・バー"
		DALOKOHSBAR_DESC 		= " 最大20,000のHPを回復する　HPが350未満の状態で使用すると、大幅なオーバーヒールが発生する　被ダメージ量が増加するが、ダメージを受けた際に自己ウーバー状態になるチャンスが得られる"
		//
		BUFFALOSTEAK_NAME 		= "バッファロー・ステーキ・サンドヴィッチ"
		BUFFALOSTEAK_DESC 		= " クリティカルヒットに対する耐性を自動的に付与する"
		//
		FAMILYBUSINESS_NAME 	= "ファミリービジネス"
		FAMILYBUSINESS_DESC 	= " 弾薬無制限。回復を受けている間は攻撃速度が2倍になる　敵を倒すと、一時的にクリティカル率とミニクリティカル率が上昇する"
		//
		FISHCAKE_NAME 			= "フィッシュケーキ"
		FISHCAKE_DESC 			= " 弾丸によるダメージには高い耐性を持つが、炎や爆発によるダメージにはより弱くなる"
		//
		SECONDBANANA_NAME 		= "セカンドバナナ"
		SECONDBANANA_DESC 		= " 爆発によるダメージには高い耐性を持つが、炎や弾丸ダメージにはより弱く、ダメージを受けやすい"
		///
		FISTS_NAME 				= "拳"
		FISTS_DESC 				= " 防御と機動性のための標準的な選択肢 戦闘で効果的"
		//
		KILLINGGLOVES_NAME 		= "キリング・グローブ・オブ・ボクシング"
		KILLINGGLOVES_DESC 		= " 特殊能力：「メガクラッシュ」 - 使用可能時に爆弾の上でアクションスロットのキーを押すと、爆弾を即座にスタート地点へ戻す　それ以外の場合は、一時的に移動速度、防御力、クリティカル率が上昇する"
		//
		GLOVESRUNNING_NAME 		= "GLOVES OF RUNNING URGENTLY"
		GLOVESRUNNING_DESC 		= " パラシュートを展開する能力を自動的に付与する　発動中は、ジャンプ力、ダメージ耐性、HP回復量が大幅に上昇する"
		//
		BREADBITE_NAME 			= "ブレッド・バイト"
		BREADBITE_DESC 			= " クリティカルヒットを当てると、対象に「腐食」という永続的なデバフを付与します　このデバフは最大HPに基づいてダメージを与え、対象が死亡した際に小さな腐食性の雲となって爆発し、その効果を周囲の敵に広げます"
		//
		WARRIRORSSPIRIT_NAME 	= "ウォリアーズスピリット"
		WARRIRORSSPIRIT_DESC 	= " 左クリックで高く跳び上がり、敵の上に着地すると、強力な踏みつけダメージを与えます　メインとサブの弾薬をすべて消費します"
		//
		FISTSOFSTEEL_NAME 		= "フィスト・オブ・スティール"
		FISTSOFSTEEL_DESC 		= " HP25万の巨大なヘビーガントレットに変身する　ノックバック効果を受けなくなり、大ダメージを与えることができる　すべてのメインおよびサブの弾薬が消費される　回復はランチボックスのアイテムからのみ可能となる"
		//
		EVICTIONNOTICE_NAME 	= "エビクションノウティス"
		EVICTIONNOTICE_DESC 	= " 敵を倒すと、急速な回復効果を得る"
		//
		APOCOFISTS_NAME 		= "アポコ・フィスト"
		APOCOFISTS_DESC 		= " パンチで敵を吹き飛ばす"
		//
		HOLIDAYPUNCH_NAME 		= "ホリデーパンチ"
		HOLIDAYPUNCH_DESC 		= " 発動中は、すべての敵があなたを無視します　また、スタン効果を無効化する　ただし、この武器ではダメージを与えることはできない"
		//----------------------------
		//----------------------------
		//----------------------------
		SHOTGUN_ENGI_NAME		= "ショットガン - エンジニア"
		SHOTGUN_ENGI_DESC 		= " 自分のセントリーのターゲットに4倍のダメージを与える"
		//
		FRONTIERJUSTICE_NAME 	= "フロンティアジャスティス"
		FRONTIERJUSTICE_DESC 	= " とてつもなく速い発射速度　弾倉容量は「リベンジ」のクリティカルヒット最大回数に一致する　回復を受けている間はリロード速度が向上する"
		//
		WIDOWMAKER_NAME 		= "ウィドウメーカー"
		WIDOWMAKER_DESC 		= " 2000のメタルを使用して、敵を吹き飛ばす広範囲攻撃を発動できる"
		//
		POMSON_NAME 			= "POMSON 6000"
		POMSON_DESC 			= " 敵に出血、炎上、および移動速度低下効果を与える"
		//
		RESCUERANGER_NAME 		= "救助レンジャー"
		RESCUERANGER_DESC		= " 1発につき金属を20消費するが、再装填の必要がなく、最大金属量を1000増加させる"
		///
		WRANGLER_NAME 			= "ラングラー"
		WRANGLER_DESC 			= " 発動中：セントリーのダメージが増加し、ディスペンサーの有効範囲が2倍になる"
		//
		SHORTCIRCUIT_NAME 		= "ショート・サーキット"
		SHORTCIRCUIT_DESC 		= " 10キルごとに、ライトニングボールの呪文チャージを1つ獲得する（魔術書が必要）"
		///
		WRENCH_NAME 			= "レンチ"
		WRENCH_DESC 			= " 確実なダメージを与えるための標準的な選択肢"
		//
		GUNSLINGER_NAME 		= "ガンスリンガー"
		GUNSLINGER_DESC	 		= " セカンダリ・セントリーを構築可能　3連撃パンチコンボで小型の敵を瞬殺し、ジャイアントに多大なダメージを与えることができる"
		//
		SOUTHERNHOS_NAME 		= "サウザンホスピタリティ"
		SOUTHERNHOS_DESC 		= " 通常のセントリーをフレイム・セントリーに置き換える　射程は短いが、ダメージは高い"
		//
		JAG_NAME 				= "ジャグ"
		JAG_DESC 				= " セントリーの射程距離が無制限になる"
		//
		EUREKAEFFECT_NAME 		= "ユーレカエフェクト"
		EUREKAEFFECT_DESC 		= " セントリーガンを運んでいる状態で、リロードキーを押すと、射程内の壁や天井に遠隔で設置できる"
		//----------------------------
		//----------------------------
		//----------------------------
		SYRINGEGUN_NAME			= "注射銃"
		SYRINGEGUN_DESC			= " ヒットするたびに0.5%のユーバーチャージを獲得する"
		//
		BLUTSAUGER_NAME			= "ブルートザウガー"
		BLUTSAUGER_DESC			= " ロボットの再プログラムには100%のユーバーチャージが必要であり、これを消費することで、ロボットを一時的に味方チームに加えた後、自爆させることができる　サブ攻撃キー：影響を受けたすべてのボットのプログラム書き換えを強制終了する"
		//
		CRUSADERSCROSSBOW_NAME	= "クルセイダーズ・クロスボウ"
		CRUSADERSCROSSBOW_DESC	= " 攻撃が命中するたびに0.25%のユーバーチャージを獲得し、出血状態を付与する　さらに、出血ダメージが1回発生するごとに0.5%のユーバーチャージを獲得する"
		//
		OVERDOSE_NAME 			= "過剰摂取"
		OVERDOSE_DESC 			= " 100%のユーバーチャージを消費して発動し、周囲の小型敵を最大15秒間無力化する攻撃を放つ"
		///
		MEDIGUN_NAME			= "メディガン"
		MEDIGUN_DESC			= " オーバーヒールの上限が、対象の最大HPの10倍まで引き上げられる　持続時間の長いレベル1の「投射物シールド」を展開する"
		//
		KRITZKRIEG_NAME			= "クリッツクリーク"
		KRITZKRIEG_DESC			= " 敵から体力を奪い、自己回復効果を得て、ユーバーチャージを蓄積できる"
		//
		QUICKFIX_NAME			= "クイックフィックス"
		QUICKFIX_DESC			= " 非常に回復速度が速く、レベル2の「投射物シールド」を備えている　シールドへの接触ダメージからユーバーチャージを蓄積できる"
		//
		VACCINATOR_NAME			= "ワクチネーター"
		VACCINATOR_DESC			= " 「アクティブヒーリング」を発動すると、あなたと回復対象は、選択したダメージタイプの基本ダメージに対して100%の耐性を得る　ユーバーチャージを発動すると、30秒間、選択したダメージタイプに対して完全な免疫を得る"
		///
		BONESAW_NAME 			= "骨用電ノコ"
		BONESAW_DESC			= " 防御と機動性のための標準的な選択肢　攻撃が命中すると、ユーバーが10%上昇する"
		//
		UBERSAW_NAME 			= "ユーバーソー"
		UBERSAW_DESC			= " 命中時に出血効果を与え、ユーバーが2%上昇する"
		//
		VITASAW_NAME 			= "VITA-SAW"
		VITASAW_DESC			= " 命中時にユーバーヒールの呪文チャージを1つ獲得する（魔術書が必要）　攻撃が命中すると、ユーバーが5%上昇する"
		//
		AMPUTATOR_NAME 			= "AMPUTATOR"
		AMPUTATOR_DESC			= " 命中時：メディガンがスーパーチャージ状態となり、一時的に回復量、ユーバーチャージ速度、射程が向上する　敵を倒すと、この効果の強化版が発動する"
		//
		SOLEMNVOW_NAME 			= "厳粛な誓い"
		SOLEMNVOW_DESC			= " 射程無制限　メディガンのビームでつながっているすべての敵に命中し、メディックボットには200倍のダメージを与える　命中した敵1体につき、ユーバーメーターが5%増加する"
		//----------------------------
		//----------------------------
		//----------------------------
		SNIPERRIFLE_NAME 		= "スナイパーライフル"
		SNIPERRIFLE_DESC 		= " フルチャージしたヘッドショットは45万のダメージを与える"
		//
		MACHINA_NAME 			= "マキナ"
		MACHINA_DESC 			= " チャージにかかる時間は非常に長いが、フルチャージ状態ならタンクを瞬殺できる　敵を倒すとレイジメーターが溜まり、1秒間のクリティカルブーストが発動する　このクリティカルブーストとフルチャージを組み合わせれば、遭遇するほとんどのタンクを瞬時に倒すことができる"
		//
		HITMANSHEATMAKER_NAME 	= "ヒットマンズ・ヒートメーカー"
		HITMANSHEATMAKER_DESC 	= " スコープを解除せずに連射出来る　体への攻撃はダメージを与えない"
		//
		AWPERHAND_NAME 			= "ウェイパーハンド"
		AWPERHAND_DESC 			= " 爆発弾を発射し、敵を倒すたびにレイジを蓄積する　レイジが100%に達した後、リロードボタンを押すと、最大HPとHP回復量が上昇する　ライフルは、スコープに敵が捉えられている時のみチャージされる"
		//
		HUNTSMAN_NAME 			= "ハンツマン"
		HUNTSMAN_DESC 			= " 一度に5本の矢を放つ　パイロが矢に火をつけると、大ダメージを与える"
		//
		SYDNEYSLEEPER_NAME 		= "SYDNEY SLEEPER"
		SYDNEYSLEEPER_DESC 		= " 特殊な矢を放ち、巨人以外の敵の移動を妨げ、メディックボットからの回復を受けられなくする"
		//
		BAZAARBARGAIN_NAME 		= "バザールバーゲン"
		BAZAARBARGAIN_DESC 		= " 同じクラスの敵を連続して倒すと発射速度が上がり、最大3回まで積み重なる　別のクラスの敵を倒すとコンボがリセットされます"
		//
		FORTIFIEDCOMPOUND_NAME 	= "強化コンパウンド"
		FORTIFIEDCOMPOUND_DESC 	= " ハンツマンよりも与ダメージは低いが、発射速度が速く、濡れた敵に対しては貫通効果とクリティカルヒットが発生する"
		//
		CLASSIC_NAME 			= "クラシック"
		CLASSIC_DESC 			= " トリガーを引ける限り連射するか、あるいは一発に集中して、そのエリアにいる巨大ボット以外の敵をすべて吹き飛ばすほどの凄まじい爆発力を秘めたヘッドショットを放つ"
		///
		SMG_NAME 				= "SMG"
		SMG_DESC 				= " ヘッドショットが可能で、ダメージが大幅に増加する　サブ攻撃キー：ズームインし、命中率が100%になりますが、発射速度は半分になる"
		//
		RAZORBACK_NAME 			= "レイザーバック"
		RAZORBACK_DESC 			= " 非常に速くチャージされ、攻撃者にジャラテを浴びせる"
		//
		JARATE_NAME 			= "ジャラテ"
		JARATE_DESC 			= " 即座にリチャージし、敵の移動速度を低下させる"
		//
		DARWIN_NAME 			= "DARWIN'S DANGER SHIELD"
		DARWIN_DESC 			= " 炎攻撃にはほぼ無敵だが、弾丸と爆発ダメージを50％増しで受ける"
		//
		COZYCAMPER_NAME 		= "コージー・キャンパー"
		COZYCAMPER_DESC 		= " 移動速度、最大HP、HP回復量がわずかに上昇する　炎上効果を受けない"
		//
		CLEANERSCARBINE_NAME 	= "クリーナーズ・カービン"
		CLEANERSCARBINE_DESC 	= " ミニクリティカルブーストの効果は30秒間持続する"
		//
		BEAUTYMARK_NAME 		= "セルフアウェア・ビューティー・マーク"
		BEAUTYMARK_DESC 		= " 燃える矢で聖なる地獄の炎を降り注ぐ　サブ攻撃キー：燃える矢の束を一気に放つ"
		///
		KUKRI_NAME 				= "ククリ刀"
		KUKRI_DESC 				= " 防御と機動性のための標準的な選択肢"
		//
		TRIBALMANSSHIV_NAME 	= "トライバルマンズ・シヴ"
		TRIBALMANSSHIV_DESC 	= " 便利アイテム - 重力がなくなり、自由に空を飛ぶことができる"
		//
		BUSHWACKA_NAME 			= "BUSHWACKA"
		BUSHWACKA_DESC 			= " 近接攻撃範囲が無限となり、炎に包まれた敵に対しては必ずクリティカルヒットが発生する"
		//
		SHAHANSHAH_NAME 		= "シャハンシャー"
		SHAHANSHAH_DESC 		= " メイン攻撃キーで上空へ飛び上がり、高い場所へ到達するのに便利　また、落下ダメージ無効化する"
		//----------------------------
		//----------------------------
		//----------------------------
		REVOLVER_NAME 			= "リボルバー"
		REVOLVER_DESC 			= " 命中時：複数のデバフを付与する　（短時間敵の被ダメージを増加、敵のメディックのオーバーチャージを消費、スパイのボットを偽装解除、空中の敵をスタン）"
		//
		AMBASSADOR_NAME 		= "アンバサダー"
		AMBASSADOR_DESC 		= " ヘッドショットで多大なダメージを与える　変装していない場合、ダメージは2倍になる"
		//
		LETRANGER_NAME 			= "L'ETRANGER"
		LETRANGER_DESC 			= " 一撃でジャイアント以外の敵を倒すことができる。ただし、ジャイアントやタンクにはダメージを与えられない"
		//
		ENFORCER_NAME 			= "執行者"
		ENFORCER_DESC 			= " ダメージ耐性を無視し、バックスタブまたはサッパーで建物を破壊するたびにクリティカルを1回蓄積する。"
		//
		DIAMONDBACK_NAME 		= "ダイヤモンドバック"
		DIAMONDBACK_DESC 		= " ブラックホールを発生させ、敵を引き寄せる"
		///
		SAPPER_NAME 			= "サッパー"
		SAPPER_DESC 			= " スタン範囲と持続時間が最大でチャージ時間が短い"
		//
		REDTAPE_NAME 			= "レッドテープレコーダー"
		REDTAPE_DESC 			= " エンジニアの建造物を即座に破壊するが、一度にサップできる敵は1体のみである"
		///
		KNIFE_NAME 				= "ナイフ"
		KNIFE_DESC 				= " ナイフ発動中は、体力が減少するが、あらゆるダメージを受けなくなる　敵を倒すと体力が回復する"
		//
		YOURETERNALREWARD_NAME 	= "YOUR ETERNAL REWARD"
		YOURETERNALREWARD_DESC 	= " 体力が10%未満の状態でダメージを受けたりクリティカルヒットを受けたりすると、ダメージが増加するが、これは正面からの刺突攻撃にのみ適用される　ダメージの90%を軽減する"
		//
		KUNAI_NAME 				= "コニバーズクナイ"
		KUNAI_DESC 				= " 近接攻撃の射程は無限大に　背後から攻撃すると爆発が発生し、周囲の敵に追加ダメージを与える"
		//
		BIGEARNER_NAME 			= "ビッグアーナー"
		BIGEARNER_DESC 			= " HPが非常に高く、攻撃が外れるたびに急速に回復するが、味方からの誤射を受けることになる"
		//
		WANGAPRICK_NAME 		= "ワンガプリック"
		WANGAPRICK_DESC 		= " 敵を倒すと、数秒間即座に透明状態になる　この透明状態では敵を攻撃でき、連続キルを達成することで不可視状態を維持できるが変装はできない"
		//
		SHARPDRESSER_NAME 		= "シャープドレッサー"
		SHARPDRESSER_DESC 		= " 背後から攻撃すると爆発が発生し、周囲の敵に追加ダメージを与える"
		//
		SPYCICLE_NAME 			= "スパイ・シクル"
		SPYCICLE_DESC 			= " 空振りしたスイングで空中に跳び上がり、自由にサーフ・スタブを繰り出せるが、変装はできない　背後から攻撃すると、巨人に対して大ダメージを与える"
		///
		INVISWATCH_NAME 		= "透明ウォッチ"
		INVISWATCH_DESC 		= " 無限のマント、移動速度+10%"
		//
		DEADRINGER_NAME 		= "デッドリンガー"
		DEADRINGER_DESC 		= " 発動すると、短時間移動速度が上昇し、任意の方向へダッシュできるようになる　ダッシュ中は受けるダメージが80%軽減される"
		//
		CLOAKANDDAGGER_NAME		= "クローク&ダガー"
		CLOAKANDDAGGER_DESC		= " 瞬時の透明化と透明解除。"
		//----------------------------
		//----------------------------
		//----------------------------
		FRYINGPAN_NAME 			= "フライパン"
		FRYINGPAN_DESC 			= " 自分と同じクラスの敵に30倍のダメージを与え、敵を倒すとクリティカルが発生する"
		//
		SAXXY_NAME 				= "ザクシー"
		SAXXY_DESC 				= " 自分と同じクラスの敵に30倍のダメージを与え、敵を倒すとクリティカルが発生する"
		//
		MEMORYMAKER_NAME 		= "メモリーメーカー"
		MEMORYMAKER_DESC		= " 自分と同じクラスの敵に30倍のダメージを与え、敵を倒すとクリティカルが発生する"
		//
		CONOBJECTOR_NAME		= "コンシエンタスオブジェクター"
		CONOBJECTOR_DESC		= " 10キルごとに、ランダムな呪文チャージを1つ獲得する（魔術書が必要）"
		//
		FREEDOMSTAFF_NAME 		= "フリーダムスタッフ"
		FREEDOMSTAFF_DESC 		= " 攻撃をかわすことでダメージを受ける確率がわずかに上がり、3秒間ユーバー状態になる"
		//
		BATOUTTAHELL_NAME 		= "バット・アウタ・ヘル"
		BATOUTTAHELL_DESC 		= " 発動中は、あらゆる被ダメージを受けず、膨大なオーバーヒール量を蓄積しますが、ノックバックには完全に無防備となる"
		//
		HAMSHANK_NAME 			= "ハム・シャンク"
		HAMSHANK_DESC 			= " 特殊能力：「バイタル・リサージェンス」 - 使用可能時にアクションスロットのキーを押すと、即座に10倍のオーバーヒール効果を得て、20秒間ノックバックを無効化する"
		//
		NECROSMASHER_NAME 		= "ネクロスマッシャー"
		NECROSMASHER_DESC 		= " 特殊能力：「バンパーカー・マンズローター」 - 使用可能時にアクションスロットのキーを押すと、バンパーカーモードに入る　バンパーカーモード中は無敵状態となり、体力が回復し、敵を轢き潰すことができる"
		//
		CROSSINGGAURD_NAME 		= "クロッシングガード"
		CROSSINGGAURD_DESC 		= " バックスタブを含む、すべての近接攻撃に対して極めて高い耐性を得る"
		//
		PRINNYMACHETE_NAME 		= "プリニー・マチェーテ"
		PRINNYMACHETE_DESC 		= " 便利アイテム - この近接武器をスイングして、高速で前方に突進する事ができる　落下ダメージを無効化する"
		//------------------------------------
	}
	danish = {
		IH_TRANSLATE_ITEM		= IH_color + "[%s]" + IH_text_color + "%s"
		IH_INCLUDES				= IH_color_header + "[►]\x0826beffBB Your loadout includes..."
		IH_DIS_MSG_2			= IH_disable_color + "Skriv '/itemhelp 1' for at deaktivere disse beskeder under en bølge. \nSkriv '/itemhelp 0' for at deaktivere disse beskeder helt."
		IH_DIS_MSG				= IH_disable_color + "Skriv '/itemhelp 0' for at deaktivere disse beskeder. \nSkriv '/itemhelp 2' for altid at vise denne besked."
		IH_BAD_ARGS				= IH_color_header + "[Genstandshjælper]" + IH_error_color + " {Fejl}\x01 Forkerte argumenter!\n/itemhelp 2 - Aktiver\n/genstandshjælp 1 - Aktiver kun under bølge-setup\n/itemhelp 0 - Deaktiver"
		IH_OOB_ARG				= IH_color_header + "[Genstandshjælper]" + IH_error_color + " {Error}\x01 Ugyldig værdi angivet! : %s"
		IH_HELP_MSG				= IH_color_header + "[Genstandsjælper]\x01 Genstandshjælper giver enkle beskrivelser for hver \x03Chaos\x01 genstand!"
		IH_DISABLE				= IH_color_header + "[►]\x01 Genstandshjælper deaktiveret!."
		IH_WAVE_SETUP			= IH_color_header + "[►]\x01 Genstandshjælper kun aktiveret under bølge-setup."
		IH_ENABLE 				= IH_color_header + "[►]\x01 Genstandshjælper aktiveret!."
		LOW_METAL 				= "Ikke nok metal"
		TOMISLAV_HEAT			= "Tomislav varme: %s%%"
		STUCK_RESPAWNED 		= "Du blev genoplivet for at undgå at sidde fast."
		ABILITY_READY			= "%s\n► Klar ◄"
		ABILITY_CHARGING		= "%s\n%s"
		ABILITY_CHARGING_MSG	= "Oplader: %ss"
		ABILITY_CHARGING_D_MSG	= "Oplader: %s%%"
		MEGACRUSH 				= "MEGA-KNUS"
		VITALRESURGENCE 		= "VITAL GENOPSTANDELSE"
		VEHICULARMANNSLAUGHTER 	= "TRAFIKDRAB"
		TEST 					= "Test Ability"
		NO_MONEY				= "You can't afford this! (Cost: $%s, you have: $%s)" // Dont Translate this, my own project
		REPROG_BOT_STRONG		= TF_TEAM_COLOR_REPROG_B+"%s\x01 er for modstandsdygtig og kan ikke omprogrammeres."
		REPROG_BOT_NOT_SUIT		= TF_TEAM_COLOR_REPROG_B+"%s\x01 er ikke egnet til kamp og kan ikke omprogrammeres."
		REPROG_BOT_LEAVE		= TF_TEAM_COLOR_SPEC+"%s døde."
		REPROG_BOT_MESSAGE 		= TF_TEAM_COLOR_RED+"%s\x01 har omprogrammeret "+TF_TEAM_COLOR_REPROG_B+"%s\x01!"
		//---------------------------------------------------------
		CHECKPOINT_CREATED		= "\x077c8cc2Checkpoint created:\x078165cf [/%s]"
		CHECKPOINT_WRONG_MAP	= CHECKPOINT_ERROR+"Dette checkpoint blev ikke sat for denne bane."
		CHECKPOINT_WRONG_MISS	= CHECKPOINT_ERROR+"Dette checkpoint blev ikke sat for denne mission."
		CHECKPOINT_EXPIRE		= CHECKPOINT_ERROR+"Dette checkpoint er udløbet."
		CHECKPOINT_RESTORE		= "\x0744CC44Gendannet til sidst gemte checkpoint."
		CHECKPOINT_RESTORE_HUD	= "Gendannet til sidst gemte checkpoint."
		//---------------------------------------------------------
		SCATTERGUN_NAME 		= "HAGLSPREDER"
		SCATTERGUN_DESC 		= "Standardvalg til pålidelig skade. Meget effektiv på tæt hold."
		//
		FORCENATURE_NAME		= "NATURKRAFTEN"
		FORCENATURE_DESC		= " Forbedret tilbageslag ved træf. Lidt lavere skadesudbytte pr. sekund end Haglsprederen."
		//
		SHORTSTOP_NAME 			= "HÅNDBREMSEN"
		SHORTSTOP_DESC 			= " Vanvittig skudhastighed og garanterede kritiske træffere mod våde fjender, men langsom genladning."
		//
		SODAPOPPER_NAME 		= "SODA-POPPEREN"
		SODAPOPPER_DESC 		= " Hold skudknappen inde for at affyre en hurtig serie på 4 skud."
		//
		BABYFACEBLASTER_NAME	= "DENGSEDRENGENS DRÆBER"
		BABYFACEBLASTER_DESC	= " Hold skudknappen nede for at lade en massiv salve på op til 200 skud, der flår alt i stykker på klos hold. Har dog meget kraftig rekyl."
		//
		BACKSCATTER_NAME		= "RYGSPREDER"
		BACKSCATTER_DESC		= " Fuld kritisk skade ved skud i ryggen. Kræver ingen ammunition og har et uendeligt magasin."
		///
		PISTOL_NAME 			= "PISTOL"
		PISTOL_DESC 			= " Affyrer raketter i stedet for kugler. Meget effektivt, når man skal bevæge sig hurtigt."
		//
		BONK_NAME 				= "BONK!-ATOMPUNCH"
		BONK_DESC 				= " En kraftfuld drik, der giver usårlighed uden at forhindre dig i at angribe."
		//
		CRITACOLA_NAME 			= "KRIT-A-COLA"
		CRITACOLA_DESC 			= " En drik med ekstra kraft, der giver fulde kritiske slag."
		//
		MADMILK_NAME 			= "MANISK MÆLK"
		MADMILK_DESC 			= " Fjender, der er dækket af mælk, kan ikke bevæge sig."
		//
		WINGER_NAME 			= "FLØJSPILLEREN"
		WINGER_DESC 			= " Ubegrænset antal luftspring, mens aktiv. Affyrer et enkelt, målrettet skud, der altid giver kritisk skade, mens du er i luften. Dette skud skubber desuden fjender væk."
		//
		PRETTYBOYS_NAME 		= "LÆKKERBISKENS LOMMEPISTOL"
		PRETTYBOYS_DESC 		= " Affyrer raketter, der forårsager skade baseret på offerets livspoint. Skaden stiger, efterhånden som målet bliver såret, og påvirkes ikke af afstanden. Alternativt skud: Brug søgende raketter til gengæld for -20% mindre skade."
		//
		CLEAVER_NAME 			= "FLYVENDE GUILLOTINE"
		CLEAVER_DESC 			= " Yondus pil: Fremkald en levende pil, der hjælper i kampen. Alternativt skud: Disruptor-tilstand, -75% skade."
		//
		MATATEDMILK_NAME 		= "MUTERET MÆLK"
		MATATEDMILK_DESC 		= " Hurtigskydende eksplosive mælkekander, der forårsager skade på fjender. Alternativt skud: Kast en hel flok mælkekander på én gang."
		///
		BAT_NAME 				= "BAT"
		BAT_DESC 				= " Mulighed for at ignorere døden og teleportere sig til spawn med 1 hp."
		//
		SANDMAN_NAME			= "OLE LUKØJE"
		SANDMAN_DESC 			= " Kan affyre baseballs i hurtig rækkefølge med stor kapacitet og hurtig genopladning, hvilket påfører enkelte mål betydelig skade i hurtige skudsalver."
		//
		HOLYMACKEREL_NAME		= "MILDE MAKREL"
		HOLYMACKEREL_DESC		= " Kan markere flere fjender til døden."
		//
		CANDYCANE_NAME 			= "SLIKSTOKKEN"
		CANDYCANE_DESC 			= " Utility Genstand - Du er ikke påvirket af tyngdekraften og kan flyve frit."
		//
		BOSTONBASHSER_NAME 		= "BOSTON-BASKEREN"
		BOSTONBASHSER_DESC 		= " Høj risiko / Høj gevinst. Kan dræbe de fleste små fjender med ét slag og giver et krit boost på 10 sekunder. Fjender, der er forbundet via medi-gevær stråler, rammes også. Men et eneste fejlskud betyder øjeblikkelig død."
		//
		SUNONASTICK_NAME		= "SOLEN-PÅ-EN-PIND"
		SUNONASTICK_DESC		= " Mulighed for at lamme fjender eller få et kortvarigt krit boost. Rammer alle fjender, der er forbundet via medi-gevær stråler. Hvis du rammer forbi, lammer du dog dig selv."
		//
		FANOWAR_NAME 			= "KRIGSVIFTEN"
		FANOWAR_DESC 			= " Utility Genstand - Sving dette nærkampsvåben for at kaste dig fremad med høj hastighed. Giver immunitet over for faldskade."
		//
		ATOMIZER_NAME 			= "ATOMBATTET"
		ATOMIZER_DESC 			= " Kan ikke forårsage skade med normale angreb, men et vellykket drab efter et hån giver et krit boost, der varer i 3 minutter."
		//
		THREERUNEBLADE_NAME 	= "TRE-RUNE-KLINGEN"
		THREERUNEBLADE_DESC 	= " Mens den er aktiv, får du et KÆMPESTORT boost til bevægelseshastigheden og muligheden for at udføre et tredobbelt hop. Giver immunitet over for faldskade."
		//
		UNARMEDCOMBAT_NAME 		= "UHÅNDGRIBELIG ARMERING"
		UNARMEDCOMBAT_DESC 		= " For hver 10 drab får du en trylleformularladning til en skelet håndlanger (kræver tryllebog)."
		//
		WRAPAASSASSIN_NAME 		= "GAVEPAPIRSMORDEREN"
		WRAPAASSASSIN_DESC 		= " Kan afværge indkommende projektiler og let reflektere dem. Giver desuden immunitet over for lammelse."
		//----------------------------
		//----------------------------
		//----------------------------
		ROCKETLAUNCHER_NAME		= "RAKETKASTER"
		ROCKETLAUNCHER_DESC		= " Standard valg for pålidelig skade."
		//
		DIRECTHIT_NAME			= "FULDTRÆFFEREN"
		DIRECTHIT_DESC			= " Alt-Skyd: Kast en lille fjende i luften for en nem minikrit opfølgning. Raketter har en lille mængde sigtehjælp."
		//
		BLACKBOX_NAME			= "DEN SORTE BOKS"
		BLACKBOX_DESC			= " Sæt farten ned på fjender og påfør blødning. Dette våben gør x2 skade mod Soldier robotter."
		//
		ROCKETJUMPER_NAME		= "RAKETHOPPEREN"
		ROCKETJUMPER_DESC		= " Lav skudhastighed og genladningstid, men høj skade og stor eksplosionsradius. Fremragende valg til at kontrollere store grupper."
		//
		LIBERTYLAUNCHER_NAME	= "FRIHEDSFORDREREN"
		LIBERTYLAUNCHER_DESC	= " Affyrer en langsomtgående raket, der ør massiv skade i et stort område. Meget langsom genladning og lav ammunitionsmængde. Dette våben affyrer automatisk, når det er ladt."
		//
		COWMANGLER_NAME			= "KOKVÆSTER 5000"
		COWMANGLER_DESC			= " Lammer små fjender ved træf. Et opladet skud lammer fjender i længere tid. Hold Alt-Skyd nede for at oplade våbnet til et multiskud, hvilket resulterer i endnu længere lammelse."
		//
		ORIGINAL_NAME			= "ORIGINALEN"
		ORIGINAL_DESC			= " Hold skudknappen nede for at lade en salve på op til 4 raketter. Våbnet affyres automatisk, når det er ladt."
		//
		BEGGARSBAZOOKA_NAME		= "TIGGERENS BAZOOKA"
		BEGGARSBAZOOKA_DESC		= " Hold skudknappen inde for at oplade op til 100 raketter, før du affyrer dem i en massiv salve. Dette våben kan IKKE overfyldes."
		//
		AIRSTRIKE_NAME			= "LUFTANGREBET"
		AIRSTRIKE_DESC			= " Læg op til 10 raketter i magasinet, før du affyrer dem alle på én gang i et fast spredningsmønster. Raketterne søger automatisk mod fjenderne."
		///
		SHOTGUN_SOLD_NAME 		= "HAGLGEVÆR - SOLDIER"
		SHOTGUN_SOLD_DESC 		= " Meget høj skudhastighed og kritiske træffere under rakethop."
		//
		SHOTGUN_NAME 			= "HAGLGEVÆR"
		SHOTGUN_DESC 			= " Standard valg for pålidelig skade."
		//
		BUFFBANNER_NAME 		= "BUFF-BANNERET"
		BUFFBANNER_DESC 		= " Ubegrænset rækkevidde og markant længere varighed."
		//
		GUNBOATS_NAME 			= "BLYSÅLERNE"
		GUNBOATS_DESC 			= " Aktiverer bunnyhopping ved at holde 'hop' tasten nede. Giver immunitet over for faldskade."
		//
		BATTALIONS_NAME 		= "FORSVARSFANEN"
		BATTALIONS_DESC 		= " Ubegrænset rækkevidde og markant længere varighed."
		//
		CONCHEROR_NAME 			= "KONG-KYLIEN"
		CONCHEROR_DESC 			= " Ubegrænset rækkevidde og markant længere varighed."
		//
		RESERVESHOOTER_NAME 	= "BAGHÅNDSGEVÆRET"
		RESERVESHOOTER_DESC 	= " Gør 10.000 skade pr. skud uanset afstand og udløser mini-kritiske slag på 3 sekunder ved drab. Våbnet kan dog ikke forstærkes med kritiske slag og kan ikke skade tanks. Hold Alt-Skyd nede for at zoome ind."
		//
		BISON_NAME 				= "RETSKAFNE BISON"
		BISON_DESC 				= " Affyrer en kontinuerlig stråle af gennemtrængende skade med fuld automatisk sigtning."
		//
		MANTREADS_NAME 			= "MANDETRÆDERNE"
		MANTREADS_DESC 			= " Skaden, der forårsager tilbageslag, er blevet væsentligt reduceret. Luftangreb har nu fået en markant øget acceleration. Stomp-skaden er blevet forbedret og er nu baseret på hastighed."
		//
		BASEJUMPER_NAME 		= "B.A.S.E.-HOPPEREN"
		BASEJUMPER_DESC 		= " Mulighed for at aktivere faldskærm. Øger modstandsdygtigheden over for tilbageslag og skudskader, hvilket mindsker din sårbarhed i luften."
		//
		PANICATTACK_NAME 		= "PANIKANFALDET"
		PANICATTACK_DESC 		= " Når du har brug for akut helbredelse. Gendanner straks op til 10.000 livspoint ved træf. Hvis du tager skade, mens dette våben er aktivt, er der en chance for, at det udløser en kortvarig selv-über."
		///
		SHOVEL_NAME 			= "SKOVL"
		SHOVEL_DESC 			= " Standard valg for pålidelig skade."
		//
		EQUALIZER_NAME 			= "UDLIGNEREN"
		EQUALIZER_DESC 			= " Hån angrebet forårsager enorm skade og slår fjenderne op i luften."
		//
		PAINTRAIN_NAME 			= "TORTURTOGET"
		PAINTRAIN_DESC 			= " Forårsager blødning og nedsat bevægelse ved træf. Giver immunitet over for faldskade."
		//
		HALFZATOICHI_NAME 		= "HALV-ZATOICHI"
		HALFZATOICHI_DESC 		= " Gennemsnitlig skade med høj helbred og mobilitet samt øget rækkevidde."
		//
		MARKETGARDENER_NAME 	= "KRIGERENS KAMPSKOVL"
		MARKETGARDENER_DESC 	= " Markant øget kritisk skade. Efter at have dræbt en fjende går du ind i en rasende tilstand og får ekstra liv, modstand og øget skade på alle angreb. Men hvis du rammer forbi, dør du med det samme."
		//
		DISCIPLINARYACTION_NAME = "DISCIPLINÆRSAGEN"
		DISCIPLINARYACTION_DESC	= " Standardvalg til forsvar og mobilitet."
		//
		ESCAPEPLAN_NAME			= "REDNINGSPLANEN"
		ESCAPEPLAN_DESC			= " Standardvalg til forsvar og mobilitet."
		//----------------------------
		//----------------------------
		//----------------------------
		FLAMETHROWER_NAME 		= "FLAMMEKASTER"
		FLAMETHROWER_DESC		= " Standard valg for pålidelig skade. Giver et kortvarigt minikrit boost ved drab."
		//
		BACKBURNER_NAME 		= "BAGBRÆNDEREN"
		BACKBURNER_DESC			= " Grøn ild – Markerer fjender til døden og lammer fjender i luften i kort tid. Dette våben gør dobbelt så meget skade mod Pyro robotter."
		//
		DEGREASER_NAME 			= "FEDTFJERNEREN"
		DEGREASER_DESC			= " Langdistance flammekaster, der gør stor direkte skade, men ingen efterbrændingsskade. Denne flammekaster kan ikke lave luftstød."
		//
		PHLOGISTINATOR_NAME 	= "PHLOGISTINATOREN"
		PHLOGISTINATOR_DESC		= " Grøn ild – Markerer fjender til døden og lammer fjender i luften i kort tid. Effektiv mod tanks, men din bevægelseshastighed nedsættes."
		//
		RAINBLOWER_NAME 		= "REGNBLÆSEREN"
		RAINBLOWER_DESC			= " Langdistance flammekaster, der gør lav direkte skade, men stor efterbrændingsskade. Kan desuden øjeblikkeligt ødelægge Engineers bygninger og brænde fjendtlige Pyros. Luftstødet er svagt, men meget hurtigt."
		//
		DRAGONSFURY_NAME 		= "DRAGENS VREDE"
		DRAGONSFURY_DESC		= " Markant stigning i skudhastigheden og tryklufthastigheden."
		//
		NOSTROMONAPALMER_NAME 	= "NOSTROMO NAPALMEREN"
		NOSTROMONAPALMER_DESC	= " Bremser fjender ved træf. Opbygger 'Mmmph' ladning på samme måde som Phlogistinatoren, men giver dig selv Kong-kylien buffen. Denne flammekaster kan ikke bruge luftstød."
		///
		SHOTGUN_PYRO_NAME 		= "HAGLGEVÆR- PYRO"
		SHOTGUN_PYRO_DESC 		= " Garanterede kritiske træffere mod brændende fjender."
		//
		FLAREGUN_NAME 			= "SIGNALPISTOLEN"
		FLAREGUN_DESC 			= " Affyrer et hitscan-angreb, der trænger igennem fjender. Skaden stiger eksponentielt for hver fjende, der gennemtrænges på vejen. Der er også en chance for at lamme fjender ved træf."
		//
		DETONATOR_NAME 			= "DETONATOREN"
		DETONATOR_DESC 			= " Signalblus har en uendelig eksplosionsradius og rammer alt, hvad der befinder sig inden for synsfeltet. Den tvinger alle Spy robotter til at afsløre sig selv og fjerne deres forklædning. Et fremragende valg, hvis man har brug for mobilitet."
		//
		MANMELTER_NAME 			= "MANDESMELTEREN"
		MANMELTER_DESC 			= " Hurtigskydende signalblus, der er specialudviklet til automatisk at opspore fjender. Ubegrænset ammunition og ingen genladning. Alt-Skyd: Affyr en hel salve af signalblus på én gang."
		//
		SCORCHSHOT_NAME 		= "BRANDSKUDDET"
		SCORCHSHOT_DESC 		= " Ved træf: Gør stor skade, slukker fjendens ild og skubber ham væk. Der SKAL være ild i dit mål, ellers har dette angreb ingen effekt. Alt-Skyd: Brug en langsomt søgende signalblus."
		//
		THERMALTHRUSTER_NAME 	= "TERMISKE TRYKMOTOR"
		THERMALTHRUSTER_DESC 	= " Reduceret brændstofforbrug uden forsinkelse ved start. Kan genindsættes i luften og gøre massiv stomp skade. Får en kortvarig kritboost ved drab."
		//
		GASPASSER_NAME 			= "BENZINDUNKEN"
		GASPASSER_DESC 			= " Måleren starter tom og nulstilles, når du dør. Gør 150.000 skade for at fylde måleren. Eksploder ved antænding gør 105.000 skade."
		///
		FIREAXE_NAME 			= "BRANDØKSE"
		FIREAXE_DESC 			= " Standardvalg til forsvar og mobilitet."
		//
		AXTINGUISHER_NAME 		= "UDBRÆNDEREN"
		AXTINGUISHER_DESC		= " Gør markant mere skade mod brændende spillere."
		//
		HOMEWRECKER_NAME 		= "HUSVRAGEREN"
		HOMEWRECKER_DESC 		= " Kan øjeblikkeligt ødelægge Engineer bygninger hvor som helst fra med ubegrænset nærkampsrækkevidde."
		//
		POWERJACK_NAME 			= "DONHAMMEREN"
		POWERJACK_DESC 			= " Hurtige angreb og bevægelseshastighed. Påfører fjender blødning og antændelse ved træf og giver minikritiske slag ved drab."
		//
		BACKSCRATCHER_NAME 		= "RYGKRADSEREN"
		BACKSCRATCHER_DESC 		= " Gør dødelig skade bagfra. Efter et drab går du i en rasende tilstand og opnår ekstra bevægelseshastighed, modstand og øget skade på alle angreb."
		//
		VOLCANOFRAGMENT_NAME 	= "SKÆRPET VULKANFRAGMENT"
		VOLCANOFRAGMENT_DESC 	= " Chance for at lamme fjender ved træf. Er også i stand til at brænde fjendtlige Pyros."
		//
		POSTALPUMMELER_NAME 	= "POSTPRYGLEREN"
		POSTALPUMMELER_DESC 	= " Ved træf: Påfør Forvirring, som får fjender til at gå baglæns langs bombestien i kort tid. Hold Alt-Skyd nede, når du angriber, for at teleportere tilbage til spawn."
		//
		MAUL_NAME 				= "MUGGERTEN"
		MAUL_DESC 				= " Ved træf: Opsend fjender i luften med reduceret tyngdekraft."
		//
		THIRDDEGREE_NAME 		= "TREDJEGRADSFORBRÆNDINGEN"
		THIRDDEGREE_DESC 		= " Bliv næsten immun over for ildskade, mens våbnet er udrustet, og opnå yderligere tung modstand mod alle langtrækkende angreb, mens det er aktivt."
		//
		LOLLICHOP_NAME 			= "SUKKERSLAGET"
		LOLLICHOP_DESC 			= " Hver 10. drab giver en Meteor Storm-trylleformular (kræver Tryllebog)."
		//
		NEONANNIHILATOR_NAME 	= "NEON ANNIHILATOREN"
		NEONANNIHILATOR_DESC 	= " Din tyngdekræft er reduceret"
		//
		HOTHAND_NAME 			= "VARME HÅND"
		HOTHAND_DESC 			= " Ved træf: Opsend fjender i luften."
		//----------------------------
		//----------------------------
		//----------------------------
		GRENADELAUNCHER_NAME 	= "GRANATKASTER"
		GRENADELAUNCHER_DESC	= " Standard valg for pålidelig skade"
		//
		LOCHNLOAD_NAME 			= "LOCH-N-LADEREN"
		LOCHNLOAD_DESC			= " Langsomme skud, men med høj skade over et stort område. Effektiv til kontrol af grupper."
		//
		ALIBABA_NAME			= "ALI BABAS SMÅ FUTTER"
		ALIBABA_DESC			= " Øget skade ved skjold-bash. Giver immunitet over for faldskade."
		//
		BOOTLEGGER_NAME			= "SMUGLEREN"
		BOOTLEGGER_DESC			= " Øget skade ved skjold-bash. Giver immunitet over for faldskade."
		//
		LOOSECANNON_NAME		= "LØSE KANON"
		LOOSECANNON_DESC		= " Læg op til 4 kanonkugler i magasinet, før de affyres på én gang i et lodret spredningsmønster. Kanonkuglerne eksploderer ved kontakt med jorden."
		//
		IRONBOMBER_NAME			= "JERNKÆMPEN"
		IRONBOMBER_DESC			= " Ignorerer fjendtlige modstandskræfter og giver et kortvarigt kritisk boost ved drab. Kræver ikke ammunition og har et uendeligt magasin. Projektiler kan hoppe af på vægge."
		///
		STICKYBOMB_NAME 		= "KLÆBEBOMBEKASTER"
		STICKYBOMB_DESC 		= " Standard valg for pålidelig skade. Kan placerer op til 50 bomber."
		//
		SCOTTISHRES_NAME 		= "SKOTSKE MODSTAND"
		SCOTTISHRES_DESC 		= " Bomben tager 5 sekunder om at blive armeret og fiser ud efter 10 sekunder, men kan gøre overvældende skade med god timing og en fuld opladning."
		//
		STICKYJUMPER_NAME 		= "KLÆBEHOPPEREN"
		STICKYJUMPER_DESC 		= " Skaber et deaktiveringsfelt, der lammer alle fjender, som rammes af impulsen. (Minibosser er immune over for lammelse)."
		//
		CHARGINTARGE_NAME 		= "ANGREBSSKJOLDET"
		CHARGINTARGE_DESC 		= " Tungt Løb – Overlegen skade ved skjold-bash."
		//
		SPLENDIDSCREEN_NAME 	= "PRAGTIGE SKÆRM"
		SPLENDIDSCREEN_DESC 	= " Hurtig Løb – Overlegen hastighed for genopladning af skjold.."
		//
		TIDETURNER_NAME 		= "TIDEVANDSVENDEREN"
		TIDETURNER_DESC 		= " Eksplosiv Løb - Overlegen bevægelseshastighed ved skjoldangreb."
		//
		QUICKIEBOMB_NAME 		= "KORTE LUNTE"
		QUICKIEBOMB_DESC 		= " Affyrer automatisk klæbebomber med en vanvittig hastighed og meget kort armeringstid. Giver mini-krits ved drab."
		///
		BOTTLE_NAME 			= "FLASKE"
		BOTTLE_DESC 			= " Standard valg for forsvar og mobilitet."
		//
		EYELANDER_NAME 			= "HØJLANDSKLINGEN"
		EYELANDER_DESC 			= " Høj skade med hurtige angreb, der giver krits og mini-krits ved drab, men kan ikke bruges som hybrid-knight."
		//
		SKULLCUTTER_NAME 		= "SKOTTENS KRANIEKLØVER"
		SKULLCUTTER_DESC 		= " I stand til at skære igennem fjendens ÜberLadning og forstyrre Medi-Gevær-funktioner. Kan desuden give øget skade på fjender af samme klasse som dig selv."
		//
		CABER_NAME 				= "ULLAPOOL-PÆLEN"
		CABER_DESC 				= " Skaden øges, i takt med at du bliver såret. Garanteret krits, hvis dit helbred er under 2%. Eksplosionen fra dette angreb vil dræbe dig."
		//
		CLAIDHEAMHMOR_NAME 		= "CLAIDHEAMH MOR"
		CLAIDHEAMHMOR_DESC 		= " For hver 10. drab modtager du en Monoculus-besværgelse (kræver tryllebog)."
		//
		PERSIANPERSUADER_NAME 	= "PERSISKE OVERTALER"
		PERSIANPERSUADER_DESC 	= " Når den parres med et skjold, giver den ubegrænset skjoldangreb. Skjoldangrebet kan ikke afbrydes af skarpe sving eller ved at støde ind i vægge, fjender eller andre forhindringer. Giver immunitet over for lammelse."
		//
		NINEIRON_NAME 			= "NESSIE'S NIER-JERN"
		NINEIRON_DESC 			= " Har en massiv angrebsbue, der er i stand til at ramme flere fjender på én gang i alle retninger. Gør dobbelt kritisk skade."
		//
		SCOTTISHHANDSHAKE_NAME 	= "SKOTSKE HÅNDTRYK"
		SCOTTISHHANDSHAKE_DESC 	= " Mens aktiv: Modstå 90% afstandsskade, bliv immun over for tilbageslag og øg dit maksimale helbred betydeligt. Du kan dog ikke genforsyne dig med ammunition og modtager mindre helbred fra pakker."
		//----------------------------
		//----------------------------
		//----------------------------
		MINIGUN_NAME 			= "RULLEKANON"
		MINIGUN_DESC 			= " Standard valg for pålidelig skade. Giver et kortvarigt minikrit boost ved drab."
		//
		NATASCHA_NAME 			= "NATASCHA"
		NATASCHA_DESC 			= " Sinker fjender ved hit og markerer dem til døden."
		//
		BRASSBEAST_NAME 		= "MESSINGBÆSTET"
		BRASSBEAST_DESC 		= " Højere skade med meget langsom opspinningstid. Bevægelseshastigheden er voldsomt reduceret, når våbnet er i brug. I stand til at afbøje indkommende projektiler."
		//
		TOMISLAV_NAME 			= "TOMISLAV"
		TOMISLAV_DESC 			= " Opbygger 'Varme' ved at gøre skade. Alle statistikker på dette våben øges baseret på varmeniveauet. Våbnet begynder dog at køle ned, hvis der går for lang tid, uden at du gør skade."
		//
		HUOHEATER_NAME 			= "HUO-LONG HEDER"
		HUOHEATER_DESC 			= " Affyrer energistråler, der antænder fjender ved træf."
		//
		GENUINEHUOHEATER_NAME 	= "ÆGTE HUO-LONG HEDER"
		GENUINEHUOHEATER_DESC 	= " Affyrer raketter. Garanteret krits mod brændende fjender."
		///
		SHOTGUN_HVY_NAME 		= "HAGLGEVÆR - HEAVY"
		SHOTGUN_HVY_DESC 		= " Enkelt skud med høj skade, der giver 8 sekunders crits ved drab."
		//
		SANDVICH_NAME 			= "SANDVICHEN"
		SANDVICH_DESC 			= " Gendanner op til 150.000 helbred. Enhver skade modtaget, mens denne genstand er aktiv, er dødelig."
		//
		DALOKOHSBAR_NAME 		= "DALOKOHS BAR"
		DALOKOHSBAR_DESC 		= " Gendanner op til 20.000 helbred. Hvis den bruges, mens du har under 350 helbred, får du en stor overheal. Øger passivt mængden af skade, du modtager, men giver en chance for selv-ÜberLadning, når du tager skade."
		//
		BUFFALOSTEAK_NAME 		= "BØFFELBØF-SANDVICHEN"
		BUFFALOSTEAK_DESC 		= " Giver passiv immunitet over for kritiske slag."
		//
		FAMILYBUSINESS_NAME 	= "FAMILIEFORRETNINGEN"
		FAMILYBUSINESS_DESC 	= " Ubegrænset ammunition. Angrebshastigheden fordobles, mens du modtager en helbredende effekt. Giver et kortvarigt crit-boost og mini-crit-boost ved drab."
		//
		FISHCAKE_NAME 			= "FIKEFRIKADELLE"
		FISHCAKE_DESC 			= " Kraftig modstand mod SKUD-skade, men mere sårbar over for ILD- og SPRÆNG-skade."
		//
		SECONDBANANA_NAME 		= "ANDEN BANAN"
		SECONDBANANA_DESC 		= " Kraftig modstand mod SPRÆNG-skade, men mere sårbar over for ILD- og SKUD-skade."
		///
		FISTS_NAME 				= "NÆVER"
		FISTS_DESC 				= " Standardvalg til forsvar og mobilitet. Effektiv i kamp."
		//
		KILLINGGLOVES_NAME 		= "KALININS GRUSOMME BOKSEHANDSKER"
		KILLINGGLOVES_DESC 		= " Speciel evne: 'Mega-Knus' – Når den er tilgængelig, kan du trykke på din handlingsknap, mens du står på bomben, for øjeblikkeligt at sende den tilbage til start. Ellers modtager du en midlertidig buff til bevægelseshastighed, forsvar og krits."
		//
		GLOVESRUNNING_NAME 		= "GEVALDIGT RAPFODEDE UNIONSHANDSKER"
		GLOVESRUNNING_DESC 		= " Giver passivt evnen til at folde en faldskærm ud. Mens den er aktiv, får du massivt øget hoppehøjde, skadesmodstand og helbredsregenerering."
		//
		BREADBITE_NAME 			= "BRØDBIDDET"
		BREADBITE_DESC 			= " Kritiske hits inficerer dit offer med Corrosion,en permanent debuff, der gør skade baseret på maksimalt helbred og får offeret til at eksplodere i en lille ætsende sky ved død, hvilket spreder effekten til andre fjender."
		//
		WARRIRORSSPIRIT_NAME 	= "KRIGERENS ÅND"
		WARRIRORSSPIRIT_DESC 	= " Venstreklik for at springe højt op i luften. Land på fjender for at give massiv stomp skade. Fjerner al primær og sekundær ammunition."
		//
		FISTSOFSTEEL_NAME 		= "STÅLNÆVERNE"
		FISTSOFSTEEL_DESC 		= " Bliv til en gigantisk Heavy-handske med 250.000 helbred. Du er immun over for skubbekræfter og kan gøre massiv skade. Fjerner al primær og sekundær ammunition. Du kan kun modtage helbredelse fra madkasse genstande."
		//
		EVICTIONNOTICE_NAME 	= "UDSÆTTELSESVARSLET"
		EVICTIONNOTICE_DESC 	= " Modtag en hurtig helbredende effekt ved drab."
		//
		APOCOFISTS_NAME 		= "APOKO-NÆVERNE"
		APOCOFISTS_DESC 		= " Slag skubber fjender væk"
		//
		HOLIDAYPUNCH_NAME 		= "HELLIGDAGSSLAGET"
		HOLIDAYPUNCH_DESC 		= " Mens den er aktiv, ignorerer alle fjender dig. Giver også immunitet over for lammelse. Dette våben kan dog ikke gøre skade."
		//----------------------------
		//----------------------------
		//----------------------------
		SHOTGUN_ENGI_NAME		= "HAGLGEVÆR- ENGINEER"
		SHOTGUN_ENGI_DESC 		= " Gør x4 skade til din Sentrys mål."
		//
		FRONTIERJUSTICE_NAME 	= "PRÆRIENS HÆVN"
		FRONTIERJUSTICE_DESC 	= " Sindssygt høj skudhastighed. Magasinstørrelsen svarer til det maksimale antal hævn-krits. Genlader hurtigere, mens du modtager en helbredende effekt."
		//
		WIDOWMAKER_NAME 		= "ENKEMAGEREN"
		WIDOWMAKER_DESC 		= " Brug 2.000 metal på at affyre et bredt skud, der skubber fjender væk."
		//
		POMSON_NAME 			= "POMSON 6000"
		POMSON_DESC 			= " Påfør blødning, sæt ild til fjender og gør dem langsommere."
		//
		RESCUERANGER_NAME 		= "AFSTANDSREDDER"
		RESCUERANGER_DESC		= " Bruger 20 metal pr. skud, men skal aldrig genlades og øger maksimal metal med 1.000."
		///
		WRANGLER_NAME 			= "FJERNBETJENEREN"
		WRANGLER_DESC 			= " Mens aktiv: Øget Sentry-skade og dobbelt rækkevidde for Dispensere."
		//
		SHORTCIRCUIT_NAME 		= "KORTSLUTNINGEN"
		SHORTCIRCUIT_DESC 		= " For hver 10. drab modtager du en Lightning Ball spell-ladning (kræver Tryllebog)."
		///
		WRENCH_NAME 			= "SKRUENØGLE"
		WRENCH_DESC 			= " Standardvalg for pålidelig skade."
		//
		GUNSLINGER_NAME 		= "ROPROTESEN"
		GUNSLINGER_DESC	 		= " Kan bygge en sekundær Sentry. En tredobbelt slag-kombination kan henrette små fjender og gør massiv skade på giganter."
		//
		SOUTHERNHOS_NAME 		= "SYDENS GÆSTFRIHED"
		SOUTHERNHOS_DESC 		= " Erstatter den normale Sentry med en Flamme Sentry. Kort rækkevidde, men høj skade."
		//
		JAG_NAME 				= "JAGUAREN"
		JAG_DESC 				= " Din Sentry har uendelig rækkevidde."
		//
		EUREKAEFFECT_NAME 		= "EUREKA-EFFEKTEN"
		EUREKAEFFECT_DESC 		= " Mens du bærer din Sentry Gun, kan du trykke på 'Genlad'-tasten for at placere den på en hvilken som helst væg eller loft inden for rækkevidde."
		//----------------------------
		//----------------------------
		//----------------------------
		SYRINGEGUN_NAME			= "INJEKTIONSSPRØJTEPISTOL"
		SYRINGEGUN_DESC			= " Få 0.5% ÜberLadning ved træffer."
		//
		BLUTSAUGER_NAME			= "BLUTSAUGER"
		BLUTSAUGER_DESC			= " Kræver og forbruger 100 % Ubercharge for at omprogrammere en robot til midlertidigt at kæmpe for dit hold, før den selvdestruerer. Alt-Skyd: Afbryd manuelt omprogrammeringen af alle berørte robotter."
		//
		CRUSADERSCROSSBOW_NAME	= "KORSRIDDERENS ARMBRØST"
		CRUSADERSCROSSBOW_DESC	= " Få 0,25 % UberLadning ved træffer, påfør blødning og modtag yderligere 0,5 % UberLadning pr. tick af blødningsskade."
		//
		OVERDOSE_NAME 			= "OVERDOSEN"
		OVERDOSE_DESC 			= " Kræver og forbruger 100 % UberLadning for at sende en impuls, der deaktiverer alle små fjender i nærheden i op til 15 sekunder."
		///
		MEDIGUN_NAME			= "MEDI-GEVÆR"
		MEDIGUN_DESC			= " Maksimumgrænsen for Overheal er øget til x10 af patientens maksimale helbred. Brug et langvarigt niveau 1 Projektilskjold."
		//
		KRITZKRIEG_NAME			= "KRITZKRIEG"
		KRITZKRIEG_DESC			= " I stand til at dræne helbred fra fjender, hvilket giver selv-heling og opbygger Uber."
		//
		QUICKFIX_NAME			= "HURTIGE FIKS"
		QUICKFIX_DESC			= " Meget hurtig helbredelse med et niveau 2 Projektilskjold. I stand til at opbygge Uber fra skjoldets kontaktskade."
		//
		VACCINATOR_NAME			= "VACCINATOR"
		VACCINATOR_DESC			= " Aktiv helbredelse giver dig og patienten 100 % modstand mod basisskade fra den valgte skadetype. UberLadning giver fuld immunitet over for den valgte skadetype i 30 sekunder."
		///
		BONESAW_NAME 			= "KNOGLESAV"
		BONESAW_DESC			= " Standard valgmulighed for forsvar og mobilitet. Modtag 10 % Uber ved hit."
		//
		UBERSAW_NAME 			= "ÜBERSAVEN"
		UBERSAW_DESC			= " Påfør blødning ved hit. Modtag 2 % Über ved hit."
		//
		VITASAW_NAME 			= "VITA-SAVEN"
		VITASAW_DESC			= " Modtag en Overheal spell-ladning ved hit (kræver Tryllebog). Modtag 5 % Uber ved hit."
		//
		AMPUTATOR_NAME 			= "AMPUTØREN"
		AMPUTATOR_DESC			= " Ved træf: Dit Medi-gevær bliver supercharged og får midlertidigt øget helbredelsesrate, Über-rate og rækkevidde. Drab på en fjende giver en stærkere version af denne effekt."
		//
		SOLEMNVOW_NAME 			= "HØJTIDELIGE LØFTE"
		SOLEMNVOW_DESC			= " Uendelig rækkevidde, rammer alle fjender forbundet via Medi-gevær stråler og gør x200 skade på Medic robotter. Modtag 5 % Über for hver fjende, der rammes."
		//----------------------------
		//----------------------------
		//----------------------------
		SNIPERRIFLE_NAME 		= "SNIGSKYTTERIFFEL"
		SNIPERRIFLE_DESC 		= " Fuldt opladet hovedskud gør 450.000 i skade."
		//
		MACHINA_NAME 			= "MACHINA"
		MACHINA_DESC 			= " Meget langsom at lade op, men kan flænse Tanks ved fuld opladning. Drab på fjender fylder en raserimåler, der giver et 1-sekunds kritisk boost. Kombiner det kritiske boost med en fuld opladning for øjeblikkeligt at destruere de fleste Tanks, du møder."
		//
		HITMANSHEATMAKER_NAME 	= "SNIGMORDERENS SAGSLUTTER"
		HITMANSHEATMAKER_DESC 	= " Hurtigskydende uden at gå ud af sigtet. Ingen skade ved kropsskud."
		//
		AWPERHAND_NAME 			= "AWPER HAND"
		AWPERHAND_DESC 			= " Affyr eksplosive projektiler og generér raseri ved drab. Ved 100 % raseri kan du trykke på 'genlad' for at få øget maksimalt helbred og helbredsregenerering. Riflen lader kun op, når der er fjender i dit sigte."
		//
		HUNTSMAN_NAME 			= "JÆGEREN"
		HUNTSMAN_DESC 			= " Affyr 5 pile på én gang. Gør massiv brandskade, hvis en Pyro antænder din pil."
		//
		SYDNEYSLEEPER_NAME 		= "SYDNEY-SOVEREN"
		SYDNEYSLEEPER_DESC 		= " Affyr en speciel pil, der lammer bevægelsen hos ikke-giganter og gør fjender ude af stand til at modtage heling fra Medic robotter."
		//
		BAZAARBARGAIN_NAME 		= "RØVERKØBET"
		BAZAARBARGAIN_DESC 		= " Drab på fjender af samme klasse i træk øger din skudrate og kan stackes op til 3 gange. Drab på en anden klasse nulstiller din combo."
		//
		FORTIFIEDCOMPOUND_NAME 	= "SAMMENSATTE BEFÆSTNING"
		FORTIFIEDCOMPOUND_DESC 	= " Reduceret skade i forhold til Jægeren, men skyder hurtigere, penetrerer fjender og gør kritiske slag på våde fjender."
		//
		CLASSIC_NAME 			= "KLASSIKEREN"
		CLASSIC_DESC 			= " Affyr så hurtigt som du kan trykke på aftrækkeren, eller oplad et enkelt skud med voldsom Eksplosivt hovedskud-kraft, der udraderer alle ikke-gigantiske robotter i området."
		///
		SMG_NAME 				= "MASKINPISTOL"
		SMG_DESC 				= " I stand til at gøre hovedskud for betydeligt øget skade. Alt-Skyd: Zoom ind og få 100 % nøjagtighed på bekostning af halveret skudrate."
		//
		RAZORBACK_NAME 			= "STIKSKJOLDET"
		RAZORBACK_DESC 			= " Meget hurtig genopladning og påfører Jarate på din angriber."
		//
		JARATE_NAME 			= "JARATE"
		JARATE_DESC 			= " Øjeblikkelig genopladning, sænker fjendens hastighed."
		//
		DARWIN_NAME 			= "DARWIN'S FARESKJOLD"
		DARWIN_DESC 			= " Næsten immun over for ILD-skade, men tager 50 % mere skade fra SKUD og SPRÆNG."
		//
		COZYCAMPER_NAME 		= "BEKVEMME CAMPIST"
		COZYCAMPER_DESC 		= " Mindre stigning i bevægelseshastighed, maksimalt helbred og helbredsregenerering. Immun over for efterforbrænding."
		//
		CLEANERSCARBINE_NAME 	= "KRYBSKYTTENS KARABIN"
		CLEANERSCARBINE_DESC 	= " Mini-kritisk boost varer i 30 sekunder."
		//
		BEAUTYMARK_NAME 		= "SELVBEVIDSTE SKØNHEDSPLET"
		BEAUTYMARK_DESC 		= " Lad hellig helvedesild regne ned med flammende pile. Alt-Skyd: Kast en klynge af flammende pile på én gang."
		///
		KUKRI_NAME 				= "KUKRI"
		KUKRI_DESC 				= " Standardvalg for forsvar og mobilitet."
		//
		TRIBALMANSSHIV_NAME 	= "STAMMEMANDENS MACHETE"
		TRIBALMANSSHIV_DESC 	= " Utility Genstand - Du er ikke påvirket af tyngdekraften og kan flyve frit."
		//
		BUSHWACKA_NAME 			= "LØVBASKEREN"
		BUSHWACKA_DESC 			= " Uendelig rækkevidde med nærkampsvåben og garanterede kritiske slag mod brændende fjender."
		//
		SHAHANSHAH_NAME 		= "SHAHANSHAH"
		SHAHANSHAH_DESC 		= " Venstreklik for at sende dig selv flyvende opad, hvilket er godt til at nå høje steder. Du er desuden immun over for faldskade."
		//----------------------------
		//----------------------------
		//----------------------------
		REVOLVER_NAME 			= "REVOLVER"
		REVOLVER_DESC 			= " Ved træf: Påfør flere debuffs, få fjender til at tage øget skade i en kort periode, tøm fjendtlige Medic robotters ÜberLadning og tving Spy robotter ud af deres forklædning. Kan lamme fjender i luften."
		//
		AMBASSADOR_NAME 		= "AMBASSADØREN"
		AMBASSADOR_DESC 		= " Gør massiv hovedskuds-skade. Skaden fordobles, hvis du ikke er forklædt."
		//
		LETRANGER_NAME 			= "L'ETRANGER"
		LETRANGER_DESC 			= " I stand til at henrette enhver ikke-gigant med et enkelt skud. Gør og ingen skade på giganter eller tanks."
		//
		ENFORCER_NAME 			= "HÅNDHÆVEREN"
		ENFORCER_DESC 			= " Ignorerer skadesmodstand og gemmer et kritisk slag for hvert rygstik eller hver bygning, der ødelægges med en Sapper."
		//
		DIAMONDBACK_NAME 		= "TILBAGELÅNET"
		DIAMONDBACK_DESC 		= " Skaber et sort hul, der trækker fjender til sig."
		///
		SAPPER_NAME 			= "SAPPER"
		SAPPER_DESC 			= " Maksimal lammelsesradius og varighed. Hurtig genopladning."
		//
		REDTAPE_NAME 			= "BUREAUKRATIOPTAGEREN"
		REDTAPE_DESC 			= " Ødelægger Engineer bygninger øjeblikkeligt, men kan kun placere en sapper på én fjende ad gangen."
		///
		KNIFE_NAME 				= "KNIV"
		KNIFE_DESC 				= " Mens den er aktiv, dræner kniven dit helbred, men giver immunitet over for AL skade. Drab genopretter helbredet."
		//
		YOURETERNALREWARD_NAME 	= "DIN EVIGE BELØNNING"
		YOURETERNALREWARD_DESC 	= " Skaden øges, i takt med at du bliver såret, og gør kritiske skade, når dit helbred er under 10%, men kun ved stik forfra. Modstå 90% skade."
		//
		KUNAI_NAME 				= "KYNIKERENS KUNAI"
		KUNAI_DESC 				= " Uendelig rækkevidde med nærkampsvåben. Rygstik udløser en eksplosion, der giver ekstra skade til mål i nærheden."
		//
		BIGEARNER_NAME 			= "STORE INDTJENER"
		BIGEARNER_DESC 			= " Du har en enorm mængde helbred, og sving, der 'misser', får dig til at hele hurtigt, men du modtager friendly fire fra dine holdkammerater."
		//
		WANGAPRICK_NAME 		= "VOODOO-PRIKKET"
		WANGAPRICK_DESC 		= " Drab på en fjende får dig til øjeblikkeligt at blive usynlig i et par sekunder. Du kan angribe fjender, mens du er i denne usynlige tilstand, og lænke drab sammen for at forblive usynlig. Ingen forklædning."
		//
		SHARPDRESSER_NAME 		= "SKARPE PÅKLÆDER"
		SHARPDRESSER_DESC 		= " Rygstik udløser en eksplosion, der giver ekstra skade til mål i nærheden."
		//
		SPYCICLE_NAME 			= "KOLDE SKULDER"
		SPYCICLE_DESC 			= " 'Missede' sving får dig til at springe op i luften for gratis 'surf-stabs', men du kan ikke forklæde dig. Gør massiv skade på giganter ved rygstik."
		///
		INVISWATCH_NAME 		= "USYNLIGHEDSUR"
		INVISWATCH_DESC 		= " Uendelig usynlighed, +10 % hurtigere bevægelseshastighed.."
		//
		DEADRINGER_NAME 		= "GENGANGEREN"
		DEADRINGER_DESC 		= " Udløser et kort boost i bevægelseshastighed ved aktivering, som lader dig dashe i alle retninger. Indkommende skade reduceres med 80%, mens du dasher."
		//
		CLOAKANDDAGGER_NAME		= "STIKKERENS LOMMEUR"
		CLOAKANDDAGGER_DESC		= " Øjeblikkelig syn- og usynlighed."
		//----------------------------
		//----------------------------
		//----------------------------
		FRYINGPAN_NAME 				= "STEGEPANDE"
		FRYINGPAN_DESC 				= " Gør x30 skade til fjender af samme klasse som dig selv og få kritiske slag ved drab."
		//
		SAXXY_NAME 					= "SAXXY"
		SAXXY_DESC 					= " Gør x30 skade til fjender af samme klasse som dig selv og få kritiske slag ved drab."
		//
		MEMORYMAKER_NAME 			= "MINDESKABEREN"
		MEMORYMAKER_DESC			= " Gør x30 skade til fjender af samme klasse som dig selv og få kritiske slag ved drab."
		//
		CONOBJECTOR_NAME			= "MILITÆRNÆGTEREN"
		CONOBJECTOR_DESC			= " For hver 10. drab modtager du en tilfældig trylleformular (Kræver Tryllebog)."
		//
		FREEDOMSTAFF_NAME 			= "FRIHEDSSTAVEN"
		FREEDOMSTAFF_DESC 			= " Lille chance for at undvige et angreb, når du tager skade, og blive ubered i 3 sekunder."
		//
		BATOUTTAHELL_NAME 			= "BAT FRA HELVEDE"
		BATOUTTAHELL_DESC 			= " Mens den er aktiv, er du usårlig over for al indkommende skade og genererer en enorm mængde overheal, men du er fuldstændig sårbar over for tilbageslag."
		//
		HAMSHANK_NAME 				= "SKINKESKAFTET"
		HAMSHANK_DESC 				= " Speciel evne: 'Vital Genopstandelse', når den er tilgængelig, skal du trykke på din handlingsknap for øjeblikkeligt at få 10x overheal og blive immun over for tilbageslag i 20 sekunder."
		//
		NECROSMASHER_NAME 			= "NEKROMANISK NAKKER"
		NECROSMASHER_DESC 			= " Speciel evne: 'Trafikdrab' - Når den er tilgængelig, skal du trykke på din handlingsknap for at gå i Bumper Car-tilstand. Mens du er i Bumper Car-tilstand, er du usårlig, regenererer helbred og kan køre fjender ned."
		//
		CROSSINGGAURD_NAME 			= "CROSSING GUARD"
		CROSSINGGAURD_DESC 			= " Få massiv modstand mod alle nærkampsangreb, herunder rygstik."
		//
		PRINNYMACHETE_NAME 			= "PRINNY-MACHETE"
		PRINNYMACHETE_DESC 			= " Utility Genstand - Sving dette nærkampsvåben for at kaste dig fremad med høj hastighed. Giver immunitet over for faldskade."
		//------------------------------------
	}
	spanish = {
		IH_TRANSLATE_ITEM		= IH_color + "[%s]" + IH_text_color + "%s"
		IH_INCLUDES				= IH_color_header + "[►]\x0826beffBB Tu equipamiento incluye..."
		IH_DIS_MSG_2			= IH_disable_color + "Pon «/itemhelp 1» para desactivar estos mensajes durante una oleada. \nPon «/itemhelp 0» para desactivarlos en todo momento."
		IH_DIS_MSG				= IH_disable_color + "Por «/itemhelp 0» para desactivar estos mensajes. \nPon «/itemhelp 2» para que se muestren siempre."
		IH_BAD_ARGS				= IH_color_header + "[Asistente de artículos]" + IH_error_color + " {Error}\x01 ¡Argumentos incorrectos!\n/itemhelp 2: Activar.\n/itemhelp 1: Activar solo en preparación.\n/itemhelp 0: Desactivar."
		IH_OOB_ARG				= IH_color_header + "[Asistente de artículos]" + IH_error_color + " {Error}\x01 ¡Valor fuera de límites! : %s"
		IH_HELP_MSG				= IH_color_header + "[Asistente de artículos]\x01 El asistente de artículos da descripciones para cada artículo de \x03Caos\x01!"
		IH_DISABLE				= IH_color_header + "[►]\x01 Asistente de artículos desactivado."
		IH_WAVE_SETUP			= IH_color_header + "[►]\x01 Asistente de artículos activado para la preparación."
		IH_ENABLE 				= IH_color_header + "[►]\x01 Asistente de artículos activado."
		LOW_METAL 				= "No hay metal suficiente"
		TOMISLAV_HEAT			= "Temperatura de la Tomislav: %s %%"
		STUCK_RESPAWNED 		= "Has reaparecido para no quedar atascado."
		ABILITY_READY			= "%s\n► Listo ◄"
		ABILITY_CHARGING		= "%s\n%s"
		ABILITY_CHARGING_MSG	= "Cargando: %ss"
		ABILITY_CHARGING_D_MSG	= "Cargando: %s %%"
		MEGACRUSH 				= "MEGAIMPACTO"
		VITALRESURGENCE 		= "RESURGIMIENTO VITAL"
		VEHICULARMANNSLAUGHTER 	= "MANNSACRE SOBRE RUEDAS"
		TEST 					= "Habilidad de prueba"
		NO_MONEY				= "You can't afford this! (Cost: $%s, you have: $%s)" // Dont Translate this, my own project
		REPROG_BOT_STRONG		= TF_TEAM_COLOR_REPROG_B+"%s\x01 resiste demasiado y no puede reprogramarse."
		REPROG_BOT_NOT_SUIT		= TF_TEAM_COLOR_REPROG_B+"%s\x01 no vale para combatir y no puede reprogramarse."
		REPROG_BOT_LEAVE		= TF_TEAM_COLOR_SPEC+"%s ha muerto."
		REPROG_BOT_MESSAGE 		= TF_TEAM_COLOR_RED+"%s\x01 ha reprogramado a "+TF_TEAM_COLOR_REPROG_B+"%s\x01."
		//---------------------------------------------------------
		CHECKPOINT_CREATED		= "\x077c8cc2Punto de control creado:\x078165cf [/%s]"
		CHECKPOINT_WRONG_MAP	= CHECKPOINT_ERROR+"Ese punto de control no era para este mapa."
		CHECKPOINT_WRONG_MISS	= CHECKPOINT_ERROR+"Ese punto de control no era para esta misión."
		CHECKPOINT_EXPIRE		= CHECKPOINT_ERROR+"Ese punto de control ha caducado."
		CHECKPOINT_RESTORE		= "\x0744CC44Resaturado en el último punto de control."
		CHECKPOINT_RESTORE_HUD	= "Resaturado en el último punto de control."
		//---------------------------------------------------------
		SCATTERGUN_NAME 		= "RECORTADA"
		SCATTERGUN_DESC 		= " Una opción estándar para un daño contundente. Extremadamente efectiva a quemarropa."
		//
		FORCENATURE_NAME		= "DISPENSADORA DE CAÑA"
		FORCENATURE_DESC		= " Con tanta fuerza que empuja al disparar. Hace algo menos de daño máximo que la Recortada."
		//
		SHORTSTOP_NAME 			= "PARATENSECO"
		SHORTSTOP_DESC 			= " Una velocidad de disparo frenética y críticos asegurados contra enemigos mojados, pero lenta de recargar."
		//
		SODAPOPPER_NAME 		= "REFRESCOPETA"
		SODAPOPPER_DESC 		= " Mantén el botón de disparo para lanzar 4 ráfagas rápidas."
		//
		BABYFACEBLASTER_NAME	= "DEVASTADORA DEL IMBERBE"
		BABYFACEBLASTER_DESC	= " Mantén el botón de disparo para cargar una ráfaga de hasta 200 tiros, destroza cualquier cosa a quemarropa. El retroceso es apabullante."
		//
		BACKSCATTER_NAME		= "RETROESCOPETA"
		BACKSCATTER_DESC		= " Críticos por la espalda. No necesita munición, su cargador es infinito."
		///
		PISTOL_NAME 			= "PISTOLA"
		PISTOL_DESC 			= " Lanza cohetes en vez de balas. Muy eficaz para la movilidad."
		//
		BONK_NAME 				= "¡BONK! LA BEBIDA SALVAVIDAS"
		BONK_DESC 				= " Bebida radiactiva, da invulnerabilidad sin quitarte la habilidad de atacar."
		//
		CRITACOLA_NAME 			= "CRITICOLA"
		CRITACOLA_DESC 			= " Bebida radioactiva, da críticos durante un tiempo."
		//
		MADMILK_NAME 			= "LECHE LOCA"
		MADMILK_DESC 			= " Los enemigos cubiertos de leche no se pueden mover."
		//
		WINGER_NAME 			= "AEROPISTOLA"
		WINGER_DESC 			= " Olvídate de dar saltos mientras la empuñas. Lanza un único disparo cargado que siempre es crítico mientras estás en el aire. Este disparo además empuja al enemigo."
		//
		PRETTYBOYS_NAME 		= "PISTOLA DE BOLSILLO DEL GUAPERAS"
		PRETTYBOYS_DESC 		= " Lanza cohetes que quitan vida segun los PS de la víctima. El daño aumenta cuando el objetivo pierde vida y la distancia no influye. Disparo secundario: Los misiles guiados hacen -20 % de daño."
		//
		CLEAVER_NAME 			= "GUILLOTINA VOLADORA"
		CLEAVER_DESC 			= " Flecha de Yondu: Invoca una flecha para que te ayude en la batalla. Disparo secundario: Modo diruptor, -75 % de daño."
		//
		MATATEDMILK_NAME 		= "LECHE MUTADA"
		MATATEDMILK_DESC 		= " Lanza frascos explosivos con leche a toda velocidad, causando daño a los enemigos. Disparo secundario: Lanza varios frascos a la vez."
		///
		BAT_NAME 				= "BATE"
		BAT_DESC 				= " Da una probabilidad de ignorar la muerte y regresar a base con 1 PS."
		//
		SANDMAN_NAME			= "SOMNÍFERO"
		SANDMAN_DESC 			= " Permite lanzar a toda velocidad bolas de béisbol con gran velocidad de recarga, causando daño a objetivos individuales."
		//
		HOLYMACKEREL_NAME		= "ARENQUE SAGRADO"
		HOLYMACKEREL_DESC		= " Permite marcar de muerte a varios enemigos."
		//
		CANDYCANE_NAME 			= "BASTÓN DE CARAMELO"
		CANDYCANE_DESC 			= " Artículo de utilidad: No tendrás gravedad y podrás volar libremente."
		//
		BOSTONBASHSER_NAME 		= "MACHACADOR DE BOSTON"
		BOSTONBASHSER_DESC 		= " A mayor riesgo, mejores recompensas. Mata de un golpe a todos los enemigos pequeños, otorgando 10 segundos de críticos. Golpea a ambos jugadores  conectados por un rayo de Pistola Médica. Si el portador falla un golpe, muere."
		//
		SUNONASTICK_NAME		= "SOL-EN-UN-PALO"
		SUNONASTICK_DESC		= " Puede aturdir u otorgar críticos durante unos segundos. Golpea a ambos jugadores  conectados por un rayo de Pistola Médica. Si el portador falla un golpe, se aturde."
		//
		FANOWAR_NAME 			= "ABANICO BÉLICO"
		FANOWAR_DESC 			= " Artículo de utilidad: Sacude este abanico para darte velocidad adicional. Otorga inmunidad al daño por caída."
		//
		ATOMIZER_NAME 			= "ATOMIZADOR"
		ATOMIZER_DESC 			= " No causa daño atacando de forma normal, pero al matar con la burla otorgará 3 minutos de críticos."
		//
		THREERUNEBLADE_NAME 	= "HOJA TRIRRÚNICA"
		THREERUNEBLADE_DESC 	= " Al empuñarla, otorga una bonificación MASIVA de velocidad de movimiento y triple salto. Otorga inmunidad al daño por caída."
		//
		UNARMEDCOMBAT_NAME 		= "ABRAZO DE LA MUERTE"
		UNARMEDCOMBAT_DESC 		= " Cada 10 muertes, otorga un hechizo para generar esqueletos (requiere Libro de Hechizos)."
		//
		WRAPAASSASSIN_NAME 		= "ASESINO ENVUELTO"
		WRAPAASSASSIN_DESC 		= " Permite atacar a los proyectiles para devolverlos. Otorga inmunidad al aturdimiento."
		//----------------------------
		//----------------------------
		//----------------------------
		ROCKETLAUNCHER_NAME		= "LANZACOHETES"
		ROCKETLAUNCHER_DESC		= " Una opción estándar para un daño contundente."
		//
		DIRECTHIT_NAME			= "IMPACTO DIRECTO"
		DIRECTHIT_DESC			= " Disparo secundario: Lanza a un enemigo pequeño al aire para causarle minicríticos fácilmente. Los proyectiles van levemente guiados."
		//
		BLACKBOX_NAME			= "CAJA NEGRA"
		BLACKBOX_DESC			= " Ralentiza enemigos y causa hemorragia. Esta arma causa daño x2 contra Soldier robot."
		//
		ROCKETJUMPER_NAME		= "SALTACOHETES"
		ROCKETJUMPER_DESC		= " Velocidad de disparo y recarga reducida, pero gran capacidad de daño y alcance de explosiones. Excelente para el control de masas."
		//
		LIBERTYLAUNCHER_NAME	= "LIBERTADOR"
		LIBERTYLAUNCHER_DESC	= " Dispara cohetes que van a muy poca velocidad en zonas amplias. Recarga muy lento y tiene poca munición. Esta arma dispara automáticamente al recargarse."
		//
		COWMANGLER_NAME			= "EXPRIMEVACAS 5000"
		COWMANGLER_DESC			= " Inmoviliza a enemigos pequeños al impactar. Los disparos cargados inmovilizan durante más tiempo. Al mantener el disparo secundario se sorbecarga el arma, lanzando un multidisparo más inmovilizador."
		//
		ORIGINAL_NAME			= "ORIGINAL"
		ORIGINAL_DESC			= " Al mantener el botón de disparo se carga una ráfaga de 4 cohetes. Esta arma dispara automáticamente al recargarse."
		//
		BEGGARSBAZOOKA_NAME		= "BAZUCA DEL MENDIGO"
		BEGGARSBAZOOKA_DESC		= " Al mantener el botón de disparo se lanza una ráfaga masiva de 100 proyectiles. Esta arma NO se sobrecarga."
		//
		AIRSTRIKE_NAME			= "ATAQUE AÉREO"
		AIRSTRIKE_DESC			= " Carga hasta 10 cohetes, que dispara a la vez formado un patrón. Estos proyectiles son guiados."
		///
		SHOTGUN_SOLD_NAME 		= "ESCOPETA DEL SOLDIER"
		SHOTGUN_SOLD_DESC 		= " Gran velocidad de disparo y críticos al saltar con explosivos."
		//
		SHOTGUN_NAME 			= "ESCOPETA"
		SHOTGUN_DESC 			= " Una opción estándar para un daño contundente."
		//
		BUFFBANNER_NAME 		= "ESTANDARTE DE ÁNIMO"
		BUFFBANNER_DESC 		= " Alcance ilimitado y gran aumento de duración."
		//
		GUNBOATS_NAME 			= "BOTAS BLINDADAS"
		GUNBOATS_DESC 			= " Permiten hacer el salto del conejo, conocido como «bunnyhop» con la tecla de saltar. Otorga inmunidad al daño por caída."
		//
		BATTALIONS_NAME 		= "REFUERZO DEL BATALLÓN"
		BATTALIONS_DESC 		= " Alcance ilimitado y gran aumento de duración."
		//
		CONCHEROR_NAME 			= "CONCHEROR"
		CONCHEROR_DESC 			= " Alcance ilimitado y gran aumento de duración."
		//
		RESERVESHOOTER_NAME 	= "TIRADOR DE RESERVA"
		RESERVESHOOTER_DESC 	= " Causa 10 000 de daño por disparo sin importar la distancia, con 3 segundos de minicríticos por víctima. Sin embargo, esta arma no puede recibir críticos. Mantén el disparo secundario para apuntar con ella."
		//
		BISON_NAME 				= "BISONTE JUSTICIERO"
		BISON_DESC 				= " Dispara un rayo continuo de daño penetrante con puntería automática."
		//
		MANTREADS_NAME 			= "APLASTACABEZAS"
		MANTREADS_DESC 			= " Reduce mucho el retroceso recibido. Aumenta la velocidad de giro al estrafear por el aire. Aumenta el daño al caer sobre otro jugador."
		//
		BASEJUMPER_NAME 		= "SALTADOR B.A.S.E."
		BASEJUMPER_DESC 		= " Permite abrir y cerrar el paracaídas. Aumenta la resistencia al retroceso y daño de balas, reduciendo la vulnerabilidad en el aire."
		//
		PANICATTACK_NAME 		= "ATAQUE DE PÁNICO"
		PANICATTACK_DESC 		= " Para cuando se necesita un botiquín de emergencia. Restaura 10 000 PS al instante al impactar. Recibir daño empuñando esta arma, puede otorgar invlunerabilidad temporal."
		///
		SHOVEL_NAME 			= "PALA"
		SHOVEL_DESC 			= " Una opción estándar para defensa y movilidad."
		//
		EQUALIZER_NAME 			= "ECUALIZADOR"
		EQUALIZER_DESC 			= " La burla de ataque causa daño masivo y empuja a los jugadores en el aire."
		//
		PAINTRAIN_NAME 			= "TREN DEL DOLOR"
		PAINTRAIN_DESC 			= " Causa hemorragia y ralentiza al impactar. Otorga inmunidad al daño por caída."
		//
		HALFZATOICHI_NAME 		= "KATANA DEL MEDIO ZATOICHI"
		HALFZATOICHI_DESC 		= " Daño medio con gran movilidad de salud y alcance aumentado."
		//
		MARKETGARDENER_NAME 	= "HORTELANO"
		MARKETGARDENER_DESC 	= " Causa daño crítico muy elevado. Al matar, otorga un estado de ira, dando salud adicional, resistencia y aumento de todo tipo de daño. Si el portador falla un golpe, muere."
		//
		DISCIPLINARYACTION_NAME = "ACCIÓN DISCIPLINARIA"
		DISCIPLINARYACTION_DESC	= " Una opción estándar para defensa y movilidad."
		//
		ESCAPEPLAN_NAME			= "PLAN DE HUIDA"
		ESCAPEPLAN_DESC			= " Una opción estándar para defensa y movilidad."
		//----------------------------
		//----------------------------
		//----------------------------
		FLAMETHROWER_NAME 		= "LANZALLAMAS"
		FLAMETHROWER_DESC		= " Una opción estándar para un daño contundente. Otorga un pequeño subidón de minicríticos al matar."
		//
		BACKBURNER_NAME 		= "TUESTALOMOS"
		BACKBURNER_DESC			= " Fuego verde: Marca a los enemigos de muerte y aturde a los que están en el aire. Esta arma causa daño x2 contra Pyros robot."
		//
		DEGREASER_NAME 			= "DESENGRASADOR"
		DEGREASER_DESC			= " Lanzallamas de largo alcance, con gran daño directo pero 0 daño por quemaduras. Esta arma no dispara aire comprimido."
		//
		PHLOGISTINATOR_NAME 	= "FLOGISTONADOR"
		PHLOGISTINATOR_DESC		= " Fuego verde: Marca a los enemigos de muerte y aturde a los que están en el aire. Fuerte contra tanques, pero reduce la velocidad de movimiento."
		//
		RAINBLOWER_NAME 		= "LANZARCOÍRIS"
		RAINBLOWER_DESC			= " Lanzallamas de largo alcance, con poco daño directo pero gran daño por quemaduras. Además permite destruir instantáneamente construcciones de Engineers y quemar a otros Pyros. El aire comprimido es leve, pero rápido."
		//
		DRAGONSFURY_NAME 		= "FURIA DEL DRAGÓN"
		DRAGONSFURY_DESC		= " Velocidad de disparo y aire comprimido muy elevada."
		//
		NOSTROMONAPALMER_NAME 	= "NAPALMEADOR DE NOSTROMO"
		NOSTROMONAPALMER_DESC	= " Ralentiza a los enemigos. Llena un medidor de «Mmmf» similar al Flogistonador, que otorga el efecto del Conchistador. Esta arma no tiene aire comprimido."
		///
		SHOTGUN_PYRO_NAME 		= "ESCOPETA DEL PYRO"
		SHOTGUN_PYRO_DESC 		= " Causa críticos a enemigos en llamas."
		//
		FLAREGUN_NAME 			= "PISTOLA DE BENGALAS"
		FLAREGUN_DESC 			= " Dispara balas que impactan en enemigos. El daño aumenta exponencialmente con cada enemigo en el camino. Además puede llegar a aturdir."
		//
		DETONATOR_NAME 			= "DETONADOR"
		DETONATOR_DESC 			= " La bengala tiene el mismo alcance de explosión. Golpeará todo aquello que esté en la línea de visión del jugador. Gran elección para movilidad."
		//
		MANMELTER_NAME 			= "DERRITEGENTE"
		MANMELTER_DESC 			= " Dispara munición rápidamente que rastrea automáticamente en busca de enemigos. Tiene munición ilimitada y no necesita recargar. Disparo secundario: Dispara muchas a la vez."
		//
		SCORCHSHOT_NAME 		= "CHAMUSCADOR"
		SCORCHSHOT_DESC 		= " Al impactar: Causa mucho daño, apaga las llamas del enemigo y causa retroceso. El objetivo debe estar en llamas o el ataque no hará nada. Disparo secundario: Usa una bengala guiada más lenta."
		//
		THERMALTHRUSTER_NAME 	= "PROPULSOR TÉRMICO"
		THERMALTHRUSTER_DESC 	= " Reduce el consumo de combustible sin ralentizar el lanzamiento. Se puede reutilizar en el aire y causa mucho daño a otro jugador al caer sobre él. Otorga un pequeño subidón de críticos al matar."
		//
		GASPASSER_NAME 			= "Lanzacombustible"
		GASPASSER_DESC 			= " El medidor de gasolina empieza vacío y se reinicia al morir. El medidor se llena al causar 150 000 de daño. La explosión al arder causa 105 000 de daño."
		///
		FIREAXE_NAME 			= "HACHA DE BOMBERO"
		FIREAXE_DESC 			= " Una opción estándar para defensa y movilidad."
		//
		AXTINGUISHER_NAME 		= "HACHERMINADOR"
		AXTINGUISHER_DESC		= " Aumenta significativamente el daño contra enemigos en llamas."
		//
		HOMEWRECKER_NAME 		= "DEMOLEDOR"
		HOMEWRECKER_DESC 		= " Permite destruir al instante las construcciones de Engineers desde donde sea, con alcance cuerpo a cuerpo infinito."
		//
		POWERJACK_NAME 			= "BATEMARTILLO"
		POWERJACK_DESC 			= " Gran velocidad de ataque y movimiento. Causa hemorragia y quema a los enemigos que golpea, además otorga minicríticos al matar."
		//
		BACKSCRATCHER_NAME 		= "RASCAESPALDAS"
		BACKSCRATCHER_DESC 		= " Causa daño letal por la espalda. Al matar, entra en un estado de furia que otorga velocidad de movimiento, resistencia y aumenta el daño de todos los ataques."
		//
		VOLCANOFRAGMENT_NAME 	= "FRAGMENTO VOLCÁNICO AFILADO"
		VOLCANOFRAGMENT_DESC 	= " Probabilidad de aturdir enemigos al impactar. También puede quemar a los Pyros."
		//
		POSTALPUMMELER_NAME 	= "PALIZA POSTAL"
		POSTALPUMMELER_DESC 	= " Al impactar: Confunde al enemigo, haciendo que retrocedan con la bomba durante unos segundos. Mantén el disparo secundario al atacar para volver a la base."
		//
		MAUL_NAME 				= "MUTILADOR"
		MAUL_DESC 				= " Al impactar: Lanza los enemigos al aire con gravedad reducida."
		//
		THIRDDEGREE_NAME 		= "TERCER GRADO"
		THIRDDEGREE_DESC 		= " El portador se vuelve casi inmune al fuego y recibe gran resistencia a todos los ataques mientras la empuña."
		//
		LOLLICHOP_NAME 			= "PYROLETA"
		LOLLICHOP_DESC 			= " Cada 10 víctimas, otorga un hechizo de lluvia de meteoritos (requiere Libro de Hechizos)."
		//
		NEONANNIHILATOR_NAME 	= "ANIQUILADOR DE NEÓN"
		NEONANNIHILATOR_DESC 	= " Tu gravedad se reduce."
		//
		HOTHAND_NAME 			= "MANO CALIENTE"
		HOTHAND_DESC 			= " Lanza a los enemigos al aire de un golpe."
		//----------------------------
		//----------------------------
		//----------------------------
		GRENADELAUNCHER_NAME 	= "LANZAGRANADAS"
		GRENADELAUNCHER_DESC	= " Una opción estándar para un daño contundente."
		//
		LOCHNLOAD_NAME 			= "BOMBSTRUO DEL LAGO NESS"
		LOCHNLOAD_DESC			= " Dispara muy lento, pero tiene una gran capacidad de daño en zonas amplias. Excelente para el control de masas."
		//
		ALIBABA_NAME			= "BABUCHAS DE ALÍ BABÁ"
		ALIBABA_DESC			= " Mejora el daño del escudo. Otorga inmunidad al daño por caída."
		//
		BOOTLEGGER_NAME			= "PATAPALO"
		BOOTLEGGER_DESC			= " Mejora la velocidad de carga de embestida del escudo. Otorga inmunidad al daño por caída."
		//
		LOOSECANNON_NAME		= "BALA PERDIDA"
		LOOSECANNON_DESC		= " Carga hasta 4 bolas de cañón para poder lanzarlas a la vez en disposición vertical. Las bolas de cañón explotan al tocar el suelo."
		//
		IRONBOMBER_NAME			= "BOMBARDERO DE ACERO"
		IRONBOMBER_DESC			= " Ignora la resistencia del enemigo y otorga un breve subidón de críticos al matar. No requiere munición, su cargador es infinito. Los proyectiles pueden rebotar en las paredes."
		///
		STICKYBOMB_NAME 		= "LANZABOMBAS LAPA"
		STICKYBOMB_DESC 		= " Una opción estándar para un daño contundente. Permite colocar hasta 50 bombas."
		//
		SCOTTISHRES_NAME 		= "RESISTENCIA ESCOCESA"
		SCOTTISHRES_DESC 		= " Cada bomba tarda 5 segundos en armarse y empieza a chisporrotear pasados 10 segundos, pero puede causar buena cantidad de daño con buena precisión y una carga completa."
		//
		STICKYJUMPER_NAME 		= "SALTALAPAS"
		STICKYJUMPER_DESC 		= " Crea un campo inhibidor, aturdiendo a todos los enemigos que lo pisen (los minijefes son inmunes a esto)."
		//
		CHARGINTARGE_NAME 		= "TARGE DE CARGA"
		CHARGINTARGE_DESC 		= " Embestida pesada: Gran daño del escudo."
		//
		SPLENDIDSCREEN_NAME 	= "ESCUDO ESPLÉNDIDO"
		SPLENDIDSCREEN_DESC 	= " Embestida rápida: Gran velocidad de recarga del escudo."
		//
		TIDETURNER_NAME 		= "TUERCEOLAS"
		TIDETURNER_DESC 		= " Embestida explosiva: Gran capacidad de giro del escudo."
		//
		QUICKIEBOMB_NAME 		= "LANZABOMBAS RÁPIDO"
		QUICKIEBOMB_DESC 		= " Dispara bombas lapa automáticamente a una velocidad frenética, armándose al instante. Otorga minicríticos al matar."
		///
		BOTTLE_NAME 			= "BOTELLA"
		BOTTLE_DESC 			= " Una opción estándar para defensa y movilidad."
		//
		EYELANDER_NAME 			= "INTUERTAL"
		EYELANDER_DESC 			= " Causa mucho daño, con ataques rápidos, otorgando críticos y minicríticos al matar. No puede usarse como Democaballero híbrido."
		//
		SKULLCUTTER_NAME 		= "CORTACRÁNEOS ESCOCÉS"
		SKULLCUTTER_DESC 		= " Se puede utilizar contra una Supercarga y detener las funciones de una Pistola Médica. También causa mucho daño contra enemigos de la misma clase."
		//
		CABER_NAME 				= "CÁBER DE ULLAPOOL"
		CABER_DESC 				= " El daño aumenta a medida que sufres daños. Otorga críticos si la salud está por debajo del 2 %. La explosión de este artículo, mata al portador."
		//
		CLAIDHEAMHMOR_NAME 		= "CLAIDHEAMH MÒR"
		CLAIDHEAMHMOR_DESC 		= " Cada 10 víctimas, otorga el hechizo Monóculus (requiere Libro de Hechizos)."
		//
		PERSIANPERSUADER_NAME 	= "PERSA PERSUASIVO"
		PERSIANPERSUADER_DESC 	= " Al combinarse con un escudo, otorga una carga de escudo infinita. La embestida del escudo no puede detenerse por esquinas ni al chocar contra paredes, enemigos u otros obstáculos. Otorga inmunidad al aturdimiento."
		//
		NINEIRON_NAME 			= "HIERRO DEL NUEVE DE NESSIE"
		NINEIRON_DESC 			= " Tiene un alcance apabullante, permite golpear a varios enemigos a la vez, en todas las direcciones. Causa daño crítico doble."
		//
		SCOTTISHHANDSHAKE_NAME 	= "SALUDO ESCOCÉS"
		SCOTTISHHANDSHAKE_DESC 	= " Al activar: Resiste al 90 % de los ataques a distancia, se hace inmune al retroceso y aumenta la salud máxima. Sin embargo, no puedes recuperar munición y recibes menos PS de botiquines."
		//----------------------------
		//----------------------------
		//----------------------------
		MINIGUN_NAME 			= "AMETRALLADORA"
		MINIGUN_DESC 			= " Una opción estándar para un daño contundente. Otorga un pequeño subidón de minicríticos al morir."
		//
		NATASCHA_NAME 			= "NATASCHA"
		NATASCHA_DESC 			= " Ralentiza a los enemigos a dispararles y los marca de muerte."
		//
		BRASSBEAST_NAME 		= "TITÁN DE LATÓN"
		BRASSBEAST_DESC 		= " Hace mucho daño, pero gira muy lentamente. La velocidad de movimiento es nula mientras está desplegada. Permite devolver proyectiles."
		//
		TOMISLAV_NAME 			= "TOMISLAV"
		TOMISLAV_DESC 			= " Se llena la barra de «Temperatura» al disparar. A medida que esta aumenta, todas las estadísticas aumentan. Sin embargo, el arma tiene que enfriarse si pasas mucho tiempo sin causar daños."
		//
		HUOHEATER_NAME 			= "ACHICHARRADORA HUO-LONG"
		HUOHEATER_DESC 			= " Lanza rayos de energía, quemando a los enemigos al impactar."
		//
		GENUINEHUOHEATER_NAME 	= "ACHICHARRADORA HUO-LONG GENUINA"
		GENUINEHUOHEATER_DESC 	= " Dispara proyectiles. Causa críticos contra enemigos en llamas."
		///
		SHOTGUN_HVY_NAME 		= "ESCOPETA DEL HEAVY"
		SHOTGUN_HVY_DESC 		= " Un único disparo que causa mucho daño, otorga 8 8 segundos de críticos al matar."
		//
		SANDVICH_NAME 			= "FOCATA"
		SANDVICH_DESC 			= " Restaura hasta 150 000 PS. Cualquier daño recibido con este artículo en la mano, es letal."
		//
		DALOKOHSBAR_NAME 		= "CHOCOLATINA DALOKOHS"
		DALOKOHSBAR_DESC 		= " Restaura hasta 20 000 PS. Si se usa por debajo de 350 PS, se obtendrá un exceso de curación. Además aumenta del daño y otorga la posibilidad de hacer invencible al recibir daño."
		//
		BUFFALOSTEAK_NAME 		= "FOCATA DE FILETE DE BÚFALO"
		BUFFALOSTEAK_DESC 		= " Otorga inmunidad pasiva a impactos críticos."
		//
		FAMILYBUSINESS_NAME 	= "NEGOCIO FAMILIAR"
		FAMILYBUSINESS_DESC 	= " Munición ilimitada. Doble de velocidad de ataque al recibir curación. Otorga un breve subidón de críticos y minicríticos al matar."
		//
		FISHCAKE_NAME 			= "BARRITA DE PESCADO"
		FISHCAKE_DESC 			= " Otorga al Heavy resistencia a las BALAS, pero mayor vulnerabilidad a FUEGO y EXPLOSIONES."
		//
		SECONDBANANA_NAME 		= "BANANA SEGUNDONA"
		SECONDBANANA_DESC 		= " Otorga al Heavy resistencia a las EXPLOSIONES, pero mayor vulnerabilidad a FUEGO y BALAS."
		///
		FISTS_NAME 				= "PUÑOS"
		FISTS_DESC 				= " Una opción estándar para defensa y movilidad. Eficaz en combate."
		//
		KILLINGGLOVES_NAME 		= "KAÑONEROS GUANTES DE BOXEO"
		KILLINGGLOVES_DESC 		= " Habilidad especial: «Megaimpacto». Al estar disponible, pulsa el botón de acción junto a la bomba para devolverla al principio. En otra situación, otorga velocidad, críticos y defensa temporal."
		//
		GLOVESRUNNING_NAME 		= "GUANTES DE RAPIDEZ ULTRATERRENA"
		GLOVESRUNNING_DESC 		= " Otorgan la capacidad de desplegar un paracaídas. Al tenerlos fuera, la altura de los saltos será mucho mayor, la resistencia al daño aumenta y la salud se regenera."
		//
		BREADBITE_NAME 			= "PANPUÑOS"
		BREADBITE_DESC 			= " Los impactos críticos causan Corrosión en la víctimas, un efecto perjudicial que causa daño según los PS máximos de la víctima y hace que, al morir, explote dejando una pequeña nube de corrosión, esparciendo su efecto."
		//
		WARRIRORSSPIRIT_NAME 	= "ZARPAS DEL GUERRERO"
		WARRIRORSSPIRIT_DESC 	= " Usa el ataque principal para dar un gran salto. Cae sobre enemigos para causar gran cantidad de daño. Elimina toda la munición principal y secundaria."
		//
		FISTSOFSTEEL_NAME 		= "PUÑOS DE ACERO"
		FISTSOFSTEEL_DESC 		= " Conviértete en un Heavy gigante con 250 000 PS. Eres inmune a empujones y causas gran cantidad de daño. Elimina toda la munición principal y secundaria. Solo te puedes curar de artículos de tipo fiambrera."
		//
		EVICTIONNOTICE_NAME 	= "ORDEN DE DESHAUCIO"
		EVICTIONNOTICE_DESC 	= " Otorga un efecto de curación al matar."
		//
		APOCOFISTS_NAME 		= "PUÑOS CATACLÍSMICOS"
		APOCOFISTS_DESC 		= " Los puños empujan a los enemigos."
		//
		HOLIDAYPUNCH_NAME 		= "PUÑETAZO FESTIVO"
		HOLIDAYPUNCH_DESC 		= " Al usarlos, todos los enemigos te ignoran. Además eres inmune al aturdimiento. Esta arma no puede causar daño."
		//----------------------------
		//----------------------------
		//----------------------------
		SHOTGUN_ENGI_NAME		= "ESCOPETA DEL ENGINEER"
		SHOTGUN_ENGI_DESC 		= " Causa daño x4 al objetivo de tu arma centinela."
		//
		FRONTIERJUSTICE_NAME 	= "JUSTICIERA"
		FRONTIERJUSTICE_DESC 	= " Una velocidad de disparo alucinante. El tamaño del cargador coincide con la cuenta de críticos de venganza máximos. Recarga más rápido al recibir curación."
		//
		WIDOWMAKER_NAME 		= "ENVIUDADORA"
		WIDOWMAKER_DESC 		= " Usa 2 000 de metal para disparar un disparo amplio que empuja a los enemigos."
		//
		POMSON_NAME 			= "POMSON 6000"
		POMSON_DESC 			= " Causa hemorragia, quemaduras y ralentiza al enemigo."
		//
		RESCUERANGER_NAME 		= "RESCATADORA"
		RESCUERANGER_DESC		= " Usa 20 de metal por disparo, pero nunca tiene que recargar y aumenta el metal máximo a 1 000."
		///
		WRANGLER_NAME 			= "ARREO"
		WRANGLER_DESC 			= " Al empuñarlo: Aumenta el daño del arma centinela y duplica el alcance del dispensador."
		//
		SHORTCIRCUIT_NAME 		= "CORTOCIRCUITADOR"
		SHORTCIRCUIT_DESC 		= " Cada 10 víctimas, otorga un hechizo de esfera de relámpagos (requiere Libro de Hechizos)"
		///
		WRENCH_NAME 			= "LLAVE INGLESA"
		WRENCH_DESC 			= " Una opción estándar para un daño contundente."
		//
		GUNSLINGER_NAME 		= "FORAJIDO"
		GUNSLINGER_DESC	 		= " Permite construir una segunda arma centinela. El combo del triple puñetazo puede matar a enemigos pequeños y causar daño a gigantes."
		//
		SOUTHERNHOS_NAME 		= "HOSPITALIDAD SUREÑA"
		SOUTHERNHOS_DESC 		= " Modifica el arma centinela, añadiendo un lanzallamas. Menos alcance, pero más daño."
		//
		JAG_NAME 				= "MANITAS"
		JAG_DESC 				= " Tu arma centinela no tiene límite de alcance."
		//
		EUREKAEFFECT_NAME 		= "EFECTO EUREKA"
		EUREKAEFFECT_DESC 		= " Al transportar tu arma centinela, pulsa la tecla de «Recargar» para colocarla de forma remota en cualquier muro o techo a tu alcance."
		//----------------------------
		//----------------------------
		//----------------------------
		SYRINGEGUN_NAME			= "PISTOLA DE JERINGAS"
		SYRINGEGUN_DESC			= " Al impactar: Aumenta en 0,5 % la Supercaga."
		//
		BLUTSAUGER_NAME			= "BLUTSAUGER"
		BLUTSAUGER_DESC			= " Requiere y consume una Supercarga al 100 % para reprogramar un robot para que se una a tu equipo temporalmente, hasta que se autodestruye. Disparo secundario: Anula manualmente la reprogramación de todos los bots afectados."
		//
		CRUSADERSCROSSBOW_NAME	= "BALLETAS DEL CRUZADO"
		CRUSADERSCROSSBOW_DESC	= " Al impactar: Aumenta en 0,25 % la Supercarga, causa hemorragia y aumenta 0,5 % de Supercarga por daño de hemorragia."
		//
		OVERDOSE_NAME 			= "SOBREDOSIS"
		OVERDOSE_DESC 			= " Requiere y consume una Supercarga al 100 % para enviar una carga explosiva que apaga los sistemas de todos los enemigos cercanos hasta 15 segundos."
		///
		MEDIGUN_NAME			= "PISTOLA MÉDICA"
		MEDIGUN_DESC			= " Se aumenta el límite de exceso de curación hasta x10 la salud máxima del paciente. Despliega un duradero escudo de proyectiles de nivel 1."
		//
		KRITZKRIEG_NAME			= "KRITZKRIEG"
		KRITZKRIEG_DESC			= " Permite consumir los PS de los enemigos, curándote y generando Supercarga."
		//
		QUICKFIX_NAME			= "APAÑADOR"
		QUICKFIX_DESC			= " Cura a gran velocidad y despliega un duradero escudo para proyectiles de nivel 2. Permite aumentar la Supercarga al parar daño con el escudo."
		//
		VACCINATOR_NAME			= "VACUNADOR"
		VACCINATOR_DESC			= " Al curar otorga a ambos una resistencia del 100 % al daño base seleccionado. La Supercarga otorga inmunidad total al daño seleccinoado durante 30 segundos."
		///
		BONESAW_NAME 			= "SERRUCHO"
		BONESAW_DESC			= " Una opción estándar para defensa y movilidad. Al impactar: Aumenta un 10 % de Supercarga."
		//
		UBERSAW_NAME 			= "ÜBERSAW"
		UBERSAW_DESC			= " Al impactar: Causa hemorragia y aumenta un 2 % la Supercarga."
		//
		VITASAW_NAME 			= "VITASIERRA"
		VITASAW_DESC			= " Al impactar, otorga un hechizo de exceso de curación (requiere Libro de Hechizos) y aumenta un 5 % la Supercarga."
		//
		AMPUTATOR_NAME 			= "AMPUTADOR"
		AMPUTATOR_DESC			= " Al impactar: Tu Pistola Médica se Supercarga y aumenta temporalmente su velocidad de curación, cantidad de Supercarga y alcance. Al matar: se obtiene el mismo efecto durante más tiempo."
		//
		SOLEMNVOW_NAME 			= "JURAMENTO SOLEMNE"
		SOLEMNVOW_DESC			= " Alcance infinito, golpea a todos los enemigos conectados por un rayo de Pistola Médica y causa x200 de daño a Medics robot. Al impactar: Aumenta un 5 % de Supercarga."
		//----------------------------
		//----------------------------
		//----------------------------
		SNIPERRIFLE_NAME 		= "RIFLE DE FRANCOTIRADOR"
		SNIPERRIFLE_DESC 		= " Un disparo a la cabeza completamente cargado causa 450 000 de daño."
		//
		MACHINA_NAME 			= "MACHINA"
		MACHINA_DESC 			= " Carga muy lentamente, pero puede destruir tanques con un disparo cargado. Al matar enemigos se llena el medidor que otorga 1 segundo de críticos. El crítico con una carga completa permite destruir tanques de un disparo."
		//
		HITMANSHEATMAKER_NAME 	= "ASESINO A SUELDO"
		HITMANSHEATMAKER_DESC 	= " Dispara rápidamente sin apuntar. Solo hace daño a la cabeza."
		//
		AWPERHAND_NAME 			= "AWPA CABEZAS"
		AWPERHAND_DESC 			= " Dispara munición explosiva y aumenta el medidor al matar. Al llenar el medidor al 100 %, pulsa «Recargar» para aumentar la salud al máximo y regenerarla. El rifle solo carga cuando tienes un enemigo en la mirilla."
		//
		HUNTSMAN_NAME 			= "CAZADOR"
		HUNTSMAN_DESC 			= " Dispara 5 flechas a la vez. Causa daño por quemaduras si un Pyro quema tu flecha."
		//
		SYDNEYSLEEPER_NAME 		= "ADORMECEDOR DE SÍDNEY"
		SYDNEYSLEEPER_DESC 		= " Dispara un dardo especial que ralentiza los movimientos de robots que no sean gigantes e impide que reciban curación de Medics robot."
		//
		BAZAARBARGAIN_NAME 		= "GANGA DEL BAZAR"
		BAZAARBARGAIN_DESC 		= " Al matar enemigos de la misma clase seguidos, aumenta la velocidad de disparo, hasta 3. Al matar una clase distinta se reinicia el combo."
		//
		FORTIFIEDCOMPOUND_NAME 	= "COMPUESTO FORTIFICADO"
		FORTIFIEDCOMPOUND_DESC 	= " Hace menos daño que el Cazador, pero dispara más rápido, atraviesa y causa crítico en enemigos mojados."
		//
		CLASSIC_NAME 			= "CLÁSICO"
		CLASSIC_DESC 			= " Dispara a la velocidad que puedas apretar el gatillo o carga un único disparo con capacidad explosiva que daña a todos los robots no gigantes cercanos."
		///
		SMG_NAME 				= "METRALLETA"
		SMG_DESC 				= " Permite disparar a la cabeza para causar más daño. Disparo secundario: Aumenta y mejora un 100 % la precisión, reduciendo la velocidad de disparo."
		//
		RAZORBACK_NAME 			= "CAPARAZUMBADOR"
		RAZORBACK_DESC 			= " Recarga muy rápido y aplica Fraskungfú a tu atacante."
		//
		JARATE_NAME 			= "FRASKUNGFÚ"
		JARATE_DESC 			= " Recarga instantánea, ralentiza al enemigo."
		//
		DARWIN_NAME 			= "ESCUDO DE DARWIN"
		DARWIN_DESC 			= " Casi inmune al daño por FUEGO, pero recibe un 50 % más de daño de BALAS y EXPLOSIONES."
		//
		COZYCAMPER_NAME 		= "CAMPISTA COMODÓN"
		COZYCAMPER_DESC 		= " Aumenta levemente la velocidad de movimiento, la salud máxima y la regeneración de salud. Inmune a las quemaduras."
		//
		CLEANERSCARBINE_NAME 	= "CARABINA DEL LIMPIADOR"
		CLEANERSCARBINE_DESC 	= " La bonificación de minicríticos dura 30 segundos."
		//
		BEAUTYMARK_NAME 		= "LUNAR AUTOCONSCIENTE"
		BEAUTYMARK_DESC 		= " Hace caer fuego sagrado con flechas en llamas. Disparo secundario: Lanza un montón de flechas en llamas a la vez."
		///
		KUKRI_NAME 				= "KUKRI"
		KUKRI_DESC 				= " Una opción estándar para defensa y movilidad."
		//
		TRIBALMANSSHIV_NAME 	= "CUCHILLA TRIBAL"
		TRIBALMANSSHIV_DESC 	= " Artículo de utilidad: No tendrás gravedad y podrás volar libremente."
		//
		BUSHWACKA_NAME 			= "MACHETÓN"
		BUSHWACKA_DESC 			= " Alcance cuerpo a cuerpo infinito y críticos contra enemigos en llamas."
		//
		SHAHANSHAH_NAME 		= "SHAHANSHAH"
		SHAHANSHAH_DESC 		= " Usa el ataque principal para echar a volar, ideal para llegar a zonas altas. Además eres inmune al daño por caída."
		//----------------------------
		//----------------------------
		//----------------------------
		REVOLVER_NAME 			= "REVÓLVER"
		REVOLVER_DESC 			= " Al impactar: Aplica varios efectos negativos, hace que los enemigos reciben más daño durante un tiempo, fuerza la Supercarga del Medic y quita el disfraz a los Spies robot. Puede aturdir a enemigos en el aire."
		//
		AMBASSADOR_NAME 		= "EMBAJADORA"
		AMBASSADOR_DESC 		= " Causa gran daño a la cabeza. Hace el doble de daño si no estás disfrazado."
		//
		LETRANGER_NAME 			= "EXTRANJERO"
		LETRANGER_DESC 			= " Permite matar a cualquier robot no gigante de un disparo. No hace daño a gigantes ni tanques."
		//
		ENFORCER_NAME 			= "EJECUTOR"
		ENFORCER_DESC 			= " Ignora la resistencia al daño y almacen críticos por cada apuñalamiento o construcción destruida con un Zapador."
		//
		DIAMONDBACK_NAME 		= "DIAMONDBACK"
		DIAMONDBACK_DESC 		= " Crea un agujero negro donde mete a los enemigos."
		///
		SAPPER_NAME 			= "ZAPADOR"
		SAPPER_DESC 			= " Máxima duración y alcance de aturdimiento. Recarga rápida."
		//
		REDTAPE_NAME 			= "GRABADORA BUROCRÁTICA"
		REDTAPE_DESC 			= " Destruye las construcciones del Engineer al instante, pero no puede sabotear más de una al mismo tiempo."
		///
		KNIFE_NAME 				= "MARIPOSA"
		KNIFE_DESC 				= " Al empuñarla, la Mariposa consume tu salud pero da inmunidad a todos los daños. Al matar restauras tu salud."
		//
		YOURETERNALREWARD_NAME 	= "TU ETERNA RECOMPENSA"
		YOURETERNALREWARD_DESC 	= " El daño aumenta a medida que sufres daños, siendo críticos al bajar del 10 % de salud, pero solo de frente. Resiste un 90 % de daño."
		//
		KUNAI_NAME 				= "KUNAI DEL CONSPIRADOR"
		KUNAI_DESC 				= " Alcance cuerpo a cuerpo infinito. Al apuñalar provoca una explosión, causando daño adicional a los enemigos cercanos."
		//
		BIGEARNER_NAME 			= "CABEZA DE FAMILIA"
		BIGEARNER_DESC 			= " Tienes gran cantidad de salud y cada ataque al aire te cura rápidamente, aunque recibes daño de tus aliados."
		//
		WANGAPRICK_NAME 		= "AGUIJÓN WANGA"
		WANGAPRICK_DESC 		= " Al matar a un enemigo te haces invisible durante unos segundos. Puedes atacar mientras estás invisible y encadenar muertes te mantiene así. No tienes disfraces."
		//
		SHARPDRESSER_NAME 		= "MANGA AFILADA"
		SHARPDRESSER_DESC 		= " Al apuñalar provoca una explosión, causando daño adicional a los enemigos cercanos."
		//
		SPYCICLE_NAME 			= "APUNGELADOR"
		SPYCICLE_DESC 			= " Al atacar al aire saltarás muy alto, pero no puedes disfrazarte. Causa daño adicional a robots gigantes al apuñalarlos."
		///
		INVISWATCH_NAME 		= "RELOJ DE INVISIBILIDAD"
		INVISWATCH_DESC 		= " Invisibilidad infinita, +10 % de velocidad de movimiento."
		//
		DEADRINGER_NAME 		= "DUPLICANTE"
		DEADRINGER_DESC 		= " Registra un breve aumento de velocidad al activarse, permitiendo correr en cualquier dirección. El daño recibido se reduce un 80 % al correr."
		//
		CLOAKANDDAGGER_NAME		= "EMBOZADOR"
		CLOAKANDDAGGER_DESC		= " Te hace invisible y quita la invisibilidad al instante."
		//----------------------------
		//----------------------------
		//----------------------------
		FRYINGPAN_NAME 				= "SARTÉN"
		FRYINGPAN_DESC 				= " Causa x30 de daño a enemigos de la misma clase y otorga críticos al matar."
		//
		SAXXY_NAME 					= "SAXXY"
		SAXXY_DESC 					= " Causa x30 de daño a enemigos de la misma clase y otorga críticos al matar."
		//
		MEMORYMAKER_NAME 			= "INMORTALIZADOR"
		MEMORYMAKER_DESC			= " Causa x30 de daño a enemigos de la misma clase y otorga críticos al matar."
		//
		CONOBJECTOR_NAME			= "OBJETOR DE CONCIENCIA"
		CONOBJECTOR_DESC			= " Cada 10 víctimas, lanza un hechizo al azar (requiere Libro de Hechizos)."
		//
		FREEDOMSTAFF_NAME 			= "BASTÓN DE LA LIBERTAD"
		FREEDOMSTAFF_DESC 			= " Pequeña probabilidad de recibir daño para esquivar el ataque y recibir una Supercarga durante 3 segundos."
		//
		BATOUTTAHELL_NAME 			= "BATE DEL INFIERNO"
		BATOUTTAHELL_DESC 			= " Al empuñarlo, eres invlunerable a cualquier daño y generas un exceso de curación, pero serás totalmente vulnerable al empuje por retroceso."
		//
		HAMSHANK_NAME 				= "MUSLO DE JAMÓN"
		HAMSHANK_DESC 				= " Habilidad especial: «Resurgimiento vital». Al empuñarlo, pulsa tu tecla de acción para ganar x10 de exceso de curación al instante y hacerte inmune al retroceso durante 20 segundos."
		//
		NECROSMASHER_NAME 			= "NECROMACHACADOR"
		NECROSMASHER_DESC 			= " Habilidad especial: «Mannsacrew sobre ruedas». Al empuñarlo, pulsa tu tecla de acción para conducir un coche de choque. Mientras conduces eres invulnerable, regeneras salud y puede atropellar enemigos."
		//
		CROSSINGGAURD_NAME 			= "TORTAZO A NIVEL"
		CROSSINGGAURD_DESC 			= " Otorga gran resistencia a ataques cuerpo a cuerpo, incluyendo apuñalamientos."
		//
		PRINNYMACHETE_NAME 			= "MACHETE PRINNY"
		PRINNYMACHETE_DESC 			= " Artículo de utilidad: Ataca con el arma para avanzar con gran velocidad. Otorga inmunidad al daño por caída."
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
