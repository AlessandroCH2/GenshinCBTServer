--baseClass提供基础接口
local baseClass = require('UAuto/TestCases/Online/OnlineBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("OnlineChangeAvatar",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "OnlineChangeAvatar"
self.Category = "联机"
self.Description="联机切换角色"

self.startPointStr = "2821.3571 211.1067 -1720.1761"
self.startPointStr2 = "2823.3571 215.1067 -1720.1761"





self.ClientCheckHostAvatar = {
	Order = 1,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	IsSync = IsSync.False,
	Description="客机验证主机切换角色",
	Action = UAutoCoroutine(function()
		local timeout = 120
		local ambor=false
		local ayaka=false
		local qin=false
		local lisa=false
		while ambor==false or ayaka==false or qin==false or lisa==false do
			if self:CheckRemoteAvatar("Ambor") then
				ambor=true
			end
			if self:CheckRemoteAvatar("Ayaka") then 
				ayaka=true
			end
			if self:CheckRemoteAvatar("Qin") then 
				qin=true
			end
			if self:CheckRemoteAvatar("Lisa") then 
				lisa=true
			end
			yield_return(CS.UnityEngine.WaitForSeconds(0.1))
			timeout = timeout-0.1
			local log = " 安柏: "..tostring(ambor).." 绫华: "..tostring(ayaka).." 琴: "..tostring(qin).." 丽莎: "..tostring(lisa)
			assert(timeout>0,"客机验证切换角色失败 "..log)
		end
	end)
}

self.HostChangeAvatar = {
	Order = 2,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="主机切换角色",
	Action = UAutoCoroutine(function()
		yield_return(self:ChangeAvatar("Anbo"))
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		yield_return(self:ChangeAvatar("Ayaka"))
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		yield_return(self:ChangeAvatar("Qin"))
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		yield_return(self:ChangeAvatar("Lisa"))
	end)
}

self.ClientChangeAvatar = {
	Order = 3,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="客机切换角色",
	IsSync = IsSync.False,
	Action = UAutoCoroutine(function()
		yield_return(self:ChangeAvatar("Anbo"))
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		yield_return(self:ChangeAvatar("Ayaka"))
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		yield_return(self:ChangeAvatar("Qin"))
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		yield_return(self:ChangeAvatar("Lisa"))
	end)
}

self.HostCheckClientAvatar = {
	Order = 4,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="主机验证客机切换角色",
	Action = UAutoCoroutine(function()
		local timeout = 120
		local ambor=false
		local ayaka=false
		local qin=false
		local lisa=false
		while ambor==false or ayaka==false or qin==false or lisa==false do
			if self:CheckRemoteAvatar("Ambor") then
				ambor=true
			end
			if self:CheckRemoteAvatar("Ayaka") then 
				ayaka=true
			end
			if self:CheckRemoteAvatar("Qin") then 
				qin=true
			end
			if self:CheckRemoteAvatar("Lisa") then 
				lisa=true
			end
			yield_return(CS.UnityEngine.WaitForSeconds(0.1))
			timeout = timeout-0.1
			local log = " 安柏: "..tostring(ambor).." 绫华: "..tostring(ayaka).." 琴: "..tostring(qin).." 丽莎: "..tostring(lisa)
			assert(timeout>0,"主机验证切换角色失败 "..log)
		end

	end)
}

return self