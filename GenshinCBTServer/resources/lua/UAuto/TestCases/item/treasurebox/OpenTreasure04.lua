local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("OpenTreasure04",baseClass)
local self = UAutoLuaTestCase
UAutoLuaTestCase.TestFixture = "OpenTreasure04"
UAutoLuaTestCase.Category = "交互机关"
self.Description = "打开蔓藤宝箱"
self.Order=703

local AttackPosition = CS.UnityEngine.Vector3(2652.6,252,-1674.5)
local MovePosition = AttackPosition

UAutoLuaTestCase.SetUp = {
	Order = 0.1,
	Description = "初始化",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self.base:SetUpVariables())
	end)
}

UAutoLuaTestCase.FindTreasure04 = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description = "找到蔓藤宝箱",
	Action = UAutoCoroutine(function()
		yield_return(self.base:TelePort(MovePosition))
		yield_return(self.base:WaitFoundNearByEntityByName("Treasurebox04",function(result) self.Treasurebox = result end))
		yield_return(self.base:MoveToPosition(self.Treasurebox.transform.position,60,2))
	end)
}


UAutoLuaTestCase.OpenTreasure04Failed = {
	Order = 4,
	Type = CaseType.MonoTest,
	Description="不去掉蔓藤，开启宝箱失败",
	Action = UAutoCoroutine(function ()
		yield_return(self:WaitTalk(0))
	end)
}

UAutoLuaTestCase.AttackTreasure04 = {
	Order = 5,
	Type = CaseType.MonoTest,
	Description="换成安柏，用充能技攻击宝箱",
	Action = UAutoCoroutine(function ()
		yield_return(self.base:MoveToPosition(MovePosition))
		yield_return(self:ChangeAvatar("Anbo"))

		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		yield_return(self.base:RunGM("WUDI ON"))
		yield_return(self.base:RotateCamera(self.Treasurebox.transform.position))
		yield_return(self.base:Skill(4))
		yield_return(self.base:RunGM("ENERGY INFINITE OFF"))
	end)
}



UAutoLuaTestCase.OpenTreasure04Success = {
	Order = 5.1,
	Type = CaseType.MonoTest,
	Description="蔓藤烧毁，开启宝箱",
	Action = UAutoCoroutine(function ()
		yield_return(self.base:MoveToPosition(self.Treasurebox.transform.position,60,2))
		yield_return(CS.UnityEngine.WaitForSeconds(5))
		yield_return(self.base:MoveToPosition(self.Treasurebox.transform.position,60,2))
		yield_return(self:WaitTalk(0))
	end)
}


self.WaitTreasureBoxDisappear = {
	Order = 5.2,
	Type = CaseType.MonoTest,
	Description="验证宝箱开启后消失",
	Action = UAutoCoroutine(function ()
		local timeout=60
		while self.Treasurebox:IsDestroied() == false do
			timeout=timeout-1
			yield_return(CS.UnityEngine.WaitForSeconds(1))
			assert(timeout>0,"宝箱没有在60s内消失")
		end
	end)
}

self.GetTreasureItem = {
	Order = 6,
	Type = CaseType.MonoTest,
	Description="获取宝箱的掉落物",
	Action = UAutoCoroutine(function ()
		yield_return(self.base:WaitFoundAllNearbyEntities(function(result) self.items = result end))
		for k,v in pairs(self.items) do
			yield_return(self.base:MoveToPosition(v.transform.position))
			self:Pick(0)
		end
		yield_return(self.base:RunGM("WUDI OFF"))
	end)
}


return self
