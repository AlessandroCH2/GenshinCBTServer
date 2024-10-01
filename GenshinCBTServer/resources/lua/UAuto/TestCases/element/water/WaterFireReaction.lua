local baseClass = require("UAuto/TestCases/Element/ElementBase")
local UAutoLuaTestCase = class("WaterFireReaction", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "WaterFireReaction"
self.Category = "元素"
self.Description = "元素反应-水<-火"

self.Element = "Water"
self.CatalystElement = "Fire"

self.ElementMonster = self:GetOneMonsterByElement(self.Element)
self.CatalystMonster = self:GetOneMonsterByElement(self.CatalystElement)


self.OrderIndex = 1;
self.CheckMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "水元素怪物与火反应",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.GrassPos,true,true))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:RunGM("WUDI ON"))
		self.base:MonsterAI(false)

		yield_return(self.base:RunGM("MONSTER "..tostring(self.ElementMonster["id"]).." 1 1"))
		yield_return(self:WaitFoundEntity(self.ElementMonster["keyword"]))
		yield_return(self.base:RunGM("WUDI MONSTER ON"))

		yield_return(self:ChangeAvatar("Anbo"))
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		yield_return(self.base:MoveToEntity(self.foundEntity, self.FindTimeOut, self.ElementMonster["fatrange"]))
		yield_return(self.base:Skill(4))
		yield_return(self.base:CheckWaterReaction(self.CatalystElement, self.foundEntity))
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.CheckAvatar = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "水元素武将与火反应",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:RunGM("WUDI ON"))
		self.base:MonsterAI(true)

		yield_return(self.base:RunGM("MONSTER "..tostring(self.CatalystMonster["id"]).." 1 1"))
		yield_return(self:WaitFoundEntity(self.CatalystMonster["keyword"]))

		yield_return(self.base:RunGM("MONSTER "..tostring(self.ElementMonster["id"]).." 1 1"))
		yield_return(self:WaitFoundEntity(self.ElementMonster["keyword"]))

		yield_return(self.base:CheckWaterReaction(self.CatalystElement))
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.CheckEnv = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "水元素环境与火反应",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.WaterPos,true,true))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self:ChangeAvatar("Anbo"))
		yield_return(self.base:Skill(4))
		yield_return(self.base:CheckWaterEnvReaction("Steam"))
	end)
}


return self
