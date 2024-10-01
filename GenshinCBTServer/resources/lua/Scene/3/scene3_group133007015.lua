--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 28, monster_id = 21030201, pos = { x = 2943.4, y = 216.0, z = 284.8 }, rot = { x = 0.0, y = 17.3, z = 0.0 }, level = 18, drop_id = 303004, disableWander = true },
	{ config_id = 29, monster_id = 21020201, pos = { x = 2945.0, y = 216.0, z = 281.4 }, rot = { x = 0.0, y = 283.1, z = 0.0 }, level = 20, drop_id = 303105, disableWander = true, pose_id = 401 },
	{ config_id = 30, monster_id = 21010401, pos = { x = 2938.2, y = 221.1, z = 291.9 }, rot = { x = 0.0, y = 195.7, z = 0.0 }, level = 20, drop_id = 303005, disableWander = true, pose_id = 402 },
	{ config_id = 31, monster_id = 21010401, pos = { x = 2952.3, y = 216.0, z = 281.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 18, drop_id = 303004, disableWander = true, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 348, gadget_id = 70220013, pos = { x = 2938.4, y = 216.0, z = 290.6 }, rot = { x = 0.0, y = 341.2, z = 0.0 }, level = 1 },
	{ config_id = 349, gadget_id = 70220013, pos = { x = 2940.2, y = 216.0, z = 291.2 }, rot = { x = 0.0, y = 341.2, z = 0.0 }, level = 1 },
	{ config_id = 350, gadget_id = 70220013, pos = { x = 2941.3, y = 216.0, z = 293.7 }, rot = { x = 0.0, y = 341.2, z = 0.0 }, level = 1 },
	{ config_id = 351, gadget_id = 70220013, pos = { x = 2942.6, y = 216.0, z = 295.5 }, rot = { x = 0.0, y = 341.2, z = 0.0 }, level = 1 },
	{ config_id = 352, gadget_id = 70220013, pos = { x = 2951.6, y = 216.0, z = 278.3 }, rot = { x = 0.0, y = 5.6, z = 0.0 }, level = 1 },
	{ config_id = 353, gadget_id = 70220013, pos = { x = 2948.4, y = 216.0, z = 278.8 }, rot = { x = 0.0, y = 5.6, z = 0.0 }, level = 1 },
	{ config_id = 354, gadget_id = 70310006, pos = { x = 2943.1, y = 216.0, z = 281.5 }, rot = { x = 0.0, y = 297.3, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 82, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2943.2, y = 216.0, z = 288.4 } },
	{ config_id = 266, shape = RegionShape.SPHERE, radius = 15, pos = { x = 2947.8, y = 216.0, z = 286.6 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_82", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_82", action = "action_EVENT_ANY_MONSTER_DIE_82", tlog_tag = "风龙_15_大营地2_成功" },
	{ name = "ENTER_REGION_266", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_266", action = "", tlog_tag = "风龙_15_大营地2_触发" }
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
		monsters = { 28, 29, 30, 31 },
		gadgets = { 348, 349, 350, 351, 352, 353, 354 },
		regions = { 82, 266 },
		triggers = { "ANY_MONSTER_DIE_82", "ENTER_REGION_266" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_82(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_82(context, evt)
	-- 改变指定group组133007179中， configid为515的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 133007179, 515, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_266(context, evt)
	if evt.param1 ~= 266 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
