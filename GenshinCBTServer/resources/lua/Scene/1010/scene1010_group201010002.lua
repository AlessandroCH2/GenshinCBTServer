--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 15, monster_id = 21010501, pos = { x = 1304.7, y = 270.8, z = -5610.9 }, rot = { x = 0.0, y = 145.8, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 16, monster_id = 21010501, pos = { x = 1284.4, y = 270.5, z = -5638.3 }, rot = { x = 0.0, y = 83.8, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 42, monster_id = 21010501, pos = { x = 1278.9, y = 262.5, z = -5575.5 }, rot = { x = 0.0, y = 183.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 43, monster_id = 21010501, pos = { x = 1257.5, y = 262.7, z = -5605.5 }, rot = { x = 0.0, y = 45.3, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 44, monster_id = 21010501, pos = { x = 1247.7, y = 262.7, z = -5615.2 }, rot = { x = 0.0, y = 153.1, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 45, monster_id = 21010501, pos = { x = 1214.2, y = 262.8, z = -5590.1 }, rot = { x = 0.0, y = 91.9, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 46, monster_id = 21010501, pos = { x = 1241.1, y = 264.4, z = -5586.8 }, rot = { x = 0.0, y = 138.6, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 47, monster_id = 21010501, pos = { x = 1212.6, y = 266.7, z = -5555.1 }, rot = { x = 0.0, y = 125.4, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 48, monster_id = 21010501, pos = { x = 1236.0, y = 262.5, z = -5557.4 }, rot = { x = 0.0, y = 153.2, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 49, monster_id = 21010501, pos = { x = 1254.2, y = 263.7, z = -5590.9 }, rot = { x = 0.0, y = 166.3, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 50, monster_id = 21010201, pos = { x = 1248.7, y = 256.4, z = -5529.9 }, rot = { x = 0.0, y = 197.7, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 51, monster_id = 21010301, pos = { x = 1275.5, y = 256.0, z = -5607.6 }, rot = { x = 0.0, y = 115.0, z = 0.0 }, level = 0 },
	{ config_id = 54, monster_id = 21010301, pos = { x = 1275.4, y = 255.7, z = -5605.6 }, rot = { x = 0.0, y = 101.1, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 55, monster_id = 21020201, pos = { x = 1219.8, y = 256.0, z = -5559.3 }, rot = { x = 0.0, y = 122.3, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2, gadget_id = 70210031, pos = { x = 1200.1, y = 271.7, z = -5558.3 }, rot = { x = 0.0, y = 117.1, z = 0.0 }, level = 1, chest_drop_id = 303122 },
	{ config_id = 7, gadget_id = 70350003, pos = { x = 1248.3, y = 255.7, z = -5578.6 }, rot = { x = 0.0, y = 22.2, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 8, gadget_id = 70210031, pos = { x = 1251.7, y = 256.0, z = -5571.1 }, rot = { x = 0.0, y = 206.0, z = 0.0 }, level = 1, chest_drop_id = 303122 }
}

-- 区域
regions = {
	{ config_id = 5, shape = RegionShape.SPHERE, radius = 17.5, pos = { x = 1249.9, y = 256.1, z = -5577.8 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_5", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_5", action = "action_EVENT_ENTER_REGION_5" }
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
		monsters = { 15, 16, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 54 },
		gadgets = { 2, 7, 8 },
		regions = { 5 },
		triggers = { "ENTER_REGION_5" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_5(context, evt)
	if evt.param1 ~= 5 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_5(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 55, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end
