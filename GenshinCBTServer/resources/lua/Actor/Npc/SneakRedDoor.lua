require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local SneakRedDoor = class("SneakRedDoor", npcActorProxy)

SneakRedDoor.defaultAlias = "SneakRedDoor"

function SneakRedDoor:Start()

end

return SneakRedDoor