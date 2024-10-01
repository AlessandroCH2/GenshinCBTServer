require('Actor/ActorCommon')
local BaseDailyNpc = require('Actor/Npc/BaseDailyNpc')
local MengdeInsomniaPatrol = class("MengdeInsomniaPatrol", BaseDailyNpc)
local DailyNpcCommon = require('Actor/Npc/NpcDailyCommon')
local NpcEventType = require('Actor/Npc/NPCEventType')
MengdeInsomniaPatrol.defaultAlias = "MengdeInsomniaPatrol"
MengdeInsomniaPatrol.pointID = 1

local Config = require('Actor/Npc/Config/CfgMengdeInsomniaPatrol')
local DummyPointData = Config.DummyPointData

function MengdeInsomniaPatrol:PreGetAlias()
	local NpcAlias = DummyPointData.Npc .. '_' .. tostring(self.dataIndex)
	return NpcAlias
end

function MengdeInsomniaPatrol:Register()
	DailyNpcCommon.Register(self)
end

function MengdeInsomniaPatrol:RecoverFromFreeStyle()
	print("RecoverFromFreeStyle")
	self:Recover()
end

function MengdeInsomniaPatrol:RecoverFromCollisionEnter()
	print("RecoverFromCollisionEnter")
	self:Recover()
end

function MengdeInsomniaPatrol:Recover()
	self.OnAction=0
	self:GoPatrol1()
end

function MengdeInsomniaPatrol:InvokeOnResetFreeStyle(freeStyleType)
	DailyNpcCommon.InvokeOnResetFreeStyle(self,freeStyleType)	
end

function MengdeInsomniaPatrol:OnCollisionEnter(targetInfo)
	DailyNpcCommon.OnCollisionEnter(targetInfo,self)	
end



function MengdeInsomniaPatrol:DataInit()
	self.Data=DummyPointData.PosData[self.dataIndex]
	self.Count=#DummyPointData.PosData[self.dataIndex]
	self.Time=DummyPointData.TimeData[self.dataIndex]
	self.Dir=DummyPointData.DirData[self.dataIndex]
	self.pointID=math.random(1,self.Count)	
end

function MengdeInsomniaPatrol:StartBubble()
	if self.bubble~=1 then
		self:ShowBubble()
		self.bubble=1
	end
end

function MengdeInsomniaPatrol:StartDay()	
	print("start day"..tostring(self.dataIndex))
	self:ShowSelf()
	self:PerformDither(true, 2)
	--self:GoPatrol()
	--self:CallDelay(2,self.GoPatrol1)
	self:GoPatrol1()
	self:StartBubble()	
end

function MengdeInsomniaPatrol:Start()
	print("start!!!!!!!!!!!!!!!!!!!!!"..tostring(self.dataIndex))
	self:DataInit()	
	self:SetPos(self.Data[self.pointID],true)
	--self:CallDelay(5,self.StartDaily)
	self:StartDaily()
end

function MengdeInsomniaPatrol:ShowBubble()
	if DummyPointData.DialogID[self.dataIndex] ~= 0 then
		self:TriggerNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex], DummyPointData.DialogID[self.dataIndex])
		self:BubbleTime()
	end
end

function MengdeInsomniaPatrol:BubbleTime()
	self:CallDelay(5, self.CloseBubble)
end

function MengdeInsomniaPatrol:CloseBubble()
	self:ClearNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex])
	self:BubbleGap()
end

function MengdeInsomniaPatrol:BubbleGap()
	self:CallDelay(math.random(7,8), self.ShowBubble)
end

function MengdeInsomniaPatrol:GoPatrol1()
	if self.pointID == self.Count+1 then
		self.pointID = 1
	end
	--self:CallDelay(math.random(10,20), self.GoPatrolRoute1)
	self:GoPatrolRoute1()
end

function MengdeInsomniaPatrol:GoPatrolRoute1()
	print("npc"..tostring(self.dataIndex).."walkto"..tostring(self.pointID))
	self:WalkToTask(self.Data[self.pointID], self.SelfPointUpdate1, self.Standby)
	
end

function MengdeInsomniaPatrol:SelfPointUpdate1()
	local time=self.Time[self.pointID]
	local dir=self.Dir[self.pointID]
	self.pointID = self.pointID + 1
	if time==0 then
		self:GoPatrol1()
	else
		self:Standby()
		--self:TurnTo(M.Euler2DirXZ(dir))
		self:SteerToTask(M.Euler2DirXZ(dir),1,true,true)
		self:CallDelay(time, self.GoPatrol1)
	end
end

function MengdeInsomniaPatrol:GoPatrol()
	if self.pointID == 7 then
		self.pointID = 1
	end
	self:GoPatrolRoute()
end

function MengdeInsomniaPatrol:GoPatrolRoute()
	if self.pointID == 1 then
		self:WalkToTask(DummyPointData.Pos01Pos[self.dataIndex], self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 2 then
		self:WalkToTask(DummyPointData.Pos02Pos[self.dataIndex], self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 3 then
		self:WalkToTask(DummyPointData.Pos03Pos[self.dataIndex], self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 4 then
		self:WalkToTask(DummyPointData.Pos04Pos[self.dataIndex], self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 5 then
		self:WalkToTask(DummyPointData.Pos05Pos[self.dataIndex], self.SelfPointUpdate, self.Standby)
	elseif self.pointID == 6 then
		self:WalkToTask(DummyPointData.Pos06Pos[self.dataIndex], self.SelfPointUpdate, self.Standby)
	end
end

function MengdeInsomniaPatrol:SelfPointUpdate()
	self.pointID = self.pointID + 1
	self:GoPatrol()
end

function MengdeInsomniaPatrol:StartNight()
	self:StartDay()
end

function MengdeInsomniaPatrol:OnEvent(evt)
	DailyNpcCommon.OnEvent(evt,self)
end

return MengdeInsomniaPatrol