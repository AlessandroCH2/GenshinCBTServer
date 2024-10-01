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
	{ config_id = 1250, gadget_id = 70210011, pos = { x = 2220.4, y = 227.9, z = -941.8 }, rot = { x = 0.0, y = 118.3, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 1251, gadget_id = 70210011, pos = { x = 2146.3, y = 233.6, z = -862.3 }, rot = { x = 0.0, y = 69.2, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 1252, gadget_id = 70210011, pos = { x = 2208.0, y = 255.7, z = -768.8 }, rot = { x = 0.0, y = 68.0, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 1253, gadget_id = 70210011, pos = { x = 2371.5, y = 299.4, z = -652.6 }, rot = { x = 0.0, y = 26.3, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 1254, gadget_id = 70210011, pos = { x = 2236.9, y = 258.3, z = -775.7 }, rot = { x = 0.0, y = 72.8, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 1255, gadget_id = 70210011, pos = { x = 2320.8, y = 241.1, z = -871.2 }, rot = { x = 0.0, y = 207.4, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 1256, gadget_id = 70210011, pos = { x = 2261.6, y = 236.0, z = -721.3 }, rot = { x = 0.0, y = 206.0, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 1257, gadget_id = 70210011, pos = { x = 2384.6, y = 226.0, z = -756.3 }, rot = { x = 0.0, y = 37.6, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 1258, gadget_id = 70210011, pos = { x = 2290.7, y = 225.9, z = -950.9 }, rot = { x = 0.0, y = 250.2, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 1259, gadget_id = 70210011, pos = { x = 2380.7, y = 241.1, z = -822.4 }, rot = { x = 0.0, y = 21.9, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 1261, gadget_id = 70210011, pos = { x = 2261.2, y = 273.0, z = -748.2 }, rot = { x = 0.0, y = 163.2, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT }
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
		gadgets = { 1250, 1251, 1252, 1253, 1254, 1255, 1256, 1257, 1258, 1259, 1261 },
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
