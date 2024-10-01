--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 87, monster_id = 20011201, pos = { x = 2973.1, y = 216.0, z = 219.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 20, drop_id = 303005 },
	{ config_id = 88, monster_id = 20011201, pos = { x = 2971.6, y = 216.0, z = 222.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 20, drop_id = 303005 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 25, shape = RegionShape.SPHERE, radius = 10, pos = { x = 2974.5, y = 216.0, z = 222.2 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_25", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_25", action = "action_EVENT_ENTER_REGION_25", tlog_tag = "风龙_50_伏击_触发" }
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
		gadgets = { },
		regions = { 25 },
		triggers = { "ENTER_REGION_25" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_25(context, evt)
	if evt.param1 ~= 25 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_25(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 87, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 88, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end
