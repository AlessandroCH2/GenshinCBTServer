--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 11, gadget_id = 70900007, pos = { x = 67.2, y = 0.6, z = -40.8 }, rot = { x = 0.0, y = 305.2, z = 0.0 }, level = 1, state = GadgetState.GearStop },
	{ config_id = 12, gadget_id = 70900008, pos = { x = 74.0, y = 0.5, z = -48.5 }, rot = { x = 0.0, y = 159.9, z = 0.0 }, level = 1, state = GadgetState.GearStop },
	{ config_id = 13, gadget_id = 70900009, pos = { x = 76.7, y = 0.5, z = -32.7 }, rot = { x = 0.0, y = 29.3, z = 0.0 }, level = 1, state = GadgetState.GearStop },
	{ config_id = 14, gadget_id = 70350003, pos = { x = 73.7, y = 1.5, z = -53.2 }, rot = { x = 0.0, y = 15.5, z = 0.0 }, level = 1 },
	{ config_id = 16, gadget_id = 70350003, pos = { x = 75.8, y = 1.4, z = -29.0 }, rot = { x = 0.0, y = 135.6, z = 0.0 }, level = 1 },
	{ config_id = 18, gadget_id = 70210032, pos = { x = 87.9, y = 0.5, z = -61.2 }, rot = { x = 0.0, y = 5.4, z = 0.0 }, level = 1, chest_drop_id = 1100302, state = GadgetState.ChestLocked, showcutscene = true },
	{ config_id = 19, gadget_id = 70360001, pos = { x = 84.6, y = 1.3, z = -51.2 }, rot = { x = 0.0, y = 206.1, z = 0.0 }, level = 1 },
	{ config_id = 21, gadget_id = 70500000, pos = { x = 88.1, y = 0.5, z = -27.5 }, rot = { x = 0.0, y = 104.1, z = 0.0 }, level = 1, point_type = 1000001 },
	{ config_id = 22, gadget_id = 70210031, pos = { x = 85.1, y = 0.5, z = -30.9 }, rot = { x = 0.0, y = 168.0, z = 0.0 }, level = 1, chest_drop_id = 1100302, showcutscene = true }
}

