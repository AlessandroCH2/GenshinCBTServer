require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local SneakBlackDoor = class("SneakBlackDoor", npcActorProxy)

SneakBlackDoor.defaultAlias = "SneakBlackDoor"

function SneakBlackDoor:Start()

end

return SneakBlackDoor