--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1, monster_id = 29010102, pos = { x = 0.0, y = -40.0, z = 0.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1, gadget_id = 42901021, pos = { x = 0.0, y = 0.0, z = 0.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2, gadget_id = 42901022, pos = { x = 0.0, y = 0.0, z = 0.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3, gadget_id = 42901023, pos = { x = 0.0, y = 0.0, z = 0.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 4, gadget_id = 42901024, pos = { x = 0.0, y = 0.0, z = 0.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 5, gadget_id = 42901025, pos = { x = 0.0, y = 0.0, z = 0.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 6, gadget_id = 42901026, pos = { x = 0.0, y = 0.0, z = 0.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 7, gadget_id = 42901027, pos = { x = 0.0, y = 0.0, z = 0.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 8, gadget_id = 42901028, pos = { x = 0.0, y = 0.0, z = 0.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 9, gadget_id = 42901029, pos = { x = 0.0, y = 0.0, z = 0.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 1, shape = RegionShape.SPHERE, radius = 5, pos = { x = 0.0, y = 0.0, z = 0.0 } },
	{ config_id = 2, shape = RegionShape.SPHERE, radius = 20, pos = { x = 0.0, y = -10.0, z = 75.0 } },
	{ config_id = 3, shape = RegionShape.SPHERE, radius = 12, pos = { x = 0.0, y = -9.5, z = 80.0 } }
}

-- 触发器
triggers = {
	{ name = "CUTSCENE_END_1", event = EventType.EVENT_CUTSCENE_END, source = "", condition = "", action = "action_EVENT_CUTSCENE_END_1" },
	{ name = "ENTER_REGION_2", event = EventType.EVENT_ENTER_REGION, source = "", condition = "", action = "action_EVENT_ENTER_REGION_2" },
	{ name = "ENTER_REGION_3", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_3", action = "action_EVENT_ENTER_REGION_3" }
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
		gadgets = { 1, 2, 3, 4, 5, 6, 7, 8, 9 },
		regions = { 1, 2, 3 },
		triggers = { "CUTSCENE_END_1", "ENTER_REGION_2", "ENTER_REGION_3" },
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
function action_EVENT_CUTSCENE_END_1(context, evt)
	-- 延迟1秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1, delay_time = 1 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_ENTER_REGION_2(context, evt)
	-- 通知场景上的所有玩家播放名字为200201 的cutscene
	if 0 ~= ScriptLib.PlayCutScene(context, 200201, 60) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_3(context, evt)
	if evt.param1 ~= 3 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_3(context, evt)
	-- 调用提示id为 20020101 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 20020101) then
		return -1
	end
	
	return 0
end
