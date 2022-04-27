local mod	= DBM:NewMod("Gluth", "DBM-Naxx", 2)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 2869 $"):sub(12, -3))
mod:SetCreatureID(15932)

mod:RegisterCombat("combat")

mod:EnableModel()

mod:RegisterEventsInCombat(
	"SPELL_DAMAGE 28375",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED"
)


local warnDecimateSoon	= mod:NewSoonAnnounce(54426, 2)
local warnDecimateNow	= mod:NewSpellAnnounce(54426, 3)
local specwarnFleshRip	= mod:NewSpecialWarning("SpecialWarningFleshRip")
local warnFleshRip		= mod:NewTargetAnnounce(40199, 2)

local enrageTimer		= mod:NewBerserkTimer(420)
local timerDecimate		= mod:NewCDTimer(104, 54426, nil, nil, nil, 2)

mod:AddBoolOption("SetIconOnFleshRipTarget", true)

local fleshripIcons = {}

local function addIcons()
	for i,j in ipairs(fleshripIcons) do
		local icon = 9 - i
		mod:SetIcon(j, icon)
	end
end

local function removeIcons(target)
	for i,j in ipairs(fleshripIcons) do
		if j == target then
			table.remove(fleshripIcons, i)
			mod:SetIcon(target, 0)
		end
	end
	addIcons()
end
function mod:OnCombatStart(delay)
	timerDecimate:Start(110 - delay)
	warnDecimateSoon:Schedule(100 - delay)

	if (mod:IsDifficulty("heroic25") or mod:IsDifficulty("normal25")) then
	  enrageTimer:Start(480 - delay)
	else
	  enrageTimer:Start(420 - delay)
	end
end

function mod:SPELL_DAMAGE(_, _, _, _, _, _, spellId)
	if spellId == 28375 and self:AntiSpam(20) then
		warnDecimateNow:Show()
		timerDecimate:Start()
		warnDecimateSoon:Schedule(96)
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(40199) and (mod:IsDifficulty("heroic25") or mod:IsDifficulty("normal25")) then
		warnFleshRip:Show(args.destName)
		if args:IsPlayer() then
			specwarnFleshRip:Show()
		end
		if self.Options.SetIconOnFleshRipTarget then
			table.insert(fleshripIcons, args.destName)
			addIcons()
		end
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpellID(40199) and (mod:IsDifficulty("heroic25") or mod:IsDifficulty("normal25")) and self.Options.SetIconOnFleshRipTarget then
		removeIcons(args.destName)
	end
end


function mod:OnCombatEnd()
	if (mod:IsDifficulty("heroic25") or mod:IsDifficulty("normal25")) then
    	for i,j in ipairs(fleshripIcons) do
    	self:SetIcon(j, 0)
    	end
	end
end