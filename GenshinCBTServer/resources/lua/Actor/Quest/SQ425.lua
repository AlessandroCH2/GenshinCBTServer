require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest425 = class("Quest425", questActorProxy)

Quest425.defaultAlias = "Quest425"

local q425Cfg = require('Quest/Client/Q425ClientConfig')
local subIDs = q425Cfg.SubIDs
local wendyData = q425Cfg.WendyData
local windCushionData = q425Cfg.WindCushionData
local windFlowData = q425Cfg.WindFlowData

-- Generated
function Quest425:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["42501"] = self.OnSubStart42501
    self.subStartHandlers["42502"] = self.OnSubStart42502
    self.subStartHandlers["42503"] = self.OnSubStart42503
    self.subStartHandlers["42504"] = self.OnSubStart42504
end

function Quest425:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["42501"] = self.OnSubFinish42501
	self.subFinishHandlers["42502"] = self.OnSubFinish42502
    self.subFinishHandlers["42503"] = self.OnSubFinish42503
    self.subFinishHandlers["42504"] = self.OnSubFinish42504  
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers

function Quest425:OnSubStart42501(quest)
    print("42501 start:...")
end

function Quest425:OnSubStart42502(quest)
    print("42502 start:...")
    actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false, 1015) 
    -- TODO: Do sth on sub quest 42502 start
end

function Quest425:OnSubStart42503(quest)
    print("42503 start:...")
    windCushionData.bornPos.y = windCushionData.bornPos.y - 67
    globalActor:SpawnGadget(windCushionData.WindCushionID, windCushionData.bornPos, windCushionData.bornDir, windCushionData.WindCushion, 1015)
    globalActor:SpawnGadget(windFlowData.WindFlowID, windFlowData.bornPos, windFlowData.bornDir, windFlowData.WindFlow, 1015)
    self:TriggerLevelAbility("Avatar_Test_FlyingBomber")
    self:EnterBomberMode()
    self:CallDelay(2,self.AdvanceQuest)
end

function Quest425:OnSubStart42504(quest)
    print("42504 start:...")
    -- TODO: Do sth on sub quest 42504 start
end



function Quest425:AdvanceQuest()
    local quest = actorMgr:GetActor(q425Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(false, nil)
    end 
end

--@endregion

--@region sub finish handlers
function Quest425:OnSubFinish42501(quest)
    print("OnFinished 42501")
end

function Quest425:OnSubFinish42502(quest)
    print("OnFinished 42502")
end

function Quest425:OnSubFinish42503(quest)
    print("OnFinished 42503")
end

function Quest425:OnSubFinish42504(quest)
    print("OnFinished 42504")
    self:ExitBomberMode()
    self:TriggerLevelAbility("Level_Remove_Avatar_Test_FlyingBomber")
    self:UnSpawn(windCushionData.WindCushion)
    self:UnSpawn(windFlowData.WindFlow)   
end

--@endregion

function Quest425:Start()
end

function Quest425:OnDestroy()
end

return Quest425