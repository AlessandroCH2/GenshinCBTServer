--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 9, monster_id = 20011201, pos = { x = 409.7, y = -22.2, z = 67.2 }, rot = { x = 0.0, y = 136.8, z = 0.0 }, level = 3, drop_id = 1100309, disableWander = true },
	{ config_id = 25, monster_id = 20011201, pos = { x = 409.7, y = -22.0, z = 60.6 }, rot = { x = 0.0, y = 36.5, z = 0.0 }, level = 3, drop_id = 1100309, disableWander = true },
	{ config_id = 26, monster_id = 20011201, pos = { x = 408.6, y = -22.1, z = 61.4 }, rot = { x = 0.0, y = 76.9, z = 0.0 }, level = 3, drop_id = 1100309, disableWander = true },
	{ config_id = 28, monster_id = 20011201, pos = { x = 408.8, y = -22.1, z = 65.9 }, rot = { x = 0.0, y = 109.4, z = 0.0 }, level = 3, drop_id = 1100309, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 8, shape = RegionShape.SPHERE, radius = 5, pos = { x = 408.8, y = -22.1, z = 67.6 } },
	{ config_id = 56, shape = RegionShape.SPHERE, radius = 5, pos = { x = 405.7, y = -22.1, z = 64.5 } },
	{ config_id = 57, shape = RegionShape.SPHERE, radius = 5, pos = { x = 405.0, y = -22.0, z = 61.7 } },
	{ config_id = 58, shape = RegionShape.SPHERE, radius = 5, pos = { x = 405.4, y = -22.1, z = 66.2 } },
	{ config_id = 59, shape = RegionShape.SPHERE, radius = 5, pos = { x = 407.2, y = -22.1, z = 65.1 } },
	{ config_id = 61, shape = RegionShape.SPHERE, radius = 5, pos = { x = 410.2, y = -22.1, z = 58.2 } },
	{ config_id = 65, shape = RegionShape.SPHERE, radius = 5, pos = { x = 412.6, y = -22.1, z = 63.9 } }
}

-- 触发器
triggers = {
	{ name = "CHALLENGE_SUCCESS_8", event = EventType.EVENT_CHALLENGE_SUCCESS, source = "1", condition = "", action = "action_EVENT_CHALLENGE_SUCCESS_8", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_56", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_56", action = "action_EVENT_ANY_MONSTER_LIVE_56", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_57", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_57", action = "action_EVENT_ANY_MONSTER_LIVE_57", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_58", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_58", action = "action_EVENT_ANY_MONSTER_LIVE_58", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_59", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_59", action = "action_EVENT_ANY_MONSTER_LIVE_59", trigger_count = 0 },
	{ name = "CHALLENGE_FAIL_61", event = EventType.EVENT_CHALLENGE_FAIL, source = "1", condition = "", action = "action_EVENT_CHALLENGE_FAIL_61", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_65", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_65", action = "action_EVENT_ANY_MONSTER_LIVE_65", trigger_count = 0 }
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
		monsters = { 9, 25, 26, 28 },
		gadgets = { },
		regions = { 8, 56, 57, 58, 59, 61, 65 },
		triggers = { "CHALLENGE_SUCCESS_8", "ANY_MONSTER_LIVE_56", "ANY_MONSTER_LIVE_57", "ANY_MONSTER_LIVE_58", "ANY_MONSTER_LIVE_59", "CHALLENGE_FAIL_61", "ANY_MONSTER_LIVE_65" },
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

-- 触发操作
function action_EVENT_CHALLENGE_SUCCESS_8(context, evt)
	-- 改变指定group组220011001中， configid为10的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 220011001, 10, GadgetState.GearStart) then
			return -1
		end 
	
	-- 改变指定group组220011001中， configid为46的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 220011001, 46, GadgetState.GearStart) then
			return -1
		end 
	
	-- 改变指定group组220011001中， configid为47的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 220011001, 47, GadgetState.GearStart) then
			return -1
		end 
	
	-- 触发镜头注目，注目位置为坐标（406，-17，81），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=406, y=-17, z=81}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	-- 改变指定group组220011001中， configid为136的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 220011001, 136, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_56(context, evt)
	if 9 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_56(context, evt)
	-- 开启或者关闭groupid为220011001中,configid为：9的怪物的ai，set为1是开启，为0是关闭
	if 0 ~= ScriptLib.SetMonsterAIByGroup(context, 0, 9, 220011001) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_57(context, evt)
	if 25 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_57(context, evt)
	-- 开启或者关闭groupid为220011001中,configid为：25的怪物的ai，set为1是开启，为0是关闭
	if 0 ~= ScriptLib.SetMonsterAIByGroup(context, 0, 25, 220011001) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_58(context, evt)
	if 26 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_58(context, evt)
	-- 开启或者关闭groupid为220011001中,configid为：26的怪物的ai，set为1是开启，为0是关闭
	if 0 ~= ScriptLib.SetMonsterAIByGroup(context, 0, 26, 220011001) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_59(context, evt)
	if 28 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_59(context, evt)
	-- 开启或者关闭groupid为220011001中,configid为：28的怪物的ai，set为1是开启，为0是关闭
	if 0 ~= ScriptLib.SetMonsterAIByGroup(context, 0, 28, 220011001) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_FAIL_61(context, evt)
	-- 改变指定group组220011001中， configid为135的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 220011001, 135, GadgetState.Default) then
			return -1
		end 
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 220011006, suite = 2 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_65(context, evt)
	if 9 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_65(context, evt)
	-- 创建编号为1（该挑战的识别id),挑战内容为137的区域挑战，具体参数填写方式，见DungeonChallengeData表中的注释，所有填写的值都必须是int类型
	if 0 ~= ScriptLib.ActiveChallenge(context, 1, 137, 20, 220011006, 4, 0) then
		return -1
	end
	
	return 0
end
