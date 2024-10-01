--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 237, monster_id = 21020201, pos = { x = 2374.6, y = 282.1, z = -340.6 }, rot = { x = 0.0, y = 290.0, z = 0.0 }, level = 15, drop_id = 303103, disableWander = true, pose_id = 401 },
	{ config_id = 238, monster_id = 21010301, pos = { x = 2367.9, y = 281.3, z = -334.5 }, rot = { x = 0.0, y = 337.1, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true, pose_id = 9003 },
	{ config_id = 239, monster_id = 21010301, pos = { x = 2369.0, y = 281.9, z = -332.4 }, rot = { x = 0.0, y = 266.6, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true, pose_id = 9003 },
	{ config_id = 240, monster_id = 21010101, pos = { x = 2365.5, y = 281.3, z = -332.4 }, rot = { x = 0.0, y = 100.9, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true, pose_id = 9003 },
	{ config_id = 241, monster_id = 21010701, pos = { x = 2365.6, y = 280.2, z = -339.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 12, drop_id = 303003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 319, gadget_id = 70310006, pos = { x = 2367.1, y = 281.7, z = -332.4 }, rot = { x = 0.0, y = 163.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 322, gadget_id = 70220013, pos = { x = 2377.8, y = 282.7, z = -339.1 }, rot = { x = 351.4, y = 129.1, z = 352.0 }, level = 1 },
	{ config_id = 323, gadget_id = 70220014, pos = { x = 2377.6, y = 283.2, z = -343.2 }, rot = { x = 22.0, y = 312.3, z = 0.0 }, level = 1 },
	{ config_id = 324, gadget_id = 70220014, pos = { x = 2376.6, y = 282.7, z = -343.3 }, rot = { x = 13.3, y = 249.5, z = 0.0 }, level = 1 },
	{ config_id = 325, gadget_id = 70310004, pos = { x = 2366.8, y = 280.0, z = -341.6 }, rot = { x = 348.1, y = 53.1, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 326, gadget_id = 70210032, pos = { x = 2377.8, y = 282.9, z = -341.7 }, rot = { x = 1.8, y = 276.0, z = 354.4 }, level = 1, chest_drop_id = 403143, state = GadgetState.ChestLocked, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 76, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2373.8, y = 282.2, z = -336.2 } },
	{ config_id = 114, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2379.9, y = 278.4, z = -336.4 } },
	{ config_id = 115, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2379.9, y = 278.4, z = -336.4 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_76", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_76", action = "action_EVENT_ANY_MONSTER_DIE_76", tlog_tag = "奔狼岭_84_怪物营地_结算" },
	{ name = "CLIENT_EXECUTE_114", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_114", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_115", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_115", trigger_count = 0 }
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
		monsters = { 237, 238, 239, 240, 241 },
		gadgets = { 319, 322, 323, 324, 325, 326 },
		regions = { 76, 114, 115 },
		triggers = { "ANY_MONSTER_DIE_76", "CLIENT_EXECUTE_114", "CLIENT_EXECUTE_115" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_76(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_76(context, evt)
	-- 解锁目标326
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 326, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_114(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_115(context, evt)
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
