--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 141, monster_id = 21010201, pos = { x = 2422.2, y = 206.8, z = -1276.8 }, rot = { x = 359.7, y = 73.4, z = 2.0 }, level = 4, drop_id = 303000, disableWander = true },
	{ config_id = 410, monster_id = 21010201, pos = { x = 2424.5, y = 206.8, z = -1279.6 }, rot = { x = 1.5, y = 32.7, z = 1.0 }, level = 4, drop_id = 303000, disableWander = true },
	{ config_id = 811, monster_id = 21010701, pos = { x = 2429.4, y = 206.3, z = -1268.1 }, rot = { x = 0.0, y = 20.5, z = 0.0 }, level = 4, drop_id = 303000, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 196, gadget_id = 70210032, pos = { x = 2426.6, y = 206.8, z = -1280.9 }, rot = { x = 0.0, y = 350.1, z = 0.0 }, level = 5, chest_drop_id = 403100, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 1367, gadget_id = 70310001, pos = { x = 2423.3, y = 206.8, z = -1282.4 }, rot = { x = 0.0, y = 180.8, z = 0.0 }, level = 5, state = GadgetState.GearStart },
	{ config_id = 1368, gadget_id = 70310001, pos = { x = 2449.4, y = 205.8, z = -1249.9 }, rot = { x = 0.7, y = 279.4, z = 356.9 }, level = 5, state = GadgetState.GearStart },
	{ config_id = 2427, gadget_id = 70220014, pos = { x = 2419.2, y = 206.8, z = -1272.6 }, rot = { x = 0.0, y = 298.4, z = 0.0 }, level = 1 },
	{ config_id = 2428, gadget_id = 70220014, pos = { x = 2420.9, y = 205.9, z = -1258.6 }, rot = { x = 0.0, y = 331.2, z = 0.0 }, level = 1 },
	{ config_id = 2429, gadget_id = 70220013, pos = { x = 2404.0, y = 206.9, z = -1276.6 }, rot = { x = 4.0, y = 19.3, z = 359.5 }, level = 1 },
	{ config_id = 2458, gadget_id = 70220013, pos = { x = 2422.9, y = 207.2, z = -1292.2 }, rot = { x = 4.8, y = 10.0, z = 3.6 }, level = 1 },
	{ config_id = 2459, gadget_id = 70220014, pos = { x = 2424.3, y = 207.3, z = -1292.3 }, rot = { x = 0.0, y = 331.2, z = 0.0 }, level = 1 },
	{ config_id = 2672, gadget_id = 70220014, pos = { x = 2419.8, y = 206.7, z = -1271.4 }, rot = { x = 0.0, y = 298.4, z = 0.0 }, level = 1 },
	{ config_id = 2673, gadget_id = 70220014, pos = { x = 2418.7, y = 206.8, z = -1271.8 }, rot = { x = 0.0, y = 298.4, z = 0.0 }, level = 1 },
	{ config_id = 2707, gadget_id = 70310001, pos = { x = 2410.5, y = 206.4, z = -1269.4 }, rot = { x = 3.5, y = 278.9, z = 359.6 }, level = 5, state = GadgetState.GearStart },
	{ config_id = 2708, gadget_id = 70220014, pos = { x = 2432.8, y = 205.9, z = -1256.8 }, rot = { x = 0.0, y = 298.4, z = 0.0 }, level = 1 },
	{ config_id = 2709, gadget_id = 70220014, pos = { x = 2433.1, y = 205.8, z = -1255.2 }, rot = { x = 0.0, y = 298.4, z = 0.0 }, level = 1 },
	{ config_id = 2710, gadget_id = 70220014, pos = { x = 2430.6, y = 206.0, z = -1256.9 }, rot = { x = 0.0, y = 298.4, z = 0.0 }, level = 1 },
	{ config_id = 3242, gadget_id = 70310001, pos = { x = 2452.1, y = 209.9, z = -1280.0 }, rot = { x = 356.8, y = 130.3, z = 358.6 }, level = 5, state = GadgetState.GearStart },
	{ config_id = 3902, gadget_id = 70310001, pos = { x = 2454.1, y = 210.0, z = -1286.2 }, rot = { x = 356.8, y = 130.3, z = 358.6 }, level = 5, state = GadgetState.GearStart },
	{ config_id = 3903, gadget_id = 70310001, pos = { x = 2442.1, y = 203.5, z = -1244.4 }, rot = { x = 0.7, y = 279.4, z = 356.9 }, level = 5, state = GadgetState.GearStart },
	{ config_id = 3905, gadget_id = 70310001, pos = { x = 2445.6, y = 206.9, z = -1260.5 }, rot = { x = 0.7, y = 279.4, z = 356.9 }, level = 5, state = GadgetState.GearStart },
	{ config_id = 4011, gadget_id = 70220013, pos = { x = 2414.0, y = 206.8, z = -1290.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 4012, gadget_id = 70220013, pos = { x = 2412.7, y = 206.8, z = -1288.5 }, rot = { x = 0.0, y = 318.5, z = 0.0 }, level = 1 },
	{ config_id = 4014, gadget_id = 70220013, pos = { x = 2410.4, y = 206.8, z = -1289.4 }, rot = { x = 0.0, y = 28.6, z = 0.0 }, level = 1 },
	{ config_id = 4015, gadget_id = 70220014, pos = { x = 2415.5, y = 206.8, z = -1290.6 }, rot = { x = 0.0, y = 298.4, z = 0.0 }, level = 1 },
	{ config_id = 4016, gadget_id = 70220014, pos = { x = 2407.2, y = 206.8, z = -1280.4 }, rot = { x = 0.0, y = 298.4, z = 0.0 }, level = 1 },
	{ config_id = 4017, gadget_id = 70220014, pos = { x = 2407.8, y = 206.8, z = -1279.4 }, rot = { x = 0.0, y = 298.4, z = 0.0 }, level = 1 },
	{ config_id = 4018, gadget_id = 70310001, pos = { x = 2409.0, y = 206.8, z = -1278.2 }, rot = { x = 3.5, y = 278.9, z = 359.6 }, level = 5, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 13, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2425.9, y = 206.8, z = -1278.4 } },
	{ config_id = 138, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2446.2, y = 208.3, z = -1274.5 } },
	{ config_id = 286, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2425.9, y = 206.8, z = -1275.0 } },
	{ config_id = 287, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2425.9, y = 206.8, z = -1275.0 } },
	{ config_id = 417, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2425.9, y = 206.8, z = -1275.0 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_13", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_13", action = "action_EVENT_ANY_MONSTER_DIE_13", tlog_tag = "新手区_主动线左方主营地_清剿完成" },
	{ name = "CLIENT_EXECUTE_138", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_138", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_286", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_286", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_287", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_287", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_417", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_417", trigger_count = 0 }
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
		monsters = { 141, 410, 811 },
		gadgets = { 196, 1367, 1368, 2427, 2428, 2429, 2458, 2459, 2672, 2673, 2707, 2708, 2709, 2710, 3242, 3902, 3903, 3905, 4011, 4012, 4014, 4015, 4016, 4017, 4018 },
		regions = { 13, 138, 286, 287, 417 },
		triggers = { "ANY_MONSTER_DIE_13", "CLIENT_EXECUTE_138", "CLIENT_EXECUTE_286", "CLIENT_EXECUTE_287", "CLIENT_EXECUTE_417" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_13(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_13(context, evt)
	-- 解锁目标196
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 196, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_138(context, evt)
	-- 针对groupid为 133003001 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
		if evt.param1 == 1 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133003001, this_gadget, GadgetState.GearStart )
			return 0
		end
	
		if evt.param1 == 0 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133003001, this_gadget, GadgetState.Default )
			return 0
		end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_286(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_287(context, evt)
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
function action_EVENT_CLIENT_EXECUTE_417(context, evt)
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
