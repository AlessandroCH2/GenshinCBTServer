--baseClass提供基础接口
local baseClass = require('UAuto/Base/UAutoLuaTestBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("RunScene",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "RunSceneManualPoint"
self.Category = "PerformanceTest"
self.Description = "性能测试跑图::跑动"
self.Order=10000

self.Step1 = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description = "移动到目标点",
    Action = UAutoCoroutine(function()
        -- 获取当前entity
        local entityManager = singletonManager:GetSingletonInstance("MoleMole.EntityManager")
        local localAvatar = entityManager:GetLocalAvatarEntity()

        yield_return(self.base:RunGM("STAMINA INFINITE ON"))
		yield_return(self.base:RunGM("WUDI ON"))
        -- 设定角色隐身
        CS.MoleMole.GlobalVars.DebugPlayerInvisible_On = true

		-- local targetPos1 = CS.UnityEngine.Vector3(2684.624, 193.4953, -1685.262)
        -- local targetPos2 = CS.UnityEngine.Vector3(2704.561, 196.568, -1650.283)
        -- local targetPos3 = CS.UnityEngine.Vector3(2831.11, 198.2245, -1784.629)
        -- local targetPos4 = CS.UnityEngine.Vector3(2791.336, 193.822, -1810.159)

        -- -- 新手沙滩
        -- local minX = 2780
        -- local maxX = 2820
        -- local minZ = -1800
        -- local maxZ = -1710

        -- 风龙巢穴 key point
        -- 中心点
        local center = CS.UnityEngine.Vector3(2653, 300, 118)

        local interaction = 20
        local minX = 2430
        local maxX = 2944

        local x = minX
        local z = 220
        
        -- 测试路点生成
        -- local posArray = {CS.UnityEngine.Vector3(2470.00, 210.38, 180.00), CS.UnityEngine.Vector3(2470.00, 204.01, 120.00), CS.UnityEngine.Vector3(2470.00, 211.14, 320.00)}

        -- 初始化
        -- 角色闪现到第一个点
        y = self.base:GetCurrentY(x, z)
        pos = CS.UnityEngine.Vector3(x, y, z)
        localAvatar:SetPosition(pos)
        -- 等待5秒
        yield_return(CS.UnityEngine.WaitForSeconds(5))
        
        -- 开启性能采集
        yield_return(self.base:RunGM("StartStatUnit RunScenePerfManual 2"))
        -- 开始跑点
        while (x <= maxX)
        do
            y = self.base:GetCurrentY(x, z)
            local pos = CS.UnityEngine.Vector3(x, y, z)
            yield_return(self.base:MoveToPositionUntilStateChange(pos, 10, 1))
            x = x + interaction
        end

        -- 停止性能采集
        yield_return(self.base:RunGM("StopStatUnit"))
        
	end)
}

return self