local mod	= DBM:NewMod("Horsemen", "DBM-Naxx", 4)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 4909 $"):sub(12, -3))
mod:SetCreatureID(16063, 16064, 16065, 30549)

mod:RegisterCombat("combat", 16063, 16064, 16065, 30549)

mod:EnableModel()

mod:RegisterEvents(
	"SPELL_CAST_SUCCEEDED",
	"SPELL_AURA_APPLIED_DOSE",
	"CHAT_MSG_MONSTER_YELL",
	"SPELL_SUMMON",
	"SPELL_CAST_START",
	"SPELL_DAMAGE"
)

local warnMarkSoon			= mod:NewAnnounce("WarningMarkSoon", 1, 28835, false)
local warnMarkNow			= mod:NewAnnounce("WarningMarkNow", 2, 28835)

local timerBlaumeux			= mod:NewTimer(309, "TimerLadyBlaumeuxEnrage", 72143)
local timerZeliek			= mod:NewTimer(309, "TimerSirZeliekEnrage", 72143)
local timerKorthazz			= mod:NewTimer(309, "TimerThaneKorthazzEnrage", 72143)
local timerRivendare		= mod:NewTimer(309, "TimerBaronRivendareEnrage", 72143)
local timerVoidZone			= mod:NewCDTimer(12, 36119)
local timerMeteor			= mod:NewCDTimer(12, 28884)
local timerHolyWrath		= mod:NewCDTimer(12, 57466)

local specWarnMarkOnPlayer	= mod:NewSpecialWarning("SpecialWarningMarkOnPlayer", nil, false, true)

mod:AddBoolOption("HealthFrame", true)
mod:AddBoolOption("RangeFrame")

mod:SetBossHealthInfo(
	16064, L.Korthazz,
	30549, L.Rivendare,
	16065, L.Blaumeux,
	16063, L.Zeliek
)

local markCounter = 0

function mod:OnCombatStart(delay)
	timerVoidZone:Start(16 - delay)
	markCounter = 0
	timerBlaumeux:Start(-delay)
	timerRivendare:Start(-delay)
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
end

local markSpam = 0
function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(28832, 28833, 28834, 28835) and (GetTime() - markSpam) > 5 then
		markSpam = GetTime()
		markCounter = markCounter + 1
	end
end

function mod:CHAT_MSG_MONSTER_YELL(msg)
	if msg:find(L.Yell1) then
		timerKorthazz:Start()
		timerRivendare:Stop()
		timerMeteor:Start(30)
	elseif msg:find(L.Yell2) then
		if mod:IsDifficulty("heroic10")	then
			timerVoidZone:Stop()
		end
		if self.Options.RangeFrame then
			DBM.RangeCheck:Show(12)
		end
		timerZeliek:Start()
		timerHolyWrath:Start()
		timerBlaumeux:Stop()
	elseif msg:find(L.Yell3) then
		if self.Options.RangeFrame then
			DBM.RangeCheck:Hide()
		end
		timerZeliek:Stop()
		timerHolyWrath:Stop()
	elseif msg:find(L.Yell4) then
		timerKorthazz:Stop()
		timerMeteor:Stop()
	end
end

function mod:SPELL_AURA_APPLIED_DOSE(args)
	if args:IsSpellID(28832, 28833, 28834, 28835) and args:IsPlayer() then
		if args.amount >= 4 then
			specWarnMarkOnPlayer:Show(args.spellName, args.amount)
		end
	end
end

function mod:SPELL_SUMMON(args)
	if args:IsSpellID(28863, 57463) then
		timerVoidZone:Start()
	end
end

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(28884, 57467) then
		timerMeteor:Start()
	end
end

function mod:SPELL_DAMAGE(_, _, _, _, _, _, spellId)
	if (spellId == 28883 or spellId == 57466) then
		if (mod:IsDifficulty("heroic25") or mod:IsDifficulty("normal25")) then
			timerHolyWrath:Start()
		end
	end
end


function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
end