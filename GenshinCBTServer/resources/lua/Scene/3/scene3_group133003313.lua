--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1023, monster_id = 20010101, pos = { x = 2828.5, y = 254.6, z = -1736.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303044 },
	{ config_id = 1024, monster_id = 20010101, pos = { x = 2822.9, y = 254.7, z = -1733.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303044 },
	{ config_id = 1025, monster_id = 20010101, pos = { x = 2821.8, y = 254.0, z = -1747.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303044 },
	{ config_id = 1026, monster_id = 20010101, pos = { x = 2818.9, y = 254.2, z = -1737.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303044 },
	{ config_id = 1027, monster_id = 20010101, pos = { x = 2830.8, y = 253.7, z = -1746.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303044 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3271, gadget_id = 70900007, pos = { x = 2840.1, y = 264.1, z = -1710.8 }, rot = { x = 0.0, y = 11.0, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 3287, gadget_id = 70210031, pos = { x = 2839.2, y = 264.0, z = -1709.4 }, rot = { x = 0.0, y = 320.3, z = 0.0 }, level = 1, chest_drop_id = 403224, showcutscene = true, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 235, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2839.8, y = 263.9, z = -1710.2 } },
	{ config_id = 236, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2838.7, y = 264.0, z = -1710.9 } },
	{ config_id = 237, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2839.8, y = 263.9, z = -1709.6 } },
	{ config_id = 388, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2838.7, y = 264.1, z = -1707.8 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_235", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_235", action = "action_EVENT_GADGET_CREATE_235" },
	{ name = "CHALLENGE_FAIL_236", event = EventType.EVENT_CHALLENGE_FAIL, source = "313", condition = "", action = "action_EVENT_CHALLENGE_FAIL_236" },
	{ name = "CHALLENGE_SUCCESS_237", event = EventType.EVENT_CHALLENGE_SUCCESS, source = "313", condition = "", action = "action_EVENT_CHALLENGE_SUCCESS_237" },
	{ name = "CLIENT_EXECUTE_388", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_388", trigger_count = 0 }
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
		gadgets = { },
		regions = { 388 },
		triggers = { "CLIENT_EXECUTE_388" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_235(context, evt)
	if 3271 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_235(context, evt)
	-- 创建编号为313（该挑战的识别id),挑战内容为142的区域挑战，具体参数填写方式，见DungeonChallengeData表中的注释，所有填写的值都必须是int类型
	if 0 ~= ScriptLib.ActiveChallenge(context, 313, 142, 30, 133003313, 5, 0) then
		return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1023, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1024, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1025, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1026, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1027, delay_time = 0 }) then
	  return -1
	end
	
	-- 触发镜头注目，注目位置为坐标（2850，255，-1725），持续时间为3秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=2850, y=255, z=-1725}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 3, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_FAIL_236(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003313, suite = 1 }) then
			return -1
		end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_SUCCESS_237(context, evt)
	-- 创建id为3287的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3287 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_388(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
