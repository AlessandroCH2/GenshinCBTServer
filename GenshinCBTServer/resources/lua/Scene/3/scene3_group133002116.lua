--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 295, monster_id = 20010801, pos = { x = 1582.0, y = 203.0, z = -301.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042 },
	{ config_id = 296, monster_id = 20010801, pos = { x = 1583.8, y = 201.0, z = -310.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042 },
	{ config_id = 297, monster_id = 20010801, pos = { x = 1589.6, y = 201.0, z = -300.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1385, gadget_id = 70900008, pos = { x = 1558.2, y = 201.3, z = -309.5 }, rot = { x = 0.0, y = 268.1, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 1386, gadget_id = 70900008, pos = { x = 1561.6, y = 201.3, z = -313.5 }, rot = { x = 0.0, y = 168.0, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 1387, gadget_id = 70900008, pos = { x = 1561.0, y = 201.3, z = -305.0 }, rot = { x = 0.0, y = 3.0, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 1388, gadget_id = 70220021, pos = { x = 1568.9, y = 201.0, z = -307.6 }, rot = { x = 0.0, y = 222.1, z = 0.0 }, level = 1 },
	{ config_id = 1390, gadget_id = 70210041, pos = { x = 1557.5, y = 201.3, z = -306.8 }, rot = { x = 0.0, y = 86.1, z = 0.0 }, level = 1, chest_drop_id = 403242, showcutscene = true, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 131, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1560.1, y = 201.3, z = -309.8 } },
	{ config_id = 132, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1560.6, y = 201.3, z = -309.6 } },
	{ config_id = 133, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1562.2, y = 201.3, z = -304.5 } },
	{ config_id = 134, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1556.5, y = 201.3, z = -308.8 } },
	{ config_id = 135, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1562.3, y = 201.3, z = -313.9 } },
	{ config_id = 136, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1562.7, y = 201.3, z = -306.1 } },
	{ config_id = 137, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1559.5, y = 201.3, z = -308.9 } },
	{ config_id = 138, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1561.1, y = 201.3, z = -313.8 } },
	{ config_id = 139, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1561.9, y = 201.3, z = -304.4 } },
	{ config_id = 259, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1565.9, y = 201.3, z = -308.5 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_131", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_131", action = "action_EVENT_GADGET_STATE_CHANGE_131", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_132", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_132", action = "action_EVENT_GADGET_STATE_CHANGE_132", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_133", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_133", action = "action_EVENT_GADGET_STATE_CHANGE_133", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_134", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_134", action = "action_EVENT_GADGET_STATE_CHANGE_134", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_135", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_135", action = "action_EVENT_GADGET_STATE_CHANGE_135", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_136", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_136", action = "action_EVENT_GADGET_STATE_CHANGE_136", trigger_count = 0 },
	{ name = "TIMER_EVENT_137", event = EventType.EVENT_TIMER_EVENT, source = "stop1385", condition = "condition_EVENT_TIMER_EVENT_137", action = "action_EVENT_TIMER_EVENT_137", trigger_count = 0 },
	{ name = "TIMER_EVENT_138", event = EventType.EVENT_TIMER_EVENT, source = "stop1386", condition = "condition_EVENT_TIMER_EVENT_138", action = "action_EVENT_TIMER_EVENT_138", trigger_count = 0 },
	{ name = "TIMER_EVENT_139", event = EventType.EVENT_TIMER_EVENT, source = "stop1387", condition = "condition_EVENT_TIMER_EVENT_139", action = "action_EVENT_TIMER_EVENT_139", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_259", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_259", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "t1386", value = 0, persistent = false },
	{ name = "t1385", value = 0, persistent = false },
	{ name = "t1387", value = 0, persistent = false },
	{ name = "isoff", value = 0, persistent = true }
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
		monsters = { 295, 296, 297 },
		gadgets = { 1385, 1386, 1387, 1388 },
		regions = { 131, 132, 133, 134, 135, 136, 137, 138, 139, 259 },
		triggers = { "GADGET_STATE_CHANGE_131", "GADGET_STATE_CHANGE_132", "GADGET_STATE_CHANGE_133", "GADGET_STATE_CHANGE_134", "GADGET_STATE_CHANGE_135", "GADGET_STATE_CHANGE_136", "TIMER_EVENT_137", "TIMER_EVENT_138", "TIMER_EVENT_139", "CLIENT_EXECUTE_259" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_131(context, evt)
	if 1385 ~= evt.param2 or GadgetState.Default ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_131(context, evt)
	-- 将本组内变量名为 "t1385" 的变量设置为 0
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "t1385", 0) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_132(context, evt)
	if 1386 ~= evt.param2 or GadgetState.Default ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_132(context, evt)
	-- 将本组内变量名为 "t1386" 的变量设置为 0
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "t1386", 0) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_133(context, evt)
	if 1387 ~= evt.param2 or GadgetState.Default ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_133(context, evt)
	-- 将本组内变量名为 "t1387" 的变量设置为 0
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "t1387", 0) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_134(context, evt)
	if 1385 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_134(context, evt)
	-- 将本组内变量名为 "t1385" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "t1385", 1) then
	  return -1
	end
	
	if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133002116, "stop1385", 1.5) then
		  return -1
		end
		end
		
		if ScriptLib.GetGroupVariableValue(context, "t1385") + ScriptLib.GetGroupVariableValue(context, "t1386") + ScriptLib.GetGroupVariableValue(context, "t1387") == 3 then
		
		if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1390 }) then
			return -1
		end
		
		
	
		if 0 ~= ScriptLib.SetGroupVariableValue(context, "isoff", 1) then
		  return -1
		end
		
		end
		
		end
		
		
		return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_135(context, evt)
	if 1386 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_135(context, evt)
	-- 将本组内变量名为 "t1386" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "t1386", 1) then
	  return -1
	end
	
	if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133002116, "stop1386", 1.5) then
		  return -1
		end
		end
		
		if ScriptLib.GetGroupVariableValue(context, "t1385") + ScriptLib.GetGroupVariableValue(context, "t1386") + ScriptLib.GetGroupVariableValue(context, "t1387") == 3 then
		
		if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1390 }) then
			return -1
		end
		
		
	
		if 0 ~= ScriptLib.SetGroupVariableValue(context, "isoff", 1) then
		  return -1
		end
		
		end
		
		end
		
		
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_136(context, evt)
	if 1387 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_136(context, evt)
	-- 将本组内变量名为 "t1387" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "t1387", 1) then
	  return -1
	end
	
	if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133002116, "stop1387", 1.5) then
		  return -1
		end
		end
		
		if ScriptLib.GetGroupVariableValue(context, "t1385") + ScriptLib.GetGroupVariableValue(context, "t1386") + ScriptLib.GetGroupVariableValue(context, "t1387") == 3 then
		
		if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1390 }) then
			return -1
		end
		
		
	
		if 0 ~= ScriptLib.SetGroupVariableValue(context, "isoff", 1) then
		  return -1
		end
		
	end
		
	end
		
		
	return 0
end

-- 触发条件
function condition_EVENT_TIMER_EVENT_137(context, evt)
	-- 判断变量"isoff"为0
	if ScriptLib.GetGroupVariableValue(context, "isoff") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_TIMER_EVENT_137(context, evt)
	-- 将configid为 1385 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1385, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_TIMER_EVENT_138(context, evt)
	-- 判断变量"isoff"为0
	if ScriptLib.GetGroupVariableValue(context, "isoff") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_TIMER_EVENT_138(context, evt)
	-- 将configid为 1386 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1386, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_TIMER_EVENT_139(context, evt)
	-- 判断变量"isoff"为0
	if ScriptLib.GetGroupVariableValue(context, "isoff") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_TIMER_EVENT_139(context, evt)
	-- 将configid为 1387 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1387, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_259(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
