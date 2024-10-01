local baseClass = require('UAuto/TestCases/Quest/302/QuestBase_302')
local UAutoLuaTestCase = class("QuestBranch_302",baseClass)
local self = UAutoLuaTestCase
UAutoLuaTestCase.TestFixture = self.__className
self.Description="派蒙的指引，去过蒙得城的分支情况"
self.Category = "任务系统"
self.SetUp = {
	Order=0.1,
	Category="任务系统",
	Description = "初始化，clear all",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self.base:SetUpVariables())
		yield_return(self.base:RunGM("clear all",true,true))
	end)
}

self.Branch30207 = {
	Order=1,
	Category="任务系统",
	Type = CaseType.MonoTest,
	Description = "去蒙得城后再跑引导任务",
	Action = UAutoCoroutine(function()
		self.questID = 302
		yield_return(self:Step_30201())
		--yield_return(self:Step_30202())
		--yield_return(self:Step_30203())
		yield_return(self:Step_30204())
		yield_return(self:TriggerMengDeTask())
		yield_return(self.base:TelePort(self.endPosition))
		yield_return(self:Step_30203())
		yield_return(self:Step_30205())
		yield_return(self:Step_30206())
		--self:CheckQuestPromtOnMiniMap()
	end)
}

return self