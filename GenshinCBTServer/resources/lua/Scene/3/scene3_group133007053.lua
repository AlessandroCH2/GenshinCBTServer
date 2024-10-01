--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 91, monster_id = 20010301, pos = { x = 2378.5, y = 227.3, z = 50.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 20, drop_id = 303005 },
	{ config_id = 92, monster_id = 20010301, pos = { x = 2380.9, y = 227.3, z = 51.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 20, drop_id = 303005 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 195, gadget_id = 70210022, pos = { x = 2379.7, y = 227.3, z = 55.0 }, rot = { x = 0.0, y = 171.7, z = 0.0 }, level = 1, chest_drop_id = 403325, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 31, shape = RegionShape.SPHERE, radius = 6, pos = { x = 2381.3, y = 227.3, z = 54.7 } },
	{ config_id = 32, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2380.9, y = 227.3, z = 55.6 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_31", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_31", action = "action_EVENT_ENTER_REGION_31", tlog_tag = "风龙_53_营地_触发" },
	{ name = "ANY_MONSTER_DIE_32", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_32", action = "action_EVENT_ANY_MONSTER_DIE_32", tlog_tag = "风龙_53_营地_成功" }
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
		gadgets = { 195 },
		regions = { 31, 32 },
		triggers = { "ENTER_REGION_31", "ANY_MONSTER_DIE_32" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_31(context, evt)
	if evt.param1 ~= 31 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_31(context, evt)
	-- 将configid为 195 的物件更改为状态 GadgetState.ChestLocked
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 195, GadgetState.ChestLocked) then
			return -1
		end 
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 91, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 92, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_32(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_32(context, evt)
	-- 解锁目标195
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 195, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
