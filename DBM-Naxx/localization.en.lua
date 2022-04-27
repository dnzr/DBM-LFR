local L

-------------------
--  Anub'Rekhan  --
-------------------
L = DBM:GetModLocalization("Anub'Rekhan")

L:SetGeneralLocalization({
	name = "Anub'Rekhan"
})

L:SetWarningLocalization({
	SpecialLocust		= "Locust Swarm",
	WarningLocustFaded	= "Locust Swarm faded"
})

L:SetOptionLocalization({
	SpecialLocust		= "Show special warning for Locust Swarm",
	WarningLocustFaded	= "Show warning for Locust Swarm fade",
	ArachnophobiaTimer	= "Show timer for Arachnophobia (achievement)"
})

L:SetMiscLocalization({
	ArachnophobiaTimer	= "Arachnophobia",
	Yell1 				= "There is no way out.",
	Yell2 				= "Just a little taste...",
	Yell3 				= "Yes, run! It makes the blood pump faster!",
	Locus				= "Anub'Rekhan begins to unleash an insect swarm!"
})

----------------------------
--  Grand Widow Faerlina  --
----------------------------
L = DBM:GetModLocalization("Faerlina")

L:SetGeneralLocalization({
	name = "Grand Widow Faerlina"
})

L:SetWarningLocalization({
	WarningEmbraceExpire	= "Widow's Embrace ends in 5 seconds",
	WarningEmbraceExpired	= "Widow's Embrace faded"
})

L:SetOptionLocalization({
	WarningEmbraceExpire	= "Show pre-warning for Widow's Embrace fade",
	WarningEmbraceExpired	= "Show warning for Widow's Embrace fade"
})

L:SetMiscLocalization({
	Yell1 	= "Run while you still can!",
	Yell2 	= "You cannot hide from me!",
	Yell3 	= "Kneel before me, worm!",
	Yell4	= "Slay them in the master's name!"
})

---------------
--  Maexxna  --
---------------
L = DBM:GetModLocalization("Maexxna")

L:SetGeneralLocalization({
	name = "Maexxna"
})

L:SetWarningLocalization({
	WarningSpidersSoon	= "Maexxna Spiderlings in 5 seconds",
	WarningSpidersNow	= "Maexxna Spiderlings spawned"
})

L:SetTimerLocalization({
	TimerSpider	= "Next Maexxna Spiderlings"
})

L:SetOptionLocalization({
	WarningSpidersSoon	= "Show pre-warning for Maexxna Spiderlings",
	WarningSpidersNow	= "Show warning for Maexxna Spiderlings",
	TimerSpider			= "Show timer for next Maexxna Spiderlings"
})

L:SetMiscLocalization({
	YellWebWrap	= "I'm wrapped! Help me!",
	ArachnophobiaTimer	= "Arachnophobia"
})

------------------------------
--  Noth the Plaguebringer  --
------------------------------
L = DBM:GetModLocalization("Noth")

L:SetGeneralLocalization({
	name = "Noth the Plaguebringer"
})

L:SetWarningLocalization({
	WarningTeleportNow				= "Teleported",
	WarningTeleportSoon				= "Teleport in 20 seconds",
	SpecialWarningEnragedSkeleton	= "Enraged Skeleton targets you",
	WarningBlinkSoon				= "Threat reset soon"
})
L:SetMiscLocalization({
	WarningYellEnragedSkeleton		= "I'm targeted by Enraged Skeleton!"
})

L:SetTimerLocalization({
	TimerTeleport		= "Teleport",
	TimerTeleportBack	= "Teleport back",
	TimerBlink			= "Blink"
})

L:SetOptionLocalization({
	WarningTeleportNow				= "Show warning for Teleport",
	WarningTeleportSoon				= "Show pre-warning for Teleport",
	WarningEnragedSkeleton			= "Yell on being targeted by Enraged Skeleton",
	WarningBlinkSoon				= "Show warning for Blink",
	TimerBlink						= "Show timer for Blink",
	TimerTeleport					= "Show timer for Teleport",
	TimerTeleportBack				= "Show timer for Teleport back",
	SpecialWarningEnragedSkeleton	= "Show special warning when you are targeted by Enraged Skeleton",
	SetIconOnEnragedSkeletonTarget	= "Set icon on Enraged Skeleton target"
})

