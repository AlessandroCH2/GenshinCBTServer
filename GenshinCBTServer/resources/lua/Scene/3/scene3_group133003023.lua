--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 347, monster_id = 21010601, pos = { x = 2470.7, y = 244.7, z = -1413.5 }, rot = { x = 0.0, y = 55.3, z = 0.0 }, level = 8, drop_id = 303002, disableWander = true },
	{ config_id = 358, monster_id = 21010401, pos = { x = 2461.3, y = 249.1, z = -1429.7 }, rot = { x = 0.0, y = 339.1, z = 0.0 }, level = 8, drop_id = 303002, disableWander = true },
	{ config_id = 359, monster_id = 21010401, pos = { x = 2466.3, y = 245.2, z = -1416.9 }, rot = { x = 0.0, y = 284.1, z = 0.0 }, level = 8, drop_id = 303002, disableWander = true, pose_id = 9003 },
	{ config_id = 360, monster_id = 21010201, pos = { x = 2458.4, y = 246.3, z = -1416.1 }, rot = { x = 0.0, y = 286.3, z = 0.0 }, level = 8, drop_id = 303002, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2612, gadget_id = 70210032, pos = { x = 2472.9, y = 244.5, z = -1411.4 }, rot = { x = 0.0, y = 231.8, z = 0.0 }, level = 1, chest_drop_id = 403122, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 2933, gadget_id = 70310001, pos = { x = 2474.6, y = 244.5, z = -1412.3 }, rot = { x = 0.0, y = 114.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 2934, gadget_id = 70310001, pos = { x = 2465.0, y = 248.8, z = -1430.7 }, rot = { x = 0.0, y = 59.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 2935, gadget_id = 70220013, pos = { x = 2464.5, y = 248.3, z = -1433.2 }, rot = { x = 352.8, y = 31.7, z = 356.6 }, level = 1 },
	{ config_id = 2936, gadget_id = 70220014, pos = { x = 2466.2, y = 248.2, z = -1433.1 }, rot = { x = 0.0, y = 249.9, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 122, shape = RegionShape.SPHERE, radius = 6.9, pos = { x = 2470.7, y = 244.7, z = -1424.4 } },
	{ config_id = 291, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2481.6, y = 245.1, z = -1432.9 } },
	{ config_id = 292, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2481.6, y = 245.1, z = -1432.9 } },
	{ config_id = 419, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2481.6, y = 245.1, z = -1432.9 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_122", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_122", action = "action_EVENT_ANY_MONSTER_DIE_122" },
	{ name = "CLIENT_EXECUTE_291", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_291", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_292", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_292", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_419", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_419", trigger_count = 0 }
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
		-- description = suite_1,
		monsters = { 347, 358, 359, 360 },
		gadgets = { 2612, 2933, 2934, 2935, 2936 },
		regions = { 122, 291, 292, 419 },
		triggers = { "ANY_MONSTER_DIE_122", "CLIENT_EXECUTE_291", "CLIENT_EXECUTE_292", "CLIENT_EXECUTE_419" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_122(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_122(context, evt)
	-- 解锁目标2612
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 2612, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_291(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_292(context, evt)
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
function action_EVENT_CLIENT_EXECUTE_419(context, evt)
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
