-- baseClass提供基础接口
local baseClass = require('UAuto/TestCases/Online/OnlineBase')
-- 所有testcase继承baseClass
local UAutoLuaTestCase = class("OnlineElementGrass",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "OnlineElementGrass"
self.Category = "联机"
self.Description = "联机-怪物元素-草"

self.MonsterId = 20010101
self.MonsterKeyWord = "Slime_Grass_02"
-- c#中写了120，这边先写着不改
self.FindTimeOut = 120
-- 胖怪先填3，瘦怪填1
self.FatRange = 1


self.OrderIndex = 1
self.SetUpHost = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description = "初始化主机角色位置",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.hostStartPos,true,true))
		yield_return(self.base:RunGM("WUDI ON"))
		yield_return(self:ChangeAvatar("Anbo"))
		yield_return(self.base:MoveToPosition(self.hostStartPosVec))
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
		yield_return(self.base:RunGM("goto "..self.clientPointStr,true,true))
		yield_return(self.base:RunGM("WUDI ON"))
		yield_return(self:ChangeAvatar("Barbara"))
		yield_return(self.base:MoveToPosition(self.clientPointVec))
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
		-- 等待草史莱姆头上的草烧掉
		yield_return(CS.UnityEngine.WaitForSeconds(10))
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