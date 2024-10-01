local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("Quest304",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "Quest304"
self.Category = "任务系统" --自行修改分类
self.Description = "任务304" --自行修改用例描述
self.Order = 504
UAutoLuaTestCase.Step_1 = {
	Order = 1, --执行顺序
	Type = CaseType.MonoTest,
	Description = "对话安柏1", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2245.536 , 209.9995 , -4997.524 )
		local initForward = CS.UnityEngine.Vector3( 0.4731002 , 1 , 0.8810086 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 21")
		yield_return(self.base:WaitFrames(20))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.910177 , 0.1679439 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 25")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 61")
		yield_return(self.base:WaitFrames(35))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.910177 , 0.1679439 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W
		
		

		print("frame index: 111")
		yield_return(self.base:WaitFrames(49))
		endPos = CS.UnityEngine.Vector3( 2248.275 , 208.8401 , -4989.824 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.911499 , 0.1134464 , 6 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))
		
		print("frame index: 103")
		yield_return(self.base:WaitFrames(54))
        yield_return(self.base:SelectDialog( "安柏" ))

		print("frame index: 107")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 162")
		yield_return(self.base:WaitFrames(54))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 164")
		yield_return(self.base:WaitFrames(1))

		print("frame index: 178")
		yield_return(self.base:WaitFrames(13))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 180")
		yield_return(self.base:WaitFrames(1))

		print("frame index: 193")
		yield_return(self.base:WaitFrames(12))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 196")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 201")
		yield_return(self.base:WaitFrames(4))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 205")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 211")
		yield_return(self.base:WaitFrames(5))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 215")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 227")
		yield_return(self.base:WaitFrames(11))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 230")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 236")
		yield_return(self.base:WaitFrames(5))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 238")
		yield_return(self.base:WaitFrames(1))

		print("frame index: 243")
		yield_return(self.base:WaitFrames(4))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 245")
		yield_return(self.base:WaitFrames(1))

		print("frame index: 250")
		yield_return(self.base:WaitFrames(4))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 254")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 257")
		yield_return(self.base:WaitFrames(2))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 261")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 277")
		yield_return(self.base:WaitFrames(15))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 280")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 315")
		yield_return(self.base:WaitFrames(34))

		print("frame index: 355")
		yield_return(self.base:WaitFrames(39))
	end)
}

UAutoLuaTestCase.Step_2 = {
	Order = 2, --执行顺序
	Type = CaseType.MonoTest,
	Description = "对话安柏2", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2292.35 , 214.8004 , -4971.106 )
		local initForward = CS.UnityEngine.Vector3( 0.8261219 , 1 , -0.5634918 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 33")
		yield_return(self.base:WaitFrames(32))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.550949 , 0.254606 , 3.433024 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 36")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 72")
		yield_return(self.base:WaitFrames(35))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.550966 , 0.254606 , 3.433024 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:Jump())


		print("frame index: 82")
		yield_return(self.base:WaitFrames(9))
		endPos = CS.UnityEngine.Vector3( 2292.35 , 214.6884 , -4971.106 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.551073 , 0.254606 , 3.435564 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 173")
		yield_return(self.base:WaitFrames(90))
		yield_return(self.base:SelectDialog( "安柏" ))

		print("frame index: 183")
		yield_return(self.base:WaitFrames(9))

		print("frame index: 241")
		yield_return(self.base:WaitFrames(57))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 244")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 259")
		yield_return(self.base:WaitFrames(14))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 262")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 266")
		yield_return(self.base:WaitFrames(3))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 270")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 274")
		yield_return(self.base:WaitFrames(3))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 278")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 284")
		yield_return(self.base:WaitFrames(5))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 288")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 296")
		yield_return(self.base:WaitFrames(7))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 299")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 314")
		yield_return(self.base:WaitFrames(14))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 317")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 603")
		yield_return(self.base:WaitFrames(285))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 606")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 628")
		yield_return(self.base:WaitFrames(21))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 631")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 634")
		yield_return(self.base:WaitFrames(2))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 637")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 639")
		yield_return(self.base:WaitFrames(1))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 642")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 645")
		yield_return(self.base:WaitFrames(2))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 648")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 651")
		yield_return(self.base:WaitFrames(2))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 654")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 657")
		yield_return(self.base:WaitFrames(2))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 661")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 663")
		yield_return(self.base:WaitFrames(1))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 666")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 669")
		yield_return(self.base:WaitFrames(2))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 672")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 703")
		yield_return(self.base:WaitFrames(30))

		print("frame index: 706")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 750")
		yield_return(self.base:WaitFrames(43))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.559205 , 0.254606 , 3.433024 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:Jump())


		print("frame index: 754")
		yield_return(self.base:WaitFrames(3))
		endPos = CS.UnityEngine.Vector3( 2292.35 , 214.3019 , -4971.104 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.559262 , 0.254606 , 3.405632 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 814")
		yield_return(self.base:WaitFrames(59))

		print("frame index: 861")
		yield_return(self.base:WaitFrames(46))
	end)
}

