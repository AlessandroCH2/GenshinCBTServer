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
	{ config_id = 1433, gadget_id = 70210011, pos = { x = 1785.6, y = 246.4, z = -604.8 }, rot = { x = 0.0, y = 283.0, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 1434, gadget_id = 70210011, pos = { x = 1790.9, y = 255.0, z = -516.4 }, rot = { x = 0.0, y = 119.4, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 1435, gadget_id = 70210011, pos = { x = 1850.7, y = 226.7, z = -391.5 }, rot = { x = 0.0, y = 283.0, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 1436, gadget_id = 70210011, pos = { x = 1807.5, y = 204.8, z = -274.1 }, rot = { x = 357.6, y = 124.8, z = 359.0 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 1437, gadget_id = 70210011, pos = { x = 1756.2, y = 216.9, z = -358.7 }, rot = { x = 357.6, y = 124.8, z = 359.0 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 1438, gadget_id = 70210011, pos = { x = 1738.8, y = 219.8, z = -393.5 }, rot = { x = 359.8, y = 188.4, z = 350.6 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 1441, gadget_id = 70210011, pos = { x = 1746.7, y = 238.7, z = -630.1 }, rot = { x = 0.0, y = 283.0, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 2128, gadget_id = 70210011, pos = { x = 1811.5, y = 217.9, z = -442.8 }, rot = { x = 0.0, y = 37.1, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 266, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1816.8, y = 245.2, z = -613.0 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_266", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_266", trigger_count = 0 }
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
		gadgets = { 1433, 1434, 1435, 1436, 1437, 1438, 1441, 2128 },
		regions = { 266 },
		triggers = { "CLIENT_EXECUTE_266" },
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
function action_EVENT_CLIENT_EXECUTE_266(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
