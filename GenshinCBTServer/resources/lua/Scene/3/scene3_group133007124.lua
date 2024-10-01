--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 202, monster_id = 20011201, pos = { x = 2738.1, y = 211.3, z = -88.5 }, rot = { x = 0.0, y = 120.6, z = 0.0 }, level = 17 },
	{ config_id = 203, monster_id = 21030201, pos = { x = 2738.2, y = 212.2, z = -99.7 }, rot = { x = 0.0, y = 40.5, z = 0.0 }, level = 17 },
	{ config_id = 204, monster_id = 20011201, pos = { x = 2749.1, y = 212.6, z = -94.1 }, rot = { x = 0.0, y = 267.2, z = 0.0 }, level = 17 },
	{ config_id = 274, monster_id = 21010501, pos = { x = 2737.7, y = 211.3, z = -89.2 }, rot = { x = 0.0, y = 120.6, z = 0.0 }, level = 17 },
	{ config_id = 275, monster_id = 20010501, pos = { x = 2737.8, y = 212.2, z = -100.4 }, rot = { x = 0.0, y = 40.5, z = 0.0 }, level = 17 },
	{ config_id = 276, monster_id = 20010501, pos = { x = 2748.8, y = 212.6, z = -94.8 }, rot = { x = 0.0, y = 267.2, z = 0.0 }, level = 17 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 138, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2739.7, y = 211.9, z = -94.6 } },
	{ config_id = 141, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2741.0, y = 212.3, z = -98.1 } },
	{ config_id = 142, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2739.8, y = 211.8, z = -93.7 } },
	{ config_id = 143, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2740.0, y = 212.0, z = -95.9 } },
	{ config_id = 201, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2740.9, y = 211.9, z = -93.3 } },
	{ config_id = 202, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2741.1, y = 211.7, z = -91.8 } },
	{ config_id = 203, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2740.7, y = 211.9, z = -93.1 } },
	{ config_id = 204, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2740.9, y = 211.7, z = -92.1 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_138", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_138", action = "action_EVENT_ANY_MONSTER_DIE_138", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_141", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_141", action = "action_EVENT_ANY_MONSTER_LIVE_141", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_142", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_142", action = "action_EVENT_ANY_MONSTER_LIVE_142", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_143", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_143", action = "action_EVENT_ANY_MONSTER_LIVE_143", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_201", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_201", action = "action_EVENT_ANY_MONSTER_LIVE_201", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_202", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_202", action = "action_EVENT_ANY_MONSTER_LIVE_202", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_203", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_203", action = "action_EVENT_ANY_MONSTER_LIVE_203", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_204", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_204", action = "action_EVENT_ANY_MONSTER_DIE_204", trigger_count = 0 }
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
		monsters = { 202, 203, 204 },
		gadgets = { },
		regions = { 138, 141, 142, 143 },
		triggers = { "ANY_MONSTER_DIE_138", "ANY_MONSTER_LIVE_141", "ANY_MONSTER_LIVE_142", "ANY_MONSTER_LIVE_143" },
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
		monsters = { 274, 275, 276 },
		gadgets = { },
		regions = { 201, 202, 203, 204 },
		triggers = { "ANY_MONSTER_LIVE_201", "ANY_MONSTER_LIVE_202", "ANY_MONSTER_LIVE_203", "ANY_MONSTER_DIE_204" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_138(context, evt)
	-- 判断指定group组剩余怪物数量是否是0 
	if ScriptLib.GetGroupMonsterCountByGroupId(context, 133007124) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_138(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007124, suite = 3 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_141(context, evt)
	if 203 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_141(context, evt)
	-- 通知groupid为133007124中,configid为：203的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 203, 133007124) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_142(context, evt)
	if 202 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_142(context, evt)
	-- 通知groupid为133007124中,configid为：202的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 202, 133007124) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_143(context, evt)
	if 204 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_143(context, evt)
	-- 通知groupid为133007124中,configid为：204的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 204, 133007124) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_201(context, evt)
	if 274 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_201(context, evt)
	-- 通知groupid为133007124中,configid为：274的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 274, 133007124) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_202(context, evt)
	if 275 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_202(context, evt)
	-- 通知groupid为133007124中,configid为：275的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 275, 133007124) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_203(context, evt)
	if 276 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_203(context, evt)
	-- 通知groupid为133007124中,configid为：276的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 276, 133007124) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_204(context, evt)
	-- 判断指定group组剩余怪物数量是否是0 
	if ScriptLib.GetGroupMonsterCountByGroupId(context, 133007124) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_204(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007124, suite = 1 }) then
			return -1
		end
	
	return 0
end
