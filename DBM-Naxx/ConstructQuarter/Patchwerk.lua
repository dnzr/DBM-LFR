local mod	= DBM:NewMod("Patchwerk", "DBM-Naxx", 2)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 2869 $"):sub(12, -3))
mod:SetCreatureID(16028)
mod:SetUsedIcons(5, 6, 7, 8)

mod:RegisterCombat("yell", L.yell1, L.yell2)

mod:EnableModel()

mod:RegisterEvents(
	"SPELL_DAMAGE",
	"SPELL_MISSED",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED"
)

mod:AddBoolOption("WarningHateful", false, "announce")
mod:AddBoolOption("SetIconOnGrievousThrowTarget", true)

local GrievousThrowIcons = {}

local enrageTimer	= mod:NewBerserkTimer(360)
local timerAchieve	= mod:NewAchievementTimer(180, 1857, "TimerSpeedKill")
local warnGrievousThrow		= mod:NewTargetAnnounce(43093 , 4)

local function announceStrike(target, damage)
	SendChatMessage(L.HatefulStrike:format(target, damage), "RAID")
end

local function aIcons()
	for i,j in ipairs(GrievousThrowIcons) do
		local icon = 9 - i
		mod:SetIcon(j, icon)
	end
end

local function rIcons(target)
	for i,j in ipairs(GrievousThrowIcons) do
		if j == target then
			table.remove(GrievousThrowIcons, i)
			mod:SetIcon(target, 0)
		end
	end
	aIcons()
end

function mod:OnCombatStart(delay)
	enrageTimer:Start(-delay)
	timerAchieve:Start(-delay)
end

function mod:SPELL_DAMAGE(_, _, _, _, destName, _, spellId, _, _, amount)
	if (spellId == 28308 or spellId == 59192) and self.Options.WarningHateful and DBM:GetRaidRank() >= 1 then
		announceStrike(destName, amount or 0)
	end
end

function mod:SPELL_MISSED(_, _, _, _, destName, _, spellId, _, _, missType)
	if (spellId == 28308 or spellId == 59192) and self.Options.WarningHateful and DBM:GetRaidRank() >= 1 then
		announceStrike(destName, getglobal("ACTION_SPELL_MISSED_"..(missType)) or "")
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(43093) then
		warnGrievousThrow:Show(args.destName)
		if self.Options.SetIconOnGrievousThrowTarget then
			table.insert(GrievousThrowIcons, args.destName)
			aIcons()
		end
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpellID(43093) and self.Options.SetIconOnGrievousThrowTarget then
		rIcons(args.destName)
	end
end