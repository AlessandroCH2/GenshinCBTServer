require('Actor/ActorCommon')
local quest411 = require('Actor/Quest/SQ411')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Qin = class("Qin", npcActorProxy)

Qin.defaultAlias = "Qin"

-- local config begin
local q411Cfg = require('Actor/Quest/Q411/Q411Config')
local q378Cfg = require('Quest/Client/Q378ClientConfig')
local QinData = q411Cfg.QinData

function Qin:PreGetAlias()
	local Qin = QinData.Qin
	return Qin
end
-- local config end

-- local param begin
-- local param end

-- local method
function Qin:RunToMerchant()
	self:ClearFollowTask()
	self:RunToTask(sceneData:GetDummyPoint(3, "Q411QinBuyMusic").pos, 
		function(self, task)
			self:TurnTo(M.Euler2DirXZ(sceneData:GetDummyPoint(3, "Q411QinBuyMusic").rot))
			self:Standby()
		end
	)
end

function Qin:RunToWatchSunRise()
	self:ClearFollowTask()
	self:RunToTask(sceneData:GetDummyPoint(3, "Q411QinWatchSunRise").pos, 
		function(self, task)
			self:TurnTo(M.Euler2DirXZ(sceneData:GetDummyPoint(3, "Q411QinWatchSunRise").rot))
			self:Standby()
		end
	)
end

function Qin:TransPreCallBack(qCfg)
	print("TransPreCallBack")
	local avatarEular = self:GetEuler()
	self.uActor:SetAvatarEuler(avatarEular)
	self:AddPriorityInter(InterTimingType.BTN, qCfg.PlayerBackInter)	
	local quest = actorMgr:GetActor(qCfg.ActorAlias)
	quest:RequestInteraction(qCfg.QinData.Qin)
	self:ActionSafeCall(function (actor)
		self:ClearPriorityInter(InterTimingType.BTN)
	end)
end

function Qin:TransFinishCallBack(qCfg)
	print("TransFinishCallBack")
end

-- local config end

-- local param begin
-- local param end

-- local method
function Qin:WalkFollow()
	print("WalkFollow")
	self:ClearFollowTask()
	self:BeFollowTask(q378Cfg.QinData.followPos1, q378Cfg.FollowLen, -1,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(q378Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				self:StopNarrator()
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				self:WalkFollow2()
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
	-- self:BeLockTask(q378Cfg.FollowTransLen, 1,
	-- 	function(self)
	-- 		self:TransFinishCallBack(q378Cfg)
	-- 	end,
	-- 	function(self)
	-- 		self:TransPreCallBack(q378Cfg)
	-- 	end
	-- )
end

function Qin:WalkFollow2()
	print("WalkFollow")
	self:ClearFollowTask()
	self:BeFollowTask(q378Cfg.QinData.followPos2, q378Cfg.FollowLen, -1,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(q378Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				self:StopNarrator()
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				self:WalkFollow3()
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
end

function Qin:WalkFollow3()
	print("WalkFollow")
	self:ClearFollowTask()
	self:BeFollowTask(q378Cfg.QinData.followPos3, q378Cfg.FollowLen, -1,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(q378Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				self:StopNarrator()
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				self:WalkFollow4()
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
end

function Qin:WalkFollow4()
	print("WalkFollow")
	self:ClearFollowTask()
	self:BeFollowTask(q378Cfg.QinData.bornPos2, q378Cfg.FollowLen, -1,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(q378Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				self:StopNarrator()
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				self:TurnTo(M.Euler2DirXZ(q378Cfg.QinData.bornDir2))
				local quest = actorMgr:GetActor(q378Cfg.ActorAlias)
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

-- local method end

function Qin:Start()
	print("start!Qin")
	--self:SetPos(QinData.bornPos)
	-- self:StartDance()
	-- self:CallDelay(10, self.FinishDance)
end

function Qin:OnDestroy()
	print("Qin " .. QinData.QinID .. " destroied")
end

return Qin