--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1, monster_id = 20010801, pos = { x = 57.5, y = 0.5, z = -2.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 2, monster_id = 20010801, pos = { x = 64.9, y = 0.5, z = 5.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 3, monster_id = 20011001, pos = { x = 60.6, y = 0.5, z = 0.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 4, monster_id = 20010901, pos = { x = 56.6, y = 0.5, z = 8.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 5, monster_id = 20011001, pos = { x = 54.0, y = 0.5, z = 5.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 6, monster_id = 20011001, pos = { x = 59.0, y = 0.5, z = 5.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 7, monster_id = 20011101, pos = { x = 52.4, y = 0.5, z = 6.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 8, monster_id = 20010901, pos = { x = 62.4, y = 0.5, z = 7.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1, gadget_id = 70350001, pos = { x = 57.0, y = 0.5, z = -22.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2, gadget_id = 70360002, pos = { x = 63.2, y = 0.5, z = -28.6 }, rot = { x = 0.0, y = 161.4, z = 0.0 }, level = 1 },
	{ config_id = 7, gadget_id = 70210031, pos = { x = 111.4, y = 22.9, z = -36.9 }, rot = { x = 0.0, y = 95.4, z = 0.0 }, level = 1, chest_drop_id = 1100302 },
	{ config_id = 8, gadget_id = 70210031, pos = { x = 111.4, y = 22.9, z = -40.5 }, rot = { x = 0.0, y = 29.3, z = 0.0 }, level = 1, chest_drop_id = 1100302 },
	{ config_id = 42, gadget_id = 70380002, pos = { x = 21.5, y = 2.9, z = -22.6 }, rot = { x = 270.0, y = 0.0, z = 0.0 }, level = 1, route_id = 1 }
}

-- 区域
regions = {
	{ config_id = 1, shape = RegionShape.SPHERE, radius = 5, pos = { x = 61.1, y = 0.5, z = -28.1 } },
	{ config_id = 3, shape = RegionShape.SPHERE, radius = 5, pos = { x = 60.8, y = 0.5, z = -30.6 } },
	{ config_id = 4, shape = RegionShape.SPHERE, radius = 5, pos = { x = 57.6, y = 0.5, z = -28.3 } },
	{ config_id = 5, shape = RegionShape.SPHERE, radius = 5, pos = { x = 59.0, y = 0.5, z = -29.8 } },
	{ config_id = 10, shape = RegionShape.SPHERE, radius = 19.05, pos = { x = 58.2, y = 0.5, z = -39.9 } },
	{ config_id = 11, shape = RegionShape.SPHERE, radius = 20.08, pos = { x = 18.6, y = 0.5, z = -41.4 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_1", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_1", action = "action_EVENT_GADGET_CREATE_1" },
	{ name = "SELECT_OPTION_3", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_3", action = "action_EVENT_SELECT_OPTION_3" },
	{ name = "SELECT_OPTION_4", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_4", action = "action_EVENT_SELECT_OPTION_4" },
	{ name = "SELECT_OPTION_5", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_5", action = "action_EVENT_SELECT_OPTION_5" },
	{ name = "ENTER_REGION_10", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_10", action = "action_EVENT_ENTER_REGION_10", trigger_count = 0 },
	{ name = "ENTER_REGION_11", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_11", action = "action_EVENT_ENTER_REGION_11", trigger_count = 0 }
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
		monsters = { },
		gadgets = { 1, 2, 7, 8, 42 },
		regions = { 1, 3, 4, 5, 10, 11 },
		triggers = { "GADGET_CREATE_1", "SELECT_OPTION_3", "SELECT_OPTION_4", "SELECT_OPTION_5", "ENTER_REGION_10", "ENTER_REGION_11" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_1(context, evt)
	if 2 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_1(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {100,101,102}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_3(context, evt)
	-- 判断是gadgetid 2
	if 2 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_3(context, evt)
	-- 根据不同的选项做不同的操作
	if 100 == evt.param2 then
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 2, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 3, delay_time = 0 }) then
	  return -1
	end
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_4(context, evt)
	-- 判断是gadgetid 2
	if 2 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_4(context, evt)
	-- 根据不同的选项做不同的操作
	if 101 == evt.param2 then
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 4, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 5, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 6, delay_time = 0 }) then
	  return -1
	end
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_5(context, evt)
	-- 判断是gadgetid 2
	if 2 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_5(context, evt)
	-- 根据不同的选项做不同的操作
	if 102 == evt.param2 then
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 7, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 8, delay_time = 0 }) then
	  return -1
	end
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_10(context, evt)
	if evt.param1 ~= 10 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_10(context, evt)
	-- play_type含义：1·代表开始播放； 2·代表停止播放
	-- 在指定位置播放或停止音效资源
		pos = {x=53, y=2, z=-53}
	    if 0 ~= ScriptLib.ScenePlaySound(context, {play_pos = pos, sound_name = "DungeonSound1001", play_type= 1, is_broadcast = false }) then
					return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_11(context, evt)
	if evt.param1 ~= 11 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_11(context, evt)
	-- play_type含义：1·代表开始播放； 2·代表停止播放
	-- 在指定位置播放或停止音效资源
		pos = {x=53, y=2, z=-53}
	    if 0 ~= ScriptLib.ScenePlaySound(context, {play_pos = pos, sound_name = "DungeonSound1001", play_type= 2, is_broadcast = false }) then
					return -1
		end 
	
	return 0
end
