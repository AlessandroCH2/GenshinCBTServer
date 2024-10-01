local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("ElementBase", baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "ElementBase"
self.base = TestCaseElementBaseClass()

-- c#中写了120，这边先写着不改
self.FindTimeOut = 120
self.Range = 3

self.WaterPos = "2735.608 194.2695 -1718.194"
self.WaterPosVec = CS.UnityEngine.Vector3(2735.608, 194.2695, -1718.194)

self.WaterPos1 = "2731.309 194.2681 -1716.102"
self.WaterPosVec1 = CS.UnityEngine.Vector3(2731.309, 194.2681, -1716.102)

self.GrassPos = "1955.741 196.5956 -1298.704"
self.GrassPosVec = CS.UnityEngine.Vector3(1955.741, 196.5956, -1298.704)

-- self.sandPos = "2755.103 194.8858 -5811.606"
-- self.sandPosVec = CS.UnityEngine.Vector3(2755.103, 194.8858, -5811.606)


self.MonsterInfoTitle = {"element", "id", "keyword", "fatrange"}
self.MonsterArray = {}
table.insert(self.MonsterArray, {"Water", 20011101, "Slime_Water_03", 3})
table.insert(self.MonsterArray, {"Water", 20011001, "Slime_Water_02", 1})
-- table.insert(self.MonsterArray, {"Water", 22010301, "Abyss_Water_01", 3})
-- table.insert(self.MonsterArray, {"Water", 21030101, "Shaman_Water_01", 1})
table.insert(self.MonsterArray, {"Ice", 20010901, "Slime_Ice_03", 3})
-- table.insert(self.MonsterArray, {"Ice", 20010801, "Slime_Ice_02", 1})
-- table.insert(self.MonsterArray, {"Ice", 22010201, "Abyss_Ice_01", 3})
table.insert(self.MonsterArray, {"Fire", 20011301, "Slime_Fire_03", 3})
table.insert(self.MonsterArray, {"Fire", 20011201, "Slime_Fire_02", 1})
-- table.insert(self.MonsterArray, {"Fire", 22010101, "Abyss_Fire_01", 3})
table.insert(self.MonsterArray, {"Electric", 20010601, "Slime_Electric_03", 3})
table.insert(self.MonsterArray, {"Electric", 20010701, "Slime_Electric_03_Positive", 3})
table.insert(self.MonsterArray, {"Electric", 20010501, "Slime_Electric_02", 1})
table.insert(self.MonsterArray, {"Grass", 20010101, "Slime_Grass_02", 1})
table.insert(self.MonsterArray, {"Grass", 20010201, "Slime_Grass_03", 3})
-- table.insert(self.MonsterArray, {"Grass", 21030201, "Shaman_Grass_01", 1})
table.insert(self.MonsterArray, {"Rock", 20011501, "Slime_Rock_03", 3})
-- table.insert(self.MonsterArray, {"Rock", 20011401, "Slime_Rock_02", 1})


self.GadgetInfoTitle = {"element", "type", "id", "campid", "keyword", "owner", "otherinfo"}
self.GadgetArray = {}
-- table.insert(self.GadgetArray, {"Grass", "AvatarWeapon", 50010007, 0, "Equip_Sword_Wooden", "Ayaka", 10011})
table.insert(self.GadgetArray, {"Grass", "MonsterWeapon", 50004002, 0, "MonEquip_Shield_01", 21010301, ""})
table.insert(self.GadgetArray, {"Grass", "MonsterWeapon", 50004012, 0, "MonEquip_Shield_02", 21020101, ""})
table.insert(self.GadgetArray, {"Grass", "Item", 70220003, 5001, "Item_BrambleWall01", "", ""})
table.insert(self.GadgetArray, {"Grass", "Item", 70220005, 5001, "Item_Bombbarrel01", "", ""})


function self:GetArray(title, array)
	local rsArray = {}

	for i, content in pairs(array) do
		local tmpDic = {}
		for j = 1, #title do
			-- title里有的内容，array里必须有
			tmpDic[title[j]] = content[j]
		end
		table.insert(rsArray, tmpDic)
	end

	return rsArray
end

function self:GetMatchArray(t, k, v)
	local rsArray = {}

	for i, item in pairs(t) do
		if(item[k] == v) then
			table.insert(rsArray, item)
		end
	end
	
	return rsArray
end


function self:GetMonsterArrayByElement(element)
	local rsArray = self:GetArray(self.MonsterInfoTitle, self.MonsterArray)
	return self:GetMatchArray(rsArray, "element", element)
end

function self:GetOneMonsterByElement(element)
	return self:GetMonsterArrayByElement(element)[1]
end

function self:GetGadgetArrayByElement(element)
	local rsArray = self:GetArray(self.GadgetInfoTitle, self.GadgetArray)
	return self:GetMatchArray(rsArray, "element", element)
end

function self:GetAvatarWeaponArrayByElement(element)
	local gadgetArray = self:GetGadgetArrayByElement(element)
	return self:GetMatchArray(gadgetArray, "type", "AvatarWeapon")
end

function self:GetOneAvatarWeaponByElement(element)
	return self:GetAvatarWeaponArrayByElement(element)[1]
end

function self:GetMonsterWeaponArrayByElement(element)
	local gadgetArray = self:GetGadgetArrayByElement(element)
	return self:GetMatchArray(gadgetArray, "type", "MonsterWeapon")
end

function self:GetOneMonsterWeaponByElement(element)
	return self:GetMonsterWeaponArrayByElement(element)[1]
end

function self:GetItemArrayByElement(element)
	local gadgetArray = self:GetGadgetArrayByElement(element)
	return self:GetMatchArray(gadgetArray, "type", "Item")
end

function self:GetOneItemByElement(element)
	return self:GetItemArrayByElement(element)[1]
end


local windEntityNum = 0
function self:GetWindEntityCount()
	windEntityNum = self.base:GetEntityCount("Eff_WindField_FireGrass")
end

function self:CheckWindEntityCount(signal)
	local tmp = self.base:GetEntityCount("Eff_WindField_FireGrass")
	if(signal == "-") then
		assert(tmp < windEntityNum, "风场未移除！")
		windEntityNum = tmp
	end
	if(signal == "+") then
		assert(tmp > windEntityNum, "风场未出现！")
		windEntityNum = tmp
	end
end


return self
