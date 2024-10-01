local baseClass = require("UAuto/TestCases/Element/ElementBase")
local UAutoLuaTestCase = class("RockComponent", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "RockComponent"
self.Category = "元素"
self.Description = "元素成分-岩"

self.Element = "Rock"
self.MonsterArray = self:GetMonsterArrayByElement(self.Element)


self.OrderIndex = 1;
self.CheckMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "检查怪物岩元素成分",
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


return self
