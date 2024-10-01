local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("Quest354",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "Quest354"
self.Category = "任务系统" --自行修改分类
self.Description = "任务354" --自行修改用例描述
self.Order = 355
UAutoLuaTestCase.Step_1 = {
	Order = 1, --执行顺序
	Type = CaseType.MonoTest,
	Description = "安柏入队", --步骤描述
	Action = UAutoCoroutine(function()
	
	    print("frame index: 55")
		yield_return(self.base:WaitFrames(1))
		yield_return(self.base:RunGM("quest finish father 351 362 352 353 355"))
		
		print("frame index: 70")
		yield_return(self.base:WaitFrames(20))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMapPage/GrpMap/Top/BtnClose/Content/Btn"))

		print("frame index: 114")
		yield_return(self.base:WaitFrames(58))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/GrpMainBtn/GrpMainToggle/BtnGm/Icon"))

		print("frame index: 118")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 161")
		yield_return(self.base:WaitFrames(42))
		yield_return(self.base:MouseClick( "Canvas/Dialogs/InLevelDebugMenuDialog/Return/Text"))

		print("frame index: 164")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 232")
		yield_return(self.base:WaitFrames(67))
		yield_return(self.base:MouseClick( "Canvas/Pages/LoginMainPage/DebugPanel/Connect/Text"))
		
		print("frame index: 26")
		yield_return(self.base:WaitFrames(400))
				
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2326.516 , 207.4934 , -1139.429 )
		local initForward = CS.UnityEngine.Vector3( -0.999847 , 1 , 0.01749653 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 23")
		yield_return(self.base:WaitFrames(22))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.09373593 , 0.1495047 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))		
		yield_return(self.base:RunGM("quest finish father 351 362 352 353 355"))
			

		print("frame index: 52")
		yield_return(self.base:WaitFrames(25))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.09373593 , 0.1495047 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 175")
		yield_return(self.base:WaitFrames(122))
		endPos = CS.UnityEngine.Vector3( 2308.603 , 208.1407 , -1141.111 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.09373593 , 0.1495047 , 6 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 182")
		yield_return(self.base:WaitFrames(6))

		print("frame index: 222")
		yield_return(self.base:WaitFrames(39))

		print("frame index: 250")
		yield_return(self.base:WaitFrames(27))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.6628084 , 0.1657275 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 268")
		yield_return(self.base:WaitFrames(17))
		endPos = CS.UnityEngine.Vector3( 2305.551 , 208.7472 , -1139.428 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.6628084 , 0.1657275 , 6 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 731")
		yield_return(self:WaitCutScene(true))

		print("frame index: 1295")
		yield_return(self.base:WaitFrames(4))
	end)
}

return self
