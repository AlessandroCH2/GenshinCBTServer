require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest390 = class("Quest390", questActorProxy)

Quest390.defaultAlias = "Quest390"

local q390Cfg = require('Quest/Client/Q390ClientConfig')
local wendyData = q390Cfg.WendyData
local dilucData = q390Cfg.DilucData
local qinData = q390Cfg.QinData
local paimonData = q390Cfg.PaimonData
local organData = q390Cfg.OrganData

--@region Generated
function Quest390:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["39001"] = self.OnSubStart39001
    self.subStartHandlers["39002"] = self.OnSubStart39002
    self.subStartHandlers["39003"] = self.OnSubStart39003
    self.subStartHandlers["39004"] = self.OnSubStart39004
    self.subStartHandlers["39005"] = self.OnSubStart39005
    self.subStartHandlers["39006"] = self.OnSubStart39006
    self.subStartHandlers["39007"] = self.OnSubStart39007
    self.subStartHandlers["39008"] = self.OnSubStart39008
    self.subStartHandlers["39009"] = self.OnSubStart39009
    self.subStartHandlers["39010"] = self.OnSubStart39010
    self.subStartHandlers["39011"] = self.OnSubStart39011
end

function Quest390:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["39001"] = self.OnSubFinish39001
    self.subFinishHandlers["39002"] = self.OnSubFinish39002
    self.subFinishHandlers["39003"] = self.OnSubFinish39003
    self.subFinishHandlers["39004"] = self.OnSubFinish39004
    self.subFinishHandlers["39005"] = self.OnSubFinish39005
    self.subFinishHandlers["39006"] = self.OnSubFinish39006
    self.subFinishHandlers["39007"] = self.OnSubFinish39007
    self.subFinishHandlers["39008"] = self.OnSubFinish39008
    self.subFinishHandlers["39009"] = self.OnSubFinish39009
    self.subFinishHandlers["39010"] = self.OnSubFinish39010
    self.subFinishHandlers["39011"] = self.OnSubFinish39011
end
--@endregion

-- local param begin
-- local param end

--@region sub start & finish 内调用的函数

-- 发现机关的开车
-- 已发现机关光束的数量（任务完成数量），进行不同的开车对话
function Quest390:FindOrganNarrator()
    local firstorganstate = self:GetSubQuestState(39001)
    local secondorganstate = self:GetSubQuestState(39101)
    local thirdorganstate = self:GetSubQuestState(39201)
    local organstate = firstorganstate + secondorganstate + thirdorganstate
    print(firstorganstate.."|"..secondorganstate.."|"..thirdorganstate)

    if organstate == 7 then
        self:NarratorOnlyTask(q390Cfg.NarratorData.FindOrgan1)
        self:EnterSceneLookCamera(organData.bornPos, 0, 3, true)
    -- elseif organstate == 8 then
    --     self:NarratorOnlyTask(q390Cfg.NarratorData.FindOrgan2)
    -- elseif organstate == 9 then
    --     self:NarratorOnlyTask(q390Cfg.NarratorData.FindOrgan3)
    end

end

