require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest404 = class("Quest404", questActorProxy)

Quest404.defaultAlias = "Quest404"

local q404Cfg = require('Quest/Client/Q404ClientConfig')
local subIDs = q404Cfg.SubIDs
local amborData = q404Cfg.AmborData

-- Generated
function Quest404:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["40400"] = self.OnSubStart40400
	self.subStartHandlers["40401"] = self.OnSubStart40401
	self.subStartHandlers["40402"] = self.OnSubStart40402
	self.subStartHandlers["40403"] = self.OnSubStart40403
	self.subStartHandlers["40404"] = self.OnSubStart40404
    self.subStartHandlers["40405"] = self.OnSubStart40405
    self.subStartHandlers["40406"] = self.OnSubStart40406
    self.subStartHandlers["40407"] = self.OnSubStart40407
    self.subStartHandlers["40408"] = self.OnSubStart40408
    self.subStartHandlers["40409"] = self.OnSubStart40409
    self.subStartHandlers["40410"] = self.OnSubStart40410
end

function Quest404:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["40400"] = self.OnSubFinish40400
	self.subFinishHandlers["40401"] = self.OnSubFinish40401
	self.subFinishHandlers["40402"] = self.OnSubFinish40402
	self.subFinishHandlers["40403"] = self.OnSubFinish40403
	self.subFinishHandlers["40404"] = self.OnSubFinish40404
    self.subFinishHandlers["40405"] = self.OnSubFinish40405
    self.subFinishHandlers["40406"] = self.OnSubFinish40406
    self.subFinishHandlers["40407"] = self.OnSubFinish40407
    self.subFinishHandlers["40408"] = self.OnSubFinish40408
    self.subFinishHandlers["40409"] = self.OnSubFinish40409
    self.subFinishHandlers["40410"] = self.OnSubFinish40410
end

function Quest404:CountDown()
    print("CountDown Finished")
    if self.clientData.gotKey == false then
        local GoalMarker404 = actorMgr:GetActor("GoalMarker404")
        if GoalMarker404 ~= nil then
            GoalMarker404:DestroySelf()
        end
        local quest = actorMgr:GetActor(q404Cfg.ActorAlias)
        if quest ~= nil then
            print("isFinished == false")
            quest:FinishQuest(true, nil)
        end
    end
end

function Quest404:AmborToJudgePos()
    print("AmborToJudgePos")
    local ambor = actorMgr:GetActor(amborData.Ambor)
    ambor:ClearFollowTask()
	ambor:ClearPriorityInter(InterTimingType.BTN)
    ambor:SetPos(amborData.judgePos)
    ambor:TurnTo(M.Euler2DirXZ(amborData.judgeDir))
end
-- local param begin
-- local param end

-- local method begin
function Quest404:RunAmbor()
	local ambor = actorMgr:GetActor(amborData.Ambor)
	ambor:AddPriorityInter(InterTimingType.BTN, q404Cfg.InterData.AmborNoReplyInter)	
	ambor:RunToTask(amborData.arguePos, 
	function(self, task)
		self:ClearFollowTask()
		self:ClearPriorityInter(InterTimingType.BTN)
		actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.judgePos, amborData.judgeDir, true, false)
	end
	)
end  

function Quest404:AbleQuit1()
    self:ShowQuestQuitUI(subIDs.q40402)
end

function Quest404:AbleQuit2()
    self:ShowQuestQuitUI(subIDs.q40407)
end

function Quest404:StartCount()
    self:CountDownUIStart(q404Cfg.MatchTime, 10, 3)
    self:CallDelay(13,self.AbleQuit1)
    self:CallDelay(q404Cfg.MatchTime+4,self.CountDown)
end

function Quest404:StartCount2()
    self:CountDownUIStart(q404Cfg.MatchTime2, 10, 3)
    self:CallDelay(13,self.AbleQuit2)
    self:CallDelay(q404Cfg.MatchTime2+4,self.CountDown)
end

