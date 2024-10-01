--baseClass提供基础接口
local baseClass = require('UAuto/TestCases/Online/OnlineBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("OnlineAddClient",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "OnlineAddClient"
self.Category = "联机"
self.Description="联机增加一台客机进入本机"



self.GetUserId = {
	Order = 0.1,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="增加一个远程玩家，并传送到主机身边",
	Action = UAutoCoroutine(function()
		yield_return(self:FinishAllNoob())
		self.base:SetUpUserId()

	end)
}


self.AddClient = {
	Order = 0.2,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="增加一个远程玩家，并传送到主机身边",
	Action = UAutoCoroutine(function()
		yield_return(self.base:SetUpUserID(self.base.driver.HostUserId))
		yield_return(self:FinishAllNoob())
		local cmd ="enter " .. self.base.driver.HostUserId
		yield_return(self.base:RunGM(cmd))
		yield_return(self.base:RunGM("wudi on"))
		yield_return(self.base:Jump())
		yield_return(CS.UnityEngine.WaitForSeconds(3))
		yield_return(self.base:Jump())
		yield_return(CS.UnityEngine.WaitForSeconds(3))
	end)
}



return self