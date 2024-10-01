--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1, monster_id = 21030101, pos = { x = 349.8, y = -19.3, z = 331.4 }, rot = { x = 0.0, y = 349.4, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 3, monster_id = 21010301, pos = { x = 342.9, y = -19.2, z = 338.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 6, monster_id = 20010801, pos = { x = 337.8, y = -19.2, z = 338.4 }, rot = { x = 0.0, y = 15.3, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 15, monster_id = 20020101, pos = { x = 342.7, y = -19.3, z = 334.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 16, monster_id = 21010501, pos = { x = 357.9, y = -14.3, z = 337.0 }, rot = { x = 0.0, y = 328.8, z = 0.0 }, level = 0, disableWander = true, affix = { 1002 } },
	{ config_id = 17, monster_id = 21030201, pos = { x = 343.1, y = -18.4, z = 327.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true, affix = { 1002 } },
	{ config_id = 18, monster_id = 20010801, pos = { x = 336.3, y = -19.3, z = 331.2 }, rot = { x = 0.0, y = 18.1, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 19, monster_id = 21010701, pos = { x = 353.1, y = -19.3, z = 335.1 }, rot = { x = 0.0, y = 324.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 20, monster_id = 21010701, pos = { x = 331.4, y = -19.4, z = 333.1 }, rot = { x = 0.0, y = 51.4, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 21, monster_id = 21010501, pos = { x = 353.1, y = -18.4, z = 326.8 }, rot = { x = 0.0, y = 330.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 22, monster_id = 21030101, pos = { x = 333.6, y = -18.4, z = 326.7 }, rot = { x = 0.0, y = 29.7, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1, gadget_id = 70350003, pos = { x = 343.3, y = -18.5, z = 322.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2, gadget_id = 70350003, pos = { x = 333.3, y = -18.4, z = 322.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3, gadget_id = 70350003, pos = { x = 353.3, y = -18.5, z = 322.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 10, gadget_id = 70360002, pos = { x = 343.2, y = -19.3, z = 343.8 }, rot = { x = 0.0, y = 358.1, z = 0.0 }, level = 1 },
	{ config_id = 11, gadget_id = 70350003, pos = { x = 343.2, y = -18.8, z = 368.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 12, gadget_id = 70350003, pos = { x = 353.4, y = -19.0, z = 368.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 13, gadget_id = 70350003, pos = { x = 333.3, y = -19.2, z = 368.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 14, gadget_id = 70220003, pos = { x = 358.5, y = -16.8, z = 350.2 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 15, gadget_id = 70220003, pos = { x = 358.6, y = -16.9, z = 345.3 }, rot = { x = 0.0, y = 272.4, z = 0.0 }, level = 1 },
	{ config_id = 16, gadget_id = 70220003, pos = { x = 359.0, y = -16.9, z = 341.1 }, rot = { x = 0.0, y = 91.2, z = 0.0 }, level = 1 },
	{ config_id = 17, gadget_id = 70220003, pos = { x = 361.8, y = -14.3, z = 335.9 }, rot = { x = 0.0, y = 135.4, z = 0.0 }, level = 1 },
	{ config_id = 18, gadget_id = 70220003, pos = { x = 359.2, y = -14.2, z = 333.7 }, rot = { x = 0.0, y = 306.9, z = 0.0 }, level = 1 },
	{ config_id = 19, gadget_id = 70220003, pos = { x = 358.2, y = -14.3, z = 330.3 }, rot = { x = 0.0, y = 275.0, z = 0.0 }, level = 1 },
	{ config_id = 22, gadget_id = 70210041, pos = { x = 343.1, y = -19.3, z = 333.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1400900, showcutscene = true, type = GadgetType.GADGET_DUNGEON_PASS_CHEST },
	{ config_id = 23, gadget_id = 70210011, pos = { x = 345.5, y = -19.3, z = 332.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1400901, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 24, gadget_id = 70210011, pos = { x = 340.9, y = -19.3, z = 332.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1400901, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 25, gadget_id = 70350003, pos = { x = 342.9, y = -28.2, z = 404.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 3, shape = RegionShape.SPHERE, radius = 5, pos = { x = 342.8, y = -19.3, z = 334.4 } },
	{ config_id = 9, shape = RegionShape.SPHERE, radius = 5, pos = { x = 343.1, y = -23.7, z = 384.7 } },
	{ config_id = 10, shape = RegionShape.SPHERE, radius = 5, pos = { x = 339.8, y = -18.3, z = 356.1 } },
	{ config_id = 11, shape = RegionShape.SPHERE, radius = 5, pos = { x = 343.9, y = -19.3, z = 354.1 } },
	{ config_id = 12, shape = RegionShape.SPHERE, radius = 5, pos = { x = 341.4, y = -19.2, z = 341.7 } },
	{ config_id = 13, shape = RegionShape.SPHERE, radius = 5, pos = { x = 341.9, y = -19.2, z = 330.0 } },
	{ config_id = 14, shape = RegionShape.SPHERE, radius = 5, pos = { x = 341.6, y = -19.3, z = 336.8 } },
	{ config_id = 16, shape = RegionShape.SPHERE, radius = 5, pos = { x = 334.3, y = -19.3, z = 339.7 } },
	{ config_id = 17, shape = RegionShape.SPHERE, radius = 5, pos = { x = 350.7, y = -19.3, z = 335.3 } },
	{ config_id = 19, shape = RegionShape.SPHERE, radius = 5, pos = { x = 333.2, y = -19.3, z = 336.0 } },
	{ config_id = 20, shape = RegionShape.SPHERE, radius = 5, pos = { x = 337.5, y = -19.3, z = 333.4 } },
	{ config_id = 21, shape = RegionShape.SPHERE, radius = 5, pos = { x = 348.2, y = -19.3, z = 335.9 } }
}

-- 触发器
triggers = {
	{ name = "CHALLENGE_FAIL_3", event = EventType.EVENT_CHALLENGE_FAIL, source = "1", condition = "", action = "action_EVENT_CHALLENGE_FAIL_3" },
	{ name = "ENTER_REGION_9", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_9", action = "action_EVENT_ENTER_REGION_9" },
	{ name = "GADGET_CREATE_10", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_10", action = "action_EVENT_GADGET_CREATE_10" },
	{ name = "SELECT_OPTION_11", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_11", action = "action_EVENT_SELECT_OPTION_11" },
	{ name = "CHALLENGE_SUCCESS_12", event = EventType.EVENT_CHALLENGE_SUCCESS, source = "1", condition = "", action = "action_EVENT_CHALLENGE_SUCCESS_12" },
	{ name = "CHALLENGE_SUCCESS_13", event = EventType.EVENT_CHALLENGE_SUCCESS, source = "2", condition = "", action = "action_EVENT_CHALLENGE_SUCCESS_13" },
	{ name = "CHALLENGE_FAIL_14", event = EventType.EVENT_CHALLENGE_FAIL, source = "2", condition = "", action = "action_EVENT_CHALLENGE_FAIL_14" },
	{ name = "TIMER_EVENT_16", event = EventType.EVENT_TIMER_EVENT, source = "", condition = "", action = "action_EVENT_TIMER_EVENT_16" },
	{ name = "TIMER_EVENT_17", event = EventType.EVENT_TIMER_EVENT, source = "", condition = "", action = "action_EVENT_TIMER_EVENT_17", trigger_count = 0 },
	{ name = "CHALLENGE_FAIL_19", event = EventType.EVENT_CHALLENGE_FAIL, source = "4", condition = "", action = "action_EVENT_CHALLENGE_FAIL_19" },
	{ name = "CHALLENGE_SUCCESS_20", event = EventType.EVENT_CHALLENGE_SUCCESS, source = "4", condition = "", action = "action_EVENT_CHALLENGE_SUCCESS_20", trigger_count = 0 },
	{ name = "TIMER_EVENT_21", event = EventType.EVENT_TIMER_EVENT, source = "", condition = "", action = "action_EVENT_TIMER_EVENT_21", trigger_count = 0 }
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
		gadgets = { 1, 2, 3, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 25 },
		regions = { 3, 9, 10, 11, 12, 13, 14, 16, 17, 19, 20, 21 },
		triggers = { "CHALLENGE_FAIL_3", "ENTER_REGION_9", "GADGET_CREATE_10", "SELECT_OPTION_11", "CHALLENGE_SUCCESS_12", "CHALLENGE_SUCCESS_13", "CHALLENGE_FAIL_14", "TIMER_EVENT_16", "TIMER_EVENT_17", "CHALLENGE_FAIL_19", "CHALLENGE_SUCCESS_20", "TIMER_EVENT_21" },
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
function action_EVENT_CHALLENGE_FAIL_3(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230002001, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	-- 地城失败结算
	if 0 ~= ScriptLib.CauseDungeonFail(context) then
		return -1
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
	-- 将configid为 11 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 11, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_10(context, evt)
	if 10 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_10(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {105}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_11(context, evt)
	if 10 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_11(context, evt)
	-- 根据不同的选项做不同的操作
	if 105 == evt.param2 then
	-- 创建编号为1,挑战内容为2的区域挑战
	if 0 ~= ScriptLib.ActiveChallenge(context, 1, 100, 60, 230002001, 4, 0) then
		return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 3, delay_time = 0 }) then
	  return -1
	end
	
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 6, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 18, delay_time = 0 }) then
	  return -1
	end
	
	if 0 ~= ScriptLib.DelWorktopOptionByGroupId(context, 230002001, 10, 105) then
		return -1
	end
	
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 11, GadgetState.Default) then
			return -1
		end 
		return 0
	end
	
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_SUCCESS_12(context, evt)
	-- 延迟10秒后,向groupId为：230002001的对象,请求一次调用,并将string参数："Second_Challenge" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 230002001, "Second_Challenge", 10) then
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
function action_EVENT_CHALLENGE_SUCCESS_13(context, evt)
	-- 创建编号为4（该挑战的识别id),挑战内容为102的区域挑战，具体参数填写方式，见DungeonChallengeData表中的注释，所有填写的值都必须是int类型
	if 0 ~= ScriptLib.ActiveChallenge(context, 4, 102, 120, 230002001, 15, 0) then
		return -1
	end
	
	-- 调用提示id为 10051804 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 10051804) then
		return -1
	end
	
	--解锁configid 为 15 的怪物的血量
	if 0 ~= ScriptLib.UnlockMonsterHp(context, 15) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_FAIL_14(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230002001, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	-- 地城失败结算
	if 0 ~= ScriptLib.CauseDungeonFail(context) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_16(context, evt)
	-- 根据不同的选项做不同的操作
	
	if evt.source_name == "Second_Challenge" then
	
	-- 创建编号为2,挑战内容为3的区域挑战
	if 0 ~= ScriptLib.ActiveChallenge(context, 2, 101, 60, 0, 0, 0) then
		return -1
	end
	
	--延迟15秒后,向groupId为：230002001的对象,请求一次调用,并将string参数："Monster_One" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 230002001, "Monster_One", 10) then
	  return -1
	end
	
	
	--延迟30秒后,向groupId为：230002001的对象,请求一次调用,并将string参数："Monster_Two" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 230002001, "Monster_Two", 30) then
	  return -1
	end
	
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 15, delay_time = 0 }) then
	  return -1
	end
	
	if 0 ~= ScriptLib.LockMonsterHp(context, 15) then
		return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 16, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 17, delay_time = 0 }) then
	  return -1
	end
	
	if 0 ~= ScriptLib.ShowReminder(context, 10051802) then
		return -1
	end
	
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_17(context, evt)
	-- 1
	
	if evt.source_name == "Monster_One" then
	
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 19, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 20, delay_time = 0 }) then
	  return -1
	end
	
	if 0 ~= ScriptLib.ShowReminder(context, 10051803) then
		return -1
	end
	
	end
	
	if evt.source_name == "Monster_Two" then
	
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 21, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 22, delay_time = 0 }) then
	  return -1
	end
	
	if 0 ~= ScriptLib.ShowReminder(context, 10051803) then
		return -1
	end
	
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_FAIL_19(context, evt)
	-- 地城失败结算
	if 0 ~= ScriptLib.CauseDungeonFail(context) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_SUCCESS_20(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230002001, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	-- 延迟5秒后,向groupId为：230002001的对象,请求一次调用,并将string参数："over" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 230002001, "over", 5) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_21(context, evt)
	if evt.source_name == "over" then
	
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 22 }) then
		return -1
	end
	
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 23 }) then
		return -1
	end
	
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 24 }) then
		return -1
	end
	
	end
	
	return 0
	
	
	
	
	
	
end
