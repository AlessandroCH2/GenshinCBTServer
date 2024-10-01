--baseClass提供基础接口
local baseClass = require('UAuto/Base/UAutoLuaTestBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("CreateMonster",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "CreateMonster"
self.Category = "单机场景"
self.Description="招怪测试"
self.Order = 2001


self.Step1 = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description = "招怪",
	Action = UAutoCoroutine(function()
		self.base:CreateMonster(21010101)

	end)
}

self.Step2 = {
	Order = 1.5,
	Type = CaseType.MonoTest,
	Description = "关AI",
	Action = UAutoCoroutine(function()
		self.base:MonsterAI(false)
	end)
}

return self