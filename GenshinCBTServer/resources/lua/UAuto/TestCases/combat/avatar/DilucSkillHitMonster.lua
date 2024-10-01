local baseClass = require("UAuto/TestCases/Combat/CombatBase")
local UAutoLuaTestCase = class("DilucSkillHitMonster", baseClass)

local self = UAutoLuaTestCase
self.TestFixture = "DilucSkillHitMonster"
self.Category = "战斗"
self.Description = "迪卢克技能打各种怪"
self.OrderIndex = 0;
self.AvatarName = "Diluc"

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
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		self.base:MonsterGod(true)
		self:CreateMonsters()
	end)

}
self.OrderIndex = self.OrderIndex + 1;
self.DoSkill0 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "普攻打怪",
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
	Description = "加强普攻打怪",
	Action = UAutoCoroutine(function()
		for idx,monsterPeer in ipairs(self.MonsterPeersInHit) do
			self.MonsterId = monsterPeer[1]
			self.MonsterKeyWord = monsterPeer[2]
			yield_return(self:MonsterRefocus())
			yield_return(self.base:Skill(0, false))
			yield_return(CS.UnityEngine.WaitForSeconds(1))
			yield_return(self.base:WaitChecking())
			yield_return(self.base:SkillUp(0))
		end
		
	end)
}


self.OrderIndex = self.OrderIndex + 1;
self.DoSkill1 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "小技能1打怪",
	Action = UAutoCoroutine(function()
		for idx,monsterPeer in ipairs(self.MonsterPeersInHit) do
			self.MonsterId = monsterPeer[1]
			self.MonsterKeyWord = monsterPeer[2]
			yield_return(self:MonsterRefocus())
			local attackCount = self.doSkillCount
			while attackCount > 0 do
				yield_return(CS.UnityEngine.WaitForSeconds(self.doSkillWait))
				yield_return(self.base:Skill(1))
				attackCount = attackCount - 1
			end
			yield_return(self.base:WaitChecking())
		end
	end)
}


self.OrderIndex = self.OrderIndex + 1;
self.DoSkill4 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "充能技打怪",
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

self.OrderIndex = self.OrderIndex + 1;
self.End = { 
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "结束",
	Action = UAutoCoroutine(function()
		yield_return(CS.UnityEngine.WaitForSeconds(self.caseWait))
		yield_return(self.base:StopEvtHook())
	end)
}



return self