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
	{ config_id = 34, gadget_id = 70900028, pos = { x = -13.4, y = 0.0, z = -80.6 }, rot = { x = 0.0, y = 0.3, z = 0.0 }, level = 1 },
	{ config_id = 35, gadget_id = 70900027, pos = { x = -13.4, y = 0.5, z = -60.0 }, rot = { x = 0.0, y = 0.3, z = 0.0 }, level = 1 },
	{ config_id = 36, gadget_id = 70950001, pos = { x = -8.2, y = 14.4, z = -86.0 }, rot = { x = 0.0, y = 57.7, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 32, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1.4, y = 0.5, z = -97.2 } },
	{ config_id = 33, shape = RegionShape.SPHERE, radius = 10, pos = { x = -13.4, y = 0.4, z = -80.8 } },
	{ config_id = 34, shape = RegionShape.SPHERE, radius = 5, pos = { x = -12.4, y = 0.5, z = -45.7 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_32", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_32", trigger_count = 0 },
	{ name = "ENTER_REGION_33", event = EventType.EVENT_ENTER_REGION, source = "4", condition = "", action = "action_EVENT_ENTER_REGION_33" },
	{ name = "ENTER_REGION_34", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_34", action = "action_EVENT_ENTER_REGION_34", trigger_count = 0 }
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
		gadgets = { 34, 35, 36 },
		regions = { 32, 33, 34 },
		triggers = { "CLIENT_EXECUTE_32", "ENTER_REGION_33", "ENTER_REGION_34" },
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
function action_EVENT_CLIENT_EXECUTE_32(context, evt)
	-- 针对groupid为 220000009 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
		if evt.param1 == 1 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 220000009, this_gadget, GadgetState.GearStart )
			return 0
		end
	
		if evt.param1 == 0 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 220000009, this_gadget, GadgetState.Default )
			return 0
		end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_ENTER_REGION_33(context, evt)
	-- 将configid为 34 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 34, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 35 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 35, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_34(context, evt)
	if evt.param1 ~= 34 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_34(context, evt)
	-- 重新生成指定group，默认为独立随机
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 220000009 }) then
			return -1
		end
	
	return 0
end
