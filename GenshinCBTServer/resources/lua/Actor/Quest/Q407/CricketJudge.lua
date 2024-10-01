require('Actor/ActorCommon')
local quest407 = require('Actor/Quest/SQ407')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local CricketJudge = class("CricketJudge", npcActorProxy)

CricketJudge.defaultAlias = "CricketJudge"

-- local config begin
local q407Cfg = require('Actor/Quest/Q407/Q407Config')
local CricketJudgeData = q407Cfg.JudgeData

function CricketJudge:PreGetAlias()
	local CricketJudge = CricketJudgeData.Judge
	return CricketJudge
end
-- local config end

-- local param begin
-- local param end

-- local method

-- local method end

function CricketJudge:Start()
	print("start!CricketJudge")	
end

function CricketJudge:OnDestroy()
	print("CricketJudge " .. CricketJudgeData.JudgeID .. " destroied")
end

return CricketJudge