--------------------------
--  Heigan the Unclean  --
--------------------------
L = DBM:GetModLocalization("Heigan")

L:SetGeneralLocalization({
	name = "Heigan the Unclean"
})

L:SetWarningLocalization({
	WarningTeleportNow	= "Teleported",
	WarningTeleportSoon	= "Teleport in %d seconds"
})

L:SetTimerLocalization({
	TimerTeleport	= "Teleport"
})

L:SetOptionLocalization({
	WarningTeleportNow	= "Show warning for Teleport",
	WarningTeleportSoon	= "Show pre-warning for Teleport",
	TimerTeleport		= "Show timer for Teleport"
})

---------------
--  Loatheb  --
---------------
L = DBM:GetModLocalization("Loatheb")

L:SetGeneralLocalization({
	name = "Loatheb"
})

L:SetWarningLocalization({
	WarningHealSoon			= "Healing possible in 3 seconds",
	WarningHealNow			= "Heal now",
	WarningHealthySporeSoon = "Healthy spore spawns in 3 seconds",
	WarningHealthySporeNow 	= "Healthy spore spawned"
})

L:SetOptionLocalization({
	WarningHealSoon			= "Show pre-warning for 3-second healing window",
	WarningHealNow			= "Show warning for 3-second healing window",
	WarningHealthySporeSoon	= "Show pre-warning for 3-second before Healthy spore spawns",
	WarningHealthySporeNow	= "Show warning when Healthy spore spawns",
	SporeDamageAlert		= "Send whisper to and announce to raid players who damage spores\n(requires announce to be enabled and leader/promoted status)"
})

-----------------
--  Patchwerk  --
-----------------
L = DBM:GetModLocalization("Patchwerk")

L:SetGeneralLocalization({
	name = "Patchwerk"
})

L:SetOptionLocalization({
	RemoveHealthBuffsOnCombatStart	= "Remove HP buffs at start of the encounter",
	WarningHateful	= "Post Hateful Strike targets to raid chat\n(requires announce to be enabled and leader/promoted status)",
	SetIconOnGrievousThrowTarget 	= "Set icons on Grievous Throw targets"
})

L:SetMiscLocalization({
	yell1			= "Patchwerk want to play!",
	yell2			= "Kel'thuzad make Patchwerk his avatar of war!",
	HatefulStrike	= "Hateful Strike --> %s [%s]"
})

-----------------
--  Grobbulus  --
-----------------
L = DBM:GetModLocalization("Grobbulus")

L:SetGeneralLocalization({
	name = "Grobbulus"
})

L:SetOptionLocalization({
	SpecialWarningInjection		= "Show special warning when you are affected by Mutating Injection",
	SetIconOnInjectionTarget	= "Set icons on Mutating Injection targets",
	WarningFalloutSlime			= "Show warning when Fallout Slime spawns"
})

L:SetWarningLocalization({
	SpecialWarningInjection	= "Mutating Injection on you",
	WarningFalloutSlime		= "Fallout Slime spawned"
})

L:SetTimerLocalization({
})

-------------
--  Gluth  --
-------------
L = DBM:GetModLocalization("Gluth")

L:SetGeneralLocalization({
	name = "Gluth"
})

L:SetOptionLocalization({
	SpecialWarningFleshRip	= "Show special warning when you are affected by Flesh Rip",
	SetIconOnFleshRipTarget = "Set icons on Flesh Rip targets"
})

L:SetWarningLocalization({
	SpecialWarningFleshRip	= "Flesh Rip on you"
})

----------------
--  Thaddius  --
----------------
L = DBM:GetModLocalization("Thaddius")

L:SetGeneralLocalization({
	name = "Thaddius"
})

L:SetMiscLocalization({
	Yell	= "Stalagg crush you!",
	Emote	= "%s overloads!",
	Emote2	= "Tesla Coil overloads!",
	Boss1	= "Feugen",
	Boss2	= "Stalagg",
	Charge1 = "negative",
	Charge2 = "positive"
})

L:SetOptionLocalization({
	WarningChargeChanged	= "Show special warning when your polarity changed",
	WarningChargeNotChanged	= "Show special warning when your polarity did not change",
	ArrowsEnabled			= "Show arrows (normal \"2 camp\" strategy)",
	ArrowsRightLeft			= "Show left/right arrows for the \"4 camp\" strategy (show left arrow if polarity changed, right if not)",
	ArrowsInverse			= "Inverse \"4 camp\" strategy (show right arrow if polarity changed, left if not)"
})

