local baseClass = require('UAuto/TestCases/Quest/QuestBase')
local UAutoLuaTestCase = class("QuestAuto358",baseClass)

local self = UAutoLuaTestCase
self.TestFixture = "QuestAuto358"
self.Category = "任务系统" --自行修改分类
self.Description = "任务358" --自行修改用例描述
self.questId = "358"

UAutoLuaTestCase.Step_1 = {
	Order = 1, --执行顺序
	Type = CaseType.MonoTest,
	Description = "进入骑士团", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		-- 初始化
		self:InitQuest(self.questId)
		yield_return(self:ReEnterBigWorld())

		local initPos = CS.UnityEngine.Vector3( 2244.817, 236.5632, -783.5051 )
		yield_return(self.base:TelePort(initPos))

		local targetPos = CS.UnityEngine.Vector3( 2243.268, 238.6435, -779.1453 )
		yield_return(self.base:MoveToPosition(targetPos,10,1))

		yield_return(self.base:SelectDialog( "进入骑士团" ))
		yield_return(self:WaitCutScene(true))
	end)
}

UAutoLuaTestCase.Step_2 = {
	Order = 2, --执行顺序
	Type = CaseType.MonoTest,
	Description = "与琴对话", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		yield_return(self:WaitMoveToEntityByName("Kaeya",100,100))
		yield_return(self.base:SelectDialog( "琴" ))
		yield_return(self:WaitCutScene(true))
		yield_return(self.base:RunGM("jump 3"))
	end)
}




return self
