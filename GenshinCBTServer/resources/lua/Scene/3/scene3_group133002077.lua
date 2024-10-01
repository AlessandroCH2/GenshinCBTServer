--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 148, monster_id = 21010501, pos = { x = 1738.5, y = 238.8, z = -651.3 }, rot = { x = 0.0, y = 343.1, z = 0.0 }, level = 7, drop_id = 303042, disableWander = true },
	{ config_id = 149, monster_id = 21010501, pos = { x = 1708.1, y = 237.6, z = -637.4 }, rot = { x = 0.0, y = 25.9, z = 0.0 }, level = 7, drop_id = 303042, disableWander = true },
	{ config_id = 150, monster_id = 21010201, pos = { x = 1718.9, y = 244.4, z = -696.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042, disableWander = true },
	{ config_id = 151, monster_id = 21010201, pos = { x = 1722.8, y = 245.2, z = -693.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042, disableWander = true },
	{ config_id = 152, monster_id = 21010201, pos = { x = 1722.2, y = 244.7, z = -696.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042, disableWander = true },
	{ config_id = 153, monster_id = 20011001, pos = { x = 1730.3, y = 231.3, z = -636.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042 },
	{ config_id = 154, monster_id = 20011001, pos = { x = 1722.3, y = 231.3, z = -633.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042 },
	{ config_id = 155, monster_id = 20011001, pos = { x = 1729.2, y = 231.3, z = -629.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042 },
	{ config_id = 156, monster_id = 20010901, pos = { x = 1726.7, y = 231.3, z = -633.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9, drop_id = 303042 },
	{ config_id = 157, monster_id = 21030201, pos = { x = 1733.3, y = 237.8, z = -670.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042, disableWander = true },
	{ config_id = 158, monster_id = 21030201, pos = { x = 1716.1, y = 236.5, z = -653.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042, disableWander = true },
	{ config_id = 159, monster_id = 21010701, pos = { x = 1720.2, y = 244.4, z = -694.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042, disableWander = true },
	{ config_id = 160, monster_id = 21010701, pos = { x = 1722.0, y = 244.9, z = -691.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042, disableWander = true }
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
	rand_suite = false,
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
		rand_weight = 10
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 148, 149 },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { 148, 149, 150, 151, 152 },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_4,
		monsters = { 153, 154, 155 },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 4,
		-- description = suite_5,
		monsters = { 156 },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 5,
		-- description = suite_6,
		monsters = { 157, 158, 159, 160 },
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
