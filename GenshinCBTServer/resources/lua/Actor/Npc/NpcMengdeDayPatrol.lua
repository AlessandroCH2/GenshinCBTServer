require('Actor/ActorCommon')
local BaseDailyNpc = require('Actor/Npc/BaseDailyNpc')
local MengdeDayPatrol = class("MengdeDayPatrol", BaseDailyNpc)
local DailyNpcCommon = require('Actor/Npc/NpcDailyCommon')
local NpcEventType = require('Actor/Npc/NPCEventType')
MengdeDayPatrol.defaultAlias = "MengdeDayPatrol"
MengdeDayPatrol.pointID = 1




local Config = require('Actor/Npc/Config/CfgMengdeDayPatrol')
local DummyPointData = Config.DummyPointData



function MengdeDayPatrol:PreGetAlias()
	local NpcAlias = DummyPointData.Npc .. '_' .. tostring(self.dataIndex)
	return NpcAlias
end

function MengdeDayPatrol:Register()
	DailyNpcCommon.Register(self)
end

function MengdeDayPatrol:RecoverFromFreeStyle()
	print("RecoverFromFreeStyle")
	self:Recover()
end

function MengdeDayPatrol:RecoverFromCollisionEnter()
	print("RecoverFromCollisionEnter")	
	self:Recover()
end

function MengdeDayPatrol:Recover()
	self.OnAction=0
	self:GoPatrol1()
end

function MengdeDayPatrol:InvokeOnResetFreeStyle(freeStyleType)
	DailyNpcCommon.InvokeOnResetFreeStyle(self,freeStyleType)	
end

function MengdeDayPatrol:OnCollisionEnter(targetInfo)
	DailyNpcCommon.OnCollisionEnter(targetInfo,self)	
end

function MengdeDayPatrol:DataInit()
		self.Data=DummyPointData.PosData[self.dataIndex]
		self.Count=#DummyPointData.PosData[self.dataIndex]
		self.Time=DummyPointData.TimeData[self.dataIndex]
		self.Dir=DummyPointData.DirData[self.dataIndex]
		self.pointID=math.random(1,self.Count)	
end

function MengdeDayPatrol:StartDay()
	--print("start day"..tostring(self.dataIndex))
	self:ShowSelf()
	self:PerformDither(true, 2)
	--self:GoPatrol()
	--self:CallDelay(2,self.GoPatrol1)
	self:GoPatrol1()
	self:StartBubble()	
end

function MengdeDayPatrol:Start()
	--print("start!!!!!!!!!!!!!!!!!!!!!"..tostring(self.dataIndex))
	self:DataInit()	
	self:SetPos(self.Data[self.pointID],true)
	--self:CallDelay(5,self.StartDaily)
	self:StartDaily()
end

function MengdeDayPatrol:StartBubble()
	if self.bubble~=1 then
		self:ShowBubble()
		self.bubble=1
	end
end

function MengdeDayPatrol:ShowBubble()
	if DummyPointData.DialogID[self.dataIndex] ~= 0 then
		self:TriggerNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex], DummyPointData.DialogID[self.dataIndex])
		self:BubbleTime()
	end
end

function MengdeDayPatrol:BubbleTime()
	self:CallDelay(5, self.CloseBubble)
end

function MengdeDayPatrol:CloseBubble()
	self:ClearNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex])
	self:BubbleGap()
end

function MengdeDayPatrol:BubbleGap()
	self:CallDelay(math.random(7,8), self.ShowBubble)
end

function MengdeDayPatrol:GoPatrol1()
	if self.pointID == self.Count+1 then
		self.pointID = 1
	end
	--self:CallDelay(math.random(10,20), self.GoPatrolRoute1)
	self:GoPatrolRoute1()
end

function MengdeDayPatrol:GoPatrolRoute1()
	--print("npc"..tostring(self.dataIndex).."walkto"..tostring(self.pointID))
	self:WalkToTask(self.Data[self.pointID], self.SelfPointUpdate1, self.Standby)
	
end

function MengdeDayPatrol:SelfPointUpdate1()
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


function MengdeDayPatrol:GoPatrol()
	if self.pointID == 7 then
		self.pointID = 1
	end
	self:GoPatrolRoute()
end

function MengdeDayPatrol:GoPatrolRoute()
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

function MengdeDayPatrol:SelfPointUpdate()
	self.pointID = self.pointID + 1
	self:GoPatrol()
end

function MengdeDayPatrol:StartNight()
	self:Standby()
	self:ClearNpcSpeechBubble(DummyPointData.NpcID[self.dataIndex])
	self:PerformDither(false, 2, self.HideSelf)
end

function MengdeDayPatrol:OnEvent(evt)
	DailyNpcCommon.OnEvent(evt,self)
end

return MengdeDayPatrol