require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest463 = class("Quest463", questActorProxy)

Quest463.defaultAlias = "Quest463"

local q463Cfg = require('Quest/Client/Q463ClientConfig')

--local KaeyaData = Quest463.clientData.KaeyaData
local kaeyaData = q463Cfg.KaeyaData
local paimonData = q463Cfg.PaimonData
local npcBossData=q463Cfg.KaeyaNPCBossData
local DungeonData = q463Cfg.DungeonData
local Invisible=q463Cfg.Invisible
local SoldierData=q463Cfg.SoldierData
--local kaeya = actorMgr:GetActor(KaeyaData.kaeya)
--local NPCData=Quest463.clientData.NPCData

function Quest463:PaimonVanish()
    --self:ShowTutorialDialog(113)
    print("463 PaimonVanish")
	local paimon = actorMgr:GetActor(paimonData.Alias)
	paimon:AirModeOff()
	--paimon:VanishKeep()
	if paimon ~= nil then
		paimon:DestroyWithDisappear(false)
	end
end


-- Generated
function Quest463:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["46300"] = self.OnSubStart46300
	self.subStartHandlers["46301"] = self.OnSubStart46301
    self.subStartHandlers["46302"] = self.OnSubStart46302
    self.subStartHandlers["46303"] = self.OnSubStart46303
    self.subStartHandlers["46304"] = self.OnSubStart46304
    self.subStartHandlers["46305"] = self.OnSubStart46305
    self.subStartHandlers["46306"] = self.OnSubStart46306
    self.subStartHandlers["46307"] = self.OnSubStart46307
    self.subStartHandlers["46308"] = self.OnSubStart46308
end

function Quest463:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["46300"] = self.OnSubFinish46300
	self.subFinishHandlers["46301"] = self.OnSubFinish46301
    self.subFinishHandlers["46302"] = self.OnSubFinish46302
    self.subFinishHandlers["46303"] = self.OnSubFinish46303
    self.subFinishHandlers["46304"] = self.OnSubFinish46304
    self.subFinishHandlers["46305"] = self.OnSubFinish46305
    self.subFinishHandlers["46306"] = self.OnSubFinish46306
    self.subFinishHandlers["46307"] = self.OnSubFinish46307
    self.subFinishHandlers["46308"] = self.OnSubFinish46308
end

function Quest463:PaimonEnter()
    --actorMgr:CreateActorWithPos(paimonData.Alias, paimonData.Script, paimonData.ID, 0, paimonData.BornPos, paimonData.BornDir, true, false,3)
    local paimon = actorMgr:GetActor(paimonData.Alias)
    paimon:SetVisible(true)
    --kaeya:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)	
    print("463 PaimonEnter")
    paimon:WalkToTask(paimonData.Pos3,
    function(actor, task)
		--actor:ClearFollowTask()
        --actor:ClearPriorityInter(InterTimingType.BTN)
        --actorMgr:CreateActorWithPos(paimonData.Alias, paimonData.Script, paimonData.ID, 0, paimonData.Pos3, paimonData.Dir3, true, false,3)
        actor:Standby()
        print("463 PaimonEnter TurnTo")
		actor:TurnTo(M.Euler2DirXZ(paimonData.Dir3))
	end
    )
end

function Quest463:KaeyaLeave()
    local kaeya = actorMgr:GetActor(kaeyaData.Kaeya)
    kaeya:SetVisible(true)
    --kaeya:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)
    kaeya:EnableInteraction(false)	
    print("463 KaeyaLeave")
    kaeya:WalkToTask(paimonData.BornPos,
    function(actor, task)
		--actor:ClearFollowTask()
        --actor:ClearPriorityInter(InterTimingType.BTN)
        actor:EnableInteraction(true)
        --actorMgr:CreateActorWithPos(paimonData.Alias, paimonData.Script, paimonData.ID, 0, paimonData.Pos3, paimonData.Dir3, true, false,3)
        --actor:Destroy(false)
        actor:Standby()
		actor:SetVisible(false)
	end
    )
end

function Quest463:Soldier1Enter()
    local soldier1 = actorMgr:GetActor(SoldierData.Alias1)
    soldier1:SetVisible(true)
    soldier1:WalkToTask(SoldierData.Pos1,
    function(actor, task)
		--actor:ClearFollowTask()
        --actor:ClearPriorityInter(InterTimingType.BTN)
        --actorMgr:CreateActorWithPos(paimonData.Alias, paimonData.Script, paimonData.ID, 0, paimonData.Pos3, paimonData.Dir3, true, false,3)
        --actor:Destroy(false)
        actor:Standby()
		actor:TurnTo(M.Euler2DirXZ(SoldierData.Dir1))
	end
    )
