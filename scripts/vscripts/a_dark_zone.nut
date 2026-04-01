::showNewAnnotation <- function(message, x, y, z) {
	local table = {
		id = 2601
		worldPosX = x
		worldPosY = y
		worldPosZ = z
		text = message
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::hideNewAnnotation <- function() {
	local table = {
		id = 2601
	}
	SendGlobalGameEvent("hide_annotation", table)
}

::showAnnotationW0Key <- function() {
	local table = {
		id = 2601
		follow_entindex = Entities.FindByName(null, "intel_target").entindex()
		text = "Collect the KEY!"
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::showAnnotationW0Exit <- function() {
	local table = {
		id = 2601
		follow_entindex = Entities.FindByName(null, "w0_exit_prop").entindex()
		text = "Take it to the EXIT!"
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::showAnnotationRefund <- function() {
	showNewAnnotation("Hit the old man with your melee to refund your upgrades!", -7712 8324 577);
}

::showAnnotationKeyGeneric <- function() {
	local table = {
		id = 2601
		follow_entindex = Entities.FindByName(null, "intel_target").entindex()
		text = "KEY"
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::showAnnotationW1Exit <- function() {
	showNewAnnotation("EXIT", -9024 5920 832);
}

::showAnnotationBombHint <- function() {
	showNewAnnotation("Tip: The key can always be located using your default MVM bomb HUD.", -8024 8400 523);
}

::showAnnotationW2Key <- function() {
	local table = {
		id = 2601
		follow_entindex = Entities.FindByName(null, "intel_target").entindex()
		text = "KEY UPSTAIRS"
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::showAnnotationW2Exit <- function() {
	showNewAnnotation("EXIT DOWNSTAIRS", -9024 3040 928);
}

::showAnnotationW3Exit1 <- function() {
	showNewAnnotation("EXIT", -9024 5920 832);
}

::showAnnotationW3Exit2 <- function() {
	showNewAnnotation("EXIT UPSTAIRS", -9024 6077 1344);
}

::showAnnotationW5Exit <- function() {
	showNewAnnotation("EXIT", -7464 4804 1472);
}

::showAnnotationW6Exit <- function() {
	showNewAnnotation("EXIT", -9974 5712 959.5);
}

::showAnnotationW7Exit <- function() {
	showNewAnnotation("EXIT", -7476 4576 960);
}

::showAnnotationW9Exit <- function() {
	showNewAnnotation("EXIT", -8700 2560 1600);
}

::showAnnotationW10ExitFix <- function() {
	showNewAnnotation("EXIT", -8800 4728 1408);
}

::showAnnotationW11Key1 <- function() {
	local table = {
		id = 2601
		follow_entindex = Entities.FindByName(null, "w11_tank_target").entindex()
		text = "KEY"
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::showAnnotationW11Exit1 <- function() {
	showNewAnnotation("EXIT", -10148 3760 896);
}

::showAnnotationRefund2 <- function() {
	showNewAnnotation("Hit the tea with your melee to refund your upgrades!", -10045.5 3958 958);
}

::showAnnotationW11Exit2 <- function() {
	showNewAnnotation("EXIT", -8472 5052 960);
}

::showAnnotationW13ExitFix <- function() {
	showNewAnnotation("EXIT", -10246 4934 1344);
}

::showAnnotationW14Leaves10 <- function() {
	showNewAnnotation("RAKE THE LEAF PILES", -9048 8792 640);
}

::showAnnotationW14Leaves1 <- function() {
	local table = {
		id = 2602
		follow_entindex = Entities.FindByName(null, "w14_leaf_target_1").entindex()
		text = "⠀"
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::showAnnotationW14Leaves2 <- function() {
	local table = {
		id = 2603
		follow_entindex = Entities.FindByName(null, "w14_leaf_target_2").entindex()
		text = "⠀"
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::showAnnotationW14Leaves3 <- function() {
	local table = {
		id = 2604
		follow_entindex = Entities.FindByName(null, "w14_leaf_target_3").entindex()
		text = "⠀"
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::showAnnotationW14Leaves4 <- function() {
	local table = {
		id = 2605
		follow_entindex = Entities.FindByName(null, "w14_leaf_target_4").entindex()
		text = "⠀"
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::showAnnotationW14Leaves5 <- function() {
	local table = {
		id = 2606
		follow_entindex = Entities.FindByName(null, "w14_leaf_target_5").entindex()
		text = "⠀"
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::showAnnotationW14Leaves6 <- function() {
	local table = {
		id = 2607
		follow_entindex = Entities.FindByName(null, "w14_leaf_target_6").entindex()
		text = "⠀"
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::showAnnotationW14Leaves7 <- function() {
	local table = {
		id = 2608
		follow_entindex = Entities.FindByName(null, "w14_leaf_target_7").entindex()
		text = "⠀"
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::showAnnotationW14Leaves8 <- function() {
	local table = {
		id = 2609
		follow_entindex = Entities.FindByName(null, "w14_leaf_target_8").entindex()
		text = "⠀"
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::showAnnotationW14Leaves9 <- function() {
	local table = {
		id = 2610
		follow_entindex = Entities.FindByName(null, "w14_leaf_target_9").entindex()
		text = "⠀"
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::hideAnnotationW14Leaves1 <- function() {
	local table = {
		id = 2602
	}
	SendGlobalGameEvent("hide_annotation", table)
}

::hideAnnotationW14Leaves2 <- function() {
	local table = {
		id = 2603
	}
	SendGlobalGameEvent("hide_annotation", table)
}

::hideAnnotationW14Leaves3 <- function() {
	local table = {
		id = 2604
	}
	SendGlobalGameEvent("hide_annotation", table)
}

::hideAnnotationW14Leaves4 <- function() {
	local table = {
		id = 2605
	}
	SendGlobalGameEvent("hide_annotation", table)
}

::hideAnnotationW14Leaves5 <- function() {
	local table = {
		id = 2606
	}
	SendGlobalGameEvent("hide_annotation", table)
}

::hideAnnotationW14Leaves6 <- function() {
	local table = {
		id = 2607
	}
	SendGlobalGameEvent("hide_annotation", table)
}

::hideAnnotationW14Leaves7 <- function() {
	local table = {
		id = 2608
	}
	SendGlobalGameEvent("hide_annotation", table)
}

::hideAnnotationW14Leaves8 <- function() {
	local table = {
		id = 2609
	}
	SendGlobalGameEvent("hide_annotation", table)
}

::hideAnnotationW14Leaves9 <- function() {
	local table = {
		id = 2610
	}
	SendGlobalGameEvent("hide_annotation", table)
}

::showAnnotationW15Exit1 <- function() {
	showNewAnnotation("EXIT", -9192 4692 1044);
}

::showAnnotationW15Exit2 <- function() {
	showNewAnnotation("EXIT UPSTAIRS", -10236 2620 1344);
}

::showAnnotationW17Key <- function() {
	local table = {
		id = 2601
		follow_entindex = Entities.FindByName(null, "intel_target").entindex()
		text = "GRAND PRIZE"
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::showAnnotationW17Exit1 <- function() {
	showNewAnnotation("ROUND 18", -9046 8824 512);
}

::showAnnotationW17Exit2 <- function() {
	showNewAnnotation("EXIT", -9283 5024 1091);
}

::showAnnotationW18Exit <- function() {
	local table = {
		id = 2601
		follow_entindex = Entities.FindByName(null, "w18_exit_prop_target").entindex()
		text = "EXIT"
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::showAnnotationW18FakeExit1 <- function() {
	showNewAnnotation("EXIT", -9104 4080 897);
}

::showAnnotationW18FakeExit2 <- function() {
	showNewAnnotation("EXIT", -9632 2784 705);
}

::showAnnotationW18FakeExit3 <- function() {
	showNewAnnotation("EXIT", -7712 3488 833);
}

::showAnnotationW18FakeExit4 <- function() {
	showNewAnnotation("EXIT", -9156 2976 1409);
}

::showAnnotationW18FakeExit5 <- function() {
	showNewAnnotation("EXIT", -9008 4058 1409);
}

::showAnnotationW18FakeExit6 <- function() {
	showNewAnnotation("EXIT", -7808 4624 1473);
}

::showAnnotationW18FakeExit7 <- function() {
	showNewAnnotation("EXIT", -8223 5153 1025);
}

::showAnnotationW19Key <- function() {
	local table = {
		id = 2601
		follow_entindex = Entities.FindByName(null, "intel_target").entindex()
		text = "BOMB"
		show_distance = true
		play_sound = "misc/null.wav"
		lifetime = -1
	}
	SendGlobalGameEvent("show_annotation", table)
}

::showAnnotationW19Exit1 <- function() {
	showNewAnnotation("HATCH", -9024 8322 529);
}

::showAnnotationW19Exit2 <- function() {
	showNewAnnotation("SURVIVE", -9024 8322 529);
}

::showAnnotationW19Exit3 <- function() {
	showNewAnnotation("ATTACK", -9024 8322 529);
}

::showAnnotationW19Exit4 <- function() {
	showNewAnnotation("DEPLOY THE BOMB", -9024 8322 529);
}

::showAnnotationW21Buyback <- function() {
	showNewAnnotation("Use BUYBACKS to respawn!", -9728 0 1460);
}

::SetIconsW0 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW1 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "scout_giant", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ],
		[ "heavy_champ", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW2 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "pyro_detonator_giant", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ],
		[ "sniper_bow", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW3 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "soldier_burstfire_hyper_giant", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_ALWAYSCRIT | MVM_CLASS_FLAG_SUPPORT ],
		[ "scout_fish_nys", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW4 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ]
	]);
}

::SetIconsW5 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "sniper_carbine_giant", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ],
		[ "pyro_ranged", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW6 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "demo_giant", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ],
		[ "medic_bullet_package", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "heavy_shotgun", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "demo_spammer_giant", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW7 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "soldier_bazooka_buff", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ],
		[ "pyro", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW8 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "scout_stun_spammer", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW9 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "heavy_heater_giant", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ],
		[ "soldier_sawcon", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW10 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "scout_random", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "scout_fan_cola_nys", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW11 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "tank_lite_random", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW12 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "soldier_banner_trio_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW13 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "sentry_gun_lvl2_pomson_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "engineer_upgraded", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ],
		[ "mallet_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW14 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "soldier_spammer", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ],
		[ "soldier_burstfire", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ],
		[ "pyro_backscratcher_lite", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ],
		[ "heavy_steelfist", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW15 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "heavy_shotgun_burst_lite", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ],
		[ "medic_uber_quick", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "soldier_blackbox_giant", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_ALWAYSCRIT | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW16 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "pyro_scorch", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_ALWAYSCRIT | MVM_CLASS_FLAG_SUPPORT ],
		[ "medic_quickfix_armored_shield", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW17 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "spell_meteor_swordstonehel", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ],
		[ "sniper_bow_atomic_v2", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_ALWAYSCRIT | MVM_CLASS_FLAG_SUPPORT ],
		[ "sniper_carbine_giant", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW18 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "scout_stun_giant", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW18New <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "blu2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "scout_stun_giant", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ],
		[ "sniper", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "spy", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "sentry_buster", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ],
		[ "scout_shortstop", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "heavy_mittens", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_ALWAYSCRIT | MVM_CLASS_FLAG_SUPPORT ],
		[ "demoknight_samurai", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "sniper_sydneysleeper", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "scout_fast", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_SUPPORT ],
		[ "demo_burst", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "pyro_flare", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "soldier_libertylauncher", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "scout_jumping", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "sniper_bow_multi", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "demoknight", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "medic_giant", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_ALWAYSCRIT | MVM_CLASS_FLAG_SUPPORT ],
		[ "scout", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_ALWAYSCRIT | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW19 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ],
		[ "red2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "tf2_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "gry_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ],
		[ "demo_giant", 0,   MVM_CLASS_FLAG_MINIBOSS | MVM_CLASS_FLAG_ALWAYSCRIT | MVM_CLASS_FLAG_SUPPORT ],
		[ "demoknight_bottle_lite", 0,   MVM_CLASS_FLAG_NORMAL | MVM_CLASS_FLAG_SUPPORT ]
	]);
}

::SetIconsW20 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "horsemann_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ]
	]);
}

::SetIconsW21 <- function() {
	AlternateWaves.ClearWaveIcons()
	AlternateWaves.AddWaveIcons([
		[ "engineer_golden_lite", 1,   MVM_CLASS_FLAG_MINIBOSS ]
	]);
}