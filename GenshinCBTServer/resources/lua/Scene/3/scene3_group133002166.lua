--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 684, monster_id = 22010201, pos = { x = 2003.7, y = 255.7, z = -299.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 15, drop_id = 303103 },
	{ config_id = 685, monster_id = 20010901, pos = { x = 2003.7, y = 255.7, z = -297.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 15, drop_id = 303103 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1450, gadget_id = 70210032, pos = { x = 2003.9, y = 255.1, z = -294.9 }, rot = { x = 0.0, y = 178.3, z = 0.0 }, level = 1, chest_drop_id = 403343, state = GadgetState.ChestLocked, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 174, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2003.8, y = 255.7, z = -295.4 } },
	{ config_id = 175, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2003.7, y = 255.7, z = -295.6 } },
	{ config_id = 268, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2003.8, y = 255.7, z = -295.5 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_174", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_174", action = "action_EVENT_ANY_MONSTER_DIE_174", tlog_tag = "奔狼岭_166_怪物营地_结算" },
	{ name = "SPECIFIC_MONSTER_HP_CHANGE_175", event = EventType.EVENT_SPECIFIC_MONSTER_HP_CHANGE, source = "684", condition = "condition_EVENT_SPECIFIC_MONSTER_HP_CHANGE_175", action = "action_EVENT_SPECIFIC_MONSTER_HP_CHANGE_175" },
	{ name = "CLIENT_EXECUTE_268", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_268", trigger_count = 0 }
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
function condition_EVENT_ANY_MONSTER_DIE_174(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_174(context, evt)
	-- 解锁目标1450
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 1450, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SPECIFIC_MONSTER_HP_CHANGE_175(context, evt)
	--[[判断指定configid的怪物的血量小于%50时触发指定后续操作]]--
	if evt.type ~= EventType.EVENT_SPECIFIC_MONSTER_HP_CHANGE or evt.param3 > 50 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_SPECIFIC_MONSTER_HP_CHANGE_175(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 685, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_268(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
