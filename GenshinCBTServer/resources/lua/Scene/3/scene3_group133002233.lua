--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 611, monster_id = 20010801, pos = { x = 1861.1, y = 201.2, z = -171.7 }, rot = { x = 0.0, y = 152.5, z = 0.0 }, level = 7, drop_id = 100016 },
	{ config_id = 612, monster_id = 20010801, pos = { x = 1857.6, y = 201.3, z = -175.1 }, rot = { x = 0.0, y = 148.0, z = 0.0 }, level = 7, drop_id = 100016 },
	{ config_id = 746, monster_id = 20010801, pos = { x = 1863.7, y = 201.3, z = -174.8 }, rot = { x = 0.0, y = 173.4, z = 0.0 }, level = 7, drop_id = 100016 },
	{ config_id = 798, monster_id = 20010901, pos = { x = 1857.5, y = 201.0, z = -169.8 }, rot = { x = 0.0, y = 149.7, z = 0.0 }, level = 7, drop_id = 303102, affix = { 1002 }, isElite = true },
	{ config_id = 870, monster_id = 22010301, pos = { x = 1881.0, y = 202.2, z = -176.6 }, rot = { x = 0.0, y = 202.7, z = 0.0 }, level = 16, drop_id = 303144, affix = { 1002 }, isElite = true },
	{ config_id = 871, monster_id = 21030101, pos = { x = 1883.0, y = 202.4, z = -178.6 }, rot = { x = 0.0, y = 217.1, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 872, monster_id = 21010901, pos = { x = 1878.1, y = 202.0, z = -177.2 }, rot = { x = 0.0, y = 167.1, z = 0.0 }, level = 12, drop_id = 303043 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2015, gadget_id = 70290008, pos = { x = 1860.3, y = 201.0, z = -172.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2016, gadget_id = 70500000, pos = { x = 1860.3, y = 201.0, z = -172.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3008, owner = 2015 },
	{ config_id = 2017, gadget_id = 70290008, pos = { x = 1861.2, y = 201.6, z = -177.9 }, rot = { x = 0.0, y = 192.4, z = 0.0 }, level = 1 },
	{ config_id = 2018, gadget_id = 70500000, pos = { x = 1861.2, y = 201.6, z = -177.9 }, rot = { x = 0.0, y = 192.4, z = 0.0 }, level = 1, point_type = 3008, owner = 2017 },
	{ config_id = 2019, gadget_id = 70290008, pos = { x = 1859.1, y = 201.4, z = -175.5 }, rot = { x = 0.0, y = 242.6, z = 0.0 }, level = 1 },
	{ config_id = 2020, gadget_id = 70500000, pos = { x = 1859.1, y = 201.4, z = -175.5 }, rot = { x = 0.0, y = 242.6, z = 0.0 }, level = 1, point_type = 3008, owner = 2019 },
	{ config_id = 2084, gadget_id = 70290008, pos = { x = 1864.1, y = 201.0, z = -170.2 }, rot = { x = 0.0, y = 325.1, z = 0.0 }, level = 1 },
	{ config_id = 2085, gadget_id = 70500000, pos = { x = 1864.1, y = 201.0, z = -170.2 }, rot = { x = 0.0, y = 325.1, z = 0.0 }, level = 1, point_type = 3008, owner = 2084 },
	{ config_id = 2086, gadget_id = 70290008, pos = { x = 1863.1, y = 201.0, z = -172.4 }, rot = { x = 0.0, y = 150.4, z = 0.0 }, level = 1 },
	{ config_id = 2087, gadget_id = 70500000, pos = { x = 1863.1, y = 201.0, z = -172.4 }, rot = { x = 0.0, y = 150.4, z = 0.0 }, level = 1, point_type = 3008, owner = 2086 },
	{ config_id = 2092, gadget_id = 70290008, pos = { x = 1864.8, y = 201.0, z = -172.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2093, gadget_id = 70500000, pos = { x = 1864.8, y = 201.0, z = -172.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3008, owner = 2092 }
}

-- 区域
regions = {
	{ config_id = 287, shape = RegionShape.SPHERE, radius = 14.4, pos = { x = 1860.4, y = 201.0, z = -173.5 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_287", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_287", action = "action_EVENT_ENTER_REGION_287" }
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
		monsters = { 611, 612, 746 },
		gadgets = { 2015, 2016, 2017, 2018, 2019, 2020, 2084, 2085, 2086, 2087 },
		regions = { 287 },
		triggers = { "ENTER_REGION_287" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 870, 871, 872 },
		gadgets = { 2015, 2016, 2017, 2018, 2019, 2020, 2084, 2085, 2086, 2087 },
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
function condition_EVENT_ENTER_REGION_287(context, evt)
	if evt.param1 ~= 287 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_287(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 798, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end
