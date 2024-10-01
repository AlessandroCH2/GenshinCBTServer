-- baseClass提供基础接口
local baseClass = require('UAuto/TestCases/Online/OnlineBase')
-- 所有testcase继承baseClass
local UAutoLuaTestCase = class("HiliNone01Range",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "HiliNone01Range"
self.Category = "联机"
self.Description = "联机-空手丘丘人-远程"

self.MonsterId = 21010401
self.MonsterKeyWord = "Hili_None_01"
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
		yield_return(self:ChangeAvatar("Ayaka"))
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
		self.base:CreateMonster(self.MonsterId)
		yield_return(self.base:RunGM("AUTHORITY REFRESH"))
		self.base:MonsterAI(true)
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		self.base:MonsterAI(false)
		yield_return(self:WaitFoundEntity(self.MonsterKeyWord))
		yield_return(self.base:StartSyncRecord(self.foundEntity.runtimeID,true))
		yield_return(self.base:StartSyncRecord())
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
self.HostMonsterMove = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description = "主机怪移动至客机角色",
	Action = UAutoCoroutine(function()
		self.remoteAvater = self:GetRemoteAvatar()
		self.localAvatar = self:GetLocalAvatar()
		yield_return(self.base:MonsterMove(self.foundEntity,self.remoteAvater.transform.position))
		yield_return(self.base:MonsterMove(self.foundEntity,self.localAvatar.transform.position))
		yield_return(self.base:StopSyncRecord())
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.ClientCheckMonsterMove = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description = "客机验证怪移动",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.HostSkill1 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description = "主机怪放技能1",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StartSyncRecord(self.foundEntity.runtimeID,true))
		yield_return(self.base:StartSyncRecord())
		self.base:MonsterDoSkill(self.foundEntity,1)
		yield_return(self.base:StopSyncRecord())
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.ClientCheckSkill1 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description = "客机验证技能1一致性",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.HostSkill2 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description = "主机怪放技能2",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StartSyncRecord(self.foundEntity.runtimeID,true))
		yield_return(self.base:StartSyncRecord())
		self.base:MonsterDoSkill(self.foundEntity,2)
		yield_return(self.base:StopSyncRecord())
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.ClientCheckSkill2 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description = "客机验证技能2一致性",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.HostSkill3 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description = "主机怪放技能3",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StartSyncRecord(self.foundEntity.runtimeID,true))
		yield_return(self.base:StartSyncRecord())
		self.base:MonsterDoSkill(self.foundEntity,3)
		yield_return(self.base:StopSyncRecord())
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.ClientCheckSkill3 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description = "客机验证技能3一致性",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.HostSkill4 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description = "主机怪放技能4",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StartSyncRecord(self.foundEntity.runtimeID,true))
		yield_return(self.base:StartSyncRecord())
		self.base:MonsterDoSkill(self.foundEntity,4)
		yield_return(self.base:StopSyncRecord())
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.ClientCheckSkill4 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description = "客机验证技能4一致性",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.HostSkill5 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description = "主机怪放技能5",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StartSyncRecord(self.foundEntity.runtimeID,true))
		yield_return(self.base:StartSyncRecord())
		self.base:MonsterDoSkill(self.foundEntity,5)
		yield_return(self.base:StopSyncRecord())
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.ClientCheckSkill5 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description = "客机验证技能5一致性",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.HostSkill7 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description = "主机怪放技能7",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StartSyncRecord(self.foundEntity.runtimeID,true))
		yield_return(self.base:StartSyncRecord())
		self.base:MonsterDoSkill(self.foundEntity,7)
		yield_return(self.base:StopSyncRecord())
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.ClientCheckSkill7 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description = "客机验证技能7一致性",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.HostSkill8 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description = "主机怪放技能8",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StartSyncRecord(self.foundEntity.runtimeID,true))
		yield_return(self.base:StartSyncRecord())
		self.base:MonsterDoSkill(self.foundEntity,8)
		yield_return(self.base:StopSyncRecord())
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.ClientCheckSkill8 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description = "客机验证技能8一致性",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}


self.OrderIndex = self.OrderIndex + 1;
self.HostAttackMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description = "主机攻击怪",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StartSyncRecord(self.foundEntity.runtimeID,true))
		yield_return(self.base:StartSyncRecord())
		yield_return(self.base:RunGM("WUDI MONSTER ON"))
		yield_return(self.base:MoveToEntity(self.foundEntity,self.FindTimeOut,self.FatRange))
		yield_return(self.base:Skill(0))
		yield_return(self.base:StopSyncRecord())
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.ClientCheckAttackMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description = "客机验证攻击怪一致性",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.HostKillMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description = "主机杀死怪",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StartSyncRecord(self.foundEntity.runtimeID,true))
		yield_return(self.base:StartSyncRecord())
		yield_return(self.base:RunGM("kill monster "..tostring(self.MonsterId)))
		yield_return(self.base:StopSyncRecord())
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.ClientCheckKillMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description = "客机验证杀死怪一致性",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}


return self