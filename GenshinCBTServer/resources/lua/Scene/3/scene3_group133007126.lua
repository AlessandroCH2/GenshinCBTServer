--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 207, monster_id = 22010101, pos = { x = 2562.1, y = 208.4, z = 315.3 }, rot = { x = 0.0, y = 129.2, z = 0.0 }, level = 15 },
	{ config_id = 208, monster_id = 21030201, pos = { x = 2561.9, y = 208.6, z = 305.8 }, rot = { x = 0.0, y = 48.0, z = 0.0 }, level = 14 },
	{ config_id = 268, monster_id = 21030201, pos = { x = 2572.8, y = 207.9, z = 315.7 }, rot = { x = 0.0, y = 278.8, z = 0.0 }, level = 14 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 153, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2563.7, y = 208.3, z = 313.5 } },
	{ config_id = 155, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2566.9, y = 208.1, z = 316.4 } },
	{ config_id = 156, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2565.8, y = 208.2, z = 318.3 } },
	{ config_id = 157, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2562.2, y = 208.3, z = 318.1 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_153", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_153", action = "action_EVENT_ANY_MONSTER_DIE_153", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_155", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_155", action = "action_EVENT_ANY_MONSTER_LIVE_155", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_156", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_156", action = "action_EVENT_ANY_MONSTER_LIVE_156", trigger_count = 0 },
	{ name = "ANY_MONSTER_LIVE_157", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_157", action = "action_EVENT_ANY_MONSTER_LIVE_157", trigger_count = 0 }
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
		monsters = { 207, 208, 268 },
		gadgets = { },
		regions = { 153, 155, 156, 157 },
		triggers = { "ANY_MONSTER_DIE_153", "ANY_MONSTER_LIVE_155", "ANY_MONSTER_LIVE_156", "ANY_MONSTER_LIVE_157" },
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
function condition_EVENT_ANY_MONSTER_DIE_153(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_153(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007126, suite = 2 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_155(context, evt)
	if 208 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_155(context, evt)
	-- 通知groupid为133007126中,configid为：208的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 208, 133007126) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_156(context, evt)
	if 268 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_156(context, evt)
	-- 通知groupid为133007126中,configid为：268的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 268, 133007126) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_157(context, evt)
	if 207 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_157(context, evt)
	-- 通知groupid为133007126中,configid为：207的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 207, 133007126) then
	  return -1
	end
	
	return 0
end
