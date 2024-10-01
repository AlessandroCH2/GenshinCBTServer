--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1387, monster_id = 21010601, pos = { x = 2910.6, y = 251.5, z = -1649.9 }, rot = { x = 0.0, y = 255.8, z = 0.0 }, level = 12, drop_id = 303043, disableWander = true, pose_id = 9003 },
	{ config_id = 1388, monster_id = 21010301, pos = { x = 2908.2, y = 251.5, z = -1652.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 12, drop_id = 303043, disableWander = true, pose_id = 9003 },
	{ config_id = 1389, monster_id = 21010701, pos = { x = 2906.5, y = 251.7, z = -1649.0 }, rot = { x = 0.0, y = 128.6, z = 0.0 }, level = 12, drop_id = 303043, disableWander = true },
	{ config_id = 1390, monster_id = 21010101, pos = { x = 2903.5, y = 251.7, z = -1653.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 12, drop_id = 303043 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3423, gadget_id = 70900015, pos = { x = 2907.4, y = 251.1, z = -1655.0 }, rot = { x = 0.0, y = 242.2, z = 0.0 }, level = 1 },
	{ config_id = 3424, gadget_id = 70900016, pos = { x = 2912.7, y = 248.8, z = -1648.7 }, rot = { x = 0.0, y = 158.8, z = 0.0 }, level = 1 },
	{ config_id = 3425, gadget_id = 70900019, pos = { x = 2904.4, y = 251.6, z = -1646.9 }, rot = { x = 0.0, y = 308.3, z = 0.0 }, level = 1 },
	{ config_id = 3976, gadget_id = 70310004, pos = { x = 2908.2, y = 251.6, z = -1650.6 }, rot = { x = 0.0, y = 106.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 3977, gadget_id = 70210011, pos = { x = 2908.1, y = 259.3, z = -1655.8 }, rot = { x = 0.0, y = 329.2, z = 0.0 }, level = 1, chest_drop_id = 403303, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 3978, gadget_id = 70290003, pos = { x = 2912.9, y = 257.8, z = -1648.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3979, gadget_id = 70500000, pos = { x = 2912.9, y = 257.9, z = -1648.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3003, owner = 3978 },
	{ config_id = 3980, gadget_id = 70500000, pos = { x = 2912.9, y = 257.9, z = -1648.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3003, owner = 3978 },
	{ config_id = 3981, gadget_id = 70290001, pos = { x = 2897.5, y = 251.5, z = -1671.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3982, gadget_id = 70500000, pos = { x = 2897.5, y = 252.1, z = -1671.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 3981 },
	{ config_id = 3983, gadget_id = 70500000, pos = { x = 2897.4, y = 252.4, z = -1672.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 3981 },
	{ config_id = 3984, gadget_id = 70500000, pos = { x = 2897.7, y = 252.8, z = -1671.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 3981 }
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
		monsters = { 1387, 1388, 1389, 1390 },
		gadgets = { 3423, 3424, 3425, 3976, 3977, 3978, 3979, 3980, 3981, 3982, 3983, 3984 },
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
