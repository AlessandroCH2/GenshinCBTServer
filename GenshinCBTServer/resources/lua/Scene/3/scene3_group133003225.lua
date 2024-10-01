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
	{ config_id = 3272, gadget_id = 70310001, pos = { x = 2742.9, y = 272.8, z = -1515.2 }, rot = { x = 0.0, y = 147.4, z = 0.0 }, level = 1 },
	{ config_id = 3273, gadget_id = 70310001, pos = { x = 2738.0, y = 273.2, z = -1510.6 }, rot = { x = 0.0, y = 110.4, z = 0.0 }, level = 1 },
	{ config_id = 3274, gadget_id = 70310001, pos = { x = 2730.9, y = 273.5, z = -1512.2 }, rot = { x = 0.0, y = 36.4, z = 0.0 }, level = 1 },
	{ config_id = 3275, gadget_id = 70310001, pos = { x = 2727.2, y = 274.1, z = -1506.5 }, rot = { x = 0.0, y = 214.3, z = 0.0 }, level = 1 },
	{ config_id = 3276, gadget_id = 70310001, pos = { x = 2720.0, y = 274.2, z = -1507.0 }, rot = { x = 0.0, y = 196.2, z = 0.0 }, level = 1 },
	{ config_id = 3277, gadget_id = 70310001, pos = { x = 2717.9, y = 275.3, z = -1500.9 }, rot = { x = 0.0, y = 85.4, z = 0.0 }, level = 1 },
	{ config_id = 3278, gadget_id = 70310001, pos = { x = 2709.6, y = 274.8, z = -1501.0 }, rot = { x = 0.0, y = 357.1, z = 0.0 }, level = 1 },
	{ config_id = 3279, gadget_id = 70210032, pos = { x = 2699.7, y = 279.0, z = -1493.1 }, rot = { x = 0.0, y = 112.4, z = 0.0 }, level = 1, chest_drop_id = 403223, state = GadgetState.ChestLocked, isOneoff = true },
	{ config_id = 3280, gadget_id = 70900007, pos = { x = 2757.5, y = 274.8, z = -1510.4 }, rot = { x = 0.0, y = 266.2, z = 0.0 }, level = 1, persistent = true },
	{ config_id = 3378, gadget_id = 70900201, pos = { x = 2699.2, y = 278.8, z = -1492.9 }, rot = { x = 0.0, y = 326.7, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 238, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2757.5, y = 274.9, z = -1511.4 } },
	{ config_id = 239, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2756.7, y = 274.7, z = -1509.4 } },
	{ config_id = 240, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2759.1, y = 274.5, z = -1509.8 } },
	{ config_id = 254, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2762.3, y = 272.0, z = -1520.6 } },
	{ config_id = 255, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2770.4, y = 273.6, z = -1516.0 } },
	{ config_id = 261, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2743.2, y = 274.5, z = -1515.1 } },
	{ config_id = 262, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2737.5, y = 273.2, z = -1510.8 } },
	{ config_id = 263, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2730.4, y = 273.5, z = -1511.9 } },
	{ config_id = 264, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2726.8, y = 274.2, z = -1506.1 } },
	{ config_id = 265, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2719.3, y = 274.3, z = -1506.8 } },
	{ config_id = 266, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2717.9, y = 275.5, z = -1500.3 } },
	{ config_id = 267, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2708.2, y = 274.7, z = -1500.9 } },
	{ config_id = 355, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2759.6, y = 274.5, z = -1511.8 } },
	{ config_id = 356, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2759.6, y = 274.5, z = -1511.8 } },
	{ config_id = 433, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2759.6, y = 274.5, z = -1511.8 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_238", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_238", action = "action_EVENT_GADGET_STATE_CHANGE_238", tlog_tag = "望风山地_225_元素机关挑战_开始" },
	{ name = "CHALLENGE_FAIL_239", event = EventType.EVENT_CHALLENGE_FAIL, source = "225", condition = "", action = "action_EVENT_CHALLENGE_FAIL_239" },
	{ name = "CHALLENGE_SUCCESS_240", event = EventType.EVENT_CHALLENGE_SUCCESS, source = "225", condition = "", action = "action_EVENT_CHALLENGE_SUCCESS_240", tlog_tag = "望风山地_225_元素机关挑战_结算" },
	{ name = "GADGET_STATE_CHANGE_254", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_254", action = "", tag = "22" },
	{ name = "CLIENT_EXECUTE_255", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_255", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_261", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_261", action = "action_EVENT_GADGET_STATE_CHANGE_261" },
	{ name = "GADGET_STATE_CHANGE_262", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_262", action = "action_EVENT_GADGET_STATE_CHANGE_262" },
	{ name = "GADGET_STATE_CHANGE_263", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_263", action = "action_EVENT_GADGET_STATE_CHANGE_263" },
	{ name = "GADGET_STATE_CHANGE_264", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_264", action = "action_EVENT_GADGET_STATE_CHANGE_264" },
	{ name = "GADGET_STATE_CHANGE_265", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_265", action = "action_EVENT_GADGET_STATE_CHANGE_265" },
	{ name = "GADGET_STATE_CHANGE_266", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_266", action = "action_EVENT_GADGET_STATE_CHANGE_266" },
	{ name = "GADGET_STATE_CHANGE_267", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_267", action = "action_EVENT_GADGET_STATE_CHANGE_267" },
	{ name = "CLIENT_EXECUTE_355", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_355", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_356", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_356", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_433", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_433", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "num_1", value = 0, persistent = true }
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
		gadgets = { 3280 },
		regions = { 238, 239, 240, 254, 255, 261, 262, 263, 264, 265, 266, 267, 355, 356, 433 },
		triggers = { "GADGET_STATE_CHANGE_238", "CHALLENGE_FAIL_239", "CHALLENGE_SUCCESS_240", "GADGET_STATE_CHANGE_254", "CLIENT_EXECUTE_255", "GADGET_STATE_CHANGE_261", "GADGET_STATE_CHANGE_262", "GADGET_STATE_CHANGE_263", "GADGET_STATE_CHANGE_264", "GADGET_STATE_CHANGE_265", "GADGET_STATE_CHANGE_266", "GADGET_STATE_CHANGE_267", "CLIENT_EXECUTE_355", "CLIENT_EXECUTE_356", "CLIENT_EXECUTE_433" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_238(context, evt)
	if 3280 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_238(context, evt)
	-- 创建编号为225（该挑战的识别id),挑战内容为143的区域挑战，具体参数填写方式，见DungeonChallengeData表中的注释，所有填写的值都必须是int类型
	if 0 ~= ScriptLib.ActiveChallenge(context, 225, 143, 60, 7, 22, 1) then
		return -1
	end
	
	-- 创建id为3272的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3272 }) then
	  return -1
	end
	
	-- 创建id为3273的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3273 }) then
	  return -1
	end
	
	-- 创建id为3274的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3274 }) then
	  return -1
	end
	
	-- 创建id为3275的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3275 }) then
	  return -1
	end
	
	-- 创建id为3276的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3276 }) then
	  return -1
	end
	
	-- 创建id为3277的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3277 }) then
	  return -1
	end
	
	-- 创建id为3278的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3278 }) then
	  return -1
	end
	
	-- 创建id为3279的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3279 }) then
	  return -1
	end
	
	-- 创建id为3378的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3378 }) then
	  return -1
	end
	
	-- 变量"num_1"赋值为0
	ScriptLib.SetGroupVariableValue(context, "num_1", 0)
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_FAIL_239(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003225, suite = 1 }) then
			return -1
		end
	
	-- 将configid为 3280 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3280, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_SUCCESS_240(context, evt)
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 3378 }) then
		    return -1
		end
		
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_254(context, evt)
	if 3279 ~= evt.param2 or GadgetState.ChestOpened ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_255(context, evt)
	-- 针对groupid为 133003225 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
		if evt.param1 == 1 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133003225, this_gadget, GadgetState.GearStart )
			return 0
		end
	
		if evt.param1 == 0 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 133003225, this_gadget, GadgetState.Default )
			return 0
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_261(context, evt)
	if 3272 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_261(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1")
	local c_num = c_num_1 +1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num) then
	  return -1
	end
	
	if c_num == 7 then
		if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3279, state = GadgetState.Default }) then
			return -1
		end
	end
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_262(context, evt)
	if 3273 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_262(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1")
	local c_num = c_num_1 +1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num) then
	  return -1
	end
	
	if c_num == 7 then
		if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3279, state = GadgetState.Default }) then
			return -1
		end
	end
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_263(context, evt)
	if 3274 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_263(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1")
	local c_num = c_num_1 +1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num) then
	  return -1
	end
	
	if c_num == 7 then
		if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3279, state = GadgetState.Default }) then
			return -1
		end
	end
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_264(context, evt)
	if 3275 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_264(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1")
	local c_num = c_num_1 +1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num) then
	  return -1
	end
	
	if c_num == 7 then
		if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3279, state = GadgetState.Default }) then
			return -1
		end
	end
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_265(context, evt)
	if 3276 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_265(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1")
	local c_num = c_num_1 +1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num) then
	  return -1
	end
	
	if c_num == 7 then
		if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3279, state = GadgetState.Default }) then
			return -1
		end
	end
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_266(context, evt)
	if 3277 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_266(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1")
	local c_num = c_num_1 +1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num) then
	  return -1
	end
	
	if c_num == 7 then
		if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3279, state = GadgetState.Default }) then
			return -1
		end
	end
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_267(context, evt)
	if 3278 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_267(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1")
	local c_num = c_num_1 +1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num) then
	  return -1
	end
	
	if c_num == 7 then
		if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3279, state = GadgetState.Default }) then
			return -1
		end
	end
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_355(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_356(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	local this_group = ScriptLib.GetContextGroupId(context)
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.Defautl )
		return 0
	end
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_433(context, evt)
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
