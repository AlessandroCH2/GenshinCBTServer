local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("AutoTest_Quest352bug",baseClass)

local self = UAutoLuaTestCase
self.TestFixture = "AutoTest_Quest352bug"
self.Category = "任务系统" --自行修改分类
self.Description = "任务bug" --自行修改用例描述
self.Order = 350
UAutoLuaTestCase.bug_352paimon = {
	Order = 1, --执行顺序
	Type = CaseType.MonoTest,
	Description = "派蒙跑走bug重现", --步骤描述
	Action = UAutoCoroutine(function()
	    yield_return(self.base:RunGM("clear all",true,true))
		yield_return(self.base:RunGM("quest finish father 351"))
		yield_return(self.base:WaitFrames(60))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/GrpMainBtn/GrpMainToggle/BtnGm/Icon"))

		print("frame index: 53")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 114")
		yield_return(self.base:WaitFrames(60))
		yield_return(self.base:MouseClick( "Canvas/Dialogs/InLevelDebugMenuDialog/Return/Text"))

		print("frame index: 118")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 190")
		yield_return(self.base:WaitFrames(71))
		yield_return(self.base:MouseClick( "Canvas/Pages/LoginMainPage/DebugPanel/Connect/Text"))
		yield_return(self.base:Jump())
		print("frame index: 194")
		yield_return(self.base:WaitFrames(3))
		
		
		local cameraData = TestCaseBaseClass.CameraData()
		local clickPos = CS.UnityEngine.Vector2( 0, 0 )
		local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )

		print("frame index: 0")
		local initPos = CS.UnityEngine.Vector3( 2596.342 , 239.9876 , -5584.849 )
		local initForward = CS.UnityEngine.Vector3( 0.1630266 , 1 , 0.9866217 )
		yield_return(self.base:TelePort(initPos))
		yield_return(self.base:InitAvatarRotate(initForward))

		print("frame index: 15")
		yield_return(self.base:WaitFrames(14))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.585313 , 0.08340966 , 3.37251 )
		yield_return(self.base:RotateByCameraData(cameraData))

		print("frame index: 45")
		yield_return(self.base:WaitFrames(29))

		print("frame index: 52")
		yield_return(self.base:WaitFrames(6))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.528975 , 0.07602619 , 3.37251 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 108")
		yield_return(self.base:WaitFrames(55))
		endPos = CS.UnityEngine.Vector3( 2595.844 , 240.406 , -5569.758 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.531415 , 0.1134464 , 3.380452 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 139")
		yield_return(self.base:WaitFrames(30))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.531415 , 0.1134464 , 3.380452 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 144")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 2595.831 , 240.7321 , -5568.387 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.531415 , 0.1134464 , 3.380452 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 151")
		yield_return(self.base:WaitFrames(6))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 155")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 668")
		yield_return(self.base:WaitFrames(512))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 672")
		yield_return(self.base:WaitFrames(3))

		print("frame index: 685")
		yield_return(self.base:WaitFrames(12))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 688")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 692")
		yield_return(self.base:WaitFrames(3))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 694")
		yield_return(self.base:WaitFrames(1))

		print("frame index: 698")
		yield_return(self.base:WaitFrames(3))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 701")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 704")
		yield_return(self.base:WaitFrames(2))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 707")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 710")
		yield_return(self.base:WaitFrames(2))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 713")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 715")
		yield_return(self.base:WaitFrames(1))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 718")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 721")
		yield_return(self.base:WaitFrames(2))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 723")
		yield_return(self.base:WaitFrames(1))

		print("frame index: 727")
		yield_return(self.base:WaitFrames(3))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 729")
		yield_return(self.base:WaitFrames(1))

		print("frame index: 809")
		yield_return(self.base:WaitFrames(79))

		print("frame index: 846")
		yield_return(self.base:WaitFrames(36))

		print("frame index: 851")
		yield_return(self.base:WaitFrames(4))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.560895 , 0.2417953 , 3.457362 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 917")
		yield_return(self.base:WaitFrames(65))
		endPos = CS.UnityEngine.Vector3( 2605.395 , 239.5569 , -5571.448 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 2.597646 , 0.1134464 , 3.460827 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 938")
		yield_return(self.base:WaitFrames(20))

		print("frame index: 961")
		yield_return(self.base:WaitFrames(22))

		print("frame index: 964")
		yield_return(self.base:WaitFrames(2))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( 3.540662 , 0.1993716 , 3.429316 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 980")
		yield_return(self.base:WaitFrames(15))
		endPos = CS.UnityEngine.Vector3( 2609.836 , 239.0643 , -5570.359 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.754491 , 0.1989857 , 3.516439 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1016")
		yield_return(self.base:WaitFrames(35))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.755167 , 0.198321 , 3.428621 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 1023")
		yield_return(self.base:WaitFrames(6))
		endPos = CS.UnityEngine.Vector3( 2611.19 , 239.0652 , -5569.808 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.754918 , 0.1781426 , 3.458516 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1473")
		yield_return(self.base:WaitFrames(449))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 1476")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 1507")
		yield_return(self.base:WaitFrames(30))

		print("frame index: 1571")
		yield_return(self.base:WaitFrames(63))

		print("frame index: 1577")
		yield_return(self.base:WaitFrames(5))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.633169 , 0.1786873 , 3.415641 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 1590")
		yield_return(self.base:WaitFrames(12))
		endPos = CS.UnityEngine.Vector3( 2643.99 , 235.5109 , -5537.698 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.63686 , 0.1451199 , 3.460132 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1601")
		yield_return(self.base:WaitFrames(10))

		print("frame index: 1626")
		yield_return(self.base:WaitFrames(24))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.832249 , 0.1464858 , 3.393984 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(180,false))    --A


		print("frame index: 1631")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 2643.668 , 235.3404 , -5536.819 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.847226 , 0.1484392 , 3.412601 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1662")
		yield_return(self.base:WaitFrames(30))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.934777 , 0.1484392 , 3.395644 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(180,false))    --A


		print("frame index: 1667")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 2642.558 , 235.0302 , -5536.428 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.934777 , 0.1484392 , 3.399888 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1670")
		yield_return(self.base:WaitFrames(2))

		print("frame index: 1691")
		yield_return(self.base:WaitFrames(20))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.910952 , 0.1482194 , 3.395499 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 1701")
		yield_return(self.base:WaitFrames(9))
		endPos = CS.UnityEngine.Vector3( 2642.266 , 234.6626 , -5535.116 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.899891 , 0.1481152 , 3.48186 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1738")
		yield_return(self.base:WaitFrames(36))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.893757 , 0.1478458 , 3.395251 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 1747")
		yield_return(self.base:WaitFrames(8))
		endPos = CS.UnityEngine.Vector3( 2642.858 , 234.2953 , -5533.363 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.893662 , 0.1363294 , 3.46039 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1782")
		yield_return(self.base:WaitFrames(34))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.893538 , 0.1134464 , 3.37251 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 1789")
		yield_return(self.base:WaitFrames(6))
		endPos = CS.UnityEngine.Vector3( 2643.375 , 234.0844 , -5531.816 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.893545 , 0.1134464 , 3.460597 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1819")
		yield_return(self.base:WaitFrames(29))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.893538 , 0.1134464 , 3.37251 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(180,false))    --A


		print("frame index: 1824")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 2643.15 , 233.7486 , -5530.868 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.859325 , 0.1134464 , 3.399011 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1846")
		yield_return(self.base:WaitFrames(21))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.809413 , 0.1134464 , 3.37251 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 1848")
		yield_return(self.base:WaitFrames(1))
		endPos = CS.UnityEngine.Vector3( 2642.53 , 233.5291 , -5530.421 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.786932 , 0.1134464 , 3.37251 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1881")
		yield_return(self.base:WaitFrames(32))

		print("frame index: 1895")
		yield_return(self.base:WaitFrames(13))

		print("frame index: 1905")
		yield_return(self.base:WaitFrames(9))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.980535 , 0.1313696 , 3.384359 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 1910")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 2642.776 , 233.6744 , -5529.269 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.978733 , 0.128817 , 3.457251 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1938")
		yield_return(self.base:WaitFrames(27))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.97762 , 0.1146547 , 3.37251 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(180,false))    --A


		print("frame index: 1942")
		yield_return(self.base:WaitFrames(3))
		endPos = CS.UnityEngine.Vector3( 2642.888 , 233.6959 , -5528.608 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.968984 , 0.1134464 , 3.389235 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 1965")
		yield_return(self.base:WaitFrames(22))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.909068 , 0.1134464 , 3.37251 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 1972")
		yield_return(self.base:WaitFrames(6))
		endPos = CS.UnityEngine.Vector3( 2642.281 , 233.806 , -5527.368 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.888469 , 0.1134464 , 3.458962 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 2008")
		yield_return(self.base:WaitFrames(35))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.876976 , 0.1134464 , 3.37251 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 2012")
		yield_return(self.base:WaitFrames(3))
		endPos = CS.UnityEngine.Vector3( 2642.55 , 233.7679 , -5526.479 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -1.876794 , 0.1134464 , 3.440496 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 2043")
		yield_return(self.base:WaitFrames(30))

		print("frame index: 2061")
		yield_return(self.base:WaitFrames(17))

		print("frame index: 2071")
		yield_return(self.base:WaitFrames(9))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.261289 , 0.1253794 , 3.380398 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(0,false))    --D


		print("frame index: 2076")
		yield_return(self.base:WaitFrames(4))
		endPos = CS.UnityEngine.Vector3( 2643.118 , 233.716 , -5525.99 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.283651 , 0.1236655 , 3.400286 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 2092")
		yield_return(self.base:WaitFrames(15))
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.343659 , 0.1162315 , 3.37251 )
		yield_return(self.base:RotateByCameraData(cameraData))
		yield_return(self.base:MoveByAngle(270,false))    --W


		print("frame index: 2098")
		yield_return(self.base:WaitFrames(5))
		endPos = CS.UnityEngine.Vector3( 2644.135 , 233.6211 , -5526.12 )
		cameraData.cameraSpherical=CS.UnityEngine.Vector3( -2.353199 , 0.1149664 , 3.453289 )
		yield_return(self.base:MoveByAngle(-1,true,endPos,cameraData))

		print("frame index: 2500")
		yield_return(self.base:WaitFrames(401))
		yield_return(self.base:MouseClick( "Canvas/Pages/InLevelCutScenePage"))

		print("frame index: 2502")
		yield_return(self.base:WaitFrames(1))
	end)
}

return self
