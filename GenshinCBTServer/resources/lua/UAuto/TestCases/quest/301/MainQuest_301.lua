local baseClass = require('UAuto/TestCases/Quest/QuestBase')
local UAutoLuaTestCase = class("MainQuest_301",baseClass)
UAutoLuaTestCase.TestFixture = "MainQuest_301"
local self = UAutoLuaTestCase
self.Category="任务系统"
self.Description = "主线任务301_正常跑"
self.Order = 500
self.GotoMengDe = {
	Order=1,
	Category="任务系统",
	Description = "主线任务",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:FinishAllNoob())
		
	end )

}



return self