end

function Quest463:Soldier2Enter()
    local soldier2 = actorMgr:GetActor(SoldierData.Alias2)
    soldier2:SetVisible(true)
    soldier2:WalkToTask(SoldierData.Pos2,
    function(actor, task)
		--actor:ClearFollowTask()
        --actor:ClearPriorityInter(InterTimingType.BTN)
        --actorMgr:CreateActorWithPos(paimonData.Alias, paimonData.Script, paimonData.ID, 0, paimonData.Pos3, paimonData.Dir3, true, false,3)
        --actor:Destroy(false)
        --actor:Standby()
		actor:TurnTo(M.Euler2DirXZ(SoldierData.Dir2))
	end
    )    
end


function Quest463:KaeyaEnter()
    local kaeya = actorMgr:GetActor(kaeyaData.Kaeya)
    kaeya:SetVisible(true)
    --kaeya:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)	
    print("463 KaeyaEnter")
    kaeya:WalkToTask(kaeyaData.InPos,
    function(actor, task)
		--actor:ClearFollowTask()
        --actor:ClearPriorityInter(InterTimingType.BTN)
        --actorMgr:CreateActorWithPos(paimonData.Alias, paimonData.Script, paimonData.ID, 0, paimonData.Pos3, paimonData.Dir3, true, false,3)
        --actor:Destroy(false)
        actor:Standby()
		actor:TurnTo(M.Euler2DirXZ(kaeyaData.InDir))
	end
    )
    self:CallDelay(0.1,self.Soldier1Enter)
    self:CallDelay(0.2,self.Soldier2Enter)    
end

function Quest463:NPCEnter()
    local npc = actorMgr:GetActor(npcBossData.NpcBoss)
    npc:SetVisible(true)
    --kaeya:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)	
    print("463 NPCEnter")
    npc:WalkToTask(npcBossData.NpcBossPos,
    function(actor, task)
		--actor:ClearFollowTask()
        --actor:ClearPriorityInter(InterTimingType.BTN)
        --actorMgr:CreateActorWithPos(paimonData.Alias, paimonData.Script, paimonData.ID, 0, paimonData.Pos3, paimonData.Dir3, true, false,3)
        --actor:Destroy(false)
        actor:Standby()
        print("463 NPCEnter TurnTo")
		actor:TurnTo(M.Euler2DirXZ(npcBossData.NpcBossDir))
	end
    )
end

function Quest463:NPCRun()
    local npc = actorMgr:GetActor(npcBossData.NpcBoss)
    --kaeya:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)	
    print("463 NPCRun")
    npc:RunToTask(npcBossData.TrapPos,
    function(actor, task)
		--actor:ClearFollowTask()
        --actor:ClearPriorityInter(InterTimingType.BTN)
        --actorMgr:CreateActorWithPos(paimonData.Alias, paimonData.Script, paimonData.ID, 0, paimonData.Pos3, paimonData.Dir3, true, false,3)
        --actor:Destroy(false)
        actor:Standby()
        actor:TurnTo(M.Euler2DirXZ(npcBossData.TrapDir))
        print("Invoke 0 finish quest")
        local quest = actorMgr:GetActor(q463Cfg.ActorAlias)
        if quest ~= nil then
            quest:FinishQuest(false, nil)
        end
	end
    )
end

function Quest463:NPCRun2()
    local npc = actorMgr:GetActor(npcBossData.NpcBoss)
    --kaeya:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)	
    print("463 NPCRun")
    npc:RunToTask(npcBossData.LastPos,
    function(actor, task)
		--actor:ClearFollowTask()
        --actor:ClearPriorityInter(InterTimingType.BTN)
        --actorMgr:CreateActorWithPos(paimonData.Alias, paimonData.Script, paimonData.ID, 0, paimonData.Pos3, paimonData.Dir3, true, false,3)
        --actor:Destroy(false)
        actor:Standby()
        actor:PerformDither(false,2)      
	end
    )
end

function Quest463:NPCTrans()
    local npc = actorMgr:GetActor(npcBossData.NpcBoss)	
    print("463 NPCTrans")
    npc:ClearAllTask()
    npc:SetPosAndTurnTo(npcBossData.NpcBossPos,M.Euler2DirXZ(npcBossData.NpcBossDir),true)
    --actorMgr:CreateActorWithPos(npcBossData.NpcBoss, npcBossData.NpcBossScript, npcBossData.NpcBossID, 0, npcBossData.NpcBossPos, npcBossData.NpcBossDir, true, false,20016)
end

