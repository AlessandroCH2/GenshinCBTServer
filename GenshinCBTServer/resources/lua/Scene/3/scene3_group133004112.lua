--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 320, monster_id = 28020102, pos = { x = 2319.5, y = 255.3, z = -443.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 321, monster_id = 28020102, pos = { x = 2318.7, y = 281.0, z = -286.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 322, monster_id = 21010101, pos = { x = 2286.4, y = 257.2, z = -367.9 }, rot = { x = 0.0, y = 244.8, z = 0.0 }, level = 12, drop_id = 303043, disableWander = true, pose_id = 9002 },
	{ config_id = 323, monster_id = 21010101, pos = { x = 2288.8, y = 257.0, z = -369.6 }, rot = { x = 0.0, y = 201.6, z = 0.0 }, level = 12, drop_id = 303043, disableWander = true, pose_id = 9002 },
	{ config_id = 341, monster_id = 20011201, pos = { x = 2412.9, y = 299.2, z = -249.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 342, monster_id = 20011201, pos = { x = 2414.7, y = 299.2, z = -246.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 343, monster_id = 20011201, pos = { x = 2412.1, y = 298.8, z = -246.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 362, monster_id = 28020201, pos = { x = 2387.5, y = 295.5, z = -312.5 }, rot = { x = 0.0, y = 87.7, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 596, gadget_id = 70290010, pos = { x = 2369.9, y = 285.9, z = -273.4 }, rot = { x = 19.0, y = 284.9, z = 7.6 }, level = 1 },
	{ config_id = 597, gadget_id = 70500000, pos = { x = 2369.9, y = 285.9, z = -273.4 }, rot = { x = 19.0, y = 284.9, z = 7.6 }, level = 1, point_type = 3006, owner = 596 },
	{ config_id = 598, gadget_id = 70210011, pos = { x = 2392.7, y = 306.7, z = -191.3 }, rot = { x = 0.0, y = 177.0, z = 0.0 }, level = 1, chest_drop_id = 403303, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 599, gadget_id = 70500000, pos = { x = 2431.5, y = 297.5, z = -202.7 }, rot = { x = 0.0, y = 85.3, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 792, gadget_id = 70500000, pos = { x = 2389.0, y = 295.5, z = -312.6 }, rot = { x = 0.0, y = 260.5, z = 0.0 }, level = 1, point_type = 2007 },
	{ config_id = 793, gadget_id = 70500000, pos = { x = 2390.9, y = 295.7, z = -312.1 }, rot = { x = 0.0, y = 260.3, z = 0.0 }, level = 1, point_type = 2007 },
	{ config_id = 794, gadget_id = 70500000, pos = { x = 2378.5, y = 296.4, z = -302.9 }, rot = { x = 0.0, y = 103.1, z = 0.0 }, level = 1, point_type = 2007 },
	{ config_id = 795, gadget_id = 70500000, pos = { x = 2379.7, y = 296.7, z = -302.2 }, rot = { x = 0.0, y = 199.4, z = 0.0 }, level = 1, point_type = 2007 },
	{ config_id = 827, gadget_id = 70210011, pos = { x = 2350.2, y = 280.6, z = -386.1 }, rot = { x = 359.8, y = 119.0, z = 0.2 }, level = 1, chest_drop_id = 403303, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 828, gadget_id = 70500000, pos = { x = 2344.8, y = 277.0, z = -388.7 }, rot = { x = 0.0, y = 85.7, z = 0.0 }, level = 1, point_type = 2001 },
	{ config_id = 829, gadget_id = 70500000, pos = { x = 2364.5, y = 279.3, z = -372.2 }, rot = { x = 0.0, y = 19.4, z = 0.0 }, level = 1, point_type = 2004 }
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
		monsters = { 320, 321, 322, 323, 341, 342, 343, 362 },
		gadgets = { 596, 597, 598, 599, 792, 793, 794, 795, 827, 828, 829 },
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
