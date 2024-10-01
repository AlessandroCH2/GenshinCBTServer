local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("Avatar100Dead",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "Avatar100Dead"
self.Category = "死亡复活恢复"
self.Order = 2000
self.Description = "角色死亡"
local CliffStartPosition = CS.UnityEngine.Vector3(1514.75 , 281.3354 , -1585.041)
local CliffTargetPosition = CS.UnityEngine.Vector3(1512.83 , 280.8578 , -1589.611)

UAutoLuaTestCase.SetUp = {
	Order = 0.1,
	Type = CaseType.MonoTest,
	Description = "初始化",
	Action = UAutoCoroutine(function()
		yield_return(self.base:SetUpVariables())
	end)
}

UAutoLuaTestCase.GotoCliff = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description = "移动到悬崖",
	Action = UAutoCoroutine(function()
		yield_return(self.base:TelePort(CliffStartPosition))
	end)
}


UAutoLuaTestCase.JumpFromCliff = {
	Order = 2,
	Type = CaseType.MonoTest,
	Description = "一直往前跑，跳崖并检查死亡",
	Action = UAutoCoroutine(function()
		self.direction = CliffTargetPosition - CliffStartPosition
		local timeout = 30
		while true do
			yield_return(self.base:StartMove(self.direction))
			yield_return(CS.UnityEngine.WaitForSeconds(1))
			timeout = timeout-1
			assert(timeout>0,"Wait dead timeout")
			if(self.base.avatar.isAlive==false) then
				break
			end
		end
	end)
}

UAutoLuaTestCase.StopMove = {
	Order = 3,
	Type = CaseType.MonoTest,
	Description = "停止往前跑",
	Action = UAutoCoroutine(function()
		yield_return(self.base:StopMove(self.direction))
	end)
}





return self
