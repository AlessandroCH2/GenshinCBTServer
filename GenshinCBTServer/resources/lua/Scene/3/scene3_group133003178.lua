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
	{ config_id = 2842, gadget_id = 70210021, pos = { x = 2386.3, y = 282.9, z = -1794.4 }, rot = { x = 0.0, y = 238.6, z = 0.0 }, level = 1, chest_drop_id = 403322, isOneoff = true },
	{ config_id = 2844, gadget_id = 70220021, pos = { x = 2217.8, y = 220.9, z = -1442.5 }, rot = { x = 0.0, y = 53.6, z = 0.0 }, level = 1 },
	{ config_id = 2845, gadget_id = 70210021, pos = { x = 2219.3, y = 220.9, z = -1441.2 }, rot = { x = 0.0, y = 245.7, z = 0.0 }, level = 1, chest_drop_id = 403322, isOneoff = true },
	{ config_id = 2846, gadget_id = 70220021, pos = { x = 2240.8, y = 241.6, z = -1446.8 }, rot = { x = 0.0, y = 22.1, z = 0.0 }, level = 1 },
	{ config_id = 2847, gadget_id = 70210021, pos = { x = 2240.5, y = 242.4, z = -1445.6 }, rot = { x = 0.0, y = 245.7, z = 0.0 }, level = 1, chest_drop_id = 403322, isOneoff = true },
	{ config_id = 2848, gadget_id = 70210011, pos = { x = 2452.7, y = 271.4, z = -1526.6 }, rot = { x = 0.0, y = 7.3, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 2849, gadget_id = 70210011, pos = { x = 2373.2, y = 273.6, z = -1518.8 }, rot = { x = 0.0, y = 12.0, z = 8.6 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 2850, gadget_id = 70210011, pos = { x = 2069.9, y = 224.6, z = -1592.3 }, rot = { x = 0.0, y = 163.8, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 2851, gadget_id = 70210011, pos = { x = 2392.0, y = 250.6, z = -1278.7 }, rot = { x = 0.0, y = 98.8, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 2852, gadget_id = 70210011, pos = { x = 2161.0, y = 256.3, z = -1719.4 }, rot = { x = 0.0, y = 282.3, z = 0.0 }, level = 1, chest_drop_id = 403303, isOneoff = true },
	{ config_id = 2853, gadget_id = 70210021, pos = { x = 2291.2, y = 284.9, z = -1744.8 }, rot = { x = 1.2, y = 24.5, z = 354.7 }, level = 1, chest_drop_id = 403322, isOneoff = true },
	{ config_id = 2856, gadget_id = 70210011, pos = { x = 2373.0, y = 297.8, z = -1666.7 }, rot = { x = 0.0, y = 282.3, z = 0.0 }, level = 1, chest_drop_id = 403303, isOneoff = true },
	{ config_id = 3139, gadget_id = 70210011, pos = { x = 2123.3, y = 233.3, z = -1563.9 }, rot = { x = 359.3, y = 185.9, z = 353.9 }, level = 1, chest_drop_id = 403303, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 334, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2380.7, y = 283.5, z = -1797.1 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_334", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_334", trigger_count = 0 }
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
		gadgets = { 2842, 2844, 2845, 2846, 2847, 2848, 2849, 2850, 2851, 2852, 2853, 2856, 3139 },
		regions = { 334 },
		triggers = { "CLIENT_EXECUTE_334" },
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
function action_EVENT_CLIENT_EXECUTE_334(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
