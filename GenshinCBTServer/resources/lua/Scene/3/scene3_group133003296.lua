--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 963, monster_id = 21010501, pos = { x = 2735.6, y = 271.1, z = -1432.3 }, rot = { x = 0.0, y = 26.1, z = 0.0 }, level = 13, drop_id = 303043, disableWander = true },
	{ config_id = 964, monster_id = 21010501, pos = { x = 2738.7, y = 270.7, z = -1434.1 }, rot = { x = 0.0, y = 27.5, z = 0.0 }, level = 13, drop_id = 303043, disableWander = true },
	{ config_id = 965, monster_id = 21010901, pos = { x = 2730.2, y = 271.3, z = -1426.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13, drop_id = 303043 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3159, gadget_id = 70220017, pos = { x = 2732.5, y = 270.7, z = -1440.4 }, rot = { x = 356.7, y = 247.7, z = 6.8 }, level = 1 },
	{ config_id = 3160, gadget_id = 70220013, pos = { x = 2732.2, y = 271.6, z = -1434.2 }, rot = { x = 0.0, y = 215.5, z = 13.3 }, level = 1 },
	{ config_id = 3161, gadget_id = 70220013, pos = { x = 2732.4, y = 271.1, z = -1437.7 }, rot = { x = 348.2, y = 326.0, z = 358.8 }, level = 1 },
	{ config_id = 3162, gadget_id = 70210011, pos = { x = 2731.3, y = 271.7, z = -1436.3 }, rot = { x = 0.0, y = 343.7, z = 0.0 }, level = 1, chest_drop_id = 403303, isOneoff = true },
	{ config_id = 3428, gadget_id = 70310004, pos = { x = 2706.1, y = 244.6, z = -1154.7 }, rot = { x = 0.0, y = 334.8, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 374, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2737.3, y = 270.7, z = -1436.3 } },
	{ config_id = 375, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2737.3, y = 270.7, z = -1436.3 } },
	{ config_id = 436, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2737.3, y = 270.7, z = -1436.3 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_374", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_374", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_375", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_375", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_436", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_436", trigger_count = 0 }
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
		monsters = { 963, 964, 965 },
		gadgets = { 3159, 3160, 3161, 3162, 3428 },
		regions = { 374, 375, 436 },
		triggers = { "CLIENT_EXECUTE_374", "CLIENT_EXECUTE_375", "CLIENT_EXECUTE_436" },
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
function action_EVENT_CLIENT_EXECUTE_374(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_375(context, evt)
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
function action_EVENT_CLIENT_EXECUTE_436(context, evt)
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
