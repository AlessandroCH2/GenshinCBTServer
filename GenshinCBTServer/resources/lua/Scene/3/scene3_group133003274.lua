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
	{ config_id = 3020, gadget_id = 70900007, pos = { x = 2814.8, y = 305.8, z = -1585.8 }, rot = { x = 0.0, y = 178.9, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 3021, gadget_id = 70220020, pos = { x = 2810.5, y = 308.1, z = -1589.3 }, rot = { x = 0.0, y = 129.9, z = 0.0 }, level = 1 },
	{ config_id = 3022, gadget_id = 70220020, pos = { x = 2805.4, y = 308.1, z = -1593.9 }, rot = { x = 0.0, y = 128.7, z = 0.0 }, level = 1 },
	{ config_id = 3023, gadget_id = 70220020, pos = { x = 2810.6, y = 314.0, z = -1593.2 }, rot = { x = 0.0, y = 216.8, z = 0.0 }, level = 1 },
	{ config_id = 3024, gadget_id = 70220020, pos = { x = 2807.9, y = 314.0, z = -1589.6 }, rot = { x = 0.0, y = 87.5, z = 0.0 }, level = 1 },
	{ config_id = 3025, gadget_id = 70210031, pos = { x = 2808.7, y = 318.8, z = -1593.8 }, rot = { x = 0.0, y = 169.9, z = 0.0 }, level = 1, chest_drop_id = 403143, isOneoff = true },
	{ config_id = 3410, gadget_id = 70220013, pos = { x = 2807.7, y = 308.1, z = -1596.1 }, rot = { x = 0.0, y = 69.9, z = 0.0 }, level = 1 },
	{ config_id = 3411, gadget_id = 70220013, pos = { x = 2806.0, y = 314.0, z = -1589.7 }, rot = { x = 0.0, y = 257.3, z = 0.0 }, level = 1 },
	{ config_id = 3412, gadget_id = 70900201, pos = { x = 2808.9, y = 318.8, z = -1593.7 }, rot = { x = 0.0, y = 145.5, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 186, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2815.0, y = 305.8, z = -1585.6 } },
	{ config_id = 187, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2815.7, y = 305.7, z = -1587.8 } },
	{ config_id = 188, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2816.0, y = 305.8, z = -1584.9 } },
	{ config_id = 189, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2805.2, y = 315.8, z = -1594.4 } },
	{ config_id = 361, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2814.6, y = 305.7, z = -1587.1 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_186", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_186", action = "action_EVENT_GADGET_STATE_CHANGE_186", tlog_tag = "望风山地_274_元素机关挑战_开始" },
	{ name = "CHALLENGE_FAIL_187", event = EventType.EVENT_CHALLENGE_FAIL, source = "274", condition = "", action = "action_EVENT_CHALLENGE_FAIL_187" },
	{ name = "CHALLENGE_SUCCESS_188", event = EventType.EVENT_CHALLENGE_SUCCESS, source = "274", condition = "", action = "action_EVENT_CHALLENGE_SUCCESS_188", tlog_tag = "望风山地_274_元素机关挑战_结算" },
	{ name = "GADGET_STATE_CHANGE_189", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_189", action = "", tag = "20" },
	{ name = "CLIENT_EXECUTE_361", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_361", trigger_count = 0 }
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
		gadgets = { 3020, 3410, 3411 },
		regions = { 186, 187, 188, 189, 361 },
		triggers = { "GADGET_STATE_CHANGE_186", "CHALLENGE_FAIL_187", "CHALLENGE_SUCCESS_188", "GADGET_STATE_CHANGE_189", "CLIENT_EXECUTE_361" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_186(context, evt)
	if 3020 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_186(context, evt)
	-- 创建编号为274（该挑战的识别id),挑战内容为139的区域挑战，具体参数填写方式，见DungeonChallengeData表中的注释，所有填写的值都必须是int类型
	if 0 ~= ScriptLib.ActiveChallenge(context, 274, 139, 60, 7, 20, 1) then
		return -1
	end
	
	-- 创建id为3021的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3021 }) then
	  return -1
	end
	
	-- 创建id为3022的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3022 }) then
	  return -1
	end
	
	-- 创建id为3023的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3023 }) then
	  return -1
	end
	
	-- 创建id为3024的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3024 }) then
	  return -1
	end
	
	-- 创建id为3025的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3025 }) then
	  return -1
	end
	
	-- 创建id为3412的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3412 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_FAIL_187(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003274, suite = 1 }) then
			return -1
		end
	
	-- 将configid为 3020 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3020, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_SUCCESS_188(context, evt)
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 3412 }) then
		    return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_189(context, evt)
	if 3025 ~= evt.param2 or GadgetState.ChestOpened ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_361(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
