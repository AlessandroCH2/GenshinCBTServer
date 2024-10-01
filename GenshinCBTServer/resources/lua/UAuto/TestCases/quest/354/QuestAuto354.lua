local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("QuestAuto354",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "QuestAuto354"
self.Category = "任务系统" --自行修改分类
self.Description = "任务354" --自行修改用例描述

UAutoLuaTestCase.Step_1 = {
	Order = 1, --执行顺序
	Type = CaseType.MonoTest,
	Description = "Step_1", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2310.736 , 208.8145 , -1141.423 )
		local initForward = CS.UnityEngine.Vector3( -0.5552663 , 1 , 0.8316726 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 31")
		yield_return(self.base:WaitFrames(30))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.9821132 , 0.1134464 , 3.339703 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 34")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 67")
		yield_return(self.base:WaitFrames(32))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.9821132 , 0.1134464 , 3.339703 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:Jump())
        yield_return(self.base:RunGM("quest finish father 351 352 353"))
        --解锁前置

		
		yield_return(self.base:Jump())


		print("frame index: 398")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 2310.742 , 208.4267 , -1141.423 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.9821132 , 0.1134464 , 3.333687 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 480")
		yield_return(self.base:WaitFrames(81))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/GrpMainBtn/GrpMainToggle/BtnGm/Icon"))

		print("frame index: 494")
		yield_return(self.base:WaitFrames(13))

		print("frame index: 530")
		yield_return(self.base:WaitFrames(35))
		yield_return(self.base:MouseClick( "Canvas/Dialogs/InLevelDebugMenuDialog/Return/Text"))

		print("frame index: 535")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 584")
		yield_return(self.base:WaitFrames(48))
		yield_return(self.base:MouseClick( "Canvas/Pages/LoginMainPage/DebugPanel/Connect/Text"))

		print("frame index: 588")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 853")
		yield_return(self.base:WaitFrames(264))

		print("frame index: 856")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 873")
		yield_return(self.base:WaitFrames(16))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.9426443 , 0.03070442 , 3.339703 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:Jump())
        yield_return(self.base:RunGM("quest accept 35401"))
		--接取354


		yield_return(self.base:Jump())


		print("frame index: 1627")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 2309.441 , 208.7083 , -1142.298 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.8086917 , 0.110018 , 3.294709 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1652")
		yield_return(self.base:WaitFrames(24))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.8064461 , 0.1134464 , 3.344754 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 1679")
		yield_return(self.base:WaitFrames(26))
		endPos = CS.UnityEngine.Vector3( 2305.51 , 208.7546 , -1138.993 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.7704781 , 0.1134464 , 3.850191 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		yield_return(self:WaitCutScene(true))

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
		local initPos = CS.UnityEngine.Vector3( 2193.912 , 212.7991 , -1009.296 )
		local initForward = CS.UnityEngine.Vector3( 0.4283472 , 1 , 0.9036142 )
		--yield_return(self.base:MoveToPositionUntilCutScene(initPos,10,1))
		--yield_return(self.base:InitAvatarRotate(initForward))
        yield_return(self.base:TelePort(initPos))
		
		print("frame index: 36")
		yield_return(self.base:WaitFrames(35))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.013453 , 0.2025274 , 3.398595 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 38")
		yield_return(self.base:WaitFrames(1))

		print("frame index: 53")
		yield_return(self.base:WaitFrames(14))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.013453 , 0.2025274 , 3.398595 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 92")
		yield_return(self.base:WaitFrames(38))
		endPos = CS.UnityEngine.Vector3( 2196.489 , 211.8142 , -1003.856 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.013293 , 0.1169207 , 4.403272 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 123")
		yield_return(self.base:WaitFrames(30))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.013124 , 0.1134464 , 3.339703 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 133")
		yield_return(self.base:WaitFrames(9))
		endPos = CS.UnityEngine.Vector3( 2197.199 , 211.8176 , -1002.356 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.013142 , 0.1134464 , 4.006682 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 142")
		yield_return(self.base:WaitFrames(8))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.013175 , 0.1134464 , 3.802921 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 158")
		yield_return(self.base:WaitFrames(15))
		endPos = CS.UnityEngine.Vector3( 2198.421 , 211.8099 , -999.7728 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.013157 , 0.1134464 , 4.328457 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 176")
		yield_return(self.base:WaitFrames(17))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.012921 , 0.1134464 , 3.433003 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 522")
		yield_return(self.base:WaitFrames(345))
		endPos = CS.UnityEngine.Vector3( 2224.94 , 209.9897 , -943.7559 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.013071 , 0.1134464 , 3.405329 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		yield_return(self:WaitCutScene(true))
	end)
}

return self
