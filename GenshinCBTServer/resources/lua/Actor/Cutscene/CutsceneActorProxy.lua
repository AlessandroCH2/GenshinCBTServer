----------------------
-- 这是Lua端CutsceneActorProxy的基类，包含一些全局控制函数。继承自SubGlobalActorProxy
-- @classmod CutsceneActorProxy
require('Actor/ActorCommon')
local subGlobalActorProxy = require('Actor/SubGlobal/SubGlobalActorProxy')

local CutsceneActorProxy = class("CutsceneActorProxy", subGlobalActorProxy)

CutsceneActorProxy.actorType = ActorType.CUTSCENE_ACTOR

--- SubGlobalActorProxy alias
CutsceneActorProxy.defaultAlias = "Cutscene"

local super = nil

function CutsceneActorProxy:OnPreInit()
	super = self.__super
	super:OnPreInit()
end

function CutsceneActorProxy:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.CUTSCENE_ACTOR, alias, self.metaPath)
	return uActor
end

function CutsceneActorProxy:Start()
end

return CutsceneActorProxy