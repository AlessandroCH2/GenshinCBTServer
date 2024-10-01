--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 3, monster_id = 21010901, pos = { x = 32.0, y = 45.8, z = 91.1 }, rot = { x = 0.0, y = 275.4, z = 0.0 }, level = 0, disableWander = true, pose_id = 32 },
	{ config_id = 4, monster_id = 21011001, pos = { x = 31.5, y = 45.9, z = 87.0 }, rot = { x = 0.0, y = 286.4, z = 0.0 }, level = 0, disableWander = true, pose_id = 32 },
	{ config_id = 5, monster_id = 21030101, pos = { x = 0.5, y = 42.3, z = 109.2 }, rot = { x = 0.0, y = 190.8, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 6, monster_id = 21020201, pos = { x = -7.0, y = 42.1, z = 96.3 }, rot = { x = 0.0, y = 104.3, z = 0.0 }, level = 0, disableWander = true, affix = { 1001 }, isElite = true, pose_id = 401 },
	{ config_id = 7, monster_id = 21020101, pos = { x = 7.9, y = 42.0, z = 96.2 }, rot = { x = 0.0, y = 269.1, z = 0.0 }, level = 0, disableWander = true, affix = { 1002 }, isElite = true, pose_id = 401 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2, gadget_id = 70900025, pos = { x = 32.5, y = 41.9, z = 91.1 }, rot = { x = 0.0, y = 265.4, z = 0.0 }, level = 1 },
	{ config_id = 3, gadget_id = 70900025, pos = { x = 32.0, y = 41.9, z = 86.9 }, rot = { x = 0.0, y = 81.4, z = 0.0 }, level = 1 },
	{ config_id = 4, gadget_id = 70210021, pos = { x = -2.6, y = 42.0, z = 122.7 }, rot = { x = 0.0, y = 345.8, z = 0.0 }, level = 1, chest_drop_id = 1300402, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 5, gadget_id = 70220007, pos = { x = -6.9, y = 41.9, z = 118.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 6, gadget_id = 70220007, pos = { x = -2.1, y = 42.0, z = 118.3 }, rot = { x = 0.0, y = 2.3, z = 0.0 }, level = 1 },
	{ config_id = 7, gadget_id = 70350003, pos = { x = 55.1, y = 41.9, z = 121.2 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1 },
	{ config_id = 8, gadget_id = 70900007, pos = { x = 46.5, y = 42.2, z = 128.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, state = GadgetState.GearStop },
	{ config_id = 9, gadget_id = 70900008, pos = { x = 46.7, y = 42.2, z = 114.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, state = GadgetState.GearStop },
	{ config_id = 10, gadget_id = 70210031, pos = { x = 47.4, y = 42.0, z = 87.7 }, rot = { x = 0.0, y = 275.2, z = 0.0 }, level = 1, chest_drop_id = 1300404, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 28, gadget_id = 70220013, pos = { x = -18.0, y = 42.0, z = 95.1 }, rot = { x = 0.0, y = 157.8, z = 0.0 }, level = 1 },
	{ config_id = 29, gadget_id = 70220013, pos = { x = -18.1, y = 42.0, z = 97.3 }, rot = { x = 0.0, y = 158.0, z = 0.0 }, level = 1 },
	{ config_id = 55, gadget_id = 70220005, pos = { x = 46.2, y = 42.0, z = 89.2 }, rot = { x = 0.0, y = 245.0, z = 0.0 }, level = 1 },
	{ config_id = 56, gadget_id = 70220005, pos = { x = 45.8, y = 42.0, z = 86.6 }, rot = { x = 0.0, y = 30.0, z = 0.0 }, level = 1 },
	{ config_id = 57, gadget_id = 70220005, pos = { x = 44.5, y = 42.0, z = 88.0 }, rot = { x = 0.0, y = 128.0, z = 0.0 }, level = 1 },
	{ config_id = 58, gadget_id = 70220005, pos = { x = 48.2, y = 42.0, z = 88.9 }, rot = { x = 0.0, y = 24.8, z = 0.0 }, level = 1 },
	{ config_id = 59, gadget_id = 70220014, pos = { x = 44.9, y = 42.0, z = 89.1 }, rot = { x = 0.0, y = 84.1, z = 0.0 }, level = 1 },
	{ config_id = 60, gadget_id = 70220014, pos = { x = 45.8, y = 42.0, z = 87.9 }, rot = { x = 0.0, y = 80.9, z = 0.0 }, level = 1 },
	{ config_id = 61, gadget_id = 70220014, pos = { x = 44.6, y = 42.0, z = 86.9 }, rot = { x = 0.0, y = 333.0, z = 0.0 }, level = 1 },
	{ config_id = 62, gadget_id = 70220014, pos = { x = 47.3, y = 42.0, z = 86.3 }, rot = { x = 0.0, y = 216.4, z = 0.0 }, level = 1 },
	{ config_id = 63, gadget_id = 70220002, pos = { x = 49.3, y = 42.0, z = 96.1 }, rot = { x = 0.0, y = 290.5, z = 0.0 }, level = 1 },
	{ config_id = 64, gadget_id = 70220002, pos = { x = 48.8, y = 42.0, z = 94.8 }, rot = { x = 0.0, y = 38.7, z = 0.0 }, level = 1 },
	{ config_id = 65, gadget_id = 70220002, pos = { x = 47.7, y = 42.0, z = 95.5 }, rot = { x = 0.0, y = 100.1, z = 0.0 }, level = 1 },
	{ config_id = 66, gadget_id = 70220002, pos = { x = 45.5, y = 42.0, z = 89.9 }, rot = { x = 0.0, y = 293.6, z = 0.0 }, level = 1 },
	{ config_id = 67, gadget_id = 70220002, pos = { x = 42.7, y = 42.0, z = 86.2 }, rot = { x = 0.0, y = 264.5, z = 0.0 }, level = 1 },
	{ config_id = 68, gadget_id = 70220002, pos = { x = 44.9, y = 42.0, z = 90.9 }, rot = { x = 0.0, y = 344.1, z = 0.0 }, level = 1 },
	{ config_id = 72, gadget_id = 70220023, pos = { x = 0.6, y = 42.0, z = 102.2 }, rot = { x = 0.0, y = 89.2, z = 0.0 }, level = 1 },
	{ config_id = 73, gadget_id = 70210032, pos = { x = -0.9, y = 42.0, z = 102.0 }, rot = { x = 0.0, y = 141.9, z = 0.0 }, level = 1, chest_drop_id = 1300404, state = GadgetState.ChestLocked, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 74, gadget_id = 70210032, pos = { x = 2.0, y = 42.0, z = 102.1 }, rot = { x = 0.0, y = 224.5, z = 0.0 }, level = 1, chest_drop_id = 1300404, state = GadgetState.ChestLocked, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST }
}

-- 区域
regions = {
	{ config_id = 1, shape = RegionShape.SPHERE, radius = 5, pos = { x = 44.2, y = 42.0, z = 121.5 } },
	{ config_id = 15, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1.3, y = 42.0, z = 99.0 } },
	{ config_id = 16, shape = RegionShape.SPHERE, radius = 5, pos = { x = 7.5, y = 42.0, z = 98.0 } },
	{ config_id = 17, shape = RegionShape.SPHERE, radius = 5, pos = { x = 45.7, y = 42.0, z = 127.9 } },
	{ config_id = 18, shape = RegionShape.SPHERE, radius = 5, pos = { x = 47.1, y = 42.0, z = 114.9 } },
	{ config_id = 19, shape = RegionShape.SPHERE, radius = 5, pos = { x = 44.4, y = 42.0, z = 123.3 } },
	{ config_id = 24, shape = RegionShape.SPHERE, radius = 17.2, pos = { x = 0.6, y = 42.0, z = 100.9 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_1", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_1", action = "action_EVENT_ANY_MONSTER_DIE_1" },
	{ name = "ANY_MONSTER_DIE_15", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_15", action = "action_EVENT_ANY_MONSTER_DIE_15" },
	{ name = "ANY_MONSTER_DIE_16", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_16", action = "action_EVENT_ANY_MONSTER_DIE_16" },
	{ name = "GADGET_STATE_CHANGE_17", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_17", action = "action_EVENT_GADGET_STATE_CHANGE_17" },
	{ name = "GADGET_STATE_CHANGE_18", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_18", action = "action_EVENT_GADGET_STATE_CHANGE_18" },
	{ name = "VARIABLE_CHANGE_19", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_19", action = "action_EVENT_VARIABLE_CHANGE_19" },
	{ name = "ENTER_REGION_24", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_24", action = "action_EVENT_ENTER_REGION_24" }
}

-- 变量
variables = {
	{ name = "Key", value = 0, persistent = false }
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
		monsters = { 3, 4, 5, 6, 7 },
		gadgets = { 2, 3, 4, 5, 6, 7, 8, 9, 10, 28, 29, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 72, 73, 74 },
		regions = { 1, 15, 16, 17, 18, 19, 24 },
		triggers = { "ANY_MONSTER_DIE_1", "ANY_MONSTER_DIE_15", "ANY_MONSTER_DIE_16", "GADGET_STATE_CHANGE_17", "GADGET_STATE_CHANGE_18", "VARIABLE_CHANGE_19", "ENTER_REGION_24" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_1(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_1(context, evt)
	-- 将configid为 8 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 8, GadgetState.Default) then
			return -1
		end 
	
	-- 将configid为 9 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 9, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_15(context, evt)
	--判断死亡怪物的configid是否为 6
	if evt.param1 ~= 6 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_15(context, evt)
	-- 将configid为 73 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 73, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_16(context, evt)
	--判断死亡怪物的configid是否为 7
	if evt.param1 ~= 7 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_16(context, evt)
	-- 将configid为 74 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 74, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_17(context, evt)
	if 8 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_17(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_18(context, evt)
	if 9 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_18(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_19(context, evt)
	-- 判断变量"Key"为2
	if ScriptLib.GetGroupVariableValue(context, "Key") ~= 2 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_19(context, evt)
	-- 将configid为 7 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 7, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_24(context, evt)
	if evt.param1 ~= 24 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_24(context, evt)
	-- 通知groupid为250001002中,configid为：6的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 6, 250001002) then
	  return -1
	end
	
	-- 通知groupid为250001002中,configid为：7的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 7, 250001002) then
	  return -1
	end
	
	-- 通知groupid为250001002中,configid为：5的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 5, 250001002) then
	  return -1
	end
	
	return 0
end
