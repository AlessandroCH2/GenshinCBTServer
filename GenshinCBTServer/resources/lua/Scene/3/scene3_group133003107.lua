--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 519, monster_id = 21010201, pos = { x = 2312.8, y = 230.7, z = -1214.0 }, rot = { x = 0.0, y = 134.9, z = 0.0 }, level = 5, drop_id = 303000, pose_id = 9003 },
	{ config_id = 520, monster_id = 21010601, pos = { x = 2318.5, y = 230.9, z = -1217.9 }, rot = { x = 0.0, y = 264.4, z = 0.0 }, level = 5, drop_id = 303000, disableWander = true, pose_id = 9003 },
	{ config_id = 1474, monster_id = 21010201, pos = { x = 2313.8, y = 230.8, z = -1221.6 }, rot = { x = 0.0, y = 23.0, z = 0.0 }, level = 5, drop_id = 303000, disableWander = true, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2525, gadget_id = 70220005, pos = { x = 2317.5, y = 230.9, z = -1213.8 }, rot = { x = 0.0, y = 227.2, z = 0.0 }, level = 5 },
	{ config_id = 2526, gadget_id = 70210022, pos = { x = 2316.8, y = 231.1, z = -1222.1 }, rot = { x = 0.0, y = 345.5, z = 0.0 }, level = 1, chest_drop_id = 403322, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 4162, gadget_id = 70310004, pos = { x = 2315.3, y = 230.8, z = -1218.3 }, rot = { x = 0.0, y = 268.3, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 303, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2263.1, y = 227.2, z = -1178.5 } },
	{ config_id = 304, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2263.1, y = 227.2, z = -1178.5 } },
	{ config_id = 421, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2263.1, y = 227.2, z = -1178.5 } },
	{ config_id = 525, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2317.7, y = 231.0, z = -1218.1 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_303", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_303", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_304", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_304", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_421", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_421", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_525", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_525", action = "action_EVENT_ANY_MONSTER_DIE_525" }
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
		monsters = { 519, 520, 1474 },
		gadgets = { 2525, 2526 },
		regions = { 303, 304, 421, 525 },
		triggers = { "CLIENT_EXECUTE_303", "CLIENT_EXECUTE_304", "CLIENT_EXECUTE_421", "ANY_MONSTER_DIE_525" },
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
function action_EVENT_CLIENT_EXECUTE_303(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_304(context, evt)
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
function action_EVENT_CLIENT_EXECUTE_421(context, evt)
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

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_525(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_525(context, evt)
	-- 解锁目标2526
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 2526, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
