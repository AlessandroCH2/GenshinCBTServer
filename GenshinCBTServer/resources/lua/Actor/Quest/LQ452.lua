require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest452 = class("Quest452", questActorProxy)

Quest452.defaultAlias = "Quest452"

local q452Cfg = require('Quest/Client/Q452ClientConfig')
local subIDs = q452Cfg.SubIDs
local paimonData = q452Cfg.PaimonData
local amborData = q452Cfg.AmborData
local farmerData = q452Cfg.FarmerData


-- Generated
function Quest452:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["45201"] = self.OnSubStart45201
    self.subStartHandlers["45202"] = self.OnSubStart45202
    self.subStartHandlers["45203"] = self.OnSubStart45203
    self.subStartHandlers["45204"] = self.OnSubStart45204
    self.subStartHandlers["45205"] = self.OnSubStart45205
end

function Quest452:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["45201"] = self.OnSubFinish45201
    self.subFinishHandlers["45202"] = self.OnSubFinish45202
    self.subFinishHandlers["45203"] = self.OnSubFinish45203
    self.subFinishHandlers["45204"] = self.OnSubFinish45204
    self.subFinishHandlers["45205"] = self.OnSubFinish45205
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers
function Quest452:PaimonDis()
   local paimon = actorMgr:GetActor(paimonData.Alias)
    if paimon ~= nil then
        paimon:Destroy(false)
    end
end

function Quest452:PaimonDelay()
    self:CallDelay(3, self.PaimonDis)
end

function Quest452:AmborToFight(quest)
    actorMgr:CreateActorWithPos(amborData.Alias, amborData.Script, amborData.ID, 0, amborData.FightPos, amborData.FightDir, true, false)
end

function Quest452:OnSubStart45201(quest)
    actorMgr:CreateActorWithPos(amborData.Alias, amborData.Script, amborData.ID, 0, amborData.BornPos, amborData.BornDir, true, false)
end

function Quest452:OnSubStart45202(quest)
    print("45202 start:...")
    self:ActionSafeCall(self.AmborToFight)
end

function Quest452:OnSubStart45203(quest)
    actorMgr:CreateActorWithPos(farmerData.Alias, farmerData.Script, farmerData.ID, 0, farmerData.BornPos, farmerData.BornDir, true, false)
    self:EnterSceneLookCamera(farmerData.BornPos, 2, 3, true)
end

function Quest452:OnSubStart45204(quest)
end

function Quest452:OnSubStart45205(quest)
end



--@endregion

--@region sub finish handlers
function Quest452:OnSubFinish45201(quest)
end

function Quest452:OnSubFinish45202(quest)
end

function Quest452:OnSubFinish45203(quest)
end

function Quest452:OnSubFinish45204(quest)
    local ambor = actorMgr:GetActor(amborData.Alias)
    if ambor ~= nil then
        ambor:Destroy(false)
    end
end

function Quest452:OnSubFinish45205(quest)
end


--@endregion

function Quest452:Start()
end

function Quest452:OnDestroy()
end

return Quest452