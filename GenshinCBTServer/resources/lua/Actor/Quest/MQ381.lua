require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest381 = class("Quest381", questActorProxy)

Quest381.defaultAlias = "Quest381"

local q381Cfg = require('Quest/Client/Q381ClientConfig')
local subIDs = q381Cfg.SubIDs
local qinData = q381Cfg.QinData
local dilucData = q381Cfg.DilucData
local paimonData = q381Cfg.PaimonData

-- Generated
function Quest381:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["38101"] = self.OnSubStart38101
    self.subStartHandlers["38102"] = self.OnSubStart38102
    self.subStartHandlers["38103"] = self.OnSubStart38103
    self.subStartHandlers["38104"] = self.OnSubStart38104
    self.subStartHandlers["38105"] = self.OnSubStart38105
end

function Quest381:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["38101"] = self.OnSubFinish38101
    self.subFinishHandlers["38102"] = self.OnSubFinish38102
    self.subFinishHandlers["38103"] = self.OnSubFinish38103
    self.subFinishHandlers["38104"] = self.OnSubFinish38104
    self.subFinishHandlers["38105"] = self.OnSubFinish38105
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers

function Quest381:OnSubStart38101(quest)
    print("38101 start:...")
    -- local quest = actorMgr:GetActor(q381Cfg.ActorAlias)
    -- if quest ~= nil then
    --     quest:FinishQuest(false, nil)
    -- end 
    actorMgr:CreateActorWithPos("Q381Trigger", "Actor/Gadget/Q381Trigger", 70900002, 0, sceneData:GetDummyPoint(3,"Q381DragonTill").pos, sceneData:GetDummyPoint(3,"Q381DragonTill").rot, true, false)
end

function Quest381:OnSubStart38102(quest)
    print("38102 start:...")
    -- TODO: Do sth on sub quest 38102 start
end

function Quest381:OnSubStart38103(quest)
    print("38103 start:...")
    -- TODO: Do sth on sub quest 38102 start
end

function Quest381:OnSubStart38104(quest)
    print("38104 start:...")
    -- TODO: Do sth on sub quest 38102 start
end

function Quest381:OnSubStart38105(quest)
    print("38105 start:...")
    self:CallDelay(1, self.EnterDialog)  
end

function Quest381:CreateNPC()
    actorMgr:CreateActorWithPos(paimonData.Paimon, paimonData.PaimonScript, paimonData.PaimonID, 0, paimonData.bornPos, paimonData.bornDir,  true, false,1006 )  
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true, false,1006 )  
    actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true, false,1006 )  
end


function Quest381:StartDialog()
    self:RequestInteraction(qinData.Qin)
end

function Quest381:EnterDialog()
    self:ShowBlackScreen(0.5, 1.0, 0.5, self.CreateNPC, self.StartDialog)
end

--@endregion

--@region sub finish handlers
function Quest381:OnSubFinish38101(quest)
    print("OnFinished 38101")
end

function Quest381:OnSubFinish38102(quest)
    print("OnFinished 38102")
end

function Quest381:OnSubFinish38103(quest)
    print("OnFinished 38103")
end

function Quest381:OnSubFinish38104(quest)
    print("OnFinished 38104")
end

function Quest381:OnSubFinish38105(quest)
    print("OnFinished 38105")
    self:ActionSafeCall(self.ExitDialog)
end

function Quest381:DestroyNPC()
    self:ActionSafeCall(
        function(self)
            local paimon = actorMgr:GetActor(paimonData.Paimon)
            if paimon ~= nil then
                paimon:Destroy(false)
            end
        end
    )
    self:ActionSafeCall(
        function(self)
            local qin = actorMgr:GetActor(qinData.Qin)
            if qin ~= nil then
                qin:Destroy(false)
            end
        end
    )
    self:ActionSafeCall(
        function(self)
            local diluc = actorMgr:GetActor(dilucData.Diluc)
            if diluc ~= nil then
                diluc:Destroy(false)
            end
        end
    )
end

function Quest381:TellStory(quest)
    self:CallDelay(0.7, self.StartStory)
end

function Quest381:StartStory(quest)
    self:NarratorOnlyTask(q381Cfg.StoryNarrator, nil, "Story")
end

function Quest381:ExitDialog()
    self:ShowBlackScreen(0.5, 1.0, 0.5, self.DestroyNPC, self.TellStory)
end

--@endregion

function Quest381:Start()
end

function Quest381:OnDestroy()
end

return Quest381