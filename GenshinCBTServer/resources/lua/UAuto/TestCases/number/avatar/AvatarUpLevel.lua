--baseClass提供基础接口
local baseClass = require('UAuto/TestCases/Number/NumberBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("AvatarUpLevel",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "AvatarUpLevel"
self.Category = "数值"
self.Description="角色升级数值验证"

local upLevelStep=3
function self:UpLevelCheck(avatarName)
	yield_return(self:ChangeAvatar(avatarName))
	--突破等级
	for promoteLevel=0,4 do
		local startLevel=1
		local endLevel=20
		--根据突破等级设置升级上下限
		if promoteLevel==0 then
			startLevel=1
			endLevel=20
		elseif promoteLevel==1 then
			startLevel=20
			endLevel=40		
		elseif promoteLevel==2 then
			startLevel=40
			endLevel=60		
		elseif promoteLevel==3 then
			startLevel=60
			endLevel=80
		elseif promoteLevel==4 then
			startLevel=80
			endLevel=90	
		end
		--突破
		yield_return(self.base:RunGM("break "..promoteLevel))
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		--1~20级
		for level=startLevel,endLevel,upLevelStep do
			yield_return(self.base:RunGM("level "..level))
			yield_return(self.base:WaitIntProperty("level",level))
			local maxHP = self.base:GetFloatPropertyValue("maxHP")
			local attackBase = self.base:GetFloatPropertyValue("attackBase")
			local defenseBase = self.base:GetFloatPropertyValue("defenseBase")
			local level = self.base:GetIntPropertyValue("level")
			self.base:CheckAvatarMaxHPByLevel(promoteLevel,level,maxHP)
			self.base:CheckAvatarAttackByLevel(promoteLevel, level, attackBase)
			self.base:CheckAvatarDefenseByLevel(promoteLevel, level, defenseBase)
			yield_return(CS.UnityEngine.WaitForEndOfFrame())
		end
	end
end


self.Setup = {
	Order = 0.1,
	Type = CaseType.MonoTest,
	Description="clear all，完成所有新手任务",
	Action = UAutoCoroutine(function()
		yield_return(self:FinishAllNoob())
		yield_return(self.base:RunGM("Player Level 70"))
	end)
}


self.PlayerGirlUpCheck = {
	Order = 0.5,
	Type = CaseType.MonoTest,
	Description="女主仅装备新手武器，各等级最大血量，基础攻击成长曲线数值测试",
	Action = UAutoCoroutine(function()
		yield_return(self:UpLevelCheck("PlayerGirl"))
	end)
}

self.AyakaLevelUpCheck = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description="绫华仅装备新手武器，各等级最大血量，基础攻击成长曲线数值测试",
	Action = UAutoCoroutine(function()
		yield_return(self:UpLevelCheck("Ayaka"))
	end)
}


self.AnboLevelUpCheck = {
	Order = 2,
	Type = CaseType.MonoTest,
	Description="安柏仅装备新手武器，各等级最大血量，基础攻击成长曲线数值测试",
	Action = UAutoCoroutine(function()
		yield_return(self:UpLevelCheck("Anbo"))
	end)
}


self.BarbaraLevelUpCheck = {
	Order = 3,
	Type = CaseType.MonoTest,
	Description="芭芭拉仅装备新手武器，各等级最大血量，基础攻击成长曲线数值测试",
	Action = UAutoCoroutine(function()
		yield_return(self:UpLevelCheck("Barbara"))
	end)
}


self.KaeyaLevelUpCheck = {
	Order = 4,
	Type = CaseType.MonoTest,
	Description="凯亚仅装备新手武器，各等级最大血量，基础攻击成长曲线数值测试",
	Action = UAutoCoroutine(function()
		yield_return(self:UpLevelCheck("Kaeya"))
	end)
}


self.LisaLevelUpCheck = {
	Order = 5,
	Type = CaseType.MonoTest,
	Description="丽莎仅装备新手武器，各等级最大血量，基础攻击成长曲线数值测试",
	Action = UAutoCoroutine(function()
		yield_return(self:UpLevelCheck("Lisa"))
	end)
}


self.QinLevelUpCheck = {
	Order = 6,
	Type = CaseType.MonoTest,
	Description="琴仅装备新手武器，各等级最大血量，基础攻击成长曲线数值测试",
	Action = UAutoCoroutine(function()
		yield_return(self:UpLevelCheck("Qin"))
	end)
}

self.DilucLevelUpCheck = {
	Order = 7,
	Type = CaseType.MonoTest,
	Description="迪卢克仅装备新手武器，各等级最大血量，基础攻击成长曲线数值测试",
	Action = UAutoCoroutine(function()
		yield_return(self:UpLevelCheck("Diluc"))
	end)
}

self.RazorLevelUpCheck = {
	Order = 8,
	Type = CaseType.MonoTest,
	Description="雷泽仅装备新手武器，各等级最大血量，基础攻击成长曲线数值测试",
	Action = UAutoCoroutine(function()
		yield_return(self:UpLevelCheck("Razor"))
	end)
}

self.VentiLevelUpCheck = {
	Order = 9,
	Type = CaseType.MonoTest,
	Description="温迪仅装备新手武器，各等级最大血量，基础攻击成长曲线数值测试",
	Action = UAutoCoroutine(function()
		yield_return(self:UpLevelCheck("Venti"))
	end)
}


self.XianglingLevelUpCheck = {
	Order = 10,
	Type = CaseType.MonoTest,
	Description="香菱仅装备新手武器，各等级最大血量，基础攻击成长曲线数值测试",
	Action = UAutoCoroutine(function()
		yield_return(self:UpLevelCheck("Xiangling"))
	end)
}



return self