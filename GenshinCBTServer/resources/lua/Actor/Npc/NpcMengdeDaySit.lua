require('Actor/ActorCommon')
local BaseDailyNpc = require('Actor/Npc/BaseDailyNpc')
local MengdeDaySit = class("MengdeDaySit", BaseDailyNpc)
local DailyNpcCommon = require('Actor/Npc/NpcDailyCommon')
local NpcEventType = require('Actor/Npc/NPCEventType')
MengdeDaySit.defaultAlias = "MengdeDaySit"

local Config = require('Actor/Npc/Config/CfgMengdeDaySit')
local DummyPointData = Config.DummyPointData

function MengdeDaySit:PreGetAlias()
	local NpcAlias = DummyPointData.Npc .. '_' .. tostring(self.dataIndex)
	return NpcAlias
end

function MengdeDaySit:Register()
	DailyNpcCommon.Register(self)
end

function MengdeDaySit:StartDay()
	self:SitOnChair()
	self:CallDelay(4, self.AfterSit)
end

function MengdeDaySit:AfterSit()
	self:DoFreeStateTrigger()
	self:ShowSelf()
	self:PerformDither(true, 2)
	self:StartBubble()
end

function MengdeDaySit:StartBubble()
	if self.bubble~=1 then
		self:ShowBubble()
		self.bubble=1
	end
end

function MengdeDaySit:ShowBubble()
	if DummyPointData.DialogID[self.dataIndex] ~= 0 then
		self:TriggerNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex], DummyPointData.DialogID[self.dataIndex])
		self:BubbleTime()
	end
end

function MengdeDaySit:BubbleTime()
	self:CallDelay(5, self.CloseBubble)
end

function MengdeDaySit:CloseBubble()
	self:ClearNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex])
	self:BubbleGap()
end

function MengdeDaySit:BubbleGap()
	self:CallDelay(math.random(7,8), self.ShowBubble)
end

function MengdeDaySit:StartNight()
	self:ClearNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex])
	self:PerformDither(false, 2, self.HideSelf)
end

function MengdeDaySit:OnEvent(evt)
	DailyNpcCommon.OnEvent(evt,self)
end

return MengdeDaySit