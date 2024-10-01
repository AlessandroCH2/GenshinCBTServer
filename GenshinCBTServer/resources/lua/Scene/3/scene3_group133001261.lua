--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1133, monster_id = 20010401, pos = { x = 1642.8, y = 206.0, z = -2602.1 }, rot = { x = 0.0, y = 7.4, z = 0.0 }, level = 24, affix = { 1001 }, isElite = true },
	{ config_id = 1134, monster_id = 20011501, pos = { x = 1629.5, y = 198.5, z = -2602.4 }, rot = { x = 0.0, y = 6.7, z = 0.0 }, level = 24, affix = { 1003 }, isElite = true },
	{ config_id = 1135, monster_id = 20011301, pos = { x = 1618.9, y = 197.4, z = -2594.6 }, rot = { x = 0.0, y = 55.9, z = 0.0 }, level = 24, affix = { 1001 }, isElite = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2947, gadget_id = 70900039, pos = { x = 1632.6, y = 198.0, z = -2587.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 3107, gadget_id = 70210042, pos = { x = 1636.7, y = 198.4, z = -2604.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 403245, state = GadgetState.ChestLocked, isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 361, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1632.5, y = 198.5, z = -2601.9 } },
	{ config_id = 362, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1631.2, y = 197.8, z = -2595.3 } },
	{ config_id = 363, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1627.2, y = 197.7, z = -2596.7 } },
	{ config_id = 364, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1622.1, y = 197.6, z = -2594.8 } },
	{ config_id = 365, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1628.0, y = 198.3, z = -2600.4 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_361", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_361", action = "action_EVENT_GADGET_STATE_CHANGE_361" },
	{ name = "ANY_MONSTER_DIE_362", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_362", action = "action_EVENT_ANY_MONSTER_DIE_362" },
	{ name = "ANY_MONSTER_DIE_363", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_363", action = "action_EVENT_ANY_MONSTER_DIE_363" },
	{ name = "ANY_MONSTER_DIE_364", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_364", action = "action_EVENT_ANY_MONSTER_DIE_364" },
	{ name = "VARIABLE_CHANGE_365", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_365", action = "action_EVENT_VARIABLE_CHANGE_365", tlog_tag = "解锁远岛隐藏地城" }
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
		monsters = { },
		gadgets = { 2947 },
		regions = { 361, 362, 363, 364, 365 },
		triggers = { "GADGET_STATE_CHANGE_361", "ANY_MONSTER_DIE_362", "ANY_MONSTER_DIE_363", "ANY_MONSTER_DIE_364", "VARIABLE_CHANGE_365" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_361(context, evt)
	if 2947 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_361(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1133, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1134, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1135, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_362(context, evt)
	--判断死亡怪物的configid是否为 1133
	if evt.param1 ~= 1133 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_362(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_363(context, evt)
	--判断死亡怪物的configid是否为 1134
	if evt.param1 ~= 1134 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_363(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_364(context, evt)
	--判断死亡怪物的configid是否为 1135
	if evt.param1 ~= 1135 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_364(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_365(context, evt)
	-- 判断变量"Key"为3
	if ScriptLib.GetGroupVariableValue(context, "Key") ~= 3 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_365(context, evt)
	-- 解锁当前场景中pointid 为%force_id%的 传送点或者地城入口
	if 0 ~= ScriptLib.UnlockScenePoint(context, 42) then
		return -1
	end
	
	-- 将configid为 3107 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3107, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
