require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest462 = class("Quest462", questActorProxy)

Quest462.defaultAlias = "Quest462"

local q462Cfg = require('Quest/Client/Q462ClientConfig')
local PaimonData=q462Cfg.PaimonData
local KaeyaData = q462Cfg.KaeyaData
local TreasureData = q462Cfg.TreasureData
local NPCData=q462Cfg.NPCData
--local KaeyaNPC = actorMgr:GetActor(NPCData.Npc)
--local NPCData=Quest462.clientData.NPCData

---sub start & finish 内调用的函数
function Quest462:PaimonVanish()
	--self:ShowTutorialDialog(113)
	local paimon = actorMgr:GetActor(PaimonData.Alias)
	paimon:AirModeOff()
	--paimon:VanishKeep()
	if paimon ~= nil then
		paimon:DestroyWithDisappear(false)
	end
end


-- Generated
function Quest462:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
	self.subStartHandlers["46201"] = self.OnSubStart46201
    self.subStartHandlers["46202"] = self.OnSubStart46202
    self.subStartHandlers["46203"] = self.OnSubStart46203
    self.subStartHandlers["46204"] = self.OnSubStart46204
    self.subStartHandlers["46205"] = self.OnSubStart46205
    self.subStartHandlers["46206"] = self.OnSubStart46206
    self.subStartHandlers["46207"] = self.OnSubStart46207
    self.subStartHandlers["46208"] = self.OnSubStart46208
    self.subStartHandlers["46209"] = self.OnSubStart46209
    self.subStartHandlers["46210"] = self.OnSubStart46210
end

function Quest462:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
	self.subFinishHandlers["46201"] = self.OnSubFinish46201
    self.subFinishHandlers["46202"] = self.OnSubFinish46202
    self.subFinishHandlers["46203"] = self.OnSubFinish46203
    self.subFinishHandlers["46204"] = self.OnSubFinish46204
    self.subFinishHandlers["46205"] = self.OnSubFinish46205
    self.subFinishHandlers["46206"] = self.OnSubFinish46206
    self.subFinishHandlers["46207"] = self.OnSubFinish46207
    self.subFinishHandlers["46208"] = self.OnSubFinish46208
    self.subFinishHandlers["46209"] = self.OnSubFinish46209
    self.subFinishHandlers["46210"] = self.OnSubFinish46210
end



--@region sub start & finish handlers
---按流程触发顺序

function Quest462:OnSubStart46201(quest)
    print("46201 Start : Creat Kaeya")
    actorMgr:CreateActorWithPos(NPCData.Npc, NPCData.NPCScript, NPCData.NpcID, 0, NPCData.NPCBornPos, NPCData.NPCBornDir, true, false,3)
end


function Quest462:OnSubStart46202(quest)
    print("46202 Start : ")
    actorMgr:CreateActorWithPos(NPCData.Npc, NPCData.NPCScript, NPCData.NpcID, 0, NPCData.NPCBornPos, NPCData.NPCBornDir, true, false,3)
    local KaeyaNPC = actorMgr:GetActor(NPCData.Npc)
    --KaeyaNPC:AddPriorityInter(InterTimingType.BTN, q462Cfg.InterData.NoReplyInter)  
    --KaeyaNPC:TriggerNpcSpeechBubble(NPCData.Npc,NPCData.bubble)
    KaeyaNPC:EnableInteraction(false)
	KaeyaNPC:RunToRouteTask(q462Cfg.RoutePoints,
	function(actor, task)
		actor:ClearFollowTask()
        --actor:ClearPriorityInter(InterTimingType.BTN)
        actor:EnableInteraction(true)
        actor:Standby()
        KaeyaNPC:ClearNpcSpeechBubble(NPCData.Npc)
        actor:DoFreeStyle(1070)
		--actor:TurnTo(M.Euler2DirXZ(NPCData.NPCToDir))
	end
    )
    self:CallDelay(0,self.SceneLookCamera)
    self:CallDelay(2,self.PaimonNarrator)
    self:CallDelay(4,self.PlayerInputOn)
    --self:EnterSceneLookCamera(NPCData.cameraPos, 2, 3, true)    
end

function Quest462:SceneLookCamera(quest)
    print("PaimonNarrator Start : ")
    self:EnablePlayerInput(false)
    self:EnterSceneLookCamera(NPCData.cameraPos, 1, 3, true)
    --self:NarratorOnlyTask(q462Cfg.NarratorData.Story4)
    --self:EnablePlayerInput(true)
