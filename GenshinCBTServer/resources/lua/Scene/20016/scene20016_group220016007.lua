--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 6, monster_id = 20011301, pos = { x = 342.6, y = -28.9, z = 424.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, affix = { 1002, 1003, 1004 }, isElite = true },
	{ config_id = 7, monster_id = 20011201, pos = { x = 348.3, y = -29.1, z = 428.5 }, rot = { x = 0.0, y = 341.9, z = 0.0 }, level = 0 },
	{ config_id = 8, monster_id = 20011201, pos = { x = 338.2, y = -29.0, z = 427.8 }, rot = { x = 0.0, y = 24.6, z = 0.0 }, level = 0 },
	{ config_id = 11, monster_id = 20011201, pos = { x = 344.9, y = -29.0, z = 426.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, affix = { 1001 } },
	{ config_id = 12, monster_id = 20011201, pos = { x = 342.8, y = -29.0, z = 426.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, affix = { 1001 } },
	{ config_id = 13, monster_id = 20011201, pos = { x = 336.4, y = -29.0, z = 427.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, affix = { 1001 } }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 1, shape = RegionShape.SPHERE, radius = 5, pos = { x = 342.0, y = -28.9, z = 429.6 } },
	{ config_id = 2, shape = RegionShape.SPHERE, radius = 5, pos = { x = 338.0, y = -28.9, z = 427.9 } },
	{ config_id = 3, shape = RegionShape.SPHERE, radius = 5, pos = { x = 346.3, y = -29.0, z = 429.3 } },
	{ config_id = 7, shape = RegionShape.SPHERE, radius = 5, pos = { x = 342.7, y = -29.0, z = 423.8 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_LIVE_1", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_1", action = "action_EVENT_ANY_MONSTER_LIVE_1" },
	{ name = "CHALLENGE_SUCCESS_2", event = EventType.EVENT_CHALLENGE_SUCCESS, source = "1", condition = "", action = "action_EVENT_CHALLENGE_SUCCESS_2" },
	{ name = "CHALLENGE_FAIL_3", event = EventType.EVENT_CHALLENGE_FAIL, source = "1", condition = "", action = "action_EVENT_CHALLENGE_FAIL_3" },
	{ name = "SPECIFIC_MONSTER_HP_CHANGE_7", event = EventType.EVENT_SPECIFIC_MONSTER_HP_CHANGE, source = "6", condition = "condition_EVENT_SPECIFIC_MONSTER_HP_CHANGE_7", action = "action_EVENT_SPECIFIC_MONSTER_HP_CHANGE_7" }
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
		monsters = { 6, 7, 8 },
		gadgets = { },
		regions = { 2, 3, 7 },
		triggers = { "CHALLENGE_SUCCESS_2", "CHALLENGE_FAIL_3", "SPECIFIC_MONSTER_HP_CHANGE_7" },
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
function condition_EVENT_ANY_MONSTER_LIVE_1(context, evt)
	if 6 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_1(context, evt)
	ScriptLib.PrintLog("tiaozhankaishilalalal")
	
	
	-- 创建编号为1（该挑战的识别id),挑战内容为133的区域挑战，具体参数填写方式，见DungeonChallengeData表中的注释，所有填写的值都必须是int类型
	if 0 ~= ScriptLib.ActiveChallenge(context, 1, 133, 90, 220016007, 6, 0) then
		return -1
	end
	
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_SUCCESS_2(context, evt)
	-- 改变指定group组220016002中， configid为6的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 220016002, 6, GadgetState.GearStart) then
			return -1
		end 
	
	-- 触发镜头注目，注目位置为坐标（343，-25，404），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=343, y=-25, z=404}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_FAIL_3(context, evt)
	-- 改变指定group组220016002中， configid为5的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 220016002, 5, GadgetState.Default) then
			return -1
		end 
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 220016007, suite = 2 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_SPECIFIC_MONSTER_HP_CHANGE_7(context, evt)
	--[[判断指定configid的怪物的血量小于%50时触发指定后续操作]]--
	if evt.type ~= EventType.EVENT_SPECIFIC_MONSTER_HP_CHANGE or evt.param3 > 50 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_SPECIFIC_MONSTER_HP_CHANGE_7(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 11, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 12, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 13, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end
