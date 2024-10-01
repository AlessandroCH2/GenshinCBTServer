--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 721, monster_id = 20010301, pos = { x = 2135.9, y = 222.0, z = -1190.7 }, rot = { x = 0.0, y = 291.9, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 722, monster_id = 20010301, pos = { x = 2133.5, y = 222.3, z = -1191.5 }, rot = { x = 0.0, y = 37.7, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 723, monster_id = 20010301, pos = { x = 2135.1, y = 222.1, z = -1188.4 }, rot = { x = 0.0, y = 176.1, z = 0.0 }, level = 6, drop_id = 303042 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2857, gadget_id = 70210021, pos = { x = 2133.6, y = 222.2, z = -1185.9 }, rot = { x = 0.0, y = 140.8, z = 0.0 }, level = 1, chest_drop_id = 403321, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 151, shape = RegionShape.SPHERE, radius = 7.6, pos = { x = 2137.2, y = 222.1, z = -1190.1 } },
	{ config_id = 152, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2143.6, y = 222.2, z = -1183.9 } },
	{ config_id = 336, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2137.3, y = 222.1, z = -1190.8 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_151", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_151", action = "action_EVENT_ENTER_REGION_151" },
	{ name = "ANY_MONSTER_DIE_152", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_152", action = "action_EVENT_ANY_MONSTER_DIE_152" },
	{ name = "CLIENT_EXECUTE_336", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_336", trigger_count = 0 }
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
		gadgets = { },
		regions = { 151, 152, 336 },
		triggers = { "ENTER_REGION_151", "ANY_MONSTER_DIE_152", "CLIENT_EXECUTE_336" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { 2857 },
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
function condition_EVENT_ENTER_REGION_151(context, evt)
	if evt.param1 ~= 151 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_151(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 721, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 722, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 723, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_152(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_152(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003184, suite = 2 }) then
			return -1
		end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_336(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
