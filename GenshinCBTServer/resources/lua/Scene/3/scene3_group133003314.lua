--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1028, monster_id = 20010801, pos = { x = 2820.9, y = 256.2, z = -1401.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13, drop_id = 303043 },
	{ config_id = 1029, monster_id = 20010801, pos = { x = 2818.2, y = 256.2, z = -1400.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13, drop_id = 303043 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3281, gadget_id = 70210011, pos = { x = 2823.9, y = 257.6, z = -1404.7 }, rot = { x = 0.0, y = 288.1, z = 348.5 }, level = 1, chest_drop_id = 403302, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 389, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2824.5, y = 256.2, z = -1399.8 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_389", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_389", trigger_count = 0 }
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
		monsters = { 1028, 1029 },
		gadgets = { 3281 },
		regions = { 389 },
		triggers = { "CLIENT_EXECUTE_389" },
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
function action_EVENT_CLIENT_EXECUTE_389(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
