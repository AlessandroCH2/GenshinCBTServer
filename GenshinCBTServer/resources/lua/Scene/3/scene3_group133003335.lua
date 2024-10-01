--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1081, monster_id = 28020301, pos = { x = 2928.4, y = 251.8, z = -1639.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, drop_id = 200601, affix = { 1901 } }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3365, gadget_id = 70210011, pos = { x = 2912.2, y = 253.7, z = -1622.7 }, rot = { x = 0.0, y = 52.5, z = 4.4 }, level = 1, chest_drop_id = 403304, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 405, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2904.4, y = 251.9, z = -1649.1 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_405", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_405", trigger_count = 0 }
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
		monsters = { 1081 },
		gadgets = { 3365 },
		regions = { 405 },
		triggers = { "CLIENT_EXECUTE_405" },
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
function action_EVENT_CLIENT_EXECUTE_405(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
