require('Actor/ActorCommon')
local NpcActorProxy = require('Actor/Npc/NpcActorProxy')
local StoreKeeper04 = class("StoreKeeper04", NpcActorProxy)

StoreKeeper04.defaultAlias = "StoreKeeper04"
StoreKeeper04.pointID = 1
StoreKeeper04.currWeather = WeatherType.ClearSky

local StoreKeeper04Data =
{
	BornPos = sceneData:GetDummyPoint(3, "StoreKeeper04Born").pos,
	BornDir = sceneData:GetDummyPoint(3, "StoreKeeper04Born").rot,
	HomePos = sceneData:GetDummyPoint(3, "StoreKeeper04Home").pos,
	HomeDir	= sceneData:GetDummyPoint(3, "StoreKeeper04Home").rot,
	Pos01Pos = sceneData:GetDummyPoint(3, "StoreKeeper04Pos01").pos,
	Pos02Pos = sceneData:GetDummyPoint(3, "StoreKeeper04Pos02").pos,
	StorePos = sceneData:GetDummyPoint(3, "StoreKeeper04Store").pos,
	StoreDir = sceneData:GetDummyPoint(3, "StoreKeeper04Store").rot,
	ChatPos = sceneData:GetDummyPoint(3, "StoreKeeper04Chat").pos,
	ChatDir = sceneData:GetDummyPoint(3, "StoreKeeper04Chat").rot,
	ScaredPos = sceneData:GetDummyPoint(3, "NPCScaredPoint08").pos,
}

function StoreKeeper04:Start()
	--print("start!StoreKeeper04")
	self:StartDaily()
end

function StoreKeeper04:DoAppear()
	self:ShowSelf()
	self:PerformDither(true, 2)
end

function StoreKeeper04:DoDisappear()
	self:PerformDither(false, 2, self.HideSelf)
end

function StoreKeeper04:InvokeOnResetFreeStyle(freeStyleType)
	if freeStyleType == 361 or freeStyleType == 141 or freeStyleType == 142 then
		self:StartDaily()
	end
end

function StoreKeeper04:StartDaily()
	--print("StoreKeeper04 StartDaily")
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

function StoreKeeper04:OnCollisionEnter(targetInfo)
	if targetInfo.isSprint or targetInfo.isRun then
		if targetInfo.isFromBack then
			self:DoFreeStyleTask(42, true, self.StartDaily)
		else
			self:DoFreeStyleTask(71, true, self.StartDaily) 
		end
	end
end
	
function StoreKeeper04:StartDay()
	self:ClearFollowTask()
	self:ShowSelf()
	self:TurnTo(M.Euler2DirXZ(StoreKeeper04Data.BornDir))
	self:PerformDither(true, 2, self.GoStore)
end

function StoreKeeper04:GoStore()
	if self.pointID == 4 then
		self:DoFreeStyle(331)
		self:TurnTo(M.Euler2DirXZ(StoreKeeper04Data.StoreDir))
	else
		self:GoStoreRoute()
	end
end

function StoreKeeper04:GoStoreRoute()
	if self.pointID == 1 then
		self:WalkToTask(StoreKeeper04Data.Pos01Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 2 then
		self:WalkToTask(StoreKeeper04Data.Pos02Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 3 then
		self:WalkToTask(StoreKeeper04Data.StorePos, self.SelfPointUpdate, self.Standby)
	end
end

function StoreKeeper04:SelfPointUpdate()
	if globalActor.isDay then
		self.pointID = self.pointID + 1
		self:GoStore()
	else
		self.pointID = self.pointID - 1
		self:GoHome()
	end
end

function StoreKeeper04:HourBehave(Hour)
	if Hour == 10 or Hour == 14 then
		self:CallDelay(1, self.DelayChat)
	elseif Hour == 11 or Hour == 15 then
		self:DoFreeStateTrigger()
		self.pointID = 3
		self:StartDaily()
	end
end

function StoreKeeper04:DelayChat()
	self:DoFreeStateTrigger()
	self:WalkToTask(StoreKeeper04Data.ChatPos, self.Chat, self.Standby)
end


function StoreKeeper04:Chat()
	self:DoFreeStyle(52)
	self:TurnTo(M.Euler2DirXZ(StoreKeeper04Data.ChatDir))
end

function StoreKeeper04:StartNight()
	self:ClearFollowTask()
	self:DoFreeStateTrigger()
	self:GoHome()
end

function StoreKeeper04:GoHome()
	if self.pointID == 1 then
		self:TurnTo(M.Euler2DirXZ(StoreKeeper04Data.HomeDir))
		self:DoDisappear()
	else
		self:GoHomeRoute()
	end
end

function StoreKeeper04:GoHomeRoute()
	if self.pointID == 4 then
		self:WalkToTask(StoreKeeper04Data.Pos02Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 3 then
		self:WalkToTask(StoreKeeper04Data.Pos01Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 2 then
		self:WalkToTask(StoreKeeper04Data.HomePos, self.SelfPointUpdate, self.Standby)
	end
end

function StoreKeeper04:OnEvent(evt)
	if evt.evtType == 35701 then
		self:ClearAllTask()
		self:ClearOnCollisionEnter(self.OnCollisionEnter)
		self:UnregisterSelfDayTime(self.StartDay)
		self:UnregisterSelfHour(self.HourBehave)
		self:UnregisterSelfNightTime(self.StartNight)
		self:UnregisterActorEvent(self.OnEvent)
		self:DoAppear()
		self:SetPos(StoreKeeper04Data.ScaredPos)
		self:DoFreeStyle(362)
	elseif evt.evtType == 35702 then
		self:StartDaily()
	end
end

return StoreKeeper04