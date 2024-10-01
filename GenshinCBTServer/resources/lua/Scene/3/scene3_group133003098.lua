--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 567, monster_id = 21010201, pos = { x = 2402.4, y = 283.3, z = -1756.8 }, rot = { x = 0.0, y = 293.9, z = 0.0 }, level = 13, drop_id = 303043 },
	{ config_id = 568, monster_id = 21010101, pos = { x = 2403.3, y = 282.1, z = -1758.0 }, rot = { x = 0.0, y = 297.4, z = 0.0 }, level = 13, drop_id = 303043 },
	{ config_id = 569, monster_id = 21010101, pos = { x = 2403.0, y = 282.7, z = -1757.3 }, rot = { x = 0.0, y = 290.3, z = 0.0 }, level = 13, drop_id = 303043 },
	{ config_id = 570, monster_id = 21010701, pos = { x = 2400.7, y = 283.7, z = -1714.8 }, rot = { x = 0.0, y = 249.1, z = 0.0 }, level = 13, drop_id = 303043 },
	{ config_id = 571, monster_id = 21030201, pos = { x = 2401.4, y = 283.8, z = -1716.7 }, rot = { x = 0.0, y = 251.1, z = 0.0 }, level = 13, drop_id = 303043 },
	{ config_id = 572, monster_id = 21010501, pos = { x = 2402.2, y = 283.0, z = -1715.8 }, rot = { x = 0.0, y = 248.0, z = 0.0 }, level = 13, drop_id = 303043 },
	{ config_id = 573, monster_id = 21020201, pos = { x = 2373.5, y = 281.4, z = -1683.5 }, rot = { x = 0.0, y = 202.3, z = 0.0 }, level = 13, drop_id = 303143 },
	{ config_id = 1102, monster_id = 20010401, pos = { x = 2360.4, y = 283.9, z = -1733.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 303042 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2432, gadget_id = 70210031, pos = { x = 2353.1, y = 283.9, z = -1732.4 }, rot = { x = 0.0, y = 4.2, z = 0.0 }, level = 1, chest_drop_id = 403020, showcutscene = true, isOneoff = true },
	{ config_id = 2519, gadget_id = 70210041, pos = { x = 2353.1, y = 283.9, z = -1732.4 }, rot = { x = 0.0, y = 4.2, z = 0.0 }, level = 1, chest_drop_id = 403143, showcutscene = true, isOneoff = true },
	{ config_id = 2575, gadget_id = 70350006, pos = { x = 2400.4, y = 284.9, z = -1755.4 }, rot = { x = 0.0, y = 289.2, z = 0.0 }, level = 1 },
	{ config_id = 2576, gadget_id = 70350006, pos = { x = 2399.7, y = 285.0, z = -1716.3 }, rot = { x = 0.0, y = 246.9, z = 0.0 }, level = 1 },
	{ config_id = 2577, gadget_id = 70350006, pos = { x = 2371.6, y = 284.9, z = -1689.3 }, rot = { x = 0.0, y = 21.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 83, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2343.3, y = 293.1, z = -1730.5 } },
	{ config_id = 85, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2351.0, y = 293.1, z = -1727.6 } },
	{ config_id = 106, shape = RegionShape.SPHERE, radius = 9.6, pos = { x = 2357.4, y = 283.9, z = -1725.6 } },
	{ config_id = 107, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2380.8, y = 283.9, z = -1722.8 } },
	{ config_id = 108, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2362.7, y = 283.8, z = -1707.2 } },
	{ config_id = 109, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2332.9, y = 283.9, z = -1722.5 } },
	{ config_id = 143, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2345.0, y = 284.1, z = -1725.4 } },
	{ config_id = 301, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2348.1, y = 293.1, z = -1728.5 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_83", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_83", action = "action_EVENT_ANY_MONSTER_DIE_83" },
	{ name = "QUEST_FINISH_85", event = EventType.EVENT_QUEST_FINISH, source = "38001", condition = "condition_EVENT_QUEST_FINISH_85", action = "action_EVENT_QUEST_FINISH_85" },
	{ name = "SELECT_OPTION_106", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "", action = "action_EVENT_SELECT_OPTION_106" },
	{ name = "ANY_MONSTER_DIE_107", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_107", action = "action_EVENT_ANY_MONSTER_DIE_107" },
	{ name = "ANY_MONSTER_DIE_108", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_108", action = "action_EVENT_ANY_MONSTER_DIE_108" },
	{ name = "ANY_MONSTER_DIE_109", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_109", action = "action_EVENT_ANY_MONSTER_DIE_109" },
	{ name = "GADGET_CREATE_143", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_143", action = "action_EVENT_GADGET_CREATE_143", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_301", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_301", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "isoff", value = 0, persistent = true },
	{ name = "door1", value = 0, persistent = false },
	{ name = "door2", value = 0, persistent = false },
	{ name = "door3", value = 0, persistent = false }
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
		gadgets = { 2575, 2576, 2577 },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { 2575, 2576, 2577 },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { },
		gadgets = { 2432, 2519 },
		regions = { 83, 85 },
		triggers = { "ANY_MONSTER_DIE_83", "QUEST_FINISH_85" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_83(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_83(context, evt)
	local c_isoff = ScriptLib.GetGroupVariableValue(context, "isoff")
	if c_isoff == 1 then
	
	   if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2432 }) then
	       return -1
	   end
	
	   if 0 ~= ScriptLib.SetGroupVariableValue(context, "isoff", 0) then
	       return -1
	   end
	
	    return 0
	   
	end
	
	
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2519 }) then
		return -1
	end
	
	
	
	return 0
end

-- 触发条件
function condition_EVENT_QUEST_FINISH_85(context, evt)
	--检查ID为38001的任务的完成状态是否为1（1=完成，0=失败）
	--此事件需要配合Quest表使用，在Quest表里的完成执行中配置“通知group脚本”，则该任务完成后服务端会向对应的group发送通知，参数1填写场景ID，参数2填写group ID（如果不填则会通知所有group）
	
	--检查任务ID
	if 38001 ~= evt.param1 then
		return false
	end
	
	--检查任务成功状态
	if 1 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_QUEST_FINISH_85(context, evt)
	-- 将本组内变量名为 "isoff" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "isoff", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_SELECT_OPTION_106(context, evt)
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 2829 }) then
		    return -1
		end
		
	
	-- 将configid为 2575 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2575, GadgetState.GearStart) then
			return -1
		end 
	
	-- 触发镜头注目，注目位置为坐标（2401，286，-1756），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=2401, y=286, z=-1756}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 568, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 569, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 567, delay_time = 0 }) then
	  return -1
	end
	
	-- 将本组内变量名为 "door1" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "door1", 1) then
	  return -1
	end
	
	-- 改变指定group组133003171中， configid为2713的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 133003171, 2713, GadgetState.GearStart) then
			return -1
		end 
	
	-- 改变指定group组133003171中， configid为2714的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 133003171, 2714, GadgetState.GearStart) then
			return -1
		end 
	
	-- 调用提示id为 1014 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1014) then
		return -1
	end
	
	-- play_type含义：1·代表开始播放； 2·代表停止播放
	-- 在指定位置播放或停止音效资源
		local pos = {x=2384, y=284, z=-1750}
	    if 0 ~= ScriptLib.ScenePlaySound(context, {play_pos = pos, sound_name = "LevelHornSound001", play_type= 1, is_broadcast = false }) then
					return -1
		end 
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1102, delay_time = 1 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_107(context, evt)
	-- 判断剩余怪物数量是否是1
	if ScriptLib.GetGroupMonsterCount(context) ~= 1 then
		return false
	end
	
	-- 判断变量"door1"为1
	if ScriptLib.GetGroupVariableValue(context, "door1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_107(context, evt)
	-- 将configid为 2576 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2576, GadgetState.GearStart) then
			return -1
		end 
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 570, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 571, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 572, delay_time = 0 }) then
	  return -1
	end
	
	-- 将本组内变量名为 "door2" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "door2", 1) then
	  return -1
	end
	
	-- 改变指定group组133003171中， configid为2715的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 133003171, 2715, GadgetState.GearStart) then
			return -1
		end 
	
	-- 改变指定group组133003171中， configid为2716的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 133003171, 2716, GadgetState.GearStart) then
			return -1
		end 
	
	-- 调用提示id为 1016 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1016) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_108(context, evt)
	-- 判断剩余怪物数量是否是1
	if ScriptLib.GetGroupMonsterCount(context) ~= 1 then
		return false
	end
	
	-- 判断变量"door2"为1
	if ScriptLib.GetGroupVariableValue(context, "door2") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_108(context, evt)
	-- 将configid为 2577 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2577, GadgetState.GearStart) then
			return -1
		end 
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 573, delay_time = 0 }) then
	  return -1
	end
	
	-- 将本组内变量名为 "door3" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "door3", 1) then
	  return -1
	end
	
	-- 改变指定group组133003171中， configid为2717的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 133003171, 2717, GadgetState.GearStart) then
			return -1
		end 
	
	-- 改变指定group组133003171中， configid为2718的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 133003171, 2718, GadgetState.GearStart) then
			return -1
		end 
	
	-- 调用提示id为 1039 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1039) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_109(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	-- 判断变量"door3"为1
	if ScriptLib.GetGroupVariableValue(context, "door3") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_109(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003098, suite = 2 }) then
			return -1
		end
	
	-- 触发镜头注目，注目位置为坐标（2346，284，-1727），持续时间为3秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=2346, y=284, z=-1727}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 3, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003151, suite = 2 }) then
			return -1
		end
	
	-- 调用提示id为 1015 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1015) then
		return -1
	end
	
	-- 开启或者关闭groupid为133003151中,configid为：620的怪物的ai，set为1是开启，为0是关闭
	if 0 ~= ScriptLib.SetMonsterAIByGroup(context, 1, 620, 133003151) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_143(context, evt)
	if 2829 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_143(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {30}) then
		return -1
	end
	
	-- 开启或者关闭groupid为133003151中,configid为：620的怪物的ai，set为1是开启，为0是关闭
	if 0 ~= ScriptLib.SetMonsterAIByGroup(context, 0, 620, 133003151) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_301(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
