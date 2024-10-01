--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1417, monster_id = 21010101, pos = { x = 2815.9, y = 270.4, z = -1452.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 12, drop_id = 303043 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3163, gadget_id = 70210011, pos = { x = 2824.1, y = 272.4, z = -1488.7 }, rot = { x = 0.0, y = 126.0, z = 5.3 }, level = 1, chest_drop_id = 403303, isOneoff = true },
	{ config_id = 3164, gadget_id = 70290008, pos = { x = 2806.9, y = 270.4, z = -1475.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3165, gadget_id = 70500000, pos = { x = 2806.9, y = 270.4, z = -1475.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3008, owner = 3164 }
}

-- 区域
regions = {
	{ config_id = 376, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2822.2, y = 273.7, z = -1487.3 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_376", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_376", trigger_count = 0 }
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
		monsters = { 1417 },
		gadgets = { 3163, 3164, 3165 },
		regions = { 376 },
		triggers = { "CLIENT_EXECUTE_376" },
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
function action_EVENT_CLIENT_EXECUTE_376(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
