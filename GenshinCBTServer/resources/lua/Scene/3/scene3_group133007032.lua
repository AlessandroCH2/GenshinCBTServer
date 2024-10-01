--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 65, monster_id = 21020101, pos = { x = 2776.2, y = 206.8, z = 104.8 }, rot = { x = 0.0, y = 14.8, z = 0.0 }, level = 20, drop_id = 303105, disableWander = true, pose_id = 401 },
	{ config_id = 130, monster_id = 21010401, pos = { x = 2771.7, y = 210.5, z = 91.4 }, rot = { x = 0.0, y = 158.9, z = 0.0 }, level = 20, drop_id = 303005, disableWander = true, pose_id = 402 },
	{ config_id = 131, monster_id = 21010401, pos = { x = 2766.1, y = 211.8, z = 104.4 }, rot = { x = 0.0, y = 164.9, z = 0.0 }, level = 20, drop_id = 303005, pose_id = 402 },
	{ config_id = 137, monster_id = 21010401, pos = { x = 2776.4, y = 206.9, z = 110.0 }, rot = { x = 0.0, y = 161.6, z = 0.0 }, level = 20, drop_id = 303005, disableWander = true, pose_id = 9002 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 308, gadget_id = 70220013, pos = { x = 2767.2, y = 206.8, z = 113.7 }, rot = { x = 0.0, y = 82.8, z = 0.0 }, level = 1 },
	{ config_id = 309, gadget_id = 70220013, pos = { x = 2770.6, y = 207.2, z = 100.9 }, rot = { x = 0.0, y = 87.0, z = 0.0 }, level = 1 },
	{ config_id = 310, gadget_id = 70220013, pos = { x = 2784.9, y = 207.0, z = 89.8 }, rot = { x = 0.0, y = 312.1, z = 0.0 }, level = 1 },
	{ config_id = 311, gadget_id = 70220013, pos = { x = 2785.9, y = 207.1, z = 91.5 }, rot = { x = 0.0, y = 139.7, z = 0.0 }, level = 1 },
	{ config_id = 312, gadget_id = 70310004, pos = { x = 2782.5, y = 207.0, z = 97.5 }, rot = { x = 0.0, y = 102.0, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 76, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2780.2, y = 207.0, z = 99.3 } },
	{ config_id = 265, shape = RegionShape.SPHERE, radius = 15, pos = { x = 2780.7, y = 207.0, z = 98.0 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_76", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_76", action = "action_EVENT_ANY_MONSTER_DIE_76", tlog_tag = "风龙_32_大营地1_成功" },
	{ name = "ENTER_REGION_265", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_265", action = "", tlog_tag = "风龙_32_大营地1_触发" }
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
		monsters = { 65, 130, 131, 137 },
		gadgets = { 308, 309, 310, 311, 312 },
		regions = { 76, 265 },
		triggers = { "ANY_MONSTER_DIE_76", "ENTER_REGION_265" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_76(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_76(context, evt)
	-- 改变指定group组133007178中， configid为470的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 133007178, 470, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_265(context, evt)
	if evt.param1 ~= 265 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
