local baseClass = require('UAuto/TestCases/Quest/354/QuestBase_354')
local UAutoLuaTestCase = class("QuestNormal_354",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = self.__className
self.Description = "安柏入队(GM过)"
self.Order = 4.5
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

self.Step35301 = {
	Order=1,
	Category="任务系统",
	Description = "触发cutscene",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35401())

	end)
}

self.Step35302 = {
	Order=2,
	Category="任务系统",
	Description = "安柏自我介绍",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35402())
	end)
}

self.Step35303 = {
	Order=3,
	Category="任务系统",
	Description = "安柏入队",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35403())
		
	end)
}

self.Step35304 = {
	Order=4,
	Category="任务系统",
	Description = "开镜教学射风史莱姆",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35404())
	end)
}


return self