require('Actor/ActorCommon')
local BaseDailyNpc = require('Actor/Npc/BaseDailyNpc')
local MengdeNightSit = class("MengdeNightSit", BaseDailyNpc)
local DailyNpcCommon = require('Actor/Npc/NpcDailyCommon')
local NpcEventType = require('Actor/Npc/NPCEventType')
MengdeNightSit.defaultAlias = "MengdeNightSit"

local Config = require('Actor/Npc/Config/CfgMengdeNightSit')
local DummyPointData = Config.DummyPointData

function MengdeNightSit:PreGetAlias()
	local NpcAlias = DummyPointData.Npc .. '_' .. tostring(self.dataIndex)
	return NpcAlias
end

function MengdeNightSit:Register()
	DailyNpcCommon.Register(self)
end

function MengdeNightSit:StartNight()
	self:SitOnChair()
	self:CallDelay(4, self.AfterSit)
end

function MengdeNightSit:AfterSit()
	self:DoFreeStateTrigger()
	self:ShowSelf()
	self:PerformDither(true, 2)
	self:StartBubble()
end

function MengdeNightSit:StartBubble()
	if self.bubble~=1 then
		self:ShowBubble()
		self.bubble=1
	end
end

function MengdeNightSit:ShowBubble()
	if DummyPointData.DialogID[self.dataIndex] ~= 0 then
		self:TriggerNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex], DummyPointData.DialogID[self.dataIndex])
		self:BubbleTime()
	end
end

function MengdeNightSit:BubbleTime()
	self:CallDelay(5, self.CloseBubble)
end

function MengdeNightSit:CloseBubble()
	self:ClearNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex])
	self:BubbleGap()
end

function MengdeNightSit:BubbleGap()
	self:CallDelay(math.random(7,8), self.ShowBubble)
end

function MengdeNightSit:StartDay()
	self:ClearNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex])
	self:PerformDither(false, 2, self.HideSelf)
end

function MengdeNightSit:OnEvent(evt)
	DailyNpcCommon.OnEvent(evt,self)
end

return MengdeNightSit