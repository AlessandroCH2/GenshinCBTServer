--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 246, monster_id = 21011001, pos = { x = 2548.5, y = 207.2, z = 247.3 }, rot = { x = 0.0, y = 223.6, z = 0.0 }, level = 20, drop_id = 303005, disableWander = true, pose_id = 9003 },
	{ config_id = 247, monster_id = 21030101, pos = { x = 2552.9, y = 207.0, z = 249.8 }, rot = { x = 0.0, y = 348.7, z = 0.0 }, level = 18, drop_id = 303004, disableWander = true },
	{ config_id = 248, monster_id = 21010401, pos = { x = 2550.4, y = 207.1, z = 247.7 }, rot = { x = 0.0, y = 343.1, z = 0.0 }, level = 18, drop_id = 303004, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 520, gadget_id = 70210022, pos = { x = 2548.8, y = 206.9, z = 250.4 }, rot = { x = 0.0, y = 156.4, z = 0.0 }, level = 1, chest_drop_id = 403105, state = GadgetState.ChestLocked, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 184, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2552.1, y = 207.0, z = 245.8 } },
	{ config_id = 270, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2550.9, y = 207.1, z = 245.7 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_184", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_184", action = "action_EVENT_ANY_MONSTER_DIE_184", tlog_tag = "风龙_152_大营地6_成功" },
	{ name = "ENTER_REGION_270", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_270", action = "", tlog_tag = "风龙_152_大营地6_触发" }
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
		monsters = { 246, 247, 248 },
		gadgets = { 520 },
		regions = { 184, 270 },
		triggers = { "ANY_MONSTER_DIE_184", "ENTER_REGION_270" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_184(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_184(context, evt)
	-- 将configid为 520 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 520, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_270(context, evt)
	if evt.param1 ~= 270 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
