require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest371 = class("Quest371", questActorProxy)

Quest371.defaultAlias = "Quest371"

local q371Cfg = require('Quest/Client/Q371ClientConfig')
local subIDs = q371Cfg.SubIDs
local paimonData = q371Cfg.PaimonData
local wendyData = q371Cfg.WendyData


-- Generated
function Quest371:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["37101"] = self.OnSubStart37101
    self.subStartHandlers["37102"] = self.OnSubStart37102
    self.subStartHandlers["37103"] = self.OnSubStart37103
    self.subStartHandlers["37104"] = self.OnSubStart37104
    self.subStartHandlers["37105"] = self.OnSubStart37105
    self.subStartHandlers["37106"] = self.OnSubStart37106
    self.subStartHandlers["37107"] = self.OnSubStart37107
    self.subStartHandlers["37108"] = self.OnSubStart37108
    self.subStartHandlers["37109"] = self.OnSubStart37109
    self.subStartHandlers["37110"] = self.OnSubStart37110
    self.subStartHandlers["37111"] = self.OnSubStart37111
    self.subStartHandlers["37112"] = self.OnSubStart37112
    self.subStartHandlers["37113"] = self.OnSubStart37113
    self.subStartHandlers["37114"] = self.OnSubStart37114
    self.subStartHandlers["37115"] = self.OnSubStart37115
end

function Quest371:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["37101"] = self.OnSubFinish37101
    self.subFinishHandlers["37102"] = self.OnSubFinish37102
    self.subFinishHandlers["37103"] = self.OnSubFinish37103
    self.subFinishHandlers["37104"] = self.OnSubFinish37104
    self.subFinishHandlers["37105"] = self.OnSubFinish37105
    self.subFinishHandlers["37106"] = self.OnSubFinish37106
    self.subFinishHandlers["37107"] = self.OnSubFinish37107
    self.subFinishHandlers["37108"] = self.OnSubFinish37108
    self.subFinishHandlers["37109"] = self.OnSubFinish37109
    self.subFinishHandlers["37110"] = self.OnSubFinish37110
    self.subFinishHandlers["37111"] = self.OnSubFinish37111
    self.subFinishHandlers["37112"] = self.OnSubFinish37112
    self.subFinishHandlers["37113"] = self.OnSubFinish37113
    self.subFinishHandlers["37114"] = self.OnSubFinish37114
    self.subFinishHandlers["37115"] = self.OnSubFinish37115
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers
function Quest371:PaimonDis()
   local paimon = actorMgr:GetActor(paimonData.Paimon)
    if paimon ~= nil then
        paimon:DestroyWithDisappear(false)
    end
end

function Quest371:PaimonDelay()
    self:CallDelay(0.5, self.PaimonDis)
end

function Quest371:OnSubStart37101(quest)
    --创建使魔派蒙    
    print("37101 start : Create Shimo Paimon")
    -- self.uActor:AvatarPaimonAppear()
end

function Quest371:OnSubStart37102(quest)
    --使魔派蒙切换为NPC
    print("37102 start:...")
    -- self.uActor:AvatarPaimonDisappear(nil, true)
    actorMgr:CreateActorWithPos(paimonData.Paimon, paimonData.PaimonScript, paimonData.PaimonID, 0, paimonData.bornPos, paimonData.bornDir, true)
end

