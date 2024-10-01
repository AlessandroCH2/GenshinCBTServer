--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1176, monster_id = 20010401, pos = { x = 2242.2, y = 241.9, z = -1319.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3543, gadget_id = 70220008, pos = { x = 2242.5, y = 237.6, z = -1319.5 }, rot = { x = 13.2, y = 224.5, z = 0.0 }, level = 1 },
	{ config_id = 3544, gadget_id = 70210021, pos = { x = 2242.3, y = 237.5, z = -1321.0 }, rot = { x = 0.0, y = 192.7, z = 352.6 }, level = 1, chest_drop_id = 403322, showcutscene = true, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 444, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2242.0, y = 237.5, z = -1320.2 } },
	{ config_id = 445, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2239.6, y = 237.1, z = -1323.3 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_444", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "", action = "action_EVENT_GADGET_STATE_CHANGE_444" },
	{ name = "ANY_MONSTER_DIE_445", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "", action = "action_EVENT_ANY_MONSTER_DIE_445" }
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
		regions = { 444, 445 },
		triggers = { "GADGET_STATE_CHANGE_444", "ANY_MONSTER_DIE_445" },
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
function action_EVENT_GADGET_STATE_CHANGE_444(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1176, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_445(context, evt)
	-- 创建id为3544的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3544 }) then
	  return -1
	end
	
	return 0
end
