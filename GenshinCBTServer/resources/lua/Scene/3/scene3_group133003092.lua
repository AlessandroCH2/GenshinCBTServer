--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 476, monster_id = 21010301, pos = { x = 2190.0, y = 212.4, z = -1477.4 }, rot = { x = 0.0, y = 113.9, z = 0.0 }, level = 5, drop_id = 303000, disableWander = true, pose_id = 9003 },
	{ config_id = 477, monster_id = 21010201, pos = { x = 2192.1, y = 213.2, z = -1464.2 }, rot = { x = 0.0, y = 235.8, z = 0.0 }, level = 5, drop_id = 303000 },
	{ config_id = 478, monster_id = 21030301, pos = { x = 2192.5, y = 212.6, z = -1480.4 }, rot = { x = 0.0, y = 346.1, z = 0.0 }, level = 5, drop_id = 303000, disableWander = true },
	{ config_id = 479, monster_id = 21010401, pos = { x = 2194.5, y = 213.0, z = -1488.4 }, rot = { x = 0.0, y = 75.0, z = 0.0 }, level = 5, drop_id = 303000, disableWander = true, pose_id = 9003 },
	{ config_id = 910, monster_id = 21010401, pos = { x = 2201.8, y = 212.1, z = -1478.8 }, rot = { x = 0.0, y = 305.3, z = 0.0 }, level = 5, drop_id = 303002, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2430, gadget_id = 70210032, pos = { x = 2203.6, y = 212.0, z = -1482.8 }, rot = { x = 0.0, y = 310.9, z = 0.0 }, level = 1, chest_drop_id = 403122, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 2568, gadget_id = 70210011, pos = { x = 2240.2, y = 229.9, z = -1466.3 }, rot = { x = 0.8, y = 235.3, z = 349.7 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 2854, gadget_id = 70310001, pos = { x = 2195.4, y = 213.1, z = -1465.9 }, rot = { x = 0.0, y = 167.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 2855, gadget_id = 70310001, pos = { x = 2196.2, y = 212.6, z = -1484.4 }, rot = { x = 0.0, y = 167.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 3004, gadget_id = 70220005, pos = { x = 2192.3, y = 213.3, z = -1462.9 }, rot = { x = 0.0, y = 350.8, z = 0.0 }, level = 6 },
	{ config_id = 3005, gadget_id = 70220005, pos = { x = 2196.3, y = 212.6, z = -1486.2 }, rot = { x = 0.0, y = 18.6, z = 0.0 }, level = 6 },
	{ config_id = 3006, gadget_id = 70310006, pos = { x = 2192.3, y = 212.4, z = -1478.7 }, rot = { x = 0.0, y = 296.5, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 81, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2197.9, y = 212.0, z = -1477.4 } },
	{ config_id = 296, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2190.5, y = 212.0, z = -1476.6 } },
	{ config_id = 297, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2190.5, y = 212.0, z = -1476.6 } },
	{ config_id = 420, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2190.5, y = 212.0, z = -1476.6 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_81", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_81", action = "action_EVENT_ANY_MONSTER_DIE_81", tlog_tag = "神殿_营地_低洼_完成" },
	{ name = "CLIENT_EXECUTE_296", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_296", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_297", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_297", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_420", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_420", trigger_count = 0 }
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
		monsters = { 476, 477, 478, 479, 910 },
		gadgets = { 2430, 2568, 2854, 2855, 3004, 3005, 3006 },
		regions = { 81, 296, 297, 420 },
		triggers = { "ANY_MONSTER_DIE_81", "CLIENT_EXECUTE_296", "CLIENT_EXECUTE_297", "CLIENT_EXECUTE_420" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_81(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_81(context, evt)
	-- 解锁目标2430
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 2430, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_296(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_297(context, evt)
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
function action_EVENT_CLIENT_EXECUTE_420(context, evt)
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
