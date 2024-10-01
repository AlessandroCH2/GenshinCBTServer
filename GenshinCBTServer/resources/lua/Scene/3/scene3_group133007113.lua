--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 182, monster_id = 21030101, pos = { x = 2853.1, y = 213.7, z = 295.4 }, rot = { x = 0.0, y = 143.2, z = 0.0 }, level = 17 },
	{ config_id = 183, monster_id = 20010801, pos = { x = 2854.4, y = 213.7, z = 283.8 }, rot = { x = 0.0, y = 43.5, z = 0.0 }, level = 17 },
	{ config_id = 184, monster_id = 20010801, pos = { x = 2866.3, y = 213.6, z = 290.6 }, rot = { x = 0.0, y = 275.1, z = 0.0 }, level = 17 },
	{ config_id = 282, monster_id = 21030101, pos = { x = 2853.4, y = 213.7, z = 295.1 }, rot = { x = 0.0, y = 143.2, z = 0.0 }, level = 17 },
	{ config_id = 283, monster_id = 21010301, pos = { x = 2854.6, y = 213.7, z = 283.5 }, rot = { x = 0.0, y = 43.5, z = 0.0 }, level = 17 },
	{ config_id = 284, monster_id = 21010301, pos = { x = 2866.6, y = 213.6, z = 290.2 }, rot = { x = 0.0, y = 275.1, z = 0.0 }, level = 17 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 146, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2856.3, y = 213.6, z = 292.5 } },
	{ config_id = 149, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2854.2, y = 213.6, z = 296.1 } },
	{ config_id = 150, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2856.0, y = 213.6, z = 295.3 } },
	{ config_id = 151, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2856.6, y = 213.6, z = 292.1 } },
	{ config_id = 216, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2855.8, y = 213.7, z = 289.7 } },
	{ config_id = 217, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2858.2, y = 213.7, z = 290.1 } },
	{ config_id = 218, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2857.0, y = 213.7, z = 289.7 } },
	{ config_id = 219, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2858.6, y = 213.7, z = 290.3 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_146", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_146", action = "action_EVENT_ANY_MONSTER_DIE_146", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_149", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_149", action = "action_EVENT_ANY_MONSTER_LIVE_149", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_150", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_150", action = "action_EVENT_ANY_MONSTER_LIVE_150", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_151", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_151", action = "action_EVENT_ANY_MONSTER_LIVE_151", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_216", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_216", action = "action_EVENT_ANY_MONSTER_DIE_216", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_217", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_217", action = "action_EVENT_ANY_MONSTER_LIVE_217", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_218", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_218", action = "action_EVENT_ANY_MONSTER_LIVE_218", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_219", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_219", action = "action_EVENT_ANY_MONSTER_LIVE_219", trigger_count = 0 }
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
		monsters = { 182, 183, 184 },
		gadgets = { },
		regions = { 146, 149, 150, 151 },
		triggers = { "ANY_MONSTER_DIE_146", "ANY_MONSTER_LIVE_149", "ANY_MONSTER_LIVE_150", "ANY_MONSTER_LIVE_151" },
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
		monsters = { 282, 283, 284 },
		gadgets = { },
		regions = { 216, 217, 218, 219 },
		triggers = { "ANY_MONSTER_DIE_216", "ANY_MONSTER_LIVE_217", "ANY_MONSTER_LIVE_218", "ANY_MONSTER_LIVE_219" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_146(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_146(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007113, suite = 3 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_149(context, evt)
	if 182 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_149(context, evt)
	-- 通知groupid为133007113中,configid为：182的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 182, 133007113) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_150(context, evt)
	if 183 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_150(context, evt)
	-- 通知groupid为133007113中,configid为：183的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 183, 133007113) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_151(context, evt)
	if 184 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_151(context, evt)
	-- 通知groupid为133007113中,configid为：184的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 184, 133007113) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_216(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_216(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007113, suite = 1 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_217(context, evt)
	if 282 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_217(context, evt)
	-- 通知groupid为133007113中,configid为：282的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 282, 133007113) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_218(context, evt)
	if 283 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_218(context, evt)
	-- 通知groupid为133007113中,configid为：283的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 283, 133007113) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_219(context, evt)
	if 284 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_219(context, evt)
	-- 通知groupid为133007113中,configid为：284的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 284, 133007113) then
	  return -1
	end
	
	return 0
end
