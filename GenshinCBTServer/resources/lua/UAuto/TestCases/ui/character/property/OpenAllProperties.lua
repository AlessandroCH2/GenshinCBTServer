local baseClass = require('UAuto/TestCases/UI/Character/CharacterPageBase')
local UAutoLuaTestCase = class("OpenAllProperties",baseClass)
local self = UAutoLuaTestCase
UAutoLuaTestCase.TestFixture = self.__className
self.Description = "打开角色页面，依次查看各角色属性页面"
self.Category="UI,角色养成系统"
UAutoLuaTestCase.SetUp = {
	Order = 0.1,
	Type = CaseType.MonoTest,
	Description = "初始化",
	Action = UAutoCoroutine(function()
		yield_return(self.base:SetUpVariables())
	end)
}

self.OpenCharacter = {
	Order=1,
	Category="角色养成系统",
	Description = "打开角色页面",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(self.OpenCharacterPageAction)
}

self.ChoosePropertyTab = {
	Order=2,
	Category="角色养成系统",
	Description = "选择属性页",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		self.MonoCharacterPage = self.CharacterPage:GetComponent("MonoCharacterPage")
		assert(self.MonoCharacterPage~=nil,"MonoCharacterPage is nil")
		self.MonoCharacterPage.weaponButton.onClick:Invoke()
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		self.MonoCharacterPage.propertyButton.onClick:Invoke()
		local timeout=10
		while self.MonoCharacterPage.propertyButton.interactable do
			yield_return(CS.UnityEngine.WaitForSeconds(1))
			timeout=timeout-1
			assert(timeout>0,"打开属性页失败")
		end
	end)
}


self.ChooseWeaponTab = {
	Order=3,
	Category="角色养成系统",
	Description = "选择武器页",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		self.MonoCharacterPage = self.CharacterPage:GetComponent("MonoCharacterPage")
		assert(self.MonoCharacterPage~=nil,"MonoCharacterPage is nil")
		self.MonoCharacterPage.weaponButton.onClick:Invoke()
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		self.MonoCharacterPage.weaponButton.onClick:Invoke()
		local timeout=10
		while self.MonoCharacterPage.weaponButton.interactable do
			yield_return(CS.UnityEngine.WaitForSeconds(1))
			timeout=timeout-1
			assert(timeout>0,"打开武器页失败")
		end
	end)
}


self.ChooseRelicTab = {
	Order=4,
	Category="角色养成系统",
	Description = "选择圣遗物页",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		self.MonoCharacterPage = self.CharacterPage:GetComponent("MonoCharacterPage")
		assert(self.MonoCharacterPage~=nil,"MonoCharacterPage is nil")
		self.MonoCharacterPage.relicButton.onClick:Invoke()
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		self.MonoCharacterPage.relicButton.onClick:Invoke()
		local timeout=10
		while self.MonoCharacterPage.relicButton.interactable do
			yield_return(CS.UnityEngine.WaitForSeconds(1))
			timeout=timeout-1
			assert(timeout>0,"打开圣遗物页失败")
		end
	end)
}



self.ChooseTalentTab = {
	Order=5,
	Category="角色养成系统",
	Description = "选择天赋页",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("player exp 1000"))
		self.MonoCharacterPage = self.CharacterPage:GetComponent("MonoCharacterPage")
		assert(self.MonoCharacterPage~=nil,"MonoCharacterPage is nil")
		self.MonoCharacterPage.talentButton.onClick:Invoke()
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		self.MonoCharacterPage.talentButton.onClick:Invoke()
		local timeout=10
		while self.MonoCharacterPage.talentButton.interactable do
			yield_return(CS.UnityEngine.WaitForSeconds(1))
			timeout=timeout-1
			assert(timeout>0,"打开天赋页失败")
		end
	end)
}


self.ChooseAvatarTabs = {
	Order=6,
	Category="角色养成系统",
	Description = "依次点击各角色",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		assert(self.MonoCharacterPage~=nil,"MonoCharacterPage is nil")
		local MonoImgTabs = self.MonoCharacterPage.grpTab:GetComponentsInChildren(typeof(CS.MoleMole.MonoImgTab))
		print(MonoImgTabs.Length)
		for i=0,MonoImgTabs.Length-1 do
			yield_return(CS.UnityEngine.WaitForSeconds(1))
			yield_return(self.base:ClickOnPointerObject(MonoImgTabs[i].gameObject))
		end
	end)
}



self.Close = {
	Order=7,
	Category="角色养成系统",
	Description = "关闭CharacterPage",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		self:CloseCharacterPageAction()
	end)
}



return self

