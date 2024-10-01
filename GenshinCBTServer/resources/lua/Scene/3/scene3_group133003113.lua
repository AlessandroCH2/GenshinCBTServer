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
	{ config_id = 2558, gadget_id = 70210031, pos = { x = 2291.5, y = 248.0, z = -1468.1 }, rot = { x = 352.4, y = 165.2, z = 3.9 }, level = 1, chest_drop_id = 403243, showcutscene = true, isOneoff = true, persistent = true },
	{ config_id = 2614, gadget_id = 70900039, pos = { x = 2521.4, y = 345.3, z = -1694.1 }, rot = { x = 0.0, y = 30.4, z = 356.2 }, level = 1, persistent = true },
	{ config_id = 4197, gadget_id = 70500000, pos = { x = 2409.9, y = 284.6, z = -1564.2 }, rot = { x = 0.0, y = 184.1, z = 0.0 }, level = 1, point_type = 2004 },
	{ config_id = 4198, gadget_id = 70500000, pos = { x = 2313.8, y = 267.6, z = -1506.1 }, rot = { x = 0.0, y = 184.1, z = 0.0 }, level = 1, point_type = 2004 },
	{ config_id = 4199, gadget_id = 70500000, pos = { x = 2324.1, y = 257.7, z = -1463.1 }, rot = { x = 0.0, y = 184.1, z = 0.0 }, level = 1, point_type = 2004 },
	{ config_id = 4200, gadget_id = 70500000, pos = { x = 2409.7, y = 295.4, z = -1626.3 }, rot = { x = 0.0, y = 184.1, z = 0.0 }, level = 1, point_type = 2004 },
	{ config_id = 4201, gadget_id = 70500000, pos = { x = 2404.3, y = 286.7, z = -1580.9 }, rot = { x = 0.0, y = 184.1, z = 0.0 }, level = 1, point_type = 2004 },
	{ config_id = 4202, gadget_id = 70310001, pos = { x = 2424.8, y = 292.0, z = -1597.0 }, rot = { x = 0.0, y = 204.3, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 4203, gadget_id = 70310001, pos = { x = 2375.2, y = 279.3, z = -1534.1 }, rot = { x = 0.0, y = 204.3, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 91, shape = RegionShape.SPHERE, radius = 8.6, pos = { x = 2524.1, y = 345.0, z = -1694.9 } },
	{ config_id = 98, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2291.7, y = 247.8, z = -1467.0 } },
	{ config_id = 115, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2320.8, y = 270.4, z = -1511.6 } },
	{ config_id = 116, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2291.2, y = 247.9, z = -1467.5 } },
	{ config_id = 306, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2579.1, y = 358.9, z = -1685.8 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_91", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_91", action = "action_EVENT_GADGET_STATE_CHANGE_91", trigger_count = 0, tlog_tag = "神殿_飞行挑战_顶峰_开始" },
	{ name = "ENTER_REGION_98", event = EventType.EVENT_ENTER_REGION, source = "1", condition = "condition_EVENT_ENTER_REGION_98", action = "action_EVENT_ENTER_REGION_98", trigger_count = 0, tag = "6" },
	{ name = "CHALLENGE_FAIL_115", event = EventType.EVENT_CHALLENGE_FAIL, source = "113", condition = "condition_EVENT_CHALLENGE_FAIL_115", action = "action_EVENT_CHALLENGE_FAIL_115", trigger_count = 0 },
	{ name = "CHALLENGE_SUCCESS_116", event = EventType.EVENT_CHALLENGE_SUCCESS, source = "113", condition = "condition_EVENT_CHALLENGE_SUCCESS_116", action = "action_EVENT_CHALLENGE_SUCCESS_116", tlog_tag = "神殿_飞行挑战_顶峰_成功" },
	{ name = "CLIENT_EXECUTE_306", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_306", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "challenge", value = 1, persistent = false }
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
		gadgets = { 2614, 4197, 4198, 4199, 4200, 4201 },
		regions = { 91, 98, 115, 116, 306 },
		triggers = { "GADGET_STATE_CHANGE_91", "ENTER_REGION_98", "CHALLENGE_FAIL_115", "CHALLENGE_SUCCESS_116", "CLIENT_EXECUTE_306" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { 2614, 4197, 4198, 4199 },
		regions = { 98, 115, 116 },
		triggers = { "ENTER_REGION_98", "CHALLENGE_FAIL_115", "CHALLENGE_SUCCESS_116" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { },
		gadgets = { 4197, 4198, 4199 },
		regions = { 115, 116 },
		triggers = { "CHALLENGE_FAIL_115", "CHALLENGE_SUCCESS_116" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_91(context, evt)
	if 2614 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	-- 判断变量"challenge"为1
	if ScriptLib.GetGroupVariableValue(context, "challenge") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_91(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003372, suite = 2 }) then
			return -1
		end
	
	-- 触发镜头注目，注目位置为坐标（2514，346，-1684），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=2514, y=346, z=-1684}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	-- 变量"challenge"赋值为0
	ScriptLib.SetGroupVariableValue(context, "challenge", 0)
	
	-- 创建编号为113（该挑战的识别id),挑战内容为127的区域挑战，具体参数填写方式，见DungeonChallengeData表中的注释，所有填写的值都必须是int类型
	if 0 ~= ScriptLib.ActiveChallenge(context, 113, 127, 60, 4, 6, 1) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_98(context, evt)
	if evt.param1 ~= 98 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"challenge"为0
	if ScriptLib.GetGroupVariableValue(context, "challenge") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_98(context, evt)
	-- 变量"challenge"赋值为0
	ScriptLib.SetGroupVariableValue(context, "challenge", 0)
	
	return 0
end

-- 触发条件
function condition_EVENT_CHALLENGE_FAIL_115(context, evt)
	-- 判断变量"challenge"为0
	if ScriptLib.GetGroupVariableValue(context, "challenge") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_CHALLENGE_FAIL_115(context, evt)
	-- 将本组内变量名为 "challenge" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "challenge", 1) then
	  return -1
	end
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003372, suite = 1 }) then
			return -1
		end
	
	-- 将configid为 2614 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2614, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_CHALLENGE_SUCCESS_116(context, evt)
	-- 判断变量"challenge"为0
	if ScriptLib.GetGroupVariableValue(context, "challenge") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_CHALLENGE_SUCCESS_116(context, evt)
	-- 创建id为2558的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2558 }) then
	  return -1
	end
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003372, suite = 3 }) then
			return -1
		end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_306(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
