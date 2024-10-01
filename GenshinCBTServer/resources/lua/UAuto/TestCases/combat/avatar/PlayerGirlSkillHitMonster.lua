local baseClass = require("UAuto/TestCases/Combat/CombatBase")
local UAutoLuaTestCase = class("PlayerGirlSkillHitMonster", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "PlayerGirlSkillHitMonster"
self.Category = "战斗"
self.Description = "女主角色技能打怪"
self.AvatarName = "PlayerGirl"
self.OrderIndex = 0;



self.OrderIndex = self.OrderIndex + 1;
self.Init = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "初始化",
	Action = UAutoCoroutine(function()
		self.base:InitEvtHook()
		yield_return(self.base:RunGM("goto "..self.safePos, true, true))
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		self.base:MonsterAI(false)
		yield_return(self:ChangeAvatar(self.AvatarName))
		yield_return(self.base:RunGM("WUDI ON"))
		yield_return(self.base:RunGM("skill depot 504"))
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		self.base:MonsterGod(true)
		self:CreateMonsters()
	end)

}


self.OrderIndex = self.OrderIndex + 1;
self.DoSkill00 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "普攻",
	Action = UAutoCoroutine(function()
		for idx,monsterPeer in ipairs(self.MonsterPeersInHit) do
			self.MonsterId = monsterPeer[1]
			self.MonsterKeyWord = monsterPeer[2]
			yield_return(self:MonsterRefocus())
			local attackCount = self.doSkillCount
			while attackCount > 0 do
				yield_return(CS.UnityEngine.WaitForSeconds(self.doSkillWait))
				yield_return(self.base:Skill(0))
				attackCount = attackCount - 1
			end
			yield_return(self.base:WaitChecking())
		end
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.DoSkill01 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "加强普攻",
	Action = UAutoCoroutine(function()
		for idx,monsterPeer in ipairs(self.MonsterPeersInHit) do
			self.MonsterId = monsterPeer[1]
			self.MonsterKeyWord = monsterPeer[2]
			yield_return(self:MonsterRefocus())
			yield_return(self.base:Skill(0, false))
			yield_return(CS.UnityEngine.WaitForSeconds(2))
			yield_return(self.base:SkillUp(0))
			yield_return(self.base:WaitChecking())
		end	
	end)
}


self.OrderIndex = self.OrderIndex + 1;
self.DoSkill11 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "加强小技能1-风球",
	Action = UAutoCoroutine(function()
		for idx,monsterPeer in ipairs(self.MonsterPeersInHit) do
			self.MonsterId = monsterPeer[1]
			self.MonsterKeyWord = monsterPeer[2]
			yield_return(self:MonsterRefocus())
			yield_return(self.base:Skill(1, false))
			yield_return(CS.UnityEngine.WaitForSeconds(2))
			yield_return(self.base:SkillUp(1))
			yield_return(self.base:WaitChecking())			
		end
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.DoSkill4 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "充能技",
	Action = UAutoCoroutine(function()
		for idx,monsterPeer in ipairs(self.MonsterPeersInHit) do
			self.MonsterId = monsterPeer[1]
			self.MonsterKeyWord = monsterPeer[2]
			yield_return(self:MonsterRefocus())
			yield_return(self.base:Skill(4))
			yield_return(self.base:WaitChecking())
		end
	end)
}


return self
