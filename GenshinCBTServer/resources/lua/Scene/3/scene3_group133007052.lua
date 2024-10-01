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
	{ config_id = 192, gadget_id = 70800007, pos = { x = 2652.4, y = 300.7, z = 132.4 }, rot = { x = 0.0, y = 289.1, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 193, gadget_id = 70800007, pos = { x = 2652.5, y = 282.3, z = 132.4 }, rot = { x = 0.0, y = 278.6, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 194, gadget_id = 70800007, pos = { x = 2652.4, y = 264.4, z = 132.3 }, rot = { x = 0.0, y = 154.9, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 599, gadget_id = 70800011, pos = { x = 2652.4, y = 261.7, z = 132.6 }, rot = { x = 0.0, y = 191.7, z = 0.0 }, level = 1, persistent = true }
}

-- 区域
regions = {
	{ config_id = 28, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2650.6, y = 300.4, z = 118.5 } },
	{ config_id = 29, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2647.9, y = 300.5, z = 118.1 } },
	{ config_id = 30, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2649.2, y = 300.5, z = 117.9 } },
	{ config_id = 89, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2649.4, y = 301.2, z = 118.8 } },
	{ config_id = 90, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2648.7, y = 300.7, z = 119.4 } },
	{ config_id = 91, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2649.2, y = 301.5, z = 118.5 } },
	{ config_id = 94, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2644.3, y = 300.6, z = 120.5 } },
	{ config_id = 95, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2644.3, y = 300.6, z = 122.1 } },
	{ config_id = 96, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2644.1, y = 300.6, z = 121.1 } }
}

-- 触发器
triggers = {
	{ name = "QUEST_FINISH_28", event = EventType.EVENT_QUEST_FINISH, source = "", condition = "condition_EVENT_QUEST_FINISH_28", action = "action_EVENT_QUEST_FINISH_28" },
	{ name = "QUEST_FINISH_29", event = EventType.EVENT_QUEST_FINISH, source = "", condition = "condition_EVENT_QUEST_FINISH_29", action = "action_EVENT_QUEST_FINISH_29" },
	{ name = "QUEST_FINISH_30", event = EventType.EVENT_QUEST_FINISH, source = "", condition = "condition_EVENT_QUEST_FINISH_30", action = "action_EVENT_QUEST_FINISH_30" },
	{ name = "TIMER_EVENT_89", event = EventType.EVENT_TIMER_EVENT, source = "501FINISH", condition = "", action = "action_EVENT_TIMER_EVENT_89" },
	{ name = "TIMER_EVENT_90", event = EventType.EVENT_TIMER_EVENT, source = "502FINISH", condition = "", action = "action_EVENT_TIMER_EVENT_90" },
	{ name = "TIMER_EVENT_91", event = EventType.EVENT_TIMER_EVENT, source = "503FINISH", condition = "", action = "action_EVENT_TIMER_EVENT_91" },
	{ name = "TIMER_EVENT_94", event = EventType.EVENT_TIMER_EVENT, source = "501FINISH_4S", condition = "", action = "action_EVENT_TIMER_EVENT_94" },
	{ name = "TIMER_EVENT_95", event = EventType.EVENT_TIMER_EVENT, source = "502FINISH_4S", condition = "", action = "action_EVENT_TIMER_EVENT_95" },
	{ name = "TIMER_EVENT_96", event = EventType.EVENT_TIMER_EVENT, source = "503FINISH_4S", condition = "", action = "action_EVENT_TIMER_EVENT_96" }
}

-- 变量
variables = {
	{ name = "501_finish", value = 0, persistent = true },
	{ name = "502_finish", value = 0, persistent = true },
	{ name = "503_finish", value = 0, persistent = true }
}

--================================================================
-- 
-- 初始化配置
-- 
--================================================================

