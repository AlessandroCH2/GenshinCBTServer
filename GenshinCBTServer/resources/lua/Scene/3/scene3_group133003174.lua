--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 685, monster_id = 21010101, pos = { x = 2450.9, y = 296.3, z = -1614.6 }, rot = { x = 0.0, y = 87.0, z = 0.0 }, level = 6, drop_id = 303042, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2823, gadget_id = 70710002, pos = { x = 2453.3, y = 297.0, z = -1614.3 }, rot = { x = 0.0, y = 327.6, z = 0.0 }, level = 1, route_id = 3003153, save_route = true },
	{ config_id = 2824, gadget_id = 70210031, pos = { x = 2402.3, y = 303.1, z = -1635.2 }, rot = { x = 4.4, y = 275.0, z = 1.8 }, level = 1, chest_drop_id = 403223, showcutscene = true, isOneoff = true },
	{ config_id = 2825, gadget_id = 70220014, pos = { x = 2453.4, y = 296.6, z = -1614.1 }, rot = { x = 0.0, y = 81.2, z = 0.0 }, level = 1 },
	{ config_id = 3749, gadget_id = 70710002, pos = { x = 2399.8, y = 304.2, z = -1628.5 }, rot = { x = 0.0, y = 254.8, z = 0.0 }, level = 1, route_id = 3003208, save_route = true }
}

-- 区域
regions = {
	{ config_id = 139, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2453.5, y = 296.6, z = -1614.2 } },
	{ config_id = 140, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2399.1, y = 302.5, z = -1629.1 } },
	{ config_id = 332, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2394.6, y = 302.0, z = -1632.1 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_139", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_139", action = "action_EVENT_ANY_GADGET_DIE_139", tlog_tag = "神殿_精灵草_木桶_开始" },
	{ name = "ENTER_REGION_140", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_140", action = "action_EVENT_ENTER_REGION_140" },
	{ name = "CLIENT_EXECUTE_332", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_332", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "des", value = 0, persistent = true }
}

--================================================================
-- 
-- 初始化配置
-- 
--================================================================

-- 初始化时创建
init_config = {
	suite = 1,
	rand_suite = false,
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
		monsters = { 685 },
		gadgets = { 2823, 2825 },
		regions = { 139, 140, 332 },
		triggers = { "ANY_GADGET_DIE_139", "ENTER_REGION_140", "CLIENT_EXECUTE_332" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { 2824, 3749 },
		regions = { },
		triggers = { },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_139(context, evt)
	if 2825 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_139(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 2823, 3003154) then
	  return -1
	end
	
	-- 将本组内变量名为 "des" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "des", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_140(context, evt)
	if evt.param1 ~= 140 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"des"为1
	if ScriptLib.GetGroupVariableValue(context, "des") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_140(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003174, suite = 2 }) then
			return -1
		end
	
	-- 将configid为 2820 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2820, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_332(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