-- 区域
regions = {
	{ config_id = 16, shape = RegionShape.SPHERE, radius = 5, pos = { x = 81.2, y = 0.5, z = -45.2 } },
	{ config_id = 17, shape = RegionShape.SPHERE, radius = 5, pos = { x = 78.6, y = 0.5, z = -33.5 } },
	{ config_id = 18, shape = RegionShape.SPHERE, radius = 5, pos = { x = 66.7, y = 0.5, z = -41.8 } },
	{ config_id = 19, shape = RegionShape.SPHERE, radius = 5, pos = { x = 72.8, y = 0.5, z = -49.2 } },
	{ config_id = 20, shape = RegionShape.SPHERE, radius = 5, pos = { x = 75.5, y = 0.5, z = -32.3 } },
	{ config_id = 21, shape = RegionShape.SPHERE, radius = 5, pos = { x = 65.6, y = 0.5, z = -41.5 } },
	{ config_id = 22, shape = RegionShape.SPHERE, radius = 5, pos = { x = 84.3, y = 0.5, z = -49.9 } },
	{ config_id = 23, shape = RegionShape.SPHERE, radius = 5, pos = { x = 85.2, y = 0.5, z = -45.9 } },
	{ config_id = 24, shape = RegionShape.SPHERE, radius = 5, pos = { x = 89.2, y = 0.5, z = -29.7 } },
	{ config_id = 69, shape = RegionShape.SPHERE, radius = 11.6, pos = { x = 87.2, y = 0.5, z = -62.3 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_16", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_16", action = "action_EVENT_GADGET_STATE_CHANGE_16", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_17", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_17", action = "action_EVENT_GADGET_STATE_CHANGE_17", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_18", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_18", action = "action_EVENT_GADGET_STATE_CHANGE_18", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_19", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_19", action = "action_EVENT_GADGET_STATE_CHANGE_19", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_20", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_20", action = "action_EVENT_GADGET_STATE_CHANGE_20", trigger_count = 0 },
	{ name = "ENTER_REGION_21", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_21", action = "action_EVENT_ENTER_REGION_21", trigger_count = 0 },
	{ name = "GADGET_CREATE_22", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_22", action = "action_EVENT_GADGET_CREATE_22" },
	{ name = "SELECT_OPTION_23", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_23", action = "action_EVENT_SELECT_OPTION_23" },
	{ name = "GATHER_24", event = EventType.EVENT_GATHER, source = "21", condition = "", action = "action_EVENT_GATHER_24" },
	{ name = "ENTER_REGION_69", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_69", action = "action_EVENT_ENTER_REGION_69" }
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
		gadgets = { 11, 12, 13, 14, 16, 18, 19, 21 },
		regions = { 16, 17, 18, 19, 20, 21, 22, 23, 24, 69 },
		triggers = { "GADGET_STATE_CHANGE_16", "GADGET_STATE_CHANGE_17", "GADGET_STATE_CHANGE_18", "GADGET_STATE_CHANGE_19", "GADGET_STATE_CHANGE_20", "ENTER_REGION_21", "GADGET_CREATE_22", "SELECT_OPTION_23", "GATHER_24", "ENTER_REGION_69" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_16(context, evt)
	if GadgetState.GearStart ~= evt.param1 or 12 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_16(context, evt)
	-- 将configid为 14 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 14, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_17(context, evt)
	if GadgetState.GearStart ~= evt.param1 or 13 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_17(context, evt)
	-- 将configid为 16 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 16, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_18(context, evt)
	if GadgetState.GearStart ~= evt.param1 or 11 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_18(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 220000018, suite = 1 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_19(context, evt)
	ScriptLib.PrintLog("enter condition judge")
	if GadgetState.GearStop ~= evt.param1 or 12 ~= evt.param2 then
	ScriptLib.PrintLog("judge false")
		return false
	end
	
	ScriptLib.PrintLog("judge true")
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_19(context, evt)
	-- 将configid为 14 的物件更改为状态 GadgetState.GearStop
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 14, GadgetState.GearStop) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_20(context, evt)
	ScriptLib.PrintLog("enter condition judge")
	if GadgetState.GearStop ~= evt.param1 or 13 ~= evt.param2 then
	ScriptLib.PrintLog("judge false")
		return false
	
	end
	
	ScriptLib.PrintLog("judge true")
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_20(context, evt)
	-- 将configid为 16 的物件更改为状态 GadgetState.GearStop
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 16, GadgetState.GearStop) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_21(context, evt)
	ScriptLib.PrintLog("Enter condition judge")
	if GadgetState.GearStop ~= evt.param1 or 11 ~= evt.param2 then
	ScriptLib.PrintLog("judge false")
		return false
	end
	
	ScriptLib.PrintLog("judge true")
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_21(context, evt)
	-- 将configid为 15 的物件更改为状态 GadgetState.GearStop
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 15, GadgetState.GearStop) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_22(context, evt)
	if 19 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_22(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {23}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_23(context, evt)
	-- 判断是gadgetid 19
	if 19 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_23(context, evt)
	-- 根据不同的选项做不同的操作
	if 23 == evt.param2 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 18 }) then
		return -1
	end
	if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 220000006, suite = 2 }) then
			return -1
		end
	if 0 ~= ScriptLib.DelWorktopOptionByGroupId(context, 220000005, 19,23 ) then
			return -1
		end
	
	end
	
	
	
		-- 重新生成指定group，指定suite
		
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_GATHER_24(context, evt)
	-- 创生gadget 22
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 22 }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_69(context, evt)
	if evt.param1 ~= 69 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_69(context, evt)
	-- 解锁目标18
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 18, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
