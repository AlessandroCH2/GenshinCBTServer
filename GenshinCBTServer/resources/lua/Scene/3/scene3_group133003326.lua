--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1062, monster_id = 20011501, pos = { x = 2878.0, y = 260.5, z = -1442.2 }, rot = { x = 0.0, y = 230.3, z = 0.0 }, level = 13, drop_id = 303043 },
	{ config_id = 1063, monster_id = 20011501, pos = { x = 2876.3, y = 260.6, z = -1441.8 }, rot = { x = 0.0, y = 177.0, z = 0.0 }, level = 13, drop_id = 303043 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3331, gadget_id = 70210032, pos = { x = 2876.5, y = 260.5, z = -1444.1 }, rot = { x = 0.0, y = 17.5, z = 0.0 }, level = 1, chest_drop_id = 403322, state = GadgetState.ChestLocked, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 249, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2876.6, y = 260.5, z = -1443.6 } },
	{ config_id = 399, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2878.9, y = 260.7, z = -1440.7 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_249", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_249", action = "action_EVENT_ANY_MONSTER_DIE_249" },
	{ name = "CLIENT_EXECUTE_399", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_399", trigger_count = 0 }
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
		monsters = { 1062, 1063 },
		gadgets = { 3331 },
		regions = { 249, 399 },
		triggers = { "ANY_MONSTER_DIE_249", "CLIENT_EXECUTE_399" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_249(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_249(context, evt)
	-- 解锁目标3331
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3331, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_399(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
