require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local WendyAudience = class("WendyAudience", npcActorProxy)

WendyAudience.defaultAlias = "WendyAudience"

WendyAudience.seatPos = nil
WendyAudience.seatDir = nil
WendyAudience.returnCallback = nil

-- local config begin
local q220Cfg = require('Actor/Quest/Q220/Config/Q220Config')
local wendyData = q220Cfg.WendyData
local audienceInter = q220Cfg.AudienceInter
local extrasData = q220Cfg.ExtrasData
-- local config end

function WendyAudience:MoveToSeat()
	print("move to seat ")
	print(self.seatPos)
	self:AddPriorityInter(InterTimingType.BTN, audienceInter)
	self:WalkToTask(self.seatPos, 
		function(self, task)
			self:TurnTo(M.Euler2DirXZ(self.seatDir))
			self:Standby()
		end,
		function(self, task)
			self:Standby()
		end
	)
end

function WendyAudience:ReturnToNormal()
	print("ai return " .. tostring(self.configID))
	self:ClearPriorityInter(InterTimingType.BTN)
	self:WalkToTask(extrasData.ExtrasOriginPos[self.extrasIndex],
		function(self, task)
			self:TurnTo(M.Euler2DirXZ(extrasData.ExtrasOriginDir[self.extrasIndex]))
			self:Standby()
			if self.returnCallback ~= nil then
				self:returnCallback()
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
end

-- local method begin
function WendyAudience:OnEvent(evt)
	if evt.evtType == wendyData.EvtFinishDance then
		self:ReturnToNormal()
	end
end

-- local method end

function WendyAudience:Start()
	print("start!wendy audience " .. self.configID)
	self:RegisterActorEvent(self.OnEvent)
	self:MoveToSeat()
end

function WendyAudience:OnDestroy()
	print("wendy audience " .. self.configID .. " destroied")
end

return WendyAudience