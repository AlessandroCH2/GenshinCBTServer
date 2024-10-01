require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest994 = class("Quest994", questActorProxy)

Quest994.defaultAlias = "Quest994"

local q994Cfg = require('Quest/Client/Q994ClientConfig')
local subIDs = q994Cfg.SubIDs

local qinData = q994Cfg.QinData

-- Generated
function Quest994:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["99401"] = self.OnSubStart99401
	
end

function Quest994:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["99401"] = self.OnSubFinish99401
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers

function Quest994:OnSubStart99401(quest)
    print("99401 start:...")
    actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true, false,1004)
end


--@endregion

--@region sub finish handlers
function Quest994:OnSubFinish99401(quest)
    print("OnFinished 99401")
end

--@endregion

function Quest994:Start()
end

function Quest994:OnDestroy()
end

return Quest994