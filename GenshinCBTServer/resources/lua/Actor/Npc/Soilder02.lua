require('Actor/ActorCommon')
local NpcActorProxy = require('Actor/Npc/NpcActorProxy')
local Soilder02 = class("Soilder02", NpcActorProxy)

Soilder02.defaultAlias = "Soilder02"
Soilder02.pointID = 1
Soilder02.currWeather = WeatherType.ClearSky

local Soilder02Data =
{
	BornPos = sceneData:GetDummyPoint(3, "Soilder02Born").pos,
	BornDir = sceneData:GetDummyPoint(3, "Soilder02Born").rot,
	HomePos = sceneData:GetDummyPoint(3, "Soilder02Home").pos,
	HomeDir	= sceneData:GetDummyPoint(3, "Soilder02Home").rot,
	Pos01Pos = sceneData:GetDummyPoint(3, "Soilder02Pos01").pos,
	Pos01Dir = sceneData:GetDummyPoint(3, "Soilder02Pos01").rot,
	Pos02Pos = sceneData:GetDummyPoint(3, "Soilder02Pos02").pos,
	Pos02Dir = sceneData:GetDummyPoint(3, "Soilder02Pos02").rot,
	Pos03Pos = sceneData:GetDummyPoint(3, "Soilder02Pos03").pos,
	Pos03Dir = sceneData:GetDummyPoint(3, "Soilder02Pos03").rot,
}


function Soilder02:Start()
	--print("start!Soilder02")
	self:StartDaily()
end

function Soilder02:DoAppear()
	self:ShowSelf()
	self:PerformDither(true, 2)
end

function Soilder02:DoDisappear()
	self:PerformDither(false, 2, self.HideSelf)
end

function Soilder02:InvokeOnResetFreeStyle(freeStyleType)
	if freeStyleType == 361 or freeStyleType == 141 or freeStyleType == 142 then
		self:StartDaily()
	end
end

function Soilder02:StartDaily()
	--print("Soilder02 StartDaily")
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

function Soilder02:OnCollisionEnter(targetInfo)
	if targetInfo.isSprint or targetInfo.isRun then
		if targetInfo.isFromBack then
			self:DoFreeStyleTask(42, true, self.StartDaily)
		else
			self:DoFreeStyleTask(71, true, self.StartDaily) 
		end
	end
end
	
function Soilder02:StartDay()
	self:ClearFollowTask()
	self:ShowSelf()
	self:TurnTo(M.Euler2DirXZ(Soilder02Data.BornDir))
	self:PerformDither(true, 2, self.GoChat)
end

function Soilder02:GoChat()
	if self.pointID == 1 then
		self:WalkToTask(Soilder02Data.Pos01Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 2 then
		self:WalkToTask(Soilder02Data.Pos02Pos, self.Chat, self.Standby)
	elseif self.pointID == 3 then
		self:WalkToTask(Soilder02Data.Pos03Pos, self.Chat, self.Standby)
	end
end

function Soilder02:SelfPointUpdate()
	if globalActor.isDay then
		self.pointID = self.pointID + 1
		self:GoChat()
	else
		self.pointID = self.pointID - 1
		self:GoHome()
	end
end

function Soilder02:Chat()
	if self.pointID < 2 then
		self:GoChat()
	elseif self.pointID == 2 then
		self:DoFreeStyle(51)
		self:TurnTo(M.Euler2DirXZ(Soilder02Data.Pos02Dir))
	elseif self.pointID == 3 then
		self:DoFreeStyle(51)
		self:TurnTo(M.Euler2DirXZ(Soilder02Data.Pos03Dir))
	end
end

function Soilder02:HourBehave(Hour)
	if Hour == 10 or Hour == 14 then
		self:DoFreeStateTrigger()
		self.pointID = 3
		self:GoChat()
	elseif Hour == 12 or Hour == 16 then
		self:DoFreeStateTrigger()
		self.pointID = 2
		self:GoChat()
	end
end

function Soilder02:StartNight()
	self:ClearFollowTask()
	self:DoFreeStateTrigger()
	self:GoHome()
end

function Soilder02:GoHome()
	if self.pointID == 1 then
		self:TurnTo(M.Euler2DirXZ(Soilder02Data.HomeDir))
		self:DoDisappear()
	else
		self:GoHomeRoute()
	end
end

function Soilder02:GoHomeRoute()
	if self.pointID > 2 then
		self.pointID = 3
		self:WalkToTask(Soilder02Data.Pos01Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 2 then
		self:WalkToTask(Soilder02Data.HomePos, self.SelfPointUpdate, self.Standby)
	end
end

function Soilder02:OnEvent(evt)
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

return Soilder02