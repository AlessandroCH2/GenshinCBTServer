--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 68, monster_id = 22010201, pos = { x = 531.0, y = -37.4, z = 75.0 }, rot = { x = 0.0, y = 274.6, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 80, monster_id = 20011001, pos = { x = 523.9, y = -37.4, z = 75.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 81, monster_id = 20011001, pos = { x = 513.9, y = -37.4, z = 72.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 80, gadget_id = 70210011, pos = { x = 509.1, y = -37.5, z = 84.2 }, rot = { x = 0.0, y = 149.7, z = 0.0 }, level = 1, chest_drop_id = 1400301, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 81, gadget_id = 70220002, pos = { x = 515.0, y = -37.4, z = 72.9 }, rot = { x = 0.0, y = 160.0, z = 0.0 }, level = 1 },
	{ config_id = 82, gadget_id = 70220002, pos = { x = 513.1, y = -37.4, z = 72.3 }, rot = { x = 0.0, y = 300.6, z = 0.0 }, level = 1 },
	{ config_id = 83, gadget_id = 70220002, pos = { x = 511.8, y = -37.4, z = 72.0 }, rot = { x = 0.0, y = 65.4, z = 0.0 }, level = 1 },
	{ config_id = 84, gadget_id = 70220002, pos = { x = 510.7, y = -37.4, z = 70.3 }, rot = { x = 0.0, y = 273.7, z = 0.0 }, level = 1 },
	{ config_id = 85, gadget_id = 70220002, pos = { x = 512.3, y = -37.4, z = 70.0 }, rot = { x = 0.0, y = 139.4, z = 0.0 }, level = 1 },
	{ config_id = 86, gadget_id = 70220002, pos = { x = 512.7, y = -37.4, z = 70.9 }, rot = { x = 0.0, y = 137.4, z = 0.0 }, level = 1 },
	{ config_id = 87, gadget_id = 70220002, pos = { x = 514.2, y = -37.4, z = 71.1 }, rot = { x = 0.0, y = 142.4, z = 0.0 }, level = 1 },
	{ config_id = 88, gadget_id = 70220002, pos = { x = 515.5, y = -37.4, z = 71.2 }, rot = { x = 0.0, y = 35.9, z = 0.0 }, level = 1 },
	{ config_id = 89, gadget_id = 70220002, pos = { x = 515.4, y = -37.5, z = 69.1 }, rot = { x = 0.0, y = 206.5, z = 0.0 }, level = 1 },
	{ config_id = 90, gadget_id = 70220002, pos = { x = 513.4, y = -37.5, z = 69.0 }, rot = { x = 0.0, y = 334.6, z = 0.0 }, level = 1 },
	{ config_id = 91, gadget_id = 70220002, pos = { x = 511.1, y = -37.4, z = 68.2 }, rot = { x = 0.0, y = 330.7, z = 0.0 }, level = 1 },
	{ config_id = 92, gadget_id = 70220002, pos = { x = 509.1, y = -37.4, z = 68.6 }, rot = { x = 0.0, y = 22.7, z = 0.0 }, level = 1 },
	{ config_id = 93, gadget_id = 70220002, pos = { x = 510.3, y = -37.4, z = 69.2 }, rot = { x = 0.0, y = 281.0, z = 0.0 }, level = 1 },
	{ config_id = 94, gadget_id = 70220002, pos = { x = 512.4, y = -37.5, z = 67.9 }, rot = { x = 0.0, y = 238.9, z = 0.0 }, level = 1 },
	{ config_id = 95, gadget_id = 70220002, pos = { x = 514.2, y = -37.5, z = 67.6 }, rot = { x = 0.0, y = 5.5, z = 0.0 }, level = 1 },
	{ config_id = 96, gadget_id = 70220002, pos = { x = 513.1, y = -37.5, z = 66.3 }, rot = { x = 0.0, y = 231.0, z = 0.0 }, level = 1 },
	{ config_id = 97, gadget_id = 70220002, pos = { x = 511.0, y = -37.4, z = 66.1 }, rot = { x = 0.0, y = 126.0, z = 0.0 }, level = 1 },
	{ config_id = 98, gadget_id = 70220002, pos = { x = 510.0, y = -37.4, z = 67.1 }, rot = { x = 0.0, y = 20.2, z = 0.0 }, level = 1 },
	{ config_id = 99, gadget_id = 70220002, pos = { x = 512.8, y = -37.5, z = 64.4 }, rot = { x = 0.0, y = 186.9, z = 0.0 }, level = 1 },
	{ config_id = 100, gadget_id = 70220002, pos = { x = 509.4, y = -37.4, z = 71.5 }, rot = { x = 0.0, y = 231.0, z = 0.0 }, level = 1 },
	{ config_id = 101, gadget_id = 70220002, pos = { x = 508.6, y = -37.5, z = 73.2 }, rot = { x = 0.0, y = 90.6, z = 0.0 }, level = 1 },
	{ config_id = 102, gadget_id = 70220005, pos = { x = 519.0, y = -37.4, z = 79.2 }, rot = { x = 0.0, y = 353.3, z = 0.0 }, level = 1 },
	{ config_id = 103, gadget_id = 70220005, pos = { x = 519.3, y = -37.4, z = 71.2 }, rot = { x = 0.0, y = 276.2, z = 0.0 }, level = 1 }
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
