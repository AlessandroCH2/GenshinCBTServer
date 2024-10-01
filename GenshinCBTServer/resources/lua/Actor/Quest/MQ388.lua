require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest388 = class("Quest388", questActorProxy)

Quest388.defaultAlias = "Quest388"

local q388Cfg = require('Quest/Client/Q388ClientConfig')
local wendyData = q388Cfg.WendyData
local qinData = q388Cfg.QinData
local dilucData = q388Cfg.DilucData

-- Generated
function Quest388:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["38801"] = self.OnSubStart38801
    self.subStartHandlers["38802"] = self.OnSubStart38802    
    self.subStartHandlers["38803"] = self.OnSubStart38803    
    self.subStartHandlers["38804"] = self.OnSubStart38804  
    self.subStartHandlers["38805"] = self.OnSubStart38805  
    self.subStartHandlers["38806"] = self.OnSubStart38806          
end

function Quest388:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["38801"] = self.OnSubFinish38801
    self.subFinishHandlers["38802"] = self.OnSubFinish38802
    self.subFinishHandlers["38803"] = self.OnSubFinish38803
    self.subFinishHandlers["38804"] = self.OnSubFinish38804
    self.subFinishHandlers["38805"] = self.OnSubFinish38805
    self.subFinishHandlers["38806"] = self.OnSubFinish38806
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers

function Quest388:Narrator38802()
    self:NarratorOnlyTask(self.clientData.NarratorData.Story1,nil,"Story")
end

function Quest388:NPCdis38802()
    local qin = actorMgr:GetActor(qinData.Qin)
    local diluc = actorMgr:GetActor(dilucData.Diluc)
    local wendy = actorMgr:GetActor(wendyData.Wendy)
    local paimon = actorMgr:GetActor("Paimon")
    
    if qin ~= nil then
        qin:Destroy(false)
    end

    if diluc ~= nil then
        diluc:Destroy(false)
    end

    if wendy ~= nil then
        wendy:Destroy(false)
    end

    if paimon ~= nil then
        paimon:Destroy(false)
    end
end

function Quest388:OnSubStart38801(quest)  
    print("38801 start:...")
end

function Quest388:OnSubStart38802(quest)
    print("38802 start: BlackScreen & Destroy NPC & Narrator")
    self:ActionSafeCall(
    
    function(self)
        self:TransmitPlayer(3, sceneData:GetDummyPoint(3,"Q38802Player").pos, sceneData:GetDummyPoint(3,"Q38802Player").rot, self.Narrator38802,self.NPCdis38802)    
    end    
    )
end

function Quest388:OnSubStart38803(quest)
    print("38803 start:...")
    self:TransmitPlayer(3, sceneData:GetDummyPoint(3,"Q38802Player").pos, sceneData:GetDummyPoint(3,"Q38802Player").rot, nil, 
        function (self)
            actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.born2Pos, wendyData.born2Dir, true)  
            actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.born2Pos, dilucData.born2Dir, true)  
            actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.born2Pos, qinData.born2Dir, true)

            self:CallDelay(1,
                function (slef)
                self:RequestInteraction(wendyData.Wendy)
                end
            )
        end
    )
end

function Quest388:OnSubStart38804(quest)
    print("38804 start:...")
    self:ActionSafeCall(
    function (slef)
        self:RequestInteraction(wendyData.Wendy)
    end
    )
end

function Quest388:OnSubStart38805(quest)
    print("38804 start:...")
    local quest = actorMgr:GetActor(q388Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(false, nil)
    end
end

function Quest388:OnSubStart38806(quest)
    print("38806 start:...")
end


--@endregion

--@region sub finish handlers
function Quest388:OnSubFinish38801(quest)
    print("38801 finish:...")
end


function Quest388:OnSubFinish38802(quest)
    print("38802 finish: CreatNPC")
    -- self:TransmitPlayer(3, sceneData:GetDummyPoint(3,"Q38802Player").pos, sceneData:GetDummyPoint(3,"Q38802Player").rot, nil, 
    --     function (self)
    --         actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.born2Pos, wendyData.born2Dir, true)  
    --         actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.born2Pos, dilucData.born2Dir, true)  
    --         actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.born2Pos, qinData.born2Dir, true)

    --         self:CallDelay(1,
    --             function (slef)
    --             self:RequestInteraction(wendyData.Wendy)
    --             end
    --         )
    --     end
    -- )
end

function Quest388:OnSubFinish38803(quest)
    print("OnFinished 38803")
end

