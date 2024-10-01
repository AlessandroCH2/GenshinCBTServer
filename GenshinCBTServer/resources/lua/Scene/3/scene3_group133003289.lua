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
	{ config_id = 3421, gadget_id = 70500000, pos = { x = 2849.8, y = 252.1, z = -1767.9 }, rot = { x = 0.0, y = 273.6, z = 0.0 }, level = 1, point_type = 2001 },
	{ config_id = 3427, gadget_id = 70210011, pos = { x = 2859.1, y = 253.8, z = -1745.4 }, rot = { x = 4.5, y = 153.2, z = 359.3 }, level = 1, chest_drop_id = 403304, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 370, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2869.3, y = 254.1, z = -1743.6 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_370", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_370", trigger_count = 0 }
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
		gadgets = { 3421, 3427 },
		regions = { 370 },
		triggers = { "CLIENT_EXECUTE_370" },
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
function action_EVENT_CLIENT_EXECUTE_370(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
