require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest466 = class("Quest466", questActorProxy)

Quest466.defaultAlias = "Quest466"

local q466Cfg = require('Quest/Client/Q466ClientConfig')
local dilucData = q466Cfg.DilucData
local hoffmanData = q466Cfg.HoffmanData
local kaeyaData = q466Cfg.KaeyaData
local lureData = q466Cfg.LureData
local baitData = q466Cfg.BaitData
local guardData = q466Cfg.GuardData
local FailNum = 0
local EscapeTime = 50


-- Generated
function Quest466:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["46601"] = self.OnSubStart46601
    self.subStartHandlers["46602"] = self.OnSubStart46602
    self.subStartHandlers["46603"] = self.OnSubStart46603
    self.subStartHandlers["46604"] = self.OnSubStart46604
    self.subStartHandlers["46605"] = self.OnSubStart46605
    self.subStartHandlers["46606"] = self.OnSubStart46606
    self.subStartHandlers["46607"] = self.OnSubStart46607
    self.subStartHandlers["46608"] = self.OnSubStart46608
    self.subStartHandlers["46609"] = self.OnSubStart46609
    self.subStartHandlers["46610"] = self.OnSubStart46610
    self.subStartHandlers["46611"] = self.OnSubStart46611
    --self.subStartHandlers["46612"] = self.OnSubStart46612
    self.subStartHandlers["46613"] = self.OnSubStart46613
    --self.subStartHandlers["46614"] = self.OnSubStart46614
    self.subStartHandlers["46615"] = self.OnSubStart46615
    self.subStartHandlers["46616"] = self.OnSubStart46616
    self.subStartHandlers["46617"] = self.OnSubStart46617
    self.subStartHandlers["46618"] = self.OnSubStart46618
    self.subStartHandlers["46619"] = self.OnSubStart46619
    self.subStartHandlers["46620"] = self.OnSubStart46620
    self.subStartHandlers["46621"] = self.OnSubStart46621
    self.subStartHandlers["46622"] = self.OnSubStart46622
end

function Quest466:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["46601"] = self.OnSubFinish46601
    self.subFinishHandlers["46602"] = self.OnSubFinish46602
    self.subFinishHandlers["46603"] = self.OnSubFinish46603
    self.subFinishHandlers["46604"] = self.OnSubFinish46604
    self.subFinishHandlers["46605"] = self.OnSubFinish46605
    self.subFinishHandlers["46606"] = self.OnSubFinish46606
    self.subFinishHandlers["46607"] = self.OnSubFinish46607
    self.subFinishHandlers["46608"] = self.OnSubFinish46608
    self.subFinishHandlers["46609"] = self.OnSubFinish46609
    self.subFinishHandlers["46610"] = self.OnSubFinish46610
    self.subFinishHandlers["46611"] = self.OnSubFinish46611
    --self.subFinishHandlers["46612"] = self.OnSubFinish46612
    self.subFinishHandlers["46613"] = self.OnSubFinish46613
    --self.subFinishHandlers["46614"] = self.OnSubFinish46614
    self.subFinishHandlers["46615"] = self.OnSubFinish46615
    self.subFinishHandlers["46616"] = self.OnSubFinish46616
    self.subFinishHandlers["46617"] = self.OnSubFinish46617
    self.subFinishHandlers["46618"] = self.OnSubFinish46618
    self.subFinishHandlers["46619"] = self.OnSubFinish46619
    self.subFinishHandlers["46620"] = self.OnSubFinish46620
    self.subFinishHandlers["46621"] = self.OnSubFinish46621
    self.subFinishHandlers["46622"] = self.OnSubFinish46622
end

-- local method begin
-- local method end

--@region sub start & finish handlers
function Quest466:OnSubStart46601(quest)
    print("46601 Start: Creat NPC")
    self:NarratorOnlyTask(self.clientData.NarratorData.Story1)
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.Pos1, dilucData.Dir1, true)    
end

function Quest466:OnSubFinish46601(quest)
    print("46601 Finish: Creat NPC")
    self:NarratorOnlyTask(self.clientData.NarratorData.Story1)
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.Pos1, dilucData.Dir1, true)    
end

function Quest466:OnSubFinish46602(quest)
    print("46602 Finish: Hide NPC")
    self:ActionSafeCall(self.Finish46602Do)
end
function Quest466:Finish46602Do(quest)
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.hiddenPos, dilucData.hiddenDir, true)
end

function Quest466:OnSubFinish46603(quest)
    print("46603 Finish: Creat NPC")
    self:ActionSafeCall(self.Finish46603Do)
end
function Quest466:Finish46603Do(quest)
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.Pos2, dilucData.Dir2, true)    
    globalActor:SpawnItem(lureData.LureID, lureData.Pos1,nil,"Lure")
end

function Quest466:OnSubFinish46604(quest)
    print("46604 Finish: Creat NPC")
    globalActor:SpawnGadget(baitData.BaitID, baitData.Pos1, baitData.Dir1, "Bait")
end

function Quest466:OnSubFinish46605(quest)
    print("46605 Finish: Creat Monster")
    self:ActionSafeCall(self.Finish46605Do)
