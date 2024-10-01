local baseClass = require("UAuto/TestCases/Element/ElementBase")
local UAutoLuaTestCase = class("FireWaterReaction", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "FireWaterReaction"
self.Category = "元素"
self.Description = "元素反应-火<-水"

self.Element = "Fire"
self.CatalystElement = "Water"

self.ElementMonster = self:GetOneMonsterByElement(self.Element)


self.OrderIndex = 1;
self.CheckMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "火元素怪物与水反应",
	Action = UAutoCoroutine(function()
		-- yield_return(self.base:RunGM("goto "..self.GrassPos,true,true))
		-- yield_return(self.base:RunGM("KILL MONSTER ALL"))
		-- yield_return(self.base:RunGM("WUDI ON"))
		-- self.base:MonsterAI(true)

		-- yield_return(self.base:RunGM("MONSTER "..tostring(self.ElementMonster["id"]).." 1 1"))
		-- yield_return(self:WaitFoundEntity(self.ElementMonster["keyword"]))
		-- yield_return(self.base:RunGM("WUDI MONSTER ON"))

		-- yield_return(self:ChangeAvatar("Barbara"))
		-- yield_return(self.base:MoveToEntity(self.foundEntity, self.FindTimeOut, self.ElementMonster["fatrange"]))
		-- yield_return(self.base:Skill(1))
		-- yield_return(self.base:CheckElementRemove(self.Element, self.foundEntity))
		-- yield_return(self.base:RunGM("KILL MONSTER ALL"))

		yield_return(self.base:RunGM("goto "..self.WaterPos,true,true))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:RunGM("WUDI ON"))
		self.base:MonsterAI(false)

		yield_return(self.base:RunGM("MONSTER "..tostring(self.ElementMonster["id"]).." 1 1"))
		yield_return(self:WaitFoundEntity(self.ElementMonster["keyword"]))
		yield_return(self.base:RunGM("WUDI MONSTER ON"))

		yield_return(self.base:CheckElementRemove(self.Element, self.foundEntity))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
	end)
}


return self
