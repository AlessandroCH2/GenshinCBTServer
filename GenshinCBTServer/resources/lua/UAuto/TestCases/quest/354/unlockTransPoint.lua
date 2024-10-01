local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("unlockTransPoint",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "unlockTransPoint"
self.Category = "任务系统" --自行修改分类
self.Description = "遍历传送点" --自行修改用例描述
UAutoLuaTestCase.Step_1 = {
	Order = 1, --执行顺序
	Type = CaseType.MonoTest,
	Description = "clearall", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		

		yield_return(self:FinishAllNoob())

		print("frame index: 1591")
		yield_return(self.base:WaitFrames(2))
		
		print("frame index: 48")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 119")
		yield_return(self.base:WaitFrames(70))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.820496 , 0.1493668 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))


		print("frame index: 121")
		yield_return(self.base:WaitFrames(1))
		endPos = CS.UnityEngine.Vector3( 2745.824 , 194.5953 , -1718.185 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.820496 , 0.1493668 , 6 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		
		print("frame index: 226")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 342")
		yield_return(self.base:WaitFrames(115))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/GrpMainBtn/GrpMainToggle/BtnGm/Icon"))

		print("frame index: 348")
		yield_return(self.base:WaitFrames(5))

		print("frame index: 395")
		yield_return(self.base:WaitFrames(46))
		yield_return(self.base:MouseClick( "Canvas/Dialogs/InLevelDebugMenuDialog/Return/Text"))

		print("frame index: 402")
		yield_return(self.base:WaitFrames(6))

		print("frame index: 480")
		yield_return(self.base:WaitFrames(77))
		yield_return(self.base:MouseClick( "Canvas/Pages/LoginMainPage/DebugPanel/Connect/Text"))

		print("frame index: 485")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 650")
		yield_return(self.base:WaitFrames(164))

		print("frame index: 698")
		yield_return(self.base:WaitFrames(47))

		print("frame index: 741")
		yield_return(self.base:WaitFrames(42))

		print("frame index: 768")
		yield_return(self.base:WaitFrames(26))

		print("frame index: 810")
		yield_return(self.base:WaitFrames(41))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.8111091 , 0.09490784 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 815")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 2745.673 , 194.595 , -1718.013 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.8115311 , 0.09674919 , 6 )
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
		local initPos = CS.UnityEngine.Vector3( 2618.025 , 233.2316 , -1552.342 )
		local initForward = CS.UnityEngine.Vector3( -0.6024703 , 1 , 0.7981412 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 29")
		yield_return(self.base:WaitFrames(28))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.6280304 , 0.2080354 , 4.55538 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 33")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 89")
		yield_return(self.base:WaitFrames(55))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.6280304 , 0.2080354 , 4.55538 )
		yield_return(self.base:RotateByCameraData(cameraData))


		print("frame index: 91")
		yield_return(self.base:WaitFrames(1))
		endPos = CS.UnityEngine.Vector3( 2618.024 , 232.2322 , -1552.342 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.6280625 , 0.2080354 , 4.55538 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))
	end)
}

UAutoLuaTestCase.Step_3 = {
	Order = 3, --执行顺序
	Type = CaseType.MonoTest,
	Description = "Step_3", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2265.196 , 245.5196 , -1567.859 )
		local initForward = CS.UnityEngine.Vector3( 0.5717404 , 1 , -0.8204347 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 67")
		yield_return(self.base:WaitFrames(66))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.4152367 , 0.0202133 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 70")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 77")
		yield_return(self.base:WaitFrames(6))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.4152367 , 0.0202133 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))


		print("frame index: 80")
		yield_return(self.base:WaitFrames(2))
		endPos = CS.UnityEngine.Vector3( 2265.196 , 244.6188 , -1567.859 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.4152054 , 0.0202133 , 5.998719 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))
	end)
}

UAutoLuaTestCase.Step_4 = {
	Order = 4, --执行顺序
	Type = CaseType.MonoTest,
	Description = "Step_4", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2219.968 , 226.7862 , -1158.445 )
		local initForward = CS.UnityEngine.Vector3( -0.9953936 , 1 , -0.095873 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 16")
		yield_return(self.base:WaitFrames(15))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.055486 , 0.2095218 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 19")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 27")
		yield_return(self.base:WaitFrames(7))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.055486 , 0.2095218 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))


		print("frame index: 30")
		yield_return(self.base:WaitFrames(2))
		endPos = CS.UnityEngine.Vector3( 2219.968 , 225.8824 , -1158.446 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.055392 , 0.2095218 , 5.98192 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))
	end)
}

UAutoLuaTestCase.Step_5 = {
	Order = 5, --执行顺序
	Type = CaseType.MonoTest,
	Description = "女神像2解锁", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 1941.144 , 195.7516 , -1273.105 )
		local initForward = CS.UnityEngine.Vector3( -0.9971584 , 1 , 0.07533532 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 27")
		yield_return(self.base:WaitFrames(26))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.05292739 , 0.1249507 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 31")
		yield_return(self.base:WaitFrames(3))
		yield_return(self:WaitMoveToEntityByName("ProtoType_01"))

		print("frame index: 190")
		yield_return(self.base:WaitFrames(58))
		yield_return(self.base:RunGM("kill monster all"))
		yield_return(self.base:SelectDialog( "七天神像" ))

		print("frame index: 193")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 498")
		yield_return(self.base:WaitFrames(304))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 503")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 630")
		yield_return(self.base:WaitFrames(126))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMapPage/GrpMap/Top/BtnClose/Content/Btn"))

		print("frame index: 636")
		yield_return(self.base:WaitFrames(5))

		print("frame index: 681")
		yield_return(self.base:WaitFrames(44))

		print("frame index: 685")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 711")
		yield_return(self.base:WaitFrames(25))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.2370598 , 0.1134464 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))


		print("frame index: 715")
		yield_return(self.base:WaitFrames(3))
		endPos = CS.UnityEngine.Vector3( 1932.878 , 195.9561 , -1272.972 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.2370558 , 0.1134464 , 5.96889 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))
	end)
}

