local baseClass = require('UAuto/TestCases/Quest/351/QuestBase_351')
local UAutoLuaTestCase = class("QuestNormal_351",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = self.__className
self.Description = "新启程"
self.Order = 2
self.Category="任务系统"

self.SetUp = {
	Order=0.1,
	Category="任务系统",
	Type = CaseType.MonoTest,
	Description = "初始化",
	Action = UAutoCoroutine(function()
		yield_return(self.base:SetUpVariables())
	end)
}

self.Step35100 = {
	Order=1,
	Category="任务系统",
	Description = "冒险的开始",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35100())
	end)
}

self.Step35101 = {
	Order=2,
	Category="任务系统",
	Description = "跟随派蒙",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35101())
	end)
}

self.Step35103 = {
	Order=3,
	Category="任务系统",
	Description = "没路了？",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35103())
	end)
}

self.Step35102 = {
	Order=4,
	Category="任务系统",
	Description = "攀爬",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35102())
	end)
}



return self