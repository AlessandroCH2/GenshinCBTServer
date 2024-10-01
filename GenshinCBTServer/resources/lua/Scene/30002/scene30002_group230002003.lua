--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 10, monster_id = 21030101, pos = { x = 352.4, y = -12.7, z = 252.4 }, rot = { x = 0.0, y = 340.4, z = 0.0 }, level = 0 },
	{ config_id = 11, monster_id = 21030201, pos = { x = 332.8, y = -12.7, z = 251.8 }, rot = { x = 0.0, y = 12.2, z = 0.0 }, level = 0 },
	{ config_id = 12, monster_id = 21010201, pos = { x = 348.0, y = -12.7, z = 261.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 13, monster_id = 21010201, pos = { x = 336.2, y = -12.7, z = 261.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 14, monster_id = 20011201, pos = { x = 342.5, y = -12.7, z = 262.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 5, gadget_id = 70350002, pos = { x = 343.3, y = -10.8, z = 240.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 6, gadget_id = 70350003, pos = { x = 333.1, y = -11.5, z = 291.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 7, gadget_id = 70350003, pos = { x = 353.3, y = -11.5, z = 291.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 8, gadget_id = 70350003, pos = { x = 343.3, y = -11.5, z = 291.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 9, gadget_id = 70360002, pos = { x = 339.8, y = -11.4, z = 282.9 }, rot = { x = 0.0, y = 354.6, z = 0.0 }, level = 1 },
	{ config_id = 20, gadget_id = 70220005, pos = { x = 352.0, y = -12.9, z = 249.7 }, rot = { x = 0.0, y = 209.8, z = 0.0 }, level = 1 },
	{ config_id = 21, gadget_id = 70220005, pos = { x = 354.4, y = -12.9, z = 251.4 }, rot = { x = 0.0, y = 332.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 5, shape = RegionShape.SPHERE, radius = 5, pos = { x = 343.8, y = -16.9, z = 308.3 } },
	{ config_id = 6, shape = RegionShape.SPHERE, radius = 5, pos = { x = 338.0, y = -11.4, z = 283.0 } },
	{ config_id = 7, shape = RegionShape.SPHERE, radius = 5, pos = { x = 337.8, y = -11.4, z = 281.0 } },
	{ config_id = 15, shape = RegionShape.SPHERE, radius = 5, pos = { x = 340.0, y = -12.7, z = 258.3 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_5", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_5", action = "action_EVENT_ENTER_REGION_5" },
	{ name = "GADGET_CREATE_6", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_6", action = "action_EVENT_GADGET_CREATE_6" },
	{ name = "SELECT_OPTION_7", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_7", action = "action_EVENT_SELECT_OPTION_7" },
	{ name = "CHALLENGE_FAIL_15", event = EventType.EVENT_CHALLENGE_FAIL, source = "3", condition = "", action = "action_EVENT_CHALLENGE_FAIL_15" }
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
		gadgets = { 5, 6, 7, 8, 9, 20, 21 },
		regions = { 5, 6, 7, 15 },
		triggers = { "ENTER_REGION_5", "GADGET_CREATE_6", "SELECT_OPTION_7", "CHALLENGE_FAIL_15" },
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
	-- 将configid为 8 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 8, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_6(context, evt)
	if 9 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_6(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {103}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_7(context, evt)
	if 9 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_7(context, evt)
	-- 根据不同的选项做不同的操作
	if 103 == evt.param2 then
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 10, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 11, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 12, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 13, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 14, delay_time = 0 }) then
	  return -1
	end
	
	-- 创建编号为3,挑战内容为5的区域挑战
	if 0 ~= ScriptLib.ActiveChallenge(context, 3, 5, 10, 230002003, 5, 0) then
		return -1
	end
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 8, GadgetState.Default) then
			return -1
		end 
		return 0
	end
	
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CHALLENGE_FAIL_15(context, evt)
	-- 杀死Group内所有monster
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 230002003, kill_policy = GroupKillPolicy.GROUP_KILL_MONSTER }) then
			return -1
		end
		
	
	-- 地城失败结算
	if 0 ~= ScriptLib.CauseDungeonFail(context) then
		return -1
	end
	
	return 0
end
