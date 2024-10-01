--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1070, monster_id = 20010401, pos = { x = 2898.2, y = 226.6, z = -1109.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13, drop_id = 303043 },
	{ config_id = 1071, monster_id = 20010301, pos = { x = 2897.6, y = 226.6, z = -1106.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13, drop_id = 303043 },
	{ config_id = 1072, monster_id = 20010301, pos = { x = 2897.0, y = 226.3, z = -1111.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13, drop_id = 303043 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3346, gadget_id = 70210031, pos = { x = 2815.2, y = 247.7, z = -1141.2 }, rot = { x = 353.5, y = 23.0, z = 1.5 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 3347, gadget_id = 70500000, pos = { x = 2901.4, y = 230.2, z = -1105.2 }, rot = { x = 0.0, y = 272.4, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 3348, gadget_id = 70220020, pos = { x = 2818.2, y = 248.1, z = -1141.3 }, rot = { x = 0.0, y = 85.2, z = 0.0 }, level = 1 },
	{ config_id = 3349, gadget_id = 70220020, pos = { x = 2816.8, y = 248.4, z = -1139.0 }, rot = { x = 0.0, y = 200.5, z = 0.0 }, level = 1 },
	{ config_id = 3350, gadget_id = 70220020, pos = { x = 2813.7, y = 248.1, z = -1139.3 }, rot = { x = 0.0, y = 147.2, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 402, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2825.6, y = 244.4, z = -1100.0 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_402", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_402", trigger_count = 0 }
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
		monsters = { 1070, 1071, 1072 },
		gadgets = { 3346, 3347, 3348, 3349, 3350 },
		regions = { 402 },
		triggers = { "CLIENT_EXECUTE_402" },
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
function action_EVENT_CLIENT_EXECUTE_402(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
