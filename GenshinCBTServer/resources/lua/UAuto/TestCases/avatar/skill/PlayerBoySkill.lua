local baseClass = require("UAuto/TestCases/Avatar/Skill/AvatarSkillBase")
local UAutoLuaTestCase = class("PlayerBoySkill", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "PlayerBoySkill"
self.Category = "角色技能"
self.Description = "男主角色技能"

self.OrderIndex = 0;

self.OrderIndex = self.OrderIndex + 1;
self.DoSkill00 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "普攻",
	Action = UAutoCoroutine(function()
		yield_return(CS.UnityEngine.WaitForSeconds(self.caseWait))
		yield_return(self.base:RunGM("goto "..self.safePos, true, true))
		yield_return(self:ChangeAvatar("PlayerBoy"))
		yield_return(self.base:RunGM("WUDI ON"))
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		yield_return(self.base:RunGM("skill depot 504"))
		local attackCount = self.doSkillCount
		while attackCount > 0 do
			yield_return(CS.UnityEngine.WaitForSeconds(self.doSkillWait))
			yield_return(self.base:Skill(0))
			attackCount = attackCount - 1
		end
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.DoSkill01 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "加强普攻",
	Action = UAutoCoroutine(function()
		yield_return(CS.UnityEngine.WaitForSeconds(self.caseWait))
		yield_return(self.base:Skill(0, false))
		yield_return(CS.UnityEngine.WaitForSeconds(2))
		yield_return(self.base:SkillUp(0))
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.DoSkill10 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "小技能1-风球",
	Action = UAutoCoroutine(function()
		yield_return(CS.UnityEngine.WaitForSeconds(self.caseWait))
		yield_return(self.base:Skill(1))
	end)
}

self.OrderIndex = self.OrderIndex + 1;
self.DoSkill11 = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "加强小技能1-风球",
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


return self
