--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1430, monster_id = 20011001, pos = { x = 2701.0, y = 194.5, z = -1663.2 }, rot = { x = 0.0, y = 163.1, z = 0.0 }, level = 1, drop_id = 180001 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 520, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2701.3, y = 194.5, z = -1662.8 } },
	{ config_id = 527, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2701.4, y = 194.5, z = -1664.7 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_520", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_520", action = "action_EVENT_ANY_MONSTER_DIE_520" },
	{ name = "TIMER_EVENT_527", event = EventType.EVENT_TIMER_EVENT, source = "camera", condition = "", action = "action_EVENT_TIMER_EVENT_527" }
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
		monsters = { 1430 },
		gadgets = { },
		regions = { 520, 527 },
		triggers = { "ANY_MONSTER_DIE_520", "TIMER_EVENT_527" },
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
function condition_EVENT_ANY_MONSTER_DIE_520(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_520(context, evt)
	-- 延迟1.5秒后,向groupId为：133003429的对象,请求一次调用,并将string参数："camera" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133003429, "camera", 1.5) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_TIMER_EVENT_527(context, evt)
	-- 触发镜头注目，注目位置为坐标（2681，197，-1643），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=2681, y=197, z=-1643}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end
