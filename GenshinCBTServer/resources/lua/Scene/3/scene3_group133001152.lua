--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 779, monster_id = 20011001, pos = { x = 1839.9, y = 226.3, z = -1103.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 3, drop_id = 303041 },
	{ config_id = 780, monster_id = 20011001, pos = { x = 1840.3, y = 226.5, z = -1107.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 3, drop_id = 303041 },
	{ config_id = 781, monster_id = 20011001, pos = { x = 1836.4, y = 226.6, z = -1101.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 3, drop_id = 303041 },
	{ config_id = 1076, monster_id = 20011101, pos = { x = 1834.8, y = 225.8, z = -1099.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 3, drop_id = 303041 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 177, shape = RegionShape.SPHERE, radius = 18.4, pos = { x = 1855.2, y = 229.2, z = -1104.5 } },
	{ config_id = 190, shape = RegionShape.SPHERE, radius = 27.7, pos = { x = 1999.8, y = 197.3, z = -1281.6 } },
	{ config_id = 191, shape = RegionShape.SPHERE, radius = 18.4, pos = { x = 2004.9, y = 199.9, z = -1214.7 } },
	{ config_id = 228, shape = RegionShape.SPHERE, radius = 18.4, pos = { x = 1600.7, y = 288.1, z = -1168.2 } },
	{ config_id = 229, shape = RegionShape.SPHERE, radius = 18.4, pos = { x = 1490.1, y = 303.4, z = -1158.4 } },
	{ config_id = 230, shape = RegionShape.SPHERE, radius = 18.4, pos = { x = 1741.2, y = 256.4, z = -1226.2 } },
	{ config_id = 231, shape = RegionShape.SPHERE, radius = 18.4, pos = { x = 1700.5, y = 263.9, z = -1309.6 } },
	{ config_id = 232, shape = RegionShape.SPHERE, radius = 18.4, pos = { x = 1754.5, y = 251.5, z = -1181.8 } },
	{ config_id = 233, shape = RegionShape.SPHERE, radius = 18.4, pos = { x = 1598.4, y = 288.3, z = -1224.4 } },
	{ config_id = 234, shape = RegionShape.SPHERE, radius = 18.4, pos = { x = 1466.6, y = 296.5, z = -1218.0 } },
	{ config_id = 262, shape = RegionShape.SPHERE, radius = 46.3, pos = { x = 1925.7, y = 197.2, z = -1391.1 } },
	{ config_id = 324, shape = RegionShape.SPHERE, radius = 23.1, pos = { x = 1954.8, y = 193.7, z = -1220.6 } },
	{ config_id = 325, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1860.3, y = 196.4, z = -1116.6 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_177", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_177", action = "action_EVENT_ENTER_REGION_177" },
	{ name = "ENTER_REGION_190", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_190", action = "action_EVENT_ENTER_REGION_190", trigger_count = 0 },
	{ name = "ENTER_REGION_191", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_191", action = "action_EVENT_ENTER_REGION_191", trigger_count = 0 },
	{ name = "ENTER_REGION_228", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_228", action = "action_EVENT_ENTER_REGION_228" },
	{ name = "ENTER_REGION_229", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_229", action = "action_EVENT_ENTER_REGION_229" },
	{ name = "ENTER_REGION_230", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_230", action = "action_EVENT_ENTER_REGION_230" },
	{ name = "ENTER_REGION_231", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_231", action = "action_EVENT_ENTER_REGION_231" },
	{ name = "ENTER_REGION_232", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_232", action = "action_EVENT_ENTER_REGION_232" },
	{ name = "ENTER_REGION_233", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_233", action = "action_EVENT_ENTER_REGION_233" },
	{ name = "ENTER_REGION_234", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_234", action = "action_EVENT_ENTER_REGION_234" },
	{ name = "ENTER_REGION_262", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_262", action = "action_EVENT_ENTER_REGION_262" },
	{ name = "ENTER_REGION_324", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_324", action = "action_EVENT_ENTER_REGION_324", trigger_count = 0 },
	{ name = "TIMER_EVENT_325", event = EventType.EVENT_TIMER_EVENT, source = "s_unlock", condition = "", action = "action_EVENT_TIMER_EVENT_325", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "lock", value = 0, persistent = false }
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
		monsters = { },
		gadgets = { },
		regions = { 177, 190, 191, 228, 229, 230, 231, 232, 233, 234, 324, 325 },
		triggers = { "ENTER_REGION_177", "ENTER_REGION_190", "ENTER_REGION_191", "ENTER_REGION_228", "ENTER_REGION_229", "ENTER_REGION_230", "ENTER_REGION_231", "ENTER_REGION_232", "ENTER_REGION_233", "ENTER_REGION_234", "ENTER_REGION_324", "TIMER_EVENT_325" },
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
function condition_EVENT_ENTER_REGION_177(context, evt)
	if evt.param1 ~= 177 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_177(context, evt)
	-- 在0面前， 5 到 10 范围里，15 角度内，刷{780,779}的怪物
	
	local ret = ScriptLib.CreateMonsterFaceAvatar(context, { entity_id = 0, monsters = {780,779}, ranges = { 5, 10 }, angle = 15 })
	ScriptLib.PrintLog(tostring(ret))
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_190(context, evt)
	if evt.param1 ~= 190 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"lock"为0
	if ScriptLib.GetGroupVariableValue(context, "lock") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_190(context, evt)
	-- 在0面前， 5 到 10 范围里，15 角度内，刷{780,781}的怪物
	
	local ret = ScriptLib.CreateMonsterFaceAvatar(context, { entity_id = 0, monsters = {780,781}, ranges = { 5, 10 }, angle = 15 })
	ScriptLib.PrintLog(tostring(ret))
	
	-- 将本组内变量名为 "lock" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "lock", 1) then
	  return -1
	end
	
	-- 延迟90秒后,向groupId为：133001152的对象,请求一次调用,并将string参数："s_unlock" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133001152, "s_unlock", 90) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_191(context, evt)
	if evt.param1 ~= 191 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"lock"为0
	if ScriptLib.GetGroupVariableValue(context, "lock") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_191(context, evt)
	-- 在0面前， 5 到 10 范围里，15 角度内，刷{781,779}的怪物
	
	local ret = ScriptLib.CreateMonsterFaceAvatar(context, { entity_id = 0, monsters = {781,779}, ranges = { 5, 10 }, angle = 15 })
	ScriptLib.PrintLog(tostring(ret))
	
	-- 将本组内变量名为 "lock" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "lock", 1) then
	  return -1
	end
	
	-- 延迟90秒后,向groupId为：133001152的对象,请求一次调用,并将string参数："s_unlock" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133001152, "s_unlock", 90) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_228(context, evt)
	if evt.param1 ~= 228 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_228(context, evt)
	-- 在0面前， 5 到 10 范围里，15 角度内，刷{781,779,780}的怪物
	
	local ret = ScriptLib.CreateMonsterFaceAvatar(context, { entity_id = 0, monsters = {781,779,780}, ranges = { 5, 10 }, angle = 15 })
	ScriptLib.PrintLog(tostring(ret))
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_229(context, evt)
	if evt.param1 ~= 229 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_229(context, evt)
	-- 在0面前， 5 到 10 范围里，15 角度内，刷{781,779,780}的怪物
	
	local ret = ScriptLib.CreateMonsterFaceAvatar(context, { entity_id = 0, monsters = {781,779,780}, ranges = { 5, 10 }, angle = 15 })
	ScriptLib.PrintLog(tostring(ret))
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_230(context, evt)
	if evt.param1 ~= 230 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_230(context, evt)
	-- 在0面前， 5 到 10 范围里，15 角度内，刷{781,779,780}的怪物
	
	local ret = ScriptLib.CreateMonsterFaceAvatar(context, { entity_id = 0, monsters = {781,779,780}, ranges = { 5, 10 }, angle = 15 })
	ScriptLib.PrintLog(tostring(ret))
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_231(context, evt)
	if evt.param1 ~= 231 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_231(context, evt)
	-- 在0面前， 5 到 10 范围里，15 角度内，刷{781,779,780}的怪物
	
	local ret = ScriptLib.CreateMonsterFaceAvatar(context, { entity_id = 0, monsters = {781,779,780}, ranges = { 5, 10 }, angle = 15 })
	ScriptLib.PrintLog(tostring(ret))
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_232(context, evt)
	if evt.param1 ~= 232 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_232(context, evt)
	-- 在0面前， 5 到 10 范围里，15 角度内，刷{781,779,780}的怪物
	
	local ret = ScriptLib.CreateMonsterFaceAvatar(context, { entity_id = 0, monsters = {781,779,780}, ranges = { 5, 10 }, angle = 15 })
	ScriptLib.PrintLog(tostring(ret))
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_233(context, evt)
	if evt.param1 ~= 233 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_233(context, evt)
	-- 在0面前， 5 到 10 范围里，15 角度内，刷{781,779,780}的怪物
	
	local ret = ScriptLib.CreateMonsterFaceAvatar(context, { entity_id = 0, monsters = {781,779,780}, ranges = { 5, 10 }, angle = 15 })
	ScriptLib.PrintLog(tostring(ret))
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_234(context, evt)
	if evt.param1 ~= 234 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_234(context, evt)
	-- 在0面前， 5 到 10 范围里，15 角度内，刷{781,779,780}的怪物
	
	local ret = ScriptLib.CreateMonsterFaceAvatar(context, { entity_id = 0, monsters = {781,779,780}, ranges = { 5, 10 }, angle = 15 })
	ScriptLib.PrintLog(tostring(ret))
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_262(context, evt)
	if evt.param1 ~= 262 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_262(context, evt)
	-- 在0面前， 5 到 10 范围里，15 角度内，刷{781,779,780,1076}的怪物
	
	local ret = ScriptLib.CreateMonsterFaceAvatar(context, { entity_id = 0, monsters = {781,779,780,1076}, ranges = { 5, 10 }, angle = 15 })
	ScriptLib.PrintLog(tostring(ret))
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_324(context, evt)
	if evt.param1 ~= 324 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"lock"为0
	if ScriptLib.GetGroupVariableValue(context, "lock") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_324(context, evt)
	-- 在0面前， 5 到 10 范围里，15 角度内，刷{780,781}的怪物
	
	local ret = ScriptLib.CreateMonsterFaceAvatar(context, { entity_id = 0, monsters = {780,781}, ranges = { 5, 10 }, angle = 15 })
	ScriptLib.PrintLog(tostring(ret))
	
	-- 将本组内变量名为 "lock" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "lock", 1) then
	  return -1
	end
	
	-- 延迟90秒后,向groupId为：133001152的对象,请求一次调用,并将string参数："s_unlock" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133001152, "s_unlock", 90) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_325(context, evt)
	-- 将本组内变量名为 "lock" 的变量设置为 0
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "lock", 0) then
	  return -1
	end
	
	return 0
end
