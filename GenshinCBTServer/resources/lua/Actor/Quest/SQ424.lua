require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest424 = class("Quest424", questActorProxy)

Quest424.defaultAlias = "Quest424"

local q424Cfg = require('Quest/Client/Q424ClientConfig')
local sneakAIData =
{
    q424Cfg.SneakAI1Data,
    q424Cfg.SneakAI2Data,
    q424Cfg.SneakAI3Data,
    q424Cfg.SneakAI4Data,
    q424Cfg.SneakAI5Data,
    q424Cfg.SneakAI6Data,
    q424Cfg.SneakAI7Data,
    q424Cfg.SneakAI8Data,
    q424Cfg.SneakAI9Data,
    q424Cfg.SneakAI10Data,
}
local redDoorData =
{
    q424Cfg.RedDoor1Data,
    q424Cfg.RedDoor2Data,
    q424Cfg.RedDoor3Data,
}
local blackDoorData =
{
    q424Cfg.BlackDoor1Data,
    q424Cfg.BlackDoor2Data,
}

local subIDs = q424Cfg.SubIDs

-- Generated
function Quest424:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
	self.subStartHandlers["42401"] = self.OnSubStart42401
	self.subStartHandlers["42402"] = self.OnSubStart42402
	self.subStartHandlers["42403"] = self.OnSubStart42403
	self.subStartHandlers["42404"] = self.OnSubStart42404
    self.subStartHandlers["42405"] = self.OnSubStart42405
    self.subStartHandlers["42406"] = self.OnSubStart42406
    self.subStartHandlers["42407"] = self.OnSubStart42407
end

function Quest424:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
	self.subFinishHandlers["42401"] = self.OnSubFinish42401
	self.subFinishHandlers["42402"] = self.OnSubFinish42402
	self.subFinishHandlers["42403"] = self.OnSubFinish42403
	self.subFinishHandlers["42404"] = self.OnSubFinish42404
    self.subFinishHandlers["42405"] = self.OnSubFinish42405
    self.subFinishHandlers["42406"] = self.OnSubFinish42406
    self.subFinishHandlers["42407"] = self.OnSubFinish42407
end

function Quest424:MovePlayer()
    self:TransmitPlayer(0, M.Pos(0, 0, 5), M.Euler(0, 0, 0))
    self:ExitSneakMode()
    self:TriggerLevelAbility("Level_Remove_Switch_SneakBtn")
end
function Quest424:TreasurePrepare()
    for i = 1, #q424Cfg.TreasurePos do
        actorMgr:CreateActorWithPos("SneakTreasure" .. tostring(i), "Actor/Gadget/SneakTreasure", 70300003, 0, q424Cfg.TreasurePos[i], q424Cfg.TreasureDir, true, false, 1013)
    end
end

function Quest424:TreasureDestroy()
    for i = 1, #q424Cfg.TreasurePos do
        local sneakTreasure = actorMgr:GetActor("SneakTreasure" .. tostring(i))
        if sneakTreasure ~= nil then
            sneakTreasure:DestroySelf()
        end    
    end
end

function Quest424:SneakAIPrepare()
    for i=1, q424Cfg.SneakAINum do
        local SneakAI = actorMgr:CreateActorWithPos(sneakAIData[i].alias, sneakAIData[i].metaPath, sneakAIData[i].configID, sneakAIData[i].dataIndex, sneakAIData[i].bornPos, sneakAIData[i].bornDir, true, true, 1013)
        SneakAI.PatrolPosNum = sneakAIData[i].PatrolPosNum
        SneakAI.PatrolPos = sneakAIData[i].PatrolPos
        SneakAI.PatrolDir = sneakAIData[i].PatrolDir
        SneakAI.PatrolNext = 1
    end
end

function Quest424:SneakAIDestroy()
    for i=1, q424Cfg.SneakAINum do
        local SneakAI = actorMgr:GetActor(sneakAIData[i].alias)
        if SneakAI ~= nil then
            SneakAI:Destroy(false)
        end
    end
