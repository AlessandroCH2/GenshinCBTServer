--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 8, monster_id = 21010601, pos = { x = 91.1, y = 2.0, z = -127.4 }, rot = { x = 0.0, y = 338.9, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 9, monster_id = 21010601, pos = { x = 92.7, y = 2.0, z = -101.9 }, rot = { x = 0.0, y = 200.1, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 10, monster_id = 21010601, pos = { x = 113.0, y = 4.0, z = -128.2 }, rot = { x = 0.0, y = 335.5, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 11, monster_id = 21010601, pos = { x = 115.3, y = 4.0, z = -102.1 }, rot = { x = 0.0, y = 246.5, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 12, monster_id = 21010601, pos = { x = 131.5, y = 9.0, z = -127.8 }, rot = { x = 0.0, y = 320.4, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 13, monster_id = 21010601, pos = { x = 131.4, y = 9.0, z = -102.1 }, rot = { x = 0.0, y = 226.5, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 78, monster_id = 21010701, pos = { x = 109.9, y = 0.9, z = -117.1 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 0 },
	{ config_id = 79, monster_id = 21010701, pos = { x = 110.0, y = -0.5, z = -115.0 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 0 },
	{ config_id = 80, monster_id = 21010701, pos = { x = 109.7, y = -0.5, z = -111.7 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 0 },
	{ config_id = 81, monster_id = 21010701, pos = { x = 107.3, y = -0.5, z = -118.7 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 0 },
	{ config_id = 82, monster_id = 21010701, pos = { x = 107.3, y = -0.5, z = -115.7 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 0 },
	{ config_id = 83, monster_id = 21010701, pos = { x = 107.5, y = -0.5, z = -112.4 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 8, gadget_id = 70220005, pos = { x = 84.3, y = -0.5, z = -117.5 }, rot = { x = 0.0, y = 170.1, z = 0.0 }, level = 1 },
	{ config_id = 9, gadget_id = 70220005, pos = { x = 106.3, y = -0.5, z = -112.0 }, rot = { x = 0.0, y = 245.7, z = 0.0 }, level = 1 },
	{ config_id = 10, gadget_id = 70220005, pos = { x = 130.9, y = -0.5, z = -114.9 }, rot = { x = 0.0, y = 154.8, z = 0.0 }, level = 1 },
	{ config_id = 105, gadget_id = 70220005, pos = { x = 118.3, y = -0.5, z = -116.5 }, rot = { x = 0.0, y = 237.6, z = 0.0 }, level = 1 },
	{ config_id = 106, gadget_id = 70220005, pos = { x = 93.5, y = -0.5, z = -117.6 }, rot = { x = 0.0, y = 125.4, z = 0.0 }, level = 1 },
	{ config_id = 107, gadget_id = 70220005, pos = { x = 106.6, y = -0.5, z = -116.7 }, rot = { x = 0.0, y = 113.1, z = 0.0 }, level = 1 }
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
		monsters = { 8, 9, 10, 11, 12, 13 },
		gadgets = { 8, 9, 10, 105, 106, 107 },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 78, 79, 80, 81, 82, 83 },
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
