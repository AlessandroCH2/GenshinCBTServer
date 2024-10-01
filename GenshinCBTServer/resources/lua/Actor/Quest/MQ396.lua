require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest396 = class("Quest396", questActorProxy)

Quest396.defaultAlias = "Quest396"

local q396Cfg = require('Quest/Client/Q396ClientConfig')
local wendyData = q396Cfg.WendyData
local bbrData = q396Cfg.BarbaraData
local qinData = q396Cfg.QinData

-- Generated
function Quest396:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["39601"] = self.OnSubStart39601
    self.subStartHandlers["39602"] = self.OnSubStart39602    
    self.subStartHandlers["39603"] = self.OnSubStart39603    
    self.subStartHandlers["39604"] = self.OnSubStart39604    
    self.subStartHandlers["39605"] = self.OnSubStart39605    
    self.subStartHandlers["39606"] = self.OnSubStart39606    
end

function Quest396:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["39601"] = self.OnSubFinish39601
    self.subFinishHandlers["39602"] = self.OnSubFinish39602
    self.subFinishHandlers["39603"] = self.OnSubFinish39603
    self.subFinishHandlers["39604"] = self.OnSubFinish39604
    self.subFinishHandlers["39605"] = self.OnSubFinish39605
    self.subFinishHandlers["39606"] = self.OnSubFinish39606
end

-- local param begin
-- local param end

---sub start & finish 内调用的函数
-- function Quest396:PlayerBackMengde
--     self:TransmitPlayer(0,dummyPoint.pos, dummyPoint.rot)
-- end

-- function Quest396:On39601CutSceneFinish()
--     self:ShowBlackScreen(0.0, 1.0, 0.0)
--     self:TransmitPlayer(3, sceneData:GetDummyPoint(3,"Q39601TransPos").pos, sceneData:GetDummyPoint(3,"Q39601TransPos").rot,
--         function (self)
--             globalActor:ChangeWeather ("ClearSky")
--             actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false, 1008)
--             actorMgr:CreateActorWithPos(bbrData.Barbara, bbrData.BarbaraScript, bbrData.BarbaraID, 0, bbrData.bornPos, bbrData.bornDir, true, false, 1008)
--             actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true, false, 1008)
--         end
--     )

--     local quest = actorMgr:GetActor(q396Cfg.ActorAlias)
--     if quest ~= nil then
--         quest:FinishQuest(false, nil)
--     end
-- end

-- local method begin
--@region sub start handlers

function Quest396:OnSubStart39601(quest)
    print("39601 start ")
    local quest = actorMgr:GetActor(q396Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(false, nil)
    end
    
    -- self:CallDelay(3, 
    --     function (self)
    --         self:ShowBlackScreen(0.5, 1.0, 0.5,
    --         function (self)
    --         self:TryPlayVideo("Cs_MDAQ071_Davalin.mp4", nil, true, self.On39601CutSceneFinish)
    --         end
    --         )
    --     end
    -- )
    -- self:ShowBlackScreen(1.0, 1.0, 1.0, nil, nil)
end

function Quest396:OnSubStart39602(quest)
    print("39602 start:...")
    -- actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false, 1008)
    -- actorMgr:CreateActorWithPos(bbrData.Barbara, bbrData.BarbaraScript, bbrData.BarbaraID, 0, bbrData.bornPos, bbrData.bornDir, true, false, 1008)
    -- actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true, false, 1008)
end

function Quest396:OnSubStart39603(quest)
    print("39603 start:...")
    local quest = actorMgr:GetActor(q396Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(false, nil)
    end 
end

function Quest396:OnSubStart39604(quest)
    print("39604 start:...")
end

function Quest396:OnSubStart39605(quest)
    print("39605 start:...")
end

function Quest396:OnSubStart39606(quest)
    print("39606 start:...")
    actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.born2Pos, wendyData.born2Dir, true)   
end


--@endregion

--@region sub finish handlers
function Quest396:OnSubFinish39601(quest)
    print("OnFinished 39601")
end

function Quest396:OnSubFinish39602(quest)
    print("OnFinished 39602")
    -- self:ActionSafeCall(
    --     function(self)
    --         local bbr = actorMgr:GetActor(bbrData.Barbara)
    --         if bbr ~= nil then
    --             bbr:ClearFollowTask()
    --             bbr:RunToTask(bbrData.disPos,
    --                 function(bbr, task)
    --                     bbr:Destroy(false)
    --                 end
    --             )
    --         end  
    --     end
    -- )
end

function Quest396:OnSubFinish39603(quest)
    -- print("OnFinished 39603")
    -- self:ActionSafeCall(
    --     function(self)
    --         local bbr = actorMgr:GetActor(bbrData.Barbara)
    --         if bbr ~= nil then
    --             bbr:ClearFollowTask()
    --             bbr:WalkToTask(bbrData.disPos,
    --                 function(bbr, task)
    --                     bbr:Destroy(false)
    --                 end
    --             )
    --         end  
    --     end
    -- )
end

function Quest396:OnSubFinish39604(quest)
    print("OnFinished 39604")
    
    self:ActionSafeCall(
        function(self)
            local wendy = actorMgr:GetActor(wendyData.Wendy)
            local paimon = actorMgr:GetActor("Paimon")

            if wendy ~= nil then
                wendy:ClearFollowTask()
                wendy:RunToTask(wendyData.disPos,
                    function(wendy, task)
                        wendy:Destroy(false)
                    end
                )
            end  
        
            if paimon ~= nil then
                paimon:DestroyWithDisappear(false)
            end
        end
    )
end

function Quest396:OnSubFinish39605(quest)
    print("OnFinished 39605")
end

function Quest396:OnSubFinish39606(quest)
    print("OnFinished 39606")
end

function Quest396:InvokeOnInteraction(param)
    if param == 1 then
        print("Talk39602:BBR Disappear")
            local bbr = actorMgr:GetActor(bbrData.Barbara)
            if bbr ~= nil then
                print("BBR Run")
                bbr:ClearFollowTask()
                bbr:RunToTask(bbrData.disPos, Quest396.BBRdisappear)
            end
    end
end

function Quest396:BBRdisappear()
    local bbr = actorMgr:GetActor(bbrData.Barbara)
    if bbr ~= nil then
        bbr:SetVisible(false)
    end
end


--@endregion

function Quest396:Start()
end

function Quest396:OnDestroy()
end

return Quest396