L:SetWarningLocalization({
	WarningChargeChanged	= "Polarity changed to %s",
	WarningChargeNotChanged	= "Polarity did not change"
})

L:SetOptionCatLocalization({
	Arrows	= "Arrows"
})

----------------------------
--  Instructor Razuvious  --
----------------------------
L = DBM:GetModLocalization("Razuvious")

L:SetGeneralLocalization({
	name = "Instructor Razuvious"
})

L:SetMiscLocalization({
	Yell1 = "Show them no mercy!",
	Yell2 = "The time for practice is over! Show me what you have learned!",
	Yell3 = "Do as I taught you!",
	Yell4 = "Sweep the leg... Do you have a problem with that?"
})

L:SetOptionLocalization({
	WarningShieldWallSoon	= "Show pre-warning for Shield Wall ending"
})

L:SetWarningLocalization({
	WarningShieldWallSoon	= "Shield Wall ends in 5 seconds"
})

----------------------------
--  Gothik the Harvester  --
----------------------------
L = DBM:GetModLocalization("Gothik")

L:SetGeneralLocalization({
	name = "Gothik the Harvester"
})

L:SetOptionLocalization({
	TimerWave			= "Show timer for next wave",
	TimerPhase2			= "Show timer for Phase 2",
	TimerTeleport		= "Show timer for Teleport",
	WarningWaveSoon		= "Show pre-warning for wave",
	WarningWaveSpawned	= "Show warning for wave spawned",
	WarningRiderDown	= "Show warning when an Unrelenting Rider dies",
	WarningKnightDown	= "Show warning when an Unrelenting Death Knight dies",
	WarningTraineeDown	= "Show warning when an Unrelenting Trainee dies",
	WarningTeleportSoon	= "Show pre-warning for Teleport"
})

L:SetTimerLocalization({
	TimerWave	= "Wave %d",
	TimerPhase2	= "Phase 2",
	TimerTeleport	= "Teleport"
})

L:SetWarningLocalization({
	WarningWaveSoon		= "Wave %d: %s in 3 sec",
	WarningWaveSpawned	= "Wave %d: %s spawned",
	WarningRiderDown	= "Rider down",
	WarningKnightDown	= "Knight down",
	WarningTraineeDown	= "Trainee down",
	WarningPhase2		= "Phase 2",
	WarningTeleportSoon	= "Teleport in 3 seconds"
})

L:SetMiscLocalization({
	yell			= "Foolishly you have sought your own demise.",
	WarningWave1	= "%d %s",
	WarningWave2	= "%d %s and %d %s",
	WarningWave3	= "%d %s, %d %s and %d %s",
	Trainee			= "Trainees",
	Knight			= "Knights",
	Rider			= "Riders"
})

---------------------
--  Four Horsemen  --
---------------------
L = DBM:GetModLocalization("Horsemen")

L:SetGeneralLocalization({
	name = "Four Horsemen"
})

L:SetOptionLocalization({
	WarningMarkSoon				= "Show pre-warning for Mark",
	WarningMarkNow				= "Show warning for Mark",
	SpecialWarningMarkOnPlayer	= "Show special warning when you are affected by more than 4 marks",
	TimerLadyBlaumeuxEnrage		= "Show Lady Blaumeux Enrage Timer",
	TimerSirZeliekEnrage		= "Show Sir Zeliek Enrage Timer",
	TimerThaneKorthazzEnrage	= "Show Thane Korthazz Enrage Timer",
	TimerBaronRivendareEnrage	= "Show Baron Rivendare Enrage Timer",
	ShowRange					= "Show Range frame for Sir Zeliek Holy Wrath Chain range"
})

L:SetTimerLocalization({
	TimerLadyBlaumeuxEnrage		= "Lady Blaumeux Enrage",
	TimerSirZeliekEnrage		= "Sir Zeliek Enrage",
	TimerThaneKorthazzEnrage	= "Thane Korthazz Enrage",
	TimerBaronRivendareEnrage	= "Baron Rivendare Enrage"
})