end

function Quest462:PaimonNarrator(quest)
    print("PaimonNarrator Start : ")
    --self:EnablePlayerInput(false)
    --self:EnterSceneLookCamera(NPCData.cameraPos, 3, 3, true)
    self:NarratorOnlyTask(q462Cfg.NarratorData.Story4)
    --self:EnablePlayerInput(true)
end

function Quest462:PlayerInputOn()
    print("PaimonNarrator Start : ")    
    self:EnablePlayerInput(true)
end


function Quest462:OnSubStart46203(quest)
    print("46203 Start : ")
    local KaeyaNPC = actorMgr:GetActor(NPCData.Npc)
    KaeyaNPC:DoFreeStyle(363)
    KaeyaNPC:Standby(true)
    KaeyaNPC:Standby()
    KaeyaNPC:TurnTo(M.Euler2DirXZ(NPCData.NPCToDir))
    --actorMgr:CreateActorWithPos(NPCData.Npc, NPCData.NPCScript, NPCData.NpcID, 0, NPCData.NPCToPos, NPCData.NPCToDir, true, false,3)
    
end

function Quest462:OnSubFinish46203(quest)
    print("46203 Finish : ")
    self:PaimonVanish()
end

function Quest462:OnSubStart46204(quest)
    print("46204 Start : ")
    --[[self:ActionSafeCall(
        function(self)
            self:NarratorOnlyTask(q462Cfg.NarratorData.Story1)
        end
    )]]
    --self:SpawnItem(TreasureData.Treasure1ID, TreasureData.Treasure1Pos, nil, TreasureData.Alias1, 3)
    actorMgr:CreateActorWithPos(KaeyaData.Kaeya, KaeyaData.KaeyaScript, KaeyaData.KaeyaID, 0, KaeyaData.InPos, KaeyaData.InDir, true, false,1004)
end

function Quest462:StartTalk46204()
    print("46302 Start : ")
    actorMgr:CreateActorWithPos(PaimonData.Alias, PaimonData.Script, PaimonData.ID, 0, PaimonData.Pos, PaimonData.Dir, true, false,3)
    self:CallDelay(0.2,
        function(self)
            self:RequestInteraction(PaimonData.Alias)
        end 
    )
end

function Quest462:OnSubFinish46204(quest)
    print("46204 Finish : ")
    --self:ShowBlackScreen(0.3,0.4,0.3, self.StartTalk46204)    
    --self:RequestInteraction(PaimonData.Alias)
    --self:ActionSafeCall(
        --function(self)
            --self:RequestInteraction(PaimonData.Alias)
        --end
    --)
end

function Quest462:InvokeOnInteraction(param)
    print("462 Invoke : ")
    if param == 0 then
        print("Invoke 0")
        self:ShowTutorialDialog(180)
    elseif param == 1 then
        self:ShowTutorialDialog(181)
    elseif param == 2 then
        self:ShowTutorialDialog(182)
    end    
end

function Quest462:OnSubStart46206(quest)
    print("46206 Start : ")
    --self:SpawnItem(TreasureData.Treasure2ID, TreasureData.Treasure2Pos, nil, TreasureData.Alias2, 3)
    actorMgr:CreateActorWithPos(KaeyaData.Kaeya, KaeyaData.KaeyaScript, KaeyaData.KaeyaID, 0, KaeyaData.InPos, KaeyaData.InDir, true, false,1004)
end

function Quest462:OnSubFinish46206(quest)
    print("46206 Finish : ")
    --self:NarratorOnlyTask(q462Cfg.NarratorData.Story3)
end

function Quest462:OnSubFinish46205(quest)
    print("46205 Finish : ")
    self:PaimonVanish()
end

function Quest462:OnSubFinish46207(quest)
    print("46207 Finish : ")
    self:PaimonVanish()
end

function Quest462:OnSubStart46210(quest)
    print("46210 Start : ")
    self:ShowBlackScreen(0.5,0.5,0.5, self.StartTalk46204)   
end

function Quest462:OnSubFinish46210(quest)
    print("46210 Finish : ")
    self:ActionSafeCall(
        function(self)
            self:PaimonVanish()
        end
    )    
end

--@endregion

function Quest462:Start()
end

function Quest462:OnDestroy()
end

return Quest462