UAutoLuaTestCase.Step_6  = {
	Order = 6, --执行顺序
	Type = CaseType.MonoTest,
	Description = "女神像3解锁", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 1852.587 , 258.1593 , -572.325 )
		local initForward = CS.UnityEngine.Vector3( 0.8906822 , 1 , -0.4546268 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 21")
		yield_return(self.base:WaitFrames(20))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.664153 , 0.2042943 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 24")
		yield_return(self.base:WaitFrames(2))

		
		print("frame index: 169")
		yield_return(self.base:WaitFrames(2))
		endPos = CS.UnityEngine.Vector3( 1856.372 , 257.6521 , -574.282 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.664191 , 0.1329021 , 6 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))
		
		yield_return(self:WaitMoveToEntityByName("ProtoType_01"))

		print("frame index: 205")
		yield_return(self.base:WaitFrames(35))
		yield_return(self.base:RunGM("kill monster all"))
		yield_return(self.base:SelectDialog( "七天神像" ))

		print("frame index: 208")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 482")
		yield_return(self.base:WaitFrames(273))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 487")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 629")
		yield_return(self.base:WaitFrames(141))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMapPage/GrpMap/Top/BtnClose/Content/Btn"))

		print("frame index: 634")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 739")
		yield_return(self.base:WaitFrames(104))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.664188 , 0.3867587 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))


		print("frame index: 742")
		yield_return(self.base:WaitFrames(2))
		endPos = CS.UnityEngine.Vector3( 1856.952 , 257.7219 , -574.582 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.664204 , 0.3862532 , 5.970783 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))
	end)
}

UAutoLuaTestCase.Step_7 = {
	Order = 7, --执行顺序
	Type = CaseType.MonoTest,
	Description = "Step_7", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2024.193 , 212.7572 , -823.771 )
		local initForward = CS.UnityEngine.Vector3( 0.4166157 , 1 , -0.9090827 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 77")
		yield_return(self.base:WaitFrames(76))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.380388 , 0.4987207 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 80")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 91")
		yield_return(self.base:WaitFrames(10))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.380388 , 0.4987207 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))


		print("frame index: 95")
		yield_return(self.base:WaitFrames(3))
		endPos = CS.UnityEngine.Vector3( 2024.196 , 212.2881 , -823.771 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.380388 , 0.4987207 , 5.773318 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))
	end)
}

UAutoLuaTestCase.Step_8 = {
	Order = 8, --执行顺序
	Type = CaseType.MonoTest,
	Description = "Step_8", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 1979.072 , 224.5172 , -1525.753 )
		local initForward = CS.UnityEngine.Vector3( -0.7307107 , 1 , 0.6826872 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 13")
		yield_return(self.base:WaitFrames(12))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.8604271 , 0.2437425 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 17")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 29")
		yield_return(self.base:WaitFrames(11))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.8604271 , 0.2437425 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))


	end)
}

UAutoLuaTestCase.Step_9 = {
	Order = 9, --执行顺序
	Type = CaseType.MonoTest,
	Description = "Step_9", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 1791.304 , 237.1951 , -913.281 )
		local initForward = CS.UnityEngine.Vector3( 0.2780675 , 1 , 0.9605615 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 17")
		yield_return(self.base:WaitFrames(16))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.553378 , 0.3402803 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 20")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 32")
		yield_return(self.base:WaitFrames(11))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.553378 , 0.3402803 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))


		print("frame index: 37")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 1791.304 , 236.9044 , -913.281 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.553375 , 0.3402803 , 5.802649 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))
	end)
}

UAutoLuaTestCase.Step_10 = {
	Order = 10, --执行顺序
	Type = CaseType.MonoTest,
	Description = "Step_10", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 1510 , 272.5791 , -1519 )
		local initForward = CS.UnityEngine.Vector3( 0.2780675 , 1 , 0.9605615 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 17")
		yield_return(self.base:WaitFrames(16))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.118324 , 0.264036 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 21")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 34")
		yield_return(self.base:WaitFrames(12))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.118324 , 0.264036 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))


		print("frame index: 38")
		yield_return(self.base:WaitFrames(3))
		endPos = CS.UnityEngine.Vector3( 1510 , 271.9111 , -1519 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.118371 , 0.264036 , 5.921689 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))
	end)
}

UAutoLuaTestCase.Step_11 = {
	Order = 11, --执行顺序
	Type = CaseType.MonoTest,
	Description = "Step_11", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 1425 , 356.7453 , -2059 )
		local initForward = CS.UnityEngine.Vector3( 0.2780675 , 1 , 0.9605615 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 22")
		yield_return(self.base:WaitFrames(21))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.489875 , 0.2249978 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 25")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 38")
		yield_return(self.base:WaitFrames(12))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.489875 , 0.2249978 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))


		print("frame index: 41")
		yield_return(self.base:WaitFrames(2))
		endPos = CS.UnityEngine.Vector3( 1426.685, 331.7986, -2059.168 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.489852 , 0.2249978 , 5.96021 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))
	end)
}

return self
