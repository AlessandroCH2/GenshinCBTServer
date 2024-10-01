--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 73, monster_id = 21010501, pos = { x = 467.6, y = -20.9, z = 67.3 }, rot = { x = 0.0, y = 275.3, z = 0.0 }, level = 0, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 17, gadget_id = 70350002, pos = { x = 423.5, y = -22.6, z = 71.2 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 18, gadget_id = 70350002, pos = { x = 406.2, y = -22.4, z = 80.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 19, gadget_id = 70360002, pos = { x = 411.9, y = -22.2, z = 75.4 }, rot = { x = 0.0, y = 181.0, z = 0.0 }, level = 1 },
	{ config_id = 20, gadget_id = 70220013, pos = { x = 424.1, y = -22.2, z = 55.9 }, rot = { x = 0.0, y = 257.5, z = 0.0 }, level = 1 },
	{ config_id = 21, gadget_id = 70210011, pos = { x = 430.3, y = -22.1, z = 50.9 }, rot = { x = 0.0, y = 183.3, z = 0.0 }, level = 1, chest_drop_id = 1400301, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 23, gadget_id = 70220003, pos = { x = 443.4, y = -24.6, z = 65.4 }, rot = { x = 0.0, y = 268.2, z = 0.0 }, level = 1 },
	{ config_id = 24, gadget_id = 70220003, pos = { x = 447.6, y = -24.6, z = 72.9 }, rot = { x = 0.0, y = 86.2, z = 0.0 }, level = 1 },
	{ config_id = 25, gadget_id = 70220003, pos = { x = 451.5, y = -24.6, z = 65.6 }, rot = { x = 0.0, y = 93.2, z = 0.0 }, level = 1 },
	{ config_id = 42, gadget_id = 70220003, pos = { x = 443.4, y = -24.6, z = 68.7 }, rot = { x = 0.0, y = 269.9, z = 0.0 }, level = 1 },
	{ config_id = 43, gadget_id = 70220003, pos = { x = 451.1, y = -24.6, z = 69.3 }, rot = { x = 0.0, y = 269.3, z = 0.0 }, level = 1 },
	{ config_id = 51, gadget_id = 70220005, pos = { x = 458.7, y = -24.1, z = 67.0 }, rot = { x = 0.0, y = 272.0, z = 0.0 }, level = 1 },
	{ config_id = 58, gadget_id = 70220005, pos = { x = 426.3, y = -22.1, z = 54.1 }, rot = { x = 0.0, y = 305.8, z = 0.0 }, level = 1 },
	{ config_id = 59, gadget_id = 70220005, pos = { x = 426.0, y = -22.2, z = 52.8 }, rot = { x = 0.0, y = 140.4, z = 0.0 }, level = 1 },
	{ config_id = 60, gadget_id = 70220005, pos = { x = 456.4, y = -24.8, z = 71.8 }, rot = { x = 0.0, y = 129.6, z = 0.0 }, level = 1 },
	{ config_id = 61, gadget_id = 70220005, pos = { x = 454.9, y = -24.6, z = 73.5 }, rot = { x = 0.0, y = 330.8, z = 0.0 }, level = 1 },
	{ config_id = 106, gadget_id = 70220004, pos = { x = 450.4, y = -24.9, z = 67.0 }, rot = { x = 0.0, y = 308.5, z = 0.0 }, level = 1 },
	{ config_id = 107, gadget_id = 70220004, pos = { x = 442.7, y = -24.8, z = 65.2 }, rot = { x = 0.0, y = 63.0, z = 0.0 }, level = 1 },
	{ config_id = 112, gadget_id = 70220003, pos = { x = 447.3, y = -24.8, z = 68.8 }, rot = { x = 0.0, y = 269.1, z = 0.0 }, level = 1 },
	{ config_id = 141, gadget_id = 70220013, pos = { x = 424.0, y = -22.2, z = 53.9 }, rot = { x = 0.0, y = 327.1, z = 0.0 }, level = 1 },
	{ config_id = 142, gadget_id = 70220013, pos = { x = 424.3, y = -22.2, z = 51.3 }, rot = { x = 0.0, y = 62.5, z = 0.0 }, level = 1 },
	{ config_id = 143, gadget_id = 70220013, pos = { x = 426.3, y = -22.2, z = 55.6 }, rot = { x = 0.0, y = 62.0, z = 0.0 }, level = 1 },
	{ config_id = 144, gadget_id = 70310001, pos = { x = 410.7, y = -22.1, z = 63.4 }, rot = { x = 0.0, y = 354.1, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 15, shape = RegionShape.SPHERE, radius = 5, pos = { x = 408.0, y = -22.1, z = 78.0 } },
	{ config_id = 54, shape = RegionShape.SPHERE, radius = 5, pos = { x = 447.5, y = -24.8, z = 68.7 } },
	{ config_id = 64, shape = RegionShape.SPHERE, radius = 5, pos = { x = 465.9, y = -22.0, z = 68.1 } },
	{ config_id = 66, shape = RegionShape.SPHERE, radius = 5, pos = { x = 412.1, y = -22.1, z = 76.2 } },
	{ config_id = 67, shape = RegionShape.CUBIC, size = { x = 10.0, y = 5.0, z = 10.0 }, pos = { x = 400.7, y = -18.2, z = 48.7 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_15", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_15", action = "action_EVENT_GADGET_CREATE_15" },
	{ name = "ENTER_REGION_54", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_54", action = "action_EVENT_ENTER_REGION_54" },
	{ name = "ANY_MONSTER_DIE_64", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_64", action = "action_EVENT_ANY_MONSTER_DIE_64" },
	{ name = "SELECT_OPTION_66", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_66", action = "action_EVENT_SELECT_OPTION_66" },
	{ name = "ENTER_REGION_67", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_67", action = "action_EVENT_ENTER_REGION_67" }
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
		monsters = { 73 },
		gadgets = { 17, 18, 19, 20, 21, 23, 24, 25, 42, 51, 58, 59, 60, 61, 106, 107, 112, 141, 142, 144 },
		regions = { 15, 54, 64, 66, 67 },
		triggers = { "GADGET_CREATE_15", "ENTER_REGION_54", "ANY_MONSTER_DIE_64", "SELECT_OPTION_66", "ENTER_REGION_67" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_15(context, evt)
	if 19 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_15(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {1}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_54(context, evt)
	if evt.param1 ~= 54 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_54(context, evt)
	-- 将configid为 17 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 17, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_64(context, evt)
	--判断死亡怪物的configid是否为 73
	if evt.param1 ~= 73 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_64(context, evt)
	-- 将configid为 69 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 69, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_66(context, evt)
	-- 判断是gadgetid 19
	if 19 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_66(context, evt)
	-- 根据不同的选项做不同的操作
	if 1 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 18, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_67(context, evt)
	if evt.param1 ~= 67 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_67(context, evt)
	-- 将configid为 144 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 144, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end
