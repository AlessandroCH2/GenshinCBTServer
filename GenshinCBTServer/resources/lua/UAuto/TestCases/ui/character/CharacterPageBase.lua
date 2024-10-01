local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("CharacterPageBase",baseClass)
UAutoLuaTestCase.TestFixture = "CharacterPageBase"

local self = UAutoLuaTestCase

function self.OpenCharacterPageAction()
	yield_return(CS.UnityEngine.WaitForSeconds(1))
	yield_return(self.base:SetUpVariables())
	print(self.InLevelMainPage)
	self.monoInLevelMainPage = self.InLevelMainPage:GetComponent("MonoInLevelMainPage")
	self.monoInLevelMainPage.characterPageToggle.onClick:Invoke()
	yield_return (self.base:WaitFoundGameObject("CharacterPage",function(result) self.CharacterPage = result end))
end

function self.CloseCharacterPageAction()
	yield_return (self.base:WaitFoundGameObject("CharacterPage",function(result) self.CharacterPage = result end))
	yield_return(CS.UnityEngine.WaitForSeconds(5))
	self.MonoCharacterPage = self.CharacterPage:GetComponent("MonoCharacterPage")
	assert(self.MonoCharacterPage~=nil,"MonoCharacterPage is nil")
	self._returnButton = self.MonoCharacterPage:GetPrivateField("_returnButton")
	self._returnButton:GetButton().onClick:Invoke()
	yield_return(CS.UnityEngine.WaitForSeconds(5))
end

return self