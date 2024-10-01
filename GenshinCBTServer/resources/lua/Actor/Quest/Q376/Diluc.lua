require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Diluc = class("Diluc", npcActorProxy)

Diluc.defaultAlias = "Diluc"

function Diluc:Start()

end

return Diluc