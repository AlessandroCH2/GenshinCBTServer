local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("Quest305",baseClass)

local self = UAutoLuaTestCase
self.TestFixture = "Quest305"
self.Category = "任务系统" --自行修改分类
self.Description = "任务305" --自行修改用例描述
self.Order = 505
UAutoLuaTestCase.Step305_1 = {
	Order = 1, --执行顺序
	Type = CaseType.MonoTest,
	Description = "对话安柏", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )
		
		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2355.105 , 249.6509 , -4869.049 )
		local initForward = CS.UnityEngine.Vector3( 0.5262355 , 1 , 0.8503389 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 14")
		yield_return(self.base:WaitFrames(13))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.203797 , 0.2061161 , 3.635302 )
		yield_return(self.base:RotateByCameraData(cameraData))
		

		print("frame index: 18")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 31")
		yield_return(self.base:WaitFrames(12))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.203797 , 0.2061161 , 3.635302 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 75")
		yield_return(self.base:WaitFrames(43))
		endPos = CS.UnityEngine.Vector3( 2359.371 , 248.6507 , -4863.232 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.203896 , 0.1152906 , 4.644284 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 132")
		yield_return(self.base:WaitFrames(56))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.2041 , 0.1134464 , 3.570441 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(90,false))    --S


		print("frame index: 136")
		yield_return(self.base:WaitFrames(3))
		endPos = CS.UnityEngine.Vector3( 2359.326 , 248.6507 , -4862.728 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.182872 , 0.1134464 , 3.345642 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 177")
		yield_return(self.base:WaitFrames(40))
		yield_return(self.base:SelectDialog( "安柏" ))

		print("frame index: 180")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 202")
		yield_return(self.base:WaitFrames(21))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 206")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 235")
		yield_return(self.base:WaitFrames(28))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 238")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 501")
		yield_return(self.base:WaitFrames(262))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 504")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 517")
		yield_return(self.base:WaitFrames(12))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 520")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 527")
		yield_return(self.base:WaitFrames(6))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 530")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 540")
		yield_return(self.base:WaitFrames(9))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 544")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 585")
		yield_return(self.base:WaitFrames(40))

		print("frame index: 589")
		yield_return(self.base:WaitFrames(3))
	end)
}