-- 第一次发现机关的talk
-- 根据玩家找到的机关数量不同，进行不同的talk
-- 通过与不同npc对话实现
-- 没找到机关：与温迪对话
-- 找到一个机关：与琴对话
-- 找到两个机关：与迪卢克对话
function Quest390:FindOrganTalk()

    -- 生成众多NPC
    local task = curtainUtils.CreateEntityCreateTask({wendyData.Wendy, qinData.Qin, dilucData.Diluc, paimonData.Paimon})
    self:TransmitPlayer(3, sceneData:GetDummyPoint(3,"Q390Player").pos, sceneData:GetDummyPoint(3,"Q390Player").rot,
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

function Quest390:RequestTalk()
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
function Quest390:FindClueNarrator()
    -- 获取任务状态 未完成 = 2, 已完成 = 3
    local firstcluestate = self:GetSubQuestState(39004)
    local secondcluestate = self:GetSubQuestState(39005)
    local thirdcluestate = self:GetSubQuestState(39006)
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
            self:NarratorOnlyTask(q390Cfg.NarratorData.FindClue1_1)
        elseif cluestate == 9 then
            self:PlayCutscene(q390Cfg.SealAppearTimeCfg, 
                function (self)
                    self:NarratorOnlyTask(q390Cfg.NarratorData.FindClue1_3)
                end
            )
        end

    elseif organstate == 7 then
        if cluestate == 8 then
            self:NarratorOnlyTask(q390Cfg.NarratorData.FindClue2_2)
        elseif cluestate == 9 then
            self:PlayCutscene(q390Cfg.SealAppearTimeCfg)
        end
        
    elseif organstate == 8 then
        if cluestate == 9 then
            self:PlayCutscene(q390Cfg.SealAppearTimeCfg, 
                function (self)
                    self:NarratorOnlyTask(q390Cfg.NarratorData.FindClue3_3)
                end
            )
        end
    end
end

-- 开启封印的开车
-- 判断封印解开的数量，对应不同开车和镜头表现
function Quest390:SealOpenCutscene()
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
        self:PlayCutscene(q390Cfg.SealOpenTimeCfg1, 
            function (self)
                self:NarratorOnlyTask(q390Cfg.NarratorData.OpenOrgan1)
            end
        )

    elseif organstate == 8 then
        self:PlayCutscene(q390Cfg.SealOpenTimeCfg2, 
            function (self)
                self:NarratorOnlyTask(q390Cfg.NarratorData.OpenOrgan2)
            end
        )

    elseif organstate == 9 then
        self:PlayCutscene(q390Cfg.SealOpenTimeCfg3, 
            function (self)
                self:CallDelay(1,
                    function (self)
                        self:NarratorOnlyTask(q390Cfg.NarratorData.OpenOrgan3)
                        self:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q389VentiPos2").pos, 0, 3, true)
                    end
                )
            end
        )
    end
end

function Quest390:DestroyNPC()
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
function Quest390:OnSubStart39001(quest)
    print("39001 start ")
end

function Quest390:OnSubStart39002(quest)
    print("39002 start:...")
end

function Quest390:OnSubStart39003(quest)
    print("39003 start:...")
end

function Quest390:OnSubStart39004(quest)
    print("39004 start:...")
end

function Quest390:OnSubStart39005(quest)
    print("39005 start:...")
end

function Quest390:OnSubStart39006(quest)
    print("39006 start:...")
end

function Quest390:OnSubStart39007(quest)
    print("39007 start:play cutscene & finish quest")
    local quest = actorMgr:GetActor(q390Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuestID(false, 39010)
        quest:FinishQuestID(false, 39011)
        quest:FinishQuest(false, nil)
    end
end

function Quest390:OnSubStart39008(quest)
    print("39008 start:...")
end

function Quest390:OnSubStart39009(quest)
    print("39009 start:...")
    local quest = actorMgr:GetActor(q390Cfg.ActorAlias)
    if quest ~= nil then
        self:CallDelay(1.5,
            function (self)
            quest:FinishQuest(false, nil)
            end
        )
    end
end

function Quest390:OnSubStart39010(quest)
    print("39010 start:...")
end
--@endregion

--@region sub finish handlers
function Quest390:OnSubFinish39001(quest)
    print("39001 Finish:Focus Camera & Narrator")
    self:FindOrganNarrator()
end

function Quest390:OnSubFinish39002(quest)
    print("39002 Finish:...")
    self:FindOrganTalk()
end

function Quest390:OnSubFinish39003(quest)
    print("39003 Finish:...")
    self:ActionSafeCall(self.DestroyNPC)
end

function Quest390:OnSubFinish39004(quest)
    print("39004 Finish:...")
    self:FindClueNarrator()
end

function Quest390:OnSubFinish39005(quest)
    print("39005 Finish:...")
    self:FindClueNarrator()
end

function Quest390:OnSubFinish39006(quest)
    print("39006 Finish:...")
    self:FindClueNarrator()
end

function Quest390:OnSubFinish39007(quest)
    print("39007 Finish:...")
end

function Quest390:OnSubFinish39008(quest)
    print("39008 Finish:...")
    self:SealOpenCutscene()
end

function Quest390:OnSubFinish39009(quest)
    print("39009 Finish:...")
end

function Quest390:OnSubFinish39010(quest)
    print("39010 Finish:...")
end
--@endregion

function Quest390:Start()
end

function Quest390:OnDestroy()
end

return Quest390