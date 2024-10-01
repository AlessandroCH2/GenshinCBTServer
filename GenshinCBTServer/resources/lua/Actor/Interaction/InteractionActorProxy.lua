----------------------
-- 这是Lua端InteractionActorProxy的基类，包含一些全局控制函数。继承自SubGlobalActorProxy
-- @classmod InteractionActorProxy
local subGlobalActorProxy = require('Actor/SubGlobal/SubGlobalActorProxy')

local InteractionActorProxy = class("InteractionActorProxy", subGlobalActorProxy)

InteractionActorProxy.actorType = ActorType.INTERACTION_ACTOR

InteractionActorProxy.defaultAlias = "Interaction"

local super = nil

function InteractionActorProxy:OnPreInit()
	super = self.__super
	super:OnPreInit()
end

function InteractionActorProxy:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.INTERACTION_ACTOR, alias, self.metaPath)
	return uActor
end

--- InterActor当交互组开始时的回调
-- @tparam int interCnt 执行的InterGroup顺次，从1开始
function InteractionActorProxy:OnInterStart(interCnt)
	print("inter start cnt" .. tostring(interCnt))
end

--- InterActor当交互组结束时的回调
-- @tparam int interCnt 执行的InterGroup顺次，从1开始
function InteractionActorProxy:OnInterFinish(interCnt)
	print("inter finish cnt" .. tostring(interCnt))
end

function InteractionActorProxy:Register()
	self.uActor:RegisterStartInterCallback(self.OnInterStart)
	self.uActor:RegisterFinishInterCallback(self.OnInterFinish)
end

function InteractionActorProxy:Unregister()
	self.uActor:UnregisterStartInterCallback(self.OnInterStart)
	self.uActor:UnregisterStartInterCallback(self.OnInterFinish)
end

function InteractionActorProxy:Start()
end

return InteractionActorProxy