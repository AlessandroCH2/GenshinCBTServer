local baseClass = require("UAuto/TestCases/Element/ElementBase")
local UAutoLuaTestCase = class("ElectricComponent", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "ElectricComponent"
self.Category = "元素"
self.Description = "元素成分-电"

self.Element = "Electric"
self.MonsterArray = self:GetMonsterArrayByElement(self.Element)
self.GadgetArray = self:GetGadgetArrayByElement(self.Element)


self.OrderIndex = 1;
self.CheckMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "检查怪物电元素成分",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.GrassPos,true,true))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:RunGM("WUDI ON"))
		self.base:MonsterAI(false)

		for i, monster in pairs(self.MonsterArray) do
			self.base:CreateMonster(monster["id"])
			yield_return(self:WaitFoundEntity(monster["keyword"]))
			yield_return(self.base:CheckElementContain(self.Element, self.foundEntity))
			yield_return(self.base:RunGM("KILL MONSTER ALL"))
		end
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.CheckAvatar = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "检查武将电元素成分：雷泽释放充能技",
	Action = UAutoCoroutine(function()
		yield_return(self:ChangeAvatar("Razor"))
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		yield_return(self.base:Skill(4))
		yield_return(self.base:CheckElementContain(self.Element))
	end)
}


return self
