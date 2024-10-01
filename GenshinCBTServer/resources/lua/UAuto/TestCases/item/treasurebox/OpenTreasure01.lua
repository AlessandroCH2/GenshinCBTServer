local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("OpenTreasure01",baseClass)
local self = UAutoLuaTestCase
UAutoLuaTestCase.TestFixture = "OpenTreasure01"
UAutoLuaTestCase.Category = "交互机关"
self.Description="打开01普通类型宝箱"
self.Order=700
UAutoLuaTestCase.SetUp = {
	Order = 0.1,
	Type = CaseType.MonoTest,
	Description="初始化",
	Action = UAutoCoroutine(function()
		yield_return(self.base:SetUpVariables())
	end)
}

self.FindTreasure01 = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description="瞬移到2799.7,199.6,-1742.7处的宝箱",
	Action = UAutoCoroutine(function()
		yield_return(self.base:TelePort(CS.UnityEngine.Vector3(2796.7,198.8336,-1742.461)))--2799.7,199.6,-1742.7
		yield_return(self.base:WaitFoundNearByEntityByName("Treasurebox01",function(result) self.Treasurebox = result end))
		yield_return(self.base:MoveToPosition(self.Treasurebox.transform.position))
	end)
}


self.OpenTreasure01 = {
	Order = 2,
	Type = CaseType.MonoTest,
	Description="打开宝箱",
	Action = UAutoCoroutine(function ()
		yield_return(self:WaitTalk(0))
	end)
}

self.WaitTreasureBoxDisappear = {
	Order = 2.1,
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
	Order = 3,
	Type = CaseType.MonoTest,
	Description="捡取掉落物",
	Action = UAutoCoroutine(function ()
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		yield_return(self.base:WaitFoundAllNearbyEntities(function(result) self.items = result end))
		print(self.items)
		--for k,v in pairs(self.items) do
		--	yield_return(self.base:MoveToPosition(v.transform.position))
		--	self:Pick(0)
		--end

	end)
}


return self
