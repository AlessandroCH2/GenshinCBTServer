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
	{ config_id = 3130, gadget_id = 70500000, pos = { x = 2076.6, y = 225.9, z = -1417.4 }, rot = { x = 0.0, y = 318.6, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 3131, gadget_id = 70500000, pos = { x = 2072.8, y = 225.6, z = -1410.4 }, rot = { x = 0.0, y = 193.3, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 3132, gadget_id = 70500000, pos = { x = 2078.2, y = 225.8, z = -1414.4 }, rot = { x = 0.0, y = 165.9, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 3133, gadget_id = 70210021, pos = { x = 2073.6, y = 225.6, z = -1415.6 }, rot = { x = 0.0, y = 51.9, z = 0.0 }, level = 1, chest_drop_id = 403322, isOneoff = true },
	{ config_id = 3140, gadget_id = 70900016, pos = { x = 2074.3, y = 225.6, z = -1411.7 }, rot = { x = 4.4, y = 234.8, z = 86.7 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 319, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2073.3, y = 229.0, z = -1416.5 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_319", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_319", trigger_count = 0 }
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
		gadgets = { 3130, 3131, 3132, 3133, 3140 },
		regions = { 319 },
		triggers = { "CLIENT_EXECUTE_319" },
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
function action_EVENT_CLIENT_EXECUTE_319(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
