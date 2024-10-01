--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 5, monster_id = 21020101, pos = { x = -2.5, y = 1.0, z = -39.9 }, rot = { x = 0.0, y = 357.4, z = 0.0 }, level = 0, affix = { 1002 }, isElite = true, pose_id = 401 },
	{ config_id = 6, monster_id = 21020201, pos = { x = -2.5, y = 1.0, z = -32.1 }, rot = { x = 0.0, y = 178.2, z = 0.0 }, level = 0, affix = { 1001 }, isElite = true, pose_id = 401 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 14, gadget_id = 70350005, pos = { x = 4.0, y = 1.0, z = -20.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 22, gadget_id = 70210021, pos = { x = 13.6, y = 12.0, z = -53.5 }, rot = { x = 0.0, y = 358.5, z = 0.0 }, level = 1, chest_drop_id = 1400602, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 48, gadget_id = 70210042, pos = { x = -2.3, y = 0.9, z = -36.1 }, rot = { x = 0.0, y = 89.0, z = 0.0 }, level = 1, chest_drop_id = 1400600, state = GadgetState.ChestLocked, type = GadgetType.GADGET_DUNGEON_PASS_CHEST },
	{ config_id = 49, gadget_id = 70210032, pos = { x = -2.2, y = 0.9, z = -34.4 }, rot = { x = 0.0, y = 125.9, z = 0.0 }, level = 1, chest_drop_id = 1400602, state = GadgetState.ChestLocked, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 50, gadget_id = 70220023, pos = { x = -2.3, y = 1.0, z = -39.6 }, rot = { x = 0.0, y = 246.9, z = 0.0 }, level = 1 },
	{ config_id = 51, gadget_id = 70220023, pos = { x = -2.4, y = 1.1, z = -33.7 }, rot = { x = 0.0, y = 180.1, z = 0.0 }, level = 1 },
	{ config_id = 52, gadget_id = 70220004, pos = { x = 15.3, y = 1.0, z = -44.6 }, rot = { x = 0.0, y = 349.3, z = 0.0 }, level = 1 },
	{ config_id = 53, gadget_id = 70220004, pos = { x = 0.4, y = 1.1, z = -46.6 }, rot = { x = 0.0, y = 69.5, z = 0.0 }, level = 1 },
	{ config_id = 54, gadget_id = 70220004, pos = { x = 4.1, y = 1.0, z = -31.5 }, rot = { x = 0.0, y = 80.2, z = 0.0 }, level = 1 },
	{ config_id = 55, gadget_id = 70220004, pos = { x = -9.0, y = 1.0, z = -43.6 }, rot = { x = 0.0, y = 321.6, z = 0.0 }, level = 1 },
	{ config_id = 56, gadget_id = 70220004, pos = { x = -10.8, y = 1.0, z = -29.3 }, rot = { x = 0.0, y = 130.8, z = 0.0 }, level = 1 },
	{ config_id = 57, gadget_id = 70220004, pos = { x = 8.1, y = 1.0, z = -23.8 }, rot = { x = 0.0, y = 279.4, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 9, shape = RegionShape.SPHERE, radius = 15.5, pos = { x = 3.5, y = 1.0, z = -38.0 } },
	{ config_id = 11, shape = RegionShape.SPHERE, radius = 5, pos = { x = -1.7, y = 1.1, z = -32.6 } },
	{ config_id = 12, shape = RegionShape.SPHERE, radius = 5, pos = { x = -1.9, y = 1.0, z = -29.1 } },
	{ config_id = 15, shape = RegionShape.SPHERE, radius = 5, pos = { x = -3.8, y = 1.0, z = -39.6 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_9", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_9", action = "action_EVENT_ENTER_REGION_9" },
	{ name = "ANY_MONSTER_DIE_11", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_11", action = "action_EVENT_ANY_MONSTER_DIE_11" },
	{ name = "ANY_MONSTER_DIE_12", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_12", action = "action_EVENT_ANY_MONSTER_DIE_12" },
	{ name = "VARIABLE_CHANGE_15", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_15", action = "action_EVENT_VARIABLE_CHANGE_15" }
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
		-- description = ,
		monsters = { 5, 6 },
		gadgets = { 14, 22, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57 },
		regions = { 9, 11, 12, 15 },
		triggers = { "ENTER_REGION_9", "ANY_MONSTER_DIE_11", "ANY_MONSTER_DIE_12", "VARIABLE_CHANGE_15" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_9(context, evt)
	if evt.param1 ~= 9 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_9(context, evt)
	-- 将configid为 14 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 14, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_11(context, evt)
	--判断死亡怪物的configid是否为 5
	if evt.param1 ~= 5 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_11(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_12(context, evt)
	--判断死亡怪物的configid是否为 6
	if evt.param1 ~= 6 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_12(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_15(context, evt)
	-- 判断变量"Key"为2
	if ScriptLib.GetGroupVariableValue(context, "Key") ~= 2 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_15(context, evt)
	-- 将configid为 48 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 48, GadgetState.Default) then
			return -1
		end 
	
	-- 将configid为 49 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 49, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
