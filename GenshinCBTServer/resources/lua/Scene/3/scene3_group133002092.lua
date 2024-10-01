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
	{ config_id = 1277, gadget_id = 70290001, pos = { x = 1870.0, y = 246.5, z = -516.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1278, gadget_id = 70500000, pos = { x = 1870.0, y = 247.1, z = -516.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1277 },
	{ config_id = 1279, gadget_id = 70500000, pos = { x = 1869.9, y = 247.4, z = -517.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1277 },
	{ config_id = 1280, gadget_id = 70500000, pos = { x = 1870.3, y = 247.8, z = -516.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1277 },
	{ config_id = 1282, gadget_id = 70290002, pos = { x = 1906.2, y = 246.6, z = -378.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1283, gadget_id = 70500000, pos = { x = 1905.1, y = 248.2, z = -377.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 1282 },
	{ config_id = 1284, gadget_id = 70500000, pos = { x = 1907.1, y = 249.2, z = -379.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 1282 },
	{ config_id = 1285, gadget_id = 70500000, pos = { x = 1906.3, y = 249.5, z = -377.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 1282 },
	{ config_id = 1288, gadget_id = 70290001, pos = { x = 1757.7, y = 245.2, z = -761.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1289, gadget_id = 70500000, pos = { x = 1757.7, y = 245.8, z = -761.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1288 },
	{ config_id = 1290, gadget_id = 70500000, pos = { x = 1757.6, y = 246.1, z = -761.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1288 },
	{ config_id = 1291, gadget_id = 70500000, pos = { x = 1757.9, y = 246.5, z = -761.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1288 },
	{ config_id = 1305, gadget_id = 70290003, pos = { x = 1980.2, y = 218.5, z = -933.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1306, gadget_id = 70500000, pos = { x = 1980.2, y = 218.6, z = -933.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3003, owner = 1305 },
	{ config_id = 1307, gadget_id = 70500000, pos = { x = 1980.2, y = 218.6, z = -933.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3003, owner = 1305 },
	{ config_id = 1314, gadget_id = 70290003, pos = { x = 1892.6, y = 248.5, z = -864.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1315, gadget_id = 70500000, pos = { x = 1892.6, y = 248.6, z = -864.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3003, owner = 1314 },
	{ config_id = 1316, gadget_id = 70500000, pos = { x = 1892.6, y = 248.6, z = -864.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3003, owner = 1314 }
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
		gadgets = { 1277, 1278, 1279, 1280, 1282, 1283, 1284, 1285, 1288, 1289, 1290, 1291, 1305, 1306, 1307, 1314, 1315, 1316 },
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
