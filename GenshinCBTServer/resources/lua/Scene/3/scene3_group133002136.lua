--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 360, monster_id = 20010801, pos = { x = 1751.3, y = 229.9, z = -598.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042 },
	{ config_id = 361, monster_id = 20010801, pos = { x = 1746.6, y = 227.9, z = -590.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042 },
	{ config_id = 362, monster_id = 20010801, pos = { x = 1714.8, y = 233.8, z = -598.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042 },
	{ config_id = 363, monster_id = 20011501, pos = { x = 1747.5, y = 232.8, z = -615.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303043, isElite = true },
	{ config_id = 364, monster_id = 20011501, pos = { x = 1711.3, y = 234.9, z = -602.5 }, rot = { x = 0.0, y = 80.4, z = 0.0 }, level = 7, drop_id = 303043, isElite = true },
	{ config_id = 369, monster_id = 28050101, pos = { x = 1757.8, y = 231.9, z = -601.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9 },
	{ config_id = 372, monster_id = 28050101, pos = { x = 1723.9, y = 230.2, z = -588.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9 },
	{ config_id = 374, monster_id = 28050101, pos = { x = 1716.9, y = 233.0, z = -590.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9 },
	{ config_id = 375, monster_id = 28050101, pos = { x = 1746.3, y = 231.1, z = -606.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9 }
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
		monsters = { 360, 361, 362, 374, 375 },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 363, 372 },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { 364 },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_4,
		monsters = { 369 },
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
