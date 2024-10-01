require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest461 = class("Quest461", questActorProxy)

Quest461.defaultAlias = "Quest461"

local q461Cfg = require('Quest/Client/Q461ClientConfig')
local DailyNpcManager = require('Actor/DailyNPCManager')
local count =0
--local KaeyaData = Quest461.clientData.KaeyaData
local KaeyaData = q461Cfg.KaeyaData
local PaimonData=q461Cfg.PaimonData
local KaeyaNPCBossData = q461Cfg.KaeyaNPCBossData
--local NPCData=Quest461.clientData.NPCData
local NPCData=q461Cfg.NPCData

---sub start & finish 内调用的函数
function Quest461:PaimonVanish()
	print("paimon vanish")
	local paimon = actorMgr:GetActor(PaimonData.Alias)
	paimon:AirModeOff()
	--paimon:VanishKeep()
	if paimon ~= nil then
		paimon:DestroyWithDisappear(false)
	end
end

-- Generated
function Quest461:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
	self.subStartHandlers["46101"] = self.OnSubStart46101
    self.subStartHandlers["46102"] = self.OnSubStart46102
    self.subStartHandlers["46103"] = self.OnSubStart46103
    self.subStartHandlers["46104"] = self.OnSubStart46104
    self.subStartHandlers["46105"] = self.OnSubStart46105
    self.subStartHandlers["46106"] = self.OnSubStart46106
    self.subStartHandlers["46107"] = self.OnSubStart46107
    self.subStartHandlers["46109"] = self.OnSubStart46109
    
end

function Quest461:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
	self.subFinishHandlers["46101"] = self.OnSubFinish46101
    self.subFinishHandlers["46102"] = self.OnSubFinish46102
    self.subFinishHandlers["46103"] = self.OnSubFinish46103
    self.subFinishHandlers["46104"] = self.OnSubFinish46104
    self.subFinishHandlers["46105"] = self.OnSubFinish46105
    self.subFinishHandlers["46106"] = self.OnSubFinish46106
    self.subFinishHandlers["46107"] = self.OnSubFinish46107
    self.subFinishHandlers["46109"] = self.OnSubFinish46109
end

--开车对话的回调
function Quest461:DestroyNpc()
    local npc = actorMgr:GetActor(KaeyaNPCBossData.NpcBoss)
    npc:Destroy(false)
end

function Quest461:MoveKaeya()
    local kaeya = actorMgr:GetActor(KaeyaData.Kaeya)
    kaeya:Destroy(false)
    actorMgr:CreateActorWithPos(KaeyaData.Kaeya, KaeyaData.KaeyaScript, KaeyaData.KaeyaID, 0, KaeyaData.OutPos, KaeyaData.OutDir, true, false,3)
end

function Quest461:DestroyKaeya()
    local kaeya = actorMgr:GetActor(KaeyaData.Kaeya)
    kaeya:Destroy(false)
end



function Quest461:InvokeOnInteraction(param)
    print("461 Invoke : ")
    if param == 0 then
        print("Invoke 0")
        self:KaeyaTask2()    
    elseif param == 1 then
        print("Invoke 1")
        --self:NPCTask()
        self:CallDelay(1,self.NPCTask)
    end    
end


function Quest461:KaeyaTask()
    local kaeya = actorMgr:GetActor(KaeyaData.Kaeya)
    --kaeya:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)
    kaeya:EnableInteraction(false)
    print("46101 RunToStart")
    kaeya:RunToTask(KaeyaData.InPos2,
    function(actor, task)
        print("46101 RunToEnd")
		actor:ClearFollowTask()
        --actor:ClearPriorityInter(InterTimingType.BTN)
        actor:EnableInteraction(true)
        actor:PerformDither(false,1,self.MoveKaeya)
        --actorMgr:CreateActorWithPos(KaeyaData.Kaeya, KaeyaData.KaeyaScript, KaeyaData.KaeyaID, 0, KaeyaData.OutPos, KaeyaData.OutDir, true, false,3)
        --actor:Destroy(false)
        --actor:Standby()
		--actor:TurnTo(M.Euler2DirXZ(self.clientData.AmborData.DoorDir))
	end
    )
end

