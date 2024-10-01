require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest420 = class("Quest420", questActorProxy)

Quest420.defaultAlias = "Quest420"

local q420Cfg = require('Quest/Client/Q420ClientConfig')
local subIDs = q420Cfg.SubIDs

-- Generated
function Quest420:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["42001"] = self.OnSubStart42001
    -- self.subStartHandlers["38203"] = self.OnSubStart38203
end

function Quest420:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["42001"] = self.OnSubFinish42001
    -- self.subFinishHandlers["38203"] = self.OnSubFinish38203
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers

function Quest420:OnSubFinish42001(quest)
    print("42001 finish: Play CutScene")
    self:PlayCutscene(q420Cfg.SwordBreak)
end

-- function Quest382:OnSubFinish38203(quest)
--     print("OnFinished 38202")
-- end
--@endregion

function Quest420:Start()
end

function Quest420:OnDestroy()
end

return Quest420