function Quest371:OnSubStart37103(quest)
    print("37103 start:...")
    self:ActionSafeCall(self.PaimonDelay)
    actorMgr:CreateActorWithPos("WendyTrackTrigger", "Actor/Gadget/WendyTrackTrigger", 70900002, 0, sceneData:GetDummyPoint(3,"Q371WendyFootPrint1").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint1").rot, true, false)
end

function Quest371:OnSubStart37104(quest)
    print("37104 start:...")
    actorMgr:CreateActorWithPos(paimonData.Paimon, paimonData.PaimonScript, paimonData.PaimonID, 0, sceneData:GetDummyPoint(3,"Q371WendyFootPrint1").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint1").rot, true, false)
end

function Quest371:OnSubStart37105(quest)
    print("37105 start:...")
    -- self:ActionSafeCall(self.PaimonDelay)
    self:UnSpawn("FootPrint")
    self:SpawnGadget(70300037, sceneData:GetDummyPoint(3,"Q371WendyFootPrint1").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint1").rot, "FootPrint")
    self:SpawnGadget(70300037, sceneData:GetDummyPoint(3,"Q371WendyTrigger1").pos, sceneData:GetDummyPoint(3,"Q371WendyTrigger1").rot, "FootPrint2")
    --add one more footprint here
    actorMgr:CreateActorWithPos("WendyTrackTrigger", "Actor/Gadget/WendyTrackTrigger", 70900002, 0, sceneData:GetDummyPoint(3,"Q371WendyTrigger1").pos, sceneData:GetDummyPoint(3,"Q371WendyTrigger1").rot, true, false)
end

function Quest371:OnSubStart37106(quest)
    print("37106 start:...")
    self:UnSpawn("FootPrint")
    self:SpawnGadget(70300037, sceneData:GetDummyPoint(3,"Q371WendyFootPrint2").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint2").rot, "FootPrint")
    self:SpawnGadget(70300037, sceneData:GetDummyPoint(3,"Q371WendyFootPrint3x1").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint3x1").rot, "FootPrint3")
    --add one more footprint here
    actorMgr:CreateActorWithPos("WendyTrackTrigger", "Actor/Gadget/WendyTrackTrigger", 70900002, 0, sceneData:GetDummyPoint(3,"Q371WendyTrigger2").pos, sceneData:GetDummyPoint(3,"Q371WendyTrigger2").rot, true, false)
end

function Quest371:OnSubStart37107(quest)
    print("37107 start:...")
    self:UnSpawn("FootPrint")
    self:UnSpawn("FootPrint2")
    self:SpawnGadget(70300037, sceneData:GetDummyPoint(3,"Q371WendyFootPrint3").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint3").rot, "FootPrint071")
    actorMgr:CreateActorWithPos("WendyTrackTrigger", "Actor/Gadget/WendyTrackTrigger", 70900002, 0, sceneData:GetDummyPoint(3,"Q371WendyTrigger3").pos, sceneData:GetDummyPoint(3,"Q371WendyTrigger3").rot, true, false)
end

function Quest371:OnSubStart37108(quest)
    -- self:UnSpawn("FootPrint")
    self:UnSpawn("FootPrint3")
    self:SpawnGadget(70300037, sceneData:GetDummyPoint(3,"Q371WendyFootPrint4").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint4").rot, "FootPrint")
    self:SpawnGadget(70300037, sceneData:GetDummyPoint(3,"Q371WendyFootPrint4x1").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint4x1").rot, "FootPrint2")
    self:SpawnGadget(70300037, sceneData:GetDummyPoint(3,"Q371WendyTrigger4").pos, sceneData:GetDummyPoint(3,"Q371WendyTrigger4").rot, "FootPrint3")
    --add 2 more footprint here
    actorMgr:CreateActorWithPos("WendyTrackTrigger", "Actor/Gadget/WendyTrackTrigger", 70900002, 0, sceneData:GetDummyPoint(3,"Q371WendyTrigger4").pos, sceneData:GetDummyPoint(3,"Q371WendyTrigger4").rot, true, false)
end

function Quest371:OnSubStart37109(quest)
    self:UnSpawn("FootPrint")
    self:UnSpawn("FootPrint2")
    self:UnSpawn("FootPrint071")
    self:SpawnGadget(70300037, sceneData:GetDummyPoint(3,"Q371WendyFootPrint5").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint5").rot, "FootPrint")
    self:SpawnGadget(70300037, sceneData:GetDummyPoint(3,"Q371WendyFootPrint5x1").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint5x1").rot, "FootPrint2")
    --add 1 more footprint here
    actorMgr:CreateActorWithPos("WendyTrackTriggersp", "Actor/Gadget/WendyTrackTriggersp", 70900002, 0, sceneData:GetDummyPoint(3,"Q371WendyTrigger5").pos, sceneData:GetDummyPoint(3,"Q371WendyTrigger5").rot, true, false)
end

function Quest371:OnSubStart37110(quest)
    self:UnSpawn("FootPrint")
    self:UnSpawn("FootPrint3")
    self:SpawnGadget(70300037, sceneData:GetDummyPoint(3,"Q371WendyFootPrint6").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint6").rot, "FootPrint")
    actorMgr:CreateActorWithPos("WendyTrackTriggersp1", "Actor/Gadget/WendyTrackTriggersp1", 70900002, 0, sceneData:GetDummyPoint(3,"Q371WendyTrigger6").pos, sceneData:GetDummyPoint(3,"Q371WendyTrigger6").rot, true, false)
end

function Quest371:OnSubStart37111(quest)
    self:UnSpawn("FootPrint")
    self:UnSpawn("FootPrint2")
    self:SpawnGadget(70300037, sceneData:GetDummyPoint(3,"Q371WendyFootPrint7").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint7").rot, "FootPrint")
    self:SpawnGadget(70300037, sceneData:GetDummyPoint(3,"Q371WendyFootPrint7x1").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint7x1").rot, "FootPrint4")

    actorMgr:CreateActorWithPos("WendyTrackTriggersp2", "Actor/Gadget/WendyTrackTriggersp2", 70900002, 0, sceneData:GetDummyPoint(3,"Q371WendyTrigger7").pos, sceneData:GetDummyPoint(3,"Q371WendyTrigger7").rot, true, false)
end

function Quest371:OnSubStart37112(quest)
    self:UnSpawn("FootPrint")
    self:SpawnGadget(70300037, sceneData:GetDummyPoint(3,"Q371WendyFootPrint8").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint8").rot, "FootPrint")
    self:SpawnGadget(70300037, sceneData:GetDummyPoint(3,"Q371WendyFootPrint8x1").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint8x1").rot, "FootPrint2")
    --add 1 more footprint here
    actorMgr:CreateActorWithPos("WendyTrackTriggersp3", "Actor/Gadget/WendyTrackTriggersp3", 70900002, 0, sceneData:GetDummyPoint(3,"Q371WendyTrigger8").pos, sceneData:GetDummyPoint(3,"Q371WendyTrigger8").rot, true, false)
end

function Quest371:OnSubStart37113(quest)
    self:UnSpawn("FootPrint")
    self:UnSpawn("FootPrint4")
    self:SpawnGadget(70300037, sceneData:GetDummyPoint(3,"Q371WendyFootPrint9").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint9").rot, "FootPrint")
    actorMgr:CreateActorWithPos("WendyTrackTriggersp4", "Actor/Gadget/WendyTrackTriggersp4", 70900002, 0, sceneData:GetDummyPoint(3,"Q371WendyTrigger9").pos, sceneData:GetDummyPoint(3,"Q371WendyTrigger9").rot, true, false)
end

function Quest371:OnSubStart37114(quest)
    print("37114 start:...")
    -- actorMgr:CreateActorWithPos("Q371Trigger", "Actor/Gadget/Q371Trigger", 70900002, 0, sceneData:GetDummyPoint(3,"Q371WendyFootPrint5").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint5").rot, true, false)
end

function Quest371:OnSubStart37115(quest)
    print("37115 start:...")
    actorMgr:CreateActorWithPos(paimonData.Paimon, paimonData.PaimonScript, paimonData.PaimonID, 0, sceneData:GetDummyPoint(3,"Q371WendyFootPrint5").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint5").rot, true, false)
	self:CallDelay(1, self.RequestPaimon)
end

function Quest371:RequestPaimon(quest)
    self:RequestInteraction(paimonData.Paimon)
end
--@endregion

--@region sub finish handlers
function Quest371:OnSubFinish37101(quest)
    print("OnFinished 37101")
    local qin = actorMgr:GetActor("Qin")
    if qin ~= nil then
        qin:Destroy(false)
    end  

    local ambor = actorMgr:GetActor("Ambor")
    if ambor ~= nil then
        ambor:Destroy(false)
    end  

    local lisa = actorMgr:GetActor("Lisa")
    if lisa ~= nil then
        lisa:Destroy(false)
    end  
    
    local gaia = actorMgr:GetActor("Gaia")
    if gaia ~= nil then
        gaia:Destroy(false)
    end  
end

function Quest371:OnSubFinish37102(quest)
    print("OnFinished 37102")
    actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.run1Pos, wendyData.run1Dir, true)
    self:CallDelay(1,self.WendyRun)
end

function Quest371:WendyRun()
    local wendy = actorMgr:GetActor(wendyData.Wendy)
    if wendy ~= nil then
        wendy:ClearFollowTask()
        wendy:RunToTask(wendyData.run2Pos,
            function(wendy, task)
                wendy:Destroy(false)
            end
        )
        self:EnterSceneLookCamera(wendyData.cameraPos, 3.5, 3, true)
        print("Rush Wendy ***")
    end
end



function Quest371:OnSubFinish37103(quest)
    print("OnFinished 37103")
end

function Quest371:OnSubFinish37104(quest)
    -- actorMgr:CreateActorWithPos("Q371Trigger", "Actor/Gadget/Q371Trigger", 70900002, 0, sceneData:GetDummyPoint(3,"Q371WendyFootPrint1").pos, sceneData:GetDummyPoint(3,"Q371WendyFootPrint1").rot, true, false)
    self:ActionSafeCall(self.PaimonDis)
    self:ActionSafeCall(self.ShowTutorial)
end

function Quest371:ShowTutorial(quest)
    self:ShowTutorialDialog(112,
    function ()
        globalActor:StartGuide("EnterFocusModeGuidePC") 
    end
)
end

function Quest371:OnSubFinish37105(quest)
end
function Quest371:OnSubFinish37106(quest)
end
function Quest371:OnSubFinish37107(quest)
end
function Quest371:OnSubFinish37108(quest)
end
function Quest371:OnSubFinish37109(quest)
end
function Quest371:OnSubFinish37110(quest)
end
function Quest371:OnSubFinish37111(quest)
end
function Quest371:OnSubFinish37112(quest)
end
function Quest371:OnSubFinish37113(quest)
    --self:UnSpawn("FootPrint")
    self:UnSpawn("FootPrint2")
end

function Quest371:OnSubFinish37114(quest)
end

function Quest371:OnSubFinish37115(quest)
    self:ActionSafeCall(self.PaimonDis)
end

--@endregion

function Quest371:Start()
end

function Quest371:OnDestroy()
end

return Quest371