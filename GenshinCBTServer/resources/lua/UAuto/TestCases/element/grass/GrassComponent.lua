local baseClass = require("UAuto/TestCases/Element/ElementBase")
local UAutoLuaTestCase = class("GrassComponent", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "GrassComponent"
self.Category = "元素"
self.Description = "元素成分-草"

self.Element = "Grass"
self.MonsterArray = self:GetMonsterArrayByElement(self.Element)
self.GadgetArray = self:GetGadgetArrayByElement(self.Element)


self.OrderIndex = 1;
self.CheckMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "检查怪物草元素成分",
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
self.CheckGadget = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "检查物件（含武器等）草元素成分",
	Action = UAutoCoroutine(function()
		for i, gadget in pairs(self.GadgetArray) do
			self.base:CreateGadget(gadget["id"], gadget["campid"], self.GrassPosVec)
			yield_return(self:WaitFoundEntity(gadget["keyword"]))
			yield_return(self.base:CheckElementContain(self.Element, self.foundEntity))
			yield_return(self.base:RemoveEntity(self.foundEntity))
		end
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.CheckAvatar = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "检查武将草元素成分",
	Action = UAutoCoroutine(function()
		self.entityManager = singletonManager:GetSingletonInstance("MoleMole.EntityManager")
		self.localAvatar = self.entityManager:GetLocalAvatarEntity()
		self.base:CreateGadget(42001015, 4001, self.localAvatar.transform.position)
		yield_return(self.base:CheckElementContain(self.Element))
	end)
}


return self
