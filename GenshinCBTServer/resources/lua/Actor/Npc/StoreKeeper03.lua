require('Actor/ActorCommon')
local NpcActorProxy = require('Actor/Npc/NpcActorProxy')
local StoreKeeper03 = class("StoreKeeper03", NpcActorProxy)

StoreKeeper03.defaultAlias = "StoreKeeper03"
StoreKeeper03.pointID = 1
StoreKeeper03.currWeather = WeatherType.ClearSky

local StoreKeeper03Data =
{
	BornPos = sceneData:GetDummyPoint(3, "StoreKeeper03Born").pos,
	BornDir = sceneData:GetDummyPoint(3, "StoreKeeper03Born").rot,
	HomePos = sceneData:GetDummyPoint(3, "StoreKeeper03Home").pos,
	HomeDir	= sceneData:GetDummyPoint(3, "StoreKeeper03Home").rot,
	Pos01Pos = sceneData:GetDummyPoint(3, "StoreKeeper03Pos01").pos,
	Pos02Pos = sceneData:GetDummyPoint(3, "StoreKeeper03Pos02").pos,
	StorePos = sceneData:GetDummyPoint(3, "StoreKeeper03Store").pos,
	StoreDir = sceneData:GetDummyPoint(3, "StoreKeeper03Store").rot,
	ScaredPos = sceneData:GetDummyPoint(3, "NPCScaredPoint07").pos,
}


function StoreKeeper03:Start()
	--print("start!StoreKeeper03")
	self:StartDaily()
end

function StoreKeeper03:DoAppear()
	self:ShowSelf()
	self:PerformDither(true, 2)
end

function StoreKeeper03:DoDisappear()
	self:PerformDither(false, 2, self.HideSelf)
end

function StoreKeeper03:InvokeOnResetFreeStyle(freeStyleType)
	if freeStyleType == 361 or freeStyleType == 141 or freeStyleType == 142 then
		self:StartDaily()
	end
end

function StoreKeeper03:StartDaily()
	--print("StoreKeeper03 StartDaily")
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

function StoreKeeper03:OnCollisionEnter(targetInfo)
	if targetInfo.isSprint or targetInfo.isRun then
		if targetInfo.isFromBack then
			self:DoFreeStyleTask(42, true, self.StartDaily)
		else
			self:DoFreeStyleTask(71, true, self.StartDaily) 
		end
	end
end
	
function StoreKeeper03:StartDay()
	self:ClearFollowTask()
	self:ShowSelf()
	self:TurnTo(M.Euler2DirXZ(StoreKeeper03Data.BornDir))
	self:PerformDither(true, 2, self.GoStore)
end

function StoreKeeper03:GoStore()
	if self.pointID == 4 then
		self:DoFreeStyle(331)
		self:TurnTo(M.Euler2DirXZ(StoreKeeper03Data.StoreDir))
	else
		self:GoStoreRoute()
	end
end

function StoreKeeper03:GoStoreRoute()
	if self.pointID == 1 then
		self:WalkToTask(StoreKeeper03Data.Pos01Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 2 then
		self:WalkToTask(StoreKeeper03Data.Pos02Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 3 then
		self:WalkToTask(StoreKeeper03Data.StorePos, self.SelfPointUpdate, self.Standby)
	end
end

function StoreKeeper03:SelfPointUpdate()
	if globalActor.isDay then
		self.pointID = self.pointID + 1
		self:GoStore()
	else
		self.pointID = self.pointID - 1
		self:GoHome()
	end
end

function StoreKeeper03:StartNight()
	self:ClearFollowTask()
	self:DoFreeStateTrigger()
	self:GoHome()
end

function StoreKeeper03:GoHome()
	if self.pointID == 1 then
		self:TurnTo(M.Euler2DirXZ(StoreKeeper03Data.HomeDir))
		self:DoDisappear()
	else
		self:GoHomeRoute()
	end
end

function StoreKeeper03:GoHomeRoute()
	if self.pointID == 4 then
		self:WalkToTask(StoreKeeper03Data.Pos02Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 3 then
		self:WalkToTask(StoreKeeper03Data.Pos01Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 2 then
		self:WalkToTask(StoreKeeper03Data.HomePos, self.SelfPointUpdate, self.Standby)
	end
end

function StoreKeeper03:OnEvent(evt)
	if evt.evtType == 35701 then
		self:ClearAllTask()
		self:ClearOnCollisionEnter(self.OnCollisionEnter)
		self:UnregisterSelfDayTime(self.StartDay)
		self:UnregisterSelfHour(self.HourBehave)
		self:UnregisterSelfNightTime(self.StartNight)
		self:UnregisterActorEvent(self.OnEvent)
		self:DoAppear()
		self:SetPos(StoreKeeper03Data.ScaredPos)
		self:DoFreeStyle(362)
	elseif evt.evtType == 35702 then
		self:StartDaily()
	end
end

return StoreKeeper03