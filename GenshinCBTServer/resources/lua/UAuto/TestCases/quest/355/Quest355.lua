local baseClass = require('UAuto/TestCases/Quest/QuestBase')
local UAutoLuaTestCase = class("Quest355",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "Quest355"
self.Category = "任务系统" --自行修改分类
self.Description = "任务355--与巨龙相会" --自行修改用例描述

UAutoLuaTestCase.Step_1 = {
	Order = 1, --执行顺序
	Type = CaseType.MonoTest,
	Description = "初始化，看到巨龙", --步骤描述
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("quest clear father 355 361"))
		local initPos = CS.UnityEngine.Vector3( 2540, 216, -1289 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:RunGM("quest finish father 351 362 352 353"))
		yield_return(self:ReEnterBigWorld())
	end)
}


UAutoLuaTestCase.Step_3 = {
	Order = 3, --执行顺序
	Type = CaseType.MonoTest,
	Description = "向树林深处前进，击杀史莱姆，看宝箱cutscene", --步骤描述
	Action = UAutoCoroutine(function()
		
		local endPos = CS.UnityEngine.Vector3( 2476.039, 197.9515, -1207.941 )
		yield_return(self.base:MoveByAI(endPos))
		yield_return(self.base:RunGM("kill monster all"))
		yield_return(self:WaitCutScene(true,10,true))
	end)
}

UAutoLuaTestCase.Step_4 = {
	Order = 4, --执行顺序
	Type = CaseType.MonoTest,
	Description = "向树林深处继续前进,看cutscene", --步骤描述
	Action = UAutoCoroutine(function()
		
		local endPos = CS.UnityEngine.Vector3( 2404.373, 202.9988, -1149.539 )
		yield_return(self.base:MoveByAI(endPos))
		endPos =CS.UnityEngine.Vector3( 2369.812, 205.5956, -1137.807)
		yield_return(self.base:MoveByAI(endPos))
		yield_return(self:WaitCutScene(true))

	end)
}


UAutoLuaTestCase.Step_5 = {
	Order = 5, --执行顺序
	Type = CaseType.MonoTest,
	Description = "调查派蒙发现的东西，拿结晶，过cutscene", --步骤描述
	Action = UAutoCoroutine(function()
		yield_return(self:ReEnterBigWorld())
		local endPos = CS.UnityEngine.Vector3( 2347.579, 211.4826, -1133.424 )
		yield_return(self.base:MoveToPosition(endPos))
		yield_return(self.base:SelectDialog( "结晶" ))
		yield_return(self:WaitCutScene(true))

	end)
}

return self
