--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1081, monster_id = 20011201, pos = { x = 1597.7, y = 253.3, z = -1352.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 8, drop_id = 303042 },
	{ config_id = 1082, monster_id = 20011201, pos = { x = 1599.0, y = 253.3, z = -1372.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 8, drop_id = 303042 },
	{ config_id = 1083, monster_id = 20011201, pos = { x = 1590.6, y = 253.4, z = -1362.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 8, drop_id = 303042 },
	{ config_id = 1084, monster_id = 20011201, pos = { x = 1600.3, y = 253.4, z = -1364.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 8, drop_id = 303042 },
	{ config_id = 1085, monster_id = 20011201, pos = { x = 1602.6, y = 253.5, z = -1362.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 8, drop_id = 303042 },
	{ config_id = 1086, monster_id = 20011201, pos = { x = 1595.9, y = 253.4, z = -1362.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 8, drop_id = 303042 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 327, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1599.8, y = 253.4, z = -1365.9 } },
	{ config_id = 328, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1608.3, y = 253.5, z = -1365.3 } },
	{ config_id = 372, shape = RegionShape.SPHERE, radius = 60, pos = { x = 1600.5, y = 252.5, z = -1365.2 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_327", event = EventType.EVENT_CLIENT_EXECUTE, source = "ElementFlora", condition = "", action = "action_EVENT_CLIENT_EXECUTE_327", trigger_count = 0 },
	{ name = "QUEST_FINISH_328", event = EventType.EVENT_QUEST_FINISH, source = "", condition = "condition_EVENT_QUEST_FINISH_328", action = "action_EVENT_QUEST_FINISH_328" },
	{ name = "ENTER_REGION_372", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_372", action = "action_EVENT_ENTER_REGION_372" }
}

-- 变量
variables = {
	{ name = "allow_spawn", value = 0, persistent = true }
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
		monsters = { 1081, 1082, 1083, 1084, 1085, 1086 },
		gadgets = { },
		regions = { 327 },
		triggers = { "CLIENT_EXECUTE_327" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { },
		regions = { 328, 372 },
		triggers = { "QUEST_FINISH_328", "ENTER_REGION_372" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_327(context, evt)
	-- 针对groupid为 133001247 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
	 ScriptLib.SetGadgetEnableInteract(context, 133001247, this_gadget, true)
	
	return 0
end

-- 触发条件
function condition_EVENT_QUEST_FINISH_328(context, evt)
	--检查ID为30803的任务的完成状态是否为1（1=完成，0=失败）
	--此事件需要配合Quest表使用，在Quest表里的完成执行中配置“通知group脚本”，则该任务完成后服务端会向对应的group发送通知，参数1填写场景ID，参数2填写group ID（如果不填则会通知所有group）
	
	--检查任务ID
	if 30803 ~= evt.param1 then
		return false
	end
	
	--检查任务成功状态
	if 1 ~= evt.param2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_QUEST_FINISH_328(context, evt)
	-- 将本组内变量名为 "allow_spawn" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "allow_spawn", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_372(context, evt)
	if evt.param1 ~= 372 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"allow_spawn"为1
	if ScriptLib.GetGroupVariableValue(context, "allow_spawn") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_372(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133001247, suite = 1 }) then
			return -1
		end
	
	return 0
end
