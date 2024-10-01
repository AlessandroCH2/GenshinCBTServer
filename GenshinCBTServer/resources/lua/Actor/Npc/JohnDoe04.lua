require('Actor/ActorCommon')
local NpcActorProxy = require('Actor/Npc/NpcActorProxy')
local JohnDoe04 = class("JohnDoe04", NpcActorProxy)

JohnDoe04.defaultAlias = "JohnDoe04"
JohnDoe04.pointID = 1
JohnDoe04.currWeather = WeatherType.ClearSky

local JohnDoe04Data =
{
	BornPos = sceneData:GetDummyPoint(3, "JohnDoe04Born").pos,
	BornDir = sceneData:GetDummyPoint(3, "JohnDoe04Born").rot,
	HomePos = sceneData:GetDummyPoint(3, "JohnDoe04Home").pos,
	HomeDir	= sceneData:GetDummyPoint(3, "JohnDoe04Home").rot,
	Pos01Pos = sceneData:GetDummyPoint(3, "JohnDoe04Pos01").pos,
	Pos01Dir = sceneData:GetDummyPoint(3, "JohnDoe04Pos01").rot,
	Pos02Pos = sceneData:GetDummyPoint(3, "JohnDoe04Pos02").pos,
	Pos02Dir = sceneData:GetDummyPoint(3, "JohnDoe04Pos02").rot,
	Pos03Pos = sceneData:GetDummyPoint(3, "JohnDoe04Pos03").pos,
	Pos03Dir = sceneData:GetDummyPoint(3, "JohnDoe04Pos03").rot,
	Pos04Pos = sceneData:GetDummyPoint(3, "JohnDoe04Pos04").pos,
	Pos04Dir = sceneData:GetDummyPoint(3, "JohnDoe04Pos04").rot,
	ScaredPos = sceneData:GetDummyPoint(3, "NPCScaredPoint04").pos,
}


function JohnDoe04:Start()
	--print("start!JohnDoe04")
	self:StartDaily()
end

function JohnDoe04:DoAppear()
	self:ShowSelf()
	self:PerformDither(true, 2)
end

function JohnDoe04:DoDisappear()
	self:PerformDither(false, 2, self.HideSelf)
end

function JohnDoe04:InvokeOnResetFreeStyle(freeStyleType)
	if freeStyleType == 361 or freeStyleType == 141 or freeStyleType == 142 then
		self:StartDaily()
	end
end

function JohnDoe04:StartDaily()
	--print("JohnDoe04 StartDaily")
	self:CallOnCollisionEnter(self.OnCollisionEnter)
	self:RegisterSelfDayTime(self.StartDay)
	self:RegisterSelfHour(self.HourBehave)
	self:RegisterSelfNightTime(self.StartNight)
	self:RegisterActorEvent(self.OnEvent)
	if globalActor.isDay then
		self:StartDay()
	else
		self:StartNight()
	end
end

function JohnDoe04:OnCollisionEnter(targetInfo)
	if targetInfo.isSprint or targetInfo.isRun then
		if targetInfo.isFromBack then
			self:DoFreeStyleTask(42, true, self.StartDaily)
		else
			self:DoFreeStyleTask(71, true, self.StartDaily) 
		end
	end
end
	
function JohnDoe04:StartDay()
	self:ClearFollowTask()
	self:ShowSelf()
	self:TurnTo(M.Euler2DirXZ(JohnDoe04Data.BornDir))
	self:PerformDither(true, 2, self.GoChat)
end

function JohnDoe04:GoChat()
	if self.pointID == 1 then
		self:WalkToTask(JohnDoe04Data.Pos01Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 2 then
		self:WalkToTask(JohnDoe04Data.Pos02Pos, self.Chat, self.Standby)
	elseif self.pointID == 3 then
		self:WalkToTask(JohnDoe04Data.Pos03Pos, self.Chat, self.Standby)
	elseif self.pointID == 4 then
		self:WalkToTask(JohnDoe04Data.Pos04Pos, self.Chat, self.Standby)
	end
end

function JohnDoe04:SelfPointUpdate()
	if globalActor.isDay then
		self.pointID = self.pointID + 1
		self:GoChat()
	else
		self.pointID = self.pointID - 1
		self:GoHome()
	end
end

function JohnDoe04:Chat()
	if self.pointID < 2 then
		self:GoChat()
	elseif self.pointID == 2 then
		self:DoFreeStyle(51)
		self:TurnTo(M.Euler2DirXZ(JohnDoe04Data.Pos02Dir))
	elseif self.pointID == 3 then
		self:DoFreeStyle(51)
		self:TurnTo(M.Euler2DirXZ(JohnDoe04Data.Pos03Dir))
	elseif self.pointID == 4 then
		self:DoFreeStyle(51)
		self:TurnTo(M.Euler2DirXZ(JohnDoe04Data.Pos04Dir))
	end
end

function JohnDoe04:HourBehave(Hour)
	if Hour == 9 or Hour == 12 or Hour == 15 then
		self:DoFreeStateTrigger()
		self.pointID = 3
		self:GoChat()
	elseif Hour == 10 or Hour == 13 or Hour == 16 then
		self:DoFreeStateTrigger()
		self.pointID = 4
		self:GoChat()
	elseif Hour == 11 or Hour == 14 or Hour == 17 then
		self:DoFreeStateTrigger()
		self.pointID = 2
		self:GoChat()
	end
end

function JohnDoe04:StartNight()
	self:ClearFollowTask()
	self:DoFreeStateTrigger()
	self:GoHome()
end

function JohnDoe04:GoHome()
	if self.pointID == 1 then
		self:TurnTo(M.Euler2DirXZ(JohnDoe04Data.HomeDir))
		self:PerformDither(false, 2, self.HideSelf)
	else
		self:GoHomeRoute()
	end
end

function JohnDoe04:GoHomeRoute()
	if self.pointID > 2 then
		self.pointID = 3
		self:WalkToTask(JohnDoe04Data.Pos01Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 2 then
		self:WalkToTask(JohnDoe04Data.HomePos, self.SelfPointUpdate, self.Standby)
	end
end

function JohnDoe04:OnEvent(evt)
	if evt.evtType == 35701 then
		self:ClearAllTask()
		self:ClearOnCollisionEnter(self.OnCollisionEnter)
		self:UnregisterSelfDayTime(self.StartDay)
		self:UnregisterSelfHour(self.HourBehave)
		self:UnregisterSelfNightTime(self.StartNight)
		self:UnregisterActorEvent(self.OnEvent)
		self:DoAppear()
		self:SetPos(JohnDoe04Data.ScaredPos)
		self:DoFreeStyle(362)
	elseif evt.evtType == 35702 then
		self:StartDaily()
	end
end

return JohnDoe04