function Quest463:PaiMonTrans()
    local paimon = actorMgr:GetActor(paimonData.Alias)
    print("463 PaiMonTrans")
    paimon:ClearAllTask()
    paimon:SetPosAndTurnTo(paimonData.Pos3,M.Euler2DirXZ(paimonData.Dir3),true)
end

function Quest463:KaeyaTrans()
    local kaeya = actorMgr:GetActor(kaeyaData.Kaeya)
    local soldier1 = actorMgr:GetActor(SoldierData.Alias1)
    local soldier2 = actorMgr:GetActor(SoldierData.Alias2)    
    
    print("463 KaeyaTrans")
    kaeya:ClearAllTask()
    soldier1:ClearAllTask()
    soldier2:ClearAllTask()
    kaeya:SetPosAndTurnTo(kaeyaData.InPos,M.Euler2DirXZ(kaeyaData.InDir),true)
    soldier1:SetPosAndTurnTo(SoldierData.Pos1,M.Euler2DirXZ(SoldierData.Dir1),true)
    soldier2:SetPosAndTurnTo(SoldierData.Pos2,M.Euler2DirXZ(SoldierData.Dir2),true)

end

function Quest463:InvokeOnInteraction(param)
    print("463 Invoke : ")
    if param == 0 then
        print("Invoke 0 finish quest")
        local quest = actorMgr:GetActor(q463Cfg.ActorAlias)
        if quest ~= nil then
            quest:FinishQuest(false, nil)
        end
    elseif param == 1 then
        print("Invoke 1 paimon born")
        self:PaimonEnter()
    elseif param == 2 then
        self:NPCEnter()
    elseif param == 3 then
        self:KaeyaEnter()
    elseif param == 4 then
        self:CallDelay(0.5,self.NPCRun)
    elseif param == 5 then
        print("Invoke 5 kaeya leave")
        self:KaeyaLeave()
    elseif param == 6 then
        print("Invoke 6 npc trans")
        --self:CallDelay(0,self.NPCTrans)
        self:NPCTrans()
    elseif param == 7 then
        print("Invoke 7 PaiMonTrans")
        --self:CallDelay(0,self.PaiMonTrans)
        self:PaiMonTrans()
    elseif param == 8 then
        print("Invoke 8 KaeyaTrans")
        --self:CallDelay(0,self.KaeyaTrans)
        self:KaeyaTrans()
    elseif param == 10 then
        print("Invoke 10 treasure")
        self:ShowTutorialDialog(182)
    elseif param == 11 then
        print("Invoke 11 treasure")
        self:NPCDisappear()
    elseif param == 12 then
        print("Invoke 12 treasure")
        --self:NPCRun2()
        self:CallDelay(3,self.NPCRun2)
    end    
end

function Quest463:NPCDisappear()
    local npc = actorMgr:GetActor(npcBossData.NpcBoss)
    local soldier1 = actorMgr:GetActor(SoldierData.Alias1)
    local soldier2 = actorMgr:GetActor(SoldierData.Alias2)
    npc:SetVisible(false)
    soldier1:SetVisible(false)
    soldier2:SetVisible(false)
end


function Quest463:OnSubFinish46306(quest)
    print("46306 Finish : Creat Kaeya")
--  actorMgr:CreateActorWithPos(npcBossData.NpcBoss, npcBossData.NpcBossScript, npcBossData.NpcBossID, 0, npcBossData.TrapPos, npcBossData.TrapDir, true, false,20016)    
    --self:NPCEnter()
    --self:NPCRun()
end




--@region sub start & finish handlers
---按流程触发顺序

function Quest463:StartTalk46300()
    print("46302 Start : ")
    actorMgr:CreateActorWithPos(paimonData.Alias, paimonData.Script, paimonData.ID, 0, paimonData.Pos1, paimonData.Dir1, true, false,3)
    self:CallDelay(0.2,
        function(self)
            self:RequestInteraction(paimonData.Alias)
        end 
    )    
end

function Quest463:StartTalk46301()
    print("46302 Start : ")
    actorMgr:CreateActorWithPos(paimonData.Alias, paimonData.Script, paimonData.ID, 0, paimonData.Pos2, paimonData.Dir2, true, false,3)        
    self:CallDelay(0.2,
        function(self)
            print("46307 RequestInteraction : ")
            self:RequestInteraction(paimonData.Alias)
        end 
    ) 
end

function Quest463:OnSubStart46300(quest)
    print("46300 Start : Creat paimon")
    self:ShowBlackScreen(0.5,0.5,0.5, self.StartTalk46300)    
end

function Quest463:OnSubFinish46300(quest)
    print("46300 Finish : ")
    self:ActionSafeCall(
        function(self)
            self:PaimonVanish()
        end 
    )    
    
