require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest453 = class("Quest453", questActorProxy)

Quest453.defaultAlias = "Quest453"

local q453Cfg = require('Quest/Client/Q453ClientConfig')
local subIDs = q453Cfg.SubIDs
local paimonData = q453Cfg.PaimonData
local amborData = q453Cfg.AmborData
local farmerOldData = q453Cfg.FarmerOldData
local farmerAngryData = q453Cfg.FarmerAngryData
local farmer2Data = q453Cfg.Farmer2Data
local farmer3Data = q453Cfg.Farmer3Data
local farmerWound1Data = q453Cfg.FarmerWound1Data
local farmerWound2Data = q453Cfg.FarmerWound2Data
local farmerWound3Data = q453Cfg.FarmerWound3Data
local farmerAngry1Data = q453Cfg.FarmerAngry1Data
local farmerAngry2Data = q453Cfg.FarmerAngry2Data
local pawHintData = q453Cfg.PawHintData
local shitHintData = q453Cfg.ShitHintData
local hairHintData = q453Cfg.HairHintData


-- Generated
function Quest453:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["45301"] = self.OnSubStart45301
    self.subStartHandlers["45302"] = self.OnSubStart45302
    self.subStartHandlers["45303"] = self.OnSubStart45303
    self.subStartHandlers["45304"] = self.OnSubStart45304
    self.subStartHandlers["45305"] = self.OnSubStart45305
    self.subStartHandlers["45306"] = self.OnSubStart45306
end

function Quest453:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["45301"] = self.OnSubFinish45301
    self.subFinishHandlers["45302"] = self.OnSubFinish45302
    self.subFinishHandlers["45303"] = self.OnSubFinish45303
    self.subFinishHandlers["45304"] = self.OnSubFinish45304
    self.subFinishHandlers["45305"] = self.OnSubFinish45305
    self.subFinishHandlers["45306"] = self.OnSubFinish45306
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers
function Quest453:PaimonDis()
   local paimon = actorMgr:GetActor(paimonData.Alias)
    if paimon ~= nil then
        paimon:Destroy(false)
    end
end

function Quest453:PaimonDelay()
    self:CallDelay(3, self.PaimonDis)
end

function Quest453:FarmersPrepare()
    local farmerOld = actorMgr:CreateActorWithPos(farmerOldData.Alias, farmerOldData.Script, farmerOldData.ID, 0, farmerOldData.BornPos, farmerOldData.BornDir, true, false)
    farmerOld:DoFreeStyle(311)

    local farmerAngry = actorMgr:CreateActorWithPos(farmerAngryData.Alias, farmerAngryData.Script, farmerAngryData.ID, 0, farmerAngryData.BornPos, farmerAngryData.BornDir, true, false)
    farmerAngry:DoFreeStyle(371)
    
    local farmer2 = actorMgr:CreateActorWithPos(farmer2Data.Alias, farmer2Data.Script, farmer2Data.ID, 0, farmer2Data.BornPos, farmer2Data.BornDir, true, false)
    farmer2:DoFreeStyle(311)
    
    local farmer3 = actorMgr:CreateActorWithPos(farmer3Data.Alias, farmer3Data.Script, farmer3Data.ID, 0, farmer3Data.BornPos, farmer3Data.BornDir, true, false)
    farmer3:DoFreeStyle(311)
    
    local farmerWound1 = actorMgr:CreateActorWithPos(farmerWound1Data.Alias, farmerWound1Data.Script, farmerWound1Data.ID, 0, farmerWound1Data.BornPos, farmerWound1Data.BornDir, true, false)
    farmerWound1:DoFreeStyle(301)

    local farmerWound2 = actorMgr:CreateActorWithPos(farmerWound2Data.Alias, farmerWound2Data.Script, farmerWound2Data.ID, 0, farmerWound2Data.BornPos, farmerWound2Data.BornDir, true, false)
    farmerWound2:DoFreeStyle(301)

    local farmerWound3 = actorMgr:CreateActorWithPos(farmerWound3Data.Alias, farmerWound3Data.Script, farmerWound3Data.ID, 0, farmerWound3Data.BornPos, farmerWound3Data.BornDir, true, false)
    farmerWound3:DoFreeStyle(301)

end

function Quest453:OnSubStart45301(quest)
    actorMgr:CreateActorWithPos(amborData.Alias, amborData.Script, amborData.ID, 0, amborData.BornPos, amborData.BornDir, true, false)
    self:FarmersPrepare()
    -- self.uActor:AvatarPaimonAppear()
end

function Quest453:OnSubStart45302(quest)
    print("45302 start:...")
    self:SpawnItem(pawHintData.ID, pawHintData.BornPos, nil, pawHintData.Alias, 3)
end

function Quest453:OnSubStart45303(quest)
    self:SpawnItem(shitHintData.ID, shitHintData.BornPos, nil, shitHintData.Alias, 3)
end

function Quest453:OnSubStart45304(quest)
    self:SpawnItem(hairHintData.ID, hairHintData.BornPos, nil, hairHintData.Alias, 3)
end

function Quest453:OnSubStart45305(quest)
    local farmerAngry1 = actorMgr:CreateActorWithPos(farmerAngry1Data.Alias, farmerAngry1Data.Script, farmerAngry1Data.ID, 0, farmerAngry1Data.BornPos, farmerAngry1Data.BornDir, true, false)
    farmerAngry1:DoFreeStyle(371)
    local farmerAngry2 = actorMgr:CreateActorWithPos(farmerAngry2Data.Alias, farmerAngry2Data.Script, farmerAngry2Data.ID, 0, farmerAngry2Data.BornPos, farmerAngry2Data.BornDir, true, false)
    farmerAngry2:DoFreeStyle(371)
end

function Quest453:OnSubStart45306(quest)
    self:NarratorOnlyTask(q453Cfg.NarratorFlow1)
end



--@endregion

--@region sub finish handlers
function Quest453:OnSubFinish45301(quest)
end

function Quest453:OnSubFinish45302(quest)
    self:NarratorOnlyTask(q453Cfg.NarratorFlow2)
end

function Quest453:OnSubFinish45303(quest)
    self:NarratorOnlyTask(q453Cfg.NarratorFlow3)
end

function Quest453:OnSubFinish45304(quest)
    self:NarratorOnlyTask(q453Cfg.NarratorFlow4)
end

function Quest453:OnSubFinish45305(quest)
    local farmerAngry1 = actorMgr:GetActor(farmerAngry1Data.Alias)
    if farmerAngry1 ~= nil then
        farmerAngry1:RunToTask(sceneData:GetDummyPoint(3, "Q453FarmerAngeryRun").pos,
            function(farmerAngry1, task)
                farmerAngry1:Destroy(false)
            end
        )
    end
    local farmerAngry2 = actorMgr:GetActor(farmerAngry2Data.Alias)
    if farmerAngry2 ~= nil then
        farmerAngry2:RunToTask(sceneData:GetDummyPoint(3, "Q453FarmerAngeryRun").pos,
            function(farmerAngry2, task)
                farmerAngry2:Destroy(false)
            end
        )
    end
end

function Quest453:OnSubFinish45306(quest)
end



--@endregion

function Quest453:Start()
end

function Quest453:OnDestroy()
end

return Quest453