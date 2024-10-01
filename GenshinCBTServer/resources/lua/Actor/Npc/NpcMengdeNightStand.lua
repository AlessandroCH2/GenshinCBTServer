require('Actor/ActorCommon')
local BaseDailyNpc = require('Actor/Npc/BaseDailyNpc')
local MengdeNightStand = class("MengdeNightStand", BaseDailyNpc)
local DailyNpcCommon = require('Actor/Npc/NpcDailyCommon')
local NpcEventType = require('Actor/Npc/NPCEventType')
MengdeNightStand.defaultAlias = "MengdeNightStand"

local Config = require('Actor/Npc/Config/CfgMengdeNightStand')
local DummyPointData = Config.DummyPointData

function MengdeNightStand:PreGetAlias()
	local NpcAlias = DummyPointData.Npc .. '_' .. tostring(self.dataIndex)
	return NpcAlias
end

function MengdeNightStand:Register()
	DailyNpcCommon.Register(self)
end

function MengdeNightStand:InvokeOnResetFreeStyle(freeStyleType)
	DailyNpcCommon.InvokeOnResetFreeStyle(self,freeStyleType)	
end

function MengdeNightStand:OnCollisionEnter(targetInfo)
	DailyNpcCommon.OnCollisionEnter(targetInfo,self)	
end

function MengdeNightStand:WalkBack()
	print("walkback")
	self:WalkToTask(DummyPointData.BornPos[self.dataIndex],self.Recover)
	--self:StartDay()
end

function MengdeNightStand:RecoverFromFreeStyle()
	print("RecoverFromFreeStyle")
	self:Recover()
end

function MengdeNightStand:RecoverFromCollisionEnter()
	print("RecoverFromCollisionEnter")
	self:ClearAllTask()
	self:Recover()
	--self:CallDelay(0.5,self.WalkBack)
end

function MengdeNightStand:Recover()
	self.OnAction=0
	self:Standby()
	--self:TurnTo(M.Euler2DirXZ(DummyPointData.BornDir[self.dataIndex]))
	self:SteerToTask(M.Euler2DirXZ(DummyPointData.BornDir[self.dataIndex]),1,true,true)
	self:DoFreeStateTrigger()
end


function MengdeNightStand:StartDay()
	self:ClearNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex])
	self:PerformDither(false, 2, self.HideSelf)
end

function MengdeNightStand:StartNight()
	self:Standby()
	self:TurnTo(M.Euler2DirXZ(DummyPointData.BornDir[self.dataIndex]))
	self:DoFreeStateTrigger()
	self:ShowSelf()
	self:PerformDither(true, 2)
	self:StartBubble()
end

function MengdeNightStand:StartBubble()
	if self.bubble~=1 then
		self:ShowBubble()
		self.bubble=1
	end
end

function MengdeNightStand:ShowBubble()
	if DummyPointData.DialogID[self.dataIndex] ~= 0 then
		self:TriggerNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex], DummyPointData.DialogID[self.dataIndex])
		self:BubbleTime()
	end
end

function MengdeNightStand:BubbleTime()
	self:CallDelay(5, self.CloseBubble)
end

function MengdeNightStand:CloseBubble()
	self:ClearNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex])
	self:BubbleGap()
end

function MengdeNightStand:BubbleGap()
	self:CallDelay(math.random(7,8), self.ShowBubble)
end

function MengdeNightStand:OnEvent(evt)
	DailyNpcCommon.OnEvent(evt,self)
end

return MengdeNightStand