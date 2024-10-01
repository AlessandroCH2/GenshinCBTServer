require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest997 = class("Quest997", questActorProxy)

Quest997.defaultAlias = "Quest997"

local q997Cfg = require('Quest/Client/Q997ClientConfig')
local subIDs = q997Cfg.SubIDs
local qinData = q997Cfg.QinData
local lisaData = q997Cfg.LisaData
local amborData = q997Cfg.AmborData
local gaiaData = q997Cfg.GaiaData

-- Generated
function Quest997:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["99701"] = self.OnSubStart99701

end

function Quest997:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["99701"] = self.OnSubFinish99701

end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers

function Quest997:OnSubStart99701(quest)
    print("99701 start:...")
    actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.bornPos, amborData.bornDir, true, false,1004)
    actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true, false,1004)
    actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.bornPos, gaiaData.bornDir, true, false,1004)
    actorMgr:CreateActorWithPos(lisaData.Lisa, lisaData.LisaScript, lisaData.LisaID, 0, lisaData.bornPos, lisaData.bornDir, true, false,1004)
end


--@endregion

--@region sub finish handlers
function Quest997:OnSubFinish99701(quest)
    print("OnFinished 99701")
end


--@endregion

function Quest997:Start()
end

function Quest997:OnDestroy()
end

return Quest997