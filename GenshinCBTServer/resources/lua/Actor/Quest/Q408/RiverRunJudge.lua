require('Actor/ActorCommon')
local quest408 = require('Actor/Quest/SQ408')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local RiverRunJudge = class("RiverRunJudge", npcActorProxy)

RiverRunJudge.defaultAlias = "RiverRunJudge"

-- local config begin
local q408Cfg = require('Actor/Quest/Q408/Q408Config')
local RiverRunJudgeData = q408Cfg.JudgeData

function RiverRunJudge:PreGetAlias()
	local RiverRunJudge = RiverRunJudgeData.Judge
	return RiverRunJudge
end
-- local config end

-- local param begin
-- local param end

-- local method

-- local method end

function RiverRunJudge:Start()
	print("start!RiverRunJudge")	
end

function RiverRunJudge:OnDestroy()
	print("RiverRunJudge " .. RiverRunJudgeData.JudgeID .. " destroied")
end

return RiverRunJudge