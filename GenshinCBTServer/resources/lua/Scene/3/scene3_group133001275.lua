--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 516, monster_id = 21030101, pos = { x = 1571.9, y = 252.2, z = -1629.9 }, rot = { x = 0.0, y = 226.9, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 517, monster_id = 20010801, pos = { x = 1571.1, y = 252.2, z = -1641.0 }, rot = { x = 0.0, y = 266.3, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 518, monster_id = 21030101, pos = { x = 1555.6, y = 252.2, z = -1653.8 }, rot = { x = 0.0, y = 18.3, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 519, monster_id = 20010801, pos = { x = 1566.3, y = 252.2, z = -1648.5 }, rot = { x = 0.0, y = 327.6, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 520, monster_id = 20010501, pos = { x = 1566.8, y = 252.2, z = -1631.9 }, rot = { x = 0.0, y = 199.7, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 521, monster_id = 20010501, pos = { x = 1558.5, y = 252.2, z = -1651.2 }, rot = { x = 0.0, y = 30.5, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 522, monster_id = 20010501, pos = { x = 1566.6, y = 252.2, z = -1649.2 }, rot = { x = 0.0, y = 337.2, z = 0.0 }, level = 12, drop_id = 303043, affix = { 1001, 1002 }, isElite = true },
	{ config_id = 638, monster_id = 21010201, pos = { x = 1572.4, y = 252.1, z = -1643.7 }, rot = { x = 0.0, y = 294.2, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 639, monster_id = 21020201, pos = { x = 1572.3, y = 252.1, z = -1646.9 }, rot = { x = 0.0, y = 304.2, z = 0.0 }, level = 12, drop_id = 303103, affix = { 1001 }, isElite = true },
	{ config_id = 640, monster_id = 21010201, pos = { x = 1568.7, y = 252.1, z = -1648.7 }, rot = { x = 0.0, y = 331.1, z = 0.0 }, level = 12, drop_id = 303043 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 139, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1565.7, y = 252.1, z = -1649.2 } },
	{ config_id = 411, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1562.3, y = 252.1, z = -1646.5 } },
	{ config_id = 412, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1556.0, y = 252.1, z = -1641.9 } },
	{ config_id = 413, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1558.4, y = 252.1, z = -1645.2 } },
	{ config_id = 414, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1553.1, y = 252.1, z = -1643.8 } },
	{ config_id = 415, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1556.7, y = 252.2, z = -1632.0 } },
	{ config_id = 416, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1547.8, y = 252.2, z = -1631.3 } },
	{ config_id = 417, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1552.8, y = 252.2, z = -1637.8 } },
	{ config_id = 418, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1546.1, y = 252.3, z = -1635.9 } },
	{ config_id = 419, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1537.0, y = 248.7, z = -1630.8 } }
}

-- 触发器
triggers = {
	{ name = "TIMER_EVENT_139", event = EventType.EVENT_TIMER_EVENT, source = "", condition = "condition_EVENT_TIMER_EVENT_139", action = "action_EVENT_TIMER_EVENT_139" },
	{ name = "ANY_MONSTER_LIVE_411", event = EventType.EVENT_ANY_MONSTER_LIVE, source = "", condition = "condition_EVENT_ANY_MONSTER_LIVE_411", action = "action_EVENT_ANY_MONSTER_LIVE_411" },
	{ name = "ANY_MONSTER_DIE_412", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_412", action = "action_EVENT_ANY_MONSTER_DIE_412" },
	{ name = "ANY_MONSTER_DIE_413", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_413", action = "action_EVENT_ANY_MONSTER_DIE_413" },
	{ name = "ANY_MONSTER_DIE_414", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_414", action = "action_EVENT_ANY_MONSTER_DIE_414" },
	{ name = "ANY_MONSTER_DIE_415", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_415", action = "action_EVENT_ANY_MONSTER_DIE_415" },
	{ name = "ANY_MONSTER_DIE_416", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_416", action = "action_EVENT_ANY_MONSTER_DIE_416" },
	{ name = "ANY_MONSTER_DIE_417", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_417", action = "action_EVENT_ANY_MONSTER_DIE_417" },
	{ name = "ANY_MONSTER_DIE_418", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_418", action = "action_EVENT_ANY_MONSTER_DIE_418" },
	{ name = "VARIABLE_CHANGE_419", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_419", action = "action_EVENT_VARIABLE_CHANGE_419" }
}

-- 变量
variables = {
	{ name = "Boss", value = 0, persistent = false }
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
		monsters = { 516, 517, 518, 519 },
		gadgets = { },
		regions = { 139, 411, 412, 413, 414, 415, 416, 417, 418, 419 },
		triggers = { "TIMER_EVENT_139", "ANY_MONSTER_LIVE_411", "ANY_MONSTER_DIE_412", "ANY_MONSTER_DIE_413", "ANY_MONSTER_DIE_414", "ANY_MONSTER_DIE_415", "ANY_MONSTER_DIE_416", "ANY_MONSTER_DIE_417", "ANY_MONSTER_DIE_418", "VARIABLE_CHANGE_419" },
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
function condition_EVENT_TIMER_EVENT_139(context, evt)
	if "M1" ~= evt.source_name then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_TIMER_EVENT_139(context, evt)
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 520, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 522, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 521, delay_time = 0 }) then
	  return -1
	end
	
	if 0 ~= ScriptLib.ShowReminder(context, 1018) then
		return -1
	end
	
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_LIVE_411(context, evt)
	if 518 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_LIVE_411(context, evt)
	-- 延迟20秒后,向groupId为：133001275的对象,请求一次调用,并将string参数："M1" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133001275, "M1", 20) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_412(context, evt)
	--判断死亡怪物的configid是否为 522
	if evt.param1 ~= 522 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_412(context, evt)
	-- 针对当前group内变量名为 "Boss" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Boss", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_413(context, evt)
	--判断死亡怪物的configid是否为 521
	if evt.param1 ~= 521 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_413(context, evt)
	-- 针对当前group内变量名为 "Boss" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Boss", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_414(context, evt)
	--判断死亡怪物的configid是否为 520
	if evt.param1 ~= 520 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_414(context, evt)
	-- 针对当前group内变量名为 "Boss" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Boss", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_415(context, evt)
	--判断死亡怪物的configid是否为 519
	if evt.param1 ~= 519 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_415(context, evt)
	-- 针对当前group内变量名为 "Boss" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Boss", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_416(context, evt)
	--判断死亡怪物的configid是否为 518
	if evt.param1 ~= 518 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_416(context, evt)
	-- 针对当前group内变量名为 "Boss" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Boss", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_417(context, evt)
	--判断死亡怪物的configid是否为 517
	if evt.param1 ~= 517 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_417(context, evt)
	-- 针对当前group内变量名为 "Boss" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Boss", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_418(context, evt)
	--判断死亡怪物的configid是否为 516
	if evt.param1 ~= 516 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_418(context, evt)
	-- 针对当前group内变量名为 "Boss" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Boss", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_419(context, evt)
	-- 判断变量"Boss"为7
	if ScriptLib.GetGroupVariableValue(context, "Boss") ~= 7 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_419(context, evt)
	-- 延迟0.5秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 638, delay_time = 0.5 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 639, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 640, delay_time = 0 }) then
	  return -1
	end
	
	-- 调用提示id为 1019 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1019) then
		return -1
	end
	
	-- 将本组内变量名为 "Boss" 的变量设置为 0
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "Boss", 0) then
	  return -1
	end
	
	return 0
end