function Quest404:MovePlayer()
    self:TransmitPlayer(0, M.Pos(1726.7, 213.6, -1371.4), M.Euler(0, 33, 0))
end

function Quest404:BlackScreen()
    local avatarPos = actorUtils.GetAvatarPos()
    self:TransmitPlayer(0, avatarPos, M.Euler(0, 0, 0))
end

function Quest404:FailCount()
    self:HideQuestQuitUI()
    self:CountDownUITerminate()
    self:UnCallFunc(self.CountDown)
    self:MovePlayer()
    local GoalMarker404 = actorMgr:GetActor("GoalMarker404")
    if GoalMarker404 ~= nil then
        GoalMarker404:DestroySelf()
    end
end

function Quest404:SuccCount()
    self:HideQuestQuitUI()
    self:CountDownUITerminate()
    self:UnCallFunc(self.CountDown)
    local GoalMarker404 = actorMgr:GetActor("GoalMarker404")
    if GoalMarker404 ~= nil then
        GoalMarker404:DestroySelf()
    end
end




--@region sub start handlers
function Quest404:OnSubStart40400(quest)
    print("40400 start: Ambor Create; Coin Create")
    actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.bornPos, amborData.bornDir, true, false)
end

function Quest404:OnSubStart40401(quest)
	-- TODO: Do sth on sub quest 40401 start
end

function Quest404:OnSubStart40402(quest)
	-- TODO: Do sth on sub quest 40402 start
    print("40402 start: Spawn Key")
    q404Cfg.gotKey = false
    actorMgr:CreateActorWithPos("GoalMarker404", "Actor/Gadget/GoalMarker404", 70300004, 0, q404Cfg.KeyPos, q404Cfg.KeyDir, false, false)
    -- globalActor:SpawnItem(q404Cfg.KeyID, q404Cfg.KeyPos,nil,"Key1")
    self:ActionSafeCall(self.StartCount)
end

function Quest404:OnSubStart40403(quest)
    print("OnStart40403")
    self:FailCount()
end

function Quest404:OnSubStart40404(quest)
    
	-- TODO: Do sth on sub quest 40404 start
end

function Quest404:OnSubStart40405(quest)
    print("40405 start: fail the task")
    self:ActionSafeCall(self.BlackScreen)
    local quest = actorMgr:GetActor(q404Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(true, nil)
    end
end

function Quest404:OnSubStart40407(quest)
    print("40407 start: Spawn Key2")
    q404Cfg.gotKey = false
    actorMgr:CreateActorWithPos("GoalMarker404", "Actor/Gadget/GoalMarker404", 70300004, 0, q404Cfg.KeyPos2, q404Cfg.KeyDir2, false, false)
    self:ActionSafeCall(self.StartCount2)
end

function Quest404:OnSubStart40408(quest)
    print("OnStart40408")
    self:FailCount()
end

function Quest404:OnSubStart40410(quest)
    print("40410 start: fail the task")
    self:ActionSafeCall(self.BlackScreen)
    local quest = actorMgr:GetActor(q404Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(true, nil)
    end
end
--@endregion

--@region sub finish handlers
function Quest404:OnSubFinish40400(quest)
    print("OnFinished40400")
    self:ActionSafeCall(self.RunAmbor)   
end

function Quest404:OnSubFinish40401(quest)
	-- TODO: Do sth on sub quest 40401 finish
end

function Quest404:OnSubFinish40402(quest)
    print("OnFinished40402")
    self:SuccCount()
end

function Quest404:OnSubFinish40403(quest)
	-- TODO: Do sth on sub quest 40403 finish

end

function Quest404:OnSubFinish40404(quest)
	-- TODO: Do sth on sub quest 40404 finish

end

function Quest404:OnSubFinish40405(quest)
	-- TODO: Do sth on sub quest 40405 finish
end

function Quest404:OnSubFinish40407(quest)
    print("OnFinished40407")
    self:SuccCount()
end
--@endregion

function Quest404:Start()
end

function Quest404:OnDestroy()
end

return Quest404