local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("Quest351",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "Quest351"
self.Category = "任务系统" --自行修改分类
self.Description = "任务351" --自行修改用例描述

UAutoLuaTestCase.Step_1 = {
	Order = 1, --执行顺序
	Type = CaseType.MonoTest,
	Description = "GM+cutscene", --步骤描述
	Action = UAutoCoroutine(function()
		yield_return(self:FinishAllNoob())
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2739.7 , 195.5479 , -1711.1 )
		local initForward = CS.UnityEngine.Vector3( -0.6834224 , 1 , 0.7300231 )
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 32")
		yield_return(self.base:WaitFrames(31))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.8185694 , 0.1134464 , 3.339703 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/GrpMainBtn/GrpMainToggle/BtnGm/Icon"))

		print("frame index: 35")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 118")
		yield_return(self.base:WaitFrames(82))
		yield_return(self.base:MouseClick( "Canvas/Dialogs/InLevelDebugMenuDialog/Common/ClearAll/Text"))


		print("frame index: 214")
		yield_return(self.base:WaitFrames(91))
		yield_return(self.base:MouseClick( "Canvas/Pages/LoginMainPage/DebugPanel/Connect/Text"))

		print("frame index: 217")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 311")
		yield_return(self.base:WaitFrames(93))
		yield_return(self.base:MouseClick( "Canvas/Pages/CharacterSelectPage/Female"))

		print("frame index: 314")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 1466")
		yield_return(self.base:WaitFrames(1151))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.6378925 , 0.1134464 , 3.339703 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:Jump())


		print("frame index: 1469")
		yield_return(self.base:WaitFrames(2))
		endPos = CS.UnityEngine.Vector3( 2745.824 , 194.8791 , -1718.185 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.6197069 , -0.03430498 , 7.536351 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))
	end)
}

UAutoLuaTestCase.Step_2 = {
	Order = 2, --执行顺序
	Type = CaseType.MonoTest,
	Description = "Step_2", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2745.824 , 195.5972 , -1718.185 )
		local initForward = CS.UnityEngine.Vector3( -0.5552664 , 1 , 0.8316726 )
		yield_return(self.base:MoveToPositionUntilCutScene(initPos,10,1))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 35")
		yield_return(self.base:WaitFrames(34))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.9016035 , 0.1556724 , 3.367619 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 39")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 137")
		yield_return(self.base:WaitFrames(97))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.9016035 , 0.1556724 , 3.367619 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 185")
		yield_return(self.base:WaitFrames(47))
		endPos = CS.UnityEngine.Vector3( 2742.035 , 194.5538 , -1713.395 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.9011453 , 0.1134464 , 3.343506 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 259")
		yield_return(self.base:WaitFrames(73))
		--yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 265")
		yield_return(self.base:WaitFrames(5))

		print("frame index: 285")
		yield_return(self.base:WaitFrames(19))
		--yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 290")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 311")
		yield_return(self.base:WaitFrames(20))
		--yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 315")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 334")
		yield_return(self.base:WaitFrames(18))
		--yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		-- print("frame index: 339")
		-- yield_return(self.base:WaitFrames(4))
		-- yield_return(self:WaitCutScene(true))

		print("frame index: 431")
		yield_return(self.base:WaitFrames(91))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.9011353 , 0.1134464 , 3.339703 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 468")
		yield_return(self.base:WaitFrames(36))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/Skill3/ActionBtn_Sprint(Clone)"))

		
		yield_return(self.base:WaitFoundNearByEntityByName("Kanban",function(result) self.foundEntity = result end,60))
		print("frame index: 472")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 535")
		yield_return(self.base:WaitFrames(62))
		yield_return(self.base:MoveToEntity(self.foundEntity))


		print("frame index: 852")
		yield_return(self.base:WaitFrames(106))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/Skill3/ActionBtn_Sprint(Clone)"))

		print("frame index: 856")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 973")
		yield_return(self.base:WaitFrames(116))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/Skill3/ActionBtn_Sprint(Clone)"))

		print("frame index: 977")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 1147")
		yield_return(self.base:WaitFrames(169))
		endPos = CS.UnityEngine.Vector3( 2643.451 , 201.0566 , -1616.732 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.8128081 , -0.04017298 , 3.403763 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1166")
		yield_return(self.base:WaitFrames(18))

		print("frame index: 1222")
		yield_return(self.base:WaitFrames(55))

		print("frame index: 1234")
		yield_return(self.base:WaitFrames(11))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.3580706 , -0.1752968 , 3.339703 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 1253")
		yield_return(self.base:WaitFrames(18))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/Skill3/ActionBtn_Sprint(Clone)"))

		print("frame index: 1257")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 1335")
		yield_return(self.base:WaitFrames(77))
		endPos = CS.UnityEngine.Vector3( 2625.763 , 208.2934 , -1609.783 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.3600911 , -0.2433352 , 3.356089 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1356")
		yield_return(self.base:WaitFrames(20))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.3600875 , -0.1998353 , 3.339703 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 1369")
		yield_return(self.base:WaitFrames(12))
		endPos = CS.UnityEngine.Vector3( 2624.641 , 208.6651 , -1609.361 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.3600275 , -0.1632595 , 3.439708 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1410")
		yield_return(self.base:WaitFrames(40))

		print("frame index: 1457")
		yield_return(self.base:WaitFrames(46))

		print("frame index: 1460")
		yield_return(self.base:WaitFrames(2))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.334176 , -0.1416957 , 3.339703 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 1486")
		yield_return(self.base:WaitFrames(25))
		endPos = CS.UnityEngine.Vector3( 2621.552 , 209.8863 , -1608.268 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.3338672 , 0.02793646 , 3.339703 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1527")
		yield_return(self.base:WaitFrames(40))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.3334887 , 0.1099461 , 3.339703 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 1678")
		yield_return(self.base:WaitFrames(150))
		endPos = CS.UnityEngine.Vector3( 2617.432 , 215.8231 , -1605.406 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.6524203 , -0.002399382 , 3.339703 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1709")
		yield_return(self.base:WaitFrames(30))

		print("frame index: 1743")
		yield_return(self.base:WaitFrames(33))

		print("frame index: 1747")
		yield_return(self.base:WaitFrames(3))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.198911 , -0.08019061 , 3.339703 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 1897")
		yield_return(self.base:WaitFrames(149))
		endPos = CS.UnityEngine.Vector3( 2611.462 , 221.7971 , -1591.328 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.196653 , -0.06870918 , 3.438177 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))
	end)
}





return self
