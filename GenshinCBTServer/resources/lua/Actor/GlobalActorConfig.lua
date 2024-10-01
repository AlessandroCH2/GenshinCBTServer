---GlobalActor全局配置
-- @module GlobalActorConfig

local GlobalActorConfig = {}

GlobalActorConfig.initSubActors =
{
	{
		alias = "WindTestGlobal11",
		metaPath = "Actor/SubGlobal/WindTestGlobalActor",
	},
	{
		alias = "LimitRegionGlobal",
		metaPath = "Actor/SubGlobal/LimitRegionGlobalActor",
	}
}

GlobalActorConfig.initAddSubActors =
{
}

return GlobalActorConfig