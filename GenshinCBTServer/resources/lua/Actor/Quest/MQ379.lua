require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest379 = class("Quest379", questActorProxy)

Quest379.defaultAlias = "Quest379"

local q379Cfg = require('Quest/Client/Q379ClientConfig')
local wendyData = q379Cfg.WendyData
local dilucData = q379Cfg.DilucData
local qinData = q379Cfg.QinData



-- Generated
function Quest379:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["37901"] = self.OnSubStart37901
    self.subStartHandlers["37902"] = self.OnSubStart37902    
    self.subStartHandlers["37903"] = self.OnSubStart37903    
    self.subStartHandlers["37904"] = self.OnSubStart37904    
end

function Quest379:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["37901"] = self.OnSubFinish37901
    self.subFinishHandlers["37902"] = self.OnSubFinish37902
    self.subFinishHandlers["37903"] = self.OnSubFinish37903
    self.subFinishHandlers["37904"] = self.OnSubFinish37904
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers


function Quest379:OnSubStart37901(quest)  
    print("37901 start ")
    actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false,1009)  
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true, false,1009)
end

function Quest379:OnSubStart37902(quest)
    print("37902 start:...")
    actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true, false,1009)
    self:RequestInteraction(wendyData.Wendy)    
end

function Quest379:OnSubStart37903(quest)
    print("37903 start:...")
    -- local quest = actorMgr:GetActor(q379Cfg.ActorAlias)
    -- if quest ~= nil then
    --     quest:FinishQuest(false, nil)
    -- end 
    self:RequestInteraction(wendyData.Wendy)
end

function Quest379:OnSubStart37904(quest)
    print("37904 start:...")
    self:RequestInteraction(qinData.Qin)
end


function Quest379:InvokeOnInteraction(param)
    if param == 3 then
        print("Test!!!!!!!!!!!!!!!!")
        self.uActor:AvatarPaimonAppear()
    elseif param == 4 then
        self.uActor:AvatarPaimonDisappear(nil, true)
    elseif param == 101 then
        print("Now Stop Talking")
        BubbleCtrl_NpcMengdeInsomniaStand[13] = -1
    elseif param == 102 then
        print("Now Start Talking")
        BubbleCtrl_NpcMengdeInsomniaStand[13] = 1
    end
end
--@endregion

--@region sub finish handlers
function Quest379:OnSubFinish37901(quest)
    print("OnFinished 37901")
end

function Quest379:OnSubFinish37902(quest)
    print("OnFinished 37902")
end

function Quest379:OnSubFinish37903(quest)
    print("OnFinished 37903")
end

function Quest379:OnSubFinish37904(quest)
    print("OnFinished 37904")
    self:ActionSafeCall(
        function(self)
            local paimon = actorMgr:GetActor("Paimon")
            if paimon ~= nil then
                paimon:DestroyWithDisappear(false)
            end
        end
    )
    self:ShowBlackScreen(0.5, 1.5, 0.5, self.DestroyNPC, self.TellStory)
end

function Quest379:DestroyNPC(quest)
    self:ActionSafeCall(
        function(self)
            local wendy = actorMgr:GetActor(wendyData.Wendy)
            if wendy ~= nil then
                wendy:Destroy(false)
            end
        end
    )
    self:ActionSafeCall(
        function(self)
            local qin = actorMgr:GetActor(qinData.Qin)
            if qin ~= nil then
                qin:Destroy(false)
            end
        end
    )
    self:ActionSafeCall(
        function(self)
            local diluc = actorMgr:GetActor(dilucData.Diluc)
            if diluc ~= nil then
                diluc:Destroy(false)
            end
        end
    )
end

function Quest379:TellStory(quest)
    self:CallDelay(1.5, self.StartStory)
end

function Quest379:StartStory(quest)
    self:NarratorOnlyTask(q379Cfg.StoryNarrator, nil, "Story")
end

--@endregion

function Quest379:Start()
end

function Quest379:OnDestroy()
end

return Quest379