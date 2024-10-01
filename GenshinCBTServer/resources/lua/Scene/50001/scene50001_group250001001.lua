--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1, monster_id = 21011001, pos = { x = 22.0, y = 52.7, z = 30.4 }, rot = { x = 0.0, y = 274.6, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 2, monster_id = 21010501, pos = { x = 26.4, y = 52.8, z = 36.5 }, rot = { x = 0.0, y = 266.7, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 31, monster_id = 21010301, pos = { x = 17.8, y = 51.0, z = 34.1 }, rot = { x = 0.0, y = 125.1, z = 0.0 }, level = 0, disableWander = true, affix = { 1001 }, isElite = true, pose_id = 9003 },
	{ config_id = 32, monster_id = 21010501, pos = { x = 19.4, y = 51.0, z = 62.5 }, rot = { x = 0.0, y = 182.4, z = 0.0 }, level = 0, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1, gadget_id = 70210011, pos = { x = -3.9, y = 53.0, z = 36.3 }, rot = { x = 0.0, y = 93.1, z = 0.0 }, level = 1, chest_drop_id = 1300401, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 26, gadget_id = 70220013, pos = { x = 22.5, y = 51.0, z = 30.2 }, rot = { x = 0.0, y = 249.3, z = 0.0 }, level = 1 },
	{ config_id = 27, gadget_id = 70220013, pos = { x = 27.1, y = 51.0, z = 36.4 }, rot = { x = 0.0, y = 126.5, z = 0.0 }, level = 1 },
	{ config_id = 41, gadget_id = 70220013, pos = { x = 22.9, y = 51.0, z = 28.6 }, rot = { x = 0.0, y = 107.6, z = 0.0 }, level = 1 },
	{ config_id = 42, gadget_id = 70220013, pos = { x = 20.4, y = 51.0, z = 29.2 }, rot = { x = 0.0, y = 142.6, z = 0.0 }, level = 1 },
	{ config_id = 43, gadget_id = 70220013, pos = { x = 25.8, y = 50.9, z = 35.1 }, rot = { x = 0.0, y = 264.7, z = 0.0 }, level = 1 },
	{ config_id = 44, gadget_id = 70220014, pos = { x = 25.7, y = 50.8, z = 37.0 }, rot = { x = 0.0, y = 130.9, z = 0.0 }, level = 1 },
	{ config_id = 45, gadget_id = 70210011, pos = { x = 15.2, y = 47.0, z = 50.3 }, rot = { x = 0.0, y = 356.6, z = 0.0 }, level = 1, chest_drop_id = 1300401, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 47, gadget_id = 70210021, pos = { x = 10.2, y = 47.0, z = 69.4 }, rot = { x = 0.0, y = 179.1, z = 0.0 }, level = 1, chest_drop_id = 1300402, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 48, gadget_id = 70220013, pos = { x = 8.2, y = 47.0, z = 69.6 }, rot = { x = 0.0, y = 21.9, z = 0.0 }, level = 1 },
	{ config_id = 49, gadget_id = 70220013, pos = { x = 7.0, y = 47.0, z = 67.6 }, rot = { x = 0.0, y = 349.8, z = 0.0 }, level = 1 },
	{ config_id = 50, gadget_id = 70220013, pos = { x = 9.3, y = 47.0, z = 67.3 }, rot = { x = 0.0, y = 102.2, z = 0.0 }, level = 1 },
	{ config_id = 51, gadget_id = 70220013, pos = { x = 15.2, y = 47.1, z = 52.6 }, rot = { x = 0.0, y = 18.3, z = 0.0 }, level = 1 },
	{ config_id = 52, gadget_id = 70220013, pos = { x = 12.9, y = 47.1, z = 53.3 }, rot = { x = 0.0, y = 354.4, z = 0.0 }, level = 1 },
	{ config_id = 53, gadget_id = 70220013, pos = { x = 10.4, y = 47.1, z = 52.4 }, rot = { x = 0.0, y = 245.0, z = 0.0 }, level = 1 },
	{ config_id = 54, gadget_id = 70220014, pos = { x = 10.9, y = 47.1, z = 54.0 }, rot = { x = 0.0, y = 119.5, z = 0.0 }, level = 1 }
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
		-- description = suite_1,
		monsters = { 1, 2, 31, 32 },
		gadgets = { 1, 26, 27, 41, 42, 43, 44, 45, 47, 48, 49, 50, 51, 52, 53, 54 },
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
