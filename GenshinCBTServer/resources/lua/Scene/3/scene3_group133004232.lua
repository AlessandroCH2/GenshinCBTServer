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
	{ config_id = 1342, gadget_id = 70310001, pos = { x = 2694.6, y = 252.0, z = -373.9 }, rot = { x = 0.0, y = 161.9, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 1343, gadget_id = 70310001, pos = { x = 2687.4, y = 251.6, z = -372.6 }, rot = { x = 0.0, y = 10.2, z = 0.0 }, level = 1 },
	{ config_id = 1344, gadget_id = 70310001, pos = { x = 2691.2, y = 252.0, z = -369.3 }, rot = { x = 0.0, y = 246.2, z = 0.0 }, level = 1 },
	{ config_id = 1345, gadget_id = 70310001, pos = { x = 2690.1, y = 251.6, z = -376.6 }, rot = { x = 0.0, y = 14.4, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 1346, gadget_id = 70210031, pos = { x = 2691.1, y = 251.7, z = -373.0 }, rot = { x = 0.0, y = 315.1, z = 0.0 }, level = 1, chest_drop_id = 403343, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 255, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2701.9, y = 249.2, z = -355.1 } },
	{ config_id = 256, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2701.1, y = 249.2, z = -355.3 } },
	{ config_id = 257, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2701.2, y = 249.2, z = -355.7 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_255", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_255", action = "action_EVENT_GADGET_STATE_CHANGE_255", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_256", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_256", action = "action_EVENT_GADGET_STATE_CHANGE_256", trigger_count = 0 },
	{ name = "VARIABLE_CHANGE_257", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_257", action = "action_EVENT_VARIABLE_CHANGE_257", tlog_tag = "奔狼岭_232_谜题破解_结算" }
}

-- 变量
variables = {
	{ name = "num_1", value = 2, persistent = true }
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
		gadgets = { 1342, 1343, 1344, 1345 },
		regions = { 255, 256, 257 },
		triggers = { "GADGET_STATE_CHANGE_255", "GADGET_STATE_CHANGE_256", "VARIABLE_CHANGE_257" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_255(context, evt)
	if GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_255(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1") + 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num_1) then
	  return -1
	end
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_256(context, evt)
	if GadgetState.Default ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_256(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1") - 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num_1) then
	  return -1
	end
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_257(context, evt)
	-- 判断变量"num_1"为4
	if ScriptLib.GetGroupVariableValue(context, "num_1") ~= 4 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_257(context, evt)
	-- 创建id为1346的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1346 }) then
	  return -1
	end
	
	return 0
end
