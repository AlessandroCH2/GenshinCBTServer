--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1061, monster_id = 21010501, pos = { x = 2780.1, y = 260.9, z = -1277.3 }, rot = { x = 0.0, y = 140.0, z = 0.0 }, level = 10, drop_id = 303042, disableWander = true },
	{ config_id = 1084, monster_id = 21010101, pos = { x = 2781.9, y = 260.8, z = -1280.5 }, rot = { x = 0.0, y = 324.0, z = 0.0 }, level = 10, drop_id = 303042, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3323, gadget_id = 70310004, pos = { x = 2780.8, y = 260.8, z = -1279.0 }, rot = { x = 0.0, y = 183.1, z = 0.0 }, level = 1 },
	{ config_id = 3324, gadget_id = 70310001, pos = { x = 2782.7, y = 260.8, z = -1278.1 }, rot = { x = 0.0, y = 341.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 3325, gadget_id = 70220005, pos = { x = 2779.0, y = 260.6, z = -1279.6 }, rot = { x = 0.0, y = 129.1, z = 0.0 }, level = 10 },
	{ config_id = 3326, gadget_id = 70220005, pos = { x = 2779.4, y = 260.7, z = -1280.6 }, rot = { x = 0.0, y = 269.4, z = 0.0 }, level = 10 }
}

-- 区域
regions = {
	{ config_id = 398, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2780.5, y = 260.8, z = -1278.8 } },
	{ config_id = 440, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2780.5, y = 260.8, z = -1278.8 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_398", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_398", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_440", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_440", trigger_count = 0 }
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
		monsters = { 1061, 1084 },
		gadgets = { 3323, 3324, 3325, 3326 },
		regions = { 398, 440 },
		triggers = { "CLIENT_EXECUTE_398", "CLIENT_EXECUTE_440" },
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
function action_EVENT_CLIENT_EXECUTE_398(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	local this_group = ScriptLib.GetContextGroupId(context)
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.Defautl )
		return 0
	end
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_440(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	local this_group = ScriptLib.GetContextGroupId(context)
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.Default )
		return 0
	end
	return 0
end
