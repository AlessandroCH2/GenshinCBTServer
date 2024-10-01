--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 411, monster_id = 21010201, pos = { x = 2313.6, y = 217.0, z = -1098.8 }, rot = { x = 0.0, y = 182.9, z = 0.0 }, level = 2, drop_id = 303000, disableWander = true, pose_id = 9003 },
	{ config_id = 997, monster_id = 21010201, pos = { x = 2317.6, y = 217.3, z = -1099.1 }, rot = { x = 0.0, y = 183.9, z = 0.0 }, level = 2, drop_id = 303000, disableWander = true, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 229, gadget_id = 70210022, pos = { x = 2315.8, y = 216.9, z = -1096.5 }, rot = { x = 0.8, y = 186.5, z = 358.8 }, level = 5, chest_drop_id = 403100, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 2498, gadget_id = 70310001, pos = { x = 2313.4, y = 216.8, z = -1096.0 }, rot = { x = 0.0, y = 230.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 2499, gadget_id = 70310001, pos = { x = 2318.1, y = 216.9, z = -1096.4 }, rot = { x = 0.0, y = 146.2, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 3231, gadget_id = 70220013, pos = { x = 2311.5, y = 216.8, z = -1096.4 }, rot = { x = 0.0, y = 266.2, z = 0.0 }, level = 1 },
	{ config_id = 3232, gadget_id = 70220013, pos = { x = 2309.5, y = 216.6, z = -1096.0 }, rot = { x = 0.0, y = 227.3, z = 0.0 }, level = 1 },
	{ config_id = 3233, gadget_id = 70220014, pos = { x = 2309.0, y = 216.7, z = -1101.0 }, rot = { x = 0.0, y = 0.4, z = 0.0 }, level = 1 },
	{ config_id = 3234, gadget_id = 70220014, pos = { x = 2308.9, y = 216.7, z = -1102.0 }, rot = { x = 0.0, y = 0.4, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 11, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2315.3, y = 216.9, z = -1099.3 } },
	{ config_id = 227, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2313.9, y = 217.3, z = -1101.1 } },
	{ config_id = 288, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2316.6, y = 216.9, z = -1098.3 } },
	{ config_id = 289, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2316.6, y = 216.9, z = -1098.3 } },
	{ config_id = 418, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2316.6, y = 216.9, z = -1098.3 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_11", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_11", action = "action_EVENT_ANY_MONSTER_DIE_11", tlog_tag = "新手区_安柏入队右边高地营地_清剿完成" },
	{ name = "CLIENT_EXECUTE_227", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_227", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_288", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_288", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_289", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_289", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_418", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_418", trigger_count = 0 }
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
		monsters = { 411, 997 },
		gadgets = { 229, 2498, 2499, 3231, 3232, 3233, 3234 },
		regions = { 11, 227, 288, 289, 418 },
		triggers = { "ANY_MONSTER_DIE_11", "CLIENT_EXECUTE_227", "CLIENT_EXECUTE_288", "CLIENT_EXECUTE_289", "CLIENT_EXECUTE_418" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_11(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_11(context, evt)
	-- 解锁目标229
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 229, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_227(context, evt)
	-- 针对groupid为 133003004 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
		if evt.param1 == 1 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133003004, this_gadget, GadgetState.GearStart )
			return 0
		end
	
		if evt.param1 == 0 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133003004, this_gadget, GadgetState.Default )
			return 0
		end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_288(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_289(context, evt)
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
function action_EVENT_CLIENT_EXECUTE_418(context, evt)
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
