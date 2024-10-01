require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest382 = class("Quest382", questActorProxy)

Quest382.defaultAlias = "Quest382"

local q382Cfg = require('Quest/Client/Q382ClientConfig')
local subIDs = q382Cfg.SubIDs

-- Generated
function Quest382:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["38201"] = self.OnSubStart38201
    self.subStartHandlers["38202"] = self.OnSubStart38202
    self.subStartHandlers["38203"] = self.OnSubStart38203
end

function Quest382:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["38201"] = self.OnSubFinish38201
    self.subFinishHandlers["38202"] = self.OnSubFinish38202
    self.subFinishHandlers["38203"] = self.OnSubFinish38203
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers

function Quest382:OnSubStart38201(quest)
    print("38201 start:...")
    -- local quest = actorMgr:GetActor(q382Cfg.ActorAlias)
    -- if quest ~= nil then
    --     quest:FinishQuest(false, nil)
    -- end 
    actorMgr:CreateActorWithPos("Q382Trigger", "Actor/Gadget/Q382Trigger", 70900002, 0, sceneData:GetDummyPoint(3,"Q382DragonTill").pos, sceneData:GetDummyPoint(3,"Q382DragonTill").rot, true, false)
end

function Quest382:OnSubStart38202(quest)
    print("38202 start:...")
    self:CallDelay(20,self.DestroyMark)
end

function Quest382:OnSubStart38203(quest)
    print("38203 start:...")
    -- TODO: Do sth on sub quest 38202 start
    local quest = actorMgr:GetActor(q382Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(false, nil)
    end
end
--@endregion

--@region sub finish handlers
function Quest382:OnSubFinish38201(quest)
    print("OnFinished 38201")
    self:NarratorOnlyTask(q382Cfg.PaimonNarrator, nil, "Story")
    self:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q382DragonTillChest").pos, 4.5, 3, true)
    -- globalActor:SpawnGadget(70900201, sceneData:GetDummyPoint(3,"Q382DragonTillChest").pos, sceneData:GetDummyPoint(3,"Q382DragonTillChest").rot, "Tearchest", 3)
end

function Quest382:OnSubFinish38202(quest)
    print("OnFinished 38202")
    self:UnSpawn("Tearchest")
    -- self:NarratorOnlyTask(q382Cfg.StoryNarrator, nil, "Story")
end

function Quest382:DestroyMark()
    self:UnSpawn("Tearchest")
end

function Quest382:OnSubFinish38203(quest)
    print("OnFinished 38202")
end
--@endregion

function Quest382:Start()
end

function Quest382:OnDestroy()
end

return Quest382