--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 224, monster_id = 20011401, pos = { x = 2233.7, y = 203.7, z = -476.5 }, rot = { x = 0.0, y = 282.3, z = 0.0 }, level = 10, drop_id = 303002, disableWander = true },
	{ config_id = 338, monster_id = 21010101, pos = { x = 2221.0, y = 204.0, z = -501.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 11 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 233, gadget_id = 70210011, pos = { x = 2235.4, y = 202.9, z = -476.7 }, rot = { x = 357.9, y = 296.4, z = 359.1 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 290, gadget_id = 70210011, pos = { x = 2208.6, y = 220.9, z = -477.4 }, rot = { x = 9.3, y = 19.8, z = 2.3 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 291, gadget_id = 70290003, pos = { x = 2208.7, y = 220.4, z = -475.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 292, gadget_id = 70500000, pos = { x = 2208.7, y = 220.5, z = -476.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3003, owner = 291 },
	{ config_id = 293, gadget_id = 70500000, pos = { x = 2208.7, y = 220.5, z = -475.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3003, owner = 291 },
	{ config_id = 493, gadget_id = 70290001, pos = { x = 2194.7, y = 211.3, z = -510.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 494, gadget_id = 70500000, pos = { x = 2194.7, y = 211.9, z = -510.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 493 },
	{ config_id = 495, gadget_id = 70500000, pos = { x = 2194.6, y = 212.2, z = -511.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 493 },
	{ config_id = 496, gadget_id = 70500000, pos = { x = 2194.9, y = 212.6, z = -510.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 493 }
}

-- 区域
regions = {
	{ config_id = 106, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2221.9, y = 202.6, z = -489.9 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_106", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_106", trigger_count = 0 }
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
		monsters = { 224, 338 },
		gadgets = { 233, 290, 291, 292, 293, 493, 494, 495, 496 },
		regions = { 106 },
		triggers = { "CLIENT_EXECUTE_106" },
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
function action_EVENT_CLIENT_EXECUTE_106(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