UAutoLuaTestCase.Step305_2 = {
	Order = 2, --执行顺序
	Type = CaseType.MonoTest,
	Description = "杀怪救温蒂", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2388.939 , 267.1653 , -4830.039 )
		local initForward = CS.UnityEngine.Vector3( -0.7753943 , 1 , -0.6314775 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 17")
		yield_return(self.base:WaitFrames(16))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.6867651 , 0.161708 , 3.912969 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 23")
		yield_return(self.base:WaitFrames(5))

		print("frame index: 76")
		yield_return(self.base:WaitFrames(52))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.6866976 , 0.161708 , 3.912969 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:Jump())
		yield_return(self.base:RunGM("KILL MONSTER ALL"))
		


		print("frame index: 80")
		yield_return(self.base:WaitFrames(3))
		endPos = CS.UnityEngine.Vector3( 2388.941 , 266.6819 , -4830.041 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.6869463 , 0.161708 , 3.912969 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 188")
		yield_return(self.base:WaitFrames(107))

		print("frame index: 192")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 207")
		yield_return(self.base:WaitFrames(14))

		print("frame index: 211")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 232")
		yield_return(self.base:WaitFrames(20))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.6871328 , 0.161708 , 3.912969 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 266")
		yield_return(self.base:WaitFrames(33))
		endPos = CS.UnityEngine.Vector3( 2384.415 , 266.5822 , -4833.765 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.6876414 , 0.1160436 , 5.552809 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 362")
		yield_return(self.base:WaitFrames(95))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.6877026 , 0.1134464 , 3.57051 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 367")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 2383.976 , 266.6346 , -4834.125 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.6876831 , 0.1134464 , 3.570482 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 376")
		yield_return(self.base:WaitFrames(8))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 379")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 391")
		yield_return(self.base:WaitFrames(11))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 394")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 398")
		yield_return(self.base:WaitFrames(3))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 401")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 404")
		yield_return(self.base:WaitFrames(2))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 405")
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.6878365 , 0.1134464 , 3.570442 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))


		print("frame index: 407")
		yield_return(self.base:WaitFrames(1))
		endPos = CS.UnityEngine.Vector3( 2383.976 , 266.6346 , -4834.125 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.8203059 , 0.1134464 , 3.570442 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))


		print("frame index: 409")
		yield_return(self.base:WaitFrames(1))

		print("frame index: 411")
		yield_return(self.base:WaitFrames(1))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 414")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 424")
		yield_return(self.base:WaitFrames(9))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 427")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 437")
		yield_return(self.base:WaitFrames(9))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 438")

		print("frame index: 449")
		yield_return(self.base:WaitFrames(10))

		print("frame index: 453")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 456")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 459")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 479")
		yield_return(self.base:WaitFrames(19))


		print("frame index: 481")
		yield_return(self.base:WaitFrames(1))
		endPos = CS.UnityEngine.Vector3( 2383.901 , 266.6648 , -4834.046 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.8141491 , 0.1134464 , 3.561504 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))


		print("frame index: 497")
		yield_return(self.base:WaitFrames(15))


		print("frame index: 502")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 2384.322 , 266.6284 , -4833.685 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.8069068 , 0.1134464 , 3.47451 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))


		print("frame index: 520")
		yield_return(self.base:WaitFrames(17))


		print("frame index: 522")
		yield_return(self.base:WaitFrames(1))
		endPos = CS.UnityEngine.Vector3( 2384.737 , 266.4568 , -4834.155 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.8613407 , 0.1134464 , 3.645389 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))


		print("frame index: 539")
		yield_return(self.base:WaitFrames(16))


		print("frame index: 542")
		yield_return(self.base:WaitFrames(2))
		endPos = CS.UnityEngine.Vector3( 2384.405 , 266.449 , -4834.662 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.8755977 , 0.1134464 , 3.639126 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))


		print("frame index: 653")
		yield_return(self.base:WaitFrames(110))


		print("frame index: 666")
		yield_return(self.base:WaitFrames(12))
		endPos = CS.UnityEngine.Vector3( 2384.37 , 266.3077 , -4835.583 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.9095678 , 0.1134464 , 3.748701 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))


		print("frame index: 686")
		yield_return(self.base:WaitFrames(19))


		print("frame index: 695")
		yield_return(self.base:WaitFrames(8))
		endPos = CS.UnityEngine.Vector3( 2384.395 , 266.2985 , -4835.605 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.9255137 , 0.1134464 , 3.570441 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))


		print("frame index: 712")
		yield_return(self.base:WaitFrames(16))


		print("frame index: 719")
		yield_return(self.base:WaitFrames(6))
		endPos = CS.UnityEngine.Vector3( 2384.395 , 266.2985 , -4835.605 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.9264966 , 0.1134464 , 3.570441 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))


		print("frame index: 724")
		yield_return(self.base:WaitFrames(4))


		print("frame index: 728")
		yield_return(self.base:WaitFrames(3))
		yield_return(self.base:MoveByAngle(225,false))    --AW

		endPos = CS.UnityEngine.Vector3( 2384.395 , 266.2985 , -4835.605 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.9266072 , 0.1134464 , 3.570441 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))


		print("frame index: 734")
		yield_return(self.base:WaitFrames(5))
		endPos = CS.UnityEngine.Vector3( 2384.395 , 266.2985 , -4835.605 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.9266072 , 0.1134464 , 3.570441 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))


		print("frame index: 751")
		yield_return(self.base:WaitFrames(16))


		print("frame index: 757")
		yield_return(self.base:WaitFrames(5))
		endPos = CS.UnityEngine.Vector3( 2384.395 , 266.2985 , -4835.605 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.9266072 , 0.1134464 , 3.570441 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))


		print("frame index: 771")
		yield_return(self.base:WaitFrames(13))


		print("frame index: 775")
		yield_return(self.base:WaitFrames(3))
		yield_return(self.base:MoveByAngle(45,false))    --DS


		print("frame index: 776")


		print("frame index: 780")
		yield_return(self.base:WaitFrames(3))
		endPos = CS.UnityEngine.Vector3( 2384.395 , 266.2985 , -4835.605 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.9266072 , 0.1134464 , 3.570441 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))


		print("frame index: 787")
		yield_return(self.base:WaitFrames(6))


		print("frame index: 790")
		yield_return(self.base:WaitFrames(2))
		yield_return(self.base:MoveByAngle(45,false))    --DS


		print("frame index: 795")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 2384.395 , 266.2985 , -4835.605 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.9266072 , 0.1134464 , 3.570441 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))


		print("frame index: 814")
		yield_return(self.base:WaitFrames(18))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 818")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 825")
		yield_return(self.base:WaitFrames(6))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 828")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 831")
		yield_return(self.base:WaitFrames(2))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 834")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 836")
		yield_return(self.base:WaitFrames(1))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 839")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 841")
		yield_return(self.base:WaitFrames(1))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 844")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 846")
		yield_return(self.base:WaitFrames(1))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 850")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 852")
		yield_return(self.base:WaitFrames(1))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 856")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 858")
		yield_return(self.base:WaitFrames(1))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 862")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 865")
		yield_return(self.base:WaitFrames(2))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 868")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 871")
		yield_return(self.base:WaitFrames(2))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 874")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 912")
		yield_return(self.base:WaitFrames(37))

		print("frame index: 915")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 932")
		yield_return(self.base:WaitFrames(16))
		yield_return(self.base:Jump())


		print("frame index: 937")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 2384.397 , 266.9877 , -4835.607 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 1.134301 , 0.1134464 , 3.519397 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

	end)
}

