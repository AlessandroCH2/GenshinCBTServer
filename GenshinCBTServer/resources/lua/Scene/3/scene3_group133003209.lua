--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 829, monster_id = 20010501, pos = { x = 2454.2, y = 308.1, z = -1665.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 303002 },
	{ config_id = 830, monster_id = 20010501, pos = { x = 2452.3, y = 308.4, z = -1669.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 303002 },
	{ config_id = 831, monster_id = 21010101, pos = { x = 2209.0, y = 234.8, z = -1301.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042, disableWander = true },
	{ config_id = 832, monster_id = 21010101, pos = { x = 2207.3, y = 234.9, z = -1301.0 }, rot = { x = 0.0, y = 24.2, z = 0.0 }, level = 6, drop_id = 303042, disableWander = true, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2955, gadget_id = 70290009, pos = { x = 2149.0, y = 234.9, z = -1652.1 }, rot = { x = 0.0, y = 92.7, z = 0.0 }, level = 1 },
	{ config_id = 2956, gadget_id = 70500000, pos = { x = 2149.0, y = 234.9, z = -1652.1 }, rot = { x = 0.0, y = 92.7, z = 0.0 }, level = 1, point_type = 3005, owner = 2955 },
	{ config_id = 2957, gadget_id = 70290009, pos = { x = 2151.1, y = 235.0, z = -1655.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2958, gadget_id = 70500000, pos = { x = 2151.1, y = 235.0, z = -1655.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3005, owner = 2957 },
	{ config_id = 2959, gadget_id = 70290006, pos = { x = 2151.0, y = 235.0, z = -1653.7 }, rot = { x = 0.0, y = 36.1, z = 0.0 }, level = 1 },
	{ config_id = 2960, gadget_id = 70290006, pos = { x = 2150.0, y = 235.0, z = -1654.4 }, rot = { x = 0.0, y = 90.7, z = 0.0 }, level = 1 },
	{ config_id = 2961, gadget_id = 70290009, pos = { x = 2209.0, y = 234.7, z = -1299.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2962, gadget_id = 70500000, pos = { x = 2209.0, y = 234.7, z = -1299.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3005, owner = 2961 }
}

-- 区域
regions = {
	{ config_id = 169, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2229.3, y = 234.0, z = -1318.7 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_169", event = EventType.EVENT_CLIENT_EXECUTE, source = "ElementFlora", condition = "", action = "action_EVENT_CLIENT_EXECUTE_169", trigger_count = 0 }
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
		monsters = { 829, 830, 831, 832 },
		gadgets = { 2955, 2956, 2957, 2958, 2959, 2960, 2961, 2962 },
		regions = { 169 },
		triggers = { "CLIENT_EXECUTE_169" },
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
function action_EVENT_CLIENT_EXECUTE_169(context, evt)
	-- 针对groupid为 133003209 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
	 ScriptLib.SetGadgetEnableInteract(context, 133003209, this_gadget, true)
	
	return 0
end
