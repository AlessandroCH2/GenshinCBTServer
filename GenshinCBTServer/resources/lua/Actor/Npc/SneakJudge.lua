require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local SneakJudge = class("SneakJudge", npcActorProxy)

SneakJudge.defaultAlias = "SneakJudge"

function SneakJudge:Start()

end

return SneakJudge