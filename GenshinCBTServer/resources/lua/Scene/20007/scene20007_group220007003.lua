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
	{ config_id = 4, gadget_id = 70380001, pos = { x = 13.1, y = 1.2, z = -10.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, route_id = 1 },
	{ config_id = 5, gadget_id = 70380001, pos = { x = 3.7, y = 25.1, z = 20.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, route_id = 2 },
	{ config_id = 6, gadget_id = 70360002, pos = { x = 1.9, y = 22.0, z = 11.5 }, rot = { x = 0.0, y = 70.1, z = 0.0 }, level = 1 },
	{ config_id = 9, gadget_id = 70220013, pos = { x = -3.0, y = 0.0, z = -0.8 }, rot = { x = 0.0, y = 97.0, z = 0.0 }, level = 1 },
	{ config_id = 10, gadget_id = 70220013, pos = { x = -3.2, y = 0.0, z = -3.7 }, rot = { x = 0.0, y = 189.4, z = 0.0 }, level = 1 },
	{ config_id = 25, gadget_id = 70520003, pos = { x = 3.3, y = 0.0, z = -11.8 }, rot = { x = 0.0, y = 80.9, z = 0.0 }, level = 1 },
	{ config_id = 27, gadget_id = 70210053, pos = { x = -3.8, y = 21.0, z = 6.1 }, rot = { x = 0.0, y = 243.5, z = 0.0 }, level = 1, chest_drop_id = 403224, state = GadgetState.ChestBramble },
	{ config_id = 31, gadget_id = 70310001, pos = { x = -3.3, y = 21.0, z = 9.7 }, rot = { x = 0.0, y = 189.9, z = 0.0 }, level = 1 },
	{ config_id = 43, gadget_id = 70220005, pos = { x = -0.3, y = 21.0, z = 12.2 }, rot = { x = 0.0, y = 151.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 4, shape = RegionShape.SPHERE, radius = 3, pos = { x = -10.1, y = 21.0, z = 15.6 } },
	{ config_id = 5, shape = RegionShape.SPHERE, radius = 5, pos = { x = 21.2, y = 21.5, z = 17.8 } },
	{ config_id = 6, shape = RegionShape.SPHERE, radius = 5, pos = { x = -11.3, y = 21.0, z = 6.1 } },
	{ config_id = 15, shape = RegionShape.SPHERE, radius = 5, pos = { x = 3.4, y = 21.0, z = 13.3 } },
	{ config_id = 18, shape = RegionShape.SPHERE, radius = 5, pos = { x = 3.4, y = 21.0, z = 13.3 } },
	{ config_id = 23, shape = RegionShape.SPHERE, radius = 5, pos = { x = 3.4, y = 21.0, z = 13.3 } },
	{ config_id = 26, shape = RegionShape.SPHERE, radius = 5, pos = { x = -10.2, y = 21.0, z = 7.2 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_CREATE_4", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_4", action = "action_EVENT_GADGET_CREATE_4", trigger_count = 0 },
	{ name = "SELECT_OPTION_5", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_5", action = "action_EVENT_SELECT_OPTION_5", trigger_count = 0 },
	{ name = "ENTER_REGION_6", event = EventType.EVENT_ENTER_REGION, source = "4", condition = "condition_EVENT_ENTER_REGION_6", action = "action_EVENT_ENTER_REGION_6", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_15", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_15", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_18", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_18", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_23", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_23", trigger_count = 0 },
	{ name = "ENTER_REGION_26", event = EventType.EVENT_ENTER_REGION, source = "4", condition = "condition_EVENT_ENTER_REGION_26", action = "action_EVENT_ENTER_REGION_26", trigger_count = 0 }
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
		gadgets = { 4, 5, 6, 9, 10, 25, 27, 31 },
		regions = { 4, 5, 6, 15, 18, 23, 26 },
		triggers = { "GADGET_CREATE_4", "SELECT_OPTION_5", "ENTER_REGION_6", "CLIENT_EXECUTE_15", "CLIENT_EXECUTE_18", "CLIENT_EXECUTE_23", "ENTER_REGION_26" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_CREATE_4(context, evt)
	if 6 ~= evt.param1 then
			return false
		end
		
		return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_4(context, evt)
	-- 设置操作台选项
		if 0 ~= ScriptLib.SetWorktopOptions(context, {1,4,5,6}) then
			return -1
		end
		
		return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_5(context, evt)
	if 6 ~= evt.param1 then
			return false
		end
		local x = evt.param2
		ScriptLib.PrintLog("id="..x)
		return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_5(context, evt)
	-- 启动移动平台
		if 1 == evt.param2 then 
			if 0 == ScriptLib.StartPlatform(context, 5) then
				ScriptLib.PrintLog("##StartPlatform##")
			end
		elseif 4 == evt.param2 then
			if 0 == ScriptLib.StopPlatform(context, 5) then
				ScriptLib.PrintLog("##StopPlatform##")
			end
		elseif 5 == evt.param2 then
			if 0 == ScriptLib.SetPlatformRouteId(context, 5, 3) then
				ScriptLib.PrintLog("##ChangeRoute3##")
			end
		elseif 6 == evt.param2 then
			if 0 == ScriptLib.SetPlatformRouteId(context, 5, 2) then
				ScriptLib.PrintLog("##ChangeRoute2##")
			end
		else 
		  return -1
		end
		
		return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_6(context, evt)
	if evt.param1 ~= 6 then return false end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_6(context, evt)
	ScriptLib.PrintLog("##EnterRegion")
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_15(context, evt)
	-- 针对groupid为 133005011 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	--ScriptLib.PrintLog("config_id="..this_gadget)
	if evt.param1 == 1 then
	ScriptLib.SetGroupGadgetStateByConfigId(context, 133005011, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
	ScriptLib.SetGroupGadgetStateByConfigId(context, 133005011, this_gadget, GadgetState.Default )
		return 0
	end
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_18(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		ScriptLib.SetGroupGadgetStateByConfigId(context, 0, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_23(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, 0, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, 0, this_gadget, GadgetState.Defautl )
		return 0
	end
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_26(context, evt)
	ScriptLib.PrintLog("condition_start")
	if evt.param1 ~= 26 then return false end
	
	if 5 ~= evt.param2 then
		return false
	end
	
	ScriptLib.PrintLog("condition_end")
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_26(context, evt)
	ScriptLib.PrintLog("action_start")
	if 0 ~= ScriptLib.CreateGadget(context, {config_id = 43}) then
	    return -1
	end
	ScriptLib.PrintLog("action_end")
	return 0
end
