--baseClass提供基础接口
local baseClass = require('UAuto/TestCases/Online/OnlineBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("OnlineAmborSkill",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "OnlineAmborSkill"
self.Category = "联机"
self.Description="联机安柏技能"





self.SetUpHost = {
	Order = 0.1,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="初始化主机位置",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		yield_return(self:ChangeAvatar("Anbo"))
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
		yield_return(self:ChangeAvatar("Anbo"))
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
			yield_return(CS.UnityEngine.WaitForSeconds(0.3))
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
	Description="客机验证主机普攻所产生的箭，动作",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}

self.HostDoSkill1 = {
	Order = 3,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="主机放技能1（娃娃）",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StartSyncRecord())
		yield_return(self.base:Skill(1,false))
		yield_return(CS.UnityEngine.WaitForSeconds(2))
		yield_return(self.base:SkillUp(1))
		yield_return(CS.UnityEngine.WaitForSeconds(5))
		yield_return(self.base:StopSyncRecord())
	end)
}

self.ClientCheckSkill1 = {
	Order = 3.5,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="客机验证主机娃娃所产生的特效、动作、状态",
	Action = UAutoCoroutine(function()
		self.base:CheckRemote()
	end)
}

self.HostDoSkill2 = {
	Order = 4,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="主机放技能2（瞄准射击）",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StartSyncRecord())
		yield_return(self.base:Skill(0,false))
		yield_return(CS.UnityEngine.WaitForSeconds(2))
		yield_return(self.base:MoveByAngle(180))
		yield_return(CS.UnityEngine.WaitForSeconds(3))
		yield_return(self.base:MoveByAngle(180,true))
		self.remote = self:GetRemoteAvatar()
		yield_return(self.base:RotateCamera(self.remote.transform.position))
		yield_return(self.base:SkillUp(0,true))

		yield_return(self.base:StopSyncRecord())
	end)
}



self.ClientCheckSkill2 = {
	Order = 4.5,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="客机验证主机瞄准射击所产生的位移、特效、动作、状态",
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