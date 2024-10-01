local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("ChangeCharacter",baseClass)
local self = UAutoLuaTestCase
UAutoLuaTestCase.TestFixture = "ChangeCharacter"
UAutoLuaTestCase.Category = "UI,角色通用"
self.Description = "换人"
UAutoLuaTestCase.SetUp = {
	Order = 0.1,
	Type = CaseType.MonoTest,
	Description = "初始化",
	Action = UAutoCoroutine(function()
		yield_return(self.base:SetUpVariables())
	end)
}

UAutoLuaTestCase.ChangeAyaka = {
	Order = 5,
	Type = CaseType.MonoTest,
	Description = "换绫华",
	Action = UAutoCoroutine(function()
		yield_return(self:ChangeAvatar("Ayaka"))
	end)
}


UAutoLuaTestCase.ChangeAmber = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description = "换安柏",
	Action = UAutoCoroutine(function ()
		yield_return(self:ChangeAvatar("Anbo"))
	end)
}


UAutoLuaTestCase.ChangeQin = {
	Order = 2,
	Type = CaseType.MonoTest,
	Description = "换琴",
	Action = UAutoCoroutine(function ()
		yield_return(self:ChangeAvatar("Qin"))
	end)
}

UAutoLuaTestCase.ChangeLisa = {
	Order = 3,
	Type = CaseType.MonoTest,
	Description = "换丽莎",
	Action = UAutoCoroutine(function ()
		yield_return(self:ChangeAvatar("Lisa"))
	end)
}

return self