end

function Quest424:DoorPrepare()
    for i=1, q424Cfg.RedDoorNum do
        actorMgr:CreateActorWithPos(redDoorData[i].alias, redDoorData[i].metaPath, redDoorData[i].configID, redDoorData[i].dataIndex, redDoorData[i].bornPos, redDoorData[i].bornDir, true, true, 1013)
    end
    for i=1, q424Cfg.BlackDoorNum do
        actorMgr:CreateActorWithPos(blackDoorData[i].alias, blackDoorData[i].metaPath, blackDoorData[i].configID, blackDoorData[i].dataIndex, blackDoorData[i].bornPos, blackDoorData[i].bornDir, true, true, 1013)
    end
end

function Quest424:DoorDestroy()
    for i=1, q424Cfg.RedDoorNum do
        local RedDoor = actorMgr:GetActor(redDoorData[i].alias)
        if RedDoor ~= nil then
            RedDoor:Destroy(false)
        end
    end
    for i=1, q424Cfg.BlackDoorNum do
        local BlackDoor = actorMgr:GetActor(blackDoorData[i].alias)
        if BlackDoor ~= nil then
            BlackDoor:Destroy(false)
        end
    end
end

function Quest424:ItemPrepare()
    self:SpawnItem(q424Cfg.KeyID, q424Cfg.KeyPos, nil, "Harp", 1013)
    self:SpawnItem(q424Cfg.RedKeyID, q424Cfg.RedKeyPos, nil, "RedKey", 1013)
    self:SpawnItem(q424Cfg.BlackKeyID, q424Cfg.BlackKeyPos, nil, "BlackKey", 1013)
end

function Quest424:ItemDestroy()
    self:UnSpawn("Harp") 
    self:UnSpawn("RedKey") 
    self:UnSpawn("BlackKey") 
    self:UnSpawn("SoldierRedKey") 
end

function Quest424:GetScore()
    if q424Cfg.Score < 50 then
        q424Cfg.Rank = "C"
    elseif q424Cfg.Score < 90 then
        q424Cfg.Rank = "B"
    elseif q424Cfg.Score < 120 then
        q424Cfg.Rank = "A"
    elseif q424Cfg.Score < 150 then
        q424Cfg.Rank = "S"
    elseif q424Cfg.Score < 180 then
        q424Cfg.Rank = "SS"
    elseif q424Cfg.Score == 180 then
        q424Cfg.Rank = "SSS"
    end
    self:ShowMessage("通关评分：" .. q424Cfg.Rank)
end

function Quest424:GetTreasure()
    q424Cfg.Score = q424Cfg.Score + 10
    self:CountNumUIUpdate(q424Cfg.Score)
end

--@region sub start handlers
function Quest424:OnSubStart42401(quest)
	-- TODO: Do sth on sub quest 42401 start
end

function Quest424:OnSubStart42402(quest)
    print("42402 start: Spawn npc")   
    actorMgr:CreateActorWithPos(q424Cfg.SneakJudgeData.alias, q424Cfg.SneakJudgeData.metaPath, q424Cfg.SneakJudgeData.configID, 0, q424Cfg.SneakJudgeData.bornPos, q424Cfg.SneakJudgeData.bornDir, true, false, 1013)
end

function Quest424:OnSubStart42403(quest)
    print("OnStart42403:SneakStart")
    q424Cfg.Score = 100
    self:SneakAIDestroy()
    self:SneakAIPrepare()
    self:DoorDestroy()
    self:DoorPrepare()
    self:ItemDestroy()
    self:ItemPrepare()
    self:TreasureDestroy()
    self:TreasurePrepare()
    self:CountNumUIStart()
    self:CountNumUIUpdate(q424Cfg.Score)
    self:EnterSneakMode(11)
    self:TriggerLevelAbility("Level_Apply_Switch_SneakBtn")
    self:ShowMessage("GameStart")
