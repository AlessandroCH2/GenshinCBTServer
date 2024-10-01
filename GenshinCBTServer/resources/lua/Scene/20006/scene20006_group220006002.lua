--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 28, monster_id = 21010201, pos = { x = 7.5, y = 42.0, z = 95.5 }, rot = { x = 0.0, y = 196.9, z = 0.0 }, level = 1, disableWander = true },
	{ config_id = 33, monster_id = 21010201, pos = { x = -3.3, y = 42.0, z = 107.8 }, rot = { x = 0.0, y = 148.2, z = 0.0 }, level = 1 },
	{ config_id = 34, monster_id = 21010201, pos = { x = 4.4, y = 42.0, z = 108.4 }, rot = { x = 0.0, y = 180.4, z = 0.0 }, level = 1 },
	{ config_id = 36, monster_id = 20010801, pos = { x = 35.0, y = 42.0, z = 89.3 }, rot = { x = 0.0, y = 311.9, z = 0.0 }, level = 1, disableWander = true },
	{ config_id = 37, monster_id = 20010801, pos = { x = 42.4, y = 42.0, z = 87.9 }, rot = { x = 0.0, y = 299.5, z = 0.0 }, level = 1, disableWander = true },
	{ config_id = 43, monster_id = 21010701, pos = { x = 8.6, y = 42.0, z = 108.6 }, rot = { x = 0.0, y = 182.6, z = 0.0 }, level = 2 },
	{ config_id = 54, monster_id = 21010301, pos = { x = -4.4, y = 42.0, z = 95.2 }, rot = { x = 0.0, y = 65.4, z = 0.0 }, level = 2 },
	{ config_id = 79, monster_id = 21010501, pos = { x = 13.4, y = 42.0, z = 119.7 }, rot = { x = 0.0, y = 206.4, z = 0.0 }, level = 1, disableWander = true },
	{ config_id = 86, monster_id = 20011001, pos = { x = -4.0, y = 42.0, z = 122.3 }, rot = { x = 0.0, y = 190.4, z = 0.0 }, level = 1, disableWander = true },
	{ config_id = 87, monster_id = 20011001, pos = { x = -1.8, y = 42.0, z = 121.7 }, rot = { x = 0.0, y = 200.9, z = 0.0 }, level = 1, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 45, gadget_id = 70220005, pos = { x = 6.0, y = 42.0, z = 97.6 }, rot = { x = 0.0, y = 337.0, z = 0.0 }, level = 1 },
	{ config_id = 131, gadget_id = 70210021, pos = { x = 23.1, y = 42.1, z = 130.4 }, rot = { x = 0.0, y = 90.8, z = 0.0 }, level = 1, chest_drop_id = 1000701 },
	{ config_id = 139, gadget_id = 70350003, pos = { x = 54.9, y = 42.2, z = 121.0 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 140, gadget_id = 70360002, pos = { x = 47.0, y = 42.0, z = 126.8 }, rot = { x = 0.0, y = 235.1, z = 0.0 }, level = 1 },
	{ config_id = 152, gadget_id = 70220011, pos = { x = 15.4, y = 42.0, z = 97.7 }, rot = { x = 0.0, y = 233.5, z = 0.0 }, level = 1 },
	{ config_id = 153, gadget_id = 70220011, pos = { x = 15.7, y = 42.1, z = 108.6 }, rot = { x = 0.0, y = 228.0, z = 0.0 }, level = 1 },
	{ config_id = 154, gadget_id = 70220003, pos = { x = 32.0, y = 42.0, z = 132.0 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1 },
	{ config_id = 155, gadget_id = 70220003, pos = { x = -5.4, y = 42.0, z = 117.9 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 1 },
	{ config_id = 157, gadget_id = 70220013, pos = { x = -2.0, y = 42.0, z = 117.9 }, rot = { x = 0.0, y = 266.6, z = 0.0 }, level = 1 },
	{ config_id = 158, gadget_id = 70220013, pos = { x = -2.1, y = 43.6, z = 117.9 }, rot = { x = 0.0, y = 154.6, z = 0.0 }, level = 1 },
	{ config_id = 159, gadget_id = 70210021, pos = { x = -2.6, y = 42.0, z = 123.6 }, rot = { x = 0.0, y = 179.7, z = 0.0 }, level = 1, chest_drop_id = 1000701 }
}

-- 区域
regions = {
	{ config_id = 28, shape = RegionShape.SPHERE, radius = 5, pos = { x = 44.7, y = 42.0, z = 122.2 } },
	{ config_id = 29, shape = RegionShape.SPHERE, radius = 5, pos = { x = 43.5, y = 42.0, z = 122.3 } },
	{ config_id = 30, shape = RegionShape.SPHERE, radius = 5, pos = { x = 40.3, y = 42.0, z = 121.6 } },
	{ config_id = 31, shape = RegionShape.SPHERE, radius = 12.21, pos = { x = 74.3, y = 39.5, z = 121.3 } },
	{ config_id = 37, shape = RegionShape.SPHERE, radius = 5, pos = { x = -3.8, y = 42.0, z = 124.0 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_28", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_28", action = "action_EVENT_GADGET_CREATE_28" },
	{ name = "SELECT_OPTION_29", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_29", action = "action_EVENT_SELECT_OPTION_29", trigger_count = 0 },
	{ name = "SELECT_OPTION_30", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_30", action = "action_EVENT_SELECT_OPTION_30", trigger_count = 0 },
	{ name = "ENTER_REGION_31", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_31", action = "action_EVENT_ENTER_REGION_31" },
	{ name = "ENTER_REGION_37", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_37", action = "action_EVENT_ENTER_REGION_37" }
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
		monsters = { 28, 33, 34, 36, 37, 43, 54, 79 },
		gadgets = { 45, 131, 139, 140, 152, 153, 154, 155, 157, 158, 159 },
		regions = { 28, 29, 30, 31, 37 },
		triggers = { "GADGET_CREATE_28", "SELECT_OPTION_29", "SELECT_OPTION_30", "ENTER_REGION_31", "ENTER_REGION_37" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_28(context, evt)
	if 140 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_28(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {1}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_29(context, evt)
	-- 判断是gadgetid 140
	if 140 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_29(context, evt)
	-- 根据不同的选项做不同的操作
	if 1 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 139, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_30(context, evt)
	-- 判断是gadgetid 140
	if 140 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_30(context, evt)
	-- 根据不同的选项做不同的操作
	if 1 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 140, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_31(context, evt)
	if evt.param1 ~= 31 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_31(context, evt)
	-- 将configid为 139 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 139, GadgetState.Default) then
			return -1
		end 
	
	-- 将configid为 140 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 140, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_37(context, evt)
	if evt.param1 ~= 37 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_37(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 86, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 87, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end