L:SetWarningLocalization({
	WarningMarkSoon				= "Mark %d in 3 seconds",
	WarningMarkNow				= "Mark %d",
	SpecialWarningMarkOnPlayer	= "%s: %s"
})

L:SetMiscLocalization({
	Korthazz	= "Thane Korth'azz",
	Rivendare	= "Baron Rivendare",
	Blaumeux	= "Lady Blaumeux",
	Zeliek		= "Sir Zeliek",
	Yell1 		= "Death... will not stop me.",
	Yell2 		= "Touche...",
	Yell3 		= "It is... as it should be.",
	Yell4 		= "What a bloody waste this is!"
})

-----------------
--  Sapphiron  --
-----------------
L = DBM:GetModLocalization("Sapphiron")

L:SetGeneralLocalization({
	name = "Sapphiron"
})

L:SetOptionLocalization({
	WarningAirPhaseSoon	= "Show pre-warning for air phase",
	WarningAirPhaseNow	= "Announce air phase",
	WarningLanded		= "Announce ground phase",
	TimerAir			= "Show timer for air phase",
	TimerLanding		= "Show timer for landing",
	TimerIceBlast		= "Show timer for Frost Breath",
	WarningDeepBreath	= "Show special warning for Frost Breath",
	WarningIceblock		= "Yell on Ice Block",
	WarningFrozenOrb	= "Show warning for Frozen Orb",
	SpecWarnSapphLow 	= "Special warning for 10% execute phase (cancel air phase)"
})

L:SetMiscLocalization({
	EmoteBreath			= "%s takes a deep breath.",
	WarningYellIceblock	= "I'm an Ice Block!"
})

L:SetWarningLocalization({
	WarningAirPhaseSoon	= "Air phase in 10 seconds",
	WarningAirPhaseNow	= "Air phase",
	WarningLanded		= "Sapphiron landed",
	WarningDeepBreath	= "Frost Breath",
	WarningFrozenOrb	= "Frozen Orb",
	SpecWarnSapphLow 	= "Sapphiron can't fly!"
})

L:SetTimerLocalization({
	TimerAir		= "Air phase",
	TimerLanding	= "Landing",
	TimerFrozenOrb	= "Frozen Orb",
	TimerIceBlast	= "Frost Breath"
})

------------------
--  Kel'Thuzad  --
------------------

L = DBM:GetModLocalization("Kel'Thuzad")

L:SetGeneralLocalization({
	name = "Kel'Thuzad"
})

L:SetOptionLocalization({
	TimerPhase2		= "Show timer for Phase 2",
	MCImminent		= "MC Imminent! (20s)",
	specwarnP2Soon	= "Show special warning 10 seconds before Kel'Thuzad engages",
	fissure 		= "Show special warning for Shadow Fissure",
	manaNear		= "Show special warning when Detonate Mana is nearby",
	warnAddsSoon	= "Show pre-warning for Guardians of Icecrown",
	BlastAlarm		= "Play custom siren sound when Frost Blast is being cast",
	EqUneqWeaponsKT	= "Automatically unequip and equip weapons before and after Mind Control. Create equip. set named 'pve' for re-equipping",
	EqUneqWeaponsKT2= "Automatically unequip and equip weapons when MC is cast on YOU",
	ShowRange		= "Show range frame when Phase 2 starts"
})

L:SetMiscLocalization({
	Yell		= "Minions, servants, soldiers of the cold dark! Obey the call of Kel'Thuzad!",
	YellMC1		= "Your soul is bound to me, now!",
	YellMC2		= "There will be no escape!",
	YellP3		= "Master, I require aid!",
	YellP4		= "The frozen heart of Icecrown awaits....",
	Corpse		= "Burning Corpse",
	setMissing	= "ATTENTION! DBM automatic weapon unequipping/equipping will not work until you create a equipment set named pve"
})

L:SetWarningLocalization({
	specwarnP2Soon	= "Kel'Thuzad engages in 10 Seconds",
	fissure 		= "Shadow Fissure",
	manaNear		= "Detonate Mana nearby",
	warnAddsSoon	= "Guardians of Icecrown incoming soon"
})

L:SetTimerLocalization({
	TimerPhase2	= "Phase 2",
	MCImminent	= "MC Imminent! (20s)",
	IncCorpse 	= "Burning Corpse soon"
})
