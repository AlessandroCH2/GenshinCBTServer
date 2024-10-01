require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest373 = class("Quest373", questActorProxy)

Quest373.defaultAlias = "Quest373"

local q373Cfg = require('Quest/Client/Q373ClientConfig')
local subIDs = q373Cfg.SubIDs
local paimonData = q373Cfg.PaimonData
local wendyData = q373Cfg.WendyData
local maidData = q373Cfg.MaidData
local guardData = q373Cfg.GuardData


-- Generated
function Quest373:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["37301"] = self.OnSubStart37301
    self.subStartHandlers["37302"] = self.OnSubStart37302
    self.subStartHandlers["37303"] = self.OnSubStart37303    
end

function Quest373:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["37301"] = self.OnSubFinish37301
    self.subFinishHandlers["37302"] = self.OnSubFinish37302
    self.subFinishHandlers["37303"] = self.OnSubFinish37303
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers


function Quest373:OnSubStart37301(quest)  
    print("37301 start ")
    actorMgr:CreateActorWithPos(guardData.Guard, guardData.GuardScript, guardData.GuardID, 0, guardData.bornPos, guardData.bornDir, true, false,1008)
    actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false,1008,true,1)   
    actorMgr:CreateActorWithPos(maidData.Maid, maidData.MaidScript, maidData.MaidID, 0, maidData.bornPos, maidData.bornDir, true, false,1008)
end

function Quest373:OnSubStart37302(quest)
    print("37302 start:...")
    actorMgr:CreateActorWithPos(paimonData.Paimon, paimonData.PaimonScript, paimonData.PaimonID, 0, paimonData.bornPos, paimonData.bornDir, true, false,1008,true,1)
end

function Quest373:OnSubStart37303(quest)
    print("37303 start:...")
end

--@endregion

--@region sub finish handlers
function Quest373:OnSubFinish37301(quest)
    print("OnFinished 37301")
end

function Quest373:OnSubFinish37302(quest)
    print("OnFinished 37302")
end

function Quest373:OnSubFinish37303(quest)
    print("OnFinished 37303")
end
--@endregion

function Quest373:Start()
end

function Quest373:OnDestroy()
end

return Quest373