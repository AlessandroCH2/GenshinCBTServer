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
	{ config_id = 377, gadget_id = 70220008, pos = { x = 2263.9, y = 271.1, z = -263.8 }, rot = { x = 357.0, y = 159.4, z = 179.3 }, level = 1 },
	{ config_id = 378, gadget_id = 70710002, pos = { x = 2263.0, y = 270.4, z = -264.4 }, rot = { x = 0.0, y = 208.4, z = 0.0 }, level = 1, route_id = 3004509, save_route = true }
}

-- 区域
regions = {
	{ config_id = 127, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2263.9, y = 271.0, z = -264.3 } },
	{ config_id = 136, shape = RegionShape.SPHERE, radius = 4, pos = { x = 2263.5, y = 271.2, z = -263.9 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_127", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "", action = "action_EVENT_ANY_GADGET_DIE_127", tlog_tag = "奔狼岭_98_谜题破解_结算" },
	{ name = "ENTER_REGION_136", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_136", action = "action_EVENT_ENTER_REGION_136" }
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
		gadgets = { 377, 378 },
		regions = { 127, 136 },
		triggers = { "ANY_GADGET_DIE_127", "ENTER_REGION_136" },
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
function action_EVENT_ANY_GADGET_DIE_127(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 378, 3004510) then
	  return -1
	end
	
	-- 调用提示id为 1043 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1043) then
		return -1
	end
	
	-- 延迟1秒后,向groupId为：133004088的对象,请求一次调用,并将string参数："num_1" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133004088, "num_1", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_136(context, evt)
	if evt.param1 ~= 136 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_136(context, evt)
	-- 调用提示id为 1042 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1042) then
		return -1
	end
	
	return 0
end
