--baseClass提供基础接口
local baseClass = require('UAuto/TestCases/Online/OnlineBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("OnlineBarbaraSkill",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "OnlineBarbaraSkill"
self.Category = "联机"
self.Description="联机芭芭拉技能"

self.SetUpHost = {
	Order = 0.1,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="初始化主机位置",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		yield_return(self:ChangeAvatar("Barbara"))
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
		yield_return(self:ChangeAvatar("Barbara"))
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
		local attackCount = 5
		while attackCount > 0 do
			yield_return(CS.UnityEngine.WaitForSeconds(0.2))
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
	Description="客机验证主机普攻所产生的特效，动作",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}

self.HostDoSkill1 = {
	Order = 3,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="主机放技能1（水环）",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StartSyncRecord())
		yield_return(self.base:Skill(1))
		yield_return(CS.UnityEngine.WaitForSeconds(10))--等待水环完成
		yield_return(self.base:StopSyncRecord())
	end)
}

self.ClientCheckSkill1 = {
	Order = 3.5,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="客机验证主机水环所产生的特效、动作、状态",
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

return self