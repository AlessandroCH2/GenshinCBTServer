--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 236, monster_id = 20010801, pos = { x = 2453.1, y = 220.4, z = -1393.8 }, rot = { x = 0.0, y = 59.9, z = 0.0 }, level = 5, drop_id = 303041 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1373, gadget_id = 70210022, pos = { x = 2450.2, y = 219.6, z = -1396.8 }, rot = { x = 355.9, y = 60.0, z = 358.6 }, level = 5, chest_drop_id = 403220, state = GadgetState.ChestLocked, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 14, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2452.6, y = 220.5, z = -1393.3 } },
	{ config_id = 290, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2451.7, y = 220.9, z = -1381.4 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_14", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_14", action = "action_EVENT_ANY_MONSTER_DIE_14" },
	{ name = "CLIENT_EXECUTE_290", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_290", trigger_count = 0 }
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
		monsters = { 236 },
		gadgets = { 1373 },
		regions = { 14, 290 },
		triggers = { "ANY_MONSTER_DIE_14", "CLIENT_EXECUTE_290" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_14(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_14(context, evt)
	-- 解锁目标1373
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 1373, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_290(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
