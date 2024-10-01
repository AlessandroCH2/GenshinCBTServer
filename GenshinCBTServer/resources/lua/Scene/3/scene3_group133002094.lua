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
	{ config_id = 1330, gadget_id = 70210021, pos = { x = 1941.5, y = 246.4, z = -911.9 }, rot = { x = 0.0, y = 97.9, z = 0.0 }, level = 1, chest_drop_id = 403322, isOneoff = true },
	{ config_id = 1331, gadget_id = 70210011, pos = { x = 1741.7, y = 256.9, z = -825.7 }, rot = { x = 0.0, y = 285.8, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 1337, gadget_id = 70210011, pos = { x = 1970.3, y = 240.2, z = -370.4 }, rot = { x = 0.0, y = 318.4, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 1491, gadget_id = 70210011, pos = { x = 1954.6, y = 217.5, z = -643.1 }, rot = { x = 1.7, y = 1.9, z = 7.4 }, level = 1, chest_drop_id = 403302, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 255, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1944.6, y = 233.9, z = -971.2 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_255", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_255", trigger_count = 0 }
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
		gadgets = { 1330, 1331, 1337, 1491 },
		regions = { 255 },
		triggers = { "CLIENT_EXECUTE_255" },
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
function action_EVENT_CLIENT_EXECUTE_255(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