-- 初始化时创建
init_config = {
	suite = 1,
	rand_suite = false,
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
		gadgets = { 192, 193, 194 },
		regions = { 28, 29, 30, 89, 90, 91, 94, 95, 96 },
		triggers = { "QUEST_FINISH_28", "QUEST_FINISH_29", "QUEST_FINISH_30", "TIMER_EVENT_89", "TIMER_EVENT_90", "TIMER_EVENT_91", "TIMER_EVENT_94", "TIMER_EVENT_95", "TIMER_EVENT_96" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_QUEST_FINISH_28(context, evt)
	--检查ID为39008的任务的完成状态是否为1（1=完成，0=失败）
	--此事件需要配合Quest表使用，在Quest表里的完成执行中配置“通知group脚本”，则该任务完成后服务端会向对应的group发送通知，参数1填写场景ID，参数2填写group ID（如果不填则会通知所有group）
	
	--检查任务ID
	if 39008 ~= evt.param1 then
		return false
	end
	
	--检查任务成功状态
	if 1 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_QUEST_FINISH_28(context, evt)
	-- 将本组内变量名为 "501_finish" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "501_finish", 1) then
	  return -1
	end
	
	-- 延迟2秒后,向groupId为：133007052的对象,请求一次调用,并将string参数："501FINISH" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133007052, "501FINISH", 2) then
	  return -1
	end
	
	-- 延迟7秒后,向groupId为：133007052的对象,请求一次调用,并将string参数："501FINISH_4S" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133007052, "501FINISH_4S", 7) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_QUEST_FINISH_29(context, evt)
	--检查ID为39108的任务的完成状态是否为1（1=完成，0=失败）
	--此事件需要配合Quest表使用，在Quest表里的完成执行中配置“通知group脚本”，则该任务完成后服务端会向对应的group发送通知，参数1填写场景ID，参数2填写group ID（如果不填则会通知所有group）
	
	--检查任务ID
	if 39108 ~= evt.param1 then
		return false
	end
	
	--检查任务成功状态
	if 1 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_QUEST_FINISH_29(context, evt)
	-- 将本组内变量名为 "502_finish" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "502_finish", 1) then
	  return -1
	end
	
	-- 延迟2秒后,向groupId为：133007052的对象,请求一次调用,并将string参数："502FINISH" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133007052, "502FINISH", 2) then
	  return -1
	end
	
	-- 延迟7秒后,向groupId为：133007052的对象,请求一次调用,并将string参数："502FINISH_4S" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133007052, "502FINISH_4S", 7) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_QUEST_FINISH_30(context, evt)
	--检查ID为39208的任务的完成状态是否为1（1=完成，0=失败）
	--此事件需要配合Quest表使用，在Quest表里的完成执行中配置“通知group脚本”，则该任务完成后服务端会向对应的group发送通知，参数1填写场景ID，参数2填写group ID（如果不填则会通知所有group）
	
	--检查任务ID
	if 39208 ~= evt.param1 then
		return false
	end
	
	--检查任务成功状态
	if 1 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_QUEST_FINISH_30(context, evt)
	-- 将本组内变量名为 "503_finish" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "503_finish", 1) then
	  return -1
	end
	
	-- 延迟2秒后,向groupId为：133007052的对象,请求一次调用,并将string参数："503FINISH" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133007052, "503FINISH", 2) then
	  return -1
	end
	
	-- 延迟7秒后,向groupId为：133007052的对象,请求一次调用,并将string参数："503FINISH_4S" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133007052, "503FINISH_4S", 7) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_89(context, evt)
	
	 local c_501finish = ScriptLib.GetGroupVariableValue(context, "501_finish")
	 local c_502finish = ScriptLib.GetGroupVariableValue(context, "502_finish")
	 local c_503finish = ScriptLib.GetGroupVariableValue(context, "503_finish")
	 local c_sealopened = c_501finish + c_502finish + c_503finish
	
	
	 if c_sealopened == 1 then
	  if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 194, GadgetState.GearStart) then
	   return -1
	  end
	
	 elseif c_sealopened == 2 then
	  if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 193, GadgetState.GearStart) then
	   return -1
	  end
	
	 elseif c_sealopened == 3 then
	  if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 192, GadgetState.GearStart) then
	   return -1
	  end
	
	 end
	
	 return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_90(context, evt)
	
	 local c_501finish = ScriptLib.GetGroupVariableValue(context, "501_finish")
	 local c_502finish = ScriptLib.GetGroupVariableValue(context, "502_finish")
	 local c_503finish = ScriptLib.GetGroupVariableValue(context, "503_finish")
	 local c_sealopened = c_501finish + c_502finish + c_503finish
	
	
	 if c_sealopened == 1 then
	  if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 194, GadgetState.GearStart) then
	   return -1
	  end
	
	 elseif c_sealopened == 2 then
	  if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 193, GadgetState.GearStart) then
	   return -1
	  end
	
	 elseif c_sealopened == 3 then
	  if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 192, GadgetState.GearStart) then
	   return -1
	  end
	
	 end
	
	 return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_91(context, evt)
	
	 local c_501finish = ScriptLib.GetGroupVariableValue(context, "501_finish")
	 local c_502finish = ScriptLib.GetGroupVariableValue(context, "502_finish")
	 local c_503finish = ScriptLib.GetGroupVariableValue(context, "503_finish")
	 local c_sealopened = c_501finish + c_502finish + c_503finish
	
	
	 if c_sealopened == 1 then
	  if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 194, GadgetState.GearStart) then
	   return -1
	  end
	
	 elseif c_sealopened == 2 then
	  if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 193, GadgetState.GearStart) then
	   return -1
	  end
	
	 elseif c_sealopened == 3 then
	  if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 192, GadgetState.GearStart) then
	   return -1
	  end
	
	 end
	
	 return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_94(context, evt)
	
	 local c_501finish = ScriptLib.GetGroupVariableValue(context, "501_finish")
	 local c_502finish = ScriptLib.GetGroupVariableValue(context, "502_finish")
	 local c_503finish = ScriptLib.GetGroupVariableValue(context, "503_finish")
	 local c_sealopened = c_501finish + c_502finish + c_503finish
	
	
	 if c_sealopened == 3 then
	
	-- 创建id为599的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 599 }) then
	  return -1
	end
	
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_95(context, evt)
	
	 local c_501finish = ScriptLib.GetGroupVariableValue(context, "501_finish")
	 local c_502finish = ScriptLib.GetGroupVariableValue(context, "502_finish")
	 local c_503finish = ScriptLib.GetGroupVariableValue(context, "503_finish")
	 local c_sealopened = c_501finish + c_502finish + c_503finish
	
	
	 if c_sealopened == 3 then
	
	-- 创建id为599的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 599 }) then
	  return -1
	end
	
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_96(context, evt)
	
	 local c_501finish = ScriptLib.GetGroupVariableValue(context, "501_finish")
	 local c_502finish = ScriptLib.GetGroupVariableValue(context, "502_finish")
	 local c_503finish = ScriptLib.GetGroupVariableValue(context, "503_finish")
	 local c_sealopened = c_501finish + c_502finish + c_503finish
	
	
	 if c_sealopened == 3 then
	
	-- 创建id为599的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 599 }) then
	  return -1
	end
	
	end
	
	return 0
end