UAutoLuaTestCase.Step305_3 = {
	Order = 3, --执行顺序
	Type = CaseType.MonoTest,
	Description = "骑士团对话", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2283.841 , 229.643 , -4910.537 )
		local initForward = CS.UnityEngine.Vector3( -0.4672617 , 1 , -0.8841193 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 23")
		yield_return(self.base:WaitFrames(22))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 1.018199 , 0.2310754 , 4.458083 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 26")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 41")
		yield_return(self.base:WaitFrames(14))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 1.018199 , 0.2310754 , 4.458083 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 121")
		yield_return(self.base:WaitFrames(79))
		endPos = CS.UnityEngine.Vector3( 2276.71 , 228.6454 , -4922.131 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 1.018893 , 0.1134464 , 5.430301 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 194")
		yield_return(self.base:WaitFrames(72))
		yield_return(self.base:SelectDialog( "琴" ))

		print("frame index: 197")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 254")
		yield_return(self.base:WaitFrames(56))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 258")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 279")
		yield_return(self.base:WaitFrames(20))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 285")
		yield_return(self.base:WaitFrames(5))

		print("frame index: 322")
		yield_return(self.base:WaitFrames(36))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 326")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 354")
		yield_return(self.base:WaitFrames(27))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 359")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 390")
		yield_return(self.base:WaitFrames(30))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 398")
		yield_return(self.base:WaitFrames(7))

		print("frame index: 426")
		yield_return(self.base:WaitFrames(27))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 429")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 458")
		yield_return(self.base:WaitFrames(28))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 461")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 488")
		yield_return(self.base:WaitFrames(26))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 492")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 516")
		yield_return(self.base:WaitFrames(23))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 521")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 545")
		yield_return(self.base:WaitFrames(23))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 548")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 574")
		yield_return(self.base:WaitFrames(25))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 578")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 601")
		yield_return(self.base:WaitFrames(22))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 605")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 631")
		yield_return(self.base:WaitFrames(25))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 634")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 669")
		yield_return(self.base:WaitFrames(34))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 674")
		yield_return(self.base:WaitFrames(4))

		print("frame index: 696")
		yield_return(self.base:WaitFrames(21))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 699")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 723")
		yield_return(self.base:WaitFrames(23))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 727")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 758")
		yield_return(self.base:WaitFrames(30))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 762")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 783")
		yield_return(self.base:WaitFrames(20))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 787")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 811")
		yield_return(self.base:WaitFrames(23))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 815")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 836")
		yield_return(self.base:WaitFrames(20))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 839")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 861")
		yield_return(self.base:WaitFrames(21))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 863")
		yield_return(self.base:WaitFrames(1))

		print("frame index: 885")
		yield_return(self.base:WaitFrames(21))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 888")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 914")
		yield_return(self.base:WaitFrames(25))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 917")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 936")
		yield_return(self.base:WaitFrames(18))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 939")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 954")
		yield_return(self.base:WaitFrames(14))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 958")
		yield_return(self.base:WaitFrames(3))
	end)
}

