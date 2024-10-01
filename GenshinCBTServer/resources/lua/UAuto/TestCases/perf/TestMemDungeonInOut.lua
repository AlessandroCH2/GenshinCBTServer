--baseClass提供基础接口
local baseClass = require('UAuto/Base/UAutoLuaTestBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("RunScene",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "TestMemDungeonInOut"
self.Category = "PerformanceTest"
self.Description = "性能测试内存泄露"
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

        -- 开启内存采集
        yield_return(self.base:RunGM("StartStatMemory TestMem_Snapshot"))

        for i=0,30,1
        do
            if math.fmod(i, 6) == 0 then
                -- 内存快照(详细)
                yield_return(self.base:RunGM("SnapshotStateMemory true"))
            end
            
            -- 等待3秒
            yield_return(CS.UnityEngine.WaitForSeconds(3))

            -- 内存快照
            yield_return(self.base:RunGM("SnapshotStateMemory false"))

            -- 等待3秒
            yield_return(CS.UnityEngine.WaitForSeconds(3))

            -- 进入副本
            yield_return(self.base:RunGM("dungeon 1"))

            -- 等待10秒 : 进副本Loading界面
            yield_return(CS.UnityEngine.WaitForSeconds(10))

            -- 内存快照
            yield_return(self.base:RunGM("SnapshotStateMemory false"))

            -- 等待3秒
            yield_return(CS.UnityEngine.WaitForSeconds(3))

            -- 退出副本
            yield_return(self.base:RunGM("DUNGEON QUIT"))

            -- 等待10秒
            yield_return(CS.UnityEngine.WaitForSeconds(10))
        end

        -- 结束内存采集
        yield_return(self.base:RunGM("StopStatMemory"))

	end)
}

return self