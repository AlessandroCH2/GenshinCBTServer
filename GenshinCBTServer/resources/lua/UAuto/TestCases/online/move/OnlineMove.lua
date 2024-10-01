--baseClass提供基础接口
local baseClass = require('UAuto/TestCases/Online/OnlineBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("OnlineMove",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "OnlineMove"
self.Category = "联机"
self.Description="联机角色移动"


self.endPoint = CS.UnityEngine.Vector3(2786.4963, 197.7144,-1734.688)
self.startPointStr = "2821.3571 211.1067 -1720.1761"
self.startPointStr2 = "2819.522 206.2345 -1727.416"
self.startPoint2 = CS.UnityEngine.Vector3(2819.522,206.2345,-1727.416)
self.startPoint = CS.UnityEngine.Vector3(2821.3571,211.1067,-1720.1761)
self.endPoint2 = CS.UnityEngine.Vector3(2792.585,197.788,-1736.934)



self.SetUpHost = {
	Order = 1,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="初始化主机位置",
	Action = UAutoCoroutine(function()
		yield_return(self.base:Jump())
		yield_return(CS.UnityEngine.WaitForSeconds(3))
		yield_return(self.base:TelePort(self.startPoint))
		yield_return(self.base:Jump())
		yield_return(CS.UnityEngine.WaitForSeconds(3))
	end)
}

self.SetUpClient = {
	Order = 2,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="初始化客机位置",
	Action = UAutoCoroutine(function()
		yield_return(self.base:Jump())
		yield_return(CS.UnityEngine.WaitForSeconds(3))
		yield_return(self.base:TelePort(self.startPoint2))
		yield_return(self.base:Jump())
		yield_return(CS.UnityEngine.WaitForSeconds(3))
	end)
}





self.ClientMove = {
	Order = 4,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="客机移动到某点",
	Action = UAutoCoroutine(function()
		yield_return(self.base:MoveToPosition(self.endPoint))
		yield_return(self.base:Jump())
	end)
}

self.CheckClientPosition = {
	Order = 5,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="主机检查客机是否移动到位",
	Action = UAutoCoroutine(function()
		yield_return(self:CheckRemoteAvatarPosition(self.endPoint))
		print(self.remote.transform.position)
		yield_return(self.base:Jump())
	end)
}

self.HostMove = {
	Order = 6,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Host,
	Description="主机移动到某点",
	Action = UAutoCoroutine(function()
		yield_return(self.base:MoveToPosition(self.endPoint2))
		yield_return(self.base:Jump())
	end)
}

self.CheckHostPosition = {
	Order = 7,
	Type = CaseType.MonoTest,
	RunMode = RunMode.Client,
	Description="客机检查主机是否移动到位",
	Action = UAutoCoroutine(function()
		yield_return(self:CheckRemoteAvatarPosition(self.endPoint2))
		print(self.remote.transform.position)
		yield_return(self.base:Jump())
	end)
}

return self