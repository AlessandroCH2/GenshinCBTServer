local baseClass = require('UAuto/TestCases/Quest/404/QuestBase_404')
local UAutoLuaTestCase = class("QuestNormal_404",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = self.__className
self.Description = "安柏酱的飞行特训-风起地（GM命令过）"
self.Category="任务系统"

self.SetUp = {
	Order=0.1,
	Category="任务系统",
	Type = CaseType.MonoTest,
	Description = "初始化，清除40400任务状态",
	Action = UAutoCoroutine(function()
		yield_return(self.base:SetUpVariables())
		yield_return(self.base:RunGM("QUEST CLEAR 40400"))
	end)
}

self.Step40400 = {
	Order=1,
	Category="任务系统",
	Description = "安柏指引去飞行比赛,与安柏对话",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_40400())
	end)
}

self.Step40401 = {
	Order=2,
	Category="任务系统",
	Description = "接受挑战1,到风起地找安柏",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_40401())
	end)
}

self.Step40402 = {
	Order=3,
	Category="任务系统",
	Description = "碰到飞行终点的羽球,碰到飞行终点的羽球",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_40402())
	end)
}

self.Step40404 = {
	Order=4,
	Category="任务系统",
	Description = "比赛成功回到报名点,回到起点找安柏",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_40404())
	end)
}

self.Step40406 = {
	Order=5,
	Category="任务系统",
	Description = "接受挑战2,与安柏对话",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_40406())
	end)
}

self.Step40407 = {
	Order=6,
	Category="任务系统",
	Description = "碰到飞行终点的羽球,碰到飞行终点的羽球",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_40407())
	end)
}

self.Step40409 = {
	Order=7,
	Category="任务系统",
	Description = "比赛成功回到报名点,回到起点找安柏",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_40409())
	end)
}

return self