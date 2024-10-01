--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 11, monster_id = 21010501, pos = { x = 3.6, y = -2.9, z = 27.0 }, rot = { x = 0.0, y = 356.9, z = 0.0 }, level = 1, drop_id = 100020, disableWander = true },
	{ config_id = 12, monster_id = 21010901, pos = { x = -7.9, y = 8.0, z = -14.9 }, rot = { x = 0.0, y = 5.3, z = 0.0 }, level = 1, drop_id = 100020, disableWander = true },
	{ config_id = 13, monster_id = 21011001, pos = { x = 13.8, y = 8.1, z = -15.0 }, rot = { x = 0.0, y = 349.6, z = 0.0 }, level = 1, drop_id = 100020, disableWander = true },
	{ config_id = 15, monster_id = 20011201, pos = { x = 1.2, y = 1.1, z = -7.0 }, rot = { x = 0.0, y = 85.1, z = 0.0 }, level = 1, drop_id = 100020 },
	{ config_id = 16, monster_id = 20011201, pos = { x = 6.5, y = 1.1, z = -7.1 }, rot = { x = 0.0, y = 263.8, z = 0.0 }, level = 1, drop_id = 100020 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 22, gadget_id = 70220005, pos = { x = 15.3, y = 8.0, z = -15.1 }, rot = { x = 0.0, y = 210.9, z = 0.0 }, level = 15 },
	{ config_id = 24, gadget_id = 70210011, pos = { x = -10.2, y = 0.0, z = 5.0 }, rot = { x = 0.0, y = 15.1, z = 0.0 }, level = 1, chest_drop_id = 1400601, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 25, gadget_id = 70350005, pos = { x = 3.9, y = 0.7, z = -21.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 45, gadget_id = 70310001, pos = { x = 17.5, y = 1.0, z = 19.7 }, rot = { x = 0.0, y = 156.4, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 46, gadget_id = 70310001, pos = { x = -9.5, y = 0.9, z = 19.5 }, rot = { x = 0.0, y = 73.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 49, gadget_id = 70210021, pos = { x = 5.4, y = -3.0, z = 55.2 }, rot = { x = 0.0, y = 185.7, z = 0.0 }, level = 1, chest_drop_id = 1400602, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 50, gadget_id = 70210021, pos = { x = -9.9, y = 8.0, z = -18.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1400602, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 63, gadget_id = 70220004, pos = { x = -0.3, y = -2.8, z = 45.6 }, rot = { x = 0.0, y = 277.6, z = 0.0 }, level = 15 },
	{ config_id = 64, gadget_id = 70220004, pos = { x = 13.7, y = 1.0, z = -3.5 }, rot = { x = 0.0, y = 313.4, z = 0.0 }, level = 15 },
	{ config_id = 65, gadget_id = 70220013, pos = { x = 14.6, y = 8.0, z = -16.7 }, rot = { x = 0.0, y = 215.3, z = 0.0 }, level = 1 },
	{ config_id = 66, gadget_id = 70220013, pos = { x = -5.7, y = 8.0, z = -16.4 }, rot = { x = 0.0, y = 37.3, z = 0.0 }, level = 1 },
	{ config_id = 67, gadget_id = 70220014, pos = { x = -7.4, y = 8.0, z = -17.2 }, rot = { x = 0.0, y = 235.2, z = 0.0 }, level = 1 },
	{ config_id = 68, gadget_id = 70220002, pos = { x = 1.2, y = 1.0, z = -6.8 }, rot = { x = 0.0, y = 230.2, z = 0.0 }, level = 1 },
	{ config_id = 69, gadget_id = 70220002, pos = { x = 6.4, y = 1.0, z = -6.9 }, rot = { x = 0.0, y = 274.4, z = 0.0 }, level = 1 },
	{ config_id = 70, gadget_id = 70220004, pos = { x = -7.4, y = 1.0, z = -5.5 }, rot = { x = 0.0, y = 188.1, z = 0.0 }, level = 15 },
	{ config_id = 81, gadget_id = 70210022, pos = { x = 4.0, y = 1.0, z = -6.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1001002, state = GadgetState.ChestLocked, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST }
}

-- 区域
regions = {
	{ config_id = 24, shape = RegionShape.SPHERE, radius = 5, pos = { x = 4.3, y = 1.0, z = -12.7 } },
	{ config_id = 50, shape = RegionShape.CUBIC, size = { x = 40.0, y = 5.0, z = 10.0 }, pos = { x = 2.6, y = 1.0, z = -3.8 } },
	{ config_id = 51, shape = RegionShape.SPHERE, radius = 5, pos = { x = 3.3, y = 1.0, z = -4.3 } },
	{ config_id = 52, shape = RegionShape.SPHERE, radius = 5, pos = { x = -4.1, y = 1.1, z = -3.4 } },
	{ config_id = 53, shape = RegionShape.SPHERE, radius = 5, pos = { x = -10.9, y = 1.1, z = -6.7 } },
	{ config_id = 54, shape = RegionShape.SPHERE, radius = 5, pos = { x = -3.6, y = 1.1, z = -1.3 } }
}

-- 触发器
triggers = {
	{ name = "VARIABLE_CHANGE_24", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_24", action = "action_EVENT_VARIABLE_CHANGE_24" },
	{ name = "ENTER_REGION_50", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_50", action = "action_EVENT_ENTER_REGION_50" },
	{ name = "ANY_MONSTER_DIE_51", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_51", action = "action_EVENT_ANY_MONSTER_DIE_51" },
	{ name = "ANY_MONSTER_DIE_52", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_52", action = "action_EVENT_ANY_MONSTER_DIE_52" },
	{ name = "ANY_MONSTER_DIE_53", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_53", action = "action_EVENT_ANY_MONSTER_DIE_53" },
	{ name = "ANY_MONSTER_DIE_54", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_54", action = "action_EVENT_ANY_MONSTER_DIE_54" }
}

-- 变量
variables = {
	{ name = "door", value = 0, persistent = false }
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
		monsters = { 11, 12, 13 },
		gadgets = { 22, 24, 25, 45, 46, 49, 50, 63, 64, 65, 66, 67, 68, 69, 70, 81 },
		regions = { 24, 50, 51, 52, 53, 54 },
		triggers = { "VARIABLE_CHANGE_24", "ENTER_REGION_50", "ANY_MONSTER_DIE_51", "ANY_MONSTER_DIE_52", "ANY_MONSTER_DIE_53", "ANY_MONSTER_DIE_54" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_24(context, evt)
	-- 判断变量"door"为4
	if ScriptLib.GetGroupVariableValue(context, "door") ~= 4 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_24(context, evt)
	-- 将configid为 81 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 81, GadgetState.Default) then
			return -1
		end 
	
	-- 将configid为 25 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 25, GadgetState.GearStart) then
			return -1
		end 
	
	-- 触发镜头注目，注目位置为坐标（4，5，-20），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=4, y=5, z=-20}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_50(context, evt)
	if evt.param1 ~= 50 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_50(context, evt)
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
function condition_EVENT_ANY_MONSTER_DIE_51(context, evt)
	--判断死亡怪物的configid是否为 12
	if evt.param1 ~= 12 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_51(context, evt)
	-- 针对当前group内变量名为 "door" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "door", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_52(context, evt)
	--判断死亡怪物的configid是否为 13
	if evt.param1 ~= 13 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_52(context, evt)
	-- 针对当前group内变量名为 "door" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "door", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_53(context, evt)
	--判断死亡怪物的configid是否为 15
	if evt.param1 ~= 15 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_53(context, evt)
	-- 针对当前group内变量名为 "door" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "door", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_54(context, evt)
	--判断死亡怪物的configid是否为 16
	if evt.param1 ~= 16 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_54(context, evt)
	-- 针对当前group内变量名为 "door" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "door", 1) then
	  return -1
	end
	
	return 0
end
