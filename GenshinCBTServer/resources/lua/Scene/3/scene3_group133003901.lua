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
}

-- 区域
regions = {
	{ config_id = 24, shape = RegionShape.SPHERE, radius = 10, pos = { x = 2613.4, y = 235.5, z = -1485.9 } },
	{ config_id = 27, shape = RegionShape.SPHERE, radius = 8, pos = { x = 2563.6, y = 213.5, z = -1330.2 } },
	{ config_id = 35, shape = RegionShape.SPHERE, radius = 25, pos = { x = 2599.9, y = 223.8, z = -1588.6 } },
	{ config_id = 36, shape = RegionShape.SPHERE, radius = 13, pos = { x = 2617.6, y = 216.0, z = -1606.1 } },
	{ config_id = 38, shape = RegionShape.SPHERE, radius = 17, pos = { x = 2296.9, y = 210.3, z = -1126.8 } },
	{ config_id = 39, shape = RegionShape.SPHERE, radius = 40, pos = { x = 2474.7, y = 202.2, z = -1222.7 } },
	{ config_id = 40, shape = RegionShape.CUBIC, size = { x = 40.0, y = 9.0, z = 30.0 }, pos = { x = 2607.6, y = 227.1, z = -1553.8 } },
	{ config_id = 68, shape = RegionShape.SPHERE, radius = 25, pos = { x = 2621.8, y = 229.8, z = -1499.4 } },
	{ config_id = 75, shape = RegionShape.SPHERE, radius = 40, pos = { x = 2362.9, y = 206.4, z = -1138.1 } },
	{ config_id = 76, shape = RegionShape.SPHERE, radius = 12, pos = { x = 2635.8, y = 391.8, z = -1713.7 } },
	{ config_id = 84, shape = RegionShape.SPHERE, radius = 7, pos = { x = 2740.0, y = 194.6, z = -1710.3 } },
	{ config_id = 147, shape = RegionShape.SPHERE, radius = 17.1, pos = { x = 2308.3, y = 208.3, z = -1140.1 } },
	{ config_id = 463, shape = RegionShape.CUBIC, size = { x = 60.0, y = 10.0, z = 20.0 }, pos = { x = 2170.7, y = 205.3, z = -1085.9 } },
	{ config_id = 502, shape = RegionShape.SPHERE, radius = 15, pos = { x = 2596.4, y = 233.1, z = -1493.3 } },
	{ config_id = 504, shape = RegionShape.SPHERE, radius = 7, pos = { x = 2682.8, y = 197.5, z = -1639.5 } },
	{ config_id = 505, shape = RegionShape.SPHERE, radius = 15, pos = { x = 2694.9, y = 194.5, z = -1660.6 } },
	{ config_id = 512, shape = RegionShape.SPHERE, radius = 10, pos = { x = 2192.8, y = 215.0, z = -1124.1 } },
	{ config_id = 513, shape = RegionShape.SPHERE, radius = 25, pos = { x = 2215.0, y = 224.0, z = -1188.5 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_24", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_24", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_27", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_27", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_35", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_35", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_36", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_36", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_38", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_38", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_39", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_39", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_40", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_40", action = "action_EVENT_ENTER_REGION_40", trigger_count = 0 },
	{ name = "ENTER_REGION_68", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_68", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_75", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_75", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_76", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_76", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_84", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_84", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_147", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_147", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_463", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_463", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_502", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_502", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_504", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_504", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_505", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_505", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_512", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_512", action = "", trigger_count = 0 },
	{ name = "ENTER_REGION_513", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_513", action = "", trigger_count = 0 }
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
		-- description = suite_1,
		monsters = { },
		gadgets = { },
		regions = { 24, 27, 35, 36, 38, 39, 40, 68, 75, 76, 84, 147, 463, 502, 504, 505, 512, 513 },
		triggers = { "ENTER_REGION_24", "ENTER_REGION_27", "ENTER_REGION_35", "ENTER_REGION_36", "ENTER_REGION_38", "ENTER_REGION_39", "ENTER_REGION_40", "ENTER_REGION_68", "ENTER_REGION_75", "ENTER_REGION_76", "ENTER_REGION_84", "ENTER_REGION_147", "ENTER_REGION_463", "ENTER_REGION_502", "ENTER_REGION_504", "ENTER_REGION_505", "ENTER_REGION_512", "ENTER_REGION_513" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_24(context, evt)
	-- 判断角色数量不少于1
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 35201) == QuestState.UNFINISHED and evt.param1 == 24 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_27(context, evt)
	-- 判断角色数量不少于1
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 35204) == QuestState.UNFINISHED and evt.param1 == 27 then
		return true
	end
	return false
	
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_35(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 35102) == QuestState.UNFINISHED and evt.param1 == 35 then
			return true
		end
		return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_36(context, evt)
	-- 判断角色数量不少于1
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and (ScriptLib.GetQuestState(context, evt.target_eid, 35103) == QuestState.UNFINISHED or ScriptLib.GetQuestState(context, evt.target_eid, 35105) == QuestState.UNFINISHED) 
	and evt.param1 == 36 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_38(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 35401) == QuestState.UNFINISHED and evt.param1 == 38 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_39(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 36100) == QuestState.UNFINISHED and evt.param1 == 39 then
			return true
		end
		return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_40(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 36203) == QuestState.UNFINISHED and evt.param1 == 40 then
			return true
		end
		return false
end

-- 触发操作
function action_EVENT_ENTER_REGION_40(context, evt)
	-- 触发镜头注目，注目位置为坐标（2599，230，-5642），持续时间为2.6秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=2599, y=230, z=-5642}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2.6, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_68(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 35200) == QuestState.UNFINISHED and evt.param1 == 68 then
			return true
		end
		return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_75(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 35502) == QuestState.UNFINISHED and evt.param1 == 75 then
			return true
		end
		return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_76(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 38401) == QuestState.UNFINISHED and evt.param1 == 76 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_84(context, evt)
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 35100) == QuestState.UNFINISHED and evt.param1 == 84 then
			return true
		end
		return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_147(context, evt)
	ScriptLib.PrintLog("enter region")
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 46201) == QuestState.UNFINISHED and evt.param1 == 147 then
	 return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_463(context, evt)
	ScriptLib.PrintLog("enter region")
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 46701) == QuestState.UNFINISHED and evt.param1 == 463 then
	 return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_502(context, evt)
	-- 判断角色数量不少于1
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 35201) == QuestState.UNFINISHED and evt.param1 == 502 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_504(context, evt)
	-- 判断角色数量不少于1
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 35101) == QuestState.UNFINISHED and evt.param1 == 504 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_505(context, evt)
	-- 判断角色数量不少于1
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 35107) == QuestState.UNFINISHED and evt.param1 == 505 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_512(context, evt)
	-- 判断角色数量不少于1
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 35403) == QuestState.UNFINISHED and evt.param1 == 512 then
		return true
	end
	return false
end

-- 触发操作

-- 触发条件
function condition_EVENT_ENTER_REGION_513(context, evt)
	-- 判断角色数量不少于1
	if ScriptLib.GetEntityType(evt.target_eid) == EntityType.AVATAR and ScriptLib.GetQuestState(context, evt.target_eid, 36002) == QuestState.UNFINISHED and evt.param1 == 513 then
		return true
	end
	return false
end

-- 触发操作
