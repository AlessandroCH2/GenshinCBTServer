require('Actor/ActorCommon')
local quest410 = require('Actor/Quest/SQ410')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Soldier = class("Soldier", npcActorProxy)

Soldier.defaultAlias = "Soldier"

-- local config begin
local q410Cfg = require('Actor/Quest/Q410/Q410Config')
local SoldierData = q410Cfg.SoldierData

function Soldier:PreGetAlias()
	local Soldier = SoldierData.Soldier
	return Soldier
end
-- local config end

-- local param begin
-- local param end

-- local method

-- local method end

function Soldier:Start()
	print("start!Soldier")	
end

function Soldier:OnDestroy()
	print("Soldier " .. SoldierData.SoldierID .. " destroied")
end

return Soldier