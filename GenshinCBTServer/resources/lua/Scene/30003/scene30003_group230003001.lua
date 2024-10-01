--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1, monster_id = 22010201, pos = { x = 546.2, y = -68.1, z = 206.5 }, rot = { x = 0.0, y = 91.9, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 2, monster_id = 21010201, pos = { x = 544.4, y = -68.1, z = 209.2 }, rot = { x = 0.0, y = 101.8, z = 0.0 }, level = 0 },
	{ config_id = 3, monster_id = 21011001, pos = { x = 552.9, y = -68.4, z = 215.9 }, rot = { x = 0.0, y = 134.5, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 4, monster_id = 21011001, pos = { x = 553.0, y = -68.1, z = 196.0 }, rot = { x = 0.0, y = 48.5, z = 0.0 }, level = 0 },
	{ config_id = 5, monster_id = 20010901, pos = { x = 546.8, y = -68.1, z = 206.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true, affix = { 1002 }, isElite = true },
	{ config_id = 6, monster_id = 21011001, pos = { x = 554.7, y = -67.8, z = 196.1 }, rot = { x = 0.0, y = 11.6, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 7, monster_id = 21011001, pos = { x = 554.8, y = -68.1, z = 218.5 }, rot = { x = 0.0, y = 161.1, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 8, monster_id = 20010501, pos = { x = 561.6, y = -68.1, z = 195.5 }, rot = { x = 0.0, y = 353.3, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 9, monster_id = 20010501, pos = { x = 562.8, y = -68.1, z = 217.7 }, rot = { x = 0.0, y = 218.9, z = 0.0 }, level = 0, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1, gadget_id = 70900007, pos = { x = 557.1, y = -67.9, z = 206.5 }, rot = { x = 0.0, y = 45.2, z = 0.0 }, level = 1, state = GadgetState.GearStop },
	{ config_id = 2, gadget_id = 70350003, pos = { x = 538.5, y = -67.9, z = 206.4 }, rot = { x = 0.0, y = 269.5, z = 0.0 }, level = 1 },
	{ config_id = 3, gadget_id = 70210031, pos = { x = 548.3, y = -68.6, z = 206.9 }, rot = { x = 0.0, y = 93.7, z = 0.0 }, level = 1, chest_drop_id = 1400200, showcutscene = true, type = GadgetType.GADGET_DUNGEON_PASS_CHEST },
	{ config_id = 4, gadget_id = 70210011, pos = { x = 547.1, y = -68.4, z = 204.8 }, rot = { x = 0.0, y = 92.0, z = 0.0 }, level = 1, chest_drop_id = 1400201, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 5, gadget_id = 70210011, pos = { x = 547.1, y = -68.5, z = 208.7 }, rot = { x = 0.0, y = 99.6, z = 0.0 }, level = 1, chest_drop_id = 1400201, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 6, gadget_id = 70350002, pos = { x = 584.1, y = -58.9, z = 206.4 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 2, shape = RegionShape.SPHERE, radius = 5, pos = { x = 560.8, y = -66.9, z = 206.8 } },
	{ config_id = 3, shape = RegionShape.SPHERE, radius = 5, pos = { x = 557.7, y = -67.8, z = 206.2 } },
	{ config_id = 4, shape = RegionShape.SPHERE, radius = 5, pos = { x = 560.6, y = -66.7, z = 206.5 } },
	{ config_id = 5, shape = RegionShape.SPHERE, radius = 5, pos = { x = 560.5, y = -66.5, z = 206.7 } },
	{ config_id = 6, shape = RegionShape.SPHERE, radius = 5, pos = { x = 561.9, y = -68.1, z = 219.9 } },
	{ config_id = 7, shape = RegionShape.SPHERE, radius = 5, pos = { x = 564.8, y = -68.1, z = 221.4 } },
	{ config_id = 8, shape = RegionShape.SPHERE, radius = 5, pos = { x = 560.5, y = -68.1, z = 220.5 } },
	{ config_id = 9, shape = RegionShape.CUBIC, size = { x = 40.0, y = 5.0, z = 40.0 }, pos = { x = 553.3, y = -67.8, z = 207.5 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_2", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_2", action = "action_EVENT_GADGET_STATE_CHANGE_2" },
	{ name = "CHALLENGE_FAIL_3", event = EventType.EVENT_CHALLENGE_FAIL, source = "1", condition = "", action = "action_EVENT_CHALLENGE_FAIL_3" },
	{ name = "CHALLENGE_SUCCESS_4", event = EventType.EVENT_CHALLENGE_SUCCESS, source = "1", condition = "", action = "action_EVENT_CHALLENGE_SUCCESS_4" },
	{ name = "TIMER_EVENT_5", event = EventType.EVENT_TIMER_EVENT, source = "", condition = "", action = "action_EVENT_TIMER_EVENT_5", trigger_count = 0 },
	{ name = "CHALLENGE_FAIL_6", event = EventType.EVENT_CHALLENGE_FAIL, source = "2", condition = "", action = "action_EVENT_CHALLENGE_FAIL_6" },
	{ name = "CHALLENGE_SUCCESS_7", event = EventType.EVENT_CHALLENGE_SUCCESS, source = "2", condition = "", action = "action_EVENT_CHALLENGE_SUCCESS_7" },
	{ name = "TIMER_EVENT_8", event = EventType.EVENT_TIMER_EVENT, source = "", condition = "", action = "action_EVENT_TIMER_EVENT_8", trigger_count = 0 },
	{ name = "ENTER_REGION_9", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_9", action = "action_EVENT_ENTER_REGION_9" }
}

-- 变量
variables = {
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
		gadgets = { 1, 2, 6 },
		regions = { 2, 3, 4, 5, 6, 7, 8, 9 },
		triggers = { "GADGET_STATE_CHANGE_2", "CHALLENGE_FAIL_3", "CHALLENGE_SUCCESS_4", "TIMER_EVENT_5", "CHALLENGE_FAIL_6", "CHALLENGE_SUCCESS_7", "TIMER_EVENT_8", "ENTER_REGION_9" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_2(context, evt)
	if 1 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_2(context, evt)
	-- 创建编号为1（该挑战的识别id),挑战内容为103的区域挑战，具体参数填写方式，见DungeonChallengeData表中的注释，所有填写的值都必须是int类型
	if 0 ~= ScriptLib.ActiveChallenge(context, 1, 103, 230003001, 4, 8, 0) then
		return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 2, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 3, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 4, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_FAIL_3(context, evt)
	-- 地城失败结算
	if 0 ~= ScriptLib.CauseDungeonFail(context) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_SUCCESS_4(context, evt)
	-- 延迟10秒后,向groupId为：230003001的对象,请求一次调用,并将string参数："C2" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 230003001, "C2", 10) then
	  return -1
	end
	
	-- 调用提示id为 10051801 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 10051801) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_5(context, evt)
	if evt.source_name == "C2" then
	
	-- 创建编号为2,挑战内容为4的区域挑战
	if 0 ~= ScriptLib.ActiveChallenge(context, 2, 104, 230003001, 5, 60, 10) then
		return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 5, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 6, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 7, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 8, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 9, delay_time = 0 }) then
	  return -1
	end
	
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_FAIL_6(context, evt)
	-- 地城失败结算
	if 0 ~= ScriptLib.CauseDungeonFail(context) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_SUCCESS_7(context, evt)
	-- 延迟3秒后,向groupId为：230003001的对象,请求一次调用,并将string参数："over" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 230003001, "over", 3) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_8(context, evt)
	if evt.source_name == "over" then
	
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3 }) then
		return -1
	end
	
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 4 }) then
		return -1
	end
	
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 5 }) then
		return -1
	end
	
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_9(context, evt)
	if evt.param1 ~= 9 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_9(context, evt)
	-- 将configid为 1 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
