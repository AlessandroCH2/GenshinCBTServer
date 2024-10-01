require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')
local Gaia301 = class("Gaia301", npcActorProxy)

local q301Cfg = require('Actor/Quest/Q301/Config/Q301Config')
local gaiaData = q301Cfg.GaiaData

Gaia301.defaultAlias = "Gaia"

-- local method
function Gaia301:StartBeFollow1()
	self:ClearFollowTask()
	self:BeFollowTask(gaiaData.firstPos, gaiaData.BeFollowLen, gaiaData.BeFollowFailedLen,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(q301Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				--self:Destroy(false)
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				self:TurnTo(M.Euler2DirXZ(gaiaData.bornDir))
				self:Standby()
				local quest = actorMgr:GetActor(q301Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(false, nil)
				end
				self:CheckNpcTalk()
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
end

function Gaia301:Sleep()
	self:DoFreeStyle(1)
end

function Gaia301:OnSleep()
	print("OnSleep")
	self:ClearFollowTask()
	local task = self:CreateTask(TaskID.MOVE_TASK_ID, LuaTaskType.NORMAL)
	task:StartEvent('+',self.Sleep)
	task:PauseEvent('+', self.Sleep)
	task:ResumeEvent('+', self.Sleep)
	task:FinishEvent('+', self.Sleep)
end

function Gaia301:StartBeFollow2()
	self:ClearFollowTask()
	self:BeFollowTask(gaiaData.secondPos, gaiaData.BeFollowLen, gaiaData.BeFollowFailedLen,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(q301Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				--self:Destroy(false)
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				self:TurnTo(M.Euler2DirXZ(gaiaData.bornDir))
				self:OnSleep()
				local quest = actorMgr:GetActor(q301Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(false, nil)
				end
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
end

function Gaia301:StartBeFollow5()
	print("GaiaFollow5")
	self:ClearFollowTask()
	self:BeFollowTask(gaiaData.fifthPos, gaiaData.BeFollowLen, gaiaData.BeFollowFailedLen,
	    function(self, task)
		    if self.BeFollowState == BeFollowState.FAILED then
			    local quest = actorMgr:GetActor(q301Cfg.ActorAlias)
			    if quest ~= nil then
				    quest:FinishQuest(true, nil)
			    end
		    elseif self.BeFollowState == BeFollowState.SUCCESS then
			    self:StartBeFollow3()
		    end
	    end,
	    function(self, task)
		    self:Standby()
	    end
    )
end

function Gaia301:StartBeFollow3()
	self:ClearFollowTask()
	self:BeFollowTask(gaiaData.thirdPos, gaiaData.BeFollowLen, gaiaData.BeFollowFailedLen,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(q301Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				--self:Destroy(false)
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				self:TurnTo(M.Euler2DirXZ(gaiaData.bornDir))
				self:Standby()
				local quest = actorMgr:GetActor(q301Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(false, nil)
				end
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
end

function Gaia301:StartBeFollow6()
	print("GaiaFollow5")
	self:ClearFollowTask()
	self:BeFollowTask(gaiaData.sixthPos, gaiaData.BeFollowLen, gaiaData.BeFollowFailedLen,
	    function(self, task)
		    if self.BeFollowState == BeFollowState.FAILED then
			    local quest = actorMgr:GetActor(q301Cfg.ActorAlias)
			    if quest ~= nil then
				    quest:FinishQuest(true, nil)
			    end
		    elseif self.BeFollowState == BeFollowState.SUCCESS then
			    self:StartBeFollow4()
		    end
	    end,
	    function(self, task)
		    self:Standby()
	    end
    )
end

function Gaia301:StartBeFollow4()
	self:ClearFollowTask()
	self:BeFollowTask(gaiaData.fourthPos, gaiaData.BeFollowLen, gaiaData.BeFollowFailedLen,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(q301Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				--self:Destroy(false)
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				self:TurnTo(M.Euler2DirXZ(gaiaData.bornDir))
				self:Standby()
				local quest = actorMgr:GetActor(q301Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(false, nil)
				end
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
end

function Gaia301:Show()
	self:ClearFollowTask()
	self:WalkToTask(gaiaData.showPos, 
		function(self, task)
			local quest = actorMgr:GetActor(q301Cfg.ActorAlias)
			if quest ~= nil then
				quest:FinishQuest(false, nil)
			end
			self:TurnTo(M.Euler2DirXZ(gaiaData.showDir))
			self:Standby()
		end
	)
end
-- local method end

function Gaia301:Start()

end

return Gaia301