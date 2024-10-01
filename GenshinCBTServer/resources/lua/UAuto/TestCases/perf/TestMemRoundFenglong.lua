require('Actor/ActorCommon')
--baseClass提供基础接口
local baseClass = require('UAuto/Base/UAutoLuaTestBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("RunScene",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "TestMemRoundFenglong"
self.Category = "PerformanceTest"
self.Description = "性能测试内存泄露:绕风龙巢穴跑圈"
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

        -- 风龙巢穴路点配置
        local posTableFenglong = {
            CS.UnityEngine.Vector3(2823.44,211.10,65.91),
            CS.UnityEngine.Vector3(2817.87,212.00,57.35),
            CS.UnityEngine.Vector3(2806.55,207.61,48.42),
            CS.UnityEngine.Vector3(2796.78,207.31,41.05),
            CS.UnityEngine.Vector3(2788.02,206.89,35.32),
            CS.UnityEngine.Vector3(2781.49,208.14,31.12),
            CS.UnityEngine.Vector3(2773.73,208.85,28.19),
            CS.UnityEngine.Vector3(2760.09,207.87,23.55),
            CS.UnityEngine.Vector3(2747.85,207.11,21.98),
            CS.UnityEngine.Vector3(2736.06,206.84,20.57),
            CS.UnityEngine.Vector3(2721.98,206.83,18.74),
            CS.UnityEngine.Vector3(2711.60,206.99,17.40),
            CS.UnityEngine.Vector3(2697.35,206.87,15.56),
            CS.UnityEngine.Vector3(2685.84,206.89,13.14),
            CS.UnityEngine.Vector3(2675.53,206.81,11.27),
            CS.UnityEngine.Vector3(2666.03,206.83,8.77),
            CS.UnityEngine.Vector3(2651.52,206.83,9.15),
            CS.UnityEngine.Vector3(2637.43,206.66,9.74),
            CS.UnityEngine.Vector3(2626.27,205.68,10.48),
            CS.UnityEngine.Vector3(2626.12,205.67,10.50),
            CS.UnityEngine.Vector3(2613.27,205.01,13.09),
            CS.UnityEngine.Vector3(2602.88,205.67,20.90),
            CS.UnityEngine.Vector3(2598.57,205.67,32.89),
            CS.UnityEngine.Vector3(2595.38,206.82,41.74),
            CS.UnityEngine.Vector3(2586.93,207.45,48.38),
            CS.UnityEngine.Vector3(2578.75,207.94,50.87),
            CS.UnityEngine.Vector3(2566.74,208.51,57.33),
            CS.UnityEngine.Vector3(2554.68,206.42,65.99),
            CS.UnityEngine.Vector3(2542.18,206.78,75.30),
            CS.UnityEngine.Vector3(2537.75,208.12,81.91),
            CS.UnityEngine.Vector3(2535.19,209.51,89.26),
            CS.UnityEngine.Vector3(2532.80,208.93,100.47),
            CS.UnityEngine.Vector3(2531.42,206.20,114.18),
            CS.UnityEngine.Vector3(2531.76,206.46,128.13),
            CS.UnityEngine.Vector3(2532.58,205.66,138.21),
            CS.UnityEngine.Vector3(2533.31,205.86,147.97),
            CS.UnityEngine.Vector3(2535.36,205.99,162.48),
            CS.UnityEngine.Vector3(2532.74,205.01,174.37),
            CS.UnityEngine.Vector3(2532.34,205.77,182.98),
            CS.UnityEngine.Vector3(2534.06,205.47,196.62),
            CS.UnityEngine.Vector3(2534.90,205.55,206.48),
            CS.UnityEngine.Vector3(2538.31,206.11,213.55),
            CS.UnityEngine.Vector3(2544.87,205.22,220.64),
            CS.UnityEngine.Vector3(2557.29,205.61,227.35),
            CS.UnityEngine.Vector3(2570.28,205.39,231.89),
            CS.UnityEngine.Vector3(2581.04,205.47,234.65),
            CS.UnityEngine.Vector3(2591.73,206.26,237.85),
            CS.UnityEngine.Vector3(2603.54,207.16,241.24),
            CS.UnityEngine.Vector3(2612.19,207.74,243.82),
            CS.UnityEngine.Vector3(2626.55,208.78,248.78),
            CS.UnityEngine.Vector3(2634.31,209.34,252.52),
            CS.UnityEngine.Vector3(2639.43,210.39,259.39),
            CS.UnityEngine.Vector3(2648.10,211.11,269.04),
            CS.UnityEngine.Vector3(2653.26,211.17,274.27),
            CS.UnityEngine.Vector3(2659.32,211.41,277.60),
            CS.UnityEngine.Vector3(2669.77,211.76,277.28),
            CS.UnityEngine.Vector3(2678.34,212.63,283.16),
            CS.UnityEngine.Vector3(2683.53,210.68,289.74),
            CS.UnityEngine.Vector3(2691.97,208.65,294.99),
            CS.UnityEngine.Vector3(2702.01,207.40,295.83),
            CS.UnityEngine.Vector3(2714.32,207.02,291.05),
            CS.UnityEngine.Vector3(2727.44,206.83,284.88),
            CS.UnityEngine.Vector3(2735.22,208.07,280.71),
            CS.UnityEngine.Vector3(2743.66,208.45,272.11),
            CS.UnityEngine.Vector3(2746.31,206.99,261.74),
            CS.UnityEngine.Vector3(2750.75,206.83,252.35),
            CS.UnityEngine.Vector3(2756.93,207.89,239.43),
            CS.UnityEngine.Vector3(2762.11,208.36,230.41),
            CS.UnityEngine.Vector3(2770.66,209.27,220.87),
            CS.UnityEngine.Vector3(2776.65,209.28,213.90),
            CS.UnityEngine.Vector3(2781.24,208.59,204.20),
            CS.UnityEngine.Vector3(2788.07,208.42,190.71),
            CS.UnityEngine.Vector3(2794.40,208.99,178.33),
            CS.UnityEngine.Vector3(2798.09,209.53,170.18),
            CS.UnityEngine.Vector3(2803.62,209.41,158.76),
            CS.UnityEngine.Vector3(2803.18,208.41,146.77),
            CS.UnityEngine.Vector3(2802.75,208.13,136.31),
            CS.UnityEngine.Vector3(2805.00,208.14,125.95),
            CS.UnityEngine.Vector3(2806.27,209.27,119.15),
            CS.UnityEngine.Vector3(2809.51,209.90,105.79),
            CS.UnityEngine.Vector3(2812.51,210.26,93.36),
            CS.UnityEngine.Vector3(2816.32,210.88,80.55),
            CS.UnityEngine.Vector3(2819.35,211.61,73.70),
            CS.UnityEngine.Vector3(2824.12,210.94,63.79),
            CS.UnityEngine.Vector3(2825.65,210.83,58.63),
            CS.UnityEngine.Vector3(2825.65,210.83,58.63),
            CS.UnityEngine.Vector3(2825.65,210.83,58.63)
        }

        -- 开启内存采集
        yield_return(self.base:RunGM("StartStatMemory TestMemFenglong_Snapshot"))

        -- 小循环风龙巢穴
        for i=1, 10 do
            -- 再跑风龙巢穴 ================>
            -- 内存快照(详细)
            yield_return(self.base:RunGM("SnapshotStateMemory true"))
            -- 等待3秒
            yield_return(CS.UnityEngine.WaitForSeconds(3))

            posTable = posTableFenglong
            -- 初始化
            -- 角色闪现到第一个点
            pos = posTable[1]
            globalActor:LoadSectorByPos(pos, function() 
                -- 坐标在大世界内
                -- 移动角色到目标点
                localAvatar:SetPosition(pos)
            end)
            -- 等待3秒
            yield_return(CS.UnityEngine.WaitForSeconds(3))

            -- 开始跑场景 - 风龙巢穴跑
            for i=2, #posTable do
                pos = posTable[i]
                yield_return(self.base:MoveToPositionUntilStateChange(pos, 10, 1))
                if math.fmod(i, 3) == 0 then
                    -- 内存快照
                    yield_return(self.base:RunGM("SnapshotStateMemory false"))
                end
            end
        end

        -- 结束内存采集
        yield_return(self.base:RunGM("StopStatMemory"))


	end)
}

return self