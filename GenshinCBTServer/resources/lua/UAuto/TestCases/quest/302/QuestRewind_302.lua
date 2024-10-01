local baseClass = require('UAuto/TestCases/Quest/302/QuestBase_302')
local UAutoLuaTestCase = class("QuestRewind_302",baseClass)
local self = UAutoLuaTestCase
UAutoLuaTestCase.TestFixture = self.__className
self.Description="302派蒙的指引，各步骤失败回退"
self.Category = "任务系统"
self.SetUp = {
	Order=0.1,
	Category="任务系统",
	Description="初始化",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("clear all",true,true))
	end)
}

self.ReWind30202 = {
	Order=1,
	Category="任务系统",
	Description="过cutscene后退出重进接任务",
	Type = CaseType.MonoTest,
	Action = UAutoCoroutine(function()
		yield_return(self:Step_30201())
		yield_return(self:Reconnect("Daily"))
		yield_return(self:Step_30202())
	end)
}

self.ReWind30203 = {
	Order=2,
	Category="任务系统",
	Type = CaseType.MonoTest,
	Description="跟随到女神像边退出再进",
	Action = UAutoCoroutine(function()
		yield_return(self:Step_30203())
		yield_return(self:Reconnect())
		--yield_return(self:Step_30202())
	end)
}

self.ReWind30204 = {
	Order=3,
	Category="任务系统",
	Type = CaseType.MonoTest,
	Description="完成任务前退出再进再完成",
	Action = UAutoCoroutine(function()
		yield_return(self:Step_30203())
		--self.endPosition= CS.UnityEngine.Vector3(518.4478, 212.5616, -259.0941);
		--yield_return(self:Step_30204(self.endPosition))
		yield_return(self:Reconnect())
		yield_return(self:Step_30202())
	end)
}


return self