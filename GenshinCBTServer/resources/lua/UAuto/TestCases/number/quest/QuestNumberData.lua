local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("QuestNumberData", baseClass)
local self = UAutoLuaTestCase

self.base = TestCaseQuestBaseClass()
self.TestFixture = "QuestNumberData"
self.Category = "数值报表"
self.Description="任务数值报表"
self.OrderIndex = 0;

self.OrderIndex = self.OrderIndex + 1;
self.QuestNumberCheck = {
	Order = self.OrderIndex,
	Type = CaseType.MonoTest,
	Description = "生成任务数值报表",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("clear all", false))
		yield_return(CS.UnityEngine.WaitForSeconds(5))

		yield_return(self.base:StartCheckQuestNumber(true))
	end)
}

return self