local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("OnlineBase",baseClass)
UAutoLuaTestCase.TestFixture = "OnlineBase"

UAutoLuaTestCase.base = TestCaseNetworkBaseClass()

--setmetatable(UAutoLuaTestCase,{ __index = UAutoLuaTestCase.base })

local self = UAutoLuaTestCase

self.hostStartPos = "1955.741 196.5956 -1298.704"
self.clientPointStr = "1962.768 197.9143 -1306.191"
self.hostStartPosVec = CS.UnityEngine.Vector3(1955.741,196.5956,-1298.704)
self.clientPointVec = CS.UnityEngine.Vector3(1962.768,197.9143,-1306.191) 


function self:GetRemoteAvatar()
	local entityManager = singletonManager:GetSingletonInstance("MoleMole.EntityManager")
	local Avatars = entityManager:GetAllAvatars()
	for k,v in pairs(Avatars) do
		if v.isAuthority==false and v:IsActive() then
			return Avatars[k]
		end
	end
	return nil
end

function self:GetLocalAvatar()
	local entityManager = singletonManager:GetSingletonInstance("MoleMole.EntityManager")
	local Avatars = entityManager:GetAllAvatars()
	for k,v in pairs(Avatars) do
		if v.isAuthority==true and v:IsActive() then
			return Avatars[k]
		end
	end
	return nil
end

function self:CheckPosition()
	return true
end

function self:CheckEffect(localCount, RemoteCount)
	localCount = localCount or 0
	RemoteCount = RemoteCount or 0
	self.remoteAvater = self:GetRemoteAvatar()
	self.EffectManager = singletonManager:GetSingletonInstance("MoleMole.EffectManager")
	self.MonoEffectList = self.EffectManager:GetEffectsByOwner(self.remoteAvater.runtimeID)
	self.LocalMonoEffectList = self.EffectManager:GetEffectsByOwner(self.base.avatar.runtimeID)
	print("local:" .. tostring(self.LocalMonoEffectList.Count))
	assert(self.LocalMonoEffectList.Count==localCount,"local avatar特效数量不正确")

	if(self.MonoEffectList.Count>=RemoteCount) then
		return true
	else
		return false
	end
end

function self:CheckAnimation()
	return true
end

function self:CheckState()
	return true
end

function self:CheckRemoteAvatar(name)
	self.remote = self:GetRemoteAvatar()
	if self.remote~=nil then
		if string.find(self.remote.gameObject.name,name) then
			print(name.." Checked.") 
			return true
		end
	end
	return false
end

function self:CheckRemoteAvatarPosition(endPosition)
	self.endPoint = endPosition
	self.remote = self:GetRemoteAvatar()
	assert(self.remote~=nil,"远程玩家未找到")
	local timeout=500
	local timePassed=0
	while CS.UnityEngine.Vector3.Distance(self.remote.transform.position,self.endPoint) > 1 do
		timePassed = timePassed + CS.UnityEngine.Time.deltaTime
		assert(timeout>0,"远程玩家位置未在500ms内同步到主机,实际耗时:"..timePassed)
		yield_return(CS.UnityEngine.WaitForSeconds(0.01))
		timeout = timeout-10
	end
end

return self