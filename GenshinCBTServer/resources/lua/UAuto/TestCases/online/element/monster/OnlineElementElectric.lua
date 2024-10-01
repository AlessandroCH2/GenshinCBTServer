-- baseClass提供基础接口
local baseClass = require('UAuto/TestCases/Online/OnlineBase')
-- 所有testcase继承baseClass
local UAutoLuaTestCase = class("OnlineElementElectric",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "OnlineElementElectric"
self.Category = "联机"
self.Description = "联机-怪物元素-电"

self.MonsterId = 20010601
self.MonsterKeyWord = "Slime_Electric_03"
-- c#中写了120，这边先写着不改
self.FindTimeOut = 120
-- 胖怪先填3，瘦怪填1
self.FatRange = 3

self.localHostStartPos = self.hostStartPos
self.localClientPointStr = self.clientPointStr
self.localHostStartPosVec = self.hostStartPosVec 
self.localClientPointVec = self.clientPointVec


self.OrderIndex = 1
self.SetUpHost = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description = "初始化主机角色位置",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.localHostStartPos,true,true))
		yield_return(self.base:RunGM("WUDI ON"))
		yield_return(self:ChangeAvatar("Anbo"))
		yield_return(self.base:MoveToPosition(self.localHostStartPosVec))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		self.base:MonsterAI(false)
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.SetUpClient = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description = "初始化客机角色位置",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.localClientPointStr,true,true))
		yield_return(self.base:RunGM("WUDI ON"))
		yield_return(self:ChangeAvatar("Barbara"))
		yield_return(self.base:MoveToPosition(self.localClientPointVec))
		self.base:MonsterAI(false)
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.HostCreateMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description = "主机招怪",
	Action = UAutoCoroutine(function()
		--self.base:CreateMonster(self.MonsterId)
		yield_return(self.base:RunGM("MONSTER "..self.MonsterId.." 1 1"))
		yield_return(self:WaitFoundEntity(self.MonsterKeyWord))
		yield_return(self.base:StartSyncRecord(self.foundEntity.runtimeID,true))
		yield_return(self.base:StartSyncRecord())
		yield_return(self.base:StartSyncRecord(0,true))
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.ClientFindMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description = "客机验证怪创建",
	Action = UAutoCoroutine(function()
		yield_return(self:WaitFoundEntity(self.MonsterKeyWord))
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.HostFireAttackMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description = "主机火攻怪",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("AUTHORITY REFRESH"))
		yield_return(self.base:RunGM("WUDI MONSTER ON"))
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		yield_return(self.base:MoveToEntity(self.foundEntity,self.FindTimeOut,self.FatRange))
		yield_return(self.base:Skill(4))
		yield_return(self.base:StopSyncRecord())
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.ClientCheckFireAttack = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description = "客机验证火攻怪一致性",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}


return self