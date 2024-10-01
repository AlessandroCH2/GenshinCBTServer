local baseClass = require("UAuto/TestCases/Element/ElementBase")
local UAutoLuaTestCase = class("WaterComponent", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "WaterComponent"
self.Category = "元素"
self.Description = "元素成分-水"

self.Element = "Water"
self.MonsterArray = self:GetMonsterArrayByElement(self.Element)


self.OrderIndex = 1;
self.CheckMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "检查怪物水元素成分",
	Action = UAutoCoroutine(function()
		yield_return(self:FinishAllNoob())
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

-- self.OrderIndex = self.OrderIndex + 1;
-- self.CheckAvatar1 = {
-- 	Order = self.OrderIndex,
-- 	Type = CaseType.MonoTest,
-- 	Description = "检查武将水元素成分：绫华释放技能2",
-- 	Action = UAutoCoroutine(function()
-- 		yield_return(self:ChangeAvatar("Ayaka"))
-- 		yield_return(self.base:Skill(2))
-- 		yield_return(self.base:CheckElementContain(self.Element))
-- 	end)
-- }

self.OrderIndex = self.OrderIndex + 1;
self.CheckAvatar2 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "检查武将水元素成分：被水史莱姆攻击",
	Action = UAutoCoroutine(function()
		yield_return(self:ChangeAvatar("Anbo"))
		yield_return(self.base:RunGM("WUDI ON"))
		self.base:MonsterAI(true)

		yield_return(self.base:RunGM("MONSTER "..tostring(self.MonsterArray[1]["id"]).." 1 1"))
		yield_return(self:WaitFoundEntity(self.MonsterArray[1]["keyword"]))
		yield_return(self.base:CheckElementContain(self.Element))
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.CheckEnv2Avatar = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "检查武将靠近水",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self:ChangeAvatar("Ayaka"))
		yield_return(self.base:RunGM("goto "..self.WaterPos,true,true))
		yield_return(self.base:MoveToPosition(self.WaterPosVec1))
		yield_return(self.base:CheckElementContain(self.Element))
	end)
}


return self
