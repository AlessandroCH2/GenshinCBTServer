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
	{ config_id = 22, gadget_id = 70310001, pos = { x = 1999.9, y = 221.9, z = -1576.7 }, rot = { x = 0.0, y = 79.8, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 23, gadget_id = 70310001, pos = { x = 2018.2, y = 221.5, z = -1558.6 }, rot = { x = 0.0, y = 118.2, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 24, gadget_id = 70310001, pos = { x = 2002.5, y = 221.0, z = -1544.4 }, rot = { x = 0.0, y = 16.6, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 25, gadget_id = 70310001, pos = { x = 1970.8, y = 228.6, z = -1571.7 }, rot = { x = 0.0, y = 108.4, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 26, gadget_id = 70210042, pos = { x = 2000.8, y = 221.1, z = -1570.6 }, rot = { x = 2.5, y = 0.7, z = 0.0 }, level = 1, chest_drop_id = 403241, state = GadgetState.ChestLocked, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 14, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1986.7, y = 221.2, z = -1552.4 } },
	{ config_id = 15, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1985.6, y = 221.3, z = -1553.8 } },
	{ config_id = 16, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1985.8, y = 221.2, z = -1551.9 } },
	{ config_id = 17, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1985.9, y = 221.1, z = -1549.5 } },
	{ config_id = 18, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1984.4, y = 221.1, z = -1545.1 } },
	{ config_id = 30, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1987.7, y = 221.1, z = -1539.9 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_14", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_14", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_15", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_15", action = "action_EVENT_GADGET_STATE_CHANGE_15", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_16", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_16", action = "action_EVENT_GADGET_STATE_CHANGE_16", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_17", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_17", action = "action_EVENT_GADGET_STATE_CHANGE_17", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_18", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_18", action = "action_EVENT_GADGET_STATE_CHANGE_18", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_30", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_30", action = "", tlog_tag = "小平原_火把解谜_遗迹_结束" }
}

-- 变量
variables = {
	{ name = "fire22", value = 0, persistent = true },
	{ name = "fire23", value = 0, persistent = true },
	{ name = "fire24", value = 0, persistent = true },
	{ name = "fire25", value = 0, persistent = true }
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
		gadgets = { 22, 23, 24, 25, 26 },
		regions = { 14, 15, 16, 17, 18, 30 },
		triggers = { "CLIENT_EXECUTE_14", "GADGET_STATE_CHANGE_15", "GADGET_STATE_CHANGE_16", "GADGET_STATE_CHANGE_17", "GADGET_STATE_CHANGE_18", "GADGET_STATE_CHANGE_30" },
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
function action_EVENT_CLIENT_EXECUTE_14(context, evt)
	-- 针对groupid为 133005011 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
		if evt.param1 == 1 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133005011, this_gadget, GadgetState.GearStart )
			return 0
		end
	
		if evt.param1 == 0 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133005011, this_gadget, GadgetState.Default )
			return 0
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_15(context, evt)
	if 22 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_15(context, evt)
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "fire22", 1) then
		  return -1
		end
		
		local c_fire22 = ScriptLib.GetGroupVariableValue(context, "fire22")
		local c_fire23 = ScriptLib.GetGroupVariableValue(context, "fire23")
		local c_fire24 = ScriptLib.GetGroupVariableValue(context, "fire24")
	local c_fire25 = ScriptLib.GetGroupVariableValue(context, "fire25")
		local c_fire = c_fire22 + c_fire23 + c_fire24 + 
	c_fire25
	ScriptLib.PrintLog("c_fire="..c_fire)
		if c_fire == 4 then
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 26, GadgetState.Default) then
			return -1
		end 
		end
		
		
		
		
		
		return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_16(context, evt)
	if 23 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_16(context, evt)
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "fire23", 1) then
		  return -1
		end
		
		local c_fire22 = ScriptLib.GetGroupVariableValue(context, "fire22")
		local c_fire23 = ScriptLib.GetGroupVariableValue(context, "fire23")
		local c_fire24 = ScriptLib.GetGroupVariableValue(context, "fire24")
	                local c_fire25 = ScriptLib.GetGroupVariableValue(context, "fire25")
		local c_fire = c_fire22 + c_fire23 + c_fire24 + 
	c_fire25
		if c_fire == 4 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 26, GadgetState.Default) then
			return -1
		end
		end
		
		
		
		
		
		return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_17(context, evt)
	if 24 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_17(context, evt)
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "fire24", 1) then
		  return -1
		end
		
		local c_fire22 = ScriptLib.GetGroupVariableValue(context, "fire22")
		local c_fire23 = ScriptLib.GetGroupVariableValue(context, "fire23")
		local c_fire24 = ScriptLib.GetGroupVariableValue(context, "fire24")
	                local c_fire25 = ScriptLib.GetGroupVariableValue(context, "fire25")
		local c_fire = c_fire22 + c_fire23 + c_fire24 + 
	c_fire25
	ScriptLib.PrintLog("c_fire="..c_fire)
		if c_fire == 4 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 26, GadgetState.Default) then
			return -1
		end
		end
		
		
		
		
		
		return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_18(context, evt)
	if 25 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_18(context, evt)
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "fire25", 1) then
		  return -1
		end
		
		local c_fire22 = ScriptLib.GetGroupVariableValue(context, "fire22")
		local c_fire23 = ScriptLib.GetGroupVariableValue(context, "fire23")
		local c_fire24 = ScriptLib.GetGroupVariableValue(context, "fire24")
	local c_fire25 = ScriptLib.GetGroupVariableValue(context, "fire25")
		local c_fire = c_fire22 + c_fire23 + c_fire24 + 
	c_fire25
	ScriptLib.PrintLog("c_fire="..c_fire)
		if c_fire == 4 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 26, GadgetState.Default) then
			return -1
		end
		end
		
		
		
		
		
		return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_30(context, evt)
	if 26 ~= evt.param2 or GadgetState.Default ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
