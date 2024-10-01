require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest378 = class("Quest378", questActorProxy)

Quest378.defaultAlias = "Quest378"

local q378Cfg = require('Quest/Client/Q378ClientConfig')

local bbrData = q378Cfg.BarbaraData
local qinData = q378Cfg.QinData

-- Generated
function Quest378:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["37801"] = self.OnSubStart37801
    self.subStartHandlers["37802"] = self.OnSubStart37802    
    self.subStartHandlers["37803"] = self.OnSubStart37803    
    self.subStartHandlers["37804"] = self.OnSubStart37804  
    self.subStartHandlers["37805"] = self.OnSubStart37805  
end

function Quest378:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["37801"] = self.OnSubFinish37801
    self.subFinishHandlers["37802"] = self.OnSubFinish37802
    self.subFinishHandlers["37803"] = self.OnSubFinish37803
    self.subFinishHandlers["37804"] = self.OnSubFinish37804
    self.subFinishHandlers["37805"] = self.OnSubFinish37805
end

-- local param begin

Quest378.warningTask = nil
Quest378.stayWarningTask = nil

-- local param end

-- local method begin
--@region sub start handlers

function Quest378:OnSubStart37801(quest)  
    print("37801 start")
end

function Quest378:OnSubStart37802(quest)  
    print("37802 start")
    actorMgr:CreateActorWithPos("Q378Trigger", "Actor/Gadget/Q378Trigger", 70900002, 0, qinData.bornPos1, qinData.bornDir1, true)
end

function Quest378:OnSubStart37803(quest)  
    print("37803 start ")
    if self.warningTask ~= nil then
		self.warningTask:FinishTask()
	end
	if self.stayWarningTask ~= nil then
		self.stayWarningTask:FinishTask()
	end
end

function Quest378:OnSubStart37804(quest)
    actorMgr:CreateActorWithPos(bbrData.Barbara, bbrData.BarbaraScript, bbrData.BarbaraID, 0, bbrData.bornPos, bbrData.bornDir, true)  
    print("37804 start:...")
    local qin = actorMgr:GetActor(qinData.Qin)
    if qin ~= nil then
        qin:NarratorTask(q378Cfg.NarratorFlow, q378Cfg.FollowLen, q378Cfg.FollowLen, nil)
-------------------------------------------------------------------------------------------------
        qin:BeFollowTaskByRoutePoints(q378Cfg.RoutePoints, q378Cfg.FollowLen, q378Cfg.FailLen,
        function(self, task)
            if self.BeFollowState == BeFollowState.FAILED then
                local quest = actorMgr:GetActor(q378Cfg.ActorAlias)
                if quest ~= nil then
                    quest:FinishQuest(true, nil)
                    print("37804 Follow UnFinish...")
                end
                self:StopPerformNarrator()
            elseif self.BeFollowState == BeFollowState.SUCCESS then
                self:Standby()
				self:TurnTo(M.Euler2DirXZ(q378Cfg.QinData.bornDir2))
				local quest = actorMgr:GetActor(q378Cfg.ActorAlias)
				if quest ~= nil then
                    quest:FinishQuest(false, nil)
                    print("37804 Follow Success...")
				end
            end
        end,
        function(self, task)
            self:Standby()
        end, 
        nil, nil, nil, 
        function(self, task)
            local quest = actorMgr:GetActor(q378Cfg.ActorAlias)
            if quest ~= nil then
                print("37804 Follow Failed...")
                quest:FinishQuest(true, nil)
            end
        end
        )

        self.stayWarningTask = qin:WarningNarratorTask(0, q378Cfg.NarratorStayWarning, function(self)
            local selfPos = self:GetPos()
            local avatarPos = actorUtils.GetAvatarPos()
            local currLen = M.Dist(selfPos, avatarPos)
            return currLen > q378Cfg.FollowLen + 5 and currLen <= q378Cfg.FollowLen + 15 and qin:IsInIdle()
        end, nil, "StoryWarning")
        self.warningTask = qin:WarningNarratorTask(1, q378Cfg.NarratorWarning, function(self)
            local selfPos = self:GetPos()
            local avatarPos = actorUtils.GetAvatarPos()
            local currLen = M.Dist(selfPos, avatarPos)
            return currLen > q378Cfg.FollowLen + 15 and currLen <= q378Cfg.FollowLen + 1000
        end, nil, "StoryWarning")
    end
end

function Quest378:OnSubStart37805(quest)
    print("37805 start:...")
end


--@endregion

--@region sub finish handlers

function Quest378:OnSubFinish37801(quest)
    print("OnFinished 37801")
end

function Quest378:OnSubFinish37802(quest)
    print("OnFinished 37802")
    self:ShowBlackScreen(1.0, 0.5, 0.0, self.CreateQin, self.Interaction) 
    local q378Trigger = actorMgr:GetActor("Q378Trigger")
    if q378Trigger ~= nil then
        q378Trigger:Destroy(false)
    end
end

function Quest378:OnSubFinish37803(quest)
    print("OnFinished 37803")
end

function Quest378:OnSubFinish37804(quest)
    print("OnFinished 37804")
    if self.warningTask ~= nil then
		self.warningTask:FinishTask()
	end
	if self.stayWarningTask ~= nil then
		self.stayWarningTask:FinishTask()
	end
end

function Quest378:OnSubFinish37805(quest)
    print("OnFinished 37805")
    self:ActionSafeCall(
        function(self)
            local paimon = actorMgr:GetActor("Paimon")
            if paimon ~= nil then
                paimon:DestroyWithDisappear(false)
            end
        end
    )
    -- self:ActionSafeCall(
    --     function(self)
    --         local qin = actorMgr:GetActor(qinData.Qin)
    --         if qin ~= nil then
    --             qin:Destroy(false)
    --         end
    --     end
    -- )
    -- self:ActionSafeCall(
    --     function(self)
    --         local bbr = actorMgr:GetActor(bbrData.Barbara)
    --         if bbr ~= nil then
    --             bbr:Destroy(false)
    --         end
    --     end
    -- )
end

function Quest378:CreateQin()
    actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos1, qinData.bornDir1, true)  
    print("Qin Born")
end

function Quest378:Interaction()
    self:RequestInteraction(qinData.Qin)
    print("Black Callback NOW")
end
--@endregion

function Quest378:Start()
end

function Quest378:OnDestroy()
end

return Quest378