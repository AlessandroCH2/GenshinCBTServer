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
	{ config_id = 3, gadget_id = 70210011, pos = { x = 2320.9, y = 250.6, z = -853.7 }, rot = { x = 0.0, y = 273.6, z = 0.0 }, level = 1, chest_drop_id = 403301, isOneoff = true },
	{ config_id = 4, gadget_id = 70210011, pos = { x = 2263.6, y = 240.1, z = -833.6 }, rot = { x = 0.0, y = 27.1, z = 0.0 }, level = 1, chest_drop_id = 403301, isOneoff = true },
	{ config_id = 5, gadget_id = 70210011, pos = { x = 2194.1, y = 230.5, z = -789.3 }, rot = { x = 0.0, y = 26.3, z = 0.0 }, level = 1, chest_drop_id = 403301, isOneoff = true },
	{ config_id = 6, gadget_id = 70210011, pos = { x = 2212.2, y = 210.9, z = -932.5 }, rot = { x = 0.0, y = 339.7, z = 0.0 }, level = 1, chest_drop_id = 403301, isOneoff = true },
	{ config_id = 7, gadget_id = 70210011, pos = { x = 2264.4, y = 221.5, z = -936.9 }, rot = { x = 0.0, y = 251.8, z = 0.0 }, level = 1, chest_drop_id = 403301, isOneoff = true },
	{ config_id = 8, gadget_id = 70210011, pos = { x = 2186.5, y = 210.1, z = -872.4 }, rot = { x = 0.0, y = 253.1, z = 0.0 }, level = 1, chest_drop_id = 403301, isOneoff = true },
	{ config_id = 9, gadget_id = 70210011, pos = { x = 2303.6, y = 214.1, z = -929.8 }, rot = { x = 0.0, y = 230.4, z = 0.0 }, level = 1, chest_drop_id = 403301, isOneoff = true },
	{ config_id = 10, gadget_id = 70210011, pos = { x = 2229.1, y = 236.1, z = -752.5 }, rot = { x = 0.0, y = 73.0, z = 0.0 }, level = 1, chest_drop_id = 403301, isOneoff = true },
	{ config_id = 11, gadget_id = 70210011, pos = { x = 2286.6, y = 236.5, z = -876.5 }, rot = { x = 0.0, y = 297.4, z = 0.0 }, level = 1, chest_drop_id = 403301, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 87, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2372.1, y = 208.1, z = -899.7 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_87", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_87", trigger_count = 0 }
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
		-- description = 蒙德城内宝箱,
		monsters = { },
		gadgets = { 3 },
		regions = { 87 },
		triggers = { "CLIENT_EXECUTE_87" },
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
function action_EVENT_CLIENT_EXECUTE_87(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
