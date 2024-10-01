require('Actor/ActorCommon')
local quest352 = require('Actor/Quest/MQ352')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')
local Paimon = class("Paimon", npcActorProxy)
Paimon.defaultAlias = "Paimon"

-- local config begin
--local q351Cfg = require('Actor/Quest/Q351/Q351Config')
--local q352Cfg = require('Quest/Client/Q352ClientConfig')
-- local config end

function Paimon:TransPreCallBack(qCfg)
	print("TransPreCallBack")
	local avatarEular = self:GetEuler()
	self.uActor:SetAvatarEuler(avatarEular)
	self:AddPriorityInter(InterTimingType.BTN, qCfg.PlayerBackInter)	
	local quest = actorMgr:GetActor(qCfg.ActorAlias)
	quest:RequestInteraction(qCfg.PaimonData.Paimon)
	self:ActionSafeCall(function (actor)
		self:ClearPriorityInter(InterTimingType.BTN)
	end)
end

function Paimon:TransFinishCallBack(qCfg)
	print("TransFinishCallBack")
end

-- local method
--[[ function Paimon:FollowWater()
	print("FollowWater")
	self:ClearFollowTask()
	self:BeFollowTask(q352Cfg.ByWaterPos, q352Cfg.FollowLen, -1,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(q352Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				self:StopPerformNarrator()
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				self:Standby()
				self:TurnTo(M.Euler2DirXZ(q352Cfg.ByWaterDir))
				local quest = actorMgr:GetActor(q352Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(false, nil)
				end
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
	self:BeLockTask(q352Cfg.FollowTransLen, 1,
		function(self)		
			self:TransFinishCallBack(q352Cfg)
		end,
		function(self)
			self:TransPreCallBack(q352Cfg)
		end
	)
end

function Paimon:Follow3()
	print("Follow3")
	self:ClearFollowTask()
	self:BeFollowTask(q352Cfg.PaimonFollow3Pos, q352Cfg.FollowLen,-1,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(q352Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				self:StopPerformNarrator()
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				self:FollowWater()
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
	self:BeLockTask(q352Cfg.FollowTransLen, 1,
		function(self)		
			self:TransFinishCallBack(q352Cfg)
		end,
		function(self)
			self:TransPreCallBack(q352Cfg)
		end
	)
end

function Paimon:Follow2()
	print("Follow2")
	self:ClearFollowTask()
	self:BeFollowTask(q352Cfg.PaimonFollow2Pos, q352Cfg.FollowLen, -1,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(q352Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				self:StopPerformNarrator()
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				self:Follow3()
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
	self:BeLockTask(q352Cfg.FollowTransLen, 1,
		function(self)		
			self:TransFinishCallBack(q352Cfg)
		end,
		function(self)
			self:TransPreCallBack(q352Cfg)
		end
	)
end

function Paimon:Follow1()
	print("Follow1")
	self:ClearFollowTask()
	self:BeFollowTask(q352Cfg.PaimonFollow1Pos, q352Cfg.FollowLen, -1,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(q352Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				self:StopPerformNarrator()
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				self:Follow2()
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
	self:BeLockTask(q352Cfg.FollowTransLen, 1,
		function(self)		
			self:TransFinishCallBack(q352Cfg)
		end,
		function(self)
			self:TransPreCallBack(q352Cfg)
		end
	)
end

function Paimon:FirstStartFollow1()
	print("FirstStartFollow1")
	self:ClearFollowTask()
	--self:SwitchAirMode(true)
	self:BeFollowTask(q351Cfg.FirstStartFollow1Pos, q351Cfg.FollowLen, -1,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(q351Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				self:StopPerformNarrator()
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				self:FirstStartFollow2()
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
	self:BeLockTask(q351Cfg.FollowTransLen, 1,
		function(self)		
			self:TransFinishCallBack(q351Cfg)
		end,
		function(self)
			self:TransPreCallBack(q351Cfg)
		end
	)
end

function Paimon:FirstStartFollow2()
	print("FirstStartFollow2")
	self:ClearFollowTask()
	self:BeFollowTask(q351Cfg.FirstStartFollow2Pos, q351Cfg.FollowLen, -1,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(q351Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				self:StopPerformNarrator()
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				self:FirstStartFollow3()
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
	self:BeLockTask(q351Cfg.FollowTransLen, 1,
		function(self)		
			self:TransFinishCallBack(q351Cfg)
		end,
		function(self)
			self:TransPreCallBack(q351Cfg)
		end
	)
end

function Paimon:FirstStartFollow3()
	print("FirstStartFollow3")
	self:ClearFollowTask()
	self:AirModeOff()
	self:BeFollowTask(q351Cfg.FirstStartFollow3Pos, q351Cfg.FollowLen, -1,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(q351Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				self:StopPerformNarrator()
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				self:FirstStartFollowFinish()
			end
		end,
		function(self, task)
			self:Standby()
		end,
		nil
	)
	self:BeLockTask(q351Cfg.FollowTransLen, 1,
		function(self)		
			self:TransFinishCallBack(q351Cfg)
		end,
		function(self)
			self:TransPreCallBack(q351Cfg)
		end
	)
end

function Paimon:FirstStartFollowFinish()
	print("FirstStartFollowFinish")
	self:ClearFollowTask()
	self:BeFollowTask(q351Cfg.FirstClimbPos, q351Cfg.FollowLen, -1,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(q351Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				self:StopPerformNarrator()
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				self:DoFreeStyle(0)
				self:TurnTo(M.Euler2DirXZ(q351Cfg.FirstClimbDir))
				local quest = actorMgr:GetActor(q351Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(false, nil)
				end
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
	self:BeLockTask(q351Cfg.FollowTransLen, 1,
		function(self)
			self:TransFinishCallBack(q351Cfg)
		end,
		function(self)
			self:TransPreCallBack(q351Cfg)
		end
	)
end ]]

function Paimon:Vanish(task)
	self:Destroy(false)
end

function Paimon:VanishKeep(OnVanish)
	self:Disappear(OnVanish)
end

function Paimon:ByQueen()
	self:RunToTask(sceneData:GetDummyPoint(3,"Q352Queen").pos,
		function(self)
			self:AirModeOff()
			self:Standby()
			self:TurnTo(M.Euler2DirXZ(sceneData:GetDummyPoint(3,"Q352Queen").rot))
		end
	)
end

function Paimon:AirModeOn()
	self:SwitchAirMode(true)	
end

function Paimon:AirModeOff()
	self:SwitchAirMode(false)	
end

-- local method end

Paimon.TaskOnPauseReminder = 1001
Paimon.TaskOnResumeReminder = 1002

function Paimon:Start()
	print("start!Paimon")
	self:RegisterTaskCB()
end

function Paimon:OnDestroy()
	print("Paimon destroied")
	self:UnregisterTaskCB()
end


return Paimon