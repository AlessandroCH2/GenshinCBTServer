local baseClass = require("UAuto/TestCases/Element/ElementBase")
local UAutoLuaTestCase = class("GrassFireReaction", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "GrassFireReaction"
self.Category = "元素"
self.Description = "元素反应-草<-火"

self.Element = "Grass"
self.CatalystElement = "Fire"

self.ElementMonster = self:GetOneMonsterByElement(self.Element)
self.CatalystMonster = self:GetOneMonsterByElement(self.CatalystElement)
self.ElementAvatarWeapon = self:GetOneAvatarWeaponByElement(self.Element)
self.ElementMonsterWeapon = self:GetOneMonsterWeaponByElement(self.Element)
self.ElementItem = self:GetOneItemByElement(self.Element)


self.OrderIndex = 1;
self.CheckMonster = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "草元素怪物与火反应：着火，草元素耗尽",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.GrassPos,true,true))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:RunGM("WUDI ON"))
		self.base:MonsterAI(false)

		self:GetWindEntityCount()
		yield_return(self.base:RunGM("MONSTER "..tostring(self.ElementMonster["id"]).." 1 1"))
		yield_return(self:WaitFoundEntity(self.ElementMonster["keyword"]))
		yield_return(self.base:RunGM("WUDI MONSTER ON"))

		yield_return(self:ChangeAvatar("Anbo"))
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		yield_return(self.base:MoveToEntity(self.foundEntity, self.FindTimeOut, self.ElementMonster["fatrange"]))
		yield_return(self.base:Skill(4))
		yield_return(self.base:CheckGrassReaction(self.CatalystElement, self.foundEntity))
		yield_return(self.base:CheckElementRemove(self.Element, self.foundEntity))
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.CheckEnv = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "草元素环境与火反应：着火，起风，风灭，不再点燃",
	Action = UAutoCoroutine(function()
		self:CheckWindEntityCount("+")
		yield_return(self.base:CheckGrassEnvReaction(self.CatalystElement))
		-- yield_return(self.base:CheckGrassEnvReaction("AntiFire"))
		yield_return(CS.UnityEngine.WaitForSeconds(10))
		self:CheckWindEntityCount("-")
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.CheckMonsterWeapon = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "草元素怪物武器与火反应：着火，移除",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self.base:RunGM("MONSTER "..tostring(self.ElementMonsterWeapon["owner"]).." 1 1"))
		yield_return(self:WaitFoundEntity(self.ElementMonsterWeapon["keyword"]))
		yield_return(self.base:RunGM("WUDI MONSTER ON"))
		yield_return(self.base:Skill(4))
		yield_return(self.base:CheckGrassReaction(self.CatalystElement, self.foundEntity))
		yield_return(self.base:CheckEntityRemove(self.foundEntity.runtimeID))
	end)
}

-- self.OrderIndex = self.OrderIndex + 1;
-- self.CheckAvatarWeapon = {
-- 	Order = self.OrderIndex,
-- 	Type = CaseType.MonoTest,
-- 	Description = "草元素武将武器与火反应：着火",
-- 	Action = UAutoCoroutine(function()
-- 		yield_return(self:ChangeAvatar(self.ElementAvatarWeapon["owner"]))
-- 		yield_return(self.base:RunGM("EQUIP ADD "..tostring(self.ElementAvatarWeapon["otherinfo"])))
-- 		yield_return(self:WaitFoundEntity(self.ElementAvatarWeapon["keyword"]))
-- 		yield_return(self.base:RunGM("KILL MONSTER ALL"))
-- 		yield_return(self.base:RunGM("WUDI ON"))
-- 		self.base:MonsterAI(true)

-- 		yield_return(self.base:RunGM("MONSTER "..tostring(self.CatalystMonster["id"]).." 1 1"))
-- 		yield_return(self.base:CheckGrassReaction(self.CatalystElement, self.foundEntity))
-- 	end)
-- }

self.OrderIndex = self.OrderIndex + 1;
self.CheckGadget = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "草元素物件与火反应：着火，移除",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("goto "..self.GrassPos,true,true))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		yield_return(self:ChangeAvatar("Anbo"))
		yield_return(self.base:RunGM("WUDI ON"))
		yield_return(self.base:RunGM("GADGET "..tostring(self.ElementItem["id"]).." 1"))
		yield_return(self:WaitFoundEntity(self.ElementItem["keyword"]))
		yield_return(self.base:MoveToEntity(self.foundEntity, self.FindTimeOut, self.Range))
		yield_return(self.base:Skill(4))
		yield_return(self.base:CheckGrassReaction(self.CatalystElement, self.foundEntity))
		yield_return(self.base:CheckEntityRemove(self.foundEntity.runtimeID))
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.CheckAvatar = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "草元素武将与火反应：着火，草元素销毁",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("WUDI ON"))
		self.base:MonsterAI(true)
		yield_return(self.base:RunGM("MONSTER "..tostring(self.CatalystMonster["id"]).." 1 1"))
		self.entityManager = singletonManager:GetSingletonInstance("MoleMole.EntityManager")
		self.localAvatar = self.entityManager:GetLocalAvatarEntity()
		self.base:CreateGadget(42001015, 4001, self.localAvatar.transform.position)
		self.base:CreateGadget(42001015, 4001, self.localAvatar.transform.position)
		self.base:CreateGadget(42001015, 4001, self.localAvatar.transform.position)
		self.base:CreateGadget(42001015, 4001, self.localAvatar.transform.position)
		yield_return(self.base:CheckGrassReaction(self.CatalystElement))
		yield_return(self.base:CheckElementRemove(self.Element))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
	end)
}

return self
