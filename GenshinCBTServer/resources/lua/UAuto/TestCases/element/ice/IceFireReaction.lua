local baseClass = require("UAuto/TestCases/Element/ElementBase")
local UAutoLuaTestCase = class("IceFireReaction", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "IceFireReaction"
self.Category = "元素"
self.Description = "元素反应-冰<-火"

self.Element = "Ice"
self.SubElement = "Frozen"
self.CatalystElement = "Fire"

self.ElementMonster = self:GetOneMonsterByElement(self.Element)
self.CatalystMonster = self:GetOneMonsterByElement(self.CatalystElement)


self.OrderIndex = 1;
self.CheckMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "冰元素怪物与火反应：蒸气、冰属性销毁",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.GrassPos,true,true))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:RunGM("WUDI ON"))
		self.base:MonsterAI(false)

		yield_return(self.base:RunGM("MONSTER "..tostring(self.ElementMonster["id"]).." 1 1"))
		yield_return(self:WaitFoundEntity(self.ElementMonster["keyword"]))
		yield_return(self.base:RunGM("WUDI MONSTER ON"))

		yield_return(self:ChangeAvatar("Diluc"))
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		yield_return(self.base:MoveToEntity(self.foundEntity, self.FindTimeOut, self.ElementMonster["fatrange"]))
		yield_return(self.base:Skill(4))
		yield_return(self.base:CheckIceReaction(self.CatalystElement, self.foundEntity))
		-- yield_return(self.base:CheckElementRemove(self.SubElement, self.foundEntity))
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.CheckEnv = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "冰元素水面与火反应：蒸气、冰面消失",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.WaterPos,true,true))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:RunGM("WUDI ON"))
		self.base:MonsterAI(false)

		yield_return(self.base:RunGM("MONSTER "..tostring(self.ElementMonster["id"]).." 1 1"))
		yield_return(self:WaitFoundEntity(self.ElementMonster["keyword"]))

		yield_return(self:ChangeAvatar("Anbo"))
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:Skill(4))
		yield_return(self.base:CheckWaterEnvReaction("Steam"))
		yield_return(self.base:CheckWaterEnvReactionRemove(self.Element))
	end)
}




return self
