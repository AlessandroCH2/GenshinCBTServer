require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Soldier = class("Soldier", npcActorProxy)

Soldier.defaultAlias = "Soldier"

-- local config begin
local q413Cfg = require('Actor/Quest/Q413/Q413Config')
local soldierData = q413Cfg.SoldierData

-- function Soldier:PreGetAlias()
-- 	-- local extraAlias = soldierData.Soldier .. tostring(self.dataIndex)
-- 	-- return extraAlias
-- end

-- local config end



-- local method begin

-- local method end

function Soldier:OnPostDataPrepare()
	self.soldierIndex = self.dataIndex
end

function Soldier:Start()
end

function Soldier:OnDestroy()
end

return Soldier