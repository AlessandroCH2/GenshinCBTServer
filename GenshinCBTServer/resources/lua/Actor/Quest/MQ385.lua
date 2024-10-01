require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest385 = class("Quest385", questActorProxy)

Quest385.defaultAlias = "Quest385"

local q385Cfg = require('Quest/Client/Q385ClientConfig')

-- Generated
function Quest385:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["38501"] = self.OnSubStart38501
end

function Quest385:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["38501"] = self.OnSubFinish38501
end

-- local param begin
-- local param end

---sub start & finish 内调用的函数
-- end

-- local method begin
--@region sub start handlers
function Quest385:OnSubStart38501(quest)
    print("38501 start ")
end
--@endregion

--@region sub finish handlers
function Quest385:OnSubFinish38501(quest)
    print("OnFinished 38501")
end
--@endregion

function Quest385:Start()
end

function Quest385:OnDestroy()
end

return Quest385