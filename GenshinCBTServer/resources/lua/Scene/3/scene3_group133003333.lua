--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3362, gadget_id = 70210011, pos = { x = 2850.4, y = 255.1, z = -1801.0 }, rot = { x = 1.6, y = 349.4, z = 350.9 }, level = 1, chest_drop_id = 403304, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 403, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2848.4, y = 255.0, z = -1796.5 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_403", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_403", trigger_count = 0 }
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
		monsters = { },
		gadgets = { 3362 },
		regions = { 403 },
		triggers = { "CLIENT_EXECUTE_403" },
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
function action_EVENT_CLIENT_EXECUTE_403(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
