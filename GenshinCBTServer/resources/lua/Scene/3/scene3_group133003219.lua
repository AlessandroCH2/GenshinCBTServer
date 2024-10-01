--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 862, monster_id = 20010801, pos = { x = 2774.7, y = 258.1, z = -1338.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10 },
	{ config_id = 863, monster_id = 20010801, pos = { x = 2781.1, y = 258.1, z = -1330.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10 },
	{ config_id = 864, monster_id = 20010801, pos = { x = 2780.7, y = 258.1, z = -1343.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10 },
	{ config_id = 865, monster_id = 20010801, pos = { x = 2787.1, y = 258.1, z = -1336.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2980, gadget_id = 70900009, pos = { x = 2774.7, y = 257.2, z = -1332.6 }, rot = { x = 4.9, y = 314.4, z = 355.6 }, level = 1, persistent = true },
	{ config_id = 2981, gadget_id = 70210031, pos = { x = 2771.9, y = 256.3, z = -1327.7 }, rot = { x = 350.4, y = 159.5, z = 0.0 }, level = 1, chest_drop_id = 403222, showcutscene = true, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 176, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2774.1, y = 257.0, z = -1331.6 } },
	{ config_id = 177, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2772.9, y = 256.9, z = -1331.8 } },
	{ config_id = 178, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2773.9, y = 256.8, z = -1330.4 } },
	{ config_id = 349, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2774.0, y = 256.9, z = -1331.2 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_176", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_176", action = "action_EVENT_GADGET_STATE_CHANGE_176", tlog_tag = "望风山地_219_元素机关挑战_开始" },
	{ name = "CHALLENGE_FAIL_177", event = EventType.EVENT_CHALLENGE_FAIL, source = "219", condition = "", action = "action_EVENT_CHALLENGE_FAIL_177" },
	{ name = "CHALLENGE_SUCCESS_178", event = EventType.EVENT_CHALLENGE_SUCCESS, source = "219", condition = "", action = "action_EVENT_CHALLENGE_SUCCESS_178", tlog_tag = "望风山地_219_元素机关挑战_结算" },
	{ name = "CLIENT_EXECUTE_349", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_349", trigger_count = 0 }
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
		gadgets = { 2980 },
		regions = { 176, 177, 178, 349 },
		triggers = { "GADGET_STATE_CHANGE_176", "CHALLENGE_FAIL_177", "CHALLENGE_SUCCESS_178", "CLIENT_EXECUTE_349" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_176(context, evt)
	if 2980 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_176(context, evt)
	-- 创建编号为219（该挑战的识别id),挑战内容为138的区域挑战，具体参数填写方式，见DungeonChallengeData表中的注释，所有填写的值都必须是int类型
	if 0 ~= ScriptLib.ActiveChallenge(context, 219, 138, 60, 133003219, 4, 0) then
		return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 862, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 863, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 864, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 865, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_FAIL_177(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003219, suite = 1 }) then
			return -1
		end
	
	-- 将configid为 2980 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2980, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_SUCCESS_178(context, evt)
	-- 创建id为2981的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2981 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_349(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
