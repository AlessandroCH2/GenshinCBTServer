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
	{ config_id = 1029, gadget_id = 70210021, pos = { x = 1736.8, y = 241.1, z = -945.7 }, rot = { x = 13.4, y = 91.0, z = 7.1 }, level = 1, chest_drop_id = 403322, isOneoff = true },
	{ config_id = 1377, gadget_id = 70220021, pos = { x = 1738.4, y = 241.4, z = -946.6 }, rot = { x = 359.7, y = 302.0, z = 1.3 }, level = 1 },
	{ config_id = 1393, gadget_id = 70220024, pos = { x = 1687.8, y = 257.6, z = -724.6 }, rot = { x = 0.8, y = 144.0, z = 5.2 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 252, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1691.4, y = 259.5, z = -728.7 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_252", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_252", trigger_count = 0 }
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
		gadgets = { 1029, 1377, 1393 },
		regions = { 252 },
		triggers = { "CLIENT_EXECUTE_252" },
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
function action_EVENT_CLIENT_EXECUTE_252(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
