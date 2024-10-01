require('Actor/ActorCommon')
local quest413 = require('Actor/Quest/SQ413')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Barbara = class("Barbara", npcActorProxy)

Barbara.defaultAlias = "Barbara"

-- local config begin
local q413Cfg = require('Actor/Quest/Q413/Q413Config')
local barbaraData = q413Cfg.BarbaraData

function Barbara:PreGetAlias()
	local Barbara = barbaraData.Barbara
	return Barbara
end
-- local config end

-- local param begin
-- local param end

-- local method
function Barbara:StartBeFollow2()
	self:ClearFollowTask()
	self:BeFollowTask(sceneData:GetDummyPoint(3,"Q413BarbaraHide").pos, barbaraData.BeFollowLen, barbaraData.BeFollowFailedLen,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				print("babara follow2 failed")
				local quest = actorMgr:GetActor(q413Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				print("babara follow2 success")
				self:TurnTo(M.Euler2DirXZ(sceneData:GetDummyPoint(3,"Q413BarbaraHide").rot))
				self:Standby()
				local quest = actorMgr:GetActor(q413Cfg.ActorAlias)
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
function Barbara:StartBeFollow()
	self:ClearFollowTask()
	self:BeFollowTask(sceneData:GetDummyPoint(3,"Q413PastorBorn").pos, barbaraData.BeFollowLen, barbaraData.BeFollowFailedLen,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				print("babara follow1 failed")
				local quest = actorMgr:GetActor(q413Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				print("babara follow1 success")
				self:StartBeFollow2()
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
end

function Barbara:Vanish()
	self:ClearFollowTask()
	self:WalkToTask(q413Cfg.PastorData.bornPos, 
		function(self, task)
			self:Destroy(false)
		end
	)
end

function Barbara:VanishDungeon()
	self:ClearFollowTask()
	self:WalkToTask(q413Cfg.BarbaraData.vanishPos, 
		function(self, task)
			self:Destroy(false)
		end
	)
	-- self:Destroy(false)
end

function Barbara:StartLive()
	self:DoFreeStyle(0)
end

function Barbara:FinishLive()
	self:Standby()
end
-- local method end

function Barbara:Start()
	print("start!Barbara")	
end

function Barbara:OnDestroy()
	print("Barbara " .. barbaraData.BarbaraID .. " destroied")
end

return Barbara