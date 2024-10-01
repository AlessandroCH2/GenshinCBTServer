require('Actor/ActorCommon')
local quest413 = require('Actor/Quest/SQ413')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Pastor = class("Pastor", npcActorProxy)

Pastor.defaultAlias = "Pastor"

-- local config begin
local q413Cfg = require('Actor/Quest/Q413/Q413Config')
local pastorData = q413Cfg.PastorData

function Pastor:PreGetAlias()
	local Pastor = pastorData.Pastor
	return Pastor
end
-- local config end

-- local param begin
-- local param end

-- local method
function Pastor:Show()
	self:ClearFollowTask()
	self:WalkToTask(pastorData.showPos, 
		function(self, task)
			local quest = actorMgr:GetActor(q413Cfg.ActorAlias)
			if quest ~= nil then
				quest:FinishQuest(false, nil)
			end
			self:TurnTo(M.Euler2DirXZ(pastorData.showDir))
			self:Standby()
		end
	)
end

function Pastor:Vanish()
	self:ClearFollowTask()
	self:WalkToTask(pastorData.bornPos, 
		function(self, task)
			self:Destroy(false)
		end
	)
end
-- local method end

function Pastor:Start()
	print("start!Pastor")	
end

function Pastor:OnDestroy()
	print("Pastor " .. pastorData.PastorID .. " destroied")
end

return Pastor