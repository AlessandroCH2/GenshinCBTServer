local baseClass = require('UAuto/TestCases/Quest/QuestBase')
local UAutoLuaTestCase = class("QuestAuto354",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "Quest361"
self.Category = "任务系统" --自行修改分类
self.Description = "任务361--风龙飞过" --自行修改用例描述



UAutoLuaTestCase.Step_1 = {
	Order = 1, --执行顺序
	Type = CaseType.MonoTest,
	Description = "风龙飞过", --步骤描述
	Action = UAutoCoroutine(function()
		local initPos = CS.UnityEngine.Vector3( 2540, 216, -1289 )
		yield_return(self.base:RunGM("quest clear father 361"))
		yield_return(self.base:RunGM("quest finish father 351 362 352 353"))
		yield_return(self:ReEnterBigWorld())
		yield_return(self.base:TelePort(initPos))
		local endPos = CS.UnityEngine.Vector3( 2497.954 , 199.8537 , -1220.871 )
		yield_return(self.base:MoveByAI(endPos))



	end)
}


return self