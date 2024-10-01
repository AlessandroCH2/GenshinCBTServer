--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 41, monster_id = 21020201, pos = { x = -21.1, y = -0.5, z = -270.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 42, monster_id = 20011201, pos = { x = -3.9, y = -0.5, z = -254.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 43, monster_id = 20011201, pos = { x = -4.7, y = -0.5, z = -247.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 44, monster_id = 20011201, pos = { x = -37.8, y = -0.5, z = -254.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 45, monster_id = 20011201, pos = { x = -35.5, y = -0.5, z = -248.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 46, monster_id = 21010201, pos = { x = -14.7, y = -0.5, z = -266.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 47, monster_id = 21010201, pos = { x = -27.9, y = -0.5, z = -267.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 48, monster_id = 21010601, pos = { x = -9.3, y = -0.5, z = -266.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 129, monster_id = 22010201, pos = { x = -20.6, y = -0.5, z = -268.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 130, monster_id = 21020101, pos = { x = -17.7, y = -0.5, z = -264.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 131, monster_id = 21010201, pos = { x = -22.7, y = -0.5, z = -261.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 132, monster_id = 21010201, pos = { x = -17.0, y = -0.5, z = -261.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 133, monster_id = 21020201, pos = { x = -20.8, y = -0.5, z = -264.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 134, monster_id = 21010701, pos = { x = -24.7, y = -0.5, z = -266.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 135, monster_id = 21010701, pos = { x = -19.1, y = -0.5, z = -266.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 136, monster_id = 21010701, pos = { x = -12.9, y = -0.5, z = -267.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 137, monster_id = 21010201, pos = { x = -15.8, y = -0.5, z = -259.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 138, monster_id = 21010201, pos = { x = -24.2, y = -0.5, z = -259.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 139, monster_id = 22010201, pos = { x = -20.4, y = -0.5, z = -268.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 140, monster_id = 21020201, pos = { x = -19.9, y = -0.5, z = -264.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 141, monster_id = 21010301, pos = { x = -24.4, y = -0.5, z = -259.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 142, monster_id = 21010301, pos = { x = -15.9, y = -0.5, z = -260.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 143, monster_id = 21010501, pos = { x = -30.4, y = -0.5, z = -266.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 144, monster_id = 21010501, pos = { x = -11.1, y = -0.5, z = -267.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 67, gadget_id = 70210032, pos = { x = -20.1, y = -0.5, z = -273.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1300102, state = GadgetState.ChestLocked },
	{ config_id = 68, gadget_id = 70210012, pos = { x = -13.8, y = -0.5, z = -273.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1300101, state = GadgetState.ChestLocked },
	{ config_id = 69, gadget_id = 70210012, pos = { x = -25.7, y = -0.5, z = -273.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1300101, state = GadgetState.ChestLocked }
}

-- 区域
regions = {
	{ config_id = 24, shape = RegionShape.SPHERE, radius = 5, pos = { x = -25.5, y = -0.5, z = -274.7 } },
	{ config_id = 44, shape = RegionShape.SPHERE, radius = 5, pos = { x = -21.1, y = -0.5, z = -264.0 } },
	{ config_id = 45, shape = RegionShape.SPHERE, radius = 5, pos = { x = -22.0, y = -0.5, z = -265.2 } },
	{ config_id = 46, shape = RegionShape.SPHERE, radius = 5, pos = { x = -23.7, y = -0.5, z = -265.5 } },
	{ config_id = 47, shape = RegionShape.SPHERE, radius = 5, pos = { x = -24.1, y = -0.5, z = -266.3 } },
	{ config_id = 48, shape = RegionShape.SPHERE, radius = 5, pos = { x = -24.0, y = -0.5, z = -267.1 } },
	{ config_id = 49, shape = RegionShape.SPHERE, radius = 5, pos = { x = -24.7, y = -0.5, z = -263.8 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_24", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_24", action = "action_EVENT_ANY_MONSTER_DIE_24" },
	{ name = "ANY_MONSTER_DIE_44", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_44", action = "action_EVENT_ANY_MONSTER_DIE_44" },
	{ name = "ANY_MONSTER_DIE_45", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_45", action = "action_EVENT_ANY_MONSTER_DIE_45" },
	{ name = "ANY_MONSTER_DIE_46", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_46", action = "action_EVENT_ANY_MONSTER_DIE_46" },
	{ name = "ANY_MONSTER_DIE_47", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_47", action = "action_EVENT_ANY_MONSTER_DIE_47" },
	{ name = "ANY_MONSTER_DIE_48", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_48", action = "action_EVENT_ANY_MONSTER_DIE_48" },
	{ name = "ANY_MONSTER_DIE_49", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_49", action = "action_EVENT_ANY_MONSTER_DIE_49" }
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
		monsters = { 41, 42, 43, 44, 45, 46, 47, 48 },
		gadgets = { 67, 68, 69 },
		regions = { 24, 44 },
		triggers = { "ANY_MONSTER_DIE_24", "ANY_MONSTER_DIE_44" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 129, 130, 131, 132 },
		gadgets = { 67, 68, 69 },
		regions = { 24, 45, 46 },
		triggers = { "ANY_MONSTER_DIE_24", "ANY_MONSTER_DIE_45", "ANY_MONSTER_DIE_46" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { 133, 134, 135, 136, 137, 138 },
		gadgets = { 67, 68, 69 },
		regions = { 24, 47 },
		triggers = { "ANY_MONSTER_DIE_24", "ANY_MONSTER_DIE_47" },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_4,
		monsters = { 139, 140, 141, 142, 143, 144 },
		gadgets = { 67, 68, 69 },
		regions = { 24, 48, 49 },
		triggers = { "ANY_MONSTER_DIE_24", "ANY_MONSTER_DIE_48", "ANY_MONSTER_DIE_49" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_24(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_24(context, evt)
	-- 调用提示id为 20010301 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 20010301) then
		return -1
	end
	
	-- 解锁目标67
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 67, state = GadgetState.Default }) then
		return -1
	end
	
	-- 解锁目标68
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 68, state = GadgetState.Default }) then
		return -1
	end
	
	-- 解锁目标69
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 69, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_44(context, evt)
	--判断死亡怪物的configid是否为 41
	if evt.param1 ~= 41 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_44(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230001021, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_45(context, evt)
	--判断死亡怪物的configid是否为 129
	if evt.param1 ~= 129 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_45(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230001020, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_46(context, evt)
	--判断死亡怪物的configid是否为 130
	if evt.param1 ~= 130 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_46(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230001022, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_47(context, evt)
	--判断死亡怪物的configid是否为 133
	if evt.param1 ~= 133 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_47(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230001021, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_48(context, evt)
	--判断死亡怪物的configid是否为 139
	if evt.param1 ~= 139 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_48(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230001020, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_49(context, evt)
	--判断死亡怪物的configid是否为 140
	if evt.param1 ~= 140 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_49(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230001022, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	return 0
end