UAutoLuaTestCase.Step_5 = {
	Order = 5, --执行顺序
	Type = CaseType.MonoTest,
	Description = "三地城对话", --步骤描述
	Action = UAutoCoroutine(function()
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2278.2 , 229.6424 , -4922.2 )
		local initForward = CS.UnityEngine.Vector3( -0.5632939 , 1 , -0.8262566 )
		yield_return(self.base:MoveToPositionUntilCutScene(initPos,10,1))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 27")
		yield_return(self.base:WaitFrames(26))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 1.060676 , 0.1134464 , 4.356638 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 33")
		yield_return(self.base:WaitFrames(5))

		print("frame index: 55")
		yield_return(self.base:WaitFrames(21))

		print("frame index: 80")
		yield_return(self.base:WaitFrames(24))

		print("frame index: 88")
		yield_return(self.base:WaitFrames(7))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.7155993 , 0.1706772 , 4.405995 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 96")
		yield_return(self.base:WaitFrames(7))
		endPos = CS.UnityEngine.Vector3( 2277.343 , 228.6428 , -4923.02 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.7196035 , 0.1532197 , 5.159105 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 180")
		yield_return(self.base:WaitFrames(83))
		yield_return(self.base:SelectDialog( "凯亚" ))

		print("frame index: 183")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 231")
		yield_return(self.base:WaitFrames(47))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 234")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 247")
		yield_return(self.base:WaitFrames(12))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 251")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 262")
		yield_return(self.base:WaitFrames(10))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 265")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 277")
		yield_return(self.base:WaitFrames(11))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 280")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 291")
		yield_return(self.base:WaitFrames(10))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 294")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 303")
		yield_return(self.base:WaitFrames(8))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 306")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 317")
		yield_return(self.base:WaitFrames(10))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 321")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 413")
		yield_return(self.base:WaitFrames(91))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 1.26653 , 0.1134464 , 4.356638 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:Jump())


		print("frame index: 417")
		yield_return(self.base:WaitFrames(3))
		endPos = CS.UnityEngine.Vector3( 2276.915 , 229.4325 , -4923.395 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 1.266596 , 0.1134464 , 4.32784 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 463")
		yield_return(self.base:WaitFrames(45))
		yield_return(self.base:SelectDialog( "丽莎" ))

		print("frame index: 467")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 505")
		yield_return(self.base:WaitFrames(37))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 509")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 522")
		yield_return(self.base:WaitFrames(12))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 525")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 534")
		yield_return(self.base:WaitFrames(8))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 538")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 550")
		yield_return(self.base:WaitFrames(11))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 554")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 566")
		yield_return(self.base:WaitFrames(11))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 569")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 579")
		yield_return(self.base:WaitFrames(9))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 582")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 650")
		yield_return(self.base:WaitFrames(67))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.7741041 , 0.1134464 , 4.356638 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:Jump())


		print("frame index: 656")
		yield_return(self.base:WaitFrames(5))
		endPos = CS.UnityEngine.Vector3( 2276.915 , 229.5131 , -4923.395 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 0.7740582 , 0.1134464 , 4.293544 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 671")
		yield_return(self.base:WaitFrames(14))

		print("frame index: 714")
		yield_return(self.base:WaitFrames(42))

		print("frame index: 729")
		yield_return(self.base:WaitFrames(14))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.68522 , 0.2820432 , 4.502038 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 745")
		yield_return(self.base:WaitFrames(15))
		endPos = CS.UnityEngine.Vector3( 2278.847 , 228.6429 , -4924.874 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.652582 , 0.1764709 , 5.371233 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 812")
		yield_return(self.base:WaitFrames(66))
		yield_return(self.base:SelectDialog( "安柏" ))

		print("frame index: 816")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 851")
		yield_return(self.base:WaitFrames(34))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 855")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 869")
		yield_return(self.base:WaitFrames(13))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 871")
		yield_return(self.base:WaitFrames(1))

		print("frame index: 880")
		yield_return(self.base:WaitFrames(8))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 883")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 892")
		yield_return(self.base:WaitFrames(8))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 896")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 908")
		yield_return(self.base:WaitFrames(11))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 912")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 922")
		yield_return(self.base:WaitFrames(9))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 925")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 936")
		yield_return(self.base:WaitFrames(10))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 940")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 952")
		yield_return(self.base:WaitFrames(11))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 956")
		yield_return(self.base:WaitFrames(3))
	end)
}

return self
