local baseClass = require("UAuto/TestCases/Avatar/Skill/AvatarSkillBase")
local UAutoLuaTestCase = class("AmborSkill", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "AmborSkill"
self.Category = "角色技能"
self.Description = "安柏角色技能"

self.OrderIndex = 0;

self.OrderIndex = self.OrderIndex + 1;
self.DoSkill00 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "普攻",
	Action = UAutoCoroutine(function()
		yield_return(CS.UnityEngine.WaitForSeconds(self.caseWait))
		yield_return(self.base:RunGM("goto "..self.safePos, true, true))
		yield_return(self:ChangeAvatar("Anbo"))
		yield_return(self.base:RunGM("WUDI ON"))
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))

		local attackCount = self.doSkillCount
		while attackCount > 0 do
			yield_return(CS.UnityEngine.WaitForSeconds(self.doSkillWait))
			yield_return(self.base:Skill(0))
			attackCount = attackCount - 1
		end
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.DoSkill1 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "小技能1-娃娃",
	Action = UAutoCoroutine(function()
		yield_return(CS.UnityEngine.WaitForSeconds(self.caseWait))
		yield_return(self.base:Skill(1, false))
		yield_return(CS.UnityEngine.WaitForSeconds(2))
		yield_return(self.base:SkillUp(1))
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.DoSkill4 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "充能技",
	Action = UAutoCoroutine(function()
		yield_return(CS.UnityEngine.WaitForSeconds(self.caseWait))
		yield_return(self.base:Skill(4))
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.DoSkill01 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "加强普攻（瞄准射击）",
	Action = UAutoCoroutine(function()
		yield_return(CS.UnityEngine.WaitForSeconds(self.caseWait))
		yield_return(self.base:Skill(0, false))
		yield_return(CS.UnityEngine.WaitForSeconds(2))
		yield_return(self.base:SkillUp(0))

		yield_return(self.base:Skill(0))
	end)
}


return self
