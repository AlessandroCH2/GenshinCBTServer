local baseClass = require("UAuto/Base/UAutoLuaTestBase")
local UAutoLuaTestCase = class("CombatBase", baseClass)
local self = UAutoLuaTestCase
self.base = TestCaseCombatBase()
self.TestFixture = "CombatBase"

self.safePos = "1955.741 196.5956 -1298.704"
self.center = CS.UnityEngine.Vector3(1955.741, 196.5956, -1298.704)
self.doSkillCount = 10
self.doSkillWait = 0.2
self.caseWait = 5
self.entityManager = singletonManager:GetSingletonInstance("MoleMole.EntityManager")
self.monsterIdx=0

self.MonsterPeers= {
	{21010101,"Hili_None_01"},
	{21020101,"Brute_None_Shield"},
	{21020201,"Brute_None_Axe"},
	{20010101,"Slime_Grass_02"},
	{20010201,"Slime_Grass_03"},
	{20010301,"Slime_Wind_02"},
	{20010401,"Slime_Wind_03"},
	{20010501,"Slime_Electric_02"},
	{20010601,"Slime_Electric_03"},
	{20010701,"Slime_Electric_03_Positive"},
	{20010801,"Slime_Ice_02"},
	{20010901,"Slime_Ice_03"},
	{20011001,"Slime_Water_02"},
	{20011101,"Slime_Water_03"},
	{21010201,"Hili_None"},
	{21010301,"Hili_None"},
	{21010401,"Hili_None"},
	{21010501,"Hili_Fire"},
	{21010601,"Hili_Fire"},
	{21010701,"Hili_Fire"},
	{21010901,"Hili_Ice"},
	{21011001,"Hili_Electric"},
	{20011201,"Slime_Fire"},
	{20011301,"Slime_Fire"},
	{20011401,"Slime_Rock"},
	{20011501,"Slime_Rock"},
	{22010101,"Abyss_Fire"},
	{22010201,"Abyss_Ice"},
	{22010301,"Abyss_Water"},
	{21030101,"Shaman_Water"},
	{21030201,"Shaman_Grass"},
	{21030301,"Shaman_Wind"},
	{23040101,"Defender_None"},
}


self.MonsterPeersInHit= {
	{21010101,"Hili_None_01"},
	{21020101,"Brute_None_Shield"},
	{20010301,"Slime_Wind_02"},
	{21010501,"Hili_Fire"},
	{22010101,"Abyss_Fire"},
	{21030101,"Shaman_Water"},
}

self.Avatars={"Anbo","Ayaka","Barbara","Diluc","Kaeya","Lisa","PlayerBoy","PlayerGirl","Qin","Razor","Venti","Xiangling"}
--girl Male Lady Boy
self.BeHitAvatars={"Anbo","Diluc","Lisa","Razor"}

--self.Avatars={"Anbo"}



function self:CreateMonsters()
	self.base:MonsterAI(false)
	for idx,monsterPeer in ipairs(self.MonsterPeersInHit) do
		self.MonsterId = monsterPeer[1]
		self.MonsterKeyWord = monsterPeer[2]
		self.base:CreateMonsterByAngle(self.MonsterId, (10 * idx % 360))
	end
end

function self:SetAvatarPos(pos)
	local entityManager = singletonManager:GetSingletonInstance("MoleMole.EntityManager")
	local localAvatar = entityManager:GetLocalAvatarEntity()
	localAvatar:SetPosition(pos)
end


function self:MonsterRefocus()
	self:SetAvatarPos(self.center)
	yield_return(self:WaitFoundEntityById(self.MonsterId))
	yield_return(self.base:MoveToPosition(self.foundEntity.transform.position,30,4))
	yield_return(self.base:RotateCamera(self.foundEntity.transform.position))
	self.base:SetCheckMonster(self.foundEntity.runtimeID)
end

return self