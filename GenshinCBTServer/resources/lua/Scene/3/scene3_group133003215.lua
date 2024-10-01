--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 852, monster_id = 21020201, pos = { x = 2688.7, y = 244.9, z = -1300.2 }, rot = { x = 0.0, y = 323.3, z = 0.0 }, level = 10, drop_id = 303102, disableWander = true, pose_id = 401 },
	{ config_id = 853, monster_id = 21010201, pos = { x = 2687.9, y = 244.6, z = -1297.4 }, rot = { x = 0.0, y = 231.7, z = 0.0 }, level = 10, drop_id = 303002, disableWander = true, pose_id = 9003 },
	{ config_id = 854, monster_id = 21010201, pos = { x = 2684.2, y = 244.8, z = -1298.9 }, rot = { x = 0.0, y = 133.5, z = 0.0 }, level = 10, drop_id = 303002, disableWander = true, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2975, gadget_id = 70210032, pos = { x = 2686.1, y = 245.2, z = -1301.8 }, rot = { x = 9.8, y = 12.6, z = 1.6 }, level = 1, chest_drop_id = 403343, state = GadgetState.ChestLocked, isOneoff = true },
	{ config_id = 3377, gadget_id = 70310004, pos = { x = 2686.9, y = 244.9, z = -1299.6 }, rot = { x = 0.0, y = 306.9, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 251, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2685.3, y = 244.9, z = -1299.4 } },
	{ config_id = 344, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2685.2, y = 244.2, z = -1298.6 } },
	{ config_id = 345, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2685.2, y = 244.2, z = -1298.6 } },
	{ config_id = 429, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2685.2, y = 244.2, z = -1298.6 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_251", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_251", action = "action_EVENT_ANY_MONSTER_DIE_251", tlog_tag = "望风山地_215_怪物营地_结算" },
	{ name = "CLIENT_EXECUTE_344", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_344", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_345", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_345", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_429", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_429", trigger_count = 0 }
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
		monsters = { 852, 853, 854 },
		gadgets = { 2975, 3377 },
		regions = { 251, 344, 345, 429 },
		triggers = { "ANY_MONSTER_DIE_251", "CLIENT_EXECUTE_344", "CLIENT_EXECUTE_345", "CLIENT_EXECUTE_429" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_251(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_251(context, evt)
	-- 解锁目标2975
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 2975, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_344(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_345(context, evt)
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
function action_EVENT_CLIENT_EXECUTE_429(context, evt)
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
