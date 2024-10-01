--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 827, monster_id = 20011501, pos = { x = 1956.7, y = 234.5, z = -480.4 }, rot = { x = 0.0, y = 165.5, z = 0.0 }, level = 8, drop_id = 303142, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 294, shape = RegionShape.SPHERE, radius = 12.9, pos = { x = 1960.2, y = 224.3, z = -498.9 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_294", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_294", action = "action_EVENT_ENTER_REGION_294" }
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
		regions = { 294 },
		triggers = { "ENTER_REGION_294" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_294(context, evt)
	if evt.param1 ~= 294 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_294(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 827, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end
