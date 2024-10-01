require('Actor/ActorCommon')
local quest402 = require('Actor/Quest/SQ402')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')
local Hostage = class("Hostage", npcActorProxy)
Hostage.defaultAlias = "Hostage"

-- local config begin
local q402Cfg = require('Actor/Quest/Q402/Q402Config')

-- local config end

-- local method
function Hostage:Escape()
	print("escape Hostage")
	self:RunToTask(q402Cfg.Follow1Pos, 
		function(self, task)
			local quest = actorMgr:GetActor(q402Cfg.ActorAlias)
			if quest ~= nil then
				quest:FinishQuest(false, nil)
			end
			self:Destroy(false)
		end
	)

end
function Hostage:Rescue()
	print("rescue Hostage")
	self:DoFreeStyle(1)
end
-- local method end

function Hostage:Start()
	print("start!Hostage")
	self:SetPos(q402Cfg.HostagePos)
	self:DoFreeStyle(3)
end

function Hostage:OnDestroy()
	print("wendy " .. self.configID .. " destroied")
end

return Hostage