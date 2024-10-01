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
	{ config_id = 2928, gadget_id = 70900008, pos = { x = 1706.6, y = 266.0, z = -1343.3 }, rot = { x = 0.0, y = 330.8, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 2929, gadget_id = 70900008, pos = { x = 1716.9, y = 265.6, z = -1338.5 }, rot = { x = 0.0, y = 329.0, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 2930, gadget_id = 70900008, pos = { x = 1709.7, y = 265.5, z = -1336.3 }, rot = { x = 0.0, y = 59.1, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 2931, gadget_id = 70210031, pos = { x = 1711.8, y = 265.7, z = -1340.8 }, rot = { x = 0.0, y = 330.5, z = 0.0 }, level = 1, chest_drop_id = 403342, showcutscene = true, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 346, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1691.2, y = 263.9, z = -1312.9 } },
	{ config_id = 347, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1691.7, y = 263.8, z = -1311.0 } },
	{ config_id = 348, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1691.5, y = 263.8, z = -1311.8 } },
	{ config_id = 349, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1691.2, y = 263.9, z = -1312.7 } },
	{ config_id = 350, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1703.2, y = 263.2, z = -1296.7 } },
	{ config_id = 351, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1703.3, y = 263.1, z = -1295.6 } },
	{ config_id = 352, shape = RegionShape.SPHERE, radius = 10.3, pos = { x = 1708.5, y = 265.6, z = -1336.5 } },
	{ config_id = 353, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1705.5, y = 263.4, z = -1298.5 } },
	{ config_id = 435, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1711.5, y = 267.1, z = -1341.0 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_346", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_346", action = "action_EVENT_GADGET_STATE_CHANGE_346", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_347", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_347", action = "action_EVENT_GADGET_STATE_CHANGE_347", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_348", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_348", action = "action_EVENT_GADGET_STATE_CHANGE_348", trigger_count = 0 },
	{ name = "TIMER_EVENT_349", event = EventType.EVENT_TIMER_EVENT, source = "stop1711", condition = "condition_EVENT_TIMER_EVENT_349", action = "action_EVENT_TIMER_EVENT_349", trigger_count = 0 },
	{ name = "TIMER_EVENT_350", event = EventType.EVENT_TIMER_EVENT, source = "stop1712", condition = "condition_EVENT_TIMER_EVENT_350", action = "action_EVENT_TIMER_EVENT_350", trigger_count = 0 },
	{ name = "TIMER_EVENT_351", event = EventType.EVENT_TIMER_EVENT, source = "stop1713", condition = "condition_EVENT_TIMER_EVENT_351", action = "action_EVENT_TIMER_EVENT_351", trigger_count = 0 },
	{ name = "ENTER_REGION_352", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_352", action = "action_EVENT_ENTER_REGION_352" },
	{ name = "CLIENT_EXECUTE_353", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_353", trigger_count = 0 },
	{ name = "GADGET_CREATE_435", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_435", action = "", tlog_tag = "小平原_石碑解谜_丽莎门前_结束" }
}

-- 变量
variables = {
	{ name = "t1711", value = 0, persistent = true },
	{ name = "t1712", value = 0, persistent = true },
	{ name = "t1713", value = 0, persistent = true },
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
		monsters = { },
		gadgets = { 2928, 2929, 2930 },
		regions = { 346, 347, 348, 349, 350, 351, 352, 353, 435 },
		triggers = { "GADGET_STATE_CHANGE_346", "GADGET_STATE_CHANGE_347", "GADGET_STATE_CHANGE_348", "TIMER_EVENT_349", "TIMER_EVENT_350", "TIMER_EVENT_351", "ENTER_REGION_352", "CLIENT_EXECUTE_353", "GADGET_CREATE_435" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_346(context, evt)
	if 2928 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_346(context, evt)
	-- 将本组内变量名为 "t1711" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "t1711", 1) then
	  return -1
	end
	
	if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133001258, "stop1711", 10) then
		  return -1
		end
		end
		
		if ScriptLib.GetGroupVariableValue(context, "t1711") + ScriptLib.GetGroupVariableValue(context, "t1712") + ScriptLib.GetGroupVariableValue(context, "t1713") == 3 then
		
		if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2931 }) then
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
function condition_EVENT_GADGET_STATE_CHANGE_347(context, evt)
	if 2929 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_347(context, evt)
	-- 将本组内变量名为 "t1712" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "t1712", 1) then
	  return -1
	end
	
	if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133001258, "stop1712", 10) then
		  return -1
		end
		end
		
		if ScriptLib.GetGroupVariableValue(context, "t1711") + ScriptLib.GetGroupVariableValue(context, "t1712") + ScriptLib.GetGroupVariableValue(context, "t1713") == 3 then
		
		if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2931 }) then
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
function condition_EVENT_GADGET_STATE_CHANGE_348(context, evt)
	if 2930 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_348(context, evt)
	-- 将本组内变量名为 "t1712" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "t1713", 1) then
	  return -1
	end
	
	if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133001258, "stop1713", 10) then
		  return -1
		end
		end
		
		if ScriptLib.GetGroupVariableValue(context, "t1711") + ScriptLib.GetGroupVariableValue(context, "t1712") + ScriptLib.GetGroupVariableValue(context, "t1713") == 3 then
		
		if ScriptLib.GetGroupVariableValue(context, "isoff") == 0 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2931 }) then
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
function condition_EVENT_TIMER_EVENT_349(context, evt)
	-- 判断变量"isoff"为0
	if ScriptLib.GetGroupVariableValue(context, "isoff") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_TIMER_EVENT_349(context, evt)
	-- 将configid为 2928 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2928, GadgetState.Default) then
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
function condition_EVENT_TIMER_EVENT_350(context, evt)
	-- 判断变量"isoff"为0
	if ScriptLib.GetGroupVariableValue(context, "isoff") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_TIMER_EVENT_350(context, evt)
	-- 将configid为 2929 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2929, GadgetState.Default) then
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
function condition_EVENT_TIMER_EVENT_351(context, evt)
	-- 判断变量"isoff"为0
	if ScriptLib.GetGroupVariableValue(context, "isoff") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_TIMER_EVENT_351(context, evt)
	-- 将configid为 2930 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2930, GadgetState.Default) then
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
function condition_EVENT_ENTER_REGION_352(context, evt)
	if evt.param1 ~= 352 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_352(context, evt)
	-- 调用提示id为 20011005 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 20011005) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_353(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_435(context, evt)
	if 2931 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
