require('Actor/ActorCommon')
local quest301 = require('Actor/Quest/MQ301')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Ambor301 = class("Ambor301", npcActorProxy)

Ambor301.defaultAlias = "Ambor"

-- local config begin
local q301Cfg = require('Actor/Quest/Q301/Config/Q301Config')
local amborData = q301Cfg.AmborData
-- local config end

function Ambor301:Start()
	print("start!Ambor301")
	
end

function Ambor301:ShowStart()
	print("Ambor301:ShowStart")
	self:SetPos(amborData.bornPos)
	self:RunToTask(amborData.arguePos, 
		function(self, task)
			self:TurnTo(M.Euler2DirXZ(amborData.argueDir))
			self:Standby()
		end
	)
end

function Ambor301:Vanish()
	print("Ambor301:Vanish()")
	self:RunToTask(amborData.vanishPos, 
		function(self, task)
			self:Destroy(false)
		end
	)
end

function Ambor301:VanishDirect(task)
	print("Ambor301:VanishDirect()")
	self:Destroy(false)
end

function Ambor301:OnDestroy()
	print("ambor " .. self.configID .. " destroied")
end

return Ambor301