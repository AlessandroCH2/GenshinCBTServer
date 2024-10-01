--baseClass提供基础接口
local baseClass = require('UAuto/TestCases/Number/NumberBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("AvatarWeaponTest",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "AvatarWeaponTest"
self.Category = "数值"
self.Description="武器升级数值验证"


local avatarLevel=1
local avatarPromoteLevel = 0
local step=10

function self:CheckWeaponByType(weaponId, promoteLevel, level, type) 
	local weaponData = self.base:GetAvatarWeaponData(type)
	yield_return(self.base:WaitFrames(5))
	local checkPassed = self.base:CheckAvatarWeaponByLevel(promoteLevel,level,weaponData,weaponId,type)
	assert(checkPassed,"武器"..type:EnumToString().."数值验证失败")
end

function self:WeaponCheck(weaponId, promoteLevel, level)

	yield_return(CS.UnityEngine.WaitForSeconds(1))

	self:CheckWeaponByType(weaponId, promoteLevel, level, CS.MoleMole.Config.FightPropType.FIGHT_PROP_BASE_ATTACK)
	self:CheckWeaponByType(weaponId, promoteLevel, level, CS.MoleMole.Config.FightPropType.FIGHT_PROP_CRITICAL)
	
	self:CheckWeaponByType(weaponId, promoteLevel, level, CS.MoleMole.Config.FightPropType.FIGHT_PROP_CRITICAL_HURT)
	
	self:CheckWeaponByType(weaponId, promoteLevel, level, CS.MoleMole.Config.FightPropType.FIGHT_PROP_CHARGE_EFFICIENCY)

	local avatarAttack = self.base:GetFloatPropertyValue("attackBase")
	local checkPassed = self.base:CheckAvatarAttackByLevel(avatarPromoteLevel,avatarLevel,avatarAttack)

	assert(checkPassed,"武器装备角色验证数值失败")
	
	yield_return(CS.UnityEngine.WaitForEndOfFrame())
	
end

local weaponList = {"11101","11201","11301","11302","11401","11402","11403","11404","11501","11502","11503"}

self.SwordCheck = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description="各种剑类武器升级突破数值验证测试(使用绫华装备)",
	Action = UAutoCoroutine(function()
		yield_return(self:ChangeAvatar("Ayaka"))
		yield_return(self.base:RunGM("Player Level 70"))
		yield_return(self.base:RunGM("break "..avatarPromoteLevel))
		yield_return(self.base:RunGM("level "..avatarLevel))
		yield_return(CS.UnityEngine.WaitForEndOfFrame())
		local gmCmd =""



		for key,weaponId in ipairs(weaponList) do
		
			for i=1,20,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,0,i))
			end
	
			for i=20,40,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 1"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,1,i))
			end
	
			for i=40,60,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 2"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,2,i))
			end
	
			for i=60,80,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 3"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,3,i))
			end
	
			for i=80,90,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 4"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,4,i))
			end
		end
	end)
}

local weaponList = {"12101","12201","12301","12302","12303","12401","12403","12404"}

self.ClaymoreCheck = {
	Order = 1.5,
	Type = CaseType.MonoTest,
	Description="大剑类武器升级突破数值验证测试(使用迪卢克装备)",
	Action = UAutoCoroutine(function()
		yield_return(self:ChangeAvatar("Diluc"))
		yield_return(self.base:RunGM("break "..avatarPromoteLevel))
		yield_return(self.base:RunGM("level "..avatarLevel))
		yield_return(CS.UnityEngine.WaitForEndOfFrame())
		local gmCmd =""


		for key,weaponId in ipairs(weaponList) do
			--weaponId = tostring(tonumber(weaponId)+1000)
			for i=1,20,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,0,i))
			end
	
			for i=20,40,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 1"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,1,i))
			end
	
			for i=40,60,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 2"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,2,i))
			end
	
			for i=60,80,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 3"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,3,i))
			end
	
			for i=80,90,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 4"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,4,i))
			end
		end
	end)
}


local weaponList = {"14101","14201","14301","14302","14401","14403","14404","14501"}

self.CatalystCheck = {
	Order = 2,
	Type = CaseType.MonoTest,
	Description="法器类武器升级突破数值验证测试(使用丽莎装备)",
	Action = UAutoCoroutine(function()
		yield_return(self:ChangeAvatar("Lisa"))
		yield_return(self.base:RunGM("Player Level 70"))
		yield_return(self.base:RunGM("break "..avatarPromoteLevel))
		yield_return(self.base:RunGM("level "..avatarLevel))
		yield_return(CS.UnityEngine.WaitForEndOfFrame())
		local gmCmd =""


		for key,weaponId in ipairs(weaponList) do
			--weaponId = tostring(tonumber(weaponId)+3000)
			for i=1,20,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,0,i))
			end
	
			for i=20,40,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 1"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,1,i))
			end
	
			for i=40,60,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 2"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,2,i))
			end
	
			for i=60,80,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 3"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,3,i))
			end
	
			for i=80,90,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 4"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,4,i))
			end
		end
	end)
}


local weaponList = {"15101","15201","15301","15302","15401","15501"}

self.BowCheck = {
	Order = 4,
	Type = CaseType.MonoTest,
	Description="弓类武器升级突破数值验证测试(使用安柏装备)",
	Action = UAutoCoroutine(function()
		yield_return(self:ChangeAvatar("Anbo"))
		yield_return(self.base:RunGM("break "..avatarPromoteLevel))
		yield_return(self.base:RunGM("level "..avatarLevel))
		yield_return(CS.UnityEngine.WaitForEndOfFrame())
		local gmCmd =""


		for key,weaponId in ipairs(weaponList) do
			--weaponId = tostring(tonumber(weaponId)+4000)
			for i=1,20,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,0,i))
			end
	
			for i=20,40,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 1"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,1,i))
			end
	
			for i=40,60,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 2"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,2,i))
			end
	
			for i=60,80,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 3"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,3,i))
			end
	
			for i=80,90,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 4"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,4,i))
			end
		end
	end)
}

local weaponList = {"13101","13201","13301","13302","13401","13504"}

self.PoleCheck = {
	Order = 5,
	Type = CaseType.MonoTest,
	Description="枪类武器升级突破数值验证测试(使用香菱装备)",
	Action = UAutoCoroutine(function()
		yield_return(self:ChangeAvatar("Xiangling"))
		yield_return(self.base:RunGM("break "..avatarPromoteLevel))
		yield_return(self.base:RunGM("level "..avatarLevel))
		yield_return(CS.UnityEngine.WaitForEndOfFrame())
		local gmCmd =""


		for key,weaponId in ipairs(weaponList) do
			--weaponId = tostring(tonumber(weaponId)+2000)
			for i=1,20,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,0,i))
			end
	
			for i=20,40,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 1"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,1,i))
			end
	
			for i=40,60,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 2"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,2,i))
			end
	
			for i=60,80,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 3"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,3,i))
			end
	
			for i=80,90,step do
				gmCmd = "EQUIP ADD "..weaponId.." "..i .. " 4"
				yield_return(self.base:RunGM(gmCmd))
				yield_return(self:WeaponCheck(weaponId,4,i))
			end
		end
	end)
}


return self