--baseClass提供基础接口
local baseClass = require('UAuto/TestCases/Number/NumberBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("AvatarTalent",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "AvatarTalent"
self.Category = "数值"
self.Description="角色数值型天赋验证"

function self:CheckTalent(avatar, talentIDList)

	yield_return(self:ChangeAvatar(avatar,true))
	local baseHP = self.base:GetFloatPropertyValue("maxHP")
	self.base:SetAvatarHpBase(baseHP)

	for i = 1, #talentIDList do 
		local id = talentIDList[i]
		local cmd = "talent unlock "..tostring(id)
		local combatPropertyBefore = self.base:GetEntityCombatProperty()
		yield_return(self.base:RunGM(cmd))
		yield_return(self.base:CheckAvatarTalent(combatPropertyBefore,id,0))
	end
	
end


self.AnboTalentCheck = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description="安柏天赋验证",
	Action = UAutoCoroutine(function()
		yield_return(self:FinishAllNoob())
		local avatar="Anbo"
		local TalentIds={1000,1001,1002,1003}
		self:CheckTalent(avatar, TalentIds)
	end)
}


self.LisaTalentCheck = {
	Order = 2,
	Type = CaseType.MonoTest,
	Description="丽莎天赋验证",
	Action = UAutoCoroutine(function()
		local avatar="Lisa"
		local TalentIds={1100,1101,1102,1103}
		self:CheckTalent(avatar, TalentIds)
	end)
}

self.KeayaTalentCheck = {
	Order = 3,
	Type = CaseType.MonoTest,
	Description="凯亚天赋验证",
	Action = UAutoCoroutine(function()
		local avatar="Kaeya"
		local TalentIds={1050,1051,1052,1053}
		self:CheckTalent(avatar, TalentIds)
	end)
}

self.QinTalentCheck = {
	Order = 4,
	Type = CaseType.MonoTest,
	Description="琴天赋验证",
	Action = UAutoCoroutine(function()
		local avatar="Qin"
		local TalentIds={1300,1301,1302,1303,1330,1331,1332}
		self:CheckTalent(avatar, TalentIds)
	end)
}

-- self.DilucTalentCheck = {
-- 	Order = 5,
-- 	Type = CaseType.MonoTest,
-- 	Description="迪卢克天赋验证",
-- 	Action = UAutoCoroutine(function()
-- 		local avatar="Diluc"
-- 		local TalentIds={1400,1401,1402,1403,1420,1421,1422}
-- 		self:CheckTalent(avatar, TalentIds)
-- 	end)
-- }



self.PlayerGirlTalentCheck = {
	Order = 6,
	Type = CaseType.MonoTest,
	Description="女主天赋验证",
	Action = UAutoCoroutine(function()
		local avatar="PlayerGirl"
		yield_return(self:ChangeAvatar(avatar,true))
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		yield_return(self.base:RunGM("skill depot 704"))
		local TalentIds={1481,1482,1483,1484}
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		self:CheckTalent(avatar, TalentIds)
	end)
}



self.BarbaraTalentCheck = {
	Order = 7,
	Type = CaseType.MonoTest,
	Description="芭芭拉天赋验证",
	Action = UAutoCoroutine(function()
		local avatar="Barbara"
		local TalentIds={1560,1561,1562}
		self:CheckTalent(avatar, TalentIds)
	end)
}


self.RazorTalentCheck = {
	Order = 8,
	Type = CaseType.MonoTest,
	Description="雷泽天赋验证",
	Action = UAutoCoroutine(function()
		local avatar="Razor"
		local TalentIds={2011,2012,2013,2014}
		self:CheckTalent(avatar, TalentIds)
	end)
}

self.VentiTalentCheck = {
	Order = 9,
	Type = CaseType.MonoTest,
	Description="温迪天赋验证",
	Action = UAutoCoroutine(function()
		local avatar="Venti"
		local TalentIds={2211,2212}
		self:CheckTalent(avatar, TalentIds)
	end)
}


self.XianglingTalentCheck = {
	Order = 10,
	Type = CaseType.MonoTest,
	Description="香菱天赋验证",
	Action = UAutoCoroutine(function()
		local avatar="Xiangling"
		local TalentIds={2311,2312,2313,2314}
		self:CheckTalent(avatar, TalentIds)
	end)
}



return self