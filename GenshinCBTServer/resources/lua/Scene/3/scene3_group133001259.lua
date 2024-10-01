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
	{ config_id = 2932, gadget_id = 70500000, pos = { x = 1561.6, y = 294.8, z = -1215.2 }, rot = { x = 0.0, y = 339.2, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2933, gadget_id = 70500000, pos = { x = 1557.2, y = 296.2, z = -1213.1 }, rot = { x = 0.0, y = 339.2, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2934, gadget_id = 70500000, pos = { x = 1558.4, y = 296.4, z = -1209.2 }, rot = { x = 0.0, y = 339.2, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2935, gadget_id = 70500000, pos = { x = 1561.7, y = 295.3, z = -1210.8 }, rot = { x = 0.0, y = 339.2, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2936, gadget_id = 70210021, pos = { x = 1559.2, y = 295.7, z = -1212.4 }, rot = { x = 11.6, y = 113.1, z = 0.0 }, level = 1, chest_drop_id = 403321, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 354, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1559.1, y = 295.8, z = -1212.4 } },
	{ config_id = 355, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1558.6, y = 295.9, z = -1212.8 } }
}

-- 触发器
triggers = {
	{ name = "GATHER_354", event = EventType.EVENT_GATHER, source = "", condition = "condition_EVENT_GATHER_354", action = "action_EVENT_GATHER_354", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_355", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_355", trigger_count = 0 }
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
		gadgets = { 2932, 2933, 2934, 2935 },
		regions = { 354, 355 },
		triggers = { "GATHER_354", "CLIENT_EXECUTE_355" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GATHER_354(context, evt)
	-- 判断指定group组剩余gadget数量是否是0 
	if ScriptLib.CheckRemainGadgetCountByGroupId(context, {group_id = 133001259}) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GATHER_354(context, evt)
	-- 创建id为2936的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2936 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_355(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
