require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest307 = class("Quest307", questActorProxy)

Quest307.defaultAlias = "Quest307"

local q307Cfg = require('Quest/Client/Q307ClientConfig')
local q359Cfg = require('Quest/Client/Q359ClientConfig')
local gaiaData = q307Cfg.GaiaData

-- Generated
function Quest307:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["30700"] = self.OnSubStart30700
	self.subStartHandlers["30701"] = self.OnSubStart30701
    self.subStartHandlers["30702"] = self.OnSubStart30702
    self.subStartHandlers["30703"] = self.OnSubStart30703
    self.subStartHandlers["30704"] = self.OnSubStart30704
    -- self.subStartHandlers["30705"] = self.OnSubStart30705
    -- self.subStartHandlers["30706"] = self.OnSubStart30706
    self.subStartHandlers["30707"] = self.OnSubStart30707
    self.subStartHandlers["30708"] = self.OnSubStart30708
    self.subStartHandlers["30709"] = self.OnSubStart30709
    self.subStartHandlers["30710"] = self.OnSubStart30710
    self.subStartHandlers["30711"] = self.OnSubStart30711
    self.subStartHandlers["30712"] = self.OnSubStart30712
    self.subStartHandlers["30713"] = self.OnSubStart30713
    self.subStartHandlers["30715"] = self.OnSubStart30715
end

function Quest307:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["30700"] = self.OnSubFinish30700
	self.subFinishHandlers["30701"] = self.OnSubFinish30701
    self.subFinishHandlers["30702"] = self.OnSubFinish30702
    self.subFinishHandlers["30703"] = self.OnSubFinish30703
    self.subFinishHandlers["30704"] = self.OnSubFinish30704
    -- self.subFinishHandlers["30705"] = self.OnSubFinish30705
    -- self.subFinishHandlers["30706"] = self.OnSubFinish30706
    self.subFinishHandlers["30707"] = self.OnSubFinish30707
    self.subFinishHandlers["30708"] = self.OnSubFinish30708
    self.subFinishHandlers["30709"] = self.OnSubFinish30709
    self.subFinishHandlers["30710"] = self.OnSubFinish30710
    self.subFinishHandlers["30711"] = self.OnSubFinish30711
    self.subFinishHandlers["30712"] = self.OnSubFinish30712
    self.subFinishHandlers["30713"] = self.OnSubFinish30713
    self.subFinishHandlers["30715"] = self.OnSubFinish30715
end

---sub start & finish 内调用的函数
function Quest307:GaiaIntoDungeon()
    local GaiaData = self.clientData.GaiaData
    local gaia = actorMgr:GetActor(self.clientData.GaiaData.Gaia)
    gaia:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)	
	gaia:RunToTask(sceneData:GetDummyPoint(3,"Q307DungeonDoor").pos,
	function(actor, task)
		actor:ClearFollowTask()
        actor:ClearPriorityInter(InterTimingType.BTN)
	end
    )
end

function Quest307:ShowTutorial1(actor)
	self:ShowTutorialDialog(106)
end

function Quest307:ShowTutorial2(actor)
	self:ShowTutorialDialog(107)
end

function Quest307:ShowTutorial3(actor)
	self:ShowTutorialDialog(108)
end

function Quest307:On30713CutsceneFinish()
    local quest = actorMgr:GetActor(q307Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(false, nil)
    end
end

function Quest307:GaiaDestroy()
    local gaia = actorMgr:GetActor(self.clientData.GaiaData.Gaia)
    gaia:EnableHeadCtrl(true)
	if gaia ~= nil then
		gaia:Destroy(false)
	end
end
--@region sub start & finish handlers
---按流程触发顺序
function Quest307:OnSubFinish30700(quest)
    local GaiaData = self.clientData.GaiaData
    actorMgr:CreateActorWithPos(GaiaData.Gaia, GaiaData.GaiaScript, GaiaData.GaiaID, 0, GaiaData.DungeonPos, GaiaData.DungeonDir, true, false)
end

function Quest307:OnSubStart30702(quest)
    print("30701 Start : Creat Gaia & Environment")
    local gaia = actorMgr:GetActor(self.clientData.GaiaData.Gaia)
    gaia:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)	
	gaia:RunToTask(self.clientData.GaiaData.DoorPos,
	function(actor, task)
		actor:ClearFollowTask()
        actor:ClearPriorityInter(InterTimingType.BTN)
        actor:Standby()
		actor:TurnTo(M.Euler2DirXZ(self.clientData.GaiaData.DoorDir))
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

function Quest307:OnSubStart30704(quest)
    -- self:CallDelay(5,
    -- function (self)
        self:TransmitPlayer(3,sceneData:GetDummyPoint(3,"Q307DungeonDoor").pos, sceneData:GetDummyPoint(3,"Q307DungeonDoor").rot,
            function ()
                local quest = actorMgr:GetActor(q307Cfg.ActorAlias)
                if quest ~= nil then
                    quest:FinishQuest(false, nil)
                end
            end
        )
    -- end
    -- )
end

function Quest307:OnSubStart30710(quest)
    print("30710 Start : Creat Gaia In Dungeon")
    local GaiaData = self.clientData.GaiaData
    actorMgr:CreateActorWithPos(GaiaData.Gaia, GaiaData.GaiaScript, GaiaData.GaiaID, 0, GaiaData.Pos1, GaiaData.Dir1, true, false, 20008)
    local gaia = actorMgr:GetActor(self.clientData.GaiaData.Gaia)
    gaia:EnableHeadCtrl(false)	
end

function Quest307:OnSubStart30713(quest)
    self:ActionSafeCall(
        function (self)
            self:PlayCutscene(self.clientData.InterData.Cutscene1, self.On30713CutsceneFinish)
        end
    )
end

function Quest307:OnSubStart30715(quest)
    print("30715 Start : talk to NPC")
    self:ShowBlackScreen(0.5, 1, 0.5,
    function (self)
        actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.BornPos, gaiaData.BornDir, true, false, 20008)
        self:CallDelay(0.5,
            function (self)
                self:RequestInteraction(gaiaData.Gaia)
            end
        )
    end
    )
end

function Quest307:OnSubFinish30704(quest)
    local quest = actorMgr:GetActor(q359Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuestID(false, 35903)
	end
end

function Quest307:OnSubFinish30710(quest)
    print("30710 Finish : Destroy Gaia")
	self:ActionSafeCall(self.GaiaDestroy)
end

function Quest307:OnSubFinish30707(quest)
	print("30707 Finish: Tutorial 1")
    self:ShowTutorialDialog(106)
end

function Quest307:OnSubFinish30708(quest)
	print("30707 Finish: Tutorial 2")
    self:ShowTutorialDialog(107)
end

function Quest307:OnSubFinish30709(quest)
	print("30707 Finish: Tutorial 3")
    self:ShowTutorialDialog(108)
end

function Quest307:OnSubFinish30712(quest)
	print("30712 Finish: Tutorial 4")
    self:ShowTutorialDialog(183)
end

function Quest307:OnSubFinish30713(quest)
    print("30713 Finish : Cutscene")
end
--@endregion

function Quest307:Start()
end

function Quest307:OnDestroy()
end

return Quest307