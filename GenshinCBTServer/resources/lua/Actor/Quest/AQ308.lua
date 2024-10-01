require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest308 = class("Quest308", questActorProxy)

Quest308.defaultAlias = "Quest308"

local q308Cfg = require('Quest/Client/Q308ClientConfig')
local q359Cfg = require('Quest/Client/Q359ClientConfig')
local lisaData = q308Cfg.LisaData
local bookData = q308Cfg.BookData

-- Generated
function Quest308:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["30800"] = self.OnSubStart30800
	self.subStartHandlers["30801"] = self.OnSubStart30801
    self.subStartHandlers["30802"] = self.OnSubStart30802
    self.subStartHandlers["30803"] = self.OnSubStart30803
    self.subStartHandlers["30804"] = self.OnSubStart30804
    -- self.subStartHandlers["30805"] = self.OnSubStart30805
    -- self.subStartHandlers["30806"] = self.OnSubStart30806
    self.subStartHandlers["30807"] = self.OnSubStart30807
    self.subStartHandlers["30808"] = self.OnSubStart30808
    self.subStartHandlers["30809"] = self.OnSubStart30809
    self.subStartHandlers["30810"] = self.OnSubStart30810
    self.subStartHandlers["30811"] = self.OnSubStart30811
    self.subStartHandlers["30812"] = self.OnSubStart30812
    self.subStartHandlers["30814"] = self.OnSubStart30814
end

function Quest308:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["30800"] = self.OnSubFinish30800
	self.subFinishHandlers["30801"] = self.OnSubFinish30801
    self.subFinishHandlers["30802"] = self.OnSubFinish30802
    self.subFinishHandlers["30803"] = self.OnSubFinish30803
    self.subFinishHandlers["30804"] = self.OnSubFinish30804
    -- self.subFinishHandlers["30805"] = self.OnSubFinish30805
    -- self.subFinishHandlers["30806"] = self.OnSubFinish30806
    self.subFinishHandlers["30807"] = self.OnSubFinish30807
    self.subFinishHandlers["30808"] = self.OnSubFinish30808
    self.subFinishHandlers["30809"] = self.OnSubFinish30809
    self.subFinishHandlers["30810"] = self.OnSubFinish30810
    self.subFinishHandlers["30811"] = self.OnSubFinish30811
    self.subFinishHandlers["30812"] = self.OnSubFinish30812
    self.subFinishHandlers["30814"] = self.OnSubFinish30814
end

---sub start & finish 内调用的函数
function Quest308:LisaIntoDungeon()
    local LisaData = self.clientData.LisaData
    local lisa = actorMgr:GetActor(self.clientData.LisaData.Lisa)
    lisa:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)	
	lisa:RunToTask(sceneData:GetDummyPoint(3,"Q308DungeonDoor").pos,
	function(actor, task)
		actor:ClearFollowTask()
        actor:ClearPriorityInter(InterTimingType.BTN)
	end
    )
end

function Quest308:LisaDestroy(actor)
    local lisa = actorMgr:GetActor(self.clientData.LisaData.Lisa)
    lisa:EnableHeadCtrl(true)
	if lisa ~= nil then
		lisa:Destroy(false)
	end
end

--@region sub start & finish handlers
---按流程触发顺序
function Quest308:OnSubFinish30800(quest)
    local LisaData = self.clientData.LisaData
    actorMgr:CreateActorWithPos(LisaData.Lisa, LisaData.LisaScript, LisaData.LisaID, 0, LisaData.DungeonPos, LisaData.DungeonDir, true, false)
end

function Quest308:OnSubStart30802(quest)
    print("30801 Start : Creat Lisa & Environment")
    local lisa = actorMgr:GetActor(self.clientData.LisaData.Lisa)
    lisa:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)	
	lisa:RunToRouteTask(q308Cfg.RoutePoints,
	function(actor, task)
		actor:ClearFollowTask()
        actor:ClearPriorityInter(InterTimingType.BTN)
        actor:Standby()
		actor:TurnTo(M.Euler2DirXZ(self.clientData.LisaData.DoorDir))
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

function Quest308:OnSubStart30810(quest)
    print("30810 Start : Creat Lisa In Dungeon")
    local LisaData = self.clientData.LisaData
    actorMgr:CreateActorWithPos(LisaData.Lisa, LisaData.LisaScript, LisaData.LisaID, 0, LisaData.Pos1, LisaData.Dir1, true, false, 20011)
    local lisa = actorMgr:GetActor(self.clientData.LisaData.Lisa)
    lisa:EnableHeadCtrl(false)
end

function Quest308:OnSubStart30814(quest)
    print("30814 Start : talk to NPC")
    self:ShowBlackScreen(0.5, 1, 0.5,
    function (self)
        actorMgr:CreateActorWithPos(lisaData.Lisa, lisaData.LisaScript, lisaData.LisaID, 0, lisaData.BornPos, lisaData.BornDir, true, false, 20011)
        self:CallDelay(0.5,
            function (self)
                self:RequestInteraction(lisaData.Lisa)
            end
        )
    end
    )
end

function Quest308:OnSubFinish30804(quest)
    local quest = actorMgr:GetActor(q359Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuestID(false, 35904)
	end
end

function Quest308:OnSubFinish30810(quest)
    print("30810 Finish : Destroy Lisa")
	self:ActionSafeCall(self.LisaDestroy)
end

function Quest308:OnSubFinish30807(quest)
	print("30807 Finish: Tutorial 1")
    self:ShowTutorialDialog(109)
end

function Quest308:OnSubFinish30808(quest)
	print("30807 Finish: Tutorial 2")
    self:ShowTutorialDialog(110)
end

function Quest308:OnSubFinish30809(quest)
	print("30807 Finish: Tutorial 3")
    self:ShowTutorialDialog(111)
end

function Quest308:OnSubFinish30812(quest)
	print("30812 Finish: Tutorial 4")
    self:ShowTutorialDialog(149)
end

function Quest308:OnSubFinish30814(quest)
    print("30814 Finish: Destroy Lisa")
    self:ActionSafeCall(
        self:ShowBlackScreen(0.5, 1, 0.5,
            function(self)
                local lisa = actorMgr:GetActor(lisaData.Lisa)
                local paimon = actorMgr:GetActor("Paimon")

                if lisa ~= nil then
                    lisa:Destroy(false)
                end

                if paimon ~= nil then
                    paimon:Destroy(false)
                end
            end
        )
    )

    
end


--@endregion

function Quest308:Start()
end

function Quest308:OnDestroy()
end

return Quest308