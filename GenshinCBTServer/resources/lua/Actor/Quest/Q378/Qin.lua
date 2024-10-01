require('Actor/ActorCommon')
local quest378 = require('Actor/Quest/MQ378')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')
local Qin = class("Qin", npcActorProxy)
Qin.defaultAlias = "Qin"

-- local config begin
local q378Cfg = require('Quest/Client/Q378ClientConfig')
local QinData = q378Cfg.QinData

function Qin:PreGetAlias()
	local Qin = QinData.Qin
	return Qin
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
	self:BeLockTask(q378Cfg.FollowTransLen, 1,
		function(self)
			self:TransFinishCallBack(q378Cfg)
		end,
		function(self)
			self:TransPreCallBack(q378Cfg)
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