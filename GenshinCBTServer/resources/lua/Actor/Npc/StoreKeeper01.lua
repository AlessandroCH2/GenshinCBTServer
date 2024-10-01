require('Actor/ActorCommon')
local BaseDailyNpc = require('Actor/Npc/BaseDailyNpc')
local StoreKeeper01 = class("StoreKeeper01", BaseDailyNpc)

StoreKeeper01.defaultAlias = "StoreKeeper01"
StoreKeeper01.pointID = 1

local StoreKeeper01Data =
{
	BornPos = sceneData:GetDummyPoint(3, "StoreKeeper01Born").pos,
	BornDir = sceneData:GetDummyPoint(3, "StoreKeeper01Born").rot,
	HomePos = sceneData:GetDummyPoint(3, "StoreKeeper01Home").pos,
	HomeDir	= sceneData:GetDummyPoint(3, "StoreKeeper01Home").rot,
	Pos01Pos = sceneData:GetDummyPoint(3, "StoreKeeper01Pos01").pos,
	Pos02Pos = sceneData:GetDummyPoint(3, "StoreKeeper01Pos02").pos,
	StorePos = sceneData:GetDummyPoint(3, "StoreKeeper01Store").pos,
	StoreDir = sceneData:GetDummyPoint(3, "StoreKeeper01Store").rot,
	ChatPos = sceneData:GetDummyPoint(3, "StoreKeeper01Chat").pos,
	ChatDir = sceneData:GetDummyPoint(3, "StoreKeeper01Chat").rot,
	--ScaredPos = sceneData:GetDummyPoint(3, "NPCScaredPoint05").pos,
}

function StoreKeeper01:Register()
	self:RegisterMode(npcMode.MODE_DRAGON_ATTACK)
end

function StoreKeeper01:InvokeOnResetFreeStyle(freeStyleType)
	if freeStyleType == 361 or freeStyleType == 141 or freeStyleType == 142 then
		self:StartDaily()
	end
end

function StoreKeeper01:OnCollisionEnter(targetInfo)
	if targetInfo.isSprint or targetInfo.isRun then
		if targetInfo.isFromBack then
			self:DoFreeStyleTask(42, true, self.StartDaily)
		else
			self:DoFreeStyleTask(71, true, self.StartDaily) 
		end
	end
end
	
function StoreKeeper01:StartDay()
	self:ClearFollowTask()
	self:ShowSelf()
	self:TurnTo(M.Euler2DirXZ(StoreKeeper01Data.BornDir))
	self:PerformDither(true, 2, self.GoStore)
end

function StoreKeeper01:GoStore()
	if self.pointID == 4 then
		self:DoFreeStyle(331)
		self:TurnTo(M.Euler2DirXZ(StoreKeeper01Data.StoreDir))
	else
		self:GoStoreRoute()
	end
end

function StoreKeeper01:GoStoreRoute()
	if self.pointID == 1 then
		self:WalkToTask(StoreKeeper01Data.Pos01Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 2 then
		self:WalkToTask(StoreKeeper01Data.Pos02Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 3 then
		self:WalkToTask(StoreKeeper01Data.StorePos, self.SelfPointUpdate, self.Standby)
	end
end

function StoreKeeper01:SelfPointUpdate()
	if globalActor.isDay then
		self.pointID = self.pointID + 1
		self:GoStore()
	else
		self.pointID = self.pointID - 1
		self:GoHome()
	end
end

function StoreKeeper01:HourBehave(Hour)
	if Hour == 10 or Hour == 14 then
		self:DoFreeStateTrigger()
		self:WalkToTask(StoreKeeper01Data.ChatPos, self.Chat, self.Standby)
	elseif Hour == 11 or Hour == 15 then
		self:DoFreeStateTrigger()
		self.pointID = 3
		self:StartDaily()
	end
end

function StoreKeeper01:Chat()
	self:DoFreeStyle(51)
	self:TurnTo(M.Euler2DirXZ(StoreKeeper01Data.ChatDir))
end

function StoreKeeper01:StartNight()
	self:ClearFollowTask()
	self:DoFreeStateTrigger()
	self:GoHome()
end

function StoreKeeper01:GoHome()
	if self.pointID == 1 then
		self:TurnTo(M.Euler2DirXZ(StoreKeeper01Data.HomeDir))
		self:DoDisappear()
	else
		self:GoHomeRoute()
	end
end

function StoreKeeper01:GoHomeRoute()
	if self.pointID == 4 then
		self:WalkToTask(StoreKeeper01Data.Pos02Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 3 then
		self:WalkToTask(StoreKeeper01Data.Pos01Pos, self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 2 then
		self:WalkToTask(StoreKeeper01Data.HomePos, self.SelfPointUpdate, self.Standby)
	end
end

function StoreKeeper01:OnEvent(evt)
	if evt.evtType == 35701 then
		self:SwitchMode(npcMode.MODE_DRAGON_ATTACK)
	elseif evt.evtType == 35702 then
		self:StartDaily()
	end
end

return StoreKeeper01