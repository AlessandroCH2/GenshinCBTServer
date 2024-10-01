require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local TempNPC = class("TempNPC", npcActorProxy)

TempNPC.defaultAlias = "TempNPC"

function TempNPC:Start()

end

return TempNPC