end

function Quest424:OnSubStart42404(quest)
    print("OnStart42404:SneakFailed")
    self:ItemDestroy()
    self:DoorDestroy()
    self:TreasureDestroy()
    self:CallDelay(3,self.CountNumUITerminate)
    self:CallDelay(3,self.SneakAIDestroy)
    self:CallDelay(3,self.MovePlayer)
    
    self:CallDelay(4,
        function(self)
            self:FinishQuest(false)
        end
    )
    -- local quest = actorMgr:GetActor(q424Cfg.ActorAlias)
    -- if quest ~= nil then
    --     print("Sneak Failed")
    --     quest:FinishQuestID(true, 42404)            
    -- end
end

function Quest424:OnSubStart42405(quest)
    print("42405 start: Success Got Harp")
    self:GetScore()
    self:CallDelay(3,self.CountNumUITerminate)
    self:CallDelay(3,self.SneakAIDestroy)
    self:CallDelay(3,self.MovePlayer)
    self:CallDelay(5,self.GetScore)
    self:CallDelay(7,self.GetScore)
end

--@endregion

--@region sub finish handlers

function Quest424:OnSubFinish42401(quest)
	-- TODO: Do sth on sub quest 42401 finish
end

function Quest424:OnSubFinish42402(quest)
end

function Quest424:OnSubFinish42403(quest)
	-- TODO: Do sth on sub quest 42403 finish

end

function Quest424:OnSubFinish42404(quest)
	-- TODO: Do sth on sub quest 42404 finish

end

function Quest424:OnSubFinish42405(quest)
	-- TODO: Do sth on sub quest 42405 finish
end

function Quest424:InvokeOnInteraction(param)
    print("*****INVOKE**********" .. param .."*********")
    if param < 2000 then
        local tempIndex = param - 1000
        local soldierIndex = math.modf(tempIndex/10)
        local assultIndex = math.fmod(tempIndex,10)
        local sneakAI = actorMgr:GetActor(sneakAIData[soldierIndex].alias)
        if sneakAI ~= nil then
            if assultIndex == 1 then
                print("*****Soldier*****" .. soldierIndex .. "*****ASSULT")
                sneakAI:DoFreeStyle(4)
                if soldierIndex == 10 then
                    local redKeyPos = sneakAI:GetPos()
                    self:SpawnItem(q424Cfg.RedKeyID, redKeyPos, nil, "SoldierRedKey", 1013)
                end
            elseif assultIndex == 2 then
                print("*****Soldier*****" .. soldierIndex .. "*****STUN")
                sneakAI:Stun()
            elseif assultIndex == 3 then
                print("*****Soldier*****" .. soldierIndex .. "*****KILL")
                self:ActionSafeCall(
                    function(self)
                        sneakAI:Destroy(false)
                        q424Cfg.Score = q424Cfg.Score - 10
                        self:CountNumUIUpdate(q424Cfg.Score)
                    end
                )
            end
        end
        
    elseif param >2000 then
        local tempIndex = param - 2000
        local colorIndex = math.modf(tempIndex/10)
        local doorIndex = math.fmod(tempIndex,10)
        if colorIndex == 1 then
            local redDoor = actorMgr:GetActor(redDoorData[doorIndex].alias)
            if redDoor ~= nil then
                self:ActionSafeCall(
                    function(self)
                        redDoor:Destroy(false)
                    end
                )
            end
        elseif colorIndex == 2 then
            local blackDoor = actorMgr:GetActor(blackDoorData[doorIndex].alias)
            if blackDoor ~= nil then
                self:ActionSafeCall(
                    function(self)
                        blackDoor:Destroy(false)
                    end
                )
            end
        end
    end
end


--@endregion

function Quest424:Start()
end

function Quest424:OnDestroy()
end

return Quest424