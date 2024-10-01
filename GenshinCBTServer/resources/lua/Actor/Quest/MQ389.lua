require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest389 = class("Quest389", questActorProxy)

Quest389.defaultAlias = "Quest389"

local q389Cfg = require('Quest/Client/Q389ClientConfig')
local wendyData = q389Cfg.WendyData
local qinData = q389Cfg.QinData
local dilucData = q389Cfg.DilucData

-- Generated
function Quest389:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["38901"] = self.OnSubStart38901
    self.subStartHandlers["38902"] = self.OnSubStart38902
    self.subStartHandlers["38903"] = self.OnSubStart38903
    self.subStartHandlers["38904"] = self.OnSubStart38904
    self.subStartHandlers["38905"] = self.OnSubStart38905
    self.subStartHandlers["38906"] = self.OnSubStart38906
end

function Quest389:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["38901"] = self.OnSubFinish38901
    self.subFinishHandlers["38902"] = self.OnSubFinish38902
    self.subFinishHandlers["38903"] = self.OnSubFinish38903
    self.subFinishHandlers["38904"] = self.OnSubFinish38904
    self.subFinishHandlers["38905"] = self.OnSubFinish38905
    self.subFinishHandlers["38906"] = self.OnSubFinish38906
end

-- local param begin
-- local param end

--@region sub start & finish 内调用的函数
function Quest389:DestroyNPC()
    self:ShowBlackScreen(0.5, 1, 0.5,
        function(self)
            local wendy = actorMgr:GetActor(wendyData.Wendy)
            local diluc = actorMgr:GetActor(dilucData.Diluc)
            local qin = actorMgr:GetActor(qinData.Qin)
            local paimon = actorMgr:GetActor("Paimon")

            if wendy ~= nil then
                wendy:Destroy(false)
            end

            if diluc ~= nil then
                diluc:Destroy(false)
            end

            if qin ~= nil then
                qin:Destroy(false)
            end

            if paimon ~= nil then
                paimon:Destroy(false)
            end
        end
    )
end
--@endregion

-- local method begin
--@region sub start handlers
function Quest389:OnSubStart38901(quest)
    print("38901 start:...")
end

function Quest389:OnSubStart38902(quest)
    print("38902 start:...")
end

function Quest389:OnSubStart38903(quest)
    print("38903 start:...")

end

function Quest389:OnSubStart38904(quest)
    print("38904 start:...")
end

function Quest389:OnSubStart38905(quest)
    print("38905 start:...")
end

function Quest389:OnSubStart38906(quest)
    print("38906 start:...")
end
--@endregion

--@region sub finish handlers
function Quest389:OnSubFinish38901(quest)
    print("38901 finish:...")
    self:NarratorOnlyTask(q389Cfg.NarratorData.Story1)
	self:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q389Target1").pos, 0, 3, true) 
end

function Quest389:OnSubFinish38902(quest)
    print("38902 finish:...")
    self:TransmitPlayer(3, wendyData.bornPos1, wendyData.bornDir1, nil, 
        function (self)
            actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos1, wendyData.bornDir1, true)
            actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos1, dilucData.bornDir1, true)
            actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos1, qinData.bornDir1, true)

            self:CallDelay(0.5,
                function (slef)
                self:RequestInteraction(wendyData.Wendy)
                end
            )
        end
    )
end

function Quest389:OnSubFinish38903(quest)
    print("38903 finish:...")
    self:ActionSafeCall(self.DestroyNPC)
    self:ActionSafeCall(
        function (self)
            self:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q389Target3").pos, 0, 0.1, true)
            self:CallDelay(5,
                function (self)
                    self:NarratorOnlyTask(q389Cfg.NarratorData.Story2)
                end
            )
        end
    )    
    -- globalActor:SpawnGadget(70900201, wendyData.bornPos2, wendyData.bornDir2, "Q38903Target", 3)
end

function Quest389:OnSubFinish38904(quest)
    print("38904 finish:...")
    self:NarratorOnlyTask(q389Cfg.NarratorData.Story3)
    self:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q389Target2").pos, 0, 2, true) 
end

function Quest389:OnSubFinish38905(quest)
    print("38905 finish:...")
    -- self:UnSpawn("Q38903Target")
    self:TransmitPlayer(3, wendyData.bornPos2, wendyData.bornDir2, nil, 
        function (self)
            actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos2, wendyData.bornDir2, true)
            actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos2, dilucData.bornDir2, true)
            actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos2, qinData.bornDir2, true)

            self:CallDelay(0.5,
            function (slef)
            self:RequestInteraction(wendyData.Wendy)
            end
            )
        end
    )
end

function Quest389:OnSubFinish38906(quest)
    print("38906 finish:...")
    self:ActionSafeCall(self.DestroyNPC)
end
--@endregion

function Quest389:Start()
end

function Quest389:OnDestroy()
end

return Quest389




