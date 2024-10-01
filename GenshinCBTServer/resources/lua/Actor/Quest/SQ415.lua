require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest415 = class("Quest415", questActorProxy)

Quest415.defaultAlias = "Quest415"

local q415Cfg = require('Quest/Client/Q415ClientConfig')
local sneakAIData =
{
    q415Cfg.SneakAI1Data,
    q415Cfg.SneakAI2Data,
    q415Cfg.SneakAI3Data,
    q415Cfg.SneakAI4Data,
    q415Cfg.SneakAI5Data,
    q415Cfg.SneakAI6Data,
    q415Cfg.SneakAI7Data,
    q415Cfg.SneakAI8Data,
    q415Cfg.SneakAI9Data,
    q415Cfg.SneakAI10Data,
    q415Cfg.SneakAI11Data,
    q415Cfg.SneakAI12Data,
    q415Cfg.SneakAI13Data,
    q415Cfg.SneakAI14Data,
}
local subIDs = q415Cfg.SubIDs

-- Generated
function Quest415:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
	self.subStartHandlers["41501"] = self.OnSubStart41501
	self.subStartHandlers["41502"] = self.OnSubStart41502
	self.subStartHandlers["41503"] = self.OnSubStart41503
	self.subStartHandlers["41504"] = self.OnSubStart41504
    self.subStartHandlers["41505"] = self.OnSubStart41505
    self.subStartHandlers["41506"] = self.OnSubStart41506
end

function Quest415:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
	self.subFinishHandlers["41501"] = self.OnSubFinish41501
	self.subFinishHandlers["41502"] = self.OnSubFinish41502
	self.subFinishHandlers["41503"] = self.OnSubFinish41503
	self.subFinishHandlers["41504"] = self.OnSubFinish41504
    self.subFinishHandlers["41505"] = self.OnSubFinish41505
    self.subFinishHandlers["41506"] = self.OnSubFinish41506
end

function Quest415:MovePlayer()
    self:TransmitPlayer(0, M.Pos(-4, 0, 4142), M.Euler(0, 0, 0))
    self:ExitSneakMode()
    self:TriggerLevelAbility("Level_Remove_Switch_SneakBtn")
end

function Quest415:SneakAIPrepare()
    for i=1, q415Cfg.SneakAINum do
        local SneakAI = actorMgr:CreateActorWithPos(sneakAIData[i].alias, sneakAIData[i].metaPath, sneakAIData[i].configID, sneakAIData[i].dataIndex, sneakAIData[i].bornPos, sneakAIData[i].bornDir, true, true, 1005)
        SneakAI.PatrolPosNum = sneakAIData[i].PatrolPosNum
        SneakAI.PatrolPos = sneakAIData[i].PatrolPos
        SneakAI.PatrolDir = sneakAIData[i].PatrolDir
        SneakAI.PatrolNext = 1
        -- SneakAI:Start()
        -- SneakAI:ThreatTask(SneakAI.Discover, SneakAI.Aware, SneakAI.ReturnToPatrol)
    end
    for i=1, #q415Cfg.TreasurePos do
        self:SpawnItem(q415Cfg.TreasureID, q415Cfg.TreasurePos[i], nil, "Treasure" .. tostring(i), 1005)
    end
end

function Quest415:SneakAIDestroy()
    for i=1, q415Cfg.SneakAINum do
        local SneakAI = actorMgr:GetActor(sneakAIData[i].alias)
        if SneakAI ~= nil then
            SneakAI:Destroy(false)
        end
    end
    for i=1, #q415Cfg.TreasurePos do
        self:UnSpawn("Treasure" .. tostring(i))
    end
end


--@region sub start handlers
function Quest415:OnSubStart41501(quest)
	-- TODO: Do sth on sub quest 41501 start
end

function Quest415:OnSubStart41502(quest)
    print("41502 start: Spawn npc")   
    actorMgr:CreateActorWithPos(q415Cfg.SneakJudgeData.alias, q415Cfg.SneakJudgeData.metaPath, q415Cfg.SneakJudgeData.configID, 0, q415Cfg.SneakJudgeData.bornPos, q415Cfg.SneakJudgeData.bornDir, true, false, 1005)
    -- self:ActionSafeCall(self.StartCount)   
end

function Quest415:OnSubStart41503(quest)
    print("OnStart41503:SneakStart")
    self:SneakAIDestroy()
    q415Cfg.gotKey = false
    self:SneakAIPrepare()
    self:SpawnItem(q415Cfg.KeyID, q415Cfg.KeyPos, nil, "Harp", 1005)
    self:EnterSneakMode(11)
    self:TriggerLevelAbility("Level_Apply_Switch_SneakBtn")
end

function Quest415:OnSubStart41504(quest)
    print("OnStart41504:SneakFailed")
    self:CallDelay(3,self.SneakAIDestroy)
    self:CallDelay(3,self.MovePlayer)
    self:UnSpawn("Harp") 
end

function Quest415:OnSubStart41505(quest)
    print("41505 start: Success Got Harp")
    self:CallDelay(3,self.SneakAIDestroy)
    self:CallDelay(3,self.MovePlayer)
end

--@endregion

--@region sub finish handlers

function Quest415:OnSubFinish41501(quest)
	-- TODO: Do sth on sub quest 41501 finish
end

function Quest415:OnSubFinish41502(quest)
end

function Quest415:OnSubFinish41503(quest)
	-- TODO: Do sth on sub quest 41503 finish

end

function Quest415:OnSubFinish41504(quest)
	-- TODO: Do sth on sub quest 41504 finish

end

function Quest415:OnSubFinish41505(quest)
	-- TODO: Do sth on sub quest 41505 finish
end


--@endregion

function Quest415:Start()
end

function Quest415:OnDestroy()
end

return Quest415