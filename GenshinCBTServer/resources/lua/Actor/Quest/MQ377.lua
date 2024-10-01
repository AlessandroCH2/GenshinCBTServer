require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest377 = class("Quest377", questActorProxy)

Quest377.defaultAlias = "Quest377"

local q377Cfg = require('Quest/Client/Q377ClientConfig')
local wendyData = q377Cfg.WendyData
local dilucData = q377Cfg.DilucData
local qinData = q377Cfg.QinData



-- Generated
function Quest377:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["37701"] = self.OnSubStart37701
    self.subStartHandlers["37702"] = self.OnSubStart37702  
    self.subStartHandlers["37703"] = self.OnSubStart37703 
    self.subStartHandlers["37704"] = self.OnSubStart37704   
    self.subStartHandlers["37705"] = self.OnSubStart37705      
end

function Quest377:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["37701"] = self.OnSubFinish37701
    self.subFinishHandlers["37702"] = self.OnSubFinish37702
    self.subFinishHandlers["37703"] = self.OnSubFinish37703
    self.subFinishHandlers["37704"] = self.OnSubFinish37704
    self.subFinishHandlers["37705"] = self.OnSubFinish37705
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers

function Quest377:OnSubStart37701(quest)
    print("37701 start:...")    
end

function Quest377:OnSubStart37702(quest)  
    print("37702 start ")
    actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false,1009)    
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true, false,1009) 
    self:ActionSafeCall(    
        function(self)  
            local qin = actorMgr:GetActor(qinData.Qin)
            if qin ~= nil then
                qin:ClearFollowTask()
                qin:WalkToTask(qinData.desPos,
                    function(qin, task)
                        qin:Destroy(false)
                    end
                )
            end  
        end
    )
end

function Quest377:OnSubStart37703(quest)
    print("37703 start:...")
    self:ActionSafeCall(    
        function(self)  
            local qin = actorMgr:GetActor(qinData.Qin)
            if qin ~= nil then
                qin:ClearFollowTask()
                qin:WalkToTask(qinData.desPos,
                    function(qin, task)
                        qin:Destroy(false)
                    end
                )
            end  
        end
    )
end

function Quest377:OnSubStart37704(quest)
    print("37704 start:...")
    local q377Trigger = actorMgr:CreateActorWithPos("Q377Trigger", "Actor/Gadget/Q377Trigger", 70900002, 0, dilucData.bornPos, dilucData.bornDir, true, false,1009)
end

function Quest377:OnSubStart37705(quest)
    print("37705 start:...")    
end


--@endregion

--@region sub finish handlers
function Quest377:OnSubFinish37701(quest)
    print("OnFinished 37701")
end

function Quest377:OnSubFinish37702(quest)
    print("OnFinished 37702")
end

function Quest377:OnSubFinish37703(quest)
    print("OnFinished 37703")
end

function Quest377:OnSubFinish37704(quest)
    print("OnFinished 37704")
    self:ShowBlackScreen(0.5, 1.0, 0.5, 
	    function(self)
            actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true, false,1009)    
	    end, self.Interaction
    )
    -- self:CallDelay(3.5,self.Interaction)

    local q377Trigger = actorMgr:GetActor("Q377Trigger")
    if q377Trigger ~= nil then
        q377Trigger:Destroy(false)
    end

end


function Quest377:OnSubFinish37705(quest)
    print("OnFinished 37705")
    self:ActionSafeCall(
        function(self)
            local paimon = actorMgr:GetActor("Paimon")
            if paimon ~= nil then
                paimon:DestroyWithDisappear(false)
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
end

function Quest377:InvokeOnInteraction(param)
    if param == 3 then
        print("Now Qin Leave")
        local qin = actorMgr:GetActor(qinData.Qin)
        if qin ~= nil then
            qin:ClearFollowTask()
            qin:WalkToTask(qinData.desPos, Quest377.QinVanish)
        end  
    elseif param == 101 then
        print("Now Stop Talking")
        BubbleCtrl_NpcMengdeInsomniaStand[13] = -1
    elseif param == 102 then
        print("Now Start Talking")
        BubbleCtrl_NpcMengdeInsomniaStand[13] = 1
    end
end


function Quest377:Interaction()
    self:RequestInteraction(dilucData.Diluc)
end

function Quest377:QinVanish()
    self:ShowBlackScreen(0.5, 1.0, 0.5, 
	    function(self)
            local qin = actorMgr:GetActor(qinData.Qin)
            if qin ~= nil then
                qin:SetVisible(false)
            end
        end
    )
end

--@endregion

function Quest377:Start()
end

function Quest377:OnDestroy()
end

return Quest377