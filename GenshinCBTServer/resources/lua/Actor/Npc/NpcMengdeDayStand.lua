require('Actor/ActorCommon')
local BaseDailyNpc = require('Actor/Npc/BaseDailyNpc')
local MengdeDayStand = class("MengdeDayStand", BaseDailyNpc)
local DailyNpcCommon = require('Actor/Npc/NpcDailyCommon')
local NpcEventType = require('Actor/Npc/NPCEventType')
MengdeDayStand.defaultAlias = "MengdeDayStand"

local Config = require('Actor/Npc/Config/CfgMengdeDayStand')
local DummyPointData = Config.DummyPointData



function MengdeDayStand:PreGetAlias()
	local NpcAlias = DummyPointData.Npc .. '_' .. tostring(self.dataIndex)
	return NpcAlias
end

function MengdeDayStand:Register()
	DailyNpcCommon.Register(self)
end

function MengdeDayStand:InvokeOnResetFreeStyle(freeStyleType)
	DailyNpcCommon.InvokeOnResetFreeStyle(self,freeStyleType)	
end

function MengdeDayStand:OnCollisionEnter(targetInfo)
	DailyNpcCommon.OnCollisionEnter(targetInfo,self)	
end

function MengdeDayStand:WalkBack()
	print("walkback")
	self:WalkToTask(DummyPointData.BornPos[self.dataIndex],self.Recover)
	--self:StartDay()
end

function MengdeDayStand:RecoverFromFreeStyle()
	print("RecoverFromFreeStyle")
	self:Recover()
end

function MengdeDayStand:RecoverFromCollisionEnter()
	print("RecoverFromCollisionEnter")
	--self:ClearAllTask()
	self:Recover()
	--self:CallDelay(0.5,self.WalkBack)
end

function MengdeDayStand:Recover()
	self.OnAction=0
	self:Standby()
	--self:TurnTo(M.Euler2DirXZ(DummyPointData.BornDir[self.dataIndex]))
	self:SteerToTask(M.Euler2DirXZ(DummyPointData.BornDir[self.dataIndex]),1,true,true)
	self:DoFreeStateTrigger()
end

function MengdeDayStand:StartDay()
	self:Standby()
	self:TurnTo(M.Euler2DirXZ(DummyPointData.BornDir[self.dataIndex]))
	self:DoFreeStateTrigger()
	self:ShowSelf()
	self:PerformDither(true, 2)
	self:StartBubble()
end

function MengdeDayStand:StartBubble()
	if self.bubble~=1 then
		self:ShowBubble()
		self.bubble=1
	end
end


function MengdeDayStand:StartBubble()
	--print("startbubble")
	--if self.bubble~=1 then
		--print("startbubble1")
		self:ShowBubble()
		--self.bubble=1
	--end
end

function MengdeDayStand:ShowBubble()	
	if DummyPointData.DialogID[self.dataIndex] ~= 0 then
		self:TriggerNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex], DummyPointData.DialogID[self.dataIndex])
		self:BubbleTime()
	end
end


function MengdeDayStand:BubbleTime()
	self:CallDelay(5, self.CloseBubble)
end

function MengdeDayStand:CloseBubble()
	self:ClearNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex])
	self:BubbleGap()
end

function MengdeDayStand:BubbleGap()
	self:CallDelay(math.random(7,8), self.ShowBubble)
end

function MengdeDayStand:StartNight()
	self:ClearNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex])
	self:PerformDither(false, 2, self.HideSelf)
end

function MengdeDayStand:OnEvent(evt)
	DailyNpcCommon.OnEvent(evt,self)	
end

return MengdeDayStand