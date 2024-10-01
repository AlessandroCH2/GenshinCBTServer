require('Actor/ActorCommon')
local interactionActorProxy = require('Actor/Interaction/InteractionActorProxy')

local TestInteractionActor = class("TestInteractionActor", interactionActorProxy)

function InteractionActorProxy:OnInterStart(interCnt)
end

return TestInteractionActor