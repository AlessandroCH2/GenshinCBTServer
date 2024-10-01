require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest391 = class("Quest391", questActorProxy)

Quest391.defaultAlias = "Quest391"

local q391Cfg = require('Quest/Client/Q391ClientConfig')
local wendyData = q391Cfg.WendyData
local dilucData = q391Cfg.DilucData
local qinData = q391Cfg.QinData
local paimonData = q391Cfg.PaimonData
local organData = q391Cfg.OrganData

--@region Generated
function Quest391:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["39101"] = self.OnSubStart39101
    self.subStartHandlers["39102"] = self.OnSubStart39102
    self.subStartHandlers["39103"] = self.OnSubStart39103
    self.subStartHandlers["39104"] = self.OnSubStart39104
    self.subStartHandlers["39105"] = self.OnSubStart39105
    self.subStartHandlers["39106"] = self.OnSubStart39106
    self.subStartHandlers["39107"] = self.OnSubStart39107
    self.subStartHandlers["39108"] = self.OnSubStart39108
    self.subStartHandlers["39109"] = self.OnSubStart39109
    self.subStartHandlers["39110"] = self.OnSubStart39110
    self.subStartHandlers["39111"] = self.OnSubStart39111
end

function Quest391:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["39101"] = self.OnSubFinish39101
    self.subFinishHandlers["39102"] = self.OnSubFinish39102
    self.subFinishHandlers["39103"] = self.OnSubFinish39103
    self.subFinishHandlers["39104"] = self.OnSubFinish39104
    self.subFinishHandlers["39105"] = self.OnSubFinish39105
    self.subFinishHandlers["39106"] = self.OnSubFinish39106
    self.subFinishHandlers["39107"] = self.OnSubFinish39107
    self.subFinishHandlers["39108"] = self.OnSubFinish39108
    self.subFinishHandlers["39109"] = self.OnSubFinish39109
    self.subFinishHandlers["39110"] = self.OnSubFinish39110
    self.subFinishHandlers["39111"] = self.OnSubFinish39111
end
--@endregion

-- local param begin
-- local param end

--@region sub start & finish 内调用的函数

-- 发现机关的开车
-- 已发现机关光束的数量（任务完成数量），进行不同的开车对话
function Quest391:FindOrganNarrator()
    local firstorganstate = self:GetSubQuestState(39001)
    local secondorganstate = self:GetSubQuestState(39101)
    local thirdorganstate = self:GetSubQuestState(39201)
    local organstate = firstorganstate + secondorganstate + thirdorganstate
    print(firstorganstate.."|"..secondorganstate.."|"..thirdorganstate)

    if organstate == 7 then
        self:NarratorOnlyTask(q391Cfg.NarratorData.FindOrgan1)
        self:EnterSceneLookCamera(organData.bornPos, 0, 3, true)
    -- elseif organstate == 8 then
    --     self:NarratorOnlyTask(q391Cfg.NarratorData.FindOrgan2)
    -- elseif organstate == 9 then
    --     self:NarratorOnlyTask(q391Cfg.NarratorData.FindOrgan3)
    end

end

-- 第一次发现机关的talk
-- 根据玩家找到的机关数量不同，进行不同的talk
-- 通过与不同npc对话实现
-- 没找到机关：与温迪对话
-- 找到一个机关：与琴对话
-- 找到两个机关：与迪卢克对话
function Quest391:FindOrganTalk()

    -- 生成众多NPC
    local task = curtainUtils.CreateEntityCreateTask({wendyData.Wendy, qinData.Qin, dilucData.Diluc, paimonData.Paimon})
    self:TransmitPlayer(3, sceneData:GetDummyPoint(3,"Q391Player").pos, sceneData:GetDummyPoint(3,"Q391Player").rot,
    self.RequestTalk,
    function (self)
        actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true)
        actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true)
        actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true)
        actorMgr:CreateActorWithPos(paimonData.Paimon, paimonData.PaimonScript, paimonData.PaimonID, 0, paimonData.bornPos, paimonData.bornDir, true)
    end,
    task
    )

end

