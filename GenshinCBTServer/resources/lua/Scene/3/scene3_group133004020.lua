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
	{ config_id = 223, gadget_id = 70210011, pos = { x = 2131.9, y = 227.6, z = -511.8 }, rot = { x = 359.5, y = 184.6, z = 0.6 }, level = 1, chest_drop_id = 403301, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 94, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2147.7, y = 219.8, z = -468.0 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_94", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_94", trigger_count = 0 }
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
		gadgets = { 223 },
		regions = { 94 },
		triggers = { "CLIENT_EXECUTE_94" },
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
function action_EVENT_CLIENT_EXECUTE_94(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
