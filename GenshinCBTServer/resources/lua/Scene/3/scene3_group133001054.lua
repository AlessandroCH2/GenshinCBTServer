--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
}

-- 触发器
triggers = {
}

-- 变量
variables = {
	{ name = "TriggerState_20", value = 1, persistent = true },
	{ name = "TriggerState_21", value = 1, persistent = true },
	{ name = "TriggerState_22", value = 1, persistent = true },
	{ name = "TriggerState_23", value = 1, persistent = true },
	{ name = "TriggerState_24", value = 1, persistent = true },
	{ name = "TriggerState_25", value = 1, persistent = true }
}

--================================================================
-- 
-- 初始化配置
-- 
--================================================================

-- 初始化时创建
init_config = {
	suite = 1,
	rand_suite = true,
	npcs = { }
}

--================================================================
-- 
-- 小组配置
-- 
--================================================================

suites = {
	{
		-- suite_id = 0,
		-- description = ,
		monsters = { },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================