UAutoLuaTestCase.Step_3 = {
	Order = 3, --执行顺序
	Type = CaseType.MonoTest,
	Description = "射第一个琥珀", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2295.492 , 228.6711 , -4988.263 )
		local initForward = CS.UnityEngine.Vector3( 0.9987456 , 1 , 0.05007464 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 27")
		yield_return(self.base:WaitFrames(26))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.913282 , 0.07789946 , 3.339703 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 30")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 43")
		yield_return(self.base:WaitFrames(12))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.913282 , 0.07789946 , 3.339703 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/AM/ActionBtn_AM(Clone)/Focus/Btn"))

		print("frame index: 44")
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.418006 , 0.2354707 , 1.733009 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 97")
		yield_return(self.base:WaitFrames(52))

		print("frame index: 156")
		yield_return(self.base:WaitFrames(58))
		local deltaAngle = CS.UnityEngine.Vector3( 350.9084 , -7.829422 , 5.529444E-11)
		yield_return(self.base:RotateFocusCamera(deltaAngle))

		print("frame index: 171")
		yield_return(self.base:WaitFrames(14))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/Skill1/ActionBtn_Skill1(Clone)", true ))

		print("frame index: 202")
		yield_return(self.base:WaitFrames(30))
		self.base:MouseUp()

		print("frame index: 279")
		yield_return(self.base:WaitFrames(76))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/Skill1/ActionBtn_Skill1(Clone)", true ))

		print("frame index: 348")
		yield_return(self.base:WaitFrames(68))
		self.base:MouseUp()

		print("frame index: 395")
		yield_return(self.base:WaitFrames(46))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/AM/ActionBtn_AM(Clone)/Normal/Btn"))

		print("frame index: 403")
		yield_return(self.base:WaitFrames(7))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.52719 , 0.1171488 , 2.17992 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 434")
		yield_return(self.base:WaitFrames(30))

		print("frame index: 436")
		yield_return(self.base:WaitFrames(1))
	end)
}

UAutoLuaTestCase.Step_4 = {
	Order = 4, --执行顺序
	Type = CaseType.MonoTest,
	Description = "射第二个琥珀", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2309.198 , 232.1451 , -4937.904 )
		local initForward = CS.UnityEngine.Vector3( -0.6026234 , 1 , -0.7980256 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 24")
		yield_return(self.base:WaitFrames(23))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.9336449 , 0.1265453 , 4.367935 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 27")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 39")
		yield_return(self.base:WaitFrames(11))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.9336449 , 0.1265453 , 4.367935 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:Jump())


		print("frame index: 44")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 2309.198 , 231.7785 , -4937.904 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.9335123 , 0.1265453 , 4.309283 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 81")
		yield_return(self.base:WaitFrames(36))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.9334233 , 0.1265453 , 4.367935 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/AM/ActionBtn_AM(Clone)/Focus/Btn"))

		print("frame index: 84")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 111")
		yield_return(self.base:WaitFrames(26))

		print("frame index: 227")
		yield_return(self.base:WaitFrames(115))
		local deltaAngle = CS.UnityEngine.Vector3( 349.1631 , 0.6672821 , -2.577821E-09)
		yield_return(self.base:RotateFocusCamera(deltaAngle))

		print("frame index: 253")
		yield_return(self.base:WaitFrames(25))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/Skill1/ActionBtn_Skill1(Clone)", true ))

		print("frame index: 295")
		yield_return(self.base:WaitFrames(41))
		self.base:MouseUp()

		print("frame index: 369")
		yield_return(self.base:WaitFrames(73))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/Skill1/ActionBtn_Skill1(Clone)", true ))

		print("frame index: 425")
		yield_return(self.base:WaitFrames(55))
		self.base:MouseUp()

		print("frame index: 494")
		yield_return(self.base:WaitFrames(68))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/AM/ActionBtn_AM(Clone)/Normal/Btn"))

		print("frame index: 497")
		yield_return(self.base:WaitFrames(2))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 1.351325 , 0.1272771 , 1.830327 )
		yield_return(self.base:RotateByCameraData(cameraData))
	end)
}

