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
	{ config_id = 43, gadget_id = 70800001, pos = { x = 2859.0, y = 213.7, z = 291.6 }, rot = { x = 0.0, y = 48.4, z = 0.0 }, level = 1, state = GadgetState.GearStop, persistent = true },
	{ config_id = 138, gadget_id = 70620005, pos = { x = 2654.2, y = 195.7, z = 132.6 }, rot = { x = 0.0, y = 193.6, z = 0.0 }, level = 1 },
	{ config_id = 960, gadget_id = 70900202, pos = { x = 2859.0, y = 216.8, z = 291.6 }, rot = { x = 0.0, y = 137.1, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 1, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2746.7, y = 238.3, z = 378.0 } },
	{ config_id = 2, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2747.1, y = 238.3, z = 378.1 } },
	{ config_id = 3, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2831.6, y = 207.3, z = 259.8 } },
	{ config_id = 5, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2831.5, y = 207.3, z = 259.9 } },
	{ config_id = 6, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2831.7, y = 207.3, z = 259.7 } },
	{ config_id = 123, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2857.5, y = 213.6, z = 289.8 } },
	{ config_id = 170, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2859.9, y = 213.6, z = 293.6 } },
	{ config_id = 172, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2854.7, y = 213.6, z = 288.0 } },
	{ config_id = 173, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2854.7, y = 213.6, z = 287.2 } },
	{ config_id = 262, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2861.2, y = 213.7, z = 289.2 } },
	{ config_id = 280, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2832.8, y = 207.3, z = 260.2 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_1", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_1", action = "action_EVENT_GADGET_STATE_CHANGE_1", trigger_count = 0 },
	{ name = "SELECT_OPTION_2", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_2", action = "action_EVENT_SELECT_OPTION_2", trigger_count = 0, tlog_tag = "风龙_009_Q391封印战斗_开始" },
	{ name = "SEAL_BATTLE_END_3", event = EventType.EVENT_SEAL_BATTLE_END, source = "", condition = "condition_EVENT_SEAL_BATTLE_END_3", action = "action_EVENT_SEAL_BATTLE_END_3", trigger_count = 0, tlog_tag = "风龙_009_Q391封印战斗_失败" },
	{ name = "SEAL_BATTLE_END_5", event = EventType.EVENT_SEAL_BATTLE_END, source = "", condition = "condition_EVENT_SEAL_BATTLE_END_5", action = "action_EVENT_SEAL_BATTLE_END_5", trigger_count = 0, tlog_tag = "风龙_009_Q391封印战斗_成功" },
	{ name = "QUEST_FINISH_6", event = EventType.EVENT_QUEST_FINISH, source = "", condition = "condition_EVENT_QUEST_FINISH_6", action = "action_EVENT_QUEST_FINISH_6", trigger_count = 0 },
	{ name = "QUEST_FINISH_123", event = EventType.EVENT_QUEST_FINISH, source = "", condition = "condition_EVENT_QUEST_FINISH_123", action = "action_EVENT_QUEST_FINISH_123", trigger_count = 0, tlog_tag = "风龙_009_Q391线索_刷出" },
	{ name = "QUEST_FINISH_170", event = EventType.EVENT_QUEST_FINISH, source = "", condition = "condition_EVENT_QUEST_FINISH_170", action = "action_EVENT_QUEST_FINISH_170", trigger_count = 0 },
	{ name = "GADGET_CREATE_172", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_172", action = "action_EVENT_GADGET_CREATE_172", trigger_count = 0 },
	{ name = "GADGET_CREATE_173", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_173", action = "action_EVENT_GADGET_CREATE_173", trigger_count = 0 },
	{ name = "TIMER_EVENT_262", event = EventType.EVENT_TIMER_EVENT, source = "battle02_finished", condition = "", action = "action_EVENT_TIMER_EVENT_262" },
	{ name = "TIMER_EVENT_280", event = EventType.EVENT_TIMER_EVENT, source = "SEALBATTLE_FAILED", condition = "", action = "action_EVENT_TIMER_EVENT_280", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "OPTION_ALLOW", value = 1, persistent = true },
	{ name = "Q007_FINISHED", value = 0, persistent = true },
	{ name = "Q008_FINISHED", value = 0, persistent = true }
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
		-- description = Gadgets,
		monsters = { },
		gadgets = { 43 },
		regions = { 1, 2, 3, 5, 6, 123, 170, 172, 173, 262, 280 },
		triggers = { "GADGET_STATE_CHANGE_1", "SELECT_OPTION_2", "SEAL_BATTLE_END_3", "SEAL_BATTLE_END_5", "QUEST_FINISH_6", "QUEST_FINISH_123", "QUEST_FINISH_170", "GADGET_CREATE_172", "GADGET_CREATE_173", "TIMER_EVENT_262", "TIMER_EVENT_280" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_1(context, evt)
	if 43 ~= evt.param2 or GadgetState.Default ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_1(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {24}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_2(context, evt)
	if 43 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_2(context, evt)
	-- 删除指定group： 133007009 ；指定config：43；物件身上指定option：24；
	if 0 ~= ScriptLib.DelWorktopOptionByGroupId(context, 133007009, 43, 24) then
		return -1
	end
	
	-- 将configid为 43 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 43, GadgetState.GearStart) then
			return -1
		end 
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007113, suite = 1 }) then
			return -1
		end
	
	-- 当option_id为24时，开启类型为""限时杀怪""的封印战斗，战斗区域半径为15，限定时长为120秒，133007113 group内每有1个怪物死亡，获得1点进度，进度达到8时判定为战斗成功。
	    if 24 == evt.param2 then
	        local ret = ScriptLib.StartSealBattle(context, {radius = 15, kill_time = 120, monster_group_id = 133007113, max_progress = 8, battle_type = SealBattleType.KILL_MONSTER})
	        --ScriptLib.PrintLog("StartSealBattle ret: " ..ret)
	    end
	
	-- 调用提示id为 1109001 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1109001) then
		return -1
	end
	
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 960 }) then
		    return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_SEAL_BATTLE_END_3(context, evt)
	--检查ID为43的封印挑战的完成状态是否为0（1=成功，0=失败）
	
	--检查封印gadget的config ID
	if 43 ~= evt.param1 then
		return false
	end
	
	--检查封印战斗成功状态
	if 0 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_SEAL_BATTLE_END_3(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007113, suite = 2 }) then
			return -1
		end
	
	-- 将本组内变量名为 "OPTION_ALLOW" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "OPTION_ALLOW", 1) then
	  return -1
	end
	
	-- 延迟3秒后,向groupId为：133007009的对象,请求一次调用,并将string参数："SEALBATTLE_FAILED" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133007009, "SEALBATTLE_FAILED", 3) then
	  return -1
	end
	
	-- 调用提示id为 1109004 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1109004) then
		return -1
	end
	
	-- 创建id为960的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 960 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SEAL_BATTLE_END_5(context, evt)
	--检查ID为43的封印挑战的完成状态是否为1（1=成功，0=失败）
	
	--检查封印gadget的config ID
	if 43 ~= evt.param1 then
		return false
	end
	
	--检查封印战斗成功状态
	if 1 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_SEAL_BATTLE_END_5(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007113, suite = 2 }) then
			return -1
		end
	
	-- 将configid为 43 的物件更改为状态 GadgetState.GearAction2
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 43, GadgetState.GearAction2) then
			return -1
		end 
	
	-- 将本组内变量名为 "OPTION_ALLOW" 的变量设置为 0
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "OPTION_ALLOW", 0) then
	  return -1
	end
	
	-- 延迟3秒后,向groupId为：133007009的对象,请求一次调用,并将string参数："battle02_finished" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133007009, "battle02_finished", 3) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_QUEST_FINISH_6(context, evt)
	--检查ID为39107的任务的完成状态是否为1（1=完成，0=失败）
	--此事件需要配合Quest表使用，在Quest表里的完成执行中配置“通知group脚本”，则该任务完成后服务端会向对应的group发送通知，参数1填写场景ID，参数2填写group ID（如果不填则会通知所有group）
	
	--检查任务ID
	if 39107 ~= evt.param1 then
		return false
	end
	
	--检查任务成功状态
	if 1 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_QUEST_FINISH_6(context, evt)
	-- 将configid为 43 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 43, GadgetState.Default) then
			return -1
		end 
	
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133007009, 43, {24}) then
		return -1
	end
	
	-- 将本组内变量名为 "Q007_FINISHED" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "Q007_FINISHED", 1) then
	  return -1
	end
	
	-- 创建id为960的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 960 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_QUEST_FINISH_123(context, evt)
	--检查ID为39109的任务的完成状态是否为1（1=完成，0=失败）
	--此事件需要配合Quest表使用，在Quest表里的完成执行中配置“通知group脚本”，则该任务完成后服务端会向对应的group发送通知，参数1填写场景ID，参数2填写group ID（如果不填则会通知所有group）
	
	--检查任务ID
	if 39109 ~= evt.param1 then
		return false
	end
	
	--检查任务成功状态
	if 1 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_QUEST_FINISH_123(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007161, suite = 2 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_QUEST_FINISH_170(context, evt)
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
function action_EVENT_QUEST_FINISH_170(context, evt)
	-- 变量"OPTION_ALLOW"赋值为0
	ScriptLib.SetGroupVariableValue(context, "OPTION_ALLOW", 0)
	
	-- 将本组内变量名为 "Q008_FINISHED" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "Q008_FINISHED", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_172(context, evt)
	if 43 ~= evt.param1 then
		return false
	end
	
	-- 判断变量"Q007_FINISHED"为1
	if ScriptLib.GetGroupVariableValue(context, "Q007_FINISHED") ~= 1 then
			return false
	end
	
	-- 判断变量"Q008_FINISHED"为0
	if ScriptLib.GetGroupVariableValue(context, "Q008_FINISHED") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_172(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133007009, 43, {24}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_173(context, evt)
	if 43 ~= evt.param1 then
		return false
	end
	
	-- 判断变量"Q008_FINISHED"为1
	if ScriptLib.GetGroupVariableValue(context, "Q008_FINISHED") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_173(context, evt)
	-- 改变指定group组133007009中， configid为43的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 133007009, 43, GadgetState.GearAction2) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_262(context, evt)
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "133007113") then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_280(context, evt)
	-- 将configid为 43 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 43, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
