require('Actor/ActorCommon')
local NpcActorProxy = require('Actor/Npc/NpcActorProxy')
local JohnDoe03 = class("JohnDoe03", NpcActorProxy)

JohnDoe03.defaultAlias = "JohnDoe03"
JohnDoe03.pointID = 1
JohnDoe03.currWeather = WeatherType.ClearSky

local JohnDoe03Data =
{
	BornPos = sceneData:GetDummyPoint(3, "JohnDoe03Born").pos,
	BornDir = sceneData:GetDummyPoint(3, "JohnDoe03Born").rot,
	HomePos = sceneData:GetDummyPoint(3, "JohnDoe03Home").pos,
	HomeDir	= sceneData:GetDummyPoint(3, "JohnDoe03Home").rot,
	Pos01Pos = sceneData:GetDummyPoint(3, "JohnDoe03Pos01").pos,
	Pos01Dir = sceneData:GetDummyPoint(3, "JohnDoe03Pos01").rot,
	Pos02Pos = sceneData:GetDummyPoint(3, "JohnDoe03Pos02").pos,
	Pos02Dir = sceneData:GetDummyPoint(3, "JohnDoe03Pos02").rot,
	Pos03Pos = sceneData:GetDummyPoint(3, "JohnDoe03Pos03").pos,
	Pos03Dir = sceneData:GetDummyPoint(3, "JohnDoe03Pos03").rot,
	Pos04Pos = sceneData:GetDummyPoint(3, "JohnDoe03Pos04").pos,
	Pos04Dir = sceneData:GetDummyPoint(3, "JohnDoe03Pos04").rot,
	ScaredPos = sceneData:GetDummyPoint(3, "NPCScaredPoint03").pos,
}


function JohnDoe03:Start()
	--print("start!JohnDoe03")
	self:StartDaily()
end

function JohnDoe03:DoAppear()
	self:ShowSelf()
	self:PerformDither(true, 2)
end

function JohnDoe03:DoDisappear()
	self:PerformDither(false, 2, self.HideSelf)
end

function JohnDoe03:InvokeOnResetFreeStyle(freeStyleType)
	if freeStyleType == 361 or freeStyleType == 141 or freeStyleType == 142 then
		self:StartDaily()
	end
end

function JohnDoe03:StartDaily()
	--print("JohnDoe03 StartDaily")
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

function JohnDoe03:OnCollisionEnter(targetInfo)
	if targetInfo.isSprint or targetInfo.isRun then
		if targetInfo.isFromBack then
			self:DoFreeStyleTask(42, true, self.StartDaily)
		else
			self:DoFreeStyleTask(71, true, self.StartDaily) 
		end
	end
end
	
function JohnDoe03:StartDay()
	self:ClearFollowTask()
	self:ShowSelf()
	self:TurnTo(M.Euler2DirXZ(JohnDoe03Data.BornDir))
	self:PerformDither(true, 2, self.GoChat)
end

function JohnDoe03:GoChat()
	if self.pointID == 1 then
		self:WalkToTask(JohnDoe03Data.Pos01Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 2 then
		self:WalkToTask(JohnDoe03Data.Pos02Pos, self.Chat, self.Standby)
	elseif self.pointID == 3 then
		self:WalkToTask(JohnDoe03Data.Pos03Pos, self.Chat, self.Standby)
	elseif self.pointID == 4 then
		self:WalkToTask(JohnDoe03Data.Pos04Pos, self.Chat, self.Standby)
	end
end

function JohnDoe03:SelfPointUpdate()
	if globalActor.isDay then
		self.pointID = self.pointID + 1
		self:GoChat()
	else
		self.pointID = self.pointID - 1
		self:GoHome()
	end
end

function JohnDoe03:Chat()
	if self.pointID < 2 then
		self:GoChat()
	elseif self.pointID == 2 then
		self:DoFreeStyle(51)
		self:TurnTo(M.Euler2DirXZ(JohnDoe03Data.Pos02Dir))
	elseif self.pointID == 3 then
		self:DoFreeStyle(51)
		self:TurnTo(M.Euler2DirXZ(JohnDoe03Data.Pos03Dir))
	elseif self.pointID == 4 then
		self:DoFreeStyle(51)
		self:TurnTo(M.Euler2DirXZ(JohnDoe03Data.Pos04Dir))
	end
end

function JohnDoe03:HourBehave(Hour)
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

function JohnDoe03:StartNight()
	self:ClearFollowTask()
	self:DoFreeStateTrigger()
	self:GoHome()
end

function JohnDoe03:GoHome()
	if self.pointID == 1 then
		self:TurnTo(M.Euler2DirXZ(JohnDoe03Data.HomeDir))
		self:PerformDither(false, 2, self.HideSelf)
	else
		self:GoHomeRoute()
	end
end

function JohnDoe03:GoHomeRoute()
	if self.pointID > 2 then
		self.pointID = 3
		self:WalkToTask(JohnDoe03Data.Pos01Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 2 then
		self:WalkToTask(JohnDoe03Data.HomePos, self.SelfPointUpdate, self.Standby)
	end
end

function JohnDoe03:OnEvent(evt)
	if evt.evtType == 35701 then
		self:ClearAllTask()
		self:ClearOnCollisionEnter(self.OnCollisionEnter)
		self:UnregisterSelfDayTime(self.StartDay)
		self:UnregisterSelfHour(self.HourBehave)
		self:UnregisterSelfNightTime(self.StartNight)
		self:UnregisterActorEvent(self.OnEvent)
		self:DoAppear()
		self:SetPos(JohnDoe03Data.ScaredPos)
		self:DoFreeStyle(362)
	elseif evt.evtType == 35702 then
		self:StartDaily()
	end
end

return JohnDoe03