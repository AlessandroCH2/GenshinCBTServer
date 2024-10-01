require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest422 = class("Quest422", questActorProxy)

Quest422.defaultAlias = "Quest422"

local q422Cfg = require('Quest/Client/Q422ClientConfig')
local subIDs = q422Cfg.SubIDs

-- Generated
function Quest422:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["42201"] = self.OnSubStart42201
    -- self.subStartHandlers["38203"] = self.OnSubStart38203
end

function Quest422:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["42201"] = self.OnSubFinish42201
    -- self.subFinishHandlers["38203"] = self.OnSubFinish38203
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers

function Quest422:OnSubFinish42201(quest)
    print("42201 finish: Play CutScene")
    self:PlayCutscene(q422Cfg.SwordBreak)
end

-- function Quest382:OnSubFinish38203(quest)
--     print("OnFinished 38202")
-- end
--@endregion

function Quest422:Start()
end

function Quest422:OnDestroy()
end

return Quest422