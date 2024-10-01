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
	{ config_id = 43, gadget_id = 70900025, pos = { x = 42.3, y = 1.7, z = -29.7 }, rot = { x = 0.0, y = 335.5, z = 0.0 }, level = 1 },
	{ config_id = 44, gadget_id = 70900025, pos = { x = 36.4, y = 2.4, z = -29.9 }, rot = { x = 0.0, y = 146.8, z = 0.0 }, level = 1 },
	{ config_id = 45, gadget_id = 70900025, pos = { x = 30.8, y = 1.7, z = -29.3 }, rot = { x = 0.0, y = 217.1, z = 0.0 }, level = 1 },
	{ config_id = 46, gadget_id = 70900027, pos = { x = 31.0, y = 5.3, z = -29.4 }, rot = { x = 0.0, y = 343.8, z = 0.0 }, level = 1 },
	{ config_id = 47, gadget_id = 70210007, pos = { x = 36.5, y = 5.9, z = -29.8 }, rot = { x = 0.0, y = 81.5, z = 0.0 }, level = 1, chest_drop_id = 1100302, state = GadgetState.ChestBramble },
	{ config_id = 48, gadget_id = 70220005, pos = { x = 42.6, y = 5.2, z = -29.7 }, rot = { x = 0.0, y = 299.4, z = 0.0 }, level = 1 },
	{ config_id = 49, gadget_id = 70900036, pos = { x = 20.7, y = 0.5, z = -39.4 }, rot = { x = 0.0, y = 296.4, z = 0.0 }, level = 1 },
	{ config_id = 50, gadget_id = 70360002, pos = { x = 29.6, y = 0.5, z = -41.5 }, rot = { x = 0.0, y = 266.7, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 35, shape = RegionShape.SPHERE, radius = 5, pos = { x = 36.5, y = 4.6, z = -30.6 } },
	{ config_id = 36, shape = RegionShape.SPHERE, radius = 5, pos = { x = 36.8, y = 5.9, z = -30.6 } },
	{ config_id = 38, shape = RegionShape.SPHERE, radius = 5, pos = { x = 29.8, y = 0.5, z = -41.8 } },
	{ config_id = 39, shape = RegionShape.SPHERE, radius = 5, pos = { x = 29.6, y = 0.5, z = -41.3 } },
	{ config_id = 47, shape = RegionShape.SPHERE, radius = 5, pos = { x = 51.8, y = 0.5, z = -32.8 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_35", event = EventType.EVENT_CLIENT_EXECUTE, source = "Chest_Bramble_Remove", condition = "", action = "action_EVENT_CLIENT_EXECUTE_35", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_36", event = EventType.EVENT_CLIENT_EXECUTE, source = "Chest_Frozen_Remove", condition = "", action = "action_EVENT_CLIENT_EXECUTE_36", trigger_count = 0 },
	{ name = "GADGET_CREATE_38", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_38", action = "action_EVENT_GADGET_CREATE_38", trigger_count = 0 },
	{ name = "SELECT_OPTION_39", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_39", action = "action_EVENT_SELECT_OPTION_39", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_47", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_47", action = "action_EVENT_GADGET_STATE_CHANGE_47", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "Sculpture_State", value = 0, persistent = true }
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
		gadgets = { 43, 44, 45, 46, 47, 48, 49, 50 },
		regions = { 35, 36, 38, 39, 47 },
		triggers = { "CLIENT_EXECUTE_35", "CLIENT_EXECUTE_36", "GADGET_CREATE_38", "SELECT_OPTION_39", "GADGET_STATE_CHANGE_47" },
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
function action_EVENT_CLIENT_EXECUTE_35(context, evt)
	--由entityId获取configId
		local This_configID = ScriptLib.GetConfigIdByEntityId(context, evt.param1 )
		--转换对应宝箱状态
		if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 0, This_configID, GadgetState.Default ) then
		    return -1
		end
		return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_36(context, evt)
		--由entityId获取configId
		This_configID = ScriptLib.GetConfigIdByEntityId(context, evt.param1 )
		--转换对应宝箱状态
		if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 0, This_configID, GadgetState.Default ) then
		    return -1
		end
		return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_38(context, evt)
	if 50 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_38(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {1,4}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_39(context, evt)
	if evt.param1 == 50 then
			return true
		end
		return false
end

-- 触发操作
function action_EVENT_SELECT_OPTION_39(context, evt)
	local state = ScriptLib.GetGroupVariableValue(context, "Sculpture_State")
			-- 根据不同的选项做不同的操作
			if 1 == evt.param2 then
				if state == 0 then
					ScriptLib.SetGadgetStateByConfigId(context, 49, GadgetState.GearStart)
				elseif state == 201 then
					ScriptLib.SetGadgetStateByConfigId(context, 49, GadgetState.GearStop)
				elseif state == 202 then
					ScriptLib.SetGadgetStateByConfigId(context, 49, GadgetState.Default)
				end 
			elseif 4 == evt.param2 then
				if state == 0 then
					ScriptLib.SetGadgetStateByConfigId(context, 49, GadgetState.GearStop)
				elseif state == 201 then
					ScriptLib.SetGadgetStateByConfigId(context, 49, GadgetState.Default)
				elseif state == 202 then
					ScriptLib.SetGadgetStateByConfigId(context, 49, GadgetState.GearStart)
				end 
			end
			
			return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_47(context, evt)
	if evt.param2 ~= 49 then
		return false
	else return true
	end
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_47(context, evt)
	if evt.param1 == GadgetState.Default then
			ScriptLib.SetGroupVariableValue(context, "Sculpture_State", 0)
		elseif evt.param1 == GadgetState.GearStart then
			ScriptLib.SetGroupVariableValue(context, "Sculpture_State", 201)
		elseif evt.param1 == GadgetState.GearStop then
			ScriptLib.SetGroupVariableValue(context, "Sculpture_State", 202)
		end
	
		return 0
end
