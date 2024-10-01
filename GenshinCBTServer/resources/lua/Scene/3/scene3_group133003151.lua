--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 620, monster_id = 23040101, pos = { x = 2348.8, y = 283.9, z = -1730.7 }, rot = { x = 0.0, y = 10.0, z = 0.0 }, level = 15, drop_id = 303123, pose_id = 100 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2616, gadget_id = 70210041, pos = { x = 2357.8, y = 283.9, z = -1739.3 }, rot = { x = 0.0, y = 247.1, z = 0.0 }, level = 1, chest_drop_id = 403143, showcutscene = true, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 123, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2342.9, y = 283.9, z = -1738.2 } },
	{ config_id = 124, shape = RegionShape.SPHERE, radius = 5.3, pos = { x = 2336.8, y = 283.9, z = -1711.0 } },
	{ config_id = 127, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2349.8, y = 283.9, z = -1739.6 } },
	{ config_id = 326, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2338.7, y = 283.9, z = -1734.3 } },
	{ config_id = 464, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2333.7, y = 283.9, z = -1711.8 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_123", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_123", action = "action_EVENT_ANY_MONSTER_DIE_123" },
	{ name = "QUEST_FINISH_124", event = EventType.EVENT_QUEST_FINISH, source = "38001", condition = "condition_EVENT_QUEST_FINISH_124", action = "action_EVENT_QUEST_FINISH_124" },
	{ name = "ANY_MONSTER_DIE_127", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_127", action = "action_EVENT_ANY_MONSTER_DIE_127" },
	{ name = "CLIENT_EXECUTE_326", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_326", trigger_count = 0 },
	{ name = "QUEST_FINISH_464", event = EventType.EVENT_QUEST_FINISH, source = "38003", condition = "condition_EVENT_QUEST_FINISH_464", action = "action_EVENT_QUEST_FINISH_464" }
}

-- 变量
variables = {
	{ name = "isoff", value = 0, persistent = true },
	{ name = "isquest", value = 0, persistent = true }
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
		monsters = { 620 },
		gadgets = { },
		regions = { 124, 127, 326, 464 },
		triggers = { "QUEST_FINISH_124", "ANY_MONSTER_DIE_127", "CLIENT_EXECUTE_326", "QUEST_FINISH_464" },
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
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_4,
		monsters = { },
		gadgets = { 2616 },
		regions = { 124 },
		triggers = { "QUEST_FINISH_124" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_123(context, evt)
	--判断死亡怪物的configid是否为 620
	if evt.param1 ~= 620 then
	    return false
	 end
	  
	
	-- 判断变量"isquest"为1
	if ScriptLib.GetGroupVariableValue(context, "isquest") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_123(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003151, suite = 3 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_QUEST_FINISH_124(context, evt)
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
function action_EVENT_QUEST_FINISH_124(context, evt)
	-- 将本组内变量名为 "isoff" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "isoff", 1) then
	  return -1
	end
	
	-- 将本组内变量名为 "isquest" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "isquest", 1) then
	  return -1
	end
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003151, suite = 1 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_127(context, evt)
	-- 判断变量"isquest"为0
	if ScriptLib.GetGroupVariableValue(context, "isquest") ~= 0 then
			return false
	end
	
	--判断死亡怪物的configid是否为 620
	if evt.param1 ~= 620 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_127(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003151, suite = 4 }) then
			return -1
		end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_326(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件
function condition_EVENT_QUEST_FINISH_464(context, evt)
	--检查ID为38003的任务的完成状态是否为1（1=完成，0=失败）
	--此事件需要配合Quest表使用，在Quest表里的完成执行中配置“通知group脚本”，则该任务完成后服务端会向对应的group发送通知，参数1填写场景ID，参数2填写group ID（如果不填则会通知所有group）
	
	--检查任务ID
	if 38003 ~= evt.param1 then
		return false
	end
	
	--检查任务成功状态
	if 1 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_QUEST_FINISH_464(context, evt)
	-- 将本组内变量名为 "isquest" 的变量设置为 0
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "isquest", 0) then
	  return -1
	end
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003424, suite = 2 }) then
			return -1
		end
	
	return 0
end
