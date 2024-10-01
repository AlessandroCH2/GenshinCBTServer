require('Actor/ActorCommon')
local NpcActorProxy = require('Actor/Npc/NpcActorProxy')
local StoreKeeper02 = class("StoreKeeper02", NpcActorProxy)

StoreKeeper02.defaultAlias = "StoreKeeper02"
StoreKeeper02.pointID = 1
StoreKeeper02.currWeather = WeatherType.ClearSky

local StoreKeeper02Data =
{
	BornPos = sceneData:GetDummyPoint(3, "StoreKeeper02Born").pos,
	BornDir = sceneData:GetDummyPoint(3, "StoreKeeper02Born").rot,
	HomePos = sceneData:GetDummyPoint(3, "StoreKeeper02Home").pos,
	HomeDir	= sceneData:GetDummyPoint(3, "StoreKeeper02Home").rot,
	Pos01Pos = sceneData:GetDummyPoint(3, "StoreKeeper02Pos01").pos,
	Pos02Pos = sceneData:GetDummyPoint(3, "StoreKeeper02Pos02").pos,
	StorePos = sceneData:GetDummyPoint(3, "StoreKeeper02Store").pos,
	StoreDir = sceneData:GetDummyPoint(3, "StoreKeeper02Store").rot,
	ScaredPos = sceneData:GetDummyPoint(3, "NPCScaredPoint06").pos,
}


function StoreKeeper02:Start()
	--print("start!StoreKeeper02")
	self:StartDaily()
end

function StoreKeeper02:DoAppear()
	self:ShowSelf()
	self:PerformDither(true, 2)
end

function StoreKeeper02:DoDisappear()
	self:PerformDither(false, 2, self.HideSelf)
end

function StoreKeeper02:InvokeOnResetFreeStyle(freeStyleType)
	if freeStyleType == 361 or freeStyleType == 141 or freeStyleType == 142 then
		self:StartDaily()
	end
end

function StoreKeeper02:StartDaily()
	--print("StoreKeeper02 StartDaily")
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

function StoreKeeper02:OnCollisionEnter(targetInfo)
	if targetInfo.isSprint or targetInfo.isRun then
		if targetInfo.isFromBack then
			self:DoFreeStyleTask(42, true, self.StartDaily)
		else
			self:DoFreeStyleTask(71, true, self.StartDaily) 
		end
	end
end
	
function StoreKeeper02:StartDay()
	self:ClearFollowTask()
	self:ShowSelf()
	self:TurnTo(M.Euler2DirXZ(StoreKeeper02Data.BornDir))
	self:PerformDither(true, 2, self.GoStore)
end

function StoreKeeper02:GoStore()
	if self.pointID == 4 then
		self:DoFreeStyle(331)
		self:TurnTo(M.Euler2DirXZ(StoreKeeper02Data.StoreDir))
	else
		self:GoStoreRoute()
	end
end

function StoreKeeper02:GoStoreRoute()
	if self.pointID == 1 then
		self:WalkToTask(StoreKeeper02Data.Pos01Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 2 then
		self:WalkToTask(StoreKeeper02Data.Pos02Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 3 then
		self:WalkToTask(StoreKeeper02Data.StorePos, self.SelfPointUpdate, self.Standby)
	end
end

function StoreKeeper02:SelfPointUpdate()
	if globalActor.isDay then
		self.pointID = self.pointID + 1
		self:GoStore()
	else
		self.pointID = self.pointID - 1
		self:GoHome()
	end
end

function StoreKeeper02:StartNight()
	self:ClearFollowTask()
	self:DoFreeStateTrigger()
	self:GoHome()
end

function StoreKeeper02:GoHome()
	if self.pointID == 1 then
		self:TurnTo(M.Euler2DirXZ(StoreKeeper02Data.HomeDir))
		self:PerformDither(false, 2, self.HideSelf)
	else
		self:GoHomeRoute()
	end
end

function StoreKeeper02:GoHomeRoute()
	if self.pointID == 4 then
		self:WalkToTask(StoreKeeper02Data.Pos02Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 3 then
		self:WalkToTask(StoreKeeper02Data.Pos01Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 2 then
		self:WalkToTask(StoreKeeper02Data.HomePos, self.SelfPointUpdate, self.Standby)
	end
end

function StoreKeeper02:OnEvent(evt)
	if evt.evtType == 35701 then
		self:ClearAllTask()
		self:ClearOnCollisionEnter(self.OnCollisionEnter)
		self:UnregisterSelfDayTime(self.StartDay)
		self:UnregisterSelfHour(self.HourBehave)
		self:UnregisterSelfNightTime(self.StartNight)
		self:UnregisterActorEvent(self.OnEvent)
		self:DoAppear()
		self:SetPos(StoreKeeper02Data.ScaredPos)
		self:DoFreeStyle(362)
	elseif evt.evtType == 35702 then
		self:StartDaily()
	end
end

return StoreKeeper02