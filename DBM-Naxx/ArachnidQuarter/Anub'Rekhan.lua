local mod	= DBM:NewMod("Anub'Rekhan", "DBM-Naxx", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 4902 $"):sub(12, -3))
mod:SetCreatureID(15956)

mod:RegisterCombat("yell", L.Yell1, L.Yell2, L.Yell3)

mod:EnableModel()

mod:RegisterEvents(
	"SPELL_CAST_START",
	"SPELL_AURA_REMOVED",
	"UNIT_DIED",
	"CHAT_MSG_RAID_BOSS_EMOTE"
)

local warningLocustSoon		= mod:NewSoonAnnounce(28785, 2)
local warningLocustNow		= mod:NewSpellAnnounce(28785, 3)
local warningLocustFaded	= mod:NewAnnounce("WarningLocustFaded", 1, 28785)

local specialWarningLocust	= mod:NewSpecialWarning("SpecialLocust")

local timerLocustIn			= mod:NewCDTimer(80, 28785)
local timerLocustFade 		= mod:NewBuffActiveTimer(26, 28785)

mod:AddBoolOption("ArachnophobiaTimer", true, "timer")


function mod:OnCombatStart(delay)
	if (mod:IsDifficulty("heroic25") or mod:IsDifficulty("normal25")) then
		timerLocustIn:Start(100 - delay)
		warningLocustSoon:Schedule(95 - delay)
	else
		timerLocustIn:Start(100 - delay)
		warningLocustSoon:Schedule(95 - delay)
	end
end

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(28785, 54021) then  -- Locust Swarm
		warningLocustNow:Show()
		specialWarningLocust:Show()
		if (mod:IsDifficulty("heroic25") or mod:IsDifficulty("normal25")) then
			timerLocustFade:Start(26)
		else
			timerLocustFade:Start(19)
		end
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpellID(28785, 54021) and args.auraType == "BUFF" then
		warningLocustFaded:Show()
	end
end

function mod:CHAT_MSG_RAID_BOSS_EMOTE(msg)
	if msg == L.Locus or msg:find(L.Locus) then
		timerLocustIn:Start(90)
		warningLocustSoon:Schedule(85)
	end
end

function mod:UNIT_DIED(args)
	if self.Options.ArachnophobiaTimer and not DBM.Bars:GetBar(L.ArachnophobiaTimer) then
		local guid = tonumber(args.destGUID:sub(9, 12), 16)
		if guid == 15956 then		-- Anub'Rekhan
			DBM.Bars:CreateBar(1200, L.ArachnophobiaTimer)
			timerLocustIn:Stop()
			warningLocustSoon:Cancel()
		end
	end
end