function Quest388:OnSubFinish38804(quest)
    print("OnFinished 38804")
    self:ActionSafeCall(
        function (self)
            local paimon = actorMgr:GetActor("Paimon")
    --         local wendy = actorMgr:GetActor(wendyData.Wendy)
    --         local diluc = actorMgr:GetActor(dilucData.Diluc)
    --         local qin = actorMgr:GetActor(qinData.Qin)

            if paimon ~= nil then
                paimon:DestroyWithDisappear(false)
            end

    --         if wendy ~= nil then
    --             wendy:ClearFollowTask()
    --             wendy:RunToTask(wendyData.dis1Pos,
    --                 function(wendy, task)
    --                     wendy:Destroy(false)
    --                 end
    --             )
    --         end  

    --         if diluc ~= nil then
    --             diluc:ClearFollowTask()
    --             diluc:RunToTask(dilucData.dis1Pos,
    --                 function(diluc, task)
    --                     diluc:Destroy(false)
    --                 end
    --             )
    --         end  

    --         if qin ~= nil then
    --             qin:ClearFollowTask()
    --             qin:RunToTask(qinData.dis1Pos,
    --                 function(qin, task)
    --                     qin:Destroy(false)
    --                 end
    --             )
    --         end  
        end
    )

    -- self:ActionSafeCall(
    --     self:ShowBlackScreen(0.5, 1, 0.5,
    --     function(self)
    --         local wendy = actorMgr:GetActor(wendyData.Wendy)
    --         local diluc = actorMgr:GetActor(dilucData.Diluc)
    --         local qin = actorMgr:GetActor(qinData.Qin)
    --         local paimon = actorMgr:GetActor("Paimon")

    --         if wendy ~= nil then
    --             wendy:Destroy(false)
    --         end

    --         if diluc ~= nil then
    --             diluc:Destroy(false)
    --         end

    --         if qin ~= nil then
    --             qin:Destroy(false)
    --         end

    --         if paimon ~= nil then
    --             paimon:Destroy(false)
    --         end
    --     end
    --     )
    -- )
end

function Quest388:OnSubFinish38805(quest)
    print("OnFinished 38805")
end

function Quest388:OnSubFinish38806(quest)
    print("OnFinished 38806:Creat NPC")
    self:TransmitPlayer(3, sceneData:GetDummyPoint(3,"Q38804Player").pos, sceneData:GetDummyPoint(3,"Q38804Player").rot, nil, 
        function (self)
            actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.born2Pos, wendyData.born2Dir, true)  
            actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.born2Pos, dilucData.born2Dir, true)  
            actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.born2Pos, qinData.born2Dir, true)

            self:CallDelay(1,
                function (slef)
                self:RequestInteraction(wendyData.Wendy)
                end
            )
        end
    )
end

function Quest388:InvokeOnInteraction(param)
    if param == 1 then
        print("Talk38801:Finishi Quest 38801")
        local quest = actorMgr:GetActor(q388Cfg.ActorAlias)
        if quest ~= nil then
            quest:FinishQuest(false, nil)
        end
    elseif param == 2 then
        print("Talk38803:Finishi Quest 38803")
        local quest = actorMgr:GetActor(q388Cfg.ActorAlias)
        if quest ~= nil then
            self:CallDelay(5.5,
            function (self)
                quest:FinishQuest(false, nil)
            end
            )
        end
    elseif param == 3 then
        print("Talk38803 Finish2:NPC walk & dis")
        local quest = actorMgr:GetActor(q388Cfg.ActorAlias)
        local wendy = actorMgr:GetActor(wendyData.Wendy)
        local diluc = actorMgr:GetActor(dilucData.Diluc)
        local qin = actorMgr:GetActor(qinData.Qin)

        if qin ~= nil then
            qin:WalkTo(qinData.dis1Pos)
            self:CallDelay(2.0,
            function (self)
                qin:Destroy(false)
            end
            )
        end

        if wendy ~= nil then
            wendy:WalkTo(wendyData.dis1Pos)
            self:CallDelay(2.0,
            function (self)
                wendy:Destroy(false)
            end
            )
        end

        if diluc ~= nil then
            diluc:WalkTo(dilucData.dis1Pos)
            self:CallDelay(2.0,
            function (self)
                diluc:Destroy(false)
            end
            )
        end

        if quest ~= nil then
            quest:FinishQuest(false, nil)
        end
    end
end
--@endregion

function Quest388:Start()
end

function Quest388:OnDestroy()
end

return Quest388




