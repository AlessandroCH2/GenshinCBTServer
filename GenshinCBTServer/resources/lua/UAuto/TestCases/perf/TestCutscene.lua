--baseClass提供基础接口
local baseClass = require('UAuto/Base/UAutoLuaTestBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("RunScene",baseClass)
local self = UAutoLuaTestCase
self.TestFixture = "TestCutscene"
self.Category = "PerformanceTest"
self.Description = "性能测试cutscene"
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

        CutSceneTable = {
            "Cs_MDAQ48_Runaway01_Convert",
            "Cs_MDAQ018_MDCityShow_Convert",
            "Cs_Goddess_ShowPoint_3001"
        }

        for i=1, #CutSceneTable do
            cutScenePath = "ART/Cutscene/"..CutSceneTable[i]
            CutsceneTestDic = {
                type = CutsceneType.TIME_LINE_PREFAB,
                canSkip = true,
                castListPath = "Cs_CastList_Q355",
                resPath = cutScenePath,
                startPosType = CutsceneInitPosType.FREE,
                startOffset = {0, 0, 0},
                keepCamera = true
            }

            globalActor:PlayCutscene(CutsceneTestDic)

            -- 等待3秒
            yield_return(CS.UnityEngine.WaitForSeconds(3))
        end

	end)
}

return self