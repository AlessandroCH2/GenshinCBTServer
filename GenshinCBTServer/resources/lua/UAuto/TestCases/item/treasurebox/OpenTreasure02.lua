local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("OpenTreasure02",baseClass)
local self = UAutoLuaTestCase
UAutoLuaTestCase.TestFixture = "OpenTreasure02"
UAutoLuaTestCase.Category = "交互机关"
self.Description = "打开02类型杀怪宝箱"
self.Order=701
UAutoLuaTestCase.SetUp = {
	Order = 0.1,
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self.base:SetUpVariables())
		yield_return(self.base:RunGM("WUDI ON"))
	end)
}

UAutoLuaTestCase.FindTreasure02 = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description = "移动到02类型宝箱",
	Action = UAutoCoroutine(function()
		yield_return(self.base:TelePort(CS.UnityEngine.Vector3(1975.93193,215.6965,-1481.5383)))
		yield_return(self.base:WaitFoundNearByEntityByName("SceneObj_Item_Treasurebox02",function(result) self.Treasurebox = result end))
		yield_return(self.base:MoveToPosition(self.Treasurebox.transform.position))
	end)
}


UAutoLuaTestCase.OpenTreasure02FailedWhenHasMonster = {
	Order = 2,
	Type = CaseType.MonoTest,
	Description="有怪时，开启宝箱",
	Action = UAutoCoroutine(function ()
		yield_return(self:WaitTalk(0))
	end)
}

UAutoLuaTestCase.KillMonster = {
	Order = 3,
	Type = CaseType.MonoTest,
	Description="清怪",
	Action = UAutoCoroutine(function ()
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
	end)
}

UAutoLuaTestCase.OpenTreasure02 = {
	Order = 4,
	Type = CaseType.MonoTest,
	Description="开启宝箱",
	Action = UAutoCoroutine(function ()
		yield_return(self.base:MoveByAngle(0))
		yield_return(CS.UnityEngine.WaitForSeconds(1.5))
		yield_return(self.base:MoveByAngle(0,true))
		yield_return(self.base:MoveToPosition(self.Treasurebox.transform.position))
		yield_return(CS.UnityEngine.WaitForSeconds(20))
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

UAutoLuaTestCase.GetTreasureItem = {
	Order = 5,
	Type = CaseType.MonoTest,
	Description="捡取掉落物",
	Action = UAutoCoroutine(function ()
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		yield_return(self.base:WaitFoundAllNearbyEntities(function(result) self.items = result end))
		print(self.items)
		for k,v in pairs(self.items) do
			if(v~=nil and v.transform~=nil) then
				yield_return(self.base:MoveToPosition(v.transform.position))
				self:Pick(0)
			end
		end
		yield_return(self.base:RunGM("WUDI OFF"))
	end)
}



return self
