require('Actor/ActorCommon')
local NpcActorProxy = require('Actor/Npc/NpcActorProxy')
local JohnDoe05 = class("JohnDoe05", NpcActorProxy)

JohnDoe05.defaultAlias = "JohnDoe05"
-- JohnDoe05.pointID = 1
-- JohnDoe05.targetPos = sceneData:GetDummyPoint(3, "JohnDoe05Born").pos
JohnDoe05.currWeather = WeatherType.ClearSky

local JohnDoe05Data =
{
	-- BornPos = sceneData:GetDummyPoint(3, "JohnDoe05Born").pos,
	BornDir = sceneData:GetDummyPoint(3, "JohnDoe05Born").rot,
	-- HomePos = sceneData:GetDummyPoint(3, "JohnDoe05Home").pos,
	-- HomeDir	= sceneData:GetDummyPoint(3, "JohnDoe05Home").rot,
	-- Pos01Pos = sceneData:GetDummyPoint(3, "JohnDoe05Pos01").pos,
	-- Pos01Dir = sceneData:GetDummyPoint(3, "JohnDoe05Pos01").rot,
	-- Pos02Pos = sceneData:GetDummyPoint(3, "JohnDoe05Pos02").pos,
	-- Pos02Dir = sceneData:GetDummyPoint(3, "JohnDoe05Pos02").rot,
	-- Pos03Pos = sceneData:GetDummyPoint(3, "JohnDoe05Pos03").pos,
	-- Pos03Dir = sceneData:GetDummyPoint(3, "JohnDoe05Pos03").rot,
	-- Pos04Pos = sceneData:GetDummyPoint(3, "JohnDoe05Pos04").pos,
	-- Pos04Dir = sceneData:GetDummyPoint(3, "JohnDoe05Pos04").rot,
	-- Pos05Pos = sceneData:GetDummyPoint(3, "JohnDoe05Pos05").pos,
	-- Pos05Dir = sceneData:GetDummyPoint(3, "JohnDoe05Pos05").rot,
	-- Pos06Pos = sceneData:GetDummyPoint(3, "JohnDoe05Pos06").pos,
	-- Pos06Dir = sceneData:GetDummyPoint(3, "JohnDoe05Pos06").rot,
}


function JohnDoe05:Start()
	-- print("start!JohnDoe05")
	self:StartDaily()
end

function JohnDoe05:DoAppear()
	self:ShowSelf()
	self:PerformDither(true, 2)
end

function JohnDoe05:DoDisappear()
	self:PerformDither(false, 2, self.HideSelf)
end

function JohnDoe05:InvokeOnResetFreeStyle(freeStyleType)
	if freeStyleType == 361 or freeStyleType == 141 or freeStyleType == 142 then
		self:StartDaily()
	end
end

function JohnDoe05:StartDaily()
	-- print("JohnDoe05 StartDaily")
	self:CallOnCollisionEnter(self.OnCollisionEnter)
	self:RegisterSelfDayTime(self.StartDay)
	self:RegisterSelfNightTime(self.StartNight)
	self:RegisterActorEvent(self.OnEvent)
	if globalActor.isDay then
		self:StartDay()
	else
		self:StartNight()
	end
end

function JohnDoe05:OnCollisionEnter(targetInfo)
	if targetInfo.isSprint or targetInfo.isRun then
		if targetInfo.isFromBack then
			self:DoFreeStyleTask(42, true, self.StartDaily)
		else
			self:DoFreeStyleTask(71, true, self.StartDaily) 
		end
	end
end

function JohnDoe05:StartDay()
	self:ClearFollowTask()
	self:ShowSelf()
	self:TurnTo(M.Euler2DirXZ(JohnDoe05Data.BornDir))
	self:PerformDither(true, 2, self.Chat)
end

-- function JohnDoe05:RandomStand()
-- 	self:TargetDect()
-- 	print("self.pointID = "..self.pointID)
-- 	self:WalkToTask(JohnDoe05.targetPos, self.NextMove, self.Standby)
-- end

-- function JohnDoe05:TargetDect()
-- 	self.pointID = math.random(1,6)
-- 	if self.pointID == 1 then
-- 		JohnDoe05.targetPos = JohnDoe05Data.Pos01Pos
-- 	elseif self.pointID == 2 then
-- 		JohnDoe05.targetPos = JohnDoe05Data.Pos02Pos
-- 	elseif self.pointID == 3 then
-- 		JohnDoe05.targetPos = JohnDoe05Data.Pos03Pos
-- 	elseif self.pointID == 4 then
-- 		JohnDoe05.targetPos = JohnDoe05Data.Pos04Pos
-- 	elseif self.pointID == 5 then
-- 		JohnDoe05.targetPos = JohnDoe05Data.Pos05Pos
-- 	elseif self.pointID == 6 then
-- 		JohnDoe05.targetPos = JohnDoe05Data.Pos06Pos
-- 	end
-- end

-- function JohnDoe05:NextMove()
-- 	self:CallDelay(math.random(3,7), self.RandomStand)
-- end
	
-- function JohnDoe05:StartDay()
-- 	self:ClearFollowTask()
-- 	self:ShowSelf()
-- 	self:TurnTo(M.Euler2DirXZ(JohnDoe05Data.BornDir))
-- 	self:PerformDither(true, 2, self.DelayChat)
-- 	self:RandomTest()
-- end
	
-- function JohnDoe05:DelayChat()
-- 	self:CallDelay(7, self.Chat)
-- end

function JohnDoe05:Chat()
	self:DoFreeStyle(52)
end

function JohnDoe05:StartNight()
	self:ClearFollowTask()
	self:DoFreeStateTrigger()
	-- self:GoHome()
	self:PerformDither(false, 2, self.HideSelf)
end

-- function JohnDoe05:GoHome()
-- 	self:TurnTo(M.Euler2DirXZ(JohnDoe05Data.HomeDir))
-- 	self:PerformDither(false, 2, self.HideSelf)
-- end

function JohnDoe05:OnEvent(evt)
	if evt.evtType == 35701 then
		self:ClearAllTask()
		self:ClearOnCollisionEnter(self.OnCollisionEnter)
		self:UnregisterSelfDayTime(self.StartDay)
		self:UnregisterSelfHour(self.HourBehave)
		self:UnregisterSelfNightTime(self.StartNight)
		self:UnregisterActorEvent(self.OnEvent)
		self:HideSelf()
	elseif evt.evtType == 35702 then
		self:StartDaily()
	end
end

return JohnDoe05