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
	{ config_id = 1224, gadget_id = 70310001, pos = { x = 2655.6, y = 202.7, z = -682.7 }, rot = { x = 358.6, y = 18.6, z = 358.8 }, level = 1, state = GadgetState.GearStart, persistent = true },
	{ config_id = 1225, gadget_id = 70310001, pos = { x = 2651.2, y = 202.8, z = -681.1 }, rot = { x = 0.0, y = 358.7, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 1226, gadget_id = 70210031, pos = { x = 2654.3, y = 203.2, z = -679.5 }, rot = { x = 6.1, y = 243.9, z = 1.0 }, level = 1, chest_drop_id = 403343, isOneoff = true },
	{ config_id = 1227, gadget_id = 70310001, pos = { x = 2656.7, y = 202.8, z = -678.3 }, rot = { x = 0.0, y = 3.4, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 1228, gadget_id = 70220006, pos = { x = 2653.8, y = 197.1, z = -679.5 }, rot = { x = 357.1, y = 335.0, z = 357.3 }, level = 1 },
	{ config_id = 1229, gadget_id = 70310001, pos = { x = 2652.9, y = 203.0, z = -676.9 }, rot = { x = 0.0, y = 359.1, z = 0.0 }, level = 1, persistent = true }
}

-- 区域
regions = {
	{ config_id = 237, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2651.8, y = 203.0, z = -677.8 } },
	{ config_id = 240, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2656.2, y = 202.8, z = -679.1 } },
	{ config_id = 241, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2657.8, y = 202.7, z = -678.8 } }
}

-- 触发器
triggers = {
	{ name = "VARIABLE_CHANGE_237", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_237", action = "action_EVENT_VARIABLE_CHANGE_237", tlog_tag = "奔狼岭_73_谜题破解_结算" },
	{ name = "GADGET_STATE_CHANGE_240", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_240", action = "action_EVENT_GADGET_STATE_CHANGE_240", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_241", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_241", action = "action_EVENT_GADGET_STATE_CHANGE_241", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "num_1", value = 1, persistent = true }
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
		gadgets = { 1224, 1225, 1227, 1228, 1229 },
		regions = { 237, 240, 241 },
		triggers = { "VARIABLE_CHANGE_237", "GADGET_STATE_CHANGE_240", "GADGET_STATE_CHANGE_241" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_237(context, evt)
	-- 判断变量"num_1"为4
	if ScriptLib.GetGroupVariableValue(context, "num_1") ~= 4 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_237(context, evt)
	-- 创建id为1226的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1226 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_240(context, evt)
	if GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_240(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1") + 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num_1) then
	  return -1
	end
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_241(context, evt)
	if GadgetState.Default ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_241(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1") - 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num_1) then
	  return -1
	end
	return 0
end
