local baseClass = require('UAuto/TestCases/Quest/QuestBase')
local UAutoLuaTestCase = class("QuestAuto306",baseClass)

local self = UAutoLuaTestCase
self.TestFixture = "QuestAuto306"
self.Category = "任务系统" --自行修改分类
self.Description = "任务306" --自行修改用例描述
self.questId = "306"

UAutoLuaTestCase.Step_1 = {
	Order = 1, --执行顺序
	Type = CaseType.MonoTest,
	Description = "去神庙门口", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		-- 初始化
		self:InitQuest(self.questId)
		yield_return(self:ReEnterBigWorld())

		-- local initPos = CS.UnityEngine.Vector3( 13.08653, 0.0007573366, 8.001324 )
		-- yield_return(self.base:TelePort(initPos))

		-- local targetPos1 = CS.UnityEngine.Vector3( 10.92013, 0.02622449, 7.749277 )
		-- yield_return(self.base:MoveToPosition(targetPos1,10,1))
		-- yield_return(self.base:SelectDialog( "开门" ))
		
		-- local targetPos2 = CS.UnityEngine.Vector3( -0.03320703, 0.02673542, 14.66148 )
		-- yield_return(self.base:MoveToPosition(targetPos1,10,1))
		-- yield_return(self.base:SelectDialog( "离开骑士团" ))

		local targetPos3 = CS.UnityEngine.Vector3( 2127.179, 204.8369, -1156.915 )
		yield_return(self.base:TelePort(targetPos3))
	end)
}

UAutoLuaTestCase.Step_2 = {
	Order = 2, --执行顺序
	Type = CaseType.MonoTest,
	Description = "与安柏对话", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		yield_return(self:WaitMoveToEntityByName("NPC_Girl_Bow_Ambor"))
		yield_return(self.base:SelectDialog( "安柏" ))
		yield_return(self:WaitCutScene(true))
	end)
}

UAutoLuaTestCase.Step_3 = {
	Order = 3, --执行顺序
	Type = CaseType.MonoTest,
	Description = "进入神庙", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		local targetPos = CS.UnityEngine.Vector3( 2137.056, 207.7447, -1171.336 )
		yield_return(self.base:MoveToPosition(targetPos,10,1))
		yield_return(self.base:SelectDialog( "西风之鹰的庙宇" ))

		yield_return(self.base:WaitFrames(120))
		yield_return(self.base:MouseClick( "Canvas/Pages/DungeonEntryPage/GrpDungeon/Right/Option/BtnStart/Content/Icon"))
	end)
}




return self
