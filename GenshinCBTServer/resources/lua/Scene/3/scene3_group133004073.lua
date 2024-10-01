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
	{ config_id = 271, gadget_id = 70310003, pos = { x = 2224.9, y = 213.7, z = -473.0 }, rot = { x = 0.0, y = 9.4, z = 0.0 }, level = 1, state = GadgetState.GearStart, persistent = true },
	{ config_id = 272, gadget_id = 70310003, pos = { x = 2219.8, y = 213.8, z = -463.3 }, rot = { x = 0.0, y = 358.7, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 287, gadget_id = 70210031, pos = { x = 2224.8, y = 214.2, z = -465.9 }, rot = { x = 6.1, y = 243.9, z = 1.0 }, level = 1, chest_drop_id = 403343, isOneoff = true },
	{ config_id = 339, gadget_id = 70310003, pos = { x = 2228.7, y = 214.5, z = -463.5 }, rot = { x = 0.0, y = 3.4, z = 0.0 }, level = 1, state = GadgetState.GearStart, persistent = true },
	{ config_id = 492, gadget_id = 70220006, pos = { x = 2225.1, y = 208.2, z = -465.7 }, rot = { x = 359.9, y = 334.9, z = 3.5 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 71, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2224.4, y = 214.1, z = -465.6 } },
	{ config_id = 72, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2224.6, y = 214.1, z = -465.3 } },
	{ config_id = 110, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2216.6, y = 213.6, z = -470.9 } },
	{ config_id = 111, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2216.6, y = 213.6, z = -470.9 } },
	{ config_id = 158, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2229.1, y = 214.4, z = -466.6 } },
	{ config_id = 159, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2230.6, y = 214.6, z = -466.3 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_71", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_71", trigger_count = 0 },
	{ name = "VARIABLE_CHANGE_72", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_72", action = "action_EVENT_VARIABLE_CHANGE_72", tlog_tag = "奔狼岭_73_谜题破解_结算" },
	{ name = "CLIENT_EXECUTE_110", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_110", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_111", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_111", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_158", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_158", action = "action_EVENT_GADGET_STATE_CHANGE_158", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_159", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_159", action = "action_EVENT_GADGET_STATE_CHANGE_159", trigger_count = 0 }
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
		gadgets = { 271, 272, 339, 492 },
		regions = { 71, 72, 110, 111, 158, 159 },
		triggers = { "CLIENT_EXECUTE_71", "VARIABLE_CHANGE_72", "CLIENT_EXECUTE_110", "CLIENT_EXECUTE_111", "GADGET_STATE_CHANGE_158", "GADGET_STATE_CHANGE_159" },
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
function action_EVENT_CLIENT_EXECUTE_71(context, evt)
	-- 针对groupid为 133004073 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
		if evt.param1 == 1 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133004073, this_gadget, GadgetState.GearStart )
			return 0
		end
	
		if evt.param1 == 0 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133004073, this_gadget, GadgetState.Default )
			return 0
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_72(context, evt)
	-- 判断变量"num_1"为3
	if ScriptLib.GetGroupVariableValue(context, "num_1") ~= 3 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_72(context, evt)
	-- 创建id为287的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 287 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_110(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_111(context, evt)
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

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_158(context, evt)
	if GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_158(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1") + 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num_1) then
	  return -1
	end
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_159(context, evt)
	if GadgetState.Default ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_159(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1") - 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num_1) then
	  return -1
	end
	return 0
end