UAutoLuaTestCase.Step_5 = {
	Order = 5, --执行顺序
	Type = CaseType.MonoTest,
	Description = "射第三个琥珀", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2317.462 , 256.9068 , -4884.739 )
		local initForward = CS.UnityEngine.Vector3( 0.08713711 , 1 , -0.9961964 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 21")
		yield_return(self.base:WaitFrames(20))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 1.744267 , -0.1502232 , 4.356638 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 24")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 40")
		yield_return(self.base:WaitFrames(15))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 1.744267 , -0.1502232 , 4.356638 )
		yield_return(self.base:RotateByCameraData(cameraData))


		print("frame index: 44")
		yield_return(self.base:WaitFrames(3))
		endPos = CS.UnityEngine.Vector3( 2317.572 , 259.2667 , -4884.746 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 1.754069 , -0.1502232 , 4.356638 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 98")
		yield_return(self.base:WaitFrames(53))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 1.754578 , -0.1502232 , 4.356638 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/AM/ActionBtn_AM(Clone)/Focus/Btn"))

		print("frame index: 101")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 142")
		yield_return(self.base:WaitFrames(40))

		print("frame index: 209")
		yield_return(self.base:WaitFrames(66))
		local deltaAngle = CS.UnityEngine.Vector3( -14.78961 , 3.119324 , 2.555073E-06)
		yield_return(self.base:RotateFocusCamera(deltaAngle))

		print("frame index: 240")
		yield_return(self.base:WaitFrames(30))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/Skill1/ActionBtn_Skill1(Clone)", true ))

		print("frame index: 301")
		yield_return(self.base:WaitFrames(60))
		self.base:MouseUp()

		print("frame index: 358")
		yield_return(self.base:WaitFrames(56))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/Skill1/ActionBtn_Skill1(Clone)", true ))

		print("frame index: 409")
		yield_return(self.base:WaitFrames(50))
		self.base:MouseUp()

		print("frame index: 475")
		yield_return(self.base:WaitFrames(65))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/AM/ActionBtn_AM(Clone)/Normal/Btn"))

		print("frame index: 480")
		yield_return(self.base:WaitFrames(4))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.021846 , -0.03549826 , 2.029295 )
		yield_return(self.base:RotateByCameraData(cameraData))
	end)
}

UAutoLuaTestCase.Step_6 = {
	Order = 6, --执行顺序
	Type = CaseType.MonoTest,
	Description = "射第四个琥珀", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2365.92 , 259.2918 , -4875.804 )
		local initForward = CS.UnityEngine.Vector3( -0.8183736 , 1 , 0.5746864 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 21")
		yield_return(self.base:WaitFrames(20))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.6803856 , 0.02459093 , 4.356638 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 26")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 51")
		yield_return(self.base:WaitFrames(24))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.6803856 , 0.02459093 , 4.356638 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:Jump())


		print("frame index: 54")
		yield_return(self.base:WaitFrames(2))
		endPos = CS.UnityEngine.Vector3( 2365.925 , 258.3844 , -4875.831 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.6796041 , 0.02459093 , 4.334667 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 92")
		yield_return(self.base:WaitFrames(37))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.6781259 , 0.02459093 , 4.356638 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/AM/ActionBtn_AM(Clone)/Focus/Btn"))

		print("frame index: 95")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 110")
		yield_return(self.base:WaitFrames(14))

		print("frame index: 184")
		yield_return(self.base:WaitFrames(73))
		local deltaAngle = CS.UnityEngine.Vector3( 351.0128 , -0.1358032 , 2.153258E-07)
		yield_return(self.base:RotateFocusCamera(deltaAngle))

		print("frame index: 212")
		yield_return(self.base:WaitFrames(27))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/Skill1/ActionBtn_Skill1(Clone)", true ))

		print("frame index: 268")
		yield_return(self.base:WaitFrames(55))
		self.base:MouseUp()

		print("frame index: 339")
		yield_return(self.base:WaitFrames(70))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/Skill1/ActionBtn_Skill1(Clone)", true ))

		print("frame index: 410")
		yield_return(self.base:WaitFrames(70))
		self.base:MouseUp()

		print("frame index: 459")
		yield_return(self.base:WaitFrames(48))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/ActionPanelContainer/ActionBtnPanel/AM/ActionBtn_AM(Clone)/Normal/Btn"))

		print("frame index: 462")
		yield_return(self.base:WaitFrames(2))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.2451099 , 0.08170295 , 1.810966 )
		yield_return(self.base:RotateByCameraData(cameraData))
	end)
}

UAutoLuaTestCase.Step_7 = {
	Order = 7, --执行顺序
	Type = CaseType.MonoTest,
	Description = "对话安柏3", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2358.758 , 249.6509 , -4864.181 )
		local initForward = CS.UnityEngine.Vector3( 0.4357832 , 1 , 0.9000517 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 22")
		yield_return(self.base:WaitFrames(21))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.131948 , 0.2415342 , 4.467103 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 26")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 43")
		yield_return(self.base:WaitFrames(16))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.131948 , 0.2415342 , 4.467103 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:Jump())


		print("frame index: 48")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 2358.758 , 249.4109 , -4864.181 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.13197 , 0.2415342 , 4.442454 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 145")
		yield_return(self.base:WaitFrames(96))
		yield_return(self.base:SelectDialog( "安柏" ))

		print("frame index: 150")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 201")
		yield_return(self.base:WaitFrames(50))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 205")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 220")
		yield_return(self.base:WaitFrames(14))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 224")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 237")
		yield_return(self.base:WaitFrames(12))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 241")
		yield_return(self.base:WaitFrames(3))
	end)
}

return self
