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
	{ config_id = 3007, gadget_id = 70210011, pos = { x = 2757.9, y = 274.0, z = -1156.3 }, rot = { x = 348.8, y = 34.1, z = 359.1 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 3312, gadget_id = 70290002, pos = { x = 2770.0, y = 274.9, z = -1155.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3313, gadget_id = 70500000, pos = { x = 2769.0, y = 276.5, z = -1155.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 3312 },
	{ config_id = 3314, gadget_id = 70500000, pos = { x = 2770.9, y = 277.5, z = -1156.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 3312 },
	{ config_id = 3315, gadget_id = 70500000, pos = { x = 2770.1, y = 277.8, z = -1154.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 3312 }
}

-- 区域
regions = {
	{ config_id = 357, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2757.8, y = 274.6, z = -1154.0 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_357", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_357", trigger_count = 0 }
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
		gadgets = { 3007, 3312, 3313, 3314, 3315 },
		regions = { 357 },
		triggers = { "CLIENT_EXECUTE_357" },
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
function action_EVENT_CLIENT_EXECUTE_357(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
