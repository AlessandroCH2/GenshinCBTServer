require('Actor/ActorCommon')
local quest409 = require('Actor/Quest/SQ409')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local BallJudge = class("BallJudge", npcActorProxy)

BallJudge.defaultAlias = "BallJudge"

-- local config begin
local q409Cfg = require('Actor/Quest/Q409/Q409Config')
local BallJudgeData = q409Cfg.JudgeData

function BallJudge:PreGetAlias()
	local BallJudge = BallJudgeData.Judge
	return BallJudge
end
-- local config end

-- local param begin
-- local param end

-- local method

-- local method end

function BallJudge:Start()
	print("start!BallJudge")	
end

function BallJudge:OnDestroy()
	print("BallJudge " .. BallJudgeData.JudgeID .. " destroied")
end

return BallJudge