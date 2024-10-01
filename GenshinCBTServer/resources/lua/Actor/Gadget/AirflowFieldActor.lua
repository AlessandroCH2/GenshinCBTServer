require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local AirflowFieldActor = class("AirflowFieldActor", gadgetActorProxy)

function AirflowFieldActor:OnPostDataPrepare()
end

function AirflowFieldActor:OnPostComponentPrepare()
end

return AirflowFieldActor