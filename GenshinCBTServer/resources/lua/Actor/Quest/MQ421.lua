require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest421 = class("Quest421", questActorProxy)

Quest421.defaultAlias = "Quest421"

local q421Cfg = require('Quest/Client/Q421ClientConfig')
local subIDs = q421Cfg.SubIDs
local guardData = q421Cfg.GuardData


-- Generated
function Quest421:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["42101"] = self.OnSubStart42101
    self.subStartHandlers["42102"] = self.OnSubStart42102
    self.subStartHandlers["42103"] = self.OnSubStart42103
    self.subStartHandlers["42104"] = self.OnSubStart42104
end

function Quest421:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["42101"] = self.OnSubFinish42101
    self.subFinishHandlers["42102"] = self.OnSubFinish42102
    self.subFinishHandlers["42103"] = self.OnSubFinish42103
    self.subFinishHandlers["42104"] = self.OnSubFinish42104
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers


function Quest421:OnSubStart42101(quest)  
    print("42101 start ")
end

function Quest421:OnSubStart42102(quest)
    print("42102 start xyz")
    self:ActionSafeCall(self.Trans)
end

function Quest421:Trans()
    print("Trans start xyz")
    self:TransmitPlayer(1008, sceneData:GetDummyPoint(1008,"Q375Fail").pos, sceneData:GetDummyPoint(1008,"Q375Fail").rot,
    function(self)
        local quest = actorMgr:GetActor(q421Cfg.ActorAlias)
        if quest ~= nil then
            quest:FinishQuest(false, nil)
        end
    end
    ) 
end

function Quest421:OnSubStart42103(quest)
    print("42103 start xyz")
end

function Quest421:OnSubStart42104(quest)
    print("42104 start xyz")
    actorMgr:CreateActorWithPos(guardData.Guard, guardData.GuardScript, guardData.GuardID, 0, guardData.bornPos, guardData.bornDir, true, false,1008)    
    self:CallDelay(5,self.Clean)
end

function Quest421:Clean()
    local guard = actorMgr:GetActor(guardData.Guard)
    if guard ~= nil then
        guard:Destroy(false)
    end

    local quest = actorMgr:GetActor(q421Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(false, nil)
    end
end

--@endregion

--@region sub finish handlers
function Quest421:OnSubFinish42101(quest)
    print("OnFinished 42101")
end

function Quest421:OnSubFinish42102(quest)
    print("OnFinished 42102")
end

function Quest421:OnSubFinish42103(quest)
    print("OnFinished 42103")
end

function Quest421:OnSubFinish42104(quest)
    print("OnFinished 42104")
end


--@endregion

function Quest421:Start()
end

function Quest421:OnDestroy()
end

return Quest421