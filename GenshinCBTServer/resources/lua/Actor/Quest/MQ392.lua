require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest392 = class("Quest392", questActorProxy)

Quest392.defaultAlias = "Quest392"

local q392Cfg = require('Quest/Client/Q392ClientConfig')
local wendyData = q392Cfg.WendyData
local dilucData = q392Cfg.DilucData
local qinData = q392Cfg.QinData
local paimonData = q392Cfg.PaimonData
local organData = q392Cfg.OrganData

--@region Generated
function Quest392:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["39201"] = self.OnSubStart39201
    self.subStartHandlers["39202"] = self.OnSubStart39202
    self.subStartHandlers["39203"] = self.OnSubStart39203
    self.subStartHandlers["39204"] = self.OnSubStart39204
    self.subStartHandlers["39205"] = self.OnSubStart39205
    self.subStartHandlers["39206"] = self.OnSubStart39206
    self.subStartHandlers["39207"] = self.OnSubStart39207
    self.subStartHandlers["39208"] = self.OnSubStart39208
    self.subStartHandlers["39209"] = self.OnSubStart39209
    self.subStartHandlers["39210"] = self.OnSubStart39210
    self.subStartHandlers["39211"] = self.OnSubStart39211
end

function Quest392:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["39201"] = self.OnSubFinish39201
    self.subFinishHandlers["39202"] = self.OnSubFinish39202
    self.subFinishHandlers["39203"] = self.OnSubFinish39203
    self.subFinishHandlers["39204"] = self.OnSubFinish39204
    self.subFinishHandlers["39205"] = self.OnSubFinish39205
    self.subFinishHandlers["39206"] = self.OnSubFinish39206
    self.subFinishHandlers["39207"] = self.OnSubFinish39207
    self.subFinishHandlers["39208"] = self.OnSubFinish39208
    self.subFinishHandlers["39209"] = self.OnSubFinish39209
    self.subFinishHandlers["39210"] = self.OnSubFinish39210
    self.subFinishHandlers["39211"] = self.OnSubFinish39211
end
--@endregion

-- local param begin
-- local param end

--@region sub start & finish 内调用的函数

-- 发现机关的开车
-- 已发现机关光束的数量（任务完成数量），进行不同的开车对话
function Quest392:FindOrganNarrator()
    local firstorganstate = self:GetSubQuestState(39001)
    local secondorganstate = self:GetSubQuestState(39101)
    local thirdorganstate = self:GetSubQuestState(39201)
    local organstate = firstorganstate + secondorganstate + thirdorganstate
    print(firstorganstate.."|"..secondorganstate.."|"..thirdorganstate)

    if organstate == 7 then
        self:NarratorOnlyTask(q392Cfg.NarratorData.FindOrgan1)
        self:EnterSceneLookCamera(organData.bornPos, 0, 3, true)
    -- elseif organstate == 8 then
    --     self:NarratorOnlyTask(q392Cfg.NarratorData.FindOrgan2)
    -- elseif organstate == 9 then
    --     self:NarratorOnlyTask(q392Cfg.NarratorData.FindOrgan3)
    end

end

