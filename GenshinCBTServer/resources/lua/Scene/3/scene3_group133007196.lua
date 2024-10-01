--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 355, monster_id = 21030301, pos = { x = 2480.1, y = 245.7, z = 464.3 }, rot = { x = 0.0, y = 95.6, z = 0.0 }, level = 20, drop_id = 303005 },
	{ config_id = 356, monster_id = 21030301, pos = { x = 2480.1, y = 245.7, z = 467.8 }, rot = { x = 0.0, y = 95.6, z = 0.0 }, level = 20, drop_id = 303005 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 829, gadget_id = 70310001, pos = { x = 2474.9, y = 245.7, z = 463.7 }, rot = { x = 0.0, y = 347.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 830, gadget_id = 70310001, pos = { x = 2475.3, y = 245.7, z = 469.2 }, rot = { x = 0.0, y = 347.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 831, gadget_id = 70220014, pos = { x = 2474.2, y = 245.7, z = 464.9 }, rot = { x = 0.0, y = 110.1, z = 0.0 }, level = 1 },
	{ config_id = 832, gadget_id = 70220014, pos = { x = 2474.4, y = 245.7, z = 468.3 }, rot = { x = 0.0, y = 19.7, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 228, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2478.0, y = 245.7, z = 466.3 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_228", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "", action = "" }
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
		monsters = { 355, 356 },
		gadgets = { 829, 830, 831, 832 },
		regions = { 228 },
		triggers = { "ANY_MONSTER_DIE_228" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件

-- 触发操作
