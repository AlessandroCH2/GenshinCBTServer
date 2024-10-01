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
	{ config_id = 1711, gadget_id = 70900007, pos = { x = 1933.0, y = 206.8, z = -1559.2 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 1712, gadget_id = 70900007, pos = { x = 1937.4, y = 207.0, z = -1562.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 1713, gadget_id = 70900007, pos = { x = 1942.5, y = 207.1, z = -1559.8 }, rot = { x = 0.0, y = 93.0, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 1714, gadget_id = 70210031, pos = { x = 1937.0, y = 207.1, z = -1559.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 403241, showcutscene = true, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 64, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1926.4, y = 208.1, z = -1543.3 } },
	{ config_id = 65, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1926.9, y = 207.8, z = -1541.3 } },
	{ config_id = 66, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1926.7, y = 207.9, z = -1542.1 } },
	{ config_id = 67, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1926.4, y = 208.1, z = -1543.0 } },
	{ config_id = 71, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1938.3, y = 206.2, z = -1527.1 } },
	{ config_id = 72, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1938.5, y = 205.4, z = -1525.9 } },
	{ config_id = 146, shape = RegionShape.SPHERE, radius = 10.3, pos = { x = 1937.5, y = 206.2, z = -1559.7 } },
	{ config_id = 279, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1940.7, y = 207.9, z = -1528.8 } },
	{ config_id = 383, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1939.6, y = 207.0, z = -1561.3 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_64", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_64", action = "action_EVENT_GADGET_STATE_CHANGE_64", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_65", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_65", action = "action_EVENT_GADGET_STATE_CHANGE_65", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_66", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_66", action = "action_EVENT_GADGET_STATE_CHANGE_66", trigger_count = 0 },
	{ name = "TIMER_EVENT_67", event = EventType.EVENT_TIMER_EVENT, source = "stop1711", condition = "condition_EVENT_TIMER_EVENT_67", action = "action_EVENT_TIMER_EVENT_67", trigger_count = 0 },
	{ name = "TIMER_EVENT_71", event = EventType.EVENT_TIMER_EVENT, source = "stop1713", condition = "condition_EVENT_TIMER_EVENT_71", action = "action_EVENT_TIMER_EVENT_71", trigger_count = 0 },
	{ name = "TIMER_EVENT_72", event = EventType.EVENT_TIMER_EVENT, source = "stop1712", condition = "condition_EVENT_TIMER_EVENT_72", action = "action_EVENT_TIMER_EVENT_72", trigger_count = 0 },
	{ name = "ENTER_REGION_146", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_146", action = "", tlog_tag = "小平原_三元素机关_海滩_开始" },
	{ name = "CLIENT_EXECUTE_279", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_279", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_383", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_383", action = "", tlog_tag = "小平原_三元素机关_海滩_结束" }
}

-- 变量
variables = {
	{ name = "t1711", value = 0, persistent = true },
	{ name = "t1712", value = 0, persistent = true },
	{ name = "t1713", value = 0, persistent = true },
	{ name = "isoff", value = 0, persistent = false }
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
		gadgets = { 1711, 1712, 1713 },
		regions = { 64, 65, 66, 67, 71, 72, 146, 279, 383 },
		triggers = { "GADGET_STATE_CHANGE_64", "GADGET_STATE_CHANGE_65", "GADGET_STATE_CHANGE_66", "TIMER_EVENT_67", "TIMER_EVENT_71", "TIMER_EVENT_72", "ENTER_REGION_146", "CLIENT_EXECUTE_279", "GADGET_STATE_CHANGE_383" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_64(context, evt)
	if 1711 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_64(context, evt)
	-- 将本组内变量名为 "t1711" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "t1711", 1) then
	  return -1
	end
	
	if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133001087, "stop1711", 10) then
		  return -1
		end
		end
		
		if ScriptLib.GetGroupVariableValue(context, "t1711") + ScriptLib.GetGroupVariableValue(context, "t1712") + ScriptLib.GetGroupVariableValue(context, "t1713") == 3 then
		
		if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1714 }) then
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
function condition_EVENT_GADGET_STATE_CHANGE_65(context, evt)
	if 1712 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_65(context, evt)
	-- 将本组内变量名为 "t1712" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "t1712", 1) then
	  return -1
	end
	
	if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133001087, "stop1712", 10) then
		  return -1
		end
		end
		
		if ScriptLib.GetGroupVariableValue(context, "t1711") + ScriptLib.GetGroupVariableValue(context, "t1712") + ScriptLib.GetGroupVariableValue(context, "t1713") == 3 then
		
		if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1714 }) then
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
function condition_EVENT_GADGET_STATE_CHANGE_66(context, evt)
	if 1713 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_66(context, evt)
	-- 将本组内变量名为 "t1712" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "t1713", 1) then
	  return -1
	end
	
	if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133001087, "stop1713", 10) then
		  return -1
		end
		end
		
		if ScriptLib.GetGroupVariableValue(context, "t1711") + ScriptLib.GetGroupVariableValue(context, "t1712") + ScriptLib.GetGroupVariableValue(context, "t1713") == 3 then
		
		if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1714 }) then
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
function condition_EVENT_TIMER_EVENT_67(context, evt)
	-- 判断变量"isoff"为0
	if ScriptLib.GetGroupVariableValue(context, "isoff") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_TIMER_EVENT_67(context, evt)
	-- 将configid为 1711 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1711, GadgetState.Default) then
			return -1
		end 
	
	-- 将本组内变量名为 "t1711" 的变量设置为 0
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "t1711", 0) then
	  return -1
	end
	
	-- 调用提示id为 20011006 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 20011006) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_TIMER_EVENT_71(context, evt)
	-- 判断变量"isoff"为0
	if ScriptLib.GetGroupVariableValue(context, "isoff") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_TIMER_EVENT_71(context, evt)
	-- 将configid为 1713 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1713, GadgetState.Default) then
			return -1
		end 
	
	-- 将本组内变量名为 "t1713" 的变量设置为 0
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "t1713", 0) then
	  return -1
	end
	
	-- 调用提示id为 20011006 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 20011006) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_TIMER_EVENT_72(context, evt)
	-- 判断变量"isoff"为0
	if ScriptLib.GetGroupVariableValue(context, "isoff") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_TIMER_EVENT_72(context, evt)
	-- 将configid为 1712 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1712, GadgetState.Default) then
			return -1
		end 
	
	-- 将本组内变量名为 "t1712" 的变量设置为 0
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "t1712", 0) then
	  return -1
	end
	
	-- 调用提示id为 20011006 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 20011006) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_146(context, evt)
	if evt.param1 ~= 146 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_279(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_383(context, evt)
	if 1714 ~= evt.param1 then
		return false
	end
	
	if 1714 ~= evt.param2 or GadgetState.ChestOpened ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
