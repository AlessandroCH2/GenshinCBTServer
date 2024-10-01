local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("Quest353",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "Quest353"
self.Category = "任务系统" --自行修改分类
self.Description = "任务353" --自行修改用例描述

UAutoLuaTestCase.Step_1 = {
	Order = 1, --执行顺序
	Type = CaseType.MonoTest,
	Description = "对话派蒙+杀怪", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )
		local startPos = CS.UnityEngine.Vector3(2561.245,213.3913,-1331.259)
		
		yield_return(self.base:RunGM("quest clear father 353"))
		yield_return(self.base:RunGM("quest finish father 351 362 352"))
		yield_return(self.base:TelePort(startPos))
		
		yield_return(self.base:WaitFrames(43))
        yield_return(self:WaitMoveToEntityByName("Kanban"))
		yield_return(self.base:WaitFrames(30))
		yield_return(self.base:SelectDialog( "派蒙" ))

		yield_return(self:WaitCutScene(true))
		print("frame index: 589")
		yield_return(self.base:WaitFrames(77))
		yield_return(self.base:MouseClick( "Canvas/SuspendBars/TutorialDialog/Content/ClickBtn"))

		print("frame index: 594")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 615")
		yield_return(self.base:WaitFrames(20))

		print("frame index: 687")
		yield_return(self.base:WaitFrames(71))

		print("frame index: 727")
		yield_return(self.base:WaitFrames(39))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 1.636148 , 0.2859693 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:Jump())
		yield_return(self.base:RunGM("kill monster all"))


		print("frame index: 732")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 2565.491 , 213.5402 , -1333.999 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 1.637227 , 0.2859693 , 5.855431 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 834")
		yield_return(self.base:WaitFrames(101))

		print("frame index: 868")
		yield_return(self.base:WaitFrames(33))

		print("frame index: 869")

		print("frame index: 874")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 890")
		yield_return(self.base:WaitFrames(15))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.2313108 , 0.3091425 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:Jump())
		yield_return(self.base:RunGM("kill monster all"))


		print("frame index: 894")
		yield_return(self.base:WaitFrames(3))
		endPos = CS.UnityEngine.Vector3( 2565.503 , 213.4386 , -1334.008 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.2323836 , 0.3091425 , 5.849073 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 926")
		yield_return(self.base:WaitFrames(31))

		print("frame index: 954")
		yield_return(self.base:WaitFrames(27))

		print("frame index: 973")
		yield_return(self.base:WaitFrames(18))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.6310692 , 0.3767076 , 6 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:Jump())
		yield_return(self.base:RunGM("kill monster all"))


		print("frame index: 976")
		yield_return(self.base:WaitFrames(2))
		endPos = CS.UnityEngine.Vector3( 2565.516 , 213.2171 , -1334.018 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -0.6309843 , 0.3767076 , 5.879768 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1019")
		yield_return(self.base:WaitFrames(42))

		print("frame index: 1093")
		yield_return(self.base:WaitFrames(73))

		print("frame index: 1122")
		yield_return(self.base:WaitFrames(28))

		print("frame index: 1166")
		yield_return(self.base:WaitFrames(43))
        yield_return(self:WaitMoveToEntityByName("Kanban"))
		yield_return(self.base:WaitFrames(30))
		yield_return(self.base:SelectDialog( "派蒙" ))

		print("frame index: 28")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 218")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 312")
		yield_return(self.base:WaitFrames(93))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 317")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 429")
		yield_return(self.base:WaitFrames(111))
		yield_return(self.base:MouseClick( "Canvas/Dialogs/TalkDialog/GrpSelect/0/Highlight"))

		print("frame index: 434")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 556")
		yield_return(self.base:WaitFrames(121))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 561")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 620")
		yield_return(self.base:WaitFrames(58))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 630")
		yield_return(self.base:WaitFrames(9))

		print("frame index: 720")
		yield_return(self.base:WaitFrames(89))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 725")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 811")
		yield_return(self.base:WaitFrames(85))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 816")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 946")
		yield_return(self.base:WaitFrames(129))
		yield_return(self.base:MouseClick( "Canvas/Dialogs/TalkDialog/GrpSelect/0/Highlight"))

		print("frame index: 951")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 1052")
		yield_return(self:WaitCutScene(true,60,true))
		yield_return(self.base:MouseClick( "NameField"))
		yield_return(self.base:CreateName( "我是测试名字" ))

		print("frame index: 1056")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 1153")
		yield_return(self.base:WaitFrames(96))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelNamePage/GrpName/OKBtn/Content/ImgBg"))



		
	end)
}

UAutoLuaTestCase.Step_2 = {
	Order = 2, --执行顺序
	Type = CaseType.MonoTest,
	Description = "解锁女神像+对话派蒙", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		yield_return(self:WaitMoveToEntityByName("Kanban"))
		yield_return(self:WaitCutScene(true,10,true))
		print("frame index: 0")
		yield_return(self:WaitMoveToEntityByName("SP014_ProtoType_01"))

		yield_return(self.base:SelectDialog( "七天神像" ))

		yield_return(self:WaitCutScene(true))
		
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMapPage/GrpMap/Top/BtnClose/Content/Btn"))


		print("frame index: 819")
		yield_return(self.base:WaitFrames(4))

		yield_return(self:WaitMoveToEntityByName("Kanban"))
		yield_return(self.base:WaitFrames(30))
		yield_return(self.base:SelectDialog( "派蒙" ))
		

		yield_return(self:WaitCutScene(true,10,true))

	end)
}


return self
