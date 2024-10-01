--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 507, monster_id = 21010301, pos = { x = 1209.7, y = 257.7, z = -1527.6 }, rot = { x = 0.0, y = 9.5, z = 0.0 }, level = 13, drop_id = 303043, pose_id = 9002 },
	{ config_id = 508, monster_id = 21010201, pos = { x = 1224.5, y = 257.7, z = -1540.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13, drop_id = 303043 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1769, gadget_id = 70210011, pos = { x = 1201.8, y = 257.8, z = -1540.1 }, rot = { x = 0.0, y = 38.2, z = 0.0 }, level = 1, chest_drop_id = 403303, isOneoff = true, persistent = true },
	{ config_id = 1770, gadget_id = 70220005, pos = { x = 1211.4, y = 257.6, z = -1529.2 }, rot = { x = 0.0, y = 42.4, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 172, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1219.7, y = 257.6, z = -1535.6 } },
	{ config_id = 289, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1208.7, y = 257.5, z = -1526.7 } }
}

-- 触发器
triggers = {
	{ name = "MONSTER_BATTLE_172", event = EventType.EVENT_MONSTER_BATTLE, source = "", condition = "condition_EVENT_MONSTER_BATTLE_172", action = "action_EVENT_MONSTER_BATTLE_172" },
	{ name = "CLIENT_EXECUTE_289", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_289", trigger_count = 0 }
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
	suite = 2,
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
		monsters = { 507, 508 },
		gadgets = { 1769, 1770 },
		regions = { 289 },
		triggers = { "CLIENT_EXECUTE_289" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { },
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
function condition_EVENT_MONSTER_BATTLE_172(context, evt)
	if 508 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_MONSTER_BATTLE_172(context, evt)
	-- 通知groupid为133001103中,configid为：507的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 507, 133001103) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_289(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
