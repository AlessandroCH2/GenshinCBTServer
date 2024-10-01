require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest383 = class("Quest383", questActorProxy)

Quest383.defaultAlias = "Quest383"

local q383Cfg = require('Quest/Client/Q383ClientConfig')
local wendyData = q383Cfg.WendyData
local dilucData = q383Cfg.DilucData
local qinData = q383Cfg.QinData



-- Generated
function Quest383:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["38301"] = self.OnSubStart38301
    self.subStartHandlers["38302"] = self.OnSubStart38302    
    self.subStartHandlers["38303"] = self.OnSubStart38303    
    self.subStartHandlers["38304"] = self.OnSubStart38304    
end

function Quest383:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["38301"] = self.OnSubFinish38301
    self.subFinishHandlers["38302"] = self.OnSubFinish38302
    self.subFinishHandlers["38303"] = self.OnSubFinish38303
    self.subFinishHandlers["38304"] = self.OnSubFinish38304
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers


function Quest383:OnSubStart38301(quest)  
    print("38301 start ")
 
end

function Quest383:OnSubStart38302(quest)
    print("38302 start:...")
    actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true)  
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true)  
    actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true) 
end

function Quest383:OnSubStart38303(quest)
    print("38303 start:...")
    self:RequestInteraction(wendyData.Wendy)
end

function Quest383:OnSubStart38304(quest)
    print("38304 start:...")
    self:RequestInteraction(qinData.Qin)
end


function Quest383:InvokeOnInteraction(param)
    if param == 3 then
        print("Test!!!!!!!!!!!!!!!!")
        self.uActor:AvatarPaimonAppear()
    elseif param == 4 then
        self.uActor:AvatarPaimonDisappear(nil, true)
    end
end
--@endregion

--@region sub finish handlers
function Quest383:OnSubFinish38301(quest)
    print("OnFinished 38301")
end

function Quest383:OnSubFinish38302(quest)
    print("OnFinished 38302")
end

function Quest383:OnSubFinish38303(quest)
    print("OnFinished 38303")
end

function Quest383:OnSubFinish38304(quest)
    print("OnFinished 38304")
    -- self:ActionSafeCall(
    --     function(self)
    --         local wendy = actorMgr:GetActor(wendyData.Wendy)
    --         if wendy ~= nil then
    --             wendy:Destroy(false)
    --         end
    --         -- actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos2, wendyData.bornDir2, true) 
    --     end
    -- )

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
    --         local diluc = actorMgr:GetActor(dilucData.Diluc)
    --         if diluc ~= nil then
    --             diluc:Destroy(false)
    --         end
    --         -- actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos2, dilucData.bornDir2, true) 
    --     end
    -- )

    -- self:ActionSafeCall(
    --     function(self)
    --         local qin = actorMgr:GetActor(qinData.Qin)
    --         if qin ~= nil then
    --             qin:Destroy(false)
    --         end
    --         -- actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos2, qinData.bornDir2, true) 
    --     end
    -- )
end

--@endregion

function Quest383:Start()
end

function Quest383:OnDestroy()
end

return Quest383