--baseClass提供基础接口
local baseClass = require('UAuto/TestCases/Scene/SceneBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("CheckStreaming",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "CheckStreaming"
self.Category = "场景"
self.Description="Streaming测试"


self.Step1 = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description = "打射线检测各地块是否存在",
	Action = UAutoCoroutine(function()
		yield_return(self.base:EnterStreaming())
		yield_return(self.base:StreamingRaycastCheck())

	end)
}


return self