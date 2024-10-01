--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1046, monster_id = 20010801, pos = { x = 2675.0, y = 231.9, z = -1137.0 }, rot = { x = 0.0, y = 112.6, z = 0.0 }, level = 10, drop_id = 303042, disableWander = true },
	{ config_id = 1050, monster_id = 20011301, pos = { x = 2662.2, y = 238.2, z = -1123.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 303042, disableWander = true },
	{ config_id = 1051, monster_id = 20011201, pos = { x = 2665.9, y = 237.8, z = -1119.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 303042 },
	{ config_id = 1052, monster_id = 20011201, pos = { x = 2668.1, y = 237.1, z = -1124.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 303042 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3298, gadget_id = 70290008, pos = { x = 2677.1, y = 231.9, z = -1137.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3299, gadget_id = 70500000, pos = { x = 2677.1, y = 231.9, z = -1137.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3008, owner = 3298 },
	{ config_id = 3300, gadget_id = 70210011, pos = { x = 2669.4, y = 231.6, z = -1131.1 }, rot = { x = 0.0, y = 156.9, z = 357.2 }, level = 1, chest_drop_id = 403302, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 394, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2676.8, y = 231.9, z = -1139.2 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_394", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_394", trigger_count = 0 }
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
		monsters = { 1046, 1050, 1051, 1052 },
		gadgets = { 3298, 3299, 3300 },
		regions = { 394 },
		triggers = { "CLIENT_EXECUTE_394" },
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
function action_EVENT_CLIENT_EXECUTE_394(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
