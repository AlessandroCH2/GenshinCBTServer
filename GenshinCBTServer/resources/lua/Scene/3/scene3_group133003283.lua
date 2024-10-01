--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1086, monster_id = 21010301, pos = { x = 2098.3, y = 212.9, z = -1308.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303002, disableWander = true, pose_id = 0 },
	{ config_id = 1087, monster_id = 21010401, pos = { x = 2095.1, y = 213.2, z = -1314.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303002, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3401, gadget_id = 70210022, pos = { x = 2097.8, y = 213.5, z = -1313.6 }, rot = { x = 5.4, y = 350.4, z = 6.4 }, level = 1, chest_drop_id = 403102, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 3402, gadget_id = 70310001, pos = { x = 2099.9, y = 213.3, z = -1309.9 }, rot = { x = 0.0, y = 231.9, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 3403, gadget_id = 70220014, pos = { x = 2095.6, y = 213.5, z = -1316.1 }, rot = { x = 0.0, y = 299.8, z = 0.0 }, level = 1 },
	{ config_id = 3404, gadget_id = 70220014, pos = { x = 2094.6, y = 213.3, z = -1316.1 }, rot = { x = 0.0, y = 187.8, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 271, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2097.6, y = 213.2, z = -1312.0 } },
	{ config_id = 366, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2098.2, y = 211.7, z = -1295.4 } },
	{ config_id = 367, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2098.2, y = 211.7, z = -1295.4 } },
	{ config_id = 435, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2098.2, y = 211.7, z = -1295.4 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_271", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_271", action = "action_EVENT_ANY_MONSTER_DIE_271" },
	{ name = "CLIENT_EXECUTE_366", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_366", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_367", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_367", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_435", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_435", trigger_count = 0 }
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
	rand_suite = false,
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
		monsters = { 1086, 1087 },
		gadgets = { 3401, 3402, 3403, 3404 },
		regions = { 271, 366, 367, 435 },
		triggers = { "ANY_MONSTER_DIE_271", "CLIENT_EXECUTE_366", "CLIENT_EXECUTE_367", "CLIENT_EXECUTE_435" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_271(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_271(context, evt)
	-- 解锁目标3401
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3401, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_366(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_367(context, evt)
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
function action_EVENT_CLIENT_EXECUTE_435(context, evt)
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
