require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest370 = class("Quest370", questActorProxy)

Quest370.defaultAlias = "Quest370"

local q370Cfg = require('Quest/Client/Q370ClientConfig')
local subIDs = q370Cfg.SubIDs
local qinData = q370Cfg.QinData
local lisaData = q370Cfg.LisaData
local amborData = q370Cfg.AmborData
local gaiaData = q370Cfg.GaiaData
local paimonData = q370Cfg.PaimonData

-- Generated
function Quest370:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["37001"] = self.OnSubStart37001
    self.subStartHandlers["37002"] = self.OnSubStart37002
    self.subStartHandlers["37003"] = self.OnSubStart37003
end

function Quest370:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["37001"] = self.OnSubFinish37001
	self.subFinishHandlers["37002"] = self.OnSubFinish37002
	self.subFinishHandlers["37003"] = self.OnSubFinish37003
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers

function Quest370:OnSubStart37001(quest)
    print("37001 start:...")
    self:ActionSafeCall(
        function(self)
            actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.bornPos, amborData.bornDir, true, false,1004,true,100402)
            actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true, false,1004,true,100402)
            actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.bornPos, gaiaData.bornDir, true, false,1004,true,100402)
            actorMgr:CreateActorWithPos(lisaData.Lisa, lisaData.LisaScript, lisaData.LisaID, 0, lisaData.bornPos, lisaData.bornDir, true, false,1004,true,100402)
            -- actorMgr:CreateActorWithPos(paimonData.Paimon, paimonData.PaimonScript, paimonData.PaimonID, 0, paimonData.bornPos, paimonData.bornDir, true, false,1004,true,100402)
        end
    )
end

function Quest370:OnSubStart37002(quest)
    print("37002 start:...")
    -- TODO: Do sth on sub quest 37002 start
end

function Quest370:OnSubStart37003(quest)
    print("37003 start:...")
    -- TODO: Do sth on sub quest 37002 start
end

--@endregion

--@region sub finish handlers
function Quest370:OnSubFinish37001(quest)
    print("OnFinished 37001")
end

function Quest370:OnSubFinish37002(quest)
    print("OnFinished 37002")
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
    --         self.uActor:AvatarPaimonAppear()
    --     end
    -- )
end

function Quest370:OnSubFinish37003(quest)
    print("OnFinished 37003")
    self:RequestInteraction(qinData.Qin)
end


function Quest370:InvokeOnInteraction(param)
    if param == 3 then
        print("Now Spawn Tears")
        self:SpawnGadget(70300059, sceneData:GetDummyPoint(1004,"Q370Tears").pos, sceneData:GetDummyPoint(1004,"Q370Tears").rot, "Tears", 1004)
    elseif param == 5 then
        print("Now Destroy Tears")
        self:UnSpawn("Tears")    
    end
end

--@endregion

function Quest370:Start()
end

function Quest370:OnDestroy()
end

return Quest370