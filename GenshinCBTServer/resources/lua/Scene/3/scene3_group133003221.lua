--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 904, monster_id = 21030101, pos = { x = 2843.0, y = 259.6, z = -1345.7 }, rot = { x = 0.0, y = 43.7, z = 0.0 }, level = 10, drop_id = 303002, disableWander = true },
	{ config_id = 905, monster_id = 21010301, pos = { x = 2845.9, y = 260.0, z = -1345.4 }, rot = { x = 0.0, y = 268.9, z = 0.0 }, level = 10, drop_id = 303002, disableWander = true, pose_id = 9003 },
	{ config_id = 906, monster_id = 21010401, pos = { x = 2847.2, y = 260.4, z = -1340.2 }, rot = { x = 0.0, y = 207.2, z = 0.0 }, level = 10, drop_id = 303002, pose_id = 9003 },
	{ config_id = 907, monster_id = 20011001, pos = { x = 2844.3, y = 259.9, z = -1343.7 }, rot = { x = 0.0, y = 134.8, z = 0.0 }, level = 10, drop_id = 303002, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2993, gadget_id = 70210032, pos = { x = 2844.1, y = 259.8, z = -1347.7 }, rot = { x = 0.0, y = 187.9, z = 0.0 }, level = 1, chest_drop_id = 403102, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 3431, gadget_id = 70310003, pos = { x = 2841.1, y = 259.5, z = -1343.9 }, rot = { x = 0.0, y = 319.9, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 180, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2843.9, y = 259.8, z = -1345.6 } },
	{ config_id = 352, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2844.4, y = 259.9, z = -1345.0 } },
	{ config_id = 353, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2844.4, y = 259.9, z = -1345.0 } },
	{ config_id = 432, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2844.4, y = 259.9, z = -1345.0 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_180", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_180", action = "action_EVENT_ANY_MONSTER_DIE_180", tlog_tag = "望风山地_221_怪物营地_结算" },
	{ name = "CLIENT_EXECUTE_352", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_352", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_353", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_353", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_432", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_432", trigger_count = 0 }
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
		monsters = { 904, 905, 906, 907 },
		gadgets = { 2993, 3431 },
		regions = { 180, 352, 353, 432 },
		triggers = { "ANY_MONSTER_DIE_180", "CLIENT_EXECUTE_352", "CLIENT_EXECUTE_353", "CLIENT_EXECUTE_432" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_180(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_180(context, evt)
	-- 解锁目标2993
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 2993, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_352(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_353(context, evt)
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
function action_EVENT_CLIENT_EXECUTE_432(context, evt)
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
