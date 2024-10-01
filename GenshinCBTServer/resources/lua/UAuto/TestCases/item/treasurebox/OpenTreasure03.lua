local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("OpenTreasure03",baseClass)
local self = UAutoLuaTestCase
UAutoLuaTestCase.TestFixture = "OpenTreasure03"
UAutoLuaTestCase.Category = "交互机关"
self.Description="开启03类型黄金宝箱"
self.Order=702
UAutoLuaTestCase.SetUp = {
	Order = 0.1,
	Type = CaseType.MonoTest,
	Description="初始化",
	Action = UAutoCoroutine(function()
		yield_return(self.base:SetUpVariables())
		yield_return(self.base:RunGM("wudi on"))
	end)
}

self.FindTreasure03 = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description="瞬移到(2316.558 218.1997 -1111.945)找到03类型黄金宝箱",
	Action = UAutoCoroutine(function()
		yield_return(self.base:TelePort(CS.UnityEngine.Vector3(2316.558, 218.1997, -1111.945)))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:WaitFoundNearByEntityByName("TreasureBox03",function(result) self.Treasurebox = result end,100))
		yield_return(self.base:MoveToPosition(self.Treasurebox.transform.position,60,2))
	end)
}


self.OpenTreasure03 = {
	Order = 4,
	Type = CaseType.MonoTest,
	Description="开启宝箱",
	Action = UAutoCoroutine(function ()
		yield_return(self:WaitTalk(0))
	end)
}

self.WaitTreasureBoxDisappear = {
	Order = 4.1,
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
	Order = 5,
	Type = CaseType.MonoTest,
	Description="捡取物品",
	Action = UAutoCoroutine(function ()
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		yield_return(self.base:WaitFoundAllNearbyEntities(function(result) self.items = result end))
		print(self.items)
		for k,v in pairs(self.items) do
			yield_return(self.base:MoveToPosition(v.transform.position))
			yield_return(self:Pick(0))
		end

	end)
}


return self
