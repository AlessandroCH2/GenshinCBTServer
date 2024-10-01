require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Soldier = class("Soldier", npcActorProxy)

Soldier.defaultAlias = "Soldier"

function Soldier:Start()

end

return Soldier