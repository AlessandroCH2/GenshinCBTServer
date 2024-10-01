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
	{ config_id = 2592, gadget_id = 70210021, pos = { x = 2103.9, y = 214.3, z = -1362.4 }, rot = { x = 0.0, y = 305.7, z = 0.0 }, level = 1, chest_drop_id = 403321, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 318, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2091.7, y = 214.8, z = -1358.1 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_318", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_318", trigger_count = 0 }
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
		gadgets = { 2592 },
		regions = { 318 },
		triggers = { "CLIENT_EXECUTE_318" },
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
function action_EVENT_CLIENT_EXECUTE_318(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