function Quest461:KaeyaTask2()
    local kaeya = actorMgr:GetActor(KaeyaData.Kaeya)
    --kaeya:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)
    --kaeya:EnableInteraction(false)
    print("46102 RunToStart")
    kaeya:WalkToTask(KaeyaData.LeavePos,
    function(actor, task)
        print("46102 RunToEnd")
		actor:ClearFollowTask()
        --actor:ClearPriorityInter(InterTimingType.BTN)
        --actor:EnableInteraction(true)
        --actor:PerformDither(false,1,self.DestroyKaeya)
        actor:SetVisible(false)
        --actorMgr:CreateActorWithPos(KaeyaData.Kaeya, KaeyaData.KaeyaScript, KaeyaData.KaeyaID, 0, KaeyaData.InPos, KaeyaData.InDir, true, false,1004)
        --actor:Destroy(false)
        --actor:Standby()
		--actor:TurnTo(M.Euler2DirXZ(self.clientData.AmborData.DoorDir))
	end
    )
end

function Quest461:KaeyaTask3()
    local kaeya = actorMgr:GetActor(KaeyaData.Kaeya)
    --kaeya:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)
    kaeya:EnableInteraction(false)
    print("46107 RunToStart")
    kaeya:WalkToTask(KaeyaData.LeavePos2,
    function(actor, task)
        print("46102 RunToEnd")
		actor:ClearFollowTask()
        --actor:ClearPriorityInter(InterTimingType.BTN)
        actor:EnableInteraction(true)
        actor:PerformDither(false,1,self.DestroyKaeya)
        --actor:SetVisible(false)
        --actorMgr:CreateActorWithPos(KaeyaData.Kaeya, KaeyaData.KaeyaScript, KaeyaData.KaeyaID, 0, KaeyaData.InPos, KaeyaData.InDir, true, false,1004)
        --actor:Destroy(false)
        --actor:Standby()
		--actor:TurnTo(M.Euler2DirXZ(self.clientData.AmborData.DoorDir))
	end
    )
end

function Quest461:NPCTask()
    local npc = actorMgr:GetActor(KaeyaNPCBossData.NpcBoss)
    --npc:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)
    npc:EnableInteraction(false)
    print("46102 RunToStart")
    npc:RunToTask(KaeyaNPCBossData.ToPos,
    function(actor, task)
        print("46104 RunToEnd")
        --actor:ClearPriorityInter(InterTimingType.BTN)
        actor:EnableInteraction(true)
        actor:PerformDither(false, 2,self.DestroyNpc)
        --actor:SetVisible(false)
        --actorMgr:CreateActorWithPos(KaeyaData.Kaeya, KaeyaData.KaeyaScript, KaeyaData.KaeyaID, 0, KaeyaData.InPos, KaeyaData.InDir, true, false,1004)
        --actor:Destroy(false)
        --actor:Standby()
		--actor:TurnTo(M.Euler2DirXZ(self.clientData.AmborData.DoorDir))
	end
    )
end


--@region sub start & finish handlers
---按流程触发顺序

function Quest461:OnSubStart46101(quest)
    print("46101 Start : Creat Kaeya")
    actorMgr:CreateActorWithPos(KaeyaData.Kaeya, KaeyaData.KaeyaScript, KaeyaData.KaeyaID, 0, KaeyaData.InPos, KaeyaData.InDir, true, false,1004)
end

function Quest461:OnSubFinish46101(quest)
    print("46101 Finish : Kaeya Leave")
    self:ActionSafeCall(self:KaeyaTask())
    self:PaimonVanish()
end


function Quest461:OnSubStart46102(quest)
    print("46102 Start : ")
    --actorMgr:CreateActorWithPos(KaeyaData.Kaeya, KaeyaData.KaeyaScript, KaeyaData.KaeyaID, 0, KaeyaData.OutPos, KaeyaData.OutDir, true, false,3)
    --[[self:ActionSafeCall(
        function(self)
            actorMgr:CreateActorWithPos(KaeyaData.Kaeya, KaeyaData.KaeyaScript, KaeyaData.KaeyaID, 0, KaeyaData.OutPos, KaeyaData.OutDir, true, false,3)
        end
    )]]
end

function Quest461:OnSubFinish46102(quest)
    print("46102 Finish : ")
    self:PaimonVanish()
    
end

