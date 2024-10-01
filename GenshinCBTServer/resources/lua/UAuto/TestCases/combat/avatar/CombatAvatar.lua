local baseClass = require("UAuto/TestCases/Combat/CombatBase")
local UAutoLuaTestCase = class("CombatAvatar", baseClass)

local self = UAutoLuaTestCase
self.TestFixture = "CombatAvatar"
self.Category = "战斗"
self.Description = "各个角色被各种怪击退，击飞"



self.OrderIndex = 0;

self.OrderIndex = self.OrderIndex + 1;
self.Init = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "初始化",
	Action = UAutoCoroutine(function()
		yield_return(self:FinishAllNoob())
		yield_return(CS.UnityEngine.WaitForSeconds(self.caseWait))
		yield_return(self.base:RunGM("goto "..self.safePos, true, true))
		yield_return(CS.UnityEngine.WaitForEndOfFrame())
		self.base:MonsterAI(false)
		yield_return(self.base:RunGM("WUDI ON"))
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		self.base:InitEvtHook()
	end)
}

self.OrderIndex = self.OrderIndex + 1;

self.AvatarsBeHit = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "角色受击",
	Action = UAutoCoroutine(function()
		--每个怪都可以击退,击飞角色
		for _,monsterPeer in ipairs(self.MonsterPeers) do
			self.MonsterId = monsterPeer[1]
			self.MonsterKeyWord = monsterPeer[2]

			yield_return(self.base:RunGM("KILL MONSTER ALL"))
			yield_return(self.base:RunGM("Level 1"))
			self.base:CreateMonster(self.MonsterId)
			print("create monster id: "..tostring(self.MonsterId).." monsterName: "..self.MonsterKeyWord)
			yield_return(self:WaitFoundEntity(self.MonsterKeyWord))
			self.base:SetCheckMonster(self.foundEntity.runtimeID)
			--每个角色都可以被击退、击飞
			for _,avatarName in ipairs(self.BeHitAvatars) do
				yield_return(self.base:RunGM("goto "..self.safePos, true, true))
				yield_return(self:ChangeAvatar(avatarName))
				yield_return(self.base:RunGM("WUDI ON"))
				self.localAvatar = singletonManager:GetSingletonInstance("MoleMole.EntityManager"):GetLocalAvatarEntity()
				--目标锁定玩家
				self.base:MonsterSetTarget(self.foundEntity,self.localAvatar)
				--走到玩家身边
				yield_return(self.base:MonsterMove(self.foundEntity,self.localAvatar.transform.position))

				yield_return(CS.UnityEngine.WaitForEndOfFrame())
				--打玩家,验证击飞高度
				self.base:MonsterDoSkill(self.foundEntity,0)
				yield_return(self.base:WaitChecking())
				--yield_return(self.base:WaitCheckHitLevel(CS.MoleMole.Config.HitLevel.Air))
				--打玩家，验证击退距离
				yield_return(self.base:MonsterMove(self.foundEntity,self.localAvatar.transform.position))
				self.base:MonsterDoSkill(self.foundEntity,1)
				yield_return(self.base:WaitChecking())
				--yield_return(self.base:WaitCheckHitLevel(CS.MoleMole.Config.HitLevel.Heavy))
			end
			yield_return(CS.UnityEngine.WaitForSeconds(5))
		end
	end)
}
self.OrderIndex = self.OrderIndex + 1;
self.End = { 
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "角色受击",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StopEvtHook())
	end)
}

return self