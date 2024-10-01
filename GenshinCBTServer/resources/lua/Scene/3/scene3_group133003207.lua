--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 826, monster_id = 28010203, pos = { x = 2319.8, y = 256.3, z = -1292.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 827, monster_id = 28010202, pos = { x = 2319.7, y = 256.5, z = -1291.0 }, rot = { x = 0.0, y = 169.1, z = 0.0 }, level = 0, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2938, gadget_id = 70210021, pos = { x = 2318.1, y = 256.6, z = -1292.0 }, rot = { x = 0.0, y = 87.4, z = 351.7 }, level = 1, chest_drop_id = 403322, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 166, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2320.3, y = 256.1, z = -1292.5 } },
	{ config_id = 339, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2320.7, y = 256.1, z = -1292.0 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_166", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_166", action = "action_EVENT_ANY_MONSTER_DIE_166" },
	{ name = "CLIENT_EXECUTE_339", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_339", trigger_count = 0 }
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
		monsters = { 826, 827 },
		gadgets = { },
		regions = { 166, 339 },
		triggers = { "ANY_MONSTER_DIE_166", "CLIENT_EXECUTE_339" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { 2938 },
		regions = { },
		triggers = { },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_166(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_166(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003207, suite = 2 }) then
			return -1
		end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_339(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
