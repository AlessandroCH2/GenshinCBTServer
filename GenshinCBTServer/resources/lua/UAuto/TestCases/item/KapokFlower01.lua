local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("KapokFlower01",baseClass)
local self = UAutoLuaTestCase
UAutoLuaTestCase.TestFixture = "KapokFlower01"
UAutoLuaTestCase.Category = "交互机关"
self.Description = "打击木棉花，捡取物品"
self.Order=706
local StartPosition = CS.UnityEngine.Vector3(1869.9863,195.8449,-5268.864)
local AttackPosition = CS.UnityEngine.Vector3(1865.5633,195.2825,-5264.2233)
local MovePosition = CS.UnityEngine.Vector3(1864.9346,195.0369,-5261.4623)
local TargetPosition = CS.UnityEngine.Vector3(1866.3359,195.3827,-5265.4314)
UAutoLuaTestCase.SetUp = {
	Order = 0.1,
	Type = CaseType.MonoTest,
	Description = "初始化",
	Action = UAutoCoroutine(function()
		yield_return(self.base:SetUpVariables())
	end)
}

UAutoLuaTestCase.FindKapokFlower01 = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description = "瞬移到1869.9863,195.8449,-5268.864,找到木棉花,切换到绫华",
	Action = UAutoCoroutine(function()
		yield_return(self.base:TelePort(StartPosition))
		yield_return(self:ChangeAvatar("Ayaka"))
	end)
}


UAutoLuaTestCase.WaterOnKapokFlower01 = {
	Order = 2,
	Type = CaseType.MonoTest,
	Description = "使用绫华的水激流给木棉花上水",
	Action = UAutoCoroutine(function()
		
		yield_return(self.base:Skill(2,false))
		yield_return(self.base:MoveToPosition(TargetPosition))
		yield_return(self.base:MoveToPosition(MovePosition))
		yield_return(self.base:MoveToPosition(TargetPosition))
		yield_return(self.base:MoveToPosition(StartPosition))
		yield_return(self.base:SkillUp(2))
	end)
}


UAutoLuaTestCase.AttackKapokFlower01 = {
	Order = 3,
	Type = CaseType.MonoTest,
	Description="攻击木棉花",
	Action = UAutoCoroutine(function ()
		yield_return(self.base:MoveToPosition(MovePosition))
		yield_return(self.base:MoveToPosition(AttackPosition))
		local attackCount = 6
		while attackCount > 0 do
			yield_return(self.base:Skill(0))
			yield_return(CS.UnityEngine.WaitForSeconds(0.3))
			attackCount = attackCount - 1
		end
	end)
}


UAutoLuaTestCase.GetKapokFlower01 = {
	Order = 4,
	Type = CaseType.MonoTest,
	Description="捡取木棉花掉落物",
	Action = UAutoCoroutine(function ()
		yield_return(self.base:MoveToPosition(TargetPosition))
		yield_return(CS.UnityEngine.WaitForSeconds(2))
		yield_return(self.base:WaitFoundAllNearbyEntities(function(result) self.items = result end))
		print(self.items)
		for k,v in pairs(self.items) do
			yield_return(self.base:MoveToPosition(v.transform.position))
			self:Pick(0)
		end
	end)
}


return self
