--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 435, monster_id = 20011201, pos = { x = 1568.5, y = 244.9, z = -1561.0 }, rot = { x = 0.0, y = 225.2, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 436, monster_id = 21010201, pos = { x = 1613.4, y = 246.1, z = -1586.2 }, rot = { x = 0.0, y = 51.1, z = 0.0 }, level = 12, drop_id = 303003, pose_id = 9002 },
	{ config_id = 437, monster_id = 21010301, pos = { x = 1608.9, y = 249.1, z = -1607.2 }, rot = { x = 0.0, y = 91.1, z = 0.0 }, level = 12, drop_id = 303003, pose_id = 9003 },
	{ config_id = 438, monster_id = 21010201, pos = { x = 1606.6, y = 246.5, z = -1601.2 }, rot = { x = 0.0, y = 131.1, z = 0.0 }, level = 12, drop_id = 303003, pose_id = 9003 },
	{ config_id = 856, monster_id = 20011201, pos = { x = 1563.4, y = 244.9, z = -1559.8 }, rot = { x = 0.0, y = 169.5, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 857, monster_id = 20011201, pos = { x = 1568.1, y = 244.5, z = -1557.3 }, rot = { x = 0.0, y = 211.5, z = 0.0 }, level = 12, drop_id = 303043 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1718, gadget_id = 70210011, pos = { x = 1456.3, y = 268.4, z = -1562.1 }, rot = { x = 0.0, y = 111.0, z = 0.0 }, level = 1, chest_drop_id = 403303, isOneoff = true, persistent = true },
	{ config_id = 1719, gadget_id = 70210022, pos = { x = 1565.7, y = 244.8, z = -1560.3 }, rot = { x = 0.0, y = 188.1, z = 0.0 }, level = 1, chest_drop_id = 403323, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 2469, gadget_id = 70220023, pos = { x = 1565.9, y = 244.9, z = -1560.3 }, rot = { x = 0.0, y = 198.9, z = 0.0 }, level = 1 },
	{ config_id = 2470, gadget_id = 70220016, pos = { x = 1560.9, y = 245.6, z = -1555.3 }, rot = { x = 0.0, y = 102.3, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 99, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1565.7, y = 244.8, z = -1562.3 } },
	{ config_id = 281, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1547.4, y = 241.3, z = -1615.2 } },
	{ config_id = 393, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1566.7, y = 244.8, z = -1561.0 } },
	{ config_id = 394, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1568.0, y = 244.8, z = -1561.0 } },
	{ config_id = 395, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1567.3, y = 244.9, z = -1561.9 } },
	{ config_id = 396, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1568.5, y = 244.8, z = -1561.7 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_99", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_99", action = "action_EVENT_ENTER_REGION_99" },
	{ name = "CLIENT_EXECUTE_281", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_281", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_393", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_393", action = "action_EVENT_ANY_MONSTER_DIE_393" },
	{ name = "ANY_MONSTER_DIE_394", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_394", action = "action_EVENT_ANY_MONSTER_DIE_394" },
	{ name = "ANY_MONSTER_DIE_395", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_395", action = "action_EVENT_ANY_MONSTER_DIE_395" },
	{ name = "VARIABLE_CHANGE_396", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_396", action = "action_EVENT_VARIABLE_CHANGE_396" }
}

-- 变量
variables = {
	{ name = "chest", value = 0, persistent = false }
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
		monsters = { 436, 437, 438 },
		gadgets = { 1718, 1719, 2469, 2470 },
		regions = { 99, 281, 393, 394, 395, 396 },
		triggers = { "ENTER_REGION_99", "CLIENT_EXECUTE_281", "ANY_MONSTER_DIE_393", "ANY_MONSTER_DIE_394", "ANY_MONSTER_DIE_395", "VARIABLE_CHANGE_396" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_99(context, evt)
	if evt.param1 ~= 99 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_99(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 435, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 856, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 857, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_281(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_393(context, evt)
	--判断死亡怪物的configid是否为 856
	if evt.param1 ~= 856 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_393(context, evt)
	-- 针对当前group内变量名为 "chest" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "chest", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_394(context, evt)
	--判断死亡怪物的configid是否为 857
	if evt.param1 ~= 857 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_394(context, evt)
	-- 针对当前group内变量名为 "chest" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "chest", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_395(context, evt)
	--判断死亡怪物的configid是否为 435
	if evt.param1 ~= 435 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_395(context, evt)
	-- 针对当前group内变量名为 "chest" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "chest", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_396(context, evt)
	-- 判断变量"chest"为3
	if ScriptLib.GetGroupVariableValue(context, "chest") ~= 3 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_396(context, evt)
	-- 将configid为 1719 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1719, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
