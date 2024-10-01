require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest419 = class("Quest419", questActorProxy)

Quest419.defaultAlias = "Quest419"

local q419Cfg = require('Quest/Client/Q419ClientConfig')
local subIDs = q419Cfg.SubIDs

-- Generated
function Quest419:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["41901"] = self.OnSubStart41901
    -- self.subStartHandlers["38203"] = self.OnSubStart38203
end

function Quest419:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["41901"] = self.OnSubFinish41901
    -- self.subFinishHandlers["38203"] = self.OnSubFinish38203
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers

function Quest419:OnSubFinish41901(quest)
    print("41901 finish: Play CutScene")
    self:PlayCutscene(q419Cfg.SwordBreak)
end

-- function Quest382:OnSubFinish38203(quest)
--     print("OnFinished 38202")
-- end
--@endregion

function Quest419:Start()
end

function Quest419:OnDestroy()
end

return Quest419