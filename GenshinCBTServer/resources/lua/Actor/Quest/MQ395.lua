require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest395 = class("Quest395", questActorProxy)

Quest395.defaultAlias = "Quest395"

local q395Cfg = require('Quest/Client/Q395ClientConfig')

local bbrData = q395Cfg.BarbaraData

-- Generated
function Quest395:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["39501"] = self.OnSubStart39501
    self.subStartHandlers["39502"] = self.OnSubStart39502    
    self.subStartHandlers["39503"] = self.OnSubStart39503    
end

function Quest395:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["39501"] = self.OnSubFinish39501
    self.subFinishHandlers["39502"] = self.OnSubFinish39502
    self.subFinishHandlers["39503"] = self.OnSubFinish39503
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers

function Quest395:OnSubStart39501(quest)  
    print("39501 start")
end

function Quest395:OnSubStart39502(quest)  
    print("39502 start")
    actorMgr:CreateActorWithPos("Q395Trigger", "Actor/Gadget/Q395Trigger", 70900002, 0, bbrData.bornPos, bbrData.bornDir, true)
end

function Quest395:OnSubStart39503(quest)  
    print("39503 start ")
end

--@endregion

--@region sub finish handlers

function Quest395:OnSubFinish39501(quest)
    print("OnFinished 39501")
end

function Quest395:OnSubFinish39502(quest)
    print("OnFinished 39502")
    self:ShowBlackScreen(1.0, 1.0, 0, self.CreateBBR)
 
    local q395Trigger = actorMgr:GetActor("Q395Trigger")
    if q395Trigger ~= nil then
        q395Trigger:Destroy(false)
    end
end

function Quest395:OnSubFinish39503(quest)
    print("OnFinished 39503")
    self:ActionSafeCall(
        function(self)
            local paimon = actorMgr:GetActor("Paimon")
            if paimon ~= nil then
                paimon:DestroyWithDisappear(false)
            end
        end
    )

    -- self:ActionSafeCall(
    --     function(self)
    --         local qin = actorMgr:GetActor("1006")
    --         if qin ~= nil then
    --             qin:DestroyWithDisappear(false)
    --         end
    --     end
    -- )
end


function Quest395:CreateBBR()
    actorMgr:CreateActorWithPos(bbrData.Barbara, bbrData.BarbaraScript, bbrData.BarbaraID, 0, bbrData.bornPos, bbrData.bornDir, true)  
    print("BBR Born")
end

function Quest395:Interaction()
    self:RequestInteraction(bbrData.Barbara)
    print("Black Callback NOW")

end
--@endregion

function Quest395:Start()
end

function Quest395:OnDestroy()
end

return Quest395