
local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("OpenTreasure05",baseClass)
local self = UAutoLuaTestCase
UAutoLuaTestCase.TestFixture = "OpenTreasure05"
UAutoLuaTestCase.Category = "交互机关"
self.Description = "打开05类型的冰宝箱"
self.Order=704
local StartPosition = CS.UnityEngine.Vector3(2540,354,-1677)
local AttackPosition = CS.UnityEngine.Vector3(2540,354,-1674)

self.SetUp = {
	Order = 0.1,
	Type = CaseType.MonoTest,
	Description = "初始化",
	Action = UAutoCoroutine(function()
		yield_return(self.base:SetUpVariables())	
		yield_return(self.base:RunGM("clear all",true,true))
	end)
}

self.FindTreasure05 = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description = "找到冰宝箱",
	Action = UAutoCoroutine(function()
		yield_return(self.base:TelePort(StartPosition))
		yield_return(self.base:WaitFoundNearByEntityByName("SceneObj_Item_Treasurebox05",function(result) self.Treasurebox = result end))
		yield_return(self.base:MoveToPosition(self.Treasurebox.transform.position))
	end)
}


self.OpenTreasure05Failed = {
	Order = 4,
	Type = CaseType.MonoTest,
	Description="未烧掉冰时开启宝箱失败",
	Action = UAutoCoroutine(function ()
		yield_return(self:WaitTalk(0))
	end)
}

self.AttackTreasure05 = {
	Order = 5,
	Type = CaseType.MonoTest,
	Description="切换安柏，使用充能技攻击冰宝箱",
	Action = UAutoCoroutine(function ()
		yield_return(self.base:MoveToPosition(StartPosition))
		yield_return(self:ChangeAvatar("Anbo"))
		yield_return(self.base:MoveToPosition(AttackPosition))
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		yield_return(self.base:RunGM("WUDI ON"))
		yield_return(self.base:Skill(4))
		yield_return(self.base:RunGM("ENERGY INFINITE OFF"))
	end)
}


self.WaitTreasureBoxDisappear = {
	Order = 5.1,
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
	Description="获取宝箱掉落物",
	Action = UAutoCoroutine(function ()
		yield_return(self.base:MoveToPosition(self.Treasurebox.transform.position))
		yield_return(CS.UnityEngine.WaitForSeconds(5))
		yield_return(self:WaitTalk(0))
		yield_return(CS.UnityEngine.WaitForSeconds(5))
		yield_return(self.base:WaitFoundAllNearbyEntities(function(result) self.items = result end))
		print(self.items)
		for k,v in pairs(self.items) do
			yield_return(self.base:MoveToPosition(v.transform.position))
			self:Pick(0)
		end
		yield_return(self.base:RunGM("WUDI OFF"))
	end)
}


return self
