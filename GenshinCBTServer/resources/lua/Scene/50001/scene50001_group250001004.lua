--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 12, monster_id = 21010901, pos = { x = 201.7, y = 42.0, z = 132.4 }, rot = { x = 0.0, y = 254.2, z = 0.0 }, level = 0 },
	{ config_id = 13, monster_id = 21010901, pos = { x = 201.4, y = 42.0, z = 109.0 }, rot = { x = 0.0, y = 331.4, z = 0.0 }, level = 0 },
	{ config_id = 14, monster_id = 20011101, pos = { x = 194.6, y = 42.0, z = 120.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 15, monster_id = 21030301, pos = { x = 179.3, y = 42.0, z = 109.9 }, rot = { x = 0.0, y = 33.1, z = 0.0 }, level = 0 },
	{ config_id = 16, monster_id = 21010301, pos = { x = 197.3, y = 42.0, z = 129.9 }, rot = { x = 0.0, y = 238.2, z = 0.0 }, level = 0 },
	{ config_id = 17, monster_id = 22010201, pos = { x = 199.0, y = 42.0, z = 112.4 }, rot = { x = 0.0, y = 328.9, z = 0.0 }, level = 0 },
	{ config_id = 18, monster_id = 22010301, pos = { x = 198.7, y = 42.0, z = 130.8 }, rot = { x = 0.0, y = 228.1, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 24, gadget_id = 70350002, pos = { x = 190.5, y = 41.9, z = 137.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 69, gadget_id = 70900007, pos = { x = 190.5, y = 41.9, z = 121.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 70, gadget_id = 70210021, pos = { x = 186.5, y = 46.1, z = 168.7 }, rot = { x = 0.0, y = 96.9, z = 0.0 }, level = 1, chest_drop_id = 1300402, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 71, gadget_id = 70210021, pos = { x = 198.6, y = 46.0, z = 160.3 }, rot = { x = 0.0, y = 3.0, z = 0.0 }, level = 1, chest_drop_id = 1300402, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 78, gadget_id = 70210021, pos = { x = 186.5, y = 46.0, z = 176.0 }, rot = { x = 0.0, y = 98.4, z = 0.0 }, level = 1, chest_drop_id = 1300402, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 79, gadget_id = 70210021, pos = { x = 194.6, y = 46.0, z = 176.2 }, rot = { x = 0.0, y = 257.4, z = 0.0 }, level = 1, chest_drop_id = 1300402, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 80, gadget_id = 70210021, pos = { x = 194.5, y = 46.0, z = 168.4 }, rot = { x = 0.0, y = 277.2, z = 0.0 }, level = 1, chest_drop_id = 1300402, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 81, gadget_id = 70210021, pos = { x = 191.1, y = 48.5, z = 232.2 }, rot = { x = 0.0, y = 181.6, z = 0.0 }, level = 1, chest_drop_id = 1300402, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST }
}

-- 区域
regions = {
	{ config_id = 7, shape = RegionShape.SPHERE, radius = 5, pos = { x = 190.9, y = 42.1, z = 121.1 } },
	{ config_id = 8, shape = RegionShape.SPHERE, radius = 5, pos = { x = 191.2, y = 42.1, z = 120.8 } },
	{ config_id = 9, shape = RegionShape.SPHERE, radius = 5, pos = { x = 191.1, y = 42.1, z = 120.4 } },
	{ config_id = 10, shape = RegionShape.SPHERE, radius = 5, pos = { x = 191.9, y = 42.0, z = 118.5 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_7", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_7", action = "action_EVENT_GADGET_CREATE_7" },
	{ name = "GADGET_STATE_CHANGE_8", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_8", action = "action_EVENT_GADGET_STATE_CHANGE_8" },
	{ name = "ANY_MONSTER_DIE_9", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_9", action = "action_EVENT_ANY_MONSTER_DIE_9" },
	{ name = "ANY_MONSTER_DIE_10", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_10", action = "action_EVENT_ANY_MONSTER_DIE_10" }
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
		-- description = suite_1,
		monsters = { },
		gadgets = { 24, 69, 70, 71, 78, 79, 80, 81 },
		regions = { 7, 8, 9, 10 },
		triggers = { "GADGET_CREATE_7", "GADGET_STATE_CHANGE_8", "ANY_MONSTER_DIE_9", "ANY_MONSTER_DIE_10" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_7(context, evt)
	if 69 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_7(context, evt)
	-- 在当前group下创建新的变量，名称为 "MonsterDie12"，初始值为0，整形，如果已经存在，返回-1
	if 0 ~= ScriptLib.CreateGroupVariable(context, "MonsterDie12", 0) then
	  return -1
	end
	
	-- 在当前group下创建新的变量，名称为 "MonsterDie13"，初始值为0，整形，如果已经存在，返回-1
	if 0 ~= ScriptLib.CreateGroupVariable(context, "MonsterDie13", 0) then
	  return -1
	end
	
	-- 在当前group下创建新的变量，名称为 "MonsterDie14"，初始值为0，整形，如果已经存在，返回-1
	if 0 ~= ScriptLib.CreateGroupVariable(context, "MonsterDie14", 0) then
	  return -1
	end
	
	-- 在当前group下创建新的变量，名称为 "MonsterDie15"，初始值为0，整形，如果已经存在，返回-1
	if 0 ~= ScriptLib.CreateGroupVariable(context, "MonsterDie15", 0) then
	  return -1
	end
	
	-- 在当前group下创建新的变量，名称为 "MonsterDie16"，初始值为0，整形，如果已经存在，返回-1
	if 0 ~= ScriptLib.CreateGroupVariable(context, "MonsterDie16", 0) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_8(context, evt)
	if GadgetState.GearStart ~= evt.param1 or 69 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_8(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 12, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 13, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 14, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 15, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 16, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_9(context, evt)
	if evt.type == EventType.EVENT_ANY_MONSTER_DIE and evt.param1 == 12 then
			ScriptLib.ChangeGroupVariableValue(context,"MonsterDie12",1)
	    end
	
	if evt.type == EventType.EVENT_ANY_MONSTER_DIE and evt.param1 == 13 then
			ScriptLib.ChangeGroupVariableValue(context,"MonsterDie13",1)
	    end
	
	if evt.type == EventType.EVENT_ANY_MONSTER_DIE and evt.param1 == 14 then
			ScriptLib.ChangeGroupVariableValue(context,"MonsterDie14",1)
	    end
	
	if evt.type == EventType.EVENT_ANY_MONSTER_DIE and evt.param1 == 15 then
			ScriptLib.ChangeGroupVariableValue(context,"MonsterDie15",1)
	    end
	
	if evt.type == EventType.EVENT_ANY_MONSTER_DIE and evt.param1 == 16 then
	        ScriptLib.ChangeGroupVariableValue(context,"MonsterDie16",1)
	    end
	
	    cur_12 = ScriptLib.GetGroupVariableValue(context,"MonsterDie12")
	    cur_13 = ScriptLib.GetGroupVariableValue(context,"MonsterDie13")
	    cur_14 = ScriptLib.GetGroupVariableValue(context,"MonsterDie14")
	    cur_15 = ScriptLib.GetGroupVariableValue(context,"MonsterDie15")
	    cur_16 = ScriptLib.GetGroupVariableValue(context,"MonsterDie16")
	
	    if cur_12 >= 1 and cur_13 >= 1 and cur_14 >= 1 and cur_15 >= 1 and cur_16 >= 1 then
	    	return true
	    end
	
		
		return false
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_9(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 17, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 18, delay_time = 0 }) then
	  return -1
	end
	
	-- 在当前group下创建新的变量，名称为 "Monster17"，初始值为0，整形，如果已经存在，返回-1
	if 0 ~= ScriptLib.CreateGroupVariable(context, "Monster17", 0) then
	  return -1
	end
	
	-- 在当前group下创建新的变量，名称为 "Monster18"，初始值为0，整形，如果已经存在，返回-1
	if 0 ~= ScriptLib.CreateGroupVariable(context, "Monster18", 0) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_10(context, evt)
	if evt.type == EventType.EVENT_ANY_MONSTER_DIE and evt.param1 == 17 then
			ScriptLib.ChangeGroupVariableValue(context,"Monster17",1)
	    end
	
	if evt.type == EventType.EVENT_ANY_MONSTER_DIE and evt.param1 == 18 then
			ScriptLib.ChangeGroupVariableValue(context,"Monster18",1)
	    end
	
	    cur_17 = ScriptLib.GetGroupVariableValue(context,"Monster17")
	    cur_18 = ScriptLib.GetGroupVariableValue(context,"Monster18")
	
	
	    if cur_17 >= 1 and cur_18 >= 1  then
	    	return true
	    end
	
		
		return false
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_10(context, evt)
	-- 将configid为 24 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 24, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end
