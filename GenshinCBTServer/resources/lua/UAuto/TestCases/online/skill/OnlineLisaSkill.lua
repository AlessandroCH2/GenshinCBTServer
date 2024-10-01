--baseClass提供基础接口
local baseClass = require('UAuto/TestCases/Online/OnlineBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("OnlineLisaSkill",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "OnlineLisaSkill"
self.Category = "联机"
self.Description="联机丽莎技能"


self.SetUpHost = {
	Order = 0.1,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="初始化主机位置",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		yield_return(self:ChangeAvatar("Lisa"))
		yield_return(self.base:MoveToPosition(self.hostStartPosVec))

	end)
}


self.SetUpClient = {
	Order = 0.2,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="初始化客机位置",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		yield_return(self:ChangeAvatar("Lisa"))
		yield_return(self.base:MoveToPosition(self.clientPointVec))
	end)
}




self.HostDoSkill0 = {
	Order = 1,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="主机放普攻",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StartSyncRecord())
		local attackCount = 3
		while attackCount > 0 do
			yield_return(CS.UnityEngine.WaitForSeconds(0.15))
			yield_return(self.base:Skill(0))
			attackCount = attackCount - 1
		end
		yield_return(self.base:StopSyncRecord())
	end)
}

self.ClientCheckSkill0 = {
	Order = 2,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="客机验证主机普攻所产生的位移、特效、动作、状态",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}

self.HostDoSkill1 = {
	Order = 3,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="主机放技能1（闪电球）",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StartSyncRecord())
		yield_return(self.base:Skill(1))
		yield_return(CS.UnityEngine.WaitForSeconds(10))
		yield_return(self.base:StopSyncRecord())
	end)
}

self.ClientCheckSkill1 = {
	Order = 3.5,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="客机验证主机闪电球所产生的位移、特效、动作、状态",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}

self.HostDoSkill2 = {
	Order = 4,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="主机放技能2（雷电蓄力）",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StartSyncRecord())
		yield_return(self.base:Skill(1,false))
		yield_return(CS.UnityEngine.WaitForSeconds(5))
		yield_return(self.base:Skill(1,true))
		yield_return(self.base:StopSyncRecord())
	end)
}



self.ClientCheckSkill2 = {
	Order = 4.5,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="客机验证主机雷电蓄力所产生的位移、特效、动作、状态",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}


self.HostDoSkill4 = {
	Order = 5,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="主机放技能3（充能技）",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StartSyncRecord())
		yield_return(self.base:Skill(4))
		yield_return(self.base:StopSyncRecord())
	end)
}

self.ClientCheckSkill4 = {
	Order = 5.5,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="客机验证主机充能技所产生的位移、特效、动作、状态",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}

--client do host check

self.SetUpClient2 = {
	Order = 10.1,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="初始化客机位置",
	Action = UAutoCoroutine(function()
		yield_return(self.base:MoveToPosition(self.clientPointVec))

	end)
}
	

self.SetUpHost2 = {
	Order = 10.2,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="初始化主机位置",
	Action = UAutoCoroutine(function()
		yield_return(self.base:MoveToPosition(self.hostStartPosVec))
		yield_return(self.base:StartSyncRecord())
	end)
}

self.ClientDoSkill0 = {
	Order = 11,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="客机放普攻",
	Action = UAutoCoroutine(function()
		local attackCount = 3
		while attackCount > 0 do
			yield_return(CS.UnityEngine.WaitForSeconds(0.15))
			yield_return(self.base:Skill(0))
			attackCount = attackCount - 1
		end
	end)
}

self.HostCheckSkill0 = {
	Order = 12,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="主机验证客机普攻所产生的位移、特效、动作、状态",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StopSyncRecord())
		self.base:CheckRemote()
		yield_return(self.base:StartSyncRecord())
	end)
}

self.ClientDoSkill1 = {
	Order = 13,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="客机放技能1（闪电球）",
	Action = UAutoCoroutine(function()
		yield_return(self.base:Skill(1))
		yield_return(CS.UnityEngine.WaitForSeconds(10))
	end)
}

self.HostCheckSkill1 = {
	Order = 13.5,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="主机验证客机冰刺所产生的位移、特效、动作、状态",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StopSyncRecord())
		self.base:CheckRemote()
		yield_return(self.base:StartSyncRecord())
	end)
}

self.ClientDoSkill2 = {
	Order = 14,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="客机放技能2（蓄力电击）",
	Action = UAutoCoroutine(function()
		yield_return(self.base:Skill(1,false))
		yield_return(CS.UnityEngine.WaitForSeconds(5))
		yield_return(self.base:Skill(1,true))
	end)
}



self.HostCheckSkill2 = {
	Order = 14.5,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="主机验证客机蓄力点击所产生的位移、特效、动作、状态",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StopSyncRecord())
		self.base:CheckRemote()
		yield_return(self.base:StartSyncRecord())
	end)
}


self.ClientDoSkill4 = {
	Order = 15,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="客机放技能3（充能技）",
	Action = UAutoCoroutine(function()
		yield_return(self.base:Skill(4))
	end)
}

self.HostCheckSkill4 = {
	Order = 15.5,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="主机验证客机充能技所产生的位移、特效、动作、状态",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StopSyncRecord())
		self.base:CheckRemote()
	end)
}




return self