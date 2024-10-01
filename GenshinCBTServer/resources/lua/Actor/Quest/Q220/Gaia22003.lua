require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')
local Gaia22003 = class("Gaia22003", npcActorProxy)

local q220Cfg = require('Actor/Quest/Q220/Config/Q220Config')
local gaiaData = q220Cfg.GaiaData

Gaia22003.defaultAlias = "Gaia22003"

-- local method
function Gaia22003:StartBeFollow()
	self:BeFollowTask(gaiaData.FirstPos, gaiaData.BeFollowLen, gaiaData.BeFollowFailedLen,
		function(self, task)
			if self.BeFollowState == BeFollowState.FAILED then
				local quest = actorMgr:GetActor(q220Cfg.ActorAlias)
				if quest ~= nil then
					quest:FinishQuest(true, nil)
				end
				self:Destroy(false)
			elseif self.BeFollowState == BeFollowState.SUCCESS then
				self:TurnTo(M.Euler2DirXZ(gaiaData.bornDir))
				self:Standby()
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
end
-- local method end

function Gaia22003:Start()
	print("start!gaia22003")
	self:StartBeFollow()
	--self:SetPos(M.Pos(1428, 56.4, 176))
end

return Gaia22003