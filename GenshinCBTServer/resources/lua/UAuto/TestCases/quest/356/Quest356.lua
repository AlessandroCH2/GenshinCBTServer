local baseClass = require('UAuto/TestCases/Quest/QuestBase')
local UAutoLuaTestCase = class("QuestAuto356-357",baseClass)

local self = UAutoLuaTestCase
self.TestFixture = "QuestAuto356-357"
self.Category = "任务系统" --自行修改分类
self.Description = "任务356-357" --自行修改用例描述
self.questId = "356"

UAutoLuaTestCase.Step_1 = {
	Order = 1, --执行顺序
	Type = CaseType.MonoTest,
	Description = "找安柏对话", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		-- self:InitQuest(self.questId)
		-- yield_return(self:ReEnterBigWorld())

		local initPos = CS.UnityEngine.Vector3( 2224.562 , 211.0045 , -944.5621 )
		local initForward = CS.UnityEngine.Vector3( 0.4252258 , 1 , 0.9050873 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		-- yield_return(self.base:WaitFrames(50))
		yield_return(self:WaitMoveToEntityByName("Ambor"))
		-- local targetPos = CS.UnityEngine.Vector3( 2229.3 , 210.9926 , -937.8999 )
		-- local endForward = CS.UnityEngine.Vector3( -0.3569519 , 1 , 0.9341228 )
		-- yield_return(self.base:MoveToPositionUntilCutScene(targetPos,10,1))
		-- yield_return(self.base:InitAvatarRotate(endForward))
		yield_return(self:WaitCutScene(true))
	end)
}

UAutoLuaTestCase.Step_2 = {
	Order = 2, --执行顺序
	Type = CaseType.MonoTest,
	Description = "跟随安柏看cutscene", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		local targetPos = CS.UnityEngine.Vector3( 2252.9, 215.9927, -891.7 )
		local endForward = CS.UnityEngine.Vector3( 0.7407106 , 1 , 0.6718242 )
		yield_return(self.base:MoveToPositionUntilCutScene(targetPos,20,1))
		yield_return(self.base:InitAvatarRotate(endForward))
		yield_return(self:WaitCutScene(true))
	end)
}

UAutoLuaTestCase.Step_3 = {
	Order = 3, --执行顺序
	Type = CaseType.MonoTest,
	Description = "去砍龙结晶", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		-- local initPos = CS.UnityEngine.Vector3( 2250.926 , 216.9463 , -882.5068 )
		-- local initForward = CS.UnityEngine.Vector3( -0.2116177 , 1 , 0.9773525 )
		-- yield_return(self.base:MoveToPosition(initPos,10,1))
		-- yield_return(self.base:InitAvatarRotate(initForward))
		yield_return(self:WaitMoveToEntityByName("DragonFeather"))

		local attackCount = 15
		while attackCount > 0 do
			yield_return(CS.UnityEngine.WaitForSeconds(0.3))
			yield_return(self.base:Skill(0))
			attackCount = attackCount - 1
		end
	end)
}

UAutoLuaTestCase.Step_4 = {
	Order = 4, --执行顺序
	Type = CaseType.MonoTest,
	Description = "去领滑翔翼", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		-- local initPos = CS.UnityEngine.Vector3( 2262.4, 215.9496, -876.2 )
		yield_return(self:WaitMoveToEntityByName("Ambor"))
		yield_return(self.base:SelectDialog( "安柏" ))
		yield_return(self:WaitCutScene(true))
	end)
}

UAutoLuaTestCase.Step_5 = {
	Order = 5, --执行顺序
	Type = CaseType.MonoTest,
	Description = "飞到屋顶与安柏对话", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		-- yield_return(self.base:MouseClick( "Canvas/GuideLayoutSafeAreasAndMargins"))
		yield_return(self.base:Fly())
		yield_return(self:WaitMoveToEntityByName("Ambor"))
		yield_return(self.base:WaitFrames(120))
		yield_return(self.base:SelectDialog( "安柏" ))
		yield_return(self:WaitCutScene(true))
	end)
}

UAutoLuaTestCase.Step_6 = {
	Order = 6, --执行顺序
	Type = CaseType.MonoTest,
	Description = "切换安柏射结晶", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/TeamBtnContainer/Content/UI_AvatarIcon_Side_Ambor/TeamBtn"))
		yield_return(self.base:Skill(0, false))
		yield_return(CS.UnityEngine.WaitForSeconds(2))
		yield_return(self.base:SkillUp(0))

		local deltaAngle = CS.UnityEngine.Vector3( -5.444407 , -0.3648148 , -6.686823E-07)
		yield_return(self.base:RotateFocusCamera(deltaAngle))
		yield_return(self.base:Skill(0))

		yield_return(self.base:RunGM("quest finish 35706"))
		yield_return(self.base:RunGM("quest finish 35707"))
		yield_return(self.base:RunGM("quest finish 35711"))
		yield_return(self:WaitCutScene(true))
	end)
}

UAutoLuaTestCase.Step_7 = {
	Order = 7, --执行顺序
	Type = CaseType.MonoTest,
	Description = "去骑士团", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		local targetPos = CS.UnityEngine.Vector3( 2243.57, 238.6464, -780.4276 )
		yield_return(self.base:MoveToPosition(targetPos,100,1))
	end)
}


return self
