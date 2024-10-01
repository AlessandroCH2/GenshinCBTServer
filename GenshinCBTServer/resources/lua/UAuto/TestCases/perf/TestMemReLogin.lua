--baseClass提供基础接口
local baseClass = require('UAuto/Base/UAutoLuaTestBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("RunScene",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "TestMemReLogin"
self.Category = "PerformanceTest"
self.Description = "性能测试反复重登"
self.Order=10001

self.Step1 = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description = "移动到目标点",
	Action = UAutoCoroutine(function()
        -- -- 获取当前entity
        -- local entityManager = singletonManager:GetSingletonInstance("MoleMole.EntityManager")
        -- local localAvatar = entityManager:GetLocalAvatarEntity()

        -- yield_return(self.base:RunGM("STAMINA INFINITE ON"))
		-- yield_return(self.base:RunGM("WUDI ON"))
        -- -- 设定角色隐身
        -- CS.MoleMole.GlobalVars.DebugPlayerInvisible_On = true

        -- 开启内存采集
        yield_return(self.base:RunGM("StartStatMemory TestMem_Snapshot"))

        for i=1, 50 do
            -- 重新登录
            local gameManager = CS.UnityEngine.GameObject.Find("GameManager")
            local gameManagerComponent = gameManager:GetComponent("GameManager")
            if gameManagerComponent.isOnlineMode then
                yield_return(CS.UnityEngine.WaitForSeconds(1))
                -- 内存快照(详细)
                yield_return(self.base:RunGM("SnapshotStateMemory true"))
                -- 等待2秒
                yield_return(CS.UnityEngine.WaitForSeconds(2))

                -- 退出游戏 ==========
                singletonManager:GetSingletonInstance("MoleMole.NetworkManager"):RequestLeaveScene();
                -- 等待2秒
                yield_return(CS.UnityEngine.WaitForSeconds(1))
                
                -- 进入Daily服 =========
                yield_return(self.base:EnterBigWorldFromGame("Daily"))
                -- 等待2秒
                yield_return(CS.UnityEngine.WaitForSeconds(2))

                -- 内存快照(详细)
                yield_return(self.base:RunGM("SnapshotStateMemory true"))
                -- 等待2秒
                yield_return(CS.UnityEngine.WaitForSeconds(2))
            else
                yield_return(self.base:MouseClick( "Canvas/Pages/LoginMainPage/ShowServerList/Text"))
                singletonManager:GetSingletonInstance("MoleMole.PlayerModule"):GoBackHome();
                yield_return(self.base:EnterStreaming())
            end
        end
        
        -- 结束内存采集
        yield_return(self.base:RunGM("StopStatMemory"))

	end)
}

return self