function Quest461:OnSubStart46109(quest)
    print("46109 Start : ")
    --actorMgr:CreateActorWithPos(NPCData.Invisible, NPCData.NpcScript, NPCData.InvisibleID, 0, NPCData.InvisiblePos, NPCData.InvisibleDir, true, false,3)
    self:ShowBlackScreen(0.5,0.5,0.5, self.StartTalk)
    

end

function Quest461:StartTalk()
    print("46302 Start : ")
    actorMgr:CreateActorWithPos(KaeyaData.Kaeya, KaeyaData.KaeyaScript, KaeyaData.KaeyaID, 0, KaeyaData.OutPos, KaeyaData.OutDir, true, false,3)
    self:ActionSafeCall(
        function(self)
            self:RequestInteraction(KaeyaData.Kaeya)
        end
        )
    -- self:CallDelay(0.2,
    --     function(self)
    --         self:RequestInteraction(KaeyaData.Kaeya)
    --     end 
    -- )
end

function Quest461:OnSubFinish46109(quest)
    print("46109 Finish : ")
    local Invisible = actorMgr:GetActor(NPCData.Invisible)
    local Kaeya = actorMgr:GetActor(KaeyaData.Kaeya)
    local Paimon = actorMgr:GetActor(PaimonData.Alias)
    self:ActionSafeCall(
        function(self)
            Invisible:Destroy(false)
            self:DestroyKaeya()
            self:PaimonVanish()
        end 
    )    
end


function Quest461:OnSubStart46103(quest)
    print("46103 Start : ")
    count=0
    self:NotifyTo("MengdeDayStand_4", DailyNpcManager.NpcEventType.BANDAILY, true)
    self:NotifyTo("MengdeDayStand_5", DailyNpcManager.NpcEventType.BANDAILY, true)
    self:NotifyTo("MengdeDayStand_6", DailyNpcManager.NpcEventType.BANDAILY, true)
end

function Quest461:OnSubStart46104(quest)
    print("46104 Start : ")
    
    self:ActionSafeCall(
        function(self)
            actorMgr:CreateActorWithPos(KaeyaData.Kaeya, KaeyaData.KaeyaScript, KaeyaData.KaeyaID, 0, KaeyaData.InPos, KaeyaData.InDir, true, false,1004)
        end
    )
end

function Quest461:CountTalk()
    count=count+1
    if count ==3 then
        local quest = actorMgr:GetActor(q461Cfg.ActorAlias)
        if quest ~= nil then
            print("46103 finish quest ")
            --quest:FinishQuestID(false, 46103)
        end        
    end
end


function Quest461:OnSubFinish46104(quest)
    print("46104 Finish : ")
    local npc = actorMgr:GetActor(KaeyaNPCBossData.NpcBoss)
    --npc:SetPos(KaeyaNPCBossData.To0Pos)
    --self:NPCTask()
    self:PaimonVanish()
    self:CountTalk()
    
end

function Quest461:OnSubFinish46105(quest)
    print("46105 Finish : ")
    self:PaimonVanish()
    self:CountTalk()
end

function Quest461:OnSubFinish46106(quest)
    print("46106 Finish : ")
    self:PaimonVanish()
    self:CountTalk()
end

function Quest461:OnSubFinish46107(quest)
    print("46107 Finish : ")
    self:NotifyTo("MengdeDayStand_4", DailyNpcManager.NpcEventType.STARTDAILY, true)
    self:NotifyTo("MengdeDayStand_5", DailyNpcManager.NpcEventType.STARTDAILY, true)
    self:NotifyTo("MengdeDayStand_6", DailyNpcManager.NpcEventType.STARTDAILY, true)
    self:PaimonVanish()
    self:KaeyaTask3()
    
end

function Quest461:OnSubStart46107(quest)
    print("46107 Start : ")
    
    actorMgr:CreateActorWithPos(KaeyaData.Kaeya, KaeyaData.KaeyaScript, KaeyaData.KaeyaID, 0, KaeyaData.Out2Pos, KaeyaData.Out2Dir, true, false,3)
    --local quest = actorMgr:GetActor(q461Cfg.ActorAlias)
    --if quest ~= nil then
        --print("46107 finish quest ")
        --quest:FinishQuest(false, nil)
    --end
    self:NarratorOnlyTask(self.clientData.NarratorData.Story1,self.OnNarratorFinish)
end



--@endregion

function Quest461:Start()
end

function Quest461:OnDestroy()
end

return Quest461