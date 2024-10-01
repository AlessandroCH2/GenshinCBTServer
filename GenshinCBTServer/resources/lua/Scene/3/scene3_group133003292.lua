--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1038, monster_id = 20010901, pos = { x = 3018.5, y = 239.1, z = -1705.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303044 },
	{ config_id = 1039, monster_id = 20010801, pos = { x = 3016.9, y = 239.2, z = -1707.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303044 },
	{ config_id = 1040, monster_id = 20010701, pos = { x = 3017.2, y = 239.3, z = -1708.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303044 },
	{ config_id = 1041, monster_id = 20010501, pos = { x = 3018.3, y = 239.3, z = -1709.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303044 },
	{ config_id = 1042, monster_id = 20010401, pos = { x = 3019.7, y = 239.3, z = -1709.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303044 },
	{ config_id = 1043, monster_id = 20010301, pos = { x = 3020.8, y = 239.2, z = -1708.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303044 },
	{ config_id = 1044, monster_id = 20011301, pos = { x = 3020.6, y = 239.1, z = -1707.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303044 },
	{ config_id = 1045, monster_id = 20011201, pos = { x = 3019.9, y = 239.1, z = -1706.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303044 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3146, gadget_id = 70900009, pos = { x = 3015.2, y = 239.4, z = -1703.5 }, rot = { x = 0.0, y = 177.6, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 3147, gadget_id = 70900008, pos = { x = 3015.2, y = 239.4, z = -1711.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 3148, gadget_id = 70900039, pos = { x = 3023.2, y = 239.1, z = -1711.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 3149, gadget_id = 70900007, pos = { x = 3023.2, y = 239.1, z = -1703.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 3152, gadget_id = 70210006, pos = { x = 3019.2, y = 239.1, z = -1707.5 }, rot = { x = 0.0, y = 318.1, z = 0.0 }, level = 1, chest_drop_id = 403144, state = GadgetState.ChestLocked, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 206, shape = RegionShape.SPHERE, radius = 5, pos = { x = 3015.2, y = 239.1, z = -1703.7 } },
	{ config_id = 207, shape = RegionShape.SPHERE, radius = 5, pos = { x = 3015.2, y = 239.4, z = -1711.4 } },
	{ config_id = 208, shape = RegionShape.SPHERE, radius = 5, pos = { x = 3023.4, y = 239.0, z = -1712.0 } },
	{ config_id = 209, shape = RegionShape.SPHERE, radius = 5, pos = { x = 3023.8, y = 238.5, z = -1703.6 } },
	{ config_id = 210, shape = RegionShape.SPHERE, radius = 5, pos = { x = 3023.2, y = 238.4, z = -1691.3 } },
	{ config_id = 372, shape = RegionShape.SPHERE, radius = 5, pos = { x = 3019.2, y = 239.2, z = -1707.6 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_206", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_206", action = "action_EVENT_GADGET_STATE_CHANGE_206" },
	{ name = "GADGET_STATE_CHANGE_207", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_207", action = "action_EVENT_GADGET_STATE_CHANGE_207" },
	{ name = "GADGET_STATE_CHANGE_208", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_208", action = "action_EVENT_GADGET_STATE_CHANGE_208" },
	{ name = "GADGET_STATE_CHANGE_209", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_209", action = "action_EVENT_GADGET_STATE_CHANGE_209" },
	{ name = "ANY_MONSTER_DIE_210", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "", action = "action_EVENT_ANY_MONSTER_DIE_210", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_372", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_372", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "num_1", value = 0, persistent = false }
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
		regions = { 372 },
		triggers = { "CLIENT_EXECUTE_372" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_206(context, evt)
	if 3146 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_206(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1039, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1038, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_207(context, evt)
	if 3147 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_207(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1040, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1041, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_208(context, evt)
	if 3148 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_208(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1043, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1042, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_209(context, evt)
	if 3149 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_209(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1044, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1045, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_210(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1")
	local c_num = c_num_1 +1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num) then
	  return -1
	end
	
	if c_num == 8 then
		if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3152, state = GadgetState.Default }) then
			return -1
		end
	end
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_372(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
