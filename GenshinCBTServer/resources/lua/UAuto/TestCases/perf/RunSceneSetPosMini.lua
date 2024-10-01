require('Actor/ActorCommon')
--baseClass提供基础接口
local baseClass = require('UAuto/Base/UAutoLuaTestBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("RunScene",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "RunSceneSetPosMini"
self.Category = "PerformanceTest"
self.Description = "性能测试跑图setPos"
self.Order=10001

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

        -- 开启性能采集
        yield_return(self.base:RunGM("StartStatUnit RunScenePerf"))

        -- 风龙巢穴片区
        local minX = 2600
        local maxX = 2800
        local minZ = 20
        local maxZ = 280

        local x = minX
        local z = minZ
        local rotX = 0

        -- 网格粒度
        local interaction = 10

        local direction = true
        while (x <= maxX)
        do
            if direction then
                -- 正向遍历z
                while (z <= maxZ)
                do
                    y = self.base:GetCurrentY(x, z)
                    pos = CS.UnityEngine.Vector3(x, y, z)
                    -- 等待3秒
                    yield_return(CS.UnityEngine.WaitForSeconds(3))

                    globalActor:LoadSectorByPos(pos, function() 
                        -- isInBigWorld = self.base:IsInLimitRegion(pos)
                        if true then
                            -- 坐标在大世界内
                            -- 移动角色到目标点
                            localAvatar:SetPosition(pos)
                            z = z + interaction
                        end
                    end)

                    -- 等待1秒
                    yield_return(CS.UnityEngine.WaitForSeconds(1))
                    -- 采集数据
                    yield_return(self.base:RunGM("SnapshotStatUnit -1"))
                    -- 等待1秒
                    yield_return(CS.UnityEngine.WaitForSeconds(1))
                end

            else
                -- 逆向遍历z
                while (z >= minZ)
                do
                    y = self.base:GetCurrentY(x, z)
                    pos = CS.UnityEngine.Vector3(x, y, z)
                    -- 等待3秒
                    yield_return(CS.UnityEngine.WaitForSeconds(3))

                    globalActor:LoadSectorByPos(pos, function() 
                        -- isInBigWorld = self.base:IsInLimitRegion(pos)
                        if true then
                            -- 坐标在大世界内
                            -- 移动角色到目标点
                            localAvatar:SetPosition(pos)
                            z = z - interaction
                        end
                    end)

                    -- 等待1秒
                    yield_return(CS.UnityEngine.WaitForSeconds(1))
                    -- 采集数据
                    yield_return(self.base:RunGM("SnapshotStatUnit -1"))
                    -- 等待1秒
                    yield_return(CS.UnityEngine.WaitForSeconds(1))
                end
            end

            x = x + interaction
            direction = not direction
        end

        yield_return(self.base:RunGM("StopStatUnit"))

	end)
}

return self