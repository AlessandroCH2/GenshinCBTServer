--baseClass提供基础接口
local baseClass = require('UAuto/Base/UAutoLuaTestBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("RunScene",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "RunScene"
self.Category = "PerformanceTest"
self.Description = "性能测试跑图"
self.Order=10000

self.Step1 = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description = "移动到目标点",
	Action = UAutoCoroutine(function()
        yield_return(self.base:RunGM("STAMINA INFINITE ON"))
		yield_return(self.base:RunGM("WUDI ON"))
        yield_return(self.base:RunGM("StartStatUnit RunScenePerf"))

		-- local targetPos1 = CS.UnityEngine.Vector3(2684.624, 193.4953, -1685.262)
        -- local targetPos2 = CS.UnityEngine.Vector3(2704.561, 196.568, -1650.283)
        -- local targetPos3 = CS.UnityEngine.Vector3(2831.11, 198.2245, -1784.629)
        -- local targetPos4 = CS.UnityEngine.Vector3(2791.336, 193.822, -1810.159)

        local minX = 2780
        local maxX = 2820
        local minZ = -1800
        local maxZ = -1710

        local x = minX
        local z = minZ
        local rotX = 0
        while (x <= maxX)
        do
            z = minZ
            while (z <= maxZ)
            do
                y = self.base:GetCurrentY(x, z)
                local pos = CS.UnityEngine.Vector3(x, y, z)
                
                -- 移动角色到目标点
                yield_return(self.base:MoveToPosition(pos))
                
                -- 旋转四个方向镜头TODO
                for i=0,3,1
                do  
                    local cameraRot = CS.UnityEngine.Vector3(x, y, z)
                    if i == 0 then
                        -- 朝北
                        cameraRot = CS.UnityEngine.Vector3(x+100, y, z)
                    elseif i == 1 then
                        -- 朝东
                        cameraRot = CS.UnityEngine.Vector3(x, y, z-100)
                    elseif i == 2 then
                        -- 朝南
                        cameraRot = CS.UnityEngine.Vector3(x-100, y, z)
                    else
                        -- 朝西
                        cameraRot = CS.UnityEngine.Vector3(x, y, z+100)
                    end
                    
                    yield_return(self.base:RotateCamera(cameraRot))
                    -- 等待1秒
                    yield_return(CS.UnityEngine.WaitForSeconds(1))
                    -- 采集数据
                    yield_return(self.base:RunGM("SnapshotStatUnit -1"))
                end
                
                yield_return(CS.UnityEngine.WaitForSeconds(1))
                z = z + 10
            end
            x = x + 10
        end

        yield_return(self.base:RunGM("StopStatUnit"))

	end)
}

return self