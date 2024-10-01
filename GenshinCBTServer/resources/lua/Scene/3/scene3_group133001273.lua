--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1213, monster_id = 20010501, pos = { x = 1278.1, y = 269.1, z = -1587.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13 },
	{ config_id = 1214, monster_id = 20010501, pos = { x = 1295.5, y = 271.0, z = -1595.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13 },
	{ config_id = 1215, monster_id = 20010501, pos = { x = 1308.6, y = 271.5, z = -1603.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3058, gadget_id = 70210101, pos = { x = 1225.2, y = 259.5, z = -1547.4 }, rot = { x = 0.0, y = 341.6, z = 0.0 }, level = 1, chest_drop_id = 400101, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 3059, gadget_id = 70210101, pos = { x = 1218.8, y = 265.7, z = -1681.2 }, rot = { x = 0.0, y = 207.6, z = 0.0 }, level = 1, chest_drop_id = 400101, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 3060, gadget_id = 70210101, pos = { x = 1428.7, y = 319.5, z = -1969.0 }, rot = { x = 0.0, y = 196.7, z = 0.0 }, level = 1, chest_drop_id = 400101, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 3061, gadget_id = 70290010, pos = { x = 1277.4, y = 269.9, z = -1594.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3062, gadget_id = 70500000, pos = { x = 1277.4, y = 269.9, z = -1594.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3006, owner = 3061 },
	{ config_id = 3063, gadget_id = 70290010, pos = { x = 1246.1, y = 268.3, z = -1582.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3064, gadget_id = 70500000, pos = { x = 1246.1, y = 268.3, z = -1582.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3006, owner = 3063 },
	{ config_id = 3065, gadget_id = 70290010, pos = { x = 1255.9, y = 268.9, z = -1599.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3066, gadget_id = 70500000, pos = { x = 1255.9, y = 268.9, z = -1599.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3006, owner = 3065 }
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
		monsters = { 1213, 1214, 1215 },
		gadgets = { 3058, 3059, 3060, 3061, 3062, 3063, 3064, 3065, 3066 },
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
