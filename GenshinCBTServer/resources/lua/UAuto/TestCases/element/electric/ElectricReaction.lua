local baseClass = require("UAuto/TestCases/Element/ElementBase")
local UAutoLuaTestCase = class("ElectricReaction", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "ElectricReaction"
self.Category = "元素"
self.Description = "元素反应-电"

self.Element = "Electric"

self.NegativeMonster = self:GetMonsterArrayByElement(self.Element)[1]
self.PositiveMonster = self:GetMonsterArrayByElement(self.Element)[2]


self.OrderIndex = 1;
self.CheckElectricShock = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "电元素怪物对武将的电击效果",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.GrassPos,true,true))
		yield_return(self.base:RunGM("LEVEL 1"))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:RunGM("WUDI ON"))
		self.base:MonsterAI(false)

		yield_return(self.base:RunGM("MONSTER "..tostring(self.NegativeMonster["id"]).." 1 1"))
		yield_return(self:WaitFoundEntity(self.NegativeMonster["keyword"]))
		yield_return(self.base:CheckAnimateOn("ElectricShock"))
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.CheckPosNegElectric = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "正负电元素怪物通电效果",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("MONSTER "..tostring(self.PositiveMonster["id"]).." 1 1"))
		yield_return(self.base:CheckElectricReaction("ElectricPositive", self.foundEntity))
		yield_return(self.base:CheckElectricReaction("DischargeOff", self.foundEntity))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
	end)
}


return self
