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
	{ config_id = 3028, gadget_id = 70210011, pos = { x = 2788.7, y = 296.9, z = -1565.0 }, rot = { x = 0.0, y = 1.2, z = 0.0 }, level = 1, chest_drop_id = 403303, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 363, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2791.3, y = 296.1, z = -1564.5 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_363", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_363", trigger_count = 0 }
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
		gadgets = { 3028 },
		regions = { 363 },
		triggers = { "CLIENT_EXECUTE_363" },
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
function action_EVENT_CLIENT_EXECUTE_363(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
