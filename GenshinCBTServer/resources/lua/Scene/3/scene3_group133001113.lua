--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 538, monster_id = 21010301, pos = { x = 1404.1, y = 236.3, z = -1462.7 }, rot = { x = 0.0, y = 104.2, z = 0.0 }, level = 11, drop_id = 303043, pose_id = 9003 },
	{ config_id = 539, monster_id = 21010201, pos = { x = 1428.2, y = 238.8, z = -1445.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 11, drop_id = 303043, pose_id = 9003 },
	{ config_id = 540, monster_id = 21010201, pos = { x = 1425.3, y = 237.6, z = -1460.2 }, rot = { x = 0.0, y = 302.2, z = 0.0 }, level = 11, drop_id = 303043, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1785, gadget_id = 70310001, pos = { x = 1417.3, y = 235.7, z = -1472.0 }, rot = { x = 0.0, y = 263.1, z = 0.0 }, level = 1 },
	{ config_id = 1786, gadget_id = 70310001, pos = { x = 1426.2, y = 237.7, z = -1453.8 }, rot = { x = 0.0, y = 275.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 1787, gadget_id = 70310001, pos = { x = 1408.1, y = 235.9, z = -1467.3 }, rot = { x = 0.0, y = 169.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 1789, gadget_id = 70210011, pos = { x = 1416.2, y = 237.5, z = -1455.0 }, rot = { x = 0.0, y = 32.3, z = 0.0 }, level = 1, chest_drop_id = 403303, showcutscene = true, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 114, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1416.2, y = 236.2, z = -1462.8 } },
	{ config_id = 115, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1421.1, y = 237.0, z = -1458.5 } },
	{ config_id = 295, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1421.6, y = 237.2, z = -1456.4 } },
	{ config_id = 296, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1421.6, y = 237.2, z = -1456.4 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_114", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_114", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_115", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_115", action = "action_EVENT_GADGET_STATE_CHANGE_115" },
	{ name = "CLIENT_EXECUTE_295", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_295", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_296", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_296", trigger_count = 0 }
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
		monsters = { 538, 539, 540 },
		gadgets = { 1785, 1786, 1787 },
		regions = { 114, 115, 295, 296 },
		triggers = { "CLIENT_EXECUTE_114", "GADGET_STATE_CHANGE_115", "CLIENT_EXECUTE_295", "CLIENT_EXECUTE_296" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_114(context, evt)
	-- 针对groupid为 133001113 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
		if evt.param1 == 1 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133001113, this_gadget, GadgetState.GearStart )
			return 0
		end
	
		if evt.param1 == 0 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133001113, this_gadget, GadgetState.Default )
			return 0
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_115(context, evt)
	if 1785 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_115(context, evt)
	-- 创生gadget 1789
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1789 }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_295(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_296(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	local this_group = ScriptLib.GetContextGroupId(context)
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.Default )
		return 0
	end
	return 0
end
