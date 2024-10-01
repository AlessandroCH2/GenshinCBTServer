--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1475, monster_id = 20010401, pos = { x = 2445.7, y = 290.2, z = -1570.1 }, rot = { x = 0.0, y = 283.5, z = 0.0 }, level = 12, drop_id = 303143, isElite = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 4182, gadget_id = 70210031, pos = { x = 2447.0, y = 290.5, z = -1570.7 }, rot = { x = 8.8, y = 283.5, z = 356.0 }, level = 1, chest_drop_id = 403243, showcutscene = true, isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 528, shape = RegionShape.SPHERE, radius = 8.6, pos = { x = 2444.8, y = 290.1, z = -1570.5 } },
	{ config_id = 532, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2445.2, y = 290.3, z = -1571.4 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_528", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_528", action = "action_EVENT_ENTER_REGION_528" },
	{ name = "ANY_MONSTER_DIE_532", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_532", action = "action_EVENT_ANY_MONSTER_DIE_532" }
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
		regions = { 528, 532 },
		triggers = { "ENTER_REGION_528", "ANY_MONSTER_DIE_532" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { 4182 },
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
function condition_EVENT_ENTER_REGION_528(context, evt)
	if evt.param1 ~= 528 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_528(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1475, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_532(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_532(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003443, suite = 2 }) then
			return -1
		end
	
	return 0
end
