local baseClass = require('UAuto/TestCases/Quest/352/QuestBase_352')
local UAutoLuaTestCase = class("QuestNormal_352",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = self.__className
self.Description = "派蒙的指引（GM过）"
self.Order = 3
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

self.Step35201 = {
	Order=1,
	Category="任务系统",
	Description = "到达瞭望台",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35201())
		
	end)
}

self.Step35202 = {
	Order=2,
	Category="任务系统",
	Description = "与派蒙对话",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35202())
	end)
}

self.Step35203 = {
	Order=3,
	Category="任务系统",
	Description = "跟随派蒙",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35203())
		
	end)
}

self.Step35204 = {
	Order=4,
	Category="任务系统",
	Description = "游到女神像",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35204())
	end)
}

self.Step35205 = {
	Order=5,
	Category="任务系统",
	Description = "派蒙对话&下场",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35205())
	end)
}

return self