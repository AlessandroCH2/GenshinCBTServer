require('Actor/ActorCommon')
local NpcActorProxy = require('Actor/Npc/NpcActorProxy')
local JohnDoe06 = class("JohnDoe06", NpcActorProxy)

JohnDoe06.defaultAlias = "JohnDoe06"
-- JohnDoe06.pointID = 1
-- JohnDoe06.targetPos = sceneData:GetDummyPoint(3, "JohnDoe06Born").pos
JohnDoe06.currWeather = WeatherType.ClearSky

local JohnDoe06Data =
{
	-- BornPos = sceneData:GetDummyPoint(3, "JohnDoe06Born").pos,
	BornDir = sceneData:GetDummyPoint(3, "JohnDoe05Home").rot,
	-- HomePos = sceneData:GetDummyPoint(3, "JohnDoe06Home").pos,
	-- HomeDir	= sceneData:GetDummyPoint(3, "JohnDoe06Home").rot,
	-- Pos01Pos = sceneData:GetDummyPoint(3, "JohnDoe06Pos01").pos,
	-- Pos01Dir = sceneData:GetDummyPoint(3, "JohnDoe06Pos01").rot,
	-- Pos02Pos = sceneData:GetDummyPoint(3, "JohnDoe06Pos02").pos,
	-- Pos02Dir = sceneData:GetDummyPoint(3, "JohnDoe06Pos02").rot,
	-- Pos03Pos = sceneData:GetDummyPoint(3, "JohnDoe06Pos03").pos,
	-- Pos03Dir = sceneData:GetDummyPoint(3, "JohnDoe06Pos03").rot,
	-- Pos04Pos = sceneData:GetDummyPoint(3, "JohnDoe06Pos04").pos,
	-- Pos04Dir = sceneData:GetDummyPoint(3, "JohnDoe06Pos04").rot,
	-- Pos05Pos = sceneData:GetDummyPoint(3, "JohnDoe06Pos05").pos,
	-- Pos05Dir = sceneData:GetDummyPoint(3, "JohnDoe06Pos05").rot,
	-- Pos06Pos = sceneData:GetDummyPoint(3, "JohnDoe06Pos06").pos,
	-- Pos06Dir = sceneData:GetDummyPoint(3, "JohnDoe06Pos06").rot,
}


function JohnDoe06:Start()
	-- print("start!JohnDoe06")
	self:StartDaily()
end

function JohnDoe06:DoAppear()
	self:ShowSelf()
	self:PerformDither(true, 2)
end

function JohnDoe06:DoDisappear()
	self:PerformDither(false, 2, self.HideSelf)
end

function JohnDoe06:InvokeOnResetFreeStyle(freeStyleType)
	if freeStyleType == 361 or freeStyleType == 141 or freeStyleType == 142 then
		self:StartDaily()
	end
end

function JohnDoe06:StartDaily()
	-- print("JohnDoe06 StartDaily")
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

function JohnDoe06:OnCollisionEnter(targetInfo)
	if targetInfo.isSprint or targetInfo.isRun then
		if targetInfo.isFromBack then
			self:DoFreeStyleTask(42, true, self.StartDaily)
		else
			self:DoFreeStyleTask(71, true, self.StartDaily) 
		end
	end
end

function JohnDoe06:StartDay()
	self:ClearFollowTask()
	self:ShowSelf()
	self:TurnTo(M.Euler2DirXZ(JohnDoe06Data.BornDir))
	self:PerformDither(true, 2, self.Chat)
end

-- function JohnDoe06:RandomStand()
-- 	self:TargetDect()
-- 	print("self.pointID = "..self.pointID)
-- 	self:WalkToTask(JohnDoe06.targetPos, self.NextMove, self.Standby)
-- end

-- function JohnDoe06:TargetDect()
-- 	self.pointID = math.random(1,6)
-- 	if self.pointID == 1 then
-- 		JohnDoe06.targetPos = JohnDoe06Data.Pos01Pos
-- 	elseif self.pointID == 2 then
-- 		JohnDoe06.targetPos = JohnDoe06Data.Pos02Pos
-- 	elseif self.pointID == 3 then
-- 		JohnDoe06.targetPos = JohnDoe06Data.Pos03Pos
-- 	elseif self.pointID == 4 then
-- 		JohnDoe06.targetPos = JohnDoe06Data.Pos04Pos
-- 	elseif self.pointID == 5 then
-- 		JohnDoe06.targetPos = JohnDoe06Data.Pos05Pos
-- 	elseif self.pointID == 6 then
-- 		JohnDoe06.targetPos = JohnDoe06Data.Pos06Pos
-- 	end
-- end

-- function JohnDoe06:NextMove()
-- 	self:CallDelay(math.random(3,7), self.RandomStand)
-- end
	
-- function JohnDoe06:StartDay()
-- 	self:ClearFollowTask()
-- 	self:ShowSelf()
-- 	self:TurnTo(M.Euler2DirXZ(JohnDoe06Data.BornDir))
-- 	self:PerformDither(true, 2, self.DelayChat)
-- 	self:RandomTest()
-- end
	
-- function JohnDoe06:DelayChat()
-- 	self:CallDelay(7, self.Chat)
-- end

function JohnDoe06:Chat()
	self:DoFreeStyle(52)
end

function JohnDoe06:StartNight()
	self:ClearFollowTask()
	self:DoFreeStateTrigger()
	-- self:GoHome()
	self:PerformDither(false, 2, self.HideSelf)
end

-- function JohnDoe06:GoHome()
-- 	self:TurnTo(M.Euler2DirXZ(JohnDoe06Data.HomeDir))
-- 	self:PerformDither(false, 2, self.HideSelf)
-- end

function JohnDoe06:OnEvent(evt)
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

return JohnDoe06