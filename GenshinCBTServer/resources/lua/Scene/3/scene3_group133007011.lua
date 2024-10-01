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
	{ config_id = 83, gadget_id = 70800001, pos = { x = 2742.6, y = 212.1, z = -94.2 }, rot = { x = 0.0, y = 315.9, z = 0.0 }, level = 1, state = GadgetState.GearStop, persistent = true },
	{ config_id = 139, gadget_id = 70620005, pos = { x = 2654.2, y = 195.7, z = 132.6 }, rot = { x = 0.0, y = 148.0, z = 0.0 }, level = 1 },
	{ config_id = 959, gadget_id = 70900202, pos = { x = 2742.6, y = 215.2, z = -94.3 }, rot = { x = 0.0, y = 137.1, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 7, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2743.8, y = 209.4, z = -59.8 } },
	{ config_id = 8, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2744.0, y = 209.4, z = -59.7 } },
	{ config_id = 11, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2743.9, y = 209.4, z = -59.7 } },
	{ config_id = 12, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2744.0, y = 209.4, z = -59.7 } },
	{ config_id = 101, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2803.5, y = 209.8, z = -43.0 } },
	{ config_id = 169, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2804.3, y = 209.5, z = -41.1 } },
	{ config_id = 174, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2742.4, y = 212.3, z = -94.9 } },
	{ config_id = 175, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2742.7, y = 212.3, z = -95.0 } },
	{ config_id = 192, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2744.9, y = 209.4, z = -58.8 } },
	{ config_id = 261, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2744.5, y = 211.9, z = -90.6 } },
	{ config_id = 279, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2743.6, y = 209.4, z = -59.8 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_7", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_7", action = "action_EVENT_GADGET_STATE_CHANGE_7", trigger_count = 0 },
	{ name = "SELECT_OPTION_8", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_8", action = "action_EVENT_SELECT_OPTION_8", trigger_count = 0, tlog_tag = "风龙_011_Q390封印战斗_开始" },
	{ name = "SEAL_BATTLE_END_11", event = EventType.EVENT_SEAL_BATTLE_END, source = "", condition = "condition_EVENT_SEAL_BATTLE_END_11", action = "action_EVENT_SEAL_BATTLE_END_11", trigger_count = 0, tlog_tag = "风龙_011_Q390封印战斗_成功" },
	{ name = "QUEST_FINISH_12", event = EventType.EVENT_QUEST_FINISH, source = "", condition = "condition_EVENT_QUEST_FINISH_12", action = "action_EVENT_QUEST_FINISH_12", trigger_count = 0 },
	{ name = "QUEST_FINISH_101", event = EventType.EVENT_QUEST_FINISH, source = "", condition = "condition_EVENT_QUEST_FINISH_101", action = "action_EVENT_QUEST_FINISH_101", trigger_count = 0, tlog_tag = "风龙_011_Q390线索_刷出" },
	{ name = "QUEST_FINISH_169", event = EventType.EVENT_QUEST_FINISH, source = "", condition = "condition_EVENT_QUEST_FINISH_169", action = "action_EVENT_QUEST_FINISH_169", trigger_count = 0 },
	{ name = "GADGET_CREATE_174", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_174", action = "action_EVENT_GADGET_CREATE_174", trigger_count = 0 },
	{ name = "GADGET_CREATE_175", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_175", action = "action_EVENT_GADGET_CREATE_175", trigger_count = 0 },
	{ name = "SEAL_BATTLE_END_192", event = EventType.EVENT_SEAL_BATTLE_END, source = "", condition = "condition_EVENT_SEAL_BATTLE_END_192", action = "action_EVENT_SEAL_BATTLE_END_192", trigger_count = 0, tlog_tag = "风龙_011_Q390封印战斗_失败" },
	{ name = "TIMER_EVENT_261", event = EventType.EVENT_TIMER_EVENT, source = "battle01_finished", condition = "", action = "action_EVENT_TIMER_EVENT_261" },
	{ name = "TIMER_EVENT_279", event = EventType.EVENT_TIMER_EVENT, source = "SEALBATTLE_FAILED", condition = "", action = "action_EVENT_TIMER_EVENT_279", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "SEAL_DONE", value = 0, persistent = true },
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
		-- description = ,
		monsters = { },
		gadgets = { 83 },
		regions = { 7, 8, 11, 12, 101, 169, 174, 175, 192, 261, 279 },
		triggers = { "GADGET_STATE_CHANGE_7", "SELECT_OPTION_8", "SEAL_BATTLE_END_11", "QUEST_FINISH_12", "QUEST_FINISH_101", "QUEST_FINISH_169", "GADGET_CREATE_174", "GADGET_CREATE_175", "SEAL_BATTLE_END_192", "TIMER_EVENT_261", "TIMER_EVENT_279" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_7(context, evt)
	if 83 ~= evt.param2 or GadgetState.Default ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_7(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {24}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_8(context, evt)
	-- 判断是gadgetid 83
	if 83 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_8(context, evt)
	-- 删除指定group： 133007011 ；指定config：83；物件身上指定option：24；
	if 0 ~= ScriptLib.DelWorktopOptionByGroupId(context, 133007011, 83, 24) then
		return -1
	end
	
	-- 将configid为 83 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 83, GadgetState.GearStart) then
			return -1
		end 
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007124, suite = 1 }) then
			return -1
		end
	
	-- 当option_id为24时，开启类型为""限时杀怪""的封印战斗，战斗区域半径为15，限定时长为120秒，133007124 group内每有1个怪物死亡，获得1点进度，进度达到8时判定为战斗成功。
	    if 24 == evt.param2 then
	        local ret = ScriptLib.StartSealBattle(context, {radius = 15, kill_time = 120, monster_group_id = 133007124, max_progress = 8, battle_type = SealBattleType.KILL_MONSTER})
	        --ScriptLib.PrintLog("StartSealBattle ret: " ..ret)
	    end
	
	-- 调用提示id为 1109001 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1109001) then
		return -1
	end
	
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 959 }) then
		    return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_SEAL_BATTLE_END_11(context, evt)
	--检查ID为83的封印挑战的完成状态是否为1（1=成功，0=失败）
	
	--检查封印gadget的config ID
	if 83 ~= evt.param1 then
		return false
	end
	
	--检查封印战斗成功状态
	if 1 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_SEAL_BATTLE_END_11(context, evt)
	-- 将configid为 83 的物件更改为状态 GadgetState.GearAction2
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 83, GadgetState.GearAction2) then
			return -1
		end 
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007124, suite = 2 }) then
			return -1
		end
	
	-- 将本组内变量名为 "OPTION_ALLOW" 的变量设置为 0
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "OPTION_ALLOW", 0) then
	  return -1
	end
	
	-- 延迟3秒后,向groupId为：133007011的对象,请求一次调用,并将string参数："battle01_finished" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133007011, "battle01_finished", 3) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_QUEST_FINISH_12(context, evt)
	--检查ID为39007的任务的完成状态是否为1（1=完成，0=失败）
	--此事件需要配合Quest表使用，在Quest表里的完成执行中配置“通知group脚本”，则该任务完成后服务端会向对应的group发送通知，参数1填写场景ID，参数2填写group ID（如果不填则会通知所有group）
	
	--检查任务ID
	if 39007 ~= evt.param1 then
		return false
	end
	
	--检查任务成功状态
	if 1 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_QUEST_FINISH_12(context, evt)
	-- 将configid为 83 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 83, GadgetState.Default) then
			return -1
		end 
	
	-- 将本组内变量名为 "Q007_FINISHED" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "Q007_FINISHED", 1) then
	  return -1
	end
	
	-- 创建id为959的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 959 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_QUEST_FINISH_101(context, evt)
	--检查ID为39009的任务的完成状态是否为1（1=完成，0=失败）
	--此事件需要配合Quest表使用，在Quest表里的完成执行中配置“通知group脚本”，则该任务完成后服务端会向对应的group发送通知，参数1填写场景ID，参数2填写group ID（如果不填则会通知所有group）
	
	--检查任务ID
	if 39009 ~= evt.param1 then
		return false
	end
	
	--检查任务成功状态
	if 1 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_QUEST_FINISH_101(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007160, suite = 2 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_QUEST_FINISH_169(context, evt)
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
function action_EVENT_QUEST_FINISH_169(context, evt)
	-- 变量"OPTION_ALLOW"赋值为0
	ScriptLib.SetGroupVariableValue(context, "OPTION_ALLOW", 0)
	
	-- 将本组内变量名为 "Q008_FINISHED" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "Q008_FINISHED", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_174(context, evt)
	if 83 ~= evt.param1 then
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
function action_EVENT_GADGET_CREATE_174(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133007011, 83, {24}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_175(context, evt)
	if 83 ~= evt.param1 then
		return false
	end
	
	-- 判断变量"Q008_FINISHED"为1
	if ScriptLib.GetGroupVariableValue(context, "Q008_FINISHED") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_175(context, evt)
	-- 改变指定group组133007011中， configid为83的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 133007011, 83, GadgetState.GearAction2) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_SEAL_BATTLE_END_192(context, evt)
	--检查ID为83的封印挑战的完成状态是否为0（1=成功，0=失败）
	
	--检查封印gadget的config ID
	if 83 ~= evt.param1 then
		return false
	end
	
	--检查封印战斗成功状态
	if 0 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_SEAL_BATTLE_END_192(context, evt)
	-- 延迟3秒后,向groupId为：133007011的对象,请求一次调用,并将string参数："SEALBATTLE_FAILED" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133007011, "SEALBATTLE_FAILED", 3) then
	  return -1
	end
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007124, suite = 2 }) then
			return -1
		end
	
	-- 将本组内变量名为 "OPTION_ALLOW" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "OPTION_ALLOW", 1) then
	  return -1
	end
	
	-- 调用提示id为 1109004 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1109004) then
		return -1
	end
	
	-- 创建id为959的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 959 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_261(context, evt)
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "133007124") then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_279(context, evt)
	-- 将configid为 83 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 83, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