function Quest391:RequestTalk()
    -- 获取任务状态 未完成 = 2, 已完成 = 3
    local firstorganstate = self:GetSubQuestState(39003)
    local secondorganstate = self:GetSubQuestState(39103)
    local thirdorganstate = self:GetSubQuestState(39203)
    print(firstorganstate.."|"..secondorganstate.."|"..thirdorganstate)

    -- 修正，未领取的状态 = 未完成
    if firstorganstate == 0 then
        firstorganstate = 2
    end

    if secondorganstate == 0 then
        secondorganstate = 2
    end

    if thirdorganstate == 0 then
        thirdorganstate = 2
    end
    local organstate = firstorganstate + secondorganstate + thirdorganstate
    print(firstorganstate.."|"..secondorganstate.."|"..thirdorganstate.."|"..organstate)

    -- 根据任务状态的和，判断玩家完成了几个任务，对应不同的talk
    if organstate == 6 then
        self:RequestInteraction(wendyData.Wendy)
    elseif organstate == 7 then
        self:RequestInteraction(qinData.Qin)
    elseif organstate == 8 then
        self:RequestInteraction(dilucData.Diluc)
    end
end

-- 采集光束的开车
-- 根据玩家采集光束的数量（任务完成数量），进行不同的开车对话
function Quest391:FindClueNarrator()
    -- 获取任务状态 未完成 = 2, 已完成 = 3
    local firstcluestate = self:GetSubQuestState(39104)
    local secondcluestate = self:GetSubQuestState(39105)
    local thirdcluestate = self:GetSubQuestState(39106)
    local cluestate = firstcluestate + secondcluestate + thirdcluestate
    print("光束数量"..firstcluestate.."|"..secondcluestate.."|"..thirdcluestate.."|"..cluestate)

    local firstorganstate = self:GetSubQuestState(39007)
    local secondorganstate = self:GetSubQuestState(39107)
    local thirdorganstate = self:GetSubQuestState(39207)

    -- 修正，未领取的状态 = 未完成
    if firstorganstate == 0 then
        firstorganstate = 2
    end

    if secondorganstate == 0 then
        secondorganstate = 2
    end

    if thirdorganstate == 0 then
        thirdorganstate = 2
    end
    local organstate = firstorganstate + secondorganstate + thirdorganstate
    print("机关数量"..firstorganstate.."|"..secondorganstate.."|"..thirdorganstate.."|"..organstate)


    -- 根据任务状态的和，判断玩家完成了几个任务，对应不同的开车
    if organstate == 6 then
        if cluestate == 7 then
            self:NarratorOnlyTask(q391Cfg.NarratorData.FindClue1_1)
        elseif cluestate == 9 then
            self:PlayCutscene(q391Cfg.SealAppearTimeCfg, 
                function (self)
                    self:NarratorOnlyTask(q391Cfg.NarratorData.FindClue1_3)
                end
            )
        end

    elseif organstate == 7 then
        if cluestate == 8 then
            self:NarratorOnlyTask(q391Cfg.NarratorData.FindClue2_2)
        elseif cluestate == 9 then
            self:PlayCutscene(q391Cfg.SealAppearTimeCfg)
        end
        
    elseif organstate == 8 then
        if cluestate == 9 then
            self:PlayCutscene(q391Cfg.SealAppearTimeCfg, 
                function (self)
                    self:NarratorOnlyTask(q391Cfg.NarratorData.FindClue3_3)
                end
            )
        end
    end
end

