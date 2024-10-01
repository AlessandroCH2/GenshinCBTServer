--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 582, monster_id = 21010301, pos = { x = 2080.6, y = 230.8, z = -1529.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303002, disableWander = true, pose_id = 9003 },
	{ config_id = 1106, monster_id = 21010901, pos = { x = 2082.7, y = 231.2, z = -1527.7 }, rot = { x = 0.0, y = 289.1, z = 0.0 }, level = 6, drop_id = 303002, disableWander = true },
	{ config_id = 1107, monster_id = 21030101, pos = { x = 2080.4, y = 231.0, z = -1525.5 }, rot = { x = 0.0, y = 187.9, z = 0.0 }, level = 6, drop_id = 303002, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2595, gadget_id = 70310006, pos = { x = 2080.3, y = 230.9, z = -1527.7 }, rot = { x = 0.0, y = 224.1, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 2597, gadget_id = 70220013, pos = { x = 2086.9, y = 232.3, z = -1523.6 }, rot = { x = 0.0, y = 196.4, z = 0.0 }, level = 1 },
	{ config_id = 2819, gadget_id = 70220014, pos = { x = 2088.5, y = 232.5, z = -1524.8 }, rot = { x = 0.0, y = 19.7, z = 0.0 }, level = 1 },
	{ config_id = 3455, gadget_id = 70210032, pos = { x = 2089.7, y = 232.8, z = -1530.2 }, rot = { x = 359.9, y = 344.0, z = 19.4 }, level = 1, chest_drop_id = 403123, state = GadgetState.ChestLocked, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 320, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2083.5, y = 231.3, z = -1528.4 } },
	{ config_id = 321, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2083.5, y = 231.3, z = -1528.4 } },
	{ config_id = 425, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2083.5, y = 231.3, z = -1528.4 } },
	{ config_id = 526, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2083.0, y = 231.1, z = -1534.2 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_320", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_320", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_321", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_321", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_425", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_425", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_526", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_526", action = "action_EVENT_ANY_MONSTER_DIE_526", tlog_tag = "神殿_营地_遗迹下_完成" }
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
		monsters = { 582, 1106, 1107 },
		gadgets = { 2595, 2597, 2819, 3455 },
		regions = { 320, 321, 425, 526 },
		triggers = { "CLIENT_EXECUTE_320", "CLIENT_EXECUTE_321", "CLIENT_EXECUTE_425", "ANY_MONSTER_DIE_526" },
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
function action_EVENT_CLIENT_EXECUTE_320(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_321(context, evt)
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
function action_EVENT_CLIENT_EXECUTE_425(context, evt)
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
function condition_EVENT_ANY_MONSTER_DIE_526(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_526(context, evt)
	-- 解锁目标3455
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3455, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
