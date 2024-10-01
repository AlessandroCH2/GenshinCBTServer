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
	{ config_id = 1398, gadget_id = 70210021, pos = { x = 1792.6, y = 243.0, z = -821.5 }, rot = { x = 0.0, y = 113.8, z = 0.0 }, level = 1, chest_drop_id = 403322, isOneoff = true },
	{ config_id = 1552, gadget_id = 70210021, pos = { x = 1900.9, y = 206.5, z = -166.7 }, rot = { x = 18.5, y = 221.8, z = 356.2 }, level = 1, chest_drop_id = 403322, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 260, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1795.0, y = 242.8, z = -823.3 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_260", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_260", trigger_count = 0 }
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
		gadgets = { 1398, 1552 },
		regions = { 260 },
		triggers = { "CLIENT_EXECUTE_260" },
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
function action_EVENT_CLIENT_EXECUTE_260(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
