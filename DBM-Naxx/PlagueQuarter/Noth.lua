local mod	= DBM:NewMod("Noth", "DBM-Naxx", 3)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 2248 $"):sub(12, -3))
mod:SetCreatureID(15954)
mod:SetUsedIcons(8)

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_CAST_SUCCESS",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED"
)

local warnTeleportNow	= mod:NewAnnounce("WarningTeleportNow", 3, 46573)
local warnTeleportSoon	= mod:NewAnnounce("WarningTeleportSoon", 1, 46573)
local warnCurse			= mod:NewSpellAnnounce(29213, 2)
local warnParalyze		= mod:NewTargetAnnounce(38132, 2)
local specWarnParalyze	= mod:NewSpecialWarning("SpecialWarningEnragedSkeleton")
local warnBlinkSoon 	= mod:NewAnnounce("WarningBlinkSoon", 4, 29208)

local timerTeleport		= mod:NewTimer(90, "TimerTeleport", 46573)
local timerTeleportBack	= mod:NewTimer(70, "TimerTeleportBack", 46573)
local timerBlink 		= mod:NewNextTimer(40, 29208)
local warnBlink 		= mod:NewAnnounce("Blink Soon", 1)
local announceBlink 	= mod:NewSpellAnnounce(29208, 4)

mod:AddBoolOption("WarningEnragedSkeleton", true, "announce")
mod:AddBoolOption("SetIconOnEnragedSkeletonTarget", true)

function mod:OnCombatStart(delay)
	self.vb.phase = 0
	self:BackInRoom(delay)
end

function mod:Balcony()
	local timer
	if self.vb.phase == 1 then timer = 70
	elseif self.vb.phase == 2 then timer = 97
	elseif self.vb.phase == 3 then timer = 120
	else return	end
	timerBlink:Stop()
	warnBlinkSoon:Cancel()
	timerTeleportBack:Show(timer)
	warnTeleportSoon:Schedule(timer - 20)
	warnTeleportNow:Schedule(timer)
	self:ScheduleMethod(timer, "BackInRoom")
end

function mod:BackInRoom(delay)
	delay = delay or 0
	self:SetStage(0)
	local timer
	if self.vb.phase == 1 then timer = 90 - delay
	elseif self.vb.phase == 2 then timer = 110 - delay
	elseif self.vb.phase == 3 then timer = 180 - delay
	else return end
	timerBlink:Start(20 - delay)
	warnBlinkSoon:Schedule(20 - delay)
	timerTeleport:Show(timer)
	warnTeleportSoon:Schedule(timer - 20)
	warnTeleportNow:Schedule(timer)
	self:ScheduleMethod(timer, "Balcony")
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(29213, 54835) then	-- Curse of the Plaguebringer
		warnCurse:Show()
	elseif args:IsSpellID(29208, 29209, 29210, 29211) then
		timerBlink:Start()
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpellID(38132) and self.Options.SetIconOnEnragedSkeletonTarget then
		self:SetIcon(args.destName, 0)
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(38132) then
		if self.Options.SetIconOnEnragedSkeletonTarget then
			self:SetIcon(args.destName, 8)
		end
		if args:IsPlayer() then
			if self.Options.WarningEnragedSkeleton then
				SendChatMessage(L.WarningYellEnragedSkeleton, "YELL")
			end
			specWarnParalyze:Show()
		end 
		warnParalyze:Show(args.destName)
	end
end