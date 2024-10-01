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
	{ config_id = 3332, gadget_id = 70500000, pos = { x = 2883.6, y = 260.6, z = -1445.0 }, rot = { x = 0.0, y = 301.5, z = 0.0 }, level = 1, point_type = 1002 },
	{ config_id = 3333, gadget_id = 70500000, pos = { x = 2886.9, y = 260.5, z = -1444.2 }, rot = { x = 0.0, y = 26.8, z = 0.0 }, level = 1, point_type = 1002 },
	{ config_id = 3334, gadget_id = 70500000, pos = { x = 2873.5, y = 261.5, z = -1436.7 }, rot = { x = 0.0, y = 63.0, z = 0.0 }, level = 1, point_type = 1002 },
	{ config_id = 3335, gadget_id = 70210011, pos = { x = 2869.8, y = 257.1, z = -1429.0 }, rot = { x = 0.0, y = 37.1, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 400, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2885.1, y = 260.5, z = -1443.3 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_400", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_400", trigger_count = 0 }
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
		gadgets = { 3332, 3333, 3334, 3335 },
		regions = { 400 },
		triggers = { "CLIENT_EXECUTE_400" },
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
function action_EVENT_CLIENT_EXECUTE_400(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
