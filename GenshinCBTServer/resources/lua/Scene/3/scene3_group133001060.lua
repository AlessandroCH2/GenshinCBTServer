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
	{ config_id = 1498, gadget_id = 70620002, pos = { x = 1440.8, y = 281.3, z = -1862.4 }, rot = { x = 0.0, y = 317.2, z = 0.0 }, level = 1 },
	{ config_id = 1499, gadget_id = 70210011, pos = { x = 1442.5, y = 282.9, z = -1862.8 }, rot = { x = 0.0, y = 143.1, z = 0.0 }, level = 1, chest_drop_id = 403303, isOneoff = true, persistent = true },
	{ config_id = 1970, gadget_id = 70290001, pos = { x = 1423.0, y = 302.6, z = -1866.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1971, gadget_id = 70500000, pos = { x = 1423.0, y = 303.1, z = -1865.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1970 },
	{ config_id = 1972, gadget_id = 70500000, pos = { x = 1422.9, y = 303.4, z = -1866.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1970 },
	{ config_id = 1973, gadget_id = 70500000, pos = { x = 1423.2, y = 303.8, z = -1866.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1970 }
}

-- 区域
regions = {
	{ config_id = 272, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1450.6, y = 281.1, z = -1852.8 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_272", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_272", trigger_count = 0 }
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
		gadgets = { 1498, 1499, 1970, 1971, 1972, 1973 },
		regions = { 272 },
		triggers = { "CLIENT_EXECUTE_272" },
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
function action_EVENT_CLIENT_EXECUTE_272(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
