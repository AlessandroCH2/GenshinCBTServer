local baseClass = require("UAuto/TestCases/Element/ElementBase")
local UAutoLuaTestCase = class("FireElectricReaction", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "FireElectricReaction"
self.Category = "元素"
self.Description = "元素反应-火<-电"

self.Element = "Fire"
self.CatalystElement = "Electric"

self.ElementMonster = self:GetOneMonsterByElement(self.Element)


self.OrderIndex = 1;
self.CheckMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "火元素怪物与电反应",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.GrassPos,true,true))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:RunGM("WUDI ON"))
		self.base:MonsterAI(false)

		yield_return(self.base:RunGM("MONSTER "..tostring(self.ElementMonster["id"]).." 1 1"))
		yield_return(self:WaitFoundEntity(self.ElementMonster["keyword"]))
		yield_return(self.base:RunGM("WUDI MONSTER ON"))
		self.base:MonsterDoSkill(self.foundEntity, 0)

		yield_return(self:ChangeAvatar("Razor"))
		yield_return(self.base:MoveToEntity(self.foundEntity, self.FindTimeOut, self.ElementMonster["fatrange"]))
		yield_return(self.base:Skill(1))
		yield_return(self.base:CheckFireReaction(self.CatalystElement, self.foundEntity))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
	end)
}


return self
