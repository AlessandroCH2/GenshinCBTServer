require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')
local DailyNpcManager = require('Actor/DailyNPCManager')

local Quest372 = class("Quest372", questActorProxy)

Quest372.defaultAlias = "Quest372"

local q372Cfg = require('Quest/Client/Q372ClientConfig')
local subIDs = q372Cfg.SubIDs
local paimonData = q372Cfg.PaimonData
local wendyData = q372Cfg.WendyData


-- Generated
function Quest372:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["37201"] = self.OnSubStart37201
    self.subStartHandlers["37202"] = self.OnSubStart37202
    self.subStartHandlers["37203"] = self.OnSubStart37203
    self.subStartHandlers["37204"] = self.OnSubStart37204
end

function Quest372:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["37201"] = self.OnSubFinish37201
    self.subFinishHandlers["37202"] = self.OnSubFinish37202
    self.subFinishHandlers["37203"] = self.OnSubFinish37203
    self.subFinishHandlers["37204"] = self.OnSubFinish37204
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers


function Quest372:OnSubStart37201(quest)  
    print("37201 start ")
    self:NotifyTo("MengdeInsomniaStand_10", DailyNpcManager.NpcEventType.HIDESELF, true)
    -- actorMgr:CreateActorWithPos(paimonData.Paimon, paimonData.PaimonScript, paimonData.PaimonID, 0, paimonData.bornPos, paimonData.bornDir, true)
    actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true)   
end

function Quest372:OnSubStart37202(quest)
    print("37202 start:...")
    self:NotifyTo("MengdeInsomniaStand_10", DailyNpcManager.NpcEventType.HIDESELF, true)
    -- self:ActionSafeCall(self.Play372Cutscene)
    -- self:ActionSafeCall(self.RequestWendy)
    local quest = actorMgr:GetActor(q372Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(false, nil)
    end 
end

function Quest372:OnSubStart37203(quest)
    print("37203 start:...")
    self:NotifyTo("MengdeInsomniaStand_10", DailyNpcManager.NpcEventType.HIDESELF, true)
    -- self:ActionSafeCall(self.Play372Cutscene)
    self:ActionSafeCall(self.RequestWendy)
    
end

function Quest372:OnSubStart37204(quest)
    print("37204 start:...")
    self:NotifyTo("MengdeInsomniaStand_10", DailyNpcManager.NpcEventType.HIDESELF, true)
    -- self:ActionSafeCall(self.Play372Cutscene)
end

function Quest372:Play372Cutscene(quest)
    self:PlayCutscene(q372Cfg.PurifyTearCfg, self.On372CutsceneFinish)
end

function Quest372:RequestPaimon(quest)
    self:RequestInteraction(paimonData.Paimon)
end

function Quest372:RequestWendy(quest)
    self:RequestInteraction(wendyData.Wendy)
end

--@endregion

--@region sub finish handlers
function Quest372:OnSubFinish37201(quest)
    print("OnFinished 37201")
end

function Quest372:OnSubFinish37202(quest)
    print("OnFinished 37202")
end

function Quest372:OnSubFinish37203(quest)
    print("OnFinished 37203")
    -- self:ActionSafeCall(self.BlackDoSth) 
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
            local paimon = actorMgr:GetActor("Paimon")
            if paimon ~= nil then
                paimon:DestroyWithDisappear(false)
            end
        end
    )
end

function Quest372:OnSubFinish37204(quest)
    print("OnFinished 37204")
end


function Quest372:BlackDoSth(quest)
    print("OnFinished 37203")
    self:ShowBlackScreen(1.0, 1.0, 1.0, self.DestroyNPC)
end

function Quest372:DestroyNPC(quest)
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
            local paimon = actorMgr:GetActor("Paimon")
            if paimon ~= nil then
                paimon:DestroyWithDisappear(false)
            end
        end
    )
end

function Quest372:InvokeOnInteraction(param)
    if param == 3 then
        print("Now Spawn Tears")
        self:SpawnGadget(70300042, sceneData:GetDummyPoint(3,"Q372Tears").pos, sceneData:GetDummyPoint(3,"Q372Tears").rot, "Tears", 3)
    elseif param == 4 then
        print("Now Destroy Tears")
        self:UnSpawn("Tears") 
    elseif param == 6 then
        local wendy = actorMgr:GetActor(wendyData.Wendy)
        if wendy ~= nil then
            wendy:ClearFollowTask()
            wendy:WalkToTask(wendyData.desPos, Quest372.wendyVanish)
        end    
    end
end

function Quest372:wendyVanish()
    -- self:ShowBlackScreen(0.5, 1.0, 0.5, 
	--     function(self)
            local wendy = actorMgr:GetActor(wendyData.Wendy)
            if wendy ~= nil then
                wendy:SetVisible(false)
            end
    --     end
    -- )
end

--@endregion

function Quest372:Start()
end

function Quest372:OnDestroy()
end

return Quest372