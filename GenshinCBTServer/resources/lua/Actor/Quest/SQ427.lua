require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest427 = class("Quest427", questActorProxy)

Quest427.defaultAlias = "Quest427"

q427Cfg = require('Quest/Client/Q427ClientConfig')
local subIDs = q427Cfg.SubIDs
local amborData = q427Cfg.AmborData

-- Generated
function Quest427:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["42701"] = self.OnSubStart42701
    self.subStartHandlers["42702"] = self.OnSubStart42702
    self.subStartHandlers["42703"] = self.OnSubStart42703
    self.subStartHandlers["42704"] = self.OnSubStart42704
    self.subStartHandlers["42705"] = self.OnSubStart42705
end

function Quest427:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["42701"] = self.OnSubFinish42701
    self.subFinishHandlers["42702"] = self.OnSubFinish42702
    self.subFinishHandlers["42703"] = self.OnSubFinish42703
    self.subFinishHandlers["42704"] = self.OnSubFinish42704
    self.subFinishHandlers["42705"] = self.OnSubFinish42705
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers

function Quest427:StartCount()
    -- if FailNum < 2 then
    --     EscapeTime = 50  
    -- else 
    local FlyingTime = 1000 
    -- end
    self:CountDownUIStart(FlyingTime, 10, 3)
    self:CallDelay(FlyingTime+4, self.CountDown)
end

function Quest427:CountDown()
    local quest = actorMgr:GetActor(q427Cfg.ActorAlias)
    if quest ~= nil then
        print("FlyingTest fail")
        quest:FinishQuest(true, nil)
    end
end


function Quest427:OnSubStart42701(quest)
    print("42701 start:...")
    actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.bornPos, amborData.bornDir, true, false)
end

function Quest427:OnSubStart42702(quest)
    print("42702 start:...")
    self:TransmitPlayer(3, sceneData:GetDummyPoint(3,"Q375RunStart").pos, sceneData:GetDummyPoint(3,"Q375RunStart").rot )

    local WindData = self.clientData.WindData
    local RiseDir = {x=0,y=0,z=0}
    globalActor:SpawnGadget(WindData.WindID, WindData.Pos1,M.Dir2Euler(RiseDir),WindData.Wind1)
    globalActor:SpawnGadget(WindData.WindID, WindData.Pos2,M.Dir2Euler(RiseDir),WindData.Wind2)
    globalActor:SpawnGadget(WindData.WindID, WindData.Pos3,M.Dir2Euler(RiseDir),WindData.Wind3)
    globalActor:SpawnGadget(WindData.WindID, WindData.Pos4,M.Dir2Euler(RiseDir),WindData.Wind4)

    q427Cfg.EachGetNum = 0
    q427Cfg.TotalGetNum = 0
    q427Cfg.NowBatchNum = 1
    actorMgr:CreateActorWithPos("Q427FlyCoins" .. tostring(1), "Actor/Gadget/Q427FlyCoins", 70300064, 0, q427Cfg.FlyCoins[1][1].pos, q427Cfg.FlyCoins[1][1].rot, true, false)
    actorMgr:CreateActorWithPos("Q427FlyCoins" .. tostring(2), "Actor/Gadget/Q427FlyCoins", 70300064, 0, q427Cfg.FlyCoins[1][2].pos, q427Cfg.FlyCoins[1][2].rot, true, false)
    actorMgr:CreateActorWithPos("Q427FlyCoins" .. tostring(3), "Actor/Gadget/Q427FlyCoins", 70300064, 0, q427Cfg.FlyCoins[1][3].pos, q427Cfg.FlyCoins[1][3].rot, true, false)

    self:ActionSafeCall(self.StartCount)

    for i=1, #q427Cfg.Flyline1-2 do
        local AccDir = { x = q427Cfg.Flyline1[i+1].x-q427Cfg.Flyline1[i].x, y = q427Cfg.Flyline1[i+1].y-q427Cfg.Flyline1[i].y, z = q427Cfg.Flyline1[i+1].z-q427Cfg.Flyline1[i].z }  
        self:SpawnGadget(70690001, q427Cfg.Flyline1[i], M.Dir2Euler(AccDir), "Acc5" .. tostring(i))
    end

    -- for i=1, #q427Cfg.Flyline2-1 do
    --     local AccDir = { x = q427Cfg.Flyline2[i+1].x-q427Cfg.Flyline2[i].x, y = q427Cfg.Flyline2[i+1].y-q427Cfg.Flyline2[i].y, z = q427Cfg.Flyline2[i+1].z-q427Cfg.Flyline2[i].z }  
    --     self:SpawnGadget(70690001, q427Cfg.Flyline2[i], M.Dir2Euler(AccDir), "Acc6" .. tostring(i))
    -- end

