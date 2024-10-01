--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 347, monster_id = 22010101, pos = { x = 1789.7, y = 245.3, z = -657.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 8, drop_id = 303142, isElite = true },
	{ config_id = 348, monster_id = 22010201, pos = { x = 1793.7, y = 245.9, z = -659.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 8, drop_id = 303142, isElite = true },
	{ config_id = 349, monster_id = 22010301, pos = { x = 1794.7, y = 246.0, z = -655.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 8, drop_id = 303142, isElite = true }
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
}

--================================================================
-- 
-- 初始化配置
-- 
--================================================================

-- 初始化时创建
init_config = {
	suite = 4,
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
		monsters = { 347 },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 110
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 348 },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 110
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { 349 },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 110
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================
