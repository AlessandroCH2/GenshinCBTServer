--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 247, monster_id = 21010501, pos = { x = 1414.9, y = 55.2, z = 214.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 3, drop_id = 200001 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 538, gadget_id = 70210001, pos = { x = 1409.6, y = 56.5, z = 210.6 }, rot = { x = 270.0, y = 8.7, z = 0.0 }, level = 1, drop_id = 100001, locked = false },
	{ config_id = 539, gadget_id = 70210002, pos = { x = 1414.8, y = 55.3, z = 210.0 }, rot = { x = 270.0, y = 184.0, z = 0.0 }, level = 1, drop_id = 100002, locked = false },
	{ config_id = 540, gadget_id = 70210003, pos = { x = 1420.2, y = 55.9, z = 209.6 }, rot = { x = 270.0, y = 199.1, z = 0.0 }, level = 1, drop_id = 100004, locked = true },
	{ config_id = 541, gadget_id = 70510001, pos = { x = 1401.9, y = 54.0, z = 258.4 }, rot = { x = 0.0, y = 149.0, z = 0.0 }, level = 1, drop_id = 100001, locked = false },
	{ config_id = 542, gadget_id = 70510001, pos = { x = 1411.2, y = 54.0, z = 263.9 }, rot = { x = 0.0, y = 264.5, z = 0.0 }, level = 1, drop_id = 100110, locked = false },
	{ config_id = 543, gadget_id = 70220001, pos = { x = 1380.9, y = 52.1, z = 285.6 }, rot = { x = 0.0, y = 230.8, z = 0.0 }, level = 1, drop_id = 100115, locked = false },
	{ config_id = 544, gadget_id = 70220001, pos = { x = 1388.5, y = 52.9, z = 288.6 }, rot = { x = 0.0, y = 25.5, z = 0.0 }, level = 1, drop_id = 100215, locked = false },
	{ config_id = 545, gadget_id = 70900004, pos = { x = 1393.4, y = 58.2, z = 257.0 }, rot = { x = 0.0, y = 320.7, z = 0.0 }, level = 1, drop_id = 110001, locked = false },
	{ config_id = 546, gadget_id = 70900004, pos = { x = 1394.3, y = 58.3, z = 256.6 }, rot = { x = 0.0, y = 253.9, z = 0.0 }, level = 1, drop_id = 110001, locked = false },
	{ config_id = 547, gadget_id = 70900004, pos = { x = 1395.5, y = 58.1, z = 256.6 }, rot = { x = 0.0, y = 149.2, z = 0.0 }, level = 1, drop_id = 110001, locked = false },
	{ config_id = 548, gadget_id = 70220004, pos = { x = 1388.5, y = 51.9, z = 273.9 }, rot = { x = 0.0, y = 333.5, z = 0.0 }, level = 1 },
	{ config_id = 549, gadget_id = 70220004, pos = { x = 1399.1, y = 54.3, z = 280.9 }, rot = { x = 0.0, y = 148.0, z = 0.0 }, level = 1 },
	{ config_id = 550, gadget_id = 70220004, pos = { x = 1401.3, y = 53.5, z = 274.8 }, rot = { x = 0.0, y = 295.3, z = 0.0 }, level = 1 },
	{ config_id = 551, gadget_id = 70220004, pos = { x = 1395.3, y = 53.0, z = 267.7 }, rot = { x = 0.0, y = 348.9, z = 0.0 }, level = 1 },
	{ config_id = 552, gadget_id = 70220004, pos = { x = 1395.6, y = 52.4, z = 275.2 }, rot = { x = 0.0, y = 253.4, z = 0.0 }, level = 1 }
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
	monsters = { 247 },
	npcs = { },
	gadgets = { 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552 },
	regions = { },
	triggers = { }
}

--================================================================
-- 
-- 触发器
-- 
--================================================================
