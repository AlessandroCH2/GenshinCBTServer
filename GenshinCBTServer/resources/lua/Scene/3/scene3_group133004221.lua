--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 569, monster_id = 21030101, pos = { x = 2286.5, y = 241.3, z = -471.0 }, rot = { x = 0.0, y = 154.3, z = 0.0 }, level = 12, drop_id = 303043, disableWander = true },
	{ config_id = 570, monster_id = 20011001, pos = { x = 2289.2, y = 241.8, z = -470.8 }, rot = { x = 0.0, y = 207.3, z = 0.0 }, level = 12, drop_id = 303043, disableWander = true },
	{ config_id = 571, monster_id = 21010101, pos = { x = 2289.0, y = 241.6, z = -474.1 }, rot = { x = 0.0, y = 319.6, z = 0.0 }, level = 12, drop_id = 303043, disableWander = true },
	{ config_id = 572, monster_id = 21010101, pos = { x = 2286.0, y = 241.0, z = -474.1 }, rot = { x = 0.0, y = 40.6, z = 0.0 }, level = 12, drop_id = 303043, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1244, gadget_id = 70310004, pos = { x = 2287.6, y = 241.4, z = -472.6 }, rot = { x = 0.0, y = 225.5, z = 0.0 }, level = 1, state = GadgetState.GearStart, persistent = true },
	{ config_id = 1245, gadget_id = 70210011, pos = { x = 2281.7, y = 240.1, z = -476.1 }, rot = { x = 354.8, y = 17.7, z = 10.2 }, level = 1, chest_drop_id = 403303, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT }
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
		monsters = { 569, 570, 571, 572 },
		gadgets = { 1244 },
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