end

function Quest463:OnSubStart46301(quest)
    print("46301 Start : Creat door")
    --self:SpawnGadget(DungeonData.DoorID, DungeonData.Pos, DungeonData.Dir, DungeonData.Alias, 3)    
end

function Quest463:OnSubFinish46301(quest)
    print("46301 Start : Creat Kaeya")
      
end

function Quest463:OnSubStart46302(quest)
    print("46302 Start : ")
    actorMgr:CreateActorWithPos(Invisible.Invisible, Invisible.NpcScript, Invisible.InvisibleID, 0, Invisible.InvisiblePos, Invisible.InvisibleDir, true, false,20016)
end

function Quest463:StartTalk()
    print("46302 Start : ")
    actorMgr:CreateActorWithPos(paimonData.Alias, paimonData.Script, paimonData.ID, 0, paimonData.BornPos, paimonData.BornDir, true, false,20016)
    self:CallDelay(0.2,
        function(self)
            self:RequestInteraction(paimonData.Alias)
        end 
    )
end


function Quest463:OnSubStart46303(quest)
    print("46303 Start : ")
    --actorMgr:CreateActorWithPos(Invisible.Invisible, Invisible.NpcScript, Invisible.InvisibleID, 0, Invisible.InvisiblePos, Invisible.InvisibleDir, true, false,20016)
    self:ShowBlackScreen(0.5,0.5,0.5, self.StartTalk)
    --[[self:CallDelay(0.5,
        function(self)
            self:RequestInteraction(Invisible.Invisible)
        end 
    )]]--
    
--  actorMgr:CreateActorWithPos(paimonData.Alias, paimonData.Script, paimonData.ID, 0, paimonData.Pos3, paimonData.Dir3, true,false,20016)
end

function Quest463:OnSubStart46304(quest)
    print("46304 Start : ")
    self:ActionSafeCall(
        function(self)
            local npc = actorMgr:GetActor(npcBossData.NpcBoss)
            local kaeya = actorMgr:GetActor(kaeyaData.Kaeya)
            local soldier1 = actorMgr:GetActor(SoldierData.Alias1)
            local soldier2 = actorMgr:GetActor(SoldierData.Alias2)
            local paimon = actorMgr:GetActor(paimonData.Alias)
            npc:Destroy(false)
            kaeya:Destroy(false)
            soldier1:Destroy(false)
            soldier2:Destroy(false)
            paimon:Destroy(false)
        end 
    )    

    self:NarratorOnlyTask(q463Cfg.NarratorData.Story1)
end

function Quest463:OnSubStart46307(quest)
    print("46307 Start : ")
    self:ShowBlackScreen(0.5,0.5,0.5, self.StartTalk46301)    
end

function Quest463:OnSubFinish46307(quest)
    print("46307 Finish : ")
    self:PaimonVanish()
end

function Quest463:OnSubStart46305(quest)
    print("46305 Start : ")
    --actorMgr:CreateActorWithPos(kaeyaData.Kaeya, kaeyaData.KaeyaScript, kaeyaData.KaeyaID, 0, kaeyaData.InPos, kaeyaData.InDir, true, false,20016)
    --[[actorMgr:CreateActorWithPos(Invisible.Invisible, Invisible.NpcScript, Invisible.InvisibleID, 0, Invisible.InvisiblePos, Invisible.InvisibleDir, true, false,20016)
    self:CallDelay(2,
    function()
        self:RequestInteraction(Invisible.Invisible)
    end
    )]]--
    self:CallDelay(6,
    function(self)
        self:ShowBlackScreen(0.5,0.5,0.5,self.StartTalk)
    end
    )

    --self:ShowBlackScreen(0.3, 0.3, 0.3, self.StartTalk)
end

function Quest463:OnSubFinish46305(quest)
    print("46305 Finish : ")
    self:ActionSafeCall(
        function(self)
            local npc = actorMgr:GetActor(npcBossData.NpcBoss)
            local kaeya = actorMgr:GetActor(kaeyaData.Kaeya)
            local soldier1 = actorMgr:GetActor(SoldierData.Alias1)
            local soldier2 = actorMgr:GetActor(SoldierData.Alias2)
            local paimon = actorMgr:GetActor(paimonData.Alias)
            npc:Destroy(false)
            kaeya:Destroy(false)
            soldier1:Destroy(false)
            soldier2:Destroy(false)
            paimon:Destroy(false)
        end 
    )   
    --self:PaimonVanish()
end


--@endregion

function Quest463:Start()
end

function Quest463:OnDestroy()
end

return Quest463