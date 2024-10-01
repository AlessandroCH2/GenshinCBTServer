--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 566, monster_id = 21010501, pos = { x = 2177.6, y = 259.8, z = -1736.6 }, rot = { x = 0.0, y = 161.4, z = 0.0 }, level = 7, drop_id = 303003, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2569, gadget_id = 70310006, pos = { x = 2403.1, y = 250.3, z = -1413.5 }, rot = { x = 0.0, y = 248.0, z = 352.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 315, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2403.1, y = 250.2, z = -1413.0 } },
	{ config_id = 424, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2403.1, y = 250.2, z = -1413.0 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_315", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_315", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_424", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_424", trigger_count = 0 }
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
		monsters = { 566 },
		gadgets = { 2569 },
		regions = { 315, 424 },
		triggers = { "CLIENT_EXECUTE_315", "CLIENT_EXECUTE_424" },
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
function action_EVENT_CLIENT_EXECUTE_315(context, evt)
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
function action_EVENT_CLIENT_EXECUTE_424(context, evt)
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
