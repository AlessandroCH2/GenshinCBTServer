--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1, monster_id = 21010501, pos = { x = -33.0, y = 0.6, z = 0.1 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 0, disableWander = true, pose_id = 32 },
	{ config_id = 2, monster_id = 21010501, pos = { x = -33.0, y = 0.6, z = 6.1 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 0, disableWander = true, pose_id = 32 },
	{ config_id = 3, monster_id = 21010501, pos = { x = -4.7, y = 0.6, z = -5.5 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 0, disableWander = true, pose_id = 32 },
	{ config_id = 4, monster_id = 21010501, pos = { x = -4.4, y = 0.6, z = 0.0 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 0, disableWander = true, pose_id = 32 },
	{ config_id = 5, monster_id = 21010501, pos = { x = -4.5, y = 0.6, z = 5.4 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 0, disableWander = true, pose_id = 32 },
	{ config_id = 6, monster_id = 21010501, pos = { x = -32.6, y = 0.6, z = -6.2 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 0, disableWander = true, pose_id = 32 },
	{ config_id = 7, monster_id = 22010301, pos = { x = 17.5, y = 7.2, z = 8.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 8, monster_id = 21010901, pos = { x = 29.1, y = 4.5, z = 8.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true, pose_id = 32 },
	{ config_id = 9, monster_id = 21010601, pos = { x = 20.4, y = 5.4, z = -8.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true, pose_id = 32 },
	{ config_id = 10, monster_id = 21011001, pos = { x = -1.2, y = 7.2, z = -7.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true, pose_id = 32 },
	{ config_id = 11, monster_id = 21011001, pos = { x = -1.7, y = 7.2, z = 8.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true, pose_id = 32 }
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
		monsters = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 },
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
