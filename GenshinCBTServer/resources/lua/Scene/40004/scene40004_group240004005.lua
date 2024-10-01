--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 23, monster_id = 21010101, pos = { x = 348.3, y = -28.8, z = 425.9 }, rot = { x = 0.0, y = 337.0, z = 0.0 }, level = 0 },
	{ config_id = 24, monster_id = 21010101, pos = { x = 338.3, y = -28.8, z = 425.8 }, rot = { x = 0.0, y = 22.5, z = 0.0 }, level = 0 },
	{ config_id = 25, monster_id = 21010201, pos = { x = 350.2, y = -29.0, z = 426.6 }, rot = { x = 0.0, y = 328.6, z = 0.0 }, level = 0 },
	{ config_id = 26, monster_id = 21010201, pos = { x = 336.0, y = -29.0, z = 426.3 }, rot = { x = 0.0, y = 39.9, z = 0.0 }, level = 0 },
	{ config_id = 27, monster_id = 21010301, pos = { x = 340.1, y = -29.0, z = 423.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 28, monster_id = 21010301, pos = { x = 347.2, y = -29.0, z = 423.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 29, monster_id = 21010301, pos = { x = 346.2, y = -29.0, z = 420.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 30, monster_id = 21010301, pos = { x = 338.2, y = -29.0, z = 420.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 31, monster_id = 21010301, pos = { x = 348.6, y = -29.1, z = 420.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 32, monster_id = 21010301, pos = { x = 336.0, y = -29.0, z = 420.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 36, shape = RegionShape.SPHERE, radius = 5, pos = { x = 333.9, y = -29.0, z = 422.0 } },
	{ config_id = 35, shape = RegionShape.SPHERE, radius = 5, pos = { x = 352.7, y = -29.0, z = 428.5 } },
	{ config_id = 34, shape = RegionShape.SPHERE, radius = 5, pos = { x = 330.1, y = -29.1, z = 420.9 } },
	{ config_id = 33, shape = RegionShape.SPHERE, radius = 5, pos = { x = 352.1, y = -29.0, z = 430.4 } },
	{ config_id = 32, shape = RegionShape.SPHERE, radius = 5, pos = { x = 335.9, y = -29.0, z = 431.3 } },
	{ config_id = 31, shape = RegionShape.SPHERE, radius = 5, pos = { x = 332.3, y = -29.0, z = 428.0 } },
	{ config_id = 30, shape = RegionShape.SPHERE, radius = 5, pos = { x = 351.4, y = -29.0, z = 426.9 } },
	{ config_id = 27, shape = RegionShape.SPHERE, radius = 5, pos = { x = 342.7, y = -29.0, z = 437.5 } },
	{ config_id = 28, shape = RegionShape.SPHERE, radius = 5, pos = { x = 346.9, y = -29.0, z = 436.2 } },
	{ config_id = 29, shape = RegionShape.SPHERE, radius = 5, pos = { x = 352.8, y = -29.0, z = 439.0 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_36", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_36", action = "action_EVENT_ANY_MONSTER_DIE_36" },
	{ name = "ANY_MONSTER_DIE_35", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_35", action = "action_EVENT_ANY_MONSTER_DIE_35" },
	{ name = "ANY_MONSTER_DIE_34", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_34", action = "action_EVENT_ANY_MONSTER_DIE_34" },
	{ name = "ANY_MONSTER_DIE_33", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_33", action = "action_EVENT_ANY_MONSTER_DIE_33" },
	{ name = "ANY_MONSTER_DIE_32", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_32", action = "action_EVENT_ANY_MONSTER_DIE_32" },
	{ name = "ANY_MONSTER_DIE_31", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_31", action = "action_EVENT_ANY_MONSTER_DIE_31" },
	{ name = "ANY_MONSTER_DIE_30", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_30", action = "action_EVENT_ANY_MONSTER_DIE_30" },
	{ name = "ANY_MONSTER_LIVE_27", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_27", action = "action_EVENT_ANY_MONSTER_LIVE_27", trigger_count = 0 },
	{ name = "CHALLENGE_FAIL_28", event = EventType.EVENT_CHALLENGE_FAIL, source = "1001", condition = "", action = "action_EVENT_CHALLENGE_FAIL_28" },
	{ name = "CHALLENGE_SUCCESS_29", event = EventType.EVENT_CHALLENGE_SUCCESS, source = "1001", condition = "", action = "action_EVENT_CHALLENGE_SUCCESS_29" }
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
	suite = 2,
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
		monsters = { 23, 24 },
		gadgets = { },
		regions = { 35, 34, 33, 32, 31, 30, 27, 28, 29, 36 },
		triggers = { "ANY_MONSTER_DIE_35", "ANY_MONSTER_DIE_34", "ANY_MONSTER_DIE_33", "ANY_MONSTER_DIE_32", "ANY_MONSTER_DIE_31", "ANY_MONSTER_DIE_30", "ANY_MONSTER_LIVE_27", "CHALLENGE_FAIL_28", "CHALLENGE_SUCCESS_29", "ANY_MONSTER_DIE_36" },
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
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_36(context, evt)
	if 27 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_36(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 32, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 30, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_35(context, evt)
	if 28 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_35(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 29, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 31, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_34(context, evt)
	if 26 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_34(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 27, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_33(context, evt)
	if 25 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_33(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 28, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_32(context, evt)
	if 26 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_32(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 27, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_31(context, evt)
	if 24 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_31(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 26, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_30(context, evt)
	if 23 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_30(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 25, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_27(context, evt)
	if 23 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_27(context, evt)
	-- 创建编号为1001（该挑战的识别id),挑战内容为5的区域挑战，具体参数填写方式，见DungeonChallengeData表中的注释，所有填写的值都必须是int类型
	if 0 ~= ScriptLib.ActiveChallenge(context, 1001, 5, 15, 240004005, 10, 0) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_FAIL_28(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 240004005, suite = 2 }) then
			return -1
		end
	
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptionsByGroupId(context, 240004003, 11, {10}) then
		return -1
	end
	
	-- 改变指定group组240004003中， configid为11的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 240004003, 11, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_SUCCESS_29(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 240004006, suite = 1 }) then
			return -1
		end
	
	-- 改变指定group组240004002中， configid为3的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 240004002, 3, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end
