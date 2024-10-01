--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 23, monster_id = 22010201, pos = { x = 66.8, y = -1.1, z = -218.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 24, monster_id = 20011001, pos = { x = 77.2, y = -1.1, z = -227.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 25, monster_id = 20011001, pos = { x = 79.3, y = -1.1, z = -211.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 26, monster_id = 20011001, pos = { x = 56.7, y = -1.0, z = -211.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 27, monster_id = 20011001, pos = { x = 53.0, y = -1.0, z = -226.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 112, monster_id = 22010301, pos = { x = 67.6, y = -1.0, z = -222.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 113, monster_id = 20010801, pos = { x = 61.8, y = -1.0, z = -217.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 114, monster_id = 20010801, pos = { x = 60.5, y = -1.0, z = -213.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 115, monster_id = 20010801, pos = { x = 66.3, y = -1.0, z = -212.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 116, monster_id = 20010801, pos = { x = 72.7, y = -1.0, z = -216.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 117, monster_id = 20010801, pos = { x = 70.1, y = -1.1, z = -213.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 118, monster_id = 21020201, pos = { x = 66.7, y = -1.1, z = -220.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 119, monster_id = 21010301, pos = { x = 63.2, y = -1.0, z = -216.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 120, monster_id = 21010301, pos = { x = 70.4, y = -1.0, z = -218.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 121, monster_id = 21010301, pos = { x = 70.6, y = -1.1, z = -215.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 122, monster_id = 21010301, pos = { x = 62.4, y = -1.0, z = -214.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 123, monster_id = 21020101, pos = { x = 66.8, y = -1.1, z = -218.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 124, monster_id = 20011001, pos = { x = 63.1, y = -1.0, z = -216.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 125, monster_id = 20011001, pos = { x = 70.0, y = -1.1, z = -213.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 126, monster_id = 20011001, pos = { x = 61.2, y = -1.0, z = -212.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 127, monster_id = 20011001, pos = { x = 63.7, y = -1.0, z = -212.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 128, monster_id = 21010601, pos = { x = 71.4, y = -1.0, z = -222.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 28, gadget_id = 70210022, pos = { x = 55.8, y = -1.1, z = -179.6 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 1, chest_drop_id = 1300101, state = GadgetState.ChestLocked },
	{ config_id = 29, gadget_id = 70210032, pos = { x = 65.7, y = -1.1, z = -224.8 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 1, chest_drop_id = 1300102, state = GadgetState.ChestLocked },
	{ config_id = 30, gadget_id = 70210041, pos = { x = 61.7, y = -1.0, z = -224.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1300101 },
	{ config_id = 31, gadget_id = 70210041, pos = { x = 70.3, y = -1.1, z = -224.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1300101 }
}

-- 区域
regions = {
	{ config_id = 23, shape = RegionShape.SPHERE, radius = 5, pos = { x = 65.1, y = -1.1, z = -224.8 } },
	{ config_id = 40, shape = RegionShape.SPHERE, radius = 5, pos = { x = 67.5, y = -1.2, z = -219.7 } },
	{ config_id = 41, shape = RegionShape.SPHERE, radius = 5, pos = { x = 62.7, y = -1.0, z = -217.6 } },
	{ config_id = 42, shape = RegionShape.SPHERE, radius = 5, pos = { x = 64.3, y = -1.0, z = -217.9 } },
	{ config_id = 43, shape = RegionShape.SPHERE, radius = 5, pos = { x = 64.8, y = -1.1, z = -218.4 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_23", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_23", action = "action_EVENT_ANY_MONSTER_DIE_23" },
	{ name = "ANY_MONSTER_DIE_40", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_40", action = "action_EVENT_ANY_MONSTER_DIE_40" },
	{ name = "ANY_MONSTER_DIE_41", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_41", action = "action_EVENT_ANY_MONSTER_DIE_41" },
	{ name = "ANY_MONSTER_DIE_42", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_42", action = "action_EVENT_ANY_MONSTER_DIE_42" },
	{ name = "ANY_MONSTER_DIE_43", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_43", action = "action_EVENT_ANY_MONSTER_DIE_43" }
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
		monsters = { 23, 24, 25, 26, 27 },
		gadgets = { 28, 29, 30, 31 },
		regions = { 23, 40 },
		triggers = { "ANY_MONSTER_DIE_23", "ANY_MONSTER_DIE_40" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 112, 113, 114, 115, 116, 117 },
		gadgets = { 28, 29, 30, 31 },
		regions = { 23, 41 },
		triggers = { "ANY_MONSTER_DIE_23", "ANY_MONSTER_DIE_41" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { 118, 119, 120, 121, 122 },
		gadgets = { 28, 29, 30, 31 },
		regions = { 23, 42 },
		triggers = { "ANY_MONSTER_DIE_23", "ANY_MONSTER_DIE_42" },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_4,
		monsters = { 123, 124, 125, 126, 127, 128 },
		gadgets = { 28, 29, 30, 31 },
		regions = { 23, 43 },
		triggers = { "ANY_MONSTER_DIE_23", "ANY_MONSTER_DIE_43" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_23(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_23(context, evt)
	-- 解锁目标28
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 28, state = GadgetState.Default }) then
		return -1
	end
	
	-- 解锁目标29
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 29, state = GadgetState.Default }) then
		return -1
	end
	
	-- 调用提示id为 20010301 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 20010301) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_40(context, evt)
	--判断死亡怪物的configid是否为 23
	if evt.param1 ~= 23 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_40(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230001021, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_41(context, evt)
	--判断死亡怪物的configid是否为 112
	if evt.param1 ~= 112 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_41(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230001021, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_42(context, evt)
	--判断死亡怪物的configid是否为 118
	if evt.param1 ~= 118 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_42(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230001021, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_43(context, evt)
	--判断死亡怪物的configid是否为 123
	if evt.param1 ~= 123 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_43(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230001021, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end
