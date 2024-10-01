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
	{ config_id = 2998, gadget_id = 70900007, pos = { x = 2655.3, y = 239.2, z = -1123.4 }, rot = { x = 0.0, y = 167.7, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 3293, gadget_id = 70210031, pos = { x = 2667.1, y = 236.6, z = -1130.6 }, rot = { x = 0.0, y = 344.9, z = 0.0 }, level = 1, chest_drop_id = 403222, showcutscene = true, isOneoff = true },
	{ config_id = 3294, gadget_id = 70380002, pos = { x = 2654.7, y = 237.0, z = -1133.0 }, rot = { x = 0.0, y = 262.2, z = 0.0 }, level = 1, route_id = 3003193 },
	{ config_id = 3295, gadget_id = 70380002, pos = { x = 2657.7, y = 237.0, z = -1133.0 }, rot = { x = 0.0, y = 262.2, z = 0.0 }, level = 1, route_id = 3003193 },
	{ config_id = 3296, gadget_id = 70380002, pos = { x = 2660.7, y = 237.0, z = -1133.0 }, rot = { x = 0.0, y = 262.2, z = 0.0 }, level = 1, route_id = 3003193 },
	{ config_id = 3297, gadget_id = 70380002, pos = { x = 2663.7, y = 237.0, z = -1133.0 }, rot = { x = 0.0, y = 262.2, z = 0.0 }, level = 1, route_id = 3003193 }
}

-- 区域
regions = {
	{ config_id = 242, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2654.2, y = 239.2, z = -1122.3 } },
	{ config_id = 243, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2655.3, y = 239.2, z = -1121.6 } },
	{ config_id = 244, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2655.3, y = 239.2, z = -1121.9 } },
	{ config_id = 260, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2658.1, y = 238.6, z = -1123.1 } },
	{ config_id = 354, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2654.7, y = 239.2, z = -1123.6 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_242", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_242", action = "action_EVENT_GADGET_STATE_CHANGE_242", tlog_tag = "望风山地_224_元素机关挑战_开始" },
	{ name = "CHALLENGE_FAIL_243", event = EventType.EVENT_CHALLENGE_FAIL, source = "224", condition = "", action = "action_EVENT_CHALLENGE_FAIL_243" },
	{ name = "CHALLENGE_SUCCESS_244", event = EventType.EVENT_CHALLENGE_SUCCESS, source = "224", condition = "", action = "action_EVENT_CHALLENGE_SUCCESS_244", tlog_tag = "望风山地_224_元素机关挑战_结算" },
	{ name = "ANY_GADGET_DIE_260", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "", action = "", trigger_count = 4, tag = "23" },
	{ name = "CLIENT_EXECUTE_354", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_354", trigger_count = 0 }
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
		gadgets = { 2998 },
		regions = { 242, 243, 244, 260, 354 },
		triggers = { "GADGET_STATE_CHANGE_242", "CHALLENGE_FAIL_243", "CHALLENGE_SUCCESS_244", "ANY_GADGET_DIE_260", "CLIENT_EXECUTE_354" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_242(context, evt)
	if 2998 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_242(context, evt)
	-- 创建编号为224（该挑战的识别id),挑战内容为144的区域挑战，具体参数填写方式，见DungeonChallengeData表中的注释，所有填写的值都必须是int类型
	if 0 ~= ScriptLib.ActiveChallenge(context, 224, 144, 30, 2, 23, 4) then
		return -1
	end
	
	-- 创建id为3294的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3294 }) then
	  return -1
	end
	
	-- 创建id为3295的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3295 }) then
	  return -1
	end
	
	-- 创建id为3296的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3296 }) then
	  return -1
	end
	
	-- 创建id为3297的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3297 }) then
	  return -1
	end
	
	-- 触发镜头注目，注目位置为坐标（2652，240，-1132），持续时间为3秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=2652, y=240, z=-1132}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 3, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_FAIL_243(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003224, suite = 1 }) then
			return -1
		end
	
	-- 将configid为 2998 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2998, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_SUCCESS_244(context, evt)
	-- 创建id为3293的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3293 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_354(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
