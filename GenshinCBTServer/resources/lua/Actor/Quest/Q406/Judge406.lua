require('Actor/ActorCommon')
local quest406 = require('Actor/Quest/SQ406')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Judge406 = class("Judge406", npcActorProxy)

Judge406.defaultAlias = "Judge406"

-- local config begin
local q406Cfg = require('Actor/Quest/Q406/Q406Config')
local judgeData = q406Cfg.JudgeData
-- local config end

function Judge406:Start()

end


function Judge406:OnDestroy()
	print("judge " .. self.configID .. " destroied")
end

return Judge406