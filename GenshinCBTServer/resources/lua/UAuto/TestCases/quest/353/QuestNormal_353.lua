local baseClass = require('UAuto/TestCases/Quest/353/QuestBase_353')
local UAutoLuaTestCase = class("QuestNormal_353",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = self.__className
self.Description = "战斗教学(GM过)"
self.Order = 4
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
	Description = "自动和派蒙说话",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35301())
	end)
}

self.Step35302 = {
	Order=2,
	Category="任务系统",
	Description = "小技能教学",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35302())
	end)
}

self.Step35303 = {
	Order=3,
	Category="任务系统",
	Description = "小技能蓄力二段教学",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35303())
	end)
}

self.Step35304 = {
	Order=4,
	Category="任务系统",
	Description = "充能技和冲刺闪避教学",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35304())
	end)
}

self.Step35305 = {
	Order=5,
	Category="任务系统",
	Description = "去找飞过的女孩子",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_35305())
		yield_return(self.base:RunGM("kill monster 20011001"))
	end)
}


self.CloseTuturial = {
	Order=6,
	Category="任务系统",
	Description = "关闭教学",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(CS.UnityEngine.WaitForSeconds(5))
		local dialog = CS.UnityEngine.GameObject.Find("TutorialDialog")
		local timeout = 10
		while(dialog~=nil and dialog.activeInHierarchy) do
			yield_return(self.base:ClickScreen())
			yield_return(CS.UnityEngine.WaitForSeconds(1))
			timeout=timeout-1
			assert(timeout>0,"关闭教学超时")
		end
	end)
}

return self