local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("Quest352",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "Quest352"
self.Category = "任务系统" --自行修改分类
self.Description = "任务352" --自行修改用例描述

UAutoLuaTestCase.Step_1 = {
	Order = 1, --执行顺序
	Type = CaseType.MonoTest,
	Description = "362+352cutscene", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		
		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2601.012, 224.3733, -1578.002 )
		yield_return(self.base:MoveToPosition(initPos)) 
		local initForward = CS.UnityEngine.Vector3( 0.08837877 , 1 , 0.996087 )
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 27")
		yield_return(self.base:WaitFrames(26))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.745764 , 0.07292055 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 29")
		yield_return(self.base:WaitFrames(1))

		print("frame index: 49")
		yield_return(self.base:WaitFrames(19))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.745764 , 0.07292055 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 215")
		yield_return(self.base:WaitFrames(165))
		endPos = CS.UnityEngine.Vector3( 2604.045 , 226.0145 , -1562.502 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.9944749 , 0.1259514 , 1.916541 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 232")
		yield_return(self.base:WaitFrames(16))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.7877184 , 0.12012 , 1.723741 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 246")
		yield_return(self.base:WaitFrames(13))
		endPos = CS.UnityEngine.Vector3( 2604.045 , 226.0149 , -1562.503 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.7875162 , 0.1190416 , 1.723865 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 390")
		yield_return(self.base:WaitFrames(143))

		print("frame index: 412")
		yield_return(self.base:WaitFrames(21))

		print("frame index: 423")
		yield_return(self.base:WaitFrames(10))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.745782 , 0.02310778 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 442")
		yield_return(self.base:WaitFrames(18))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/Skill3/ActionBtn_Sprint(Clone)"))

		print("frame index: 444")
		yield_return(self.base:WaitFrames(1))

		print("frame index: 605")
		yield_return(self.base:WaitFrames(160))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/Skill3/ActionBtn_Sprint(Clone)"))

		print("frame index: 607")
		yield_return(self.base:WaitFrames(1))

		print("frame index: 696")
		yield_return(self.base:WaitFrames(88))
		endPos = CS.UnityEngine.Vector3( 2615.691 , 234.0592 , -1496.543 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.745484 , 0.1134464 , 6 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 711")
		yield_return(self.base:WaitFrames(14))

		print("frame index: 772")
		yield_return(self.base:WaitFrames(60))

		print("frame index: 777")
		yield_return(self.base:WaitFrames(4))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.19711 , 0.1111656 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 812")
		yield_return(self.base:WaitFrames(34))
		endPos = CS.UnityEngine.Vector3( 2608.778 , 235.9941 , -1483.732 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.200114 , 0.1134464 , 3.339703 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1361")
		yield_return(self.base:WaitFrames(581))
		yield_return(self:WaitCutScene(true))
	end)
}

UAutoLuaTestCase.Step_2 = {
	Order = 2, --执行顺序
	Type = CaseType.MonoTest,
	Description = "跟随派蒙跑到女神岛", --步骤描述
	Action = UAutoCoroutine(function()
		yield_return(self:WaitMoveToEntityByName("Kanban"))
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		yield_return(self:WaitMoveToEntityByName("Kanban"))
	end)
}

UAutoLuaTestCase.Step_3 = {
	Order = 3, --执行顺序
	Type = CaseType.MonoTest,
	Description = "登岛+cutscene+教学框关闭", --步骤描述
	Action = UAutoCoroutine(function()


		print("frame index: 370")
		yield_return(self:WaitCutScene(true,60,true))

		yield_return(self.base:MouseClick( "Canvas/SuspendBars/TutorialDialog/Content/ClickBtn"))


	end)
}


return self
