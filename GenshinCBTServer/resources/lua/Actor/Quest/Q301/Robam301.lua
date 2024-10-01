require('Actor/ActorCommon')
local quest301 = require('Actor/Quest/MQ301')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Robam301 = class("Robam301", npcActorProxy)

Robam301.defaultAlias = "Robam301"

-- local config begin
local q301Cfg = require('Actor/Quest/Q301/Config/Q301Config')
local robamData = q301Cfg.RobamData
function Robam301:PreGetAlias()
	local robam = robamData.Robam
	return robam
end
-- local config end

-- local param begin
-- local param end

-- function Robam301:CreateUActor(alias)
-- 	local uActor = actorUtils.CreateActor(self, ActorType.NPC_ACTOR, alias)
-- 	uActor = actorUtils.CreateNpcActor(self.configID, self.bornPos, uActor)
-- 	return uActor
-- end

-- local method

-- local method end

function Robam301:Start()
	print("start!Robam301")
	self:StartDaily()
end

function Robam301:ShowStart()
	print("Robam301:ShowStart")
	self:SetPos(robamData.bornPos)
	self:RunToTask(robamData.arguePos, 
		function(self, task)
			self:TurnTo(M.Euler2DirXZ(robamData.argueDir))
			self:Standby()
		end
	)	
end

function Robam301:StartDay()
	self:RunToTask(robamData.bornPos, 
		function(self, task)
			self:TurnTo(M.Euler2DirXZ(robamData.bornDir))
			self:Standby()
		end
	)	
end

function Robam301:StartNight()
	self:RunToTask(sceneData:GetDummyPoint(3,"Q301Folk1Home").pos, 
		function(self, task)
			self:Standby()
		end
	)	
end

function Robam301:StartDaily()
	print("Robam301:StartDaily()")
	self:RegisterSelfDayTime(self.StartDay)
	self:RegisterSelfNightTime(self.StartNight)
	if globalActor.isDay then
		self:StartDay()
	else
		self:StartNight()
	end

end

function Robam301:OnDestroy()
	--print("robam " .. self.configID .. " destroied")
end

return Robam301