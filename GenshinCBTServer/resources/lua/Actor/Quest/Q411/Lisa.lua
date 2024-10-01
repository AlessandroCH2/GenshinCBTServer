require('Actor/ActorCommon')
local quest411 = require('Actor/Quest/SQ411')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Lisa = class("Lisa", npcActorProxy)

Lisa.defaultAlias = "Lisa"

-- local config begin
local q411Cfg = require('Actor/Quest/Q411/Q411Config')
local LisaData = q411Cfg.LisaData

function Lisa:PreGetAlias()
	local Lisa = LisaData.Lisa
	return Lisa
end
-- local config end

-- local param begin
-- local param end

-- local method

-- local method end

function Lisa:Start()
	print("start!Lisa")	
end

function Lisa:OnDestroy()
	print("Lisa " .. LisaData.LisaID .. " destroied")
end

return Lisa