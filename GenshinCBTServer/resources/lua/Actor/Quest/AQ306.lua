require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest306 = class("Quest306", questActorProxy)

Quest306.defaultAlias = "Quest306"

local q306Cfg = require('Quest/Client/Q306ClientConfig')
local q359Cfg = require('Quest/Client/Q359ClientConfig')
local amborData = q306Cfg.AmborData

-- Generated
function Quest306:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["30600"] = self.OnSubStart30600
	self.subStartHandlers["30601"] = self.OnSubStart30601
    self.subStartHandlers["30602"] = self.OnSubStart30602
    self.subStartHandlers["30603"] = self.OnSubStart30603
    self.subStartHandlers["30604"] = self.OnSubStart30604
    -- self.subStartHandlers["30605"] = self.OnSubStart30605
    -- self.subStartHandlers["30606"] = self.OnSubStart30606
    self.subStartHandlers["30607"] = self.OnSubStart30607
    self.subStartHandlers["30608"] = self.OnSubStart30608
    self.subStartHandlers["30609"] = self.OnSubStart30609
    self.subStartHandlers["30610"] = self.OnSubStart30610
    self.subStartHandlers["30611"] = self.OnSubStart30611
    self.subStartHandlers["30612"] = self.OnSubStart30612
end

function Quest306:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["30600"] = self.OnSubFinish30600
	self.subFinishHandlers["30601"] = self.OnSubFinish30601
    self.subFinishHandlers["30602"] = self.OnSubFinish30602
    self.subFinishHandlers["30603"] = self.OnSubFinish30603
    self.subFinishHandlers["30604"] = self.OnSubFinish30604
    -- self.subFinishHandlers["30605"] = self.OnSubFinish30605
    -- self.subFinishHandlers["30606"] = self.OnSubFinish30606
    self.subFinishHandlers["30607"] = self.OnSubFinish30607
    self.subFinishHandlers["30608"] = self.OnSubFinish30608
    self.subFinishHandlers["30609"] = self.OnSubFinish30609
    self.subFinishHandlers["30610"] = self.OnSubFinish30610
    self.subFinishHandlers["30611"] = self.OnSubFinish30611
    self.subFinishHandlers["30612"] = self.OnSubFinish30612
end

---sub start & finish 内调用的函数
function Quest306:AmborIntoDungeon()
    local ambor = actorMgr:GetActor(self.clientData.AmborData.Ambor)
    ambor:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)	
	ambor:RunToTask(self.clientData.AmborData.DoorPos,
	function(actor, task)
		actor:ClearFollowTask()
        actor:ClearPriorityInter(InterTimingType.BTN)
        actor:Standby()
		actor:TurnTo(M.Euler2DirXZ(self.clientData.AmborData.DoorDir))
	end
    )
end

function Quest306:ShowTutorial1(actor)
	self:ShowTutorialDialog(103)
end

function Quest306:ShowTutorial2(actor)
	self:ShowTutorialDialog(104)
end

function Quest306:ShowTutorial3(actor)
	self:ShowTutorialDialog(105)
end

--@region sub start & finish handlers
---按流程触发顺序
function Quest306:OnSubFinish30600(quest)
    actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.DungeonPos, amborData.DungeonDir, true, false)
end

function Quest306:OnSubStart30602(quest)
    print("30601 Start : Creat Ambor & Environment")
    --self:ActionSafeCall(AmborIntoDungeon)
    local ambor = actorMgr:GetActor(self.clientData.AmborData.Ambor)
    ambor:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)	
	ambor:RunToTask(self.clientData.AmborData.DoorPos,
	function(actor, task)
		actor:ClearFollowTask()
        actor:ClearPriorityInter(InterTimingType.BTN)
        actor:Standby()
		actor:TurnTo(M.Euler2DirXZ(self.clientData.AmborData.DoorDir))
	end
    )
    self:ActionSafeCall(
        function(self)
            local paimon = actorMgr:GetActor("Paimon")
            if paimon ~= nil then
                paimon:DestroyWithDisappear(false)
            end
        end
    )
end

function Quest306:OnSubStart30610(quest)
    print("30610 Start : talk to NPC")
    self:ShowBlackScreen(0.5, 1, 0.5,
    function (self)
        actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.BornPos, amborData.BornDir, true, false, 20009)
        self:CallDelay(0.5,
        function (self)
            self:RequestInteraction(amborData.Ambor)
        end
        )
    end
    )
end

function Quest306:OnSubFinish30604(quest)
    local quest = actorMgr:GetActor(q359Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuestID(false, 35902)
	end
end

function Quest306:OnSubFinish30607(quest)
	print("30607 Finish: Tutorial 1")
    --self:ActionSafeCall(ShowTutorial1)
    self:ShowTutorialDialog(103)
end

function Quest306:OnSubFinish30608(quest)
	print("30607 Finish: Tutorial 2")
    --self:ActionSafeCall(ShowTutorial2)
    self:ShowTutorialDialog(104,
        function ()
            globalActor:StartGuide("EnterFocusModeGuidePC") 
        end
    )
end

function Quest306:OnSubFinish30609(quest)
	print("30607 Finish: Tutorial 3")
    --self:ActionSafeCall(ShowTutorial3)
    self:ShowTutorialDialog(105)
end

function Quest306:OnSubFinish30610(quest)
    print("30610 Finish: Destroy Ambor")
    self:ActionSafeCall(
        self:ShowBlackScreen(0.5, 1, 0.5,
            function(self)
                local ambor = actorMgr:GetActor(amborData.Ambor)
                local paimon = actorMgr:GetActor("Paimon")

                if ambor ~= nil then
                    ambor:Destroy(false)
                end

                if paimon ~= nil then
                    paimon:Destroy(false)
                end
            end
        )
    )
end

function Quest306:OnSubFinish30612(quest)
    print("30612 Finish: FlyGuide")
    globalActor:StartGuide("GuideAvatarFlyInWind")
end

--@endregion

function Quest306:Start()
end

function Quest306:OnDestroy()
end

return Quest306