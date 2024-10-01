--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1030, monster_id = 21020101, pos = { x = 2651.9, y = 268.6, z = -1565.3 }, rot = { x = 0.0, y = 64.7, z = 0.0 }, level = 13, drop_id = 303103, pose_id = 401 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3282, gadget_id = 70310001, pos = { x = 2654.2, y = 268.5, z = -1566.9 }, rot = { x = 0.0, y = 146.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 3283, gadget_id = 70220005, pos = { x = 2650.5, y = 268.8, z = -1563.7 }, rot = { x = 0.0, y = 259.1, z = 0.0 }, level = 10 },
	{ config_id = 3284, gadget_id = 70210032, pos = { x = 2648.7, y = 268.4, z = -1567.0 }, rot = { x = 0.0, y = 58.7, z = 0.0 }, level = 1, chest_drop_id = 403343, state = GadgetState.ChestLocked, isOneoff = true },
	{ config_id = 3285, gadget_id = 70210011, pos = { x = 2644.9, y = 267.7, z = -1572.9 }, rot = { x = 0.0, y = 187.6, z = 0.0 }, level = 1, chest_drop_id = 403303, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 232, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2650.0, y = 268.5, z = -1566.0 } },
	{ config_id = 390, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2651.1, y = 269.3, z = -1566.5 } },
	{ config_id = 391, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2651.1, y = 269.3, z = -1566.5 } },
	{ config_id = 438, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2651.1, y = 269.3, z = -1566.5 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_232", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_232", action = "action_EVENT_ANY_MONSTER_DIE_232", tlog_tag = "望风山地_315_封印宝箱_结算" },
	{ name = "CLIENT_EXECUTE_390", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_390", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_391", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_391", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_438", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_438", trigger_count = 0 }
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
		monsters = { 1030 },
		gadgets = { 3282, 3283, 3284, 3285 },
		regions = { 232, 390, 391, 438 },
		triggers = { "ANY_MONSTER_DIE_232", "CLIENT_EXECUTE_390", "CLIENT_EXECUTE_391", "CLIENT_EXECUTE_438" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_232(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_232(context, evt)
	-- 解锁目标3284
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3284, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_390(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_391(context, evt)
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
function action_EVENT_CLIENT_EXECUTE_438(context, evt)
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
