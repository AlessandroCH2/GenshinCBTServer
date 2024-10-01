local baseClass = require('UAuto/TestCases/Quest/405/QuestBase_405')
local UAutoLuaTestCase = class("QuestNormal_405",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = self.__className
self.Description = "安柏酱的飞行特训-醉汉峡（GM命令过）"
self.Category="任务系统"
self.SetUp = {
	Order=0.1,
	Category="任务系统",
	Type = CaseType.MonoTest,
	Description = "初始化，清除40501任务",
	Action = UAutoCoroutine(function()
		yield_return(self.base:SetUpVariables())
		yield_return(self.base:RunGM("QUEST CLEAR 40501"))
	end)
}


self.Step40501 = {
	Order=2,
	Category="任务系统",
	Description = "接受醉汉峡挑战,到醉汉峡找安柏",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_40501())
	end)
}

self.Step40502 = {
	Order=3,
	Category="任务系统",
	Description = "碰到飞行终点的羽球,碰到飞行终点的羽球",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_40502())
	end)
}


self.Step40504 = {
	Order=5,
	Category="任务系统",
	Description = "比赛成功回到报名点,回到起点找安柏",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_40504())
	end)
}


return self