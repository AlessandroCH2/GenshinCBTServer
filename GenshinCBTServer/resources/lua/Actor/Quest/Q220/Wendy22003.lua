require('Actor/ActorCommon')
local quest001 = require('Actor/Quest/Quest001Test')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Wendy22003 = class("Wendy22003", npcActorProxy)

Wendy22003.defaultAlias = "Wendy22003"

-- local config begin
local q220Cfg = require('Actor/Quest/Q220/Config/Q220Config')
local wendyData = q220Cfg.WendyData
local audienceInter = q220Cfg.AudienceInter
local extrasData = q220Cfg.ExtrasData
-- local config end

-- local param begin
-- local param end

-- local method
function Wendy22003:StartDance()
	self:TurnTo(M.Euler2DirXZ(self.bornDir))
	self:DoFreeStyle(1)
end
function Wendy22003:FinishDance(...)
	print("finish dance))))))))))))))))))")
	for i=1, #extrasData.ExtrasIDs do
		local alias = extrasData.Extras .. tostring(i)
		self:NotifyTo(alias, wendyData.EvtFinishDance)
	end
	self:Destroy(false)
end
-- local method end

function Wendy22003:Start()
	print("start!wendy22003")
	self:StartDance()
	self:CallDelay(10, self.FinishDance)
end

function Wendy22003:OnDestroy()
	print("wendy " .. self.configID .. " destroied")
end

return Wendy22003