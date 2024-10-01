--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 18, monster_id = 22010101, pos = { x = 12.9, y = 0.0, z = -169.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 19, monster_id = 21010701, pos = { x = 13.0, y = -0.5, z = -185.4 }, rot = { x = 0.0, y = 45.8, z = 0.0 }, level = 0 },
	{ config_id = 20, monster_id = 21010701, pos = { x = -3.2, y = -0.5, z = -169.5 }, rot = { x = 0.0, y = 37.7, z = 0.0 }, level = 0 },
	{ config_id = 21, monster_id = 21010301, pos = { x = 15.9, y = -0.5, z = -172.8 }, rot = { x = 0.0, y = 23.2, z = 0.0 }, level = 0 },
	{ config_id = 22, monster_id = 21010301, pos = { x = 10.9, y = -0.5, z = -166.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 97, monster_id = 22010201, pos = { x = 15.0, y = 0.0, z = -170.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 98, monster_id = 22010301, pos = { x = 10.6, y = -0.5, z = -167.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 99, monster_id = 21010301, pos = { x = 9.5, y = -0.5, z = -164.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 100, monster_id = 21010301, pos = { x = 16.0, y = -0.5, z = -165.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 101, monster_id = 21010301, pos = { x = 18.0, y = -0.5, z = -172.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 102, monster_id = 21010301, pos = { x = 10.1, y = -0.5, z = -174.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 103, monster_id = 20020101, pos = { x = 13.9, y = 0.0, z = -169.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 104, monster_id = 20010301, pos = { x = 12.7, y = -0.5, z = -177.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 105, monster_id = 20010301, pos = { x = 19.2, y = -0.5, z = -177.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 106, monster_id = 20010301, pos = { x = 21.0, y = -0.5, z = -168.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 107, monster_id = 20010301, pos = { x = 10.1, y = -0.5, z = -162.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 108, monster_id = 20010601, pos = { x = 12.9, y = 0.0, z = -169.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 109, monster_id = 20010701, pos = { x = 7.5, y = -0.5, z = -163.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 110, monster_id = 20010501, pos = { x = 18.9, y = -0.5, z = -164.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 111, monster_id = 20010501, pos = { x = 9.1, y = -0.5, z = -162.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 22, gadget_id = 70210032, pos = { x = 9.0, y = -0.5, z = -170.0 }, rot = { x = 0.0, y = 275.8, z = 0.0 }, level = 1, chest_drop_id = 1300102, state = GadgetState.ChestLocked }
}

-- 区域
regions = {
	{ config_id = 22, shape = RegionShape.SPHERE, radius = 5, pos = { x = 6.7, y = -0.5, z = -170.5 } },
	{ config_id = 34, shape = RegionShape.SPHERE, radius = 5, pos = { x = 10.1, y = -0.5, z = -172.5 } },
	{ config_id = 35, shape = RegionShape.SPHERE, radius = 5, pos = { x = 10.8, y = -0.5, z = -173.0 } },
	{ config_id = 36, shape = RegionShape.SPHERE, radius = 5, pos = { x = 11.6, y = 0.0, z = -171.8 } },
	{ config_id = 37, shape = RegionShape.SPHERE, radius = 5, pos = { x = 9.0, y = -0.5, z = -173.1 } },
	{ config_id = 38, shape = RegionShape.SPHERE, radius = 5, pos = { x = 9.9, y = -0.5, z = -175.0 } },
	{ config_id = 39, shape = RegionShape.SPHERE, radius = 5, pos = { x = 7.5, y = -0.5, z = -174.6 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_22", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_22", action = "action_EVENT_ANY_MONSTER_DIE_22" },
	{ name = "ANY_MONSTER_DIE_34", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_34", action = "action_EVENT_ANY_MONSTER_DIE_34" },
	{ name = "ANY_MONSTER_DIE_35", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_35", action = "action_EVENT_ANY_MONSTER_DIE_35" },
	{ name = "ANY_MONSTER_DIE_36", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_36", action = "action_EVENT_ANY_MONSTER_DIE_36" },
	{ name = "ANY_MONSTER_DIE_37", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_37", action = "action_EVENT_ANY_MONSTER_DIE_37" },
	{ name = "ANY_MONSTER_DIE_38", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_38", action = "action_EVENT_ANY_MONSTER_DIE_38" },
	{ name = "ANY_MONSTER_DIE_39", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_39", action = "action_EVENT_ANY_MONSTER_DIE_39" }
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
		monsters = { 18, 19, 20, 21, 22 },
		gadgets = { 22 },
		regions = { 22, 34 },
		triggers = { "ANY_MONSTER_DIE_22", "ANY_MONSTER_DIE_34" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 97, 98, 99, 100, 101, 102 },
		gadgets = { 22 },
		regions = { 22, 35, 36 },
		triggers = { "ANY_MONSTER_DIE_22", "ANY_MONSTER_DIE_35", "ANY_MONSTER_DIE_36" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { 103, 104, 105, 106, 107 },
		gadgets = { 22 },
		regions = { 22, 37 },
		triggers = { "ANY_MONSTER_DIE_22", "ANY_MONSTER_DIE_37" },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_4,
		monsters = { 108, 109, 110, 111 },
		gadgets = { 22 },
		regions = { 22 },
		triggers = { "ANY_MONSTER_DIE_22" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_22(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_22(context, evt)
	-- 解锁目标22
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 22, state = GadgetState.Default }) then
		return -1
	end
	
	-- 调用提示id为 20010301 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 20010301) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_34(context, evt)
	--判断死亡怪物的configid是否为 18
	if evt.param1 ~= 18 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_34(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230001021, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_35(context, evt)
	--判断死亡怪物的configid是否为 97
	if evt.param1 ~= 97 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_35(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230001020, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_36(context, evt)
	--判断死亡怪物的configid是否为 98
	if evt.param1 ~= 98 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_36(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230001022, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_37(context, evt)
	--判断死亡怪物的configid是否为 103
	if evt.param1 ~= 103 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_37(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230001021, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_38(context, evt)
	--判断死亡怪物的configid是否为 108
	if evt.param1 ~= 108 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_38(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230001020, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_39(context, evt)
	--判断死亡怪物的configid是否为 109
	if evt.param1 ~= 109 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_39(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230001022, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end
