require('Actor/ActorCommon')
local BaseDailyNpc = require('Actor/Npc/BaseDailyNpc')
local MengdeInsomniaStand = class("MengdeInsomniaStand", BaseDailyNpc)
local DailyNpcCommon = require('Actor/Npc/NpcDailyCommon')
local NpcEventType = require('Actor/Npc/NPCEventType')
MengdeInsomniaStand.defaultAlias = "MengdeInsomniaStand"

local Config = require('Actor/Npc/Config/CfgMengdeInsomniaStand')
local DummyPointData = Config.DummyPointData

BubbleCtrl_NpcMengdeInsomniaStand = DummyPointData.BubbleCtrl

function MengdeInsomniaStand:PreGetAlias()
	local NpcAlias = DummyPointData.Npc .. '_' .. tostring(self.dataIndex)
	return NpcAlias
end

function MengdeInsomniaStand:Register()
	DailyNpcCommon.Register(self)
end

function MengdeInsomniaStand:InvokeOnResetFreeStyle(freeStyleType)
	DailyNpcCommon.InvokeOnResetFreeStyle(self,freeStyleType)	
end

function MengdeInsomniaStand:OnCollisionEnter(targetInfo)
	DailyNpcCommon.OnCollisionEnter(targetInfo,self)	
end

function MengdeInsomniaStand:WalkBack()
	print("walkback")
	self:WalkToTask(DummyPointData.BornPos[self.dataIndex],self.Recover)
	--self:StartDay()
end

function MengdeInsomniaStand:RecoverFromFreeStyle()
	print("RecoverFromFreeStyle")
	self:Recover()
end

function MengdeInsomniaStand:RecoverFromCollisionEnter()
	print("RecoverFromCollisionEnter")	
	--self:ClearAllTask()
	self:Recover()
	--self:CallDelay(0.5,self.WalkBack)
end

function MengdeInsomniaStand:Recover()
	self.OnAction=0
	self:Standby()
	self:SteerToTask(M.Euler2DirXZ(DummyPointData.BornDir[self.dataIndex]),1,true,true)
	--self:TurnTo(M.Euler2DirXZ(DummyPointData.BornDir[self.dataIndex]))
	self:DoFreeStateTrigger()
end

function MengdeInsomniaStand:StartDay()
	self:Standby()
	self:TurnTo(M.Euler2DirXZ(DummyPointData.BornDir[self.dataIndex]))
	self:DoFreeStateTrigger()
	self:ShowSelf()
	self:PerformDither(true, 2)
	self:StartBubble()
end

function MengdeInsomniaStand:StartBubble()
	--print("start bubble")
	if self.bubble~=1 then
		--print("bubble!=1")
		self:ShowBubble()
		self.bubble=1
	end
end


function MengdeInsomniaStand:ShowBubble()
	if DummyPointData.DialogID[self.dataIndex] ~= 0 then
		if BubbleCtrl_NpcMengdeInsomniaStand[self.dataIndex] ~= -1 then
			self:TriggerNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex], DummyPointData.DialogID[self.dataIndex])
		end
		self:BubbleTime()
	end
end

function MengdeInsomniaStand:BubbleTime()
	self:CallDelay(5, self.CloseBubble)
end

function MengdeInsomniaStand:CloseBubble()
	self:ClearNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex])
	self:BubbleGap()
end

function MengdeInsomniaStand:BubbleGap()
	self:CallDelay(math.random(7,8), self.ShowBubble)
end

function MengdeInsomniaStand:StartNight()
	self:StartDay()
end

function MengdeInsomniaStand:OnEvent(evt)
	DailyNpcCommon.OnEvent(evt,self)
end

return MengdeInsomniaStand