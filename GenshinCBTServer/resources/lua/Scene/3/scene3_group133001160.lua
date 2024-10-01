--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 812, monster_id = 21010601, pos = { x = 1763.5, y = 214.1, z = -1375.0 }, rot = { x = 0.0, y = 81.8, z = 0.0 }, level = 4, drop_id = 303001, disableWander = true, pose_id = 9003 },
	{ config_id = 813, monster_id = 21010401, pos = { x = 1764.2, y = 214.3, z = -1378.0 }, rot = { x = 0.0, y = 79.7, z = 0.0 }, level = 4, drop_id = 303001, disableWander = true, pose_id = 9003 },
	{ config_id = 816, monster_id = 21010101, pos = { x = 1758.9, y = 214.3, z = -1375.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 4, drop_id = 303001, disableWander = true, pose_id = 9002 },
	{ config_id = 1070, monster_id = 21010101, pos = { x = 1758.5, y = 214.4, z = -1378.6 }, rot = { x = 0.0, y = 219.4, z = 0.0 }, level = 4, drop_id = 303001, disableWander = true, pose_id = 9002 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2266, gadget_id = 70220010, pos = { x = 1761.1, y = 214.5, z = -1380.3 }, rot = { x = 0.0, y = 136.1, z = 0.0 }, level = 1 },
	{ config_id = 2267, gadget_id = 70310006, pos = { x = 1760.7, y = 214.3, z = -1376.0 }, rot = { x = 0.0, y = 152.1, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 2268, gadget_id = 70210022, pos = { x = 1749.6, y = 215.0, z = -1375.4 }, rot = { x = 0.0, y = 98.8, z = 0.0 }, level = 1, chest_drop_id = 403101, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 2681, gadget_id = 70220010, pos = { x = 1750.1, y = 215.0, z = -1370.7 }, rot = { x = 0.0, y = 136.1, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 189, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1760.0, y = 214.4, z = -1376.7 } },
	{ config_id = 308, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1763.2, y = 214.3, z = -1377.4 } },
	{ config_id = 309, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1763.2, y = 214.3, z = -1377.4 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_189", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_189", action = "action_EVENT_ANY_MONSTER_DIE_189", trigger_count = 0, tlog_tag = "小平原_营地_风场平台_完成" },
	{ name = "CLIENT_EXECUTE_308", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_308", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_309", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_309", trigger_count = 0 }
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
		monsters = { 812, 813, 816, 1070 },
		gadgets = { 2266, 2267, 2268, 2681 },
		regions = { 189, 308, 309 },
		triggers = { "ANY_MONSTER_DIE_189", "CLIENT_EXECUTE_308", "CLIENT_EXECUTE_309" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_189(context, evt)
	-- 判断指定group组剩余怪物数量是否是0 
	if ScriptLib.GetGroupMonsterCountByGroupId(context, 133001160) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_189(context, evt)
	-- 将configid为 2268 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2268, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_308(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_309(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	local this_group = ScriptLib.GetContextGroupId(context)
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.Default )
		return 0
	end
	return 0
end
