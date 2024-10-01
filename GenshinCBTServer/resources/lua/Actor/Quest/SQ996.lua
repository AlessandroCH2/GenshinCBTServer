require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest996 = class("Quest996", questActorProxy)

Quest996.defaultAlias = "Quest996"

local q996Cfg = require('Quest/Client/Q996ClientConfig')
local subIDs = q996Cfg.SubIDs

local gaiaData = q996Cfg.GaiaData

-- Generated
function Quest996:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["99601"] = self.OnSubStart99601
	self.subStartHandlers["99602"] = self.OnSubStart99602
end

function Quest996:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["99601"] = self.OnSubFinish99601
	self.subFinishHandlers["99602"] = self.OnSubFinish99602
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers

function Quest996:OnSubStart99601(quest)
    print("99601 start:...")
    actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.bornPos, gaiaData.bornDir, true, false,1008)
    self:SpawnGadget(70690001, sceneData:GetDummyPoint(1008,"Q373WendyTemp").pos, sceneData:GetDummyPoint(1008,"Q373WendyTemp").rot, "Acc1", 1008)
end

function Quest996:OnSubStart99602(quest)
    print("99602 start:...")
    local gaia = actorMgr:GetActor(gaiaData.Gaia)
    if gaia ~= nil then
        gaia:Destroy(false)
    end
    self:UnSpawn("Acc1")
end

--@endregion

--@region sub finish handlers
function Quest996:OnSubFinish99601(quest)
    print("OnFinished 99601")
end

function Quest996:OnSubFinish99602(quest)
    print("OnFinished 99602")
end

--@endregion

function Quest996:Start()
end

function Quest996:OnDestroy()
end

return Quest996