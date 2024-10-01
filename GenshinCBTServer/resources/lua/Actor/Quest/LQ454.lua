require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest454 = class("Quest454", questActorProxy)

Quest454.defaultAlias = "Quest454"

local q454Cfg = require('Quest/Client/Q454ClientConfig')
local subIDs = q454Cfg.SubIDs
local paimonData = q454Cfg.PaimonData
local amborData = q454Cfg.AmborData
local razorData = q454Cfg.RazorData
local wolfWoundData = q454Cfg.WolfWoundData
local wolfBossData = q454Cfg.WolfBossData
local farmer1Data = q454Cfg.Farmer1Data
local farmer2Data = q454Cfg.Farmer2Data
local herbData = q454Cfg.HerbData



-- Generated
function Quest454:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["45401"] = self.OnSubStart45401
    self.subStartHandlers["45402"] = self.OnSubStart45402
    self.subStartHandlers["45403"] = self.OnSubStart45403
    self.subStartHandlers["45404"] = self.OnSubStart45404
    self.subStartHandlers["45405"] = self.OnSubStart45405
    self.subStartHandlers["45406"] = self.OnSubStart45406
end

function Quest454:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["45401"] = self.OnSubFinish45401
    self.subFinishHandlers["45402"] = self.OnSubFinish45402
    self.subFinishHandlers["45403"] = self.OnSubFinish45403
    self.subFinishHandlers["45404"] = self.OnSubFinish45404
    self.subFinishHandlers["45405"] = self.OnSubFinish45405
    self.subFinishHandlers["45406"] = self.OnSubFinish45406
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers
function Quest454:PaimonDis()
   local paimon = actorMgr:GetActor(paimonData.Alias)
    if paimon ~= nil then
        paimon:Destroy(false)
    end
end

function Quest454:PaimonDelay()
    self:CallDelay(3, self.PaimonDis)
end

function Quest454:OnSubStart45401(quest)
    actorMgr:CreateActorWithPos(razorData.Alias, razorData.Script, razorData.ID, 0, razorData.BornPos, razorData.BornDir, true, false)
    actorMgr:CreateActorWithPos(wolfWoundData.Alias, wolfWoundData.Script, wolfWoundData.ID, 0, wolfWoundData.BornPos, wolfWoundData.BornDir, true, false)
    self:ActionSafeCall(
        function(self)
            actorMgr:CreateActorWithPos(amborData.Alias, amborData.Script, amborData.ID, 0, amborData.BornPos, amborData.BornDir, true, false)
        end
    )
    -- self.uActor:AvatarPaimonAppear()
end

function Quest454:OnSubStart45402(quest)
    print("45402 start:...")
    self:SpawnItem(herbData.ID, herbData.BornPos, nil, herbData.Alias, 3)
end

function Quest454:OnSubStart45403(quest)
    local farmer1 = actorMgr:CreateActorWithPos(farmer1Data.Alias, farmer1Data.Script, farmer1Data.ID, 0, farmer1Data.BornPos, farmer1Data.BornDir, true, false)
    farmer1:RunToTask(farmer1Data.TalkPos,
        function(farmer1, task)
            farmer1:Standby()
            farmer1:DoFreeStyle(371)
        end
    )
    local farmer2 = actorMgr:CreateActorWithPos(farmer2Data.Alias, farmer2Data.Script, farmer2Data.ID, 0, farmer2Data.BornPos, farmer2Data.BornDir, true, false)
    farmer2:RunToTask(farmer2Data.TalkPos,
    function(farmer2, task)
        farmer2:Standby()
        farmer2:DoFreeStyle(371)
    end
    )
end

function Quest454:OnSubStart45404(quest)
end

function Quest454:OnSubStart45405(quest)
    self:SpawnMonster(21010101, 1, wolfBossData.BornPos, nil, nil, nil, "WolfBoss")
end

function Quest454:OnSubStart45406(quest)
    actorMgr:CreateActorWithPos(wolfBossData.Alias, wolfBossData.Script, wolfBossData.ID, 0, wolfBossData.BornPos, wolfBossData.BornDir, true, false)
end



--@endregion

--@region sub finish handlers
function Quest454:OnSubFinish45401(quest)
end

function Quest454:OnSubFinish45402(quest)
end

function Quest454:OnSubFinish45403(quest)
    local farmer1 = actorMgr:GetActor(farmer1Data.Alias)
    if farmer1 ~= nil then
        farmer1:RunToTask(farmer1Data.BornPos,
            function(farmer1, task)
                farmer1:Destroy(false)
            end
        )
    end
    local farmer2 = actorMgr:GetActor(farmer2Data.Alias)
    if farmer2 ~= nil then
        farmer2:RunToTask(farmer2Data.BornPos,
            function(farmer2, task)
                farmer2:Destroy(false)
            end
        )
    end
end

function Quest454:OnSubFinish45404(quest)
end

function Quest454:OnSubFinish45405(quest)
end

function Quest454:OnSubFinish45406(quest)
    local wolfBoss = actorMgr:GetActor(wolfBossData.Alias)
    if wolfBoss ~= nil then
        self:ActionSafeCall(
            function(self)
                wolfBoss:Destroy(false)
            end
        )
    end
    local razor = actorMgr:GetActor(razorData.Alias)
    if razor ~= nil then
        self:ActionSafeCall(
            function(self)
                razor:Destroy(false)
            end
        )
    end
    local ambor = actorMgr:GetActor(amborData.Alias)
    if ambor ~= nil then
        self:ActionSafeCall(
            function(self)
                ambor:Destroy(false)
            end
        )
    end
end



--@endregion

function Quest454:Start()
end

function Quest454:OnDestroy()
end

return Quest454