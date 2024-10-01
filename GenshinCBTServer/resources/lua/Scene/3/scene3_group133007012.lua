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
	{ config_id = 84, gadget_id = 70800001, pos = { x = 2565.9, y = 208.3, z = 312.0 }, rot = { x = 0.0, y = 210.0, z = 0.0 }, level = 1, state = GadgetState.GearStop, persistent = true },
	{ config_id = 140, gadget_id = 70620005, pos = { x = 2654.1, y = 195.7, z = 132.6 }, rot = { x = 0.0, y = 230.8, z = 0.0 }, level = 1 },
	{ config_id = 961, gadget_id = 70900202, pos = { x = 2565.9, y = 211.7, z = 311.9 }, rot = { x = 0.0, y = 137.1, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 13, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2575.0, y = 207.8, z = 315.8 } },
	{ config_id = 14, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2575.3, y = 206.3, z = 315.3 } },
	{ config_id = 15, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2575.0, y = 207.8, z = 315.7 } },
	{ config_id = 17, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2575.2, y = 206.3, z = 314.7 } },
	{ config_id = 18, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2575.5, y = 206.3, z = 314.6 } },
	{ config_id = 130, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2594.9, y = 207.2, z = 341.9 } },
	{ config_id = 171, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2566.6, y = 208.2, z = 311.7 } },
	{ config_id = 176, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2566.6, y = 208.2, z = 310.4 } },
	{ config_id = 177, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2566.2, y = 208.2, z = 312.8 } },
	{ config_id = 263, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2563.8, y = 208.4, z = 304.9 } },
	{ config_id = 281, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2573.9, y = 207.8, z = 314.9 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_13", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_13", action = "action_EVENT_GADGET_STATE_CHANGE_13", trigger_count = 0 },
	{ name = "SELECT_OPTION_14", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_14", action = "action_EVENT_SELECT_OPTION_14", trigger_count = 0, tlog_tag = "风龙_012_Q392封印战斗_开始" },
	{ name = "SEAL_BATTLE_END_15", event = EventType.EVENT_SEAL_BATTLE_END, source = "", condition = "condition_EVENT_SEAL_BATTLE_END_15", action = "action_EVENT_SEAL_BATTLE_END_15", trigger_count = 0, tlog_tag = "风龙_012_Q392封印战斗_失败" },
	{ name = "SEAL_BATTLE_END_17", event = EventType.EVENT_SEAL_BATTLE_END, source = "", condition = "condition_EVENT_SEAL_BATTLE_END_17", action = "action_EVENT_SEAL_BATTLE_END_17", trigger_count = 0, tlog_tag = "风龙_012_Q392封印战斗_成功" },
	{ name = "QUEST_FINISH_18", event = EventType.EVENT_QUEST_FINISH, source = "", condition = "condition_EVENT_QUEST_FINISH_18", action = "action_EVENT_QUEST_FINISH_18", trigger_count = 0 },
	{ name = "QUEST_FINISH_130", event = EventType.EVENT_QUEST_FINISH, source = "", condition = "condition_EVENT_QUEST_FINISH_130", action = "action_EVENT_QUEST_FINISH_130", trigger_count = 0, tlog_tag = "风龙_012_Q392线索_刷出" },
	{ name = "QUEST_FINISH_171", event = EventType.EVENT_QUEST_FINISH, source = "", condition = "condition_EVENT_QUEST_FINISH_171", action = "action_EVENT_QUEST_FINISH_171", trigger_count = 0 },
	{ name = "GADGET_CREATE_176", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_176", action = "action_EVENT_GADGET_CREATE_176", trigger_count = 0 },
	{ name = "GADGET_CREATE_177", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_177", action = "action_EVENT_GADGET_CREATE_177", trigger_count = 0 },
	{ name = "TIMER_EVENT_263", event = EventType.EVENT_TIMER_EVENT, source = "battle03_finished", condition = "", action = "action_EVENT_TIMER_EVENT_263" },
	{ name = "TIMER_EVENT_281", event = EventType.EVENT_TIMER_EVENT, source = "SEALBATTLE_FAILED", condition = "", action = "action_EVENT_TIMER_EVENT_281", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "SEAL_DONE", value = 0, persistent = true },
	{ name = "OPTION_ALLOW", value = 1, persistent = true },
	{ name = "THIRTY_SECOND", value = 0, persistent = false },
	{ name = "SUITE_3_START", value = 0, persistent = false },
	{ name = "MONSTER_ID", value = 0, persistent = false },
	{ name = "SEAL_RESULT", value = 0, persistent = false },
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
		gadgets = { 84 },
		regions = { 13, 14, 15, 17, 18, 130, 171, 176, 177, 263, 281 },
		triggers = { "GADGET_STATE_CHANGE_13", "SELECT_OPTION_14", "SEAL_BATTLE_END_15", "SEAL_BATTLE_END_17", "QUEST_FINISH_18", "QUEST_FINISH_130", "QUEST_FINISH_171", "GADGET_CREATE_176", "GADGET_CREATE_177", "TIMER_EVENT_263", "TIMER_EVENT_281" },
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
function condition_EVENT_GADGET_STATE_CHANGE_13(context, evt)
	if 84 ~= evt.param2 or GadgetState.Default ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_13(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {24}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_14(context, evt)
	-- 判断是gadgetid 84
	if 84 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_14(context, evt)
	-- 删除指定group： 133007012 ；指定config：84；物件身上指定option：24；
	if 0 ~= ScriptLib.DelWorktopOptionByGroupId(context, 133007012, 84, 24) then
		return -1
	end
	
	-- 将configid为 84 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 84, GadgetState.GearStart) then
			return -1
		end 
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007126, suite = 1 }) then
			return -1
		end
	
	-- 当option_id为24时，开启类型为""限时杀怪""的封印战斗，战斗区域半径为15，限定时长为150秒，133007126 group内每有1个怪物死亡，获得1点进度，进度达到3时判定为战斗成功。
	    if 24 == evt.param2 then
	        local ret = ScriptLib.StartSealBattle(context, {radius = 15, kill_time = 150, monster_group_id = 133007126, max_progress = 3, battle_type = SealBattleType.KILL_MONSTER})
	        --ScriptLib.PrintLog("StartSealBattle ret: " ..ret)
	    end
	
	-- 调用提示id为 1109001 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1109001) then
		return -1
	end
	
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 961 }) then
		    return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_SEAL_BATTLE_END_15(context, evt)
	--检查ID为84的封印挑战的完成状态是否为0（1=成功，0=失败）
	
	--检查封印gadget的config ID
	if 84 ~= evt.param1 then
		return false
	end
	
	--检查封印战斗成功状态
	if 0 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_SEAL_BATTLE_END_15(context, evt)
	-- 延迟3秒后,向groupId为：133007012的对象,请求一次调用,并将string参数："SEALBATTLE_FAILED" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133007012, "SEALBATTLE_FAILED", 3) then
	  return -1
	end
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007126, suite = 2 }) then
			return -1
		end
	
	-- 调用提示id为 1109004 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1109004) then
		return -1
	end
	
	-- 将本组内变量名为 "OPTION_ALLOW" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "OPTION_ALLOW", 1) then
	  return -1
	end
	
	-- 创建id为961的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 961 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SEAL_BATTLE_END_17(context, evt)
	--检查ID为84的封印挑战的完成状态是否为1（1=成功，0=失败）
	
	--检查封印gadget的config ID
	if 84 ~= evt.param1 then
		return false
	end
	
	--检查封印战斗成功状态
	if 1 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_SEAL_BATTLE_END_17(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007126, suite = 2 }) then
			return -1
		end
	
	-- 将configid为 84 的物件更改为状态 GadgetState.GearAction2
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 84, GadgetState.GearAction2) then
			return -1
		end 
	
	-- 将本组内变量名为 "OPTION_ALLOW" 的变量设置为 0
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "OPTION_ALLOW", 0) then
	  return -1
	end
	
	-- 延迟3秒后,向groupId为：133007012的对象,请求一次调用,并将string参数："battle03_finished" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133007012, "battle03_finished", 3) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_QUEST_FINISH_18(context, evt)
	--检查ID为39207的任务的完成状态是否为1（1=完成，0=失败）
	--此事件需要配合Quest表使用，在Quest表里的完成执行中配置“通知group脚本”，则该任务完成后服务端会向对应的group发送通知，参数1填写场景ID，参数2填写group ID（如果不填则会通知所有group）
	
	--检查任务ID
	if 39207 ~= evt.param1 then
		return false
	end
	
	--检查任务成功状态
	if 1 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_QUEST_FINISH_18(context, evt)
	-- 将configid为 84 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 84, GadgetState.Default) then
			return -1
		end 
	
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133007012, 84, {24}) then
		return -1
	end
	
	-- 将本组内变量名为 "Q007_FINISHED" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "Q007_FINISHED", 1) then
	  return -1
	end
	
	-- 创建id为961的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 961 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_QUEST_FINISH_130(context, evt)
	--检查ID为39209的任务的完成状态是否为1（1=完成，0=失败）
	--此事件需要配合Quest表使用，在Quest表里的完成执行中配置“通知group脚本”，则该任务完成后服务端会向对应的group发送通知，参数1填写场景ID，参数2填写group ID（如果不填则会通知所有group）
	
	--检查任务ID
	if 39209 ~= evt.param1 then
		return false
	end
	
	--检查任务成功状态
	if 1 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_QUEST_FINISH_130(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007162, suite = 2 }) then
			return -1
		end
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007159, suite = 1 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_QUEST_FINISH_171(context, evt)
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
function action_EVENT_QUEST_FINISH_171(context, evt)
	-- 变量"OPTION_ALLOW"赋值为0
	ScriptLib.SetGroupVariableValue(context, "OPTION_ALLOW", 0)
	
	-- 将本组内变量名为 "Q008_FINISHED" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "Q008_FINISHED", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_176(context, evt)
	if 84 ~= evt.param1 then
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
function action_EVENT_GADGET_CREATE_176(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 133007012, 84, {24}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_177(context, evt)
	if 84 ~= evt.param1 then
		return false
	end
	
	-- 判断变量"Q008_FINISHED"为1
	if ScriptLib.GetGroupVariableValue(context, "Q008_FINISHED") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_177(context, evt)
	-- 改变指定group组133007012中， configid为84的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 133007012, 84, GadgetState.GearAction2) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_263(context, evt)
	-- 通知任务系统完成条件类型"LUA通知"，复杂参数为quest_param的进度+1
	if 0 ~= ScriptLib.AddQuestProgress(context, "133007126") then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_281(context, evt)
	-- 将configid为 84 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 84, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
