local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("PumpkinBomb01",baseClass)
local self = UAutoLuaTestCase
UAutoLuaTestCase.TestFixture = "PumpkinBomb01"
UAutoLuaTestCase.Category = "交互机关"
self.Description="爆炸南瓜"
local PumpPosition = CS.UnityEngine.Vector3(2745.824, 194.5971, -1718.185)
local AttackPosition = CS.UnityEngine.Vector3(2740.824, 194.5971, -1718.185)
self.Order=707
UAutoLuaTestCase.SetUp = {
	Order = 0.1,
	Type = CaseType.MonoTest,
	Description="初始化",
	Action = UAutoCoroutine(function()
		yield_return(self.base:SetUpVariables())
	end)
}

UAutoLuaTestCase.FindPumpkinBomb01 = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description="在2745.824, 194.5971, -1718.185创建爆炸南瓜",
	Action = UAutoCoroutine(function()
		yield_return(self.base:TelePort(PumpPosition))
		yield_return(self.base:RunGM("GADGET 70220004 1"))
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		yield_return(self.base:RunGM("WUDI ON"))
	end)
}


UAutoLuaTestCase.FireOnPumpkinBomb01 = {
	Order = 2,
	Type = CaseType.MonoTest,
	Description="使用安柏充能技打击南瓜",
	Action = UAutoCoroutine(function()
		yield_return(self:ChangeAvatar("Anbo"))
		
		self.oldCount = self.base:GetEntityCount("PumpkinBomb01")
		print(self.oldCount)
		yield_return(self.base:MoveToPosition(AttackPosition))
		yield_return(self.base:RotateCamera(PumpPosition))
		yield_return(self.base:Skill(4))
		yield_return(self.base:RunGM("ENERGY INFINITE OFF"))
	end)
}


UAutoLuaTestCase.WaitPumpkinBombFinish = {
	Order = 3,
	Type = CaseType.MonoTest,
	Description="等待爆炸并检查南瓜消失",
	Action = UAutoCoroutine(function()
		yield_return(CS.UnityEngine.WaitForSeconds(10))
		self.newCount = self.base:GetEntityCount("PumpkinBomb01")
		print(self.newCount-self.oldCount)
		assert(self.oldCount - self.newCount >= 1, "PumpkinBomb01 not disappear")
		yield_return(self.base:RunGM("WUDI OFF"))
	end)
}


return self
