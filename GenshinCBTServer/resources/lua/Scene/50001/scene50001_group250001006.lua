--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 25, monster_id = 23040101, pos = { x = 191.5, y = 57.0, z = 382.1 }, rot = { x = 0.0, y = 179.8, z = 0.0 }, level = 0, affix = { 1001, 1002, 1003 }, isElite = true, pose_id = 101 },
	{ config_id = 26, monster_id = 21030101, pos = { x = 200.6, y = 57.0, z = 379.5 }, rot = { x = 0.0, y = 267.5, z = 0.0 }, level = 0, disableWander = true, affix = { 1002 }, isElite = true },
	{ config_id = 27, monster_id = 21010301, pos = { x = 183.1, y = 57.1, z = 370.2 }, rot = { x = 0.0, y = 100.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 28, monster_id = 21010301, pos = { x = 200.5, y = 57.0, z = 369.9 }, rot = { x = 0.0, y = 268.3, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 33, monster_id = 21030101, pos = { x = 182.8, y = 57.0, z = 379.3 }, rot = { x = 0.0, y = 53.4, z = 0.0 }, level = 0, disableWander = true, affix = { 1002 }, isElite = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 38, gadget_id = 70210051, pos = { x = 191.7, y = 57.0, z = 387.7 }, rot = { x = 0.0, y = 178.3, z = 0.0 }, level = 1, chest_drop_id = 1300400, showcutscene = true, type = GadgetType.GADGET_DUNGEON_PASS_CHEST },
	{ config_id = 39, gadget_id = 70210031, pos = { x = 194.3, y = 57.0, z = 390.3 }, rot = { x = 0.0, y = 178.4, z = 0.0 }, level = 1, chest_drop_id = 1300404, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 40, gadget_id = 70210031, pos = { x = 189.6, y = 57.1, z = 390.1 }, rot = { x = 0.0, y = 181.1, z = 0.0 }, level = 1, chest_drop_id = 1300404, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST }
}

-- 区域
regions = {
	{ config_id = 14, shape = RegionShape.SPHERE, radius = 5, pos = { x = 191.9, y = 57.0, z = 387.6 } }
}

-- 触发器
triggers = {
	{ name = "DUNGEON_SETTLE_14", event = EventType.EVENT_DUNGEON_SETTLE, source = "", condition = "", action = "action_EVENT_DUNGEON_SETTLE_14" }
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
		-- description = suite_1,
		monsters = { 25, 26, 27, 28, 33 },
		gadgets = { },
		regions = { 14 },
		triggers = { "DUNGEON_SETTLE_14" },
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
function action_EVENT_DUNGEON_SETTLE_14(context, evt)
	-- 创生gadget 38
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 38 }) then
		return -1
	end
	
	-- 创生gadget 39
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 39 }) then
		return -1
	end
	
	-- 创生gadget 40
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 40 }) then
		return -1
	end
	
	return 0
end