end

function Quest427:OnSubStart42703(quest)
    print("42703 start:...")
    self:CountDownUITerminate()
    self:UnCallFunc(self.CountDown)

    for i=1, q427Cfg.MAXCoinsNum do
        local coin = actorMgr:GetActor("Q427FlyCoins" .. tostring(i))
        if coin ~= nil then
            coin:DestroySelf()
        end
    end
    self:AdvanceQuest()
end

function Quest427:AdvanceQuest()
    local quest = actorMgr:GetActor(q427Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(false, nil)
    end 
end

function Quest427:OnSubStart42704(quest)
    print("42704 start:...")
    actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.bornPos2, amborData.bornDir2, true, false)
end

function Quest427:OnSubStart42705(quest)
    print("42705 start:...")
    self:TransmitPlayer(3, sceneData:GetDummyPoint(3,"Knight_Roof").pos, sceneData:GetDummyPoint(3,"Knight_Roof").rot )
    local WindData = self.clientData.WindData
    local RiseDir = {x=0,y=0,z=0}
    globalActor:SpawnGadget(WindData.WindID, WindData.Pos5,M.Dir2Euler(RiseDir),WindData.Wind5)
    globalActor:SpawnGadget(WindData.WindID, WindData.Pos6,M.Dir2Euler(RiseDir),WindData.Wind6)
    globalActor:SpawnGadget(WindData.WindID, WindData.Pos7,M.Dir2Euler(RiseDir),WindData.Wind7)
    globalActor:SpawnGadget(WindData.WindID, WindData.Pos8,M.Dir2Euler(RiseDir),WindData.Wind8)

    q427Cfg.EachGetNum2 = 0
    q427Cfg.TotalGetNum2 = 0
    q427Cfg.NowBatchNum2 = 1
    actorMgr:CreateActorWithPos("Q427FlyCoins2" .. tostring(1), "Actor/Gadget/Q427FlyCoins2", 70300064, 0, q427Cfg.FlyCoins2[1][1].pos, q427Cfg.FlyCoins2[1][1].rot, true, false)
    actorMgr:CreateActorWithPos("Q427FlyCoins2" .. tostring(2), "Actor/Gadget/Q427FlyCoins2", 70300064, 0, q427Cfg.FlyCoins2[1][2].pos, q427Cfg.FlyCoins2[1][2].rot, true, false)
    actorMgr:CreateActorWithPos("Q427FlyCoins2" .. tostring(3), "Actor/Gadget/Q427FlyCoins2", 70300064, 0, q427Cfg.FlyCoins2[1][3].pos, q427Cfg.FlyCoins2[1][3].rot, true, false)

    self:ActionSafeCall(self.StartCount)

    for i=1, #q427Cfg.Flyline3-2 do
        local AccDir = { x = q427Cfg.Flyline3[i+1].x-q427Cfg.Flyline3[i].x, y = q427Cfg.Flyline3[i+1].y-q427Cfg.Flyline3[i].y, z = q427Cfg.Flyline3[i+1].z-q427Cfg.Flyline3[i].z }  
        self:SpawnGadget(70690001, q427Cfg.Flyline3[i], M.Dir2Euler(AccDir), "Acc5" .. tostring(i))
    end

end

--@endregion

--@region sub finish handlers
function Quest427:OnSubFinish42701(quest)
    print("OnFinished 42701")
end

function Quest427:OnSubFinish42702(quest)
    print("OnFinished 42702")
    self:CountDownUITerminate()
    for i=1, #q427Cfg.Flyline2-1 do
        local AccDir = { x = q427Cfg.Flyline2[i+1].x-q427Cfg.Flyline2[i].x, y = q427Cfg.Flyline2[i+1].y-q427Cfg.Flyline2[i].y, z = q427Cfg.Flyline2[i+1].z-q427Cfg.Flyline2[i].z }  
        self:SpawnGadget(70690001, q427Cfg.Flyline2[i], M.Dir2Euler(AccDir), "Acc6" .. tostring(i))
    end
end

function Quest427:OnSubFinish42703(quest)
    print("OnFinished 42703")
end

function Quest427:OnSubFinish42704(quest)
    print("OnFinished 42704")
end

function Quest427:OnSubFinish42705(quest)
    print("OnFinished 42705")
    globalActor:SpawnGadget(70900201, sceneData:GetDummyPoint(3,"Q427inMark").pos, sceneData:GetDummyPoint(3,"Q427inMark").rot , "Goal1", 3)
end

--@endregion

function Quest427:Start()
end

function Quest427:OnDestroy()
end

return Quest427