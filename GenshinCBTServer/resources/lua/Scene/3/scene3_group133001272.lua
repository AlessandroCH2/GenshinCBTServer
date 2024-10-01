--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1195, monster_id = 28030401, pos = { x = 1418.3, y = 267.1, z = -1636.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1196, monster_id = 28030401, pos = { x = 1419.1, y = 267.9, z = -1644.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1197, monster_id = 28020201, pos = { x = 1455.5, y = 268.2, z = -1627.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1199, monster_id = 28030101, pos = { x = 1380.3, y = 273.9, z = -1694.3 }, rot = { x = 0.0, y = 261.9, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 1200, monster_id = 28050101, pos = { x = 1386.1, y = 270.8, z = -1670.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1201, monster_id = 28050101, pos = { x = 1388.6, y = 269.5, z = -1648.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1202, monster_id = 28050101, pos = { x = 1594.6, y = 269.6, z = -1484.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1203, monster_id = 28050101, pos = { x = 1521.1, y = 271.5, z = -1505.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1204, monster_id = 28050101, pos = { x = 1467.3, y = 270.9, z = -1527.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1205, monster_id = 28050101, pos = { x = 1454.4, y = 242.1, z = -1536.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1206, monster_id = 28050101, pos = { x = 1470.0, y = 272.1, z = -1792.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1207, monster_id = 28050101, pos = { x = 1439.9, y = 271.3, z = -1773.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1208, monster_id = 28050101, pos = { x = 1322.8, y = 282.5, z = -1780.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1209, monster_id = 28050101, pos = { x = 1334.6, y = 281.9, z = -1793.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1210, monster_id = 28030101, pos = { x = 1407.9, y = 294.1, z = -1758.5 }, rot = { x = 0.0, y = 10.7, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 1211, monster_id = 28050101, pos = { x = 1441.3, y = 281.1, z = -1840.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1212, monster_id = 28050101, pos = { x = 1432.5, y = 273.6, z = -1789.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3049, gadget_id = 70210033, pos = { x = 1461.7, y = 268.3, z = -1628.0 }, rot = { x = 0.0, y = 43.0, z = 0.0 }, level = 1, chest_drop_id = 403323, state = GadgetState.ChestBramble, isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 3050, gadget_id = 70290002, pos = { x = 1383.8, y = 269.7, z = -1648.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3051, gadget_id = 70500000, pos = { x = 1382.7, y = 271.3, z = -1647.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 3050 },
	{ config_id = 3052, gadget_id = 70500000, pos = { x = 1384.7, y = 272.3, z = -1649.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 3050 },
	{ config_id = 3053, gadget_id = 70500000, pos = { x = 1383.8, y = 272.6, z = -1647.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 3050 },
	{ config_id = 3054, gadget_id = 70290010, pos = { x = 1423.2, y = 267.9, z = -1648.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3055, gadget_id = 70500000, pos = { x = 1423.2, y = 267.9, z = -1648.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3006, owner = 3054 }
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
		monsters = { 1196, 1197, 1199, 1200, 1201, 1202, 1203, 1204, 1205, 1206, 1207, 1208, 1209, 1210, 1211, 1212 },
		gadgets = { 3049, 3050, 3051, 3052, 3053, 3054, 3055 },
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