end
function Quest466:Finish46605Do(quest)
    globalActor:UnSpawn("Bait")
--[[     self:SpawnMonster(20010101, 1, sceneData:GetDummyPoint(3,"Q466Monster1").pos)
    self:SpawnMonster(20010101, 1, sceneData:GetDummyPoint(3,"Q466Monster1").pos)
    self:SpawnMonster(20010201, 1, sceneData:GetDummyPoint(3,"Q466Monster2").pos)
    self:SpawnMonster(20010901, 1, sceneData:GetDummyPoint(3,"Q466Monster3").pos) ]]
end

function Quest466:OnSubStart46601(quest)
    print("46608 Start: clear bait")
    globalActor:UnSpawn("Bait")
    globalActor:UnSpawn("Lure")
end

function Quest466:OnSubFinish46608(quest)
    print("46608 Finish: Creat NPC & Trigger1")
    self:NarratorOnlyTask(self.clientData.NarratorData.Story2)
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.Pos3, dilucData.Dir3, true, false, 1009)    
    actorMgr:CreateActorWithPos(hoffmanData.Hoffman, hoffmanData.HoffmanScript, hoffmanData.HoffmanID, 0, hoffmanData.Pos1, hoffmanData.Dir1, true, false, 1009)
    --creat trigger1&3
    actorMgr:CreateActorWithPos("Q466Trigger1", "Actor/Gadget/Q466Trigger1", 70900002, 0, sceneData:GetDummyPoint(3,"Q466Trigger1").pos, sceneData:GetDummyPoint(3,"Q466Trigger1").rot, true, false)
    actorMgr:CreateActorWithPos("Q466Trigger3", "Actor/Gadget/Q466Trigger3", 70900002, 0, sceneData:GetDummyPoint(3,"Q466Trigger1").pos, sceneData:GetDummyPoint(3,"Q466Trigger1").rot, true, false)
end

function Quest466:OnSubFinish46610(quest)
    print("46610 Finish: Creat Lure")
    globalActor:SpawnItem(lureData.LureID, lureData.Pos2,nil,"Lure")
end

function Quest466:OnSubStart46611(quest)
    self:ActionSafeCall(self.StartCount)
end
function Quest466:StartCount()
    if FailNum < 2 then
        EscapeTime = 50  
    else 
        EscapeTime = 60 
    end
    self:CountDownUIStart(EscapeTime, 10, 3)
    self:CallDelay(EscapeTime+4,self.CountDown)
end
function Quest466:CountDown()
    print("CountDown Finished")
    if q466Cfg.EscapeFlag == false then
        FailNum = FailNum + 1
        print("escape fail time is ",FailNum )
        if FailNum < 3 then
            local quest = actorMgr:GetActor(q466Cfg.ActorAlias)
            if quest ~= nil then
                print("escape fail")
                quest:FinishQuest(true, nil)
            end
        else
            local quest = actorMgr:GetActor(q466Cfg.ActorAlias)
            if quest ~= nil then
                print("escape fail omg")
                quest:FinishQuest(true, nil)
            end
        end
    end
end

function Quest466:OnSubStart46619(quest)
    print("46619 start:...")
    self:CountDownUITerminate()
    self:UnCallFunc(self.CountDown)
    self:AdvanceQuest()
end
function Quest466:AdvanceQuest()
    local quest = actorMgr:GetActor(q466Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(false, nil)
    end 
end

function Quest466:OnSubFinish46620(quest)
    print("46620 Finish: Story")
    self:NarratorOnlyTask(self.clientData.NarratorData.Story7)
end

function Quest466:OnSubFinish46611(quest)
    print("46611 Finish: Creat NPC")
    self:NarratorOnlyTask(self.clientData.NarratorData.Story3)
    globalActor:SpawnGadget(baitData.BaitID, baitData.Pos2, baitData.Dir2, "Bait")
    --
    print("46611 Finish: Creat Lure")
    globalActor:UnSpawn("Bait")
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.Pos3, dilucData.Dir3, true, false, 1009)    
    actorMgr:CreateActorWithPos(hoffmanData.Hoffman, hoffmanData.HoffmanScript, hoffmanData.HoffmanID, 0, hoffmanData.Pos1, hoffmanData.Dir1, true, false, 1009)
    actorMgr:CreateActorWithPos(guardData.Guard, guardData.GuardScript, guardData.GuardID, 0, guardData.Pos1, guardData.Dir1, true, false, 1009)    
    globalActor:UnSpawn("Slime1")
    globalActor:UnSpawn("Slime2")
    globalActor:UnSpawn("Slime3")
    globalActor:UnSpawn("Slime4")
    --
    self:CountDownUITerminate()
    self:UnCallFunc(self.CountDown)
    --
    self:SpawnMonster(20010101, 1, sceneData:GetDummyPoint(3,"Q466Slime").pos,nil,nil,nil,"Slime1")
    self:SpawnMonster(20010101, 1, sceneData:GetDummyPoint(3,"Q466Slime").pos,nil,nil,nil,"Slime2")
    self:SpawnMonster(20010201, 1, sceneData:GetDummyPoint(3,"Q466Slime").pos,nil,nil,nil,"Slime3")
    self:SpawnMonster(20010901, 1, sceneData:GetDummyPoint(3,"Q466Slime").pos,nil,nil,nil,"Slime4")
	self:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q466Slime").pos, 3, 3, true)
	globalActor:StopLocalAvatar()	
	globalActor:EnablePlayerInput(false)	
	self:CallDelay(3, self.OnEnableInput)