-- 开启封印的开车
-- 判断封印解开的数量，对应不同开车和镜头表现
function Quest391:SealOpenCutscene()
    -- 获取任务状态 未完成 = 2, 已完成 = 3
    local firstorganstate = self:GetSubQuestState(39008)
    local secondorganstate = self:GetSubQuestState(39108)
    local thirdorganstate = self:GetSubQuestState(39208)
    print(firstorganstate.."|"..secondorganstate.."|"..thirdorganstate)

    -- 修正，未领取的状态 = 未完成
    if firstorganstate == 0 then
        firstorganstate = 2
    end

    if secondorganstate == 0 then
        secondorganstate = 2
    end

    if thirdorganstate == 0 then
        thirdorganstate = 2
    end
    local organstate = firstorganstate + secondorganstate + thirdorganstate
    print(firstorganstate.."|"..secondorganstate.."|"..thirdorganstate.."|"..organstate)

    -- 根据任务状态的和，判断玩家完成了几个任务
    if organstate == 7 then
        self:PlayCutscene(q391Cfg.SealOpenTimeCfg1, 
            function (self)
                self:NarratorOnlyTask(q391Cfg.NarratorData.OpenOrgan1)
            end
        )

    elseif organstate == 8 then
        self:PlayCutscene(q391Cfg.SealOpenTimeCfg2, 
            function (self)
                self:NarratorOnlyTask(q391Cfg.NarratorData.OpenOrgan2)
            end
        )

    elseif organstate == 9 then
        self:PlayCutscene(q391Cfg.SealOpenTimeCfg3, 
            function (self)
                self:CallDelay(1,
                    function (self)
                        self:NarratorOnlyTask(q391Cfg.NarratorData.OpenOrgan3)
                        self:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q389VentiPos2").pos, 0, 3, true)
                    end
                )
            end
        )
    end
end

function Quest391:DestroyNPC()
    self:ShowBlackScreen(0.5, 1, 0.5,
        function(self)
            local wendy = actorMgr:GetActor(wendyData.Wendy)
            local diluc = actorMgr:GetActor(dilucData.Diluc)
            local qin = actorMgr:GetActor(qinData.Qin)
            local paimon = actorMgr:GetActor(paimonData.Paimon)

            if wendy ~= nil then
                wendy:Destroy(false)
            end

            if diluc ~= nil then
                diluc:Destroy(false)
            end

            if qin ~= nil then
                qin:Destroy(false)
            end

            if paimon ~= nil then
                paimon:Destroy(false)
            end
        end
    )
end
--@endregion

-- local method begin
--@region sub start handlers
function Quest391:OnSubStart39101(quest)
    print("39101 start ")
end

function Quest391:OnSubStart39102(quest)
    print("39102 start:...")
end

function Quest391:OnSubStart39103(quest)
    print("39103 start:...")
end

function Quest391:OnSubStart39104(quest)
    print("39104 start:...")
end

function Quest391:OnSubStart39105(quest)
    print("39105 start:...")
end

function Quest391:OnSubStart39106(quest)
    print("39106 start:...")
end

function Quest391:OnSubStart39107(quest)
    print("39107 start:play cutscene & finish quest")
    local quest = actorMgr:GetActor(q391Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuestID(false, 39110)
        quest:FinishQuestID(false, 39111)
        quest:FinishQuest(false, nil)
    end
end

function Quest391:OnSubStart39108(quest)
    print("39108 start:...")
end

function Quest391:OnSubStart39109(quest)
    print("39109 start:...")
    local quest = actorMgr:GetActor(q391Cfg.ActorAlias)
    if quest ~= nil then
        self:CallDelay(1.5,
            function (self)
            quest:FinishQuest(false, nil)
            end
        )
    end
end

function Quest391:OnSubStart39110(quest)
    print("39110 start:...")
end
--@endregion

--@region sub finish handlers
function Quest391:OnSubFinish39101(quest)
    print("39101 Finish:Focus Camera & Narrator")
    self:FindOrganNarrator()
end

function Quest391:OnSubFinish39102(quest)
    print("39102 Finish:...")
    self:FindOrganTalk()
end

function Quest391:OnSubFinish39103(quest)
    print("39103 Finish:...")
    self:ActionSafeCall(self.DestroyNPC)
end

function Quest391:OnSubFinish39104(quest)
    print("39104 Finish:...")
    self:FindClueNarrator()
end

function Quest391:OnSubFinish39105(quest)
    print("39105 Finish:...")
    self:FindClueNarrator()
end

function Quest391:OnSubFinish39106(quest)
    print("39106 Finish:...")
    self:FindClueNarrator()
end

function Quest391:OnSubFinish39107(quest)
    print("39107 Finish:...")
end

function Quest391:OnSubFinish39108(quest)
    print("39108 Finish:...")
    self:SealOpenCutscene()
end

function Quest391:OnSubFinish39109(quest)
    print("39109 Finish:...")
end

function Quest391:OnSubFinish39110(quest)
    print("39110 Finish:...")
end
--@endregion

function Quest391:Start()
end

function Quest391:OnDestroy()
end

return Quest391