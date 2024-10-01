--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 19, monster_id = 20010901, pos = { x = 169.1, y = 57.0, z = 335.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 20, monster_id = 21010301, pos = { x = 166.1, y = 57.0, z = 335.9 }, rot = { x = 0.0, y = 168.6, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 21, monster_id = 21010301, pos = { x = 172.3, y = 57.0, z = 340.5 }, rot = { x = 0.0, y = 181.9, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 22, monster_id = 20011501, pos = { x = 214.4, y = 57.0, z = 336.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 23, monster_id = 20011401, pos = { x = 216.4, y = 57.0, z = 339.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 24, monster_id = 20011401, pos = { x = 212.5, y = 57.0, z = 339.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 37, gadget_id = 70900007, pos = { x = 186.0, y = 58.4, z = 344.2 }, rot = { x = 0.0, y = 180.6, z = 0.0 }, level = 1 },
	{ config_id = 76, gadget_id = 70900008, pos = { x = 197.1, y = 58.5, z = 344.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 20, shape = RegionShape.SPHERE, radius = 5, pos = { x = 187.8, y = 58.5, z = 342.9 } },
	{ config_id = 21, shape = RegionShape.SPHERE, radius = 5, pos = { x = 196.2, y = 58.5, z = 343.1 } },
	{ config_id = 22, shape = RegionShape.SPHERE, radius = 5, pos = { x = 191.7, y = 58.0, z = 341.4 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_20", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_20", action = "action_EVENT_GADGET_STATE_CHANGE_20" },
	{ name = "GADGET_STATE_CHANGE_21", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_21", action = "action_EVENT_GADGET_STATE_CHANGE_21" },
	{ name = "VARIABLE_CHANGE_22", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_22", action = "action_EVENT_VARIABLE_CHANGE_22" }
}

-- 变量
variables = {
	{ name = "Key", value = 0, persistent = false }
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
		monsters = { },
		gadgets = { 37, 76 },
		regions = { 20, 21, 22 },
		triggers = { "GADGET_STATE_CHANGE_20", "GADGET_STATE_CHANGE_21", "VARIABLE_CHANGE_22" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_20(context, evt)
	if 37 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_20(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_21(context, evt)
	if 76 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_21(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_22(context, evt)
	-- 判断变量"Key"为2
	if ScriptLib.GetGroupVariableValue(context, "Key") ~= 2 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_22(context, evt)
	-- 改变指定group组250001003中， configid为34的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 250001003, 34, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end