end
function Quest466:OnEnableInput()
	print("466 Finish: Enable Player Input")	
    globalActor:EnablePlayerInput(true)
    self:TransmitPlayer(3, sceneData:GetDummyPoint(3,"Q466Player1").pos, sceneData:GetDummyPoint(3,"Q466Player1").dir, nil, 
    function (self)
        self:CallDelay(0.5,
            function (self)
                self:RequestInteraction(dilucData.Diluc)
            end
        )
    end
)
end

--[[ function Quest466:OnSubFinish46612(quest)
    print("46612 Finish: Creat Lure")
    globalActor:UnSpawn("Bait")
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.Pos3, dilucData.Dir3, true, false, 1009)    
    actorMgr:CreateActorWithPos(hoffmanData.Hoffman, hoffmanData.HoffmanScript, hoffmanData.HoffmanID, 0, hoffmanData.Pos1, hoffmanData.Dir1, true, false, 1009)
    actorMgr:CreateActorWithPos(guardData.Guard, guardData.GuardScript, guardData.GuardID, 0, guardData.Pos1, guardData.Dir1, true, false, 1009)    
    globalActor:UnSpawn("Slime1")
    globalActor:UnSpawn("Slime2")
    globalActor:UnSpawn("Slime3")
    globalActor:UnSpawn("Slime4")
end ]]

function Quest466:OnSubFinish46613(quest)
    print("46613 Finish: Creat Trigger2")
    --creat trigger2&4
    globalActor:UnSpawn("Q466Trigger1")
    globalActor:UnSpawn("Q466Trigger3")
    actorMgr:CreateActorWithPos("Q466Trigger2", "Actor/Gadget/Q466Trigger2", 70900002, 0, sceneData:GetDummyPoint(3,"Q466Trigger2").pos, sceneData:GetDummyPoint(3,"Q466Trigger2").rot, true, false)
    actorMgr:CreateActorWithPos("Q466Trigger4", "Actor/Gadget/Q466Trigger4", 70900002, 0, sceneData:GetDummyPoint(3,"Q466Trigger2").pos, sceneData:GetDummyPoint(3,"Q466Trigger2").rot, true, false)
    --
    --self:NarratorOnlyTask(self.clientData.NarratorData.Story4)
    --self:SpawnMonster(22010201, 1, sceneData:GetDummyPoint(3,"Q466Monster4").pos)
    local guard = actorMgr:GetActor(guardData.Guard)
    if guard ~= nil then
        self:ActionSafeCall(
            function(self)
                guard:Destroy(false)
            end
        )
    end
end

--[[ function Quest466:OnSubFinish46614(quest)
    print("46614 Finish: Creat Monster")
    self:NarratorOnlyTask(self.clientData.NarratorData.Story4)
    --self:SpawnMonster(22010201, 1, sceneData:GetDummyPoint(3,"Q466Monster4").pos)
    local guard = actorMgr:GetActor(guardData.Guard)
    if guard ~= nil then
        self:ActionSafeCall(
            function(self)
                guard:Destroy(false)
            end
        )
    end
end ]]

function Quest466:OnSubFinish46615(quest)
    print("46615 Finish: Creat NPC")
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.Pos4, dilucData.Dir4, true)    
end

function Quest466:OnSubFinish46616(quest)
    print("46616 Finish: Creat NPC")
    self:NarratorOnlyTask(self.clientData.NarratorData.Story5)
    self:ActionSafeCall(self.Finish46616Do)
end
function Quest466:Finish46616Do(quest)
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.hiddenPos, dilucData.hiddenDir, true)
end


function Quest466:OnSubFinish46617(quest)
    print("46617 Finish: Creat NPC")
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.Pos3, dilucData.Dir3, true, false, 1009)    
    actorMgr:CreateActorWithPos(hoffmanData.Hoffman, hoffmanData.HoffmanScript, hoffmanData.HoffmanID, 0, hoffmanData.Pos1, hoffmanData.Dir1, true, false, 1009)
end

function Quest466:OnSubFinish46618(quest)
    print("46618 Finish: Hide NPC")
    self:ActionSafeCall(self.Finish46618Do)
end
function Quest466:Finish46618Do(quest)
    globalActor:UnSpawn("Q466Trigger2")
    globalActor:UnSpawn("Q466Trigger4")
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.hiddenPos, dilucData.hiddenDir, true)
    actorMgr:CreateActorWithPos(hoffmanData.Hoffman, hoffmanData.HoffmanScript, hoffmanData.HoffmanID, 0, hoffmanData.hiddenPos, hoffmanData.hiddenDir, true)
end
--@endregion

function Quest466:Start()
end

function Quest466:OnDestroy()
end

return Quest466