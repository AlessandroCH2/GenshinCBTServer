local baseClass = require("UAuto/TestCases/Element/ElementBase")
local UAutoLuaTestCase = class("FireComponent", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "FireComponent"
self.Category = "元素"
self.Description = "元素成分-火"

self.Element = "Fire"
self.MonsterArray = self:GetMonsterArrayByElement(self.Element)


self.OrderIndex = 1;
self.CheckMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "检查怪物火元素成分",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.GrassPos,true,true))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:RunGM("WUDI ON"))
		self.base:MonsterAI(false)

		for i, monster in pairs(self.MonsterArray) do
			self.base:CreateMonster(monster["id"])
			yield_return(self:WaitFoundEntity(monster["keyword"]))
			self.base:MonsterDoSkill(self.foundEntity, 0)
			yield_return(self.base:CheckElementContain(self.Element, self.foundEntity))
			yield_return(self.base:RunGM("KILL MONSTER ALL"))
		end
	end)
}


return self
