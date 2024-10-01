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
	{ config_id = 3391, gadget_id = 70900014, pos = { x = 2277.6, y = 242.8, z = -1382.0 }, rot = { x = 0.0, y = 244.9, z = 0.0 }, level = 1, arguments = { 1, 2, 3 } },
	{ config_id = 3392, gadget_id = 70500000, pos = { x = 2277.7, y = 244.1, z = -1382.0 }, rot = { x = 0.0, y = 144.6, z = 0.0 }, level = 1, point_type = 2004 },
	{ config_id = 3393, gadget_id = 70210021, pos = { x = 2281.5, y = 243.7, z = -1380.6 }, rot = { x = 0.0, y = 248.9, z = 0.0 }, level = 1, chest_drop_id = 403322, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 268, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2278.1, y = 244.1, z = -1381.8 } },
	{ config_id = 408, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2274.8, y = 242.8, z = -1388.0 } }
}

-- 触发器
triggers = {
	{ name = "GATHER_268", event = EventType.EVENT_GATHER, source = "3392", condition = "", action = "action_EVENT_GATHER_268" },
	{ name = "CLIENT_EXECUTE_408", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_408", trigger_count = 0 }
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
		gadgets = { 3391, 3392 },
		regions = { 268, 408 },
		triggers = { "GATHER_268", "CLIENT_EXECUTE_408" },
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
function action_EVENT_GATHER_268(context, evt)
	-- 创建id为3393的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3393 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_408(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
