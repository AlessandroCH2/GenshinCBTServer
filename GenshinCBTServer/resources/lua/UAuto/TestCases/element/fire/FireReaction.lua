local baseClass = require("UAuto/TestCases/Element/ElementBase")
local UAutoLuaTestCase = class("FireReaction", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "FireReaction"
self.Category = "元素"
self.Description = "元素反应-火"

self.Element = "Fire"

self.ElementMonster = self:GetOneMonsterByElement(self.Element)


self.OrderIndex = 1;
self.CheckFireElementAdd = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "火攻补充火元素",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.WaterPos,true,true))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:RunGM("WUDI ON"))
		self.base:MonsterAI(false)

		yield_return(self.base:RunGM("MONSTER "..tostring(self.ElementMonster["id"]).." 1 1"))
		yield_return(self:WaitFoundEntity(self.ElementMonster["keyword"]))
		yield_return(self.base:RunGM("WUDI MONSTER ON"))
		yield_return(self.base:CheckElementRemove(self.Element, self.foundEntity))

		yield_return(self:ChangeAvatar("Anbo"))
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		yield_return(self.base:MoveToEntity(self.foundEntity, self.FindTimeOut, self.ElementMonster["fatrange"]))
		yield_return(self.base:Skill(4))
		yield_return(self.base:CheckElementContain(self.Element, self.foundEntity))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))

	end)
}


return self
