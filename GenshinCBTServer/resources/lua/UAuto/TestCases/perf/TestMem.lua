--baseClass提供基础接口
local baseClass = require('UAuto/Base/UAutoLuaTestBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("RunScene",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "TestMem"
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

        -- 蒙德城路点
        posTableMengde = {
            CS.UnityEngine.Vector3(2181.91,210.44,-1036.17),
            CS.UnityEngine.Vector3(2186.25,211.23,-1024.91),
            CS.UnityEngine.Vector3(2191.28,211.69,-1011.85),
            CS.UnityEngine.Vector3(2197.24,211.76,-999.82),
            CS.UnityEngine.Vector3(2201.82,211.60,-989.86),
            CS.UnityEngine.Vector3(2208.23,211.05,-975.96),
            CS.UnityEngine.Vector3(2212.18,210.23,-966.22),
            CS.UnityEngine.Vector3(2216.53,210.03,-956.53),
            CS.UnityEngine.Vector3(2221.59,210.08,-947.06),
            CS.UnityEngine.Vector3(2227.31,209.99,-938.80),
            CS.UnityEngine.Vector3(2227.03,209.99,-929.03),
            CS.UnityEngine.Vector3(2220.18,209.99,-921.45),
            CS.UnityEngine.Vector3(2213.68,209.99,-913.32),
            CS.UnityEngine.Vector3(2206.94,209.99,-905.17),
            CS.UnityEngine.Vector3(2199.92,209.99,-896.60),
            CS.UnityEngine.Vector3(2195.62,209.99,-886.47),
            CS.UnityEngine.Vector3(2198.26,209.98,-876.71),
            CS.UnityEngine.Vector3(2201.47,209.99,-866.93),
            CS.UnityEngine.Vector3(2199.06,211.63,-859.26),
            CS.UnityEngine.Vector3(2196.89,214.03,-849.48),
            CS.UnityEngine.Vector3(2201.67,218.32,-837.51),
            CS.UnityEngine.Vector3(2208.50,219.99,-832.11),
            CS.UnityEngine.Vector3(2218.39,219.99,-835.70),
            CS.UnityEngine.Vector3(2227.72,219.99,-840.62),
            CS.UnityEngine.Vector3(2237.36,219.99,-844.38),
            CS.UnityEngine.Vector3(2246.96,219.99,-848.93),
            CS.UnityEngine.Vector3(2253.68,220.10,-844.09),
            CS.UnityEngine.Vector3(2247.67,222.38,-840.43),
            CS.UnityEngine.Vector3(2240.97,223.99,-836.66),
            CS.UnityEngine.Vector3(2233.10,225.15,-832.00),
            CS.UnityEngine.Vector3(2227.60,227.56,-829.39),
            CS.UnityEngine.Vector3(2214.49,229.68,-822.27),
            CS.UnityEngine.Vector3(2210.85,230.00,-810.84),
            CS.UnityEngine.Vector3(2212.95,230.09,-800.48),
            CS.UnityEngine.Vector3(2218.04,230.09,-794.75),
            CS.UnityEngine.Vector3(2229.09,229.99,-795.87),
            CS.UnityEngine.Vector3(2238.75,229.99,-799.27),
            CS.UnityEngine.Vector3(2248.11,229.99,-800.02),
            CS.UnityEngine.Vector3(2258.94,229.99,-799.40),
            CS.UnityEngine.Vector3(2273.20,229.99,-800.27),
            CS.UnityEngine.Vector3(2286.27,231.09,-797.15),
            CS.UnityEngine.Vector3(2294.14,233.96,-791.34),
            CS.UnityEngine.Vector3(2290.04,235.59,-785.13),
            CS.UnityEngine.Vector3(2283.80,235.99,-773.59),
            CS.UnityEngine.Vector3(2280.50,236.07,-761.42),
            CS.UnityEngine.Vector3(2279.54,238.82,-755.68),
            CS.UnityEngine.Vector3(2279.63,240.00,-745.53),
            CS.UnityEngine.Vector3(2281.19,243.99,-732.45),
            CS.UnityEngine.Vector3(2284.21,246.00,-724.50),
            CS.UnityEngine.Vector3(2287.04,248.67,-719.80),
            CS.UnityEngine.Vector3(2292.52,249.99,-714.41),
            CS.UnityEngine.Vector3(2305.60,249.99,-711.19),
            CS.UnityEngine.Vector3(2319.59,249.99,-710.08),
            CS.UnityEngine.Vector3(2331.09,250.90,-706.79),
            CS.UnityEngine.Vector3(2334.21,255.42,-699.22),
            CS.UnityEngine.Vector3(2337.48,257.65,-692.66),
            CS.UnityEngine.Vector3(2339.67,260.01,-687.66),
            CS.UnityEngine.Vector3(2341.51,260.00,-677.02),
            CS.UnityEngine.Vector3(2348.89,260.00,-665.76),
            CS.UnityEngine.Vector3(2353.61,260.00,-652.61),
            CS.UnityEngine.Vector3(2359.24,260.00,-640.14),
            CS.UnityEngine.Vector3(2365.87,260.00,-631.44),
            CS.UnityEngine.Vector3(2376.10,260.00,-627.92),
            CS.UnityEngine.Vector3(2386.11,260.00,-631.88),
            CS.UnityEngine.Vector3(2391.39,260.00,-641.24),
            CS.UnityEngine.Vector3(2392.86,260.00,-651.94),
            CS.UnityEngine.Vector3(2390.97,260.00,-664.03),
            CS.UnityEngine.Vector3(2387.25,260.00,-678.09),
            CS.UnityEngine.Vector3(2384.96,260.00,-691.85),
            CS.UnityEngine.Vector3(2383.55,259.29,-702.46),
            CS.UnityEngine.Vector3(2377.35,257.55,-712.79),
            CS.UnityEngine.Vector3(2364.29,257.55,-712.75),
            CS.UnityEngine.Vector3(2355.10,255.33,-711.17),
            CS.UnityEngine.Vector3(2351.07,250.75,-717.30),
            CS.UnityEngine.Vector3(2345.84,249.99,-728.31),
            CS.UnityEngine.Vector3(2345.56,249.99,-741.77),
            CS.UnityEngine.Vector3(2344.47,249.99,-754.89),
            CS.UnityEngine.Vector3(2337.22,249.99,-762.48),
            CS.UnityEngine.Vector3(2327.86,249.99,-767.79),
            CS.UnityEngine.Vector3(2317.29,249.99,-769.34),
            CS.UnityEngine.Vector3(2306.83,250.05,-767.65),
            CS.UnityEngine.Vector3(2301.17,249.99,-759.28),
            CS.UnityEngine.Vector3(2301.58,249.99,-748.88),
            CS.UnityEngine.Vector3(2306.45,249.99,-739.62),
            CS.UnityEngine.Vector3(2313.58,249.98,-732.43),
            CS.UnityEngine.Vector3(2321.90,249.99,-725.48),
            CS.UnityEngine.Vector3(2322.19,249.99,-715.28),
            CS.UnityEngine.Vector3(2312.93,249.99,-712.38),
            CS.UnityEngine.Vector3(2298.21,249.99,-714.00),
            CS.UnityEngine.Vector3(2287.70,248.05,-721.62),
            CS.UnityEngine.Vector3(2283.70,243.95,-731.19),
            CS.UnityEngine.Vector3(2281.16,242.33,-740.82),
            CS.UnityEngine.Vector3(2280.13,239.97,-753.26),
            CS.UnityEngine.Vector3(2283.24,235.98,-765.42),
            CS.UnityEngine.Vector3(2287.92,235.99,-776.14),
            CS.UnityEngine.Vector3(2292.24,235.23,-785.86),
            CS.UnityEngine.Vector3(2298.04,233.87,-793.82),
            CS.UnityEngine.Vector3(2300.37,232.46,-803.47),
            CS.UnityEngine.Vector3(2307.16,229.95,-811.22),
            CS.UnityEngine.Vector3(2317.89,224.48,-819.27),
            CS.UnityEngine.Vector3(2325.97,223.99,-830.47),
            CS.UnityEngine.Vector3(2334.33,223.99,-836.75),
            CS.UnityEngine.Vector3(2334.93,224.09,-845.95),
            CS.UnityEngine.Vector3(2333.76,224.09,-856.37),
            CS.UnityEngine.Vector3(2341.30,224.09,-862.63),
            CS.UnityEngine.Vector3(2350.64,224.21,-866.61),
            CS.UnityEngine.Vector3(2356.07,224.09,-858.64),
            CS.UnityEngine.Vector3(2356.06,223.98,-849.71),
            CS.UnityEngine.Vector3(2344.38,223.99,-842.54),
            CS.UnityEngine.Vector3(2332.44,223.99,-838.46),
            CS.UnityEngine.Vector3(2319.71,222.89,-841.88),
            CS.UnityEngine.Vector3(2308.64,221.99,-844.83),
            CS.UnityEngine.Vector3(2298.63,219.99,-851.30),
            CS.UnityEngine.Vector3(2290.78,219.99,-858.45),
            CS.UnityEngine.Vector3(2281.21,219.99,-860.65),
            CS.UnityEngine.Vector3(2271.08,219.99,-859.56),
            CS.UnityEngine.Vector3(2261.12,219.99,-855.29),
            CS.UnityEngine.Vector3(2251.02,219.99,-851.30),
            CS.UnityEngine.Vector3(2242.41,219.99,-845.48),
            CS.UnityEngine.Vector3(2232.46,219.99,-842.72),
            CS.UnityEngine.Vector3(2222.03,219.99,-839.64),
            CS.UnityEngine.Vector3(2212.89,219.99,-834.28),
            CS.UnityEngine.Vector3(2203.88,219.08,-836.67),
            CS.UnityEngine.Vector3(2199.20,214.23,-847.41),
            CS.UnityEngine.Vector3(2201.47,210.37,-862.01),
            CS.UnityEngine.Vector3(2206.01,209.99,-872.11),
            CS.UnityEngine.Vector3(2209.47,209.99,-882.08),
            CS.UnityEngine.Vector3(2209.14,209.99,-896.08),
            CS.UnityEngine.Vector3(2211.96,209.99,-909.36),
            CS.UnityEngine.Vector3(2219.69,209.99,-919.59),
            CS.UnityEngine.Vector3(2225.89,209.99,-928.36),
            CS.UnityEngine.Vector3(2226.33,209.99,-939.08),
            CS.UnityEngine.Vector3(2222.51,210.07,-949.08),
            CS.UnityEngine.Vector3(2216.14,210.03,-963.04),
            CS.UnityEngine.Vector3(2209.27,210.97,-976.02),
            CS.UnityEngine.Vector3(2204.84,211.40,-984.40),
            CS.UnityEngine.Vector3(2198.68,211.75,-996.04),
            CS.UnityEngine.Vector3(2193.36,211.74,-1007.92),
            CS.UnityEngine.Vector3(2188.59,211.50,-1018.57),
            CS.UnityEngine.Vector3(2182.84,210.88,-1031.48),
            CS.UnityEngine.Vector3(2180.15,210.19,-1037.54),
            CS.UnityEngine.Vector3(2180.17,210.19,-1037.51),
            CS.UnityEngine.Vector3(2181.91,210.44,-1036.17),
        }

        -- 开启内存采集
        yield_return(self.base:RunGM("StartStatMemory TestMem_Snapshot"))

        for i=1, 5 do
            -- 大循环
            -- 内存快照(详细)
            yield_return(self.base:RunGM("SnapshotStateMemory true"))
            -- 等待3秒
            yield_return(CS.UnityEngine.WaitForSeconds(3))
            -- 小循环蒙德城
            for i=1, 5 do
                -- 先跑蒙德城 =================>
                posTable = posTableMengde
                -- 初始化
                -- 角色闪现到第一个点
                pos = posTable[1]
                globalActor:LoadSectorByPos(pos, function() 
                    -- 坐标在大世界内
                    -- 移动角色到目标点
                    localAvatar:SetPosition(pos)
                end)
                pos = posTable[1]
                localAvatar:SetPosition(pos)
                -- 等待3秒
                yield_return(CS.UnityEngine.WaitForSeconds(3))

                -- 开始跑场景 - 蒙德城中跑
                for i=2, #posTable do
                    pos = posTable[i]
                    yield_return(self.base:MoveToPositionUntilStateChange(pos, 10, 1))
                    if math.fmod(i, 3) == 0 then
                        -- 内存快照
                        yield_return(self.base:RunGM("SnapshotStateMemory false"))
                    end
                end
            end

            -- 切场景，等待3秒
            yield_return(CS.UnityEngine.WaitForSeconds(3))

            -- 小循环风龙巢穴
            for i=1, 5 do
                -- 再跑风龙巢穴 ================>
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

            -- 切场景，等待3秒
            yield_return(CS.UnityEngine.WaitForSeconds(3))
            -- 内存快照(详细)
            yield_return(self.base:RunGM("SnapshotStateMemory true"))
            -- 等待3秒
            yield_return(CS.UnityEngine.WaitForSeconds(3))

        end

        -- 结束内存采集
        yield_return(self.base:RunGM("StopStatMemory"))



        -- -- ================= 线性 CASE ==========
        -- -- 先跑蒙德城 =================>
        -- posTable = posTableMengde
        -- -- 初始化
        -- -- 角色闪现到第一个点
        -- pos = posTable[1]
        -- localAvatar:SetPosition(pos)
        -- -- 等待3秒
        -- yield_return(CS.UnityEngine.WaitForSeconds(3))

        -- -- 开始跑场景 - 蒙德城中跑
        -- for i=2, #posTable do
        --     pos = posTable[i]
        --     yield_return(self.base:MoveToPositionUntilStateChange(pos, 10, 1))
        -- end

        -- -- 切场景，等待3秒
        -- yield_return(CS.UnityEngine.WaitForSeconds(3))

        -- -- 再跑风龙巢穴 ================>
        -- posTable = posTableFenglong
        -- -- 初始化
        -- -- 角色闪现到第一个点
        -- pos = posTable[1]
        -- localAvatar:SetPosition(pos)
        -- -- 等待3秒
        -- yield_return(CS.UnityEngine.WaitForSeconds(3))

        -- -- 开始跑场景 - 风龙巢穴跑
        -- for i=2, #posTable do
        --     pos = posTable[i]
        --     yield_return(self.base:MoveToPositionUntilStateChange(pos, 10, 1))
        -- end

        -- -- 切场景，等待3秒
        -- yield_return(CS.UnityEngine.WaitForSeconds(3))
        -- -- 进入副本
        -- self.base:RunGM("dungeon 13")


        -- -- 开始跑场景 - 新手海滩->蒙德城
        -- for i=#posTable, 2, -1 do
        --     pos = posTable[i]
        --     yield_return(self.base:MoveToPositionUntilStateChange(pos, 10, 1))
        -- end

        -- -- 开始跑场景 - 蒙德城->新手海滩
        -- for i=2, #posTable do
        --     pos = posTable[i]
        --     yield_return(self.base:MoveToPositionUntilStateChange(pos, 10, 1))
        -- end


        -- for i=0,30,1
        -- do
        --     -- 等待3秒
        --     yield_return(CS.UnityEngine.WaitForSeconds(3))

        --     -- 大世界采集数据
        --     yield_return(self.base:RunGM("SnapshotStatUnit -1"))

        --     -- 等待3秒
        --     yield_return(CS.UnityEngine.WaitForSeconds(3))

        --     -- 进入副本
        --     yield_return(self.base:RunGM("dungeon 1"))

        --     -- 等待10秒 : 进副本Loading界面
        --     yield_return(CS.UnityEngine.WaitForSeconds(10))

        --     -- 副本内采集数据
        --     yield_return(self.base:RunGM("SnapshotStatUnit -1"))

        --     -- 等待3秒
        --     yield_return(CS.UnityEngine.WaitForSeconds(3))

        --     -- 退出副本
        --     singletonManager:GetSingletonInstance("MoleMole.MapModule"):ReqPlayerQuitDungeon()

        --     -- 等待10秒
        --     yield_return(CS.UnityEngine.WaitForSeconds(10))
        -- end

    
        

	end)
}

return self