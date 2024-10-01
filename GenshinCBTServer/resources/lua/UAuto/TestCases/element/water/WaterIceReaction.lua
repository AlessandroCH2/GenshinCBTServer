local baseClass = require("UAuto/TestCases/Element/ElementBase")
local UAutoLuaTestCase = class("WaterIceReaction", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "WaterIceReaction"
self.Category = "元素"
self.Description = "元素反应-水<-冰"

self.Element = "Water"
self.CatalystElement = "Ice"

self.ElementMonster = self:GetOneMonsterByElement(self.Element)
self.CatalystMonster = self:GetOneMonsterByElement(self.CatalystElement)


self.OrderIndex = 1;
self.CheckMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "水元素怪物与冰反应",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.GrassPos,true,true))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:RunGM("WUDI ON"))
		self.base:MonsterAI(false)

		yield_return(self.base:RunGM("MONSTER "..tostring(self.ElementMonster["id"]).." 1 1"))
		yield_return(self:WaitFoundEntity(self.ElementMonster["keyword"]))
		yield_return(self.base:RunGM("WUDI MONSTER ON"))

		yield_return(self:ChangeAvatar("Ayaka"))
		yield_return(self.base:MoveToEntity(self.foundEntity, self.FindTimeOut, self.ElementMonster["fatrange"]))
		yield_return(self.base:Skill(1))
		yield_return(self.base:CheckWaterReaction(self.CatalystElement, self.foundEntity))
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.CheckAvatar = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "水元素武将与冰反应",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.WaterPos,true,true))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:RunGM("WUDI ON"))
		self.base:MonsterAI(true)

		yield_return(self.base:MoveToPosition(self.WaterPosVec1))
		yield_return(self.base:RunGM("MONSTER "..tostring(self.CatalystMonster["id"]).." 1 1"))
		yield_return(self:WaitFoundEntity(self.CatalystMonster["keyword"]))
		yield_return(self.base:CheckWaterReaction(self.CatalystElement))
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.CheckEnv = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "水元素环境与冰反应",
	Action = UAutoCoroutine(function()
		yield_return(self.base:CheckWaterEnvReaction(self.CatalystElement))
	end)
}


return self
