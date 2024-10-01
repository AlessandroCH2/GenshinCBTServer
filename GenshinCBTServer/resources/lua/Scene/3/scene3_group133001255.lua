--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1097, monster_id = 20011501, pos = { x = 1762.9, y = 234.1, z = -1112.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303002 },
	{ config_id = 1098, monster_id = 20011401, pos = { x = 1761.0, y = 235.0, z = -1107.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303002 },
	{ config_id = 1099, monster_id = 20011401, pos = { x = 1763.3, y = 234.6, z = -1115.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303002 },
	{ config_id = 1100, monster_id = 20011401, pos = { x = 1763.4, y = 235.0, z = -1118.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303002 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 334, shape = RegionShape.SPHERE, radius = 10.9, pos = { x = 1764.3, y = 234.0, z = -1114.5 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_334", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_334", action = "action_EVENT_ENTER_REGION_334" }
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
		monsters = { },
		gadgets = { },
		regions = { 334 },
		triggers = { "ENTER_REGION_334" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 1098, 1099, 1100 },
		gadgets = { },
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
function condition_EVENT_ENTER_REGION_334(context, evt)
	if evt.param1 ~= 334 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_334(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 13001255, suite = 2 }) then
			return -1
		end
	
	return 0
end
