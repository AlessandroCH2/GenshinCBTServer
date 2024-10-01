require('Actor/ActorCommon')
local BaseDailyNpc = require('Actor/Npc/BaseDailyNpc')
local MengdeNightConfuse = class("MengdeNightConfuse", BaseDailyNpc)
local DailyNpcCommon = require('Actor/Npc/NpcDailyCommon')
local NpcEventType = require('Actor/Npc/NPCEventType')
MengdeNightConfuse.defaultAlias = "MengdeNightConfuse"
MengdeNightConfuse.pointID = 1
MengdeNightConfuse.nightConfuseTargetPos = nil

local Config = require('Actor/Npc/Config/CfgMengdeNightConfuse')
local DummyPointData = Config.DummyPointData

function MengdeNightConfuse:PreGetAlias()
	local NpcAlias = DummyPointData.Npc .. '_' .. tostring(self.dataIndex)
	return NpcAlias
end

function MengdeNightConfuse:Register()
	DailyNpcCommon.Register(self)
end

function MengdeNightConfuse:RecoverFromFreeStyle()
	print("RecoverFromFreeStyle")
	self:Recover()
end

function MengdeNightConfuse:RecoverFromCollisionEnter()
	print("RecoverFromCollisionEnter")
	self:Recover()
end

function MengdeNightConfuse:Recover()
	self:RandomStand()
end


function MengdeNightConfuse:InvokeOnResetFreeStyle(freeStyleType)
	DailyNpcCommon.InvokeOnResetFreeStyle(self,freeStyleType)	
end

function MengdeNightConfuse:OnCollisionEnter(targetInfo)
	DailyNpcCommon.OnCollisionEnter(targetInfo,self)	
end


function MengdeNightConfuse:StartDay()
	self:PerformDither(false, 2, self.HideSelf)
end

function MengdeNightConfuse:StartNight()
	self:ShowSelf()
	self:PerformDither(true, 2)
	self:RandomStand()
	self:StartBubble()
end

function MengdeNightConfuse:StartBubble()
	if self.bubble~=1 then
		self:ShowBubble()
		self.bubble=1
	end
end

function MengdeNightConfuse:ShowBubble()
	if DummyPointData.DialogID[self.dataIndex] ~= 0 then
		self:TriggerNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex], DummyPointData.DialogID[self.dataIndex])
		self:BubbleTime()
	end
end

function MengdeNightConfuse:BubbleTime()
	self:CallDelay(5, self.CloseBubble)
end

function MengdeNightConfuse:CloseBubble()
	self:ClearNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex])
	self:BubbleGap()
end

function MengdeNightConfuse:BubbleGap()
	self:CallDelay(math.random(7,8), self.ShowBubble)
end

function MengdeNightConfuse:RandomStand()
	self:ChooseRandomPos()
	self:WalkToTask(self.nightConfuseTargetPos, self.NextMove, self.Standby)
end

function MengdeNightConfuse:ChooseRandomPos()
	self.pointID = math.random(1,4)
	if self.pointID == 1 then
		self.nightConfuseTargetPos = DummyPointData.Pos01Pos[self.dataIndex]
	elseif self.pointID == 2 then
		self.nightConfuseTargetPos = DummyPointData.Pos02Pos[self.dataIndex]
	elseif self.pointID == 3 then
		self.nightConfuseTargetPos = DummyPointData.Pos03Pos[self.dataIndex]
	elseif self.pointID == 4 then
		self.nightConfuseTargetPos = DummyPointData.Pos04Pos[self.dataIndex]
	end
end

function MengdeNightConfuse:NextMove()
	self:CallDelay(math.random(3,10), self.RandomStand)
end

function MengdeNightConfuse:OnEvent(evt)
	DailyNpcCommon.OnEvent(evt,self)
end

return MengdeNightConfuse