require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local TempNpcActor = class("TempNpcActor", npcActorProxy)

TempNpcActor.defaultAlias = actorMgr.tempDefaultAlias

return TempNpcActor