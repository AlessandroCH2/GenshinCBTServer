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
	{ config_id = 327, gadget_id = 70310001, pos = { x = 2334.6, y = 266.9, z = -367.5 }, rot = { x = 0.0, y = 99.5, z = 0.0 }, level = 1 },
	{ config_id = 328, gadget_id = 70310001, pos = { x = 2325.0, y = 261.5, z = -381.5 }, rot = { x = 0.0, y = 141.9, z = 0.0 }, level = 1 },
	{ config_id = 329, gadget_id = 70310001, pos = { x = 2326.3, y = 264.1, z = -367.7 }, rot = { x = 0.0, y = 295.8, z = 0.0 }, level = 1 },
	{ config_id = 330, gadget_id = 70310001, pos = { x = 2333.1, y = 264.9, z = -378.9 }, rot = { x = 0.0, y = 60.2, z = 0.0 }, level = 1 },
	{ config_id = 333, gadget_id = 70210031, pos = { x = 2338.2, y = 271.5, z = -363.1 }, rot = { x = 0.0, y = 178.8, z = 354.9 }, level = 1, chest_drop_id = 403343, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 77, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2322.4, y = 263.6, z = -368.6 } },
	{ config_id = 79, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2323.0, y = 263.2, z = -367.7 } },
	{ config_id = 80, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2325.1, y = 263.9, z = -381.3 } },
	{ config_id = 81, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2333.8, y = 264.0, z = -379.3 } },
	{ config_id = 82, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2334.6, y = 267.1, z = -367.5 } },
	{ config_id = 116, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2322.6, y = 261.4, z = -368.1 } },
	{ config_id = 117, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2322.6, y = 261.4, z = -368.1 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_77", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_77", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_79", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_79", action = "action_EVENT_GADGET_STATE_CHANGE_79", trigger_count = 0, tlog_tag = "奔狼岭_85_谜题破解_结算" },
	{ name = "GADGET_STATE_CHANGE_80", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_80", action = "action_EVENT_GADGET_STATE_CHANGE_80", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_81", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_81", action = "action_EVENT_GADGET_STATE_CHANGE_81", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_82", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_82", action = "action_EVENT_GADGET_STATE_CHANGE_82", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_116", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_116", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_117", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_117", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "num_1", value = 0, persistent = true }
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
		gadgets = { 327, 328, 329, 330 },
		regions = { 77, 79, 80, 81, 82, 116, 117 },
		triggers = { "CLIENT_EXECUTE_77", "GADGET_STATE_CHANGE_79", "GADGET_STATE_CHANGE_80", "GADGET_STATE_CHANGE_81", "GADGET_STATE_CHANGE_82", "CLIENT_EXECUTE_116", "CLIENT_EXECUTE_117" },
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
function action_EVENT_CLIENT_EXECUTE_77(context, evt)
	-- 针对groupid为 133004085 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
		if evt.param1 == 1 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133004085, this_gadget, GadgetState.GearStart )
			return 0
		end
	
		if evt.param1 == 0 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133004085, this_gadget, GadgetState.Default )
			return 0
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_79(context, evt)
	if 329 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_79(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1")
	local c_num = c_num_1 +1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num) then
	  return -1
	end
	
	if c_num == 4 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 333 }) then
		  return -1
		end
	end
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_80(context, evt)
	if 328 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_80(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1")
	local c_num = c_num_1 +1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num) then
	  return -1
	end
	
	if c_num == 4 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 333 }) then
		  return -1
		end
	end
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_81(context, evt)
	if 330 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_81(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1")
	local c_num = c_num_1 +1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num) then
	  return -1
	end
	
	if c_num == 4 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 333 }) then
		  return -1
		end
	end
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_82(context, evt)
	if 327 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_82(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1")
	local c_num = c_num_1 +1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num) then
	  return -1
	end
	
	if c_num == 4 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 333 }) then
		  return -1
		end
	end
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_116(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_117(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	local this_group = ScriptLib.GetContextGroupId(context)
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.Default )
		return 0
	end
	return 0
end
