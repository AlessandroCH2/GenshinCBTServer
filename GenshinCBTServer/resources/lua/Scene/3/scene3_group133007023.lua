--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 344, gadget_id = 70210011, pos = { x = 2457.3, y = 208.8, z = 136.3 }, rot = { x = 0.0, y = 226.4, z = 0.0 }, level = 1, chest_drop_id = 403305, isOneoff = true },
	{ config_id = 345, gadget_id = 70210011, pos = { x = 2397.7, y = 211.3, z = 62.0 }, rot = { x = 0.0, y = 340.4, z = 0.0 }, level = 1, chest_drop_id = 403305, isOneoff = true },
	{ config_id = 521, gadget_id = 70210011, pos = { x = 2482.2, y = 205.9, z = 130.3 }, rot = { x = 0.0, y = 347.2, z = 0.0 }, level = 1, chest_drop_id = 403305, isOneoff = true },
	{ config_id = 657, gadget_id = 70210011, pos = { x = 2412.6, y = 211.3, z = 28.4 }, rot = { x = 0.0, y = 162.6, z = 0.0 }, level = 1, chest_drop_id = 403305, isOneoff = true },
	{ config_id = 658, gadget_id = 70210011, pos = { x = 2414.8, y = 218.0, z = 49.2 }, rot = { x = 0.0, y = 251.5, z = 0.0 }, level = 1, chest_drop_id = 403305, isOneoff = true },
	{ config_id = 659, gadget_id = 70210011, pos = { x = 2571.6, y = 227.2, z = 15.9 }, rot = { x = 0.0, y = 251.5, z = 9.1 }, level = 1, chest_drop_id = 403305, isOneoff = true },
	{ config_id = 674, gadget_id = 70210011, pos = { x = 2447.1, y = 225.8, z = 146.8 }, rot = { x = 0.0, y = 307.2, z = 0.0 }, level = 1, chest_drop_id = 403305, isOneoff = true }
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
		gadgets = { 344, 345, 521, 657, 658, 659, 674 },
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
