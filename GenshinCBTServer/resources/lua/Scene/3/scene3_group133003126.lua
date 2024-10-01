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
	{ config_id = 2560, gadget_id = 70210011, pos = { x = 2330.4, y = 277.3, z = -1668.9 }, rot = { x = 0.0, y = 348.6, z = 14.3 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 2618, gadget_id = 70220021, pos = { x = 2329.5, y = 275.5, z = -1631.1 }, rot = { x = 0.0, y = 266.1, z = 0.0 }, level = 1 },
	{ config_id = 2619, gadget_id = 70220005, pos = { x = 2328.8, y = 275.6, z = -1635.3 }, rot = { x = 0.0, y = 274.2, z = 0.0 }, level = 5 },
	{ config_id = 2634, gadget_id = 70210021, pos = { x = 2328.0, y = 275.5, z = -1631.4 }, rot = { x = 0.0, y = 265.2, z = 0.0 }, level = 1, chest_drop_id = 403322, isOneoff = true },
	{ config_id = 2838, gadget_id = 70210011, pos = { x = 2282.0, y = 274.3, z = -1689.6 }, rot = { x = 0.0, y = 187.9, z = 0.0 }, level = 1, chest_drop_id = 403303, isOneoff = true },
	{ config_id = 2843, gadget_id = 70210011, pos = { x = 2148.5, y = 234.8, z = -1577.5 }, rot = { x = 0.0, y = 191.9, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 312, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2296.8, y = 270.7, z = -1666.0 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_312", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_312", trigger_count = 0 }
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
		gadgets = { 2560, 2618, 2619, 2634, 2838, 2843 },
		regions = { 312 },
		triggers = { "CLIENT_EXECUTE_312" },
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
function action_EVENT_CLIENT_EXECUTE_312(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
