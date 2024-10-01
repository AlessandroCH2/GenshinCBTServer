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
	{ config_id = 75, gadget_id = 70900201, pos = { x = 4.0, y = 3.0, z = -7.4 }, rot = { x = 0.0, y = 281.2, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 43, shape = RegionShape.CUBIC, size = { x = 40.0, y = 5.0, z = 5.0 }, pos = { x = 0.3, y = 1.0, z = 0.2 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_43", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_43", action = "action_EVENT_ENTER_REGION_43" }
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
		gadgets = { 75 },
		regions = { 43 },
		triggers = { "ENTER_REGION_43" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_43(context, evt)
	if evt.param1 ~= 43 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_43(context, evt)
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 201006008, monsters = {}, gadgets = {75} }) then
			return -1
		end
	
	return 0
end
