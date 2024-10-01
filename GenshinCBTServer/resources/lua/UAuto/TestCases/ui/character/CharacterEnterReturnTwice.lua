local baseClass = require('UAuto/TestCases/UI/Character/CharacterPageBase')
local UAutoLuaTestCase = class("CharacterEnterReturnTwice",baseClass)
local self = UAutoLuaTestCase
self.Category="UI,角色养成系统"
UAutoLuaTestCase.TestFixture = "CharacterEnterReturnTwice"

self.Description = "在主城边打开角色界面->退出->再次打开角色界面"
UAutoLuaTestCase.FlyToHall = {
	Order=0.9,
	Category="角色养成系统",
	Type = CaseType.MonoTest,
	Description = "瞬移到主城口",
	Action = UAutoCoroutine(function()
		yield_return(self.base:TelePort(CS.UnityEngine.Vector3(2154.3323,210.6245,-1034.27304)))
	end)
}


UAutoLuaTestCase.OpenCharacterPage = {
	Order=1,
	Category="角色养成系统",
	Type = CaseType.MonoTest,
	Description = "打开角色页面",
	Action = UAutoCoroutine(self.OpenCharacterPageAction)
}

UAutoLuaTestCase.CloseCharacterPage = {
	Order=2,
	Category="角色养成系统",
	Type = CaseType.MonoTest,
	Description = "关闭角色页面",
	Action = UAutoCoroutine(self.CloseCharacterPageAction)
}

UAutoLuaTestCase.ReturnToHome = {
	Order=3,
	Category="角色养成系统",
	Type = CaseType.MonoTest,
	Description = "返回到Home",
	Action = UAutoCoroutine(function()
		self.monoInLevelMainPage.gmButton.onClick:Invoke()
		yield_return (self.base:WaitFoundGameObject("InLevelDebugMenuDialog",function(result) self.InLevelDebugMenuDialog = result end))
		self.MonoInLevelDebugMenuDialog = self.InLevelDebugMenuDialog:GetComponent("MonoInLevelDebugMenuDialog")
		self.MonoInLevelDebugMenuDialog.returnButton.onClick:Invoke()
		yield_return (self.base:WaitLevelLoaded("Home"))
	end)
}

UAutoLuaTestCase.EnterMaster = {
	Order=4,
	Category="角色养成系统",
	Type = CaseType.MonoTest,
	Description = "再次进入Daily",
	Action = UAutoCoroutine(function()
		yield_return(self.base:EnterBigWorldFromGame("Daily",false))
		yield_return (self.base:WaitLevelLoaded("Level"))
		yield_return(self:WaitCutScene(true,60,true))
	end)
}


UAutoLuaTestCase.OpenCharacterPageAgain = {
	Order=5,
	Category="角色养成系统",
	Type = CaseType.MonoTest,
	Description = "再次打开角色页面",
	Action = UAutoCoroutine(self.OpenCharacterPageAction)
}

UAutoLuaTestCase.CloseCharacterPageAgain = {
	Order=6,
	Category="角色养成系统",
	Type = CaseType.MonoTest,
	Description = "关闭角色页面",
	Action = UAutoCoroutine(self.CloseCharacterPageAction)
}

return self
