local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("AutoTest_test",baseClass)

local self = UAutoLuaTestCase
self.TestFixture = "AutoTest_test"
self.Category = "默认分类" --自行修改分类
self.Description = "AutoTest_test" --自行修改用例描述

UAutoLuaTestCase.Step_1 = {
	Order = 1, --执行顺序
	Type = CaseType.MonoTest,
	Description = "Step_1", --步骤描述
	Action = UAutoCoroutine(function()
		--yield_return(self.base:CollectPoint())
		yield_return(CS.UnityEngine.WaitForSeconds(1))
	end)
}

return self
