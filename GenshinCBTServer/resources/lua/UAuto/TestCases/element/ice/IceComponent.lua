local baseClass = require("UAuto/TestCases/Element/ElementBase")
local UAutoLuaTestCase = class("IceComponent", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "IceComponent"
self.Category = "元素"
self.Description = "元素成分-冰"

self.Element = "Ice"
self.SubElement = "Frozen"
self.MonsterArray = self:GetMonsterArrayByElement(self.Element)


self.OrderIndex = 1;
self.CheckMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "检查怪物冰元素成分",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.GrassPos,true,true))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:RunGM("WUDI ON"))
		self.base:MonsterAI(false)

		for i, monster in pairs(self.MonsterArray) do
			self.base:CreateMonster(monster["id"])
			yield_return(self:WaitFoundEntity(monster["keyword"]))
			yield_return(self.base:CheckElementContain(self.SubElement, self.foundEntity))
			yield_return(self.base:RunGM("KILL MONSTER ALL"))
		end
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.CheckAvatar = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "检查武将冰元素成分：被冰史莱姆攻击",
	Action = UAutoCoroutine(function()
		self.base:MonsterAI(true)

		yield_return(self.base:RunGM("MONSTER "..tostring(self.MonsterArray[1]["id"]).." 1 1"))
		yield_return(self:WaitFoundEntity(self.MonsterArray[1]["keyword"]))
		yield_return(self.base:CheckElementContain(self.Element))
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.CheckEnv = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "检查怪物落在水面结冰",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.WaterPos,true,true))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:RunGM("WUDI ON"))
		self.base:MonsterAI(false)

		yield_return(self.base:RunGM("MONSTER "..tostring(self.MonsterArray[1]["id"]).." 1 1"))
		yield_return(self.base:CheckWaterEnvReaction(self.Element))
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.CheckEnv2 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "检查武将冰技能打在水面结冰",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:RunGM("goto "..self.WaterPos,true,true))

		yield_return(self:ChangeAvatar("Ayaka"))
		yield_return(self.base:Skill(1))
		yield_return(self.base:CheckWaterEnvReaction(self.Element))
	end)
}


return self
