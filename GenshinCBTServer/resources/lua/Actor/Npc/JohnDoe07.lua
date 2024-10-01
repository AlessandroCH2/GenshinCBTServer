require('Actor/ActorCommon')
local NpcActorProxy = require('Actor/Npc/NpcActorProxy')
local JohnDoe07 = class("JohnDoe07", NpcActorProxy)

JohnDoe07.defaultAlias = "JohnDoe07"
JohnDoe07.pointID = 1
JohnDoe07.currWeather = WeatherType.ClearSky

local JohnDoe07Data =
{
	BornPos = sceneData:GetDummyPoint(3, "JohnDoe07Born").pos,
	BornDir = sceneData:GetDummyPoint(3, "JohnDoe07Born").rot,
	HomePos = sceneData:GetDummyPoint(3, "JohnDoe07Home").pos,
	HomeDir	= sceneData:GetDummyPoint(3, "JohnDoe07Home").rot,
	Pos01Pos = sceneData:GetDummyPoint(3, "JohnDoe07Pos01").pos,
	Pos02Pos = sceneData:GetDummyPoint(3, "JohnDoe07Pos02").pos,
	Pos03Pos = sceneData:GetDummyPoint(3, "JohnDoe07Pos03").pos,
	Pos04Pos = sceneData:GetDummyPoint(3, "JohnDoe07Pos04").pos,
	Pos05Pos = sceneData:GetDummyPoint(3, "JohnDoe07Pos05").pos,
	Pos06Pos = sceneData:GetDummyPoint(3, "JohnDoe07Pos06").pos,
	Pos07Pos = sceneData:GetDummyPoint(3, "JohnDoe07Pos07").pos,
	Pos08Pos = sceneData:GetDummyPoint(3, "JohnDoe07Pos08").pos,
	Pos09Pos = sceneData:GetDummyPoint(3, "JohnDoe07Pos09").pos,
}


function JohnDoe07:Start()
	--print("start!JohnDoe07")
	self:StartDaily()
end

function JohnDoe07:DoAppear()
	self:ShowSelf()
	self:PerformDither(true, 2)
end

function JohnDoe07:DoDisappear()
	self:PerformDither(false, 2, self.HideSelf)
end

function JohnDoe07:InvokeOnResetFreeStyle(freeStyleType)
	if freeStyleType == 361 or freeStyleType == 141 or freeStyleType == 142 then
		self:StartDaily()
	end
end

function JohnDoe07:StartDaily()
	--print("JohnDoe07 StartDaily")
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

function JohnDoe07:OnCollisionEnter(targetInfo)
	if targetInfo.isSprint or targetInfo.isRun then
		if targetInfo.isFromBack then
			self:DoFreeStyleTask(42, true, self.StartDaily)
		else
			self:DoFreeStyleTask(71, true, self.StartDaily) 
		end
	end
end
	
function JohnDoe07:StartDay()
	self:ClearFollowTask()
	self:ShowSelf()
	self:TurnTo(M.Euler2DirXZ(JohnDoe07Data.BornDir))
	self:PerformDither(true, 2, self.GoPatrol)
end

function JohnDoe07:GoPatrol()
	if self.pointID == 10 then
		self.pointID = 1
	end
	self:GoPatrolRoute()
end

function JohnDoe07:GoPatrolRoute()
	if self.pointID == 1 then
		self:WalkToTask(JohnDoe07Data.Pos01Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 2 then
		self:WalkToTask(JohnDoe07Data.Pos02Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 3 then
		self:WalkToTask(JohnDoe07Data.Pos03Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 4 then
		self:WalkToTask(JohnDoe07Data.Pos04Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 5 then
		self:WalkToTask(JohnDoe07Data.Pos05Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 6 then
		self:WalkToTask(JohnDoe07Data.Pos06Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 7 then
		self:WalkToTask(JohnDoe07Data.Pos07Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 8 then
		self:WalkToTask(JohnDoe07Data.Pos08Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 9 then
		self:WalkToTask(JohnDoe07Data.Pos09Pos, self.SelfPointUpdate, self.Standby)
	end
end

function JohnDoe07:SelfPointUpdate()
	self.pointID = self.pointID + 1
	self:GoPatrol()
end

function JohnDoe07:StartNight()
	self:ClearFollowTask()
	self:DoFreeStateTrigger()
	self:GoHome()
end

function JohnDoe07:GoHome()
	if self.pointID == 1 then
		self:TurnTo(M.Euler2DirXZ(JohnDoe07Data.HomeDir))
		self:PerformDither(false, 2, self.HideSelf)
	else
		self:GoHomeRoute()
	end
end

function JohnDoe07:GoHomeRoute()
	if self.pointID > 1 then
		self.pointID = 1
		self:WalkToTask(JohnDoe07Data.HomePos, self.GoHome, self.Standby)
	end
end

function JohnDoe07:OnEvent(evt)
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

return JohnDoe07