-- 第一次发现机关的talk
-- 根据玩家找到的机关数量不同，进行不同的talk
-- 通过与不同npc对话实现
-- 没找到机关：与温迪对话
-- 找到一个机关：与琴对话
-- 找到两个机关：与迪卢克对话
function Quest392:FindOrganTalk()

    -- 生成众多NPC
    local task = curtainUtils.CreateEntityCreateTask({wendyData.Wendy, qinData.Qin, dilucData.Diluc, paimonData.Paimon})
    self:TransmitPlayer(3, sceneData:GetDummyPoint(3,"Q392Player").pos, sceneData:GetDummyPoint(3,"Q392Player").rot,
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

function Quest392:RequestTalk()
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
function Quest392:FindClueNarrator()
    -- 获取任务状态 未完成 = 2, 已完成 = 3
    local firstcluestate = self:GetSubQuestState(39204)
    local secondcluestate = self:GetSubQuestState(39205)
    local thirdcluestate = self:GetSubQuestState(39206)
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
            self:NarratorOnlyTask(q392Cfg.NarratorData.FindClue1_1)
        elseif cluestate == 9 then
            self:PlayCutscene(q392Cfg.SealAppearTimeCfg, 
                function (self)
                    self:NarratorOnlyTask(q392Cfg.NarratorData.FindClue1_3)
                end
            )
        end

    elseif organstate == 7 then
        if cluestate == 8 then
            self:NarratorOnlyTask(q392Cfg.NarratorData.FindClue2_2)
        elseif cluestate == 9 then
            self:PlayCutscene(q392Cfg.SealAppearTimeCfg)
        end
        
    elseif organstate == 8 then
        if cluestate == 9 then
            self:PlayCutscene(q392Cfg.SealAppearTimeCfg, 
                function (self)
                    self:NarratorOnlyTask(q392Cfg.NarratorData.FindClue3_3)
                end
            )
        end
    end
end

-- 开启封印的开车
-- 判断封印解开的数量，对应不同开车和镜头表现
function Quest392:SealOpenCutscene()
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
        self:PlayCutscene(q392Cfg.SealOpenTimeCfg1, 
            function (self)
                self:NarratorOnlyTask(q392Cfg.NarratorData.OpenOrgan1)
            end
        )

    elseif organstate == 8 then
        self:PlayCutscene(q392Cfg.SealOpenTimeCfg2, 
            function (self)
                self:NarratorOnlyTask(q392Cfg.NarratorData.OpenOrgan2)
            end
        )

    elseif organstate == 9 then
        self:PlayCutscene(q392Cfg.SealOpenTimeCfg3, 
            function (self)
                self:CallDelay(1,
                    function (self)
                        self:NarratorOnlyTask(q392Cfg.NarratorData.OpenOrgan3)
                        self:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q389VentiPos2").pos, 0, 3, true)
                    end
                )
            end
        )
    end
end

function Quest392:DestroyNPC()
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
function Quest392:OnSubStart39201(quest)
    print("39201 start ")
end

function Quest392:OnSubStart39202(quest)
    print("39202 start:...")
end

function Quest392:OnSubStart39203(quest)
    print("39203 start:...")
end

function Quest392:OnSubStart39204(quest)
    print("39204 start:...")
end

function Quest392:OnSubStart39205(quest)
    print("39205 start:...")
end

function Quest392:OnSubStart39206(quest)
    print("39206 start:...")
end

function Quest392:OnSubStart39207(quest)
    print("39207 start:play cutscene & finish quest")
    local quest = actorMgr:GetActor(q392Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuestID(false, 39210)
        quest:FinishQuestID(false, 39211)
        quest:FinishQuest(false, nil)
    end
end

function Quest392:OnSubStart39208(quest)
    print("39208 start:...")
end

function Quest392:OnSubStart39209(quest)
    print("39209 start:...")
    local quest = actorMgr:GetActor(q392Cfg.ActorAlias)
    if quest ~= nil then
        self:CallDelay(1.5,
            function (self)
            quest:FinishQuest(false, nil)
            end
        )
    end
end

function Quest392:OnSubStart39210(quest)
    print("39210 start:...")
end
--@endregion

--@region sub finish handlers
function Quest392:OnSubFinish39201(quest)
    print("39201 Finish:Focus Camera & Narrator")
    self:FindOrganNarrator()
end

function Quest392:OnSubFinish39202(quest)
    print("39202 Finish:...")
    self:FindOrganTalk()
end

function Quest392:OnSubFinish39203(quest)
    print("39203 Finish:...")
    self:ActionSafeCall(self.DestroyNPC)
end

function Quest392:OnSubFinish39204(quest)
    print("39204 Finish:...")
    self:FindClueNarrator()
end

function Quest392:OnSubFinish39205(quest)
    print("39205 Finish:...")
    self:FindClueNarrator()
end

function Quest392:OnSubFinish39206(quest)
    print("39206 Finish:...")
    self:FindClueNarrator()
end

function Quest392:OnSubFinish39207(quest)
    print("39207 Finish:...")
end

function Quest392:OnSubFinish39208(quest)
    print("39208 Finish:...")
    self:SealOpenCutscene()
end

function Quest392:OnSubFinish39209(quest)
    print("39209 Finish:...")
end

function Quest392:OnSubFinish39210(quest)
    print("39210 Finish:...")
end
--@endregion

function Quest392:Start()
end

function Quest392:OnDestroy()
end

return Quest392