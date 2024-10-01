local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("Quest301",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "Quest301"
self.Category = "任务系统" --自行修改分类
self.Description = "任务301" --自行修改用例描述
self.Order = 501
UAutoLuaTestCase.Step_1 = {
	Order = 1, --执行顺序
	Type = CaseType.MonoTest,
	Description = "看cutscene", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2205.637 , 208.8428 , -5058.042 )
		local initForward = CS.UnityEngine.Vector3( 0.6312173 , 1 , 0.775606 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 19")
		yield_return(self.base:WaitFrames(18))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.194749 , 0.1745344 , 3.380088 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 23")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 36")
		yield_return(self.base:WaitFrames(12))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.194749 , 0.1745344 , 3.380088 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:Jump())


		print("frame index: 41")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 2205.637 , 208.6216 , -5058.042 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.194748 , 0.1745344 , 3.36376 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 74")
		yield_return(self.base:WaitFrames(32))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/MapInfo/BtnToggleQuest"))

		print("frame index: 77")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 102")
		yield_return(self.base:WaitFrames(24))
		yield_return(self.base:MouseClick( "Canvas/Dialogs/InLevelQuestDialog/GrpQuestBook/GrpQuestDetail/Action/TrackerBtn/Content"))

		print("frame index: 105")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 127")
		yield_return(self.base:WaitFrames(21))
		yield_return(self.base:MouseClick( "Canvas/Dialogs/InLevelQuestDialog/GrpQuestBook/GrpQuestDetail/Action/TrackerBtn/Content"))

		print("frame index: 131")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 190")
		yield_return(self.base:WaitFrames(58))

		print("frame index: 195")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 205")
		yield_return(self.base:WaitFrames(9))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.194699 , 0.1745344 , 3.380088 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 230")
		yield_return(self.base:WaitFrames(24))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/Sprint/ActionBtn_Sprint(Clone)"))

		print("frame index: 234")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 386")
		yield_return(self.base:WaitFrames(151))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/Sprint/ActionBtn_Sprint(Clone)"))

		print("frame index: 391")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 541")
		yield_return(self.base:WaitFrames(149))
		endPos = CS.UnityEngine.Vector3( 2242.918 , 208.9904 , -5001.518 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.195218 , 0.1134464 , 3.361171 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 552")
		yield_return(self.base:WaitFrames(10))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.195218 , 0.1134464 , 3.361171 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 560")
		yield_return(self.base:WaitFrames(7))
		endPos = CS.UnityEngine.Vector3( 2242.918 , 208.9904 , -5001.518 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.195218 , 0.1134464 , 3.361171 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 639")
		yield_return(self.base:WaitFrames(78))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.195218 , 0.1134464 , 3.361171 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 643")
		yield_return(self.base:WaitFrames(3))
		endPos = CS.UnityEngine.Vector3( 2242.918 , 208.9904 , -5001.518 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.195218 , 0.1134464 , 3.361171 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 2611")
		yield_return(self.base:WaitFrames(1967))

		print("frame index: 2613")
		yield_return(self.base:WaitFrames(1))

		print("frame index: 2621")
		yield_return(self.base:WaitFrames(7))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.891517 , 0.1134464 , 3.339703 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:Jump())


		print("frame index: 2623")
		yield_return(self.base:WaitFrames(1))
		endPos = CS.UnityEngine.Vector3( 2243.362 , 209.0041 , -5000.889 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.891323 , 0.1134464 , 3.339703 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 2624")
	end)
}

UAutoLuaTestCase.Step_2 = {
	Order = 2, --执行顺序
	Type = CaseType.MonoTest,
	Description = "对话温迪", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2250.099 , 209.9998 , -4995.555 )
		local initForward = CS.UnityEngine.Vector3( 0.5902336 , 1 , 0.8072325 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 20")
		yield_return(self.base:WaitFrames(19))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.214197 , 0.215078 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 24")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 41")
		yield_return(self.base:WaitFrames(16))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.214197 , 0.215078 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 75")
		yield_return(self.base:WaitFrames(33))
		endPos = CS.UnityEngine.Vector3( 2253.475 , 208.8021 , -4991.053 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.214045 , 0.1192116 , 6 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 116")
		yield_return(self.base:WaitFrames(40))

		print("frame index: 172")
		yield_return(self.base:WaitFrames(55))

		print("frame index: 190")
		yield_return(self.base:WaitFrames(17))
		yield_return(self.base:SelectDialog( "温迪" ))

		print("frame index: 192")
		yield_return(self.base:WaitFrames(10))

		print("frame index: 246")
		yield_return(self.base:WaitFrames(53))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 250")
		yield_return(self.base:WaitFrames(5))
	end)
}

UAutoLuaTestCase.Step_3 = {
	Order = 3, --执行顺序
	Type = CaseType.MonoTest,
	Description = "对话老板", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2255.367 , 209.8002 , -4994.492 )
		local initForward = CS.UnityEngine.Vector3( 0.1839879 , 1 , -0.9829286 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 41")
		yield_return(self.base:WaitFrames(40))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 1.751397 , 0.1134464 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 44")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 65")
		yield_return(self.base:WaitFrames(20))
		yield_return(self.base:SelectDialog( "老板" ))

		print("frame index: 69")
		yield_return(self.base:WaitFrames(10))

		print("frame index: 114")
		yield_return(self.base:WaitFrames(44))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 117")
		yield_return(self.base:WaitFrames(5))
	end)
}

UAutoLuaTestCase.Step_4 = {
	Order = 4, --执行顺序
	Type = CaseType.MonoTest,
	Description = "对话安柏", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2248.989 , 209.8002 , -4989.938 )
		local initForward = CS.UnityEngine.Vector3( -0.7849898 , 1 , 0.6195089 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 61")
		yield_return(self.base:WaitFrames(60))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.069973 , 0.3750407 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:SelectDialog( "安柏" ))

		print("frame index: 65")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 138")
		yield_return(self.base:WaitFrames(72))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 140")
		yield_return(self.base:WaitFrames(5))
	end)
}

return self
