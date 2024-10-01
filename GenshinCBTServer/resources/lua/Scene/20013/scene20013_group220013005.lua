--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 31, monster_id = 21020201, pos = { x = 343.1, y = -12.9, z = 251.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true, affix = { 1001 } },
	{ config_id = 32, monster_id = 20011201, pos = { x = 354.6, y = -12.9, z = 262.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 33, monster_id = 20011201, pos = { x = 332.5, y = -12.7, z = 254.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 34, monster_id = 20011201, pos = { x = 330.7, y = -12.6, z = 265.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 35, monster_id = 20011201, pos = { x = 332.0, y = -12.9, z = 276.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 36, monster_id = 20011201, pos = { x = 353.7, y = -12.9, z = 275.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 37, monster_id = 20011201, pos = { x = 342.0, y = -12.7, z = 265.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 38, monster_id = 20011201, pos = { x = 326.8, y = -11.4, z = 282.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 39, monster_id = 20011201, pos = { x = 359.8, y = -11.4, z = 281.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 40, monster_id = 20011201, pos = { x = 355.7, y = -12.6, z = 251.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 41, monster_id = 22010201, pos = { x = 343.0, y = -12.7, z = 259.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true, affix = { 1002 } },
	{ config_id = 42, monster_id = 20011001, pos = { x = 351.6, y = -12.8, z = 255.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 45, monster_id = 20011001, pos = { x = 334.5, y = -12.8, z = 257.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 48, monster_id = 22010301, pos = { x = 343.0, y = -12.8, z = 252.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, affix = { 1001 } },
	{ config_id = 51, monster_id = 20010501, pos = { x = 338.3, y = -12.7, z = 264.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 53, monster_id = 20010601, pos = { x = 347.8, y = -12.7, z = 259.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 54, monster_id = 20010701, pos = { x = 336.5, y = -12.7, z = 259.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 55, monster_id = 21020101, pos = { x = 348.5, y = -12.7, z = 255.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true, affix = { 1002 }, isElite = true },
	{ config_id = 56, monster_id = 21020101, pos = { x = 337.8, y = -12.7, z = 255.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true, affix = { 1002 }, isElite = true },
	{ config_id = 58, monster_id = 22010201, pos = { x = 342.7, y = -12.7, z = 255.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, isElite = true },
	{ config_id = 61, monster_id = 20010901, pos = { x = 342.9, y = -12.7, z = 261.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 62, monster_id = 20011101, pos = { x = 337.7, y = -12.7, z = 264.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 63, monster_id = 20011501, pos = { x = 348.7, y = -12.7, z = 258.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 64, monster_id = 20010501, pos = { x = 346.0, y = -12.7, z = 262.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 65, monster_id = 20010601, pos = { x = 347.0, y = -12.7, z = 258.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 66, monster_id = 20010701, pos = { x = 337.1, y = -12.7, z = 259.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 67, monster_id = 20010501, pos = { x = 350.2, y = -12.7, z = 263.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 68, monster_id = 20010501, pos = { x = 335.8, y = -12.7, z = 264.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 75, monster_id = 21020201, pos = { x = 342.5, y = -12.9, z = 251.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true, affix = { 1001 } },
	{ config_id = 76, monster_id = 21010501, pos = { x = 351.5, y = -11.4, z = 244.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 79, monster_id = 21010701, pos = { x = 350.8, y = -12.8, z = 258.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 80, monster_id = 21010701, pos = { x = 335.2, y = -12.8, z = 257.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 83, monster_id = 22010201, pos = { x = 348.2, y = -12.7, z = 259.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true, isElite = true },
	{ config_id = 84, monster_id = 22010301, pos = { x = 336.9, y = -12.7, z = 259.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true, isElite = true },
	{ config_id = 85, monster_id = 20010801, pos = { x = 347.2, y = -12.7, z = 265.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 86, monster_id = 20010801, pos = { x = 351.6, y = -12.8, z = 262.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 93, monster_id = 22010301, pos = { x = 342.7, y = -12.7, z = 259.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true, isElite = true },
	{ config_id = 94, monster_id = 20010601, pos = { x = 347.3, y = -12.7, z = 262.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 95, monster_id = 20010701, pos = { x = 336.9, y = -12.7, z = 262.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 96, monster_id = 20010501, pos = { x = 347.0, y = -12.7, z = 256.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 97, monster_id = 20010501, pos = { x = 338.2, y = -12.7, z = 256.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 99, gadget_id = 70320002, pos = { x = 361.5, y = -11.4, z = 268.2 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 100, gadget_id = 70320002, pos = { x = 361.7, y = -11.4, z = 258.3 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 101, gadget_id = 70320002, pos = { x = 325.4, y = -11.4, z = 258.1 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 102, gadget_id = 70320002, pos = { x = 325.2, y = -11.4, z = 268.1 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 112, gadget_id = 70220010, pos = { x = 359.3, y = -11.4, z = 266.5 }, rot = { x = 0.0, y = 213.7, z = 0.0 }, level = 1 },
	{ config_id = 121, gadget_id = 70220010, pos = { x = 350.7, y = -12.7, z = 265.6 }, rot = { x = 0.0, y = 263.6, z = 0.0 }, level = 1 },
	{ config_id = 122, gadget_id = 70220010, pos = { x = 335.4, y = -12.8, z = 266.1 }, rot = { x = 0.0, y = 353.6, z = 0.0 }, level = 1 },
	{ config_id = 123, gadget_id = 70220010, pos = { x = 351.0, y = -12.8, z = 255.4 }, rot = { x = 0.0, y = 151.7, z = 0.0 }, level = 1 },
	{ config_id = 124, gadget_id = 70220010, pos = { x = 335.0, y = -12.8, z = 255.9 }, rot = { x = 0.0, y = 118.4, z = 0.0 }, level = 1 },
	{ config_id = 126, gadget_id = 70220010, pos = { x = 342.9, y = -12.7, z = 261.1 }, rot = { x = 0.0, y = 39.8, z = 0.0 }, level = 1 },
	{ config_id = 127, gadget_id = 70220010, pos = { x = 343.1, y = -12.7, z = 267.3 }, rot = { x = 0.0, y = 299.2, z = 0.0 }, level = 1 },
	{ config_id = 128, gadget_id = 70220010, pos = { x = 358.2, y = -11.3, z = 258.7 }, rot = { x = 0.0, y = 63.7, z = 0.0 }, level = 1 },
	{ config_id = 129, gadget_id = 70220010, pos = { x = 327.8, y = -11.4, z = 260.5 }, rot = { x = 0.0, y = 49.9, z = 0.0 }, level = 1 },
	{ config_id = 194, gadget_id = 70210031, pos = { x = 343.5, y = -12.8, z = 253.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1400400, showcutscene = true, type = GadgetType.GADGET_DUNGEON_PASS_CHEST },
	{ config_id = 195, gadget_id = 70210031, pos = { x = 343.4, y = -12.8, z = 253.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1400400, showcutscene = true, type = GadgetType.GADGET_DUNGEON_PASS_CHEST },
	{ config_id = 196, gadget_id = 70210031, pos = { x = 343.5, y = -12.8, z = 253.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1400400, showcutscene = true, type = GadgetType.GADGET_DUNGEON_PASS_CHEST },
	{ config_id = 197, gadget_id = 70210031, pos = { x = 343.5, y = -12.8, z = 253.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1400400, showcutscene = true, type = GadgetType.GADGET_DUNGEON_PASS_CHEST },
	{ config_id = 198, gadget_id = 70210031, pos = { x = 343.5, y = -12.8, z = 253.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1400400, showcutscene = true, type = GadgetType.GADGET_DUNGEON_PASS_CHEST },
	{ config_id = 199, gadget_id = 70210031, pos = { x = 343.6, y = -12.8, z = 253.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1400400, showcutscene = true, type = GadgetType.GADGET_DUNGEON_PASS_CHEST },
	{ config_id = 200, gadget_id = 70210031, pos = { x = 343.6, y = -12.8, z = 253.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1400400, showcutscene = true, type = GadgetType.GADGET_DUNGEON_PASS_CHEST },
	{ config_id = 201, gadget_id = 70210031, pos = { x = 343.4, y = -12.8, z = 253.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1400400, showcutscene = true, type = GadgetType.GADGET_DUNGEON_PASS_CHEST },
	{ config_id = 202, gadget_id = 70210031, pos = { x = 343.5, y = -12.8, z = 253.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1400400, showcutscene = true, type = GadgetType.GADGET_DUNGEON_PASS_CHEST },
	{ config_id = 203, gadget_id = 70350002, pos = { x = 343.3, y = -11.4, z = 240.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 276, gadget_id = 70220023, pos = { x = 343.3, y = -12.7, z = 267.1 }, rot = { x = 0.0, y = 314.9, z = 0.0 }, level = 1 },
	{ config_id = 277, gadget_id = 70220023, pos = { x = 350.1, y = -12.7, z = 263.5 }, rot = { x = 0.0, y = 154.0, z = 0.0 }, level = 1 },
	{ config_id = 278, gadget_id = 70220023, pos = { x = 336.2, y = -12.7, z = 263.2 }, rot = { x = 0.0, y = 44.7, z = 0.0 }, level = 1 },
	{ config_id = 279, gadget_id = 70220023, pos = { x = 340.9, y = -12.7, z = 259.4 }, rot = { x = 0.0, y = 136.7, z = 0.0 }, level = 1 },
	{ config_id = 280, gadget_id = 70220023, pos = { x = 347.5, y = -12.7, z = 257.6 }, rot = { x = 0.0, y = 99.2, z = 0.0 }, level = 1 },
	{ config_id = 281, gadget_id = 70220023, pos = { x = 343.0, y = -12.8, z = 253.6 }, rot = { x = 0.0, y = 325.8, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 11, shape = RegionShape.SPHERE, radius = 1.68, pos = { x = 353.9, y = -12.7, z = 262.7 } },
	{ config_id = 12, shape = RegionShape.SPHERE, radius = 2.94, pos = { x = 332.1, y = -12.9, z = 254.2 } },
	{ config_id = 13, shape = RegionShape.SPHERE, radius = 1.8, pos = { x = 330.4, y = -12.3, z = 264.7 } },
	{ config_id = 14, shape = RegionShape.SPHERE, radius = 1.76, pos = { x = 330.0, y = -12.1, z = 277.1 } },
	{ config_id = 15, shape = RegionShape.SPHERE, radius = 2.97, pos = { x = 354.6, y = -12.9, z = 276.0 } },
	{ config_id = 16, shape = RegionShape.SPHERE, radius = 3.24, pos = { x = 341.9, y = -12.7, z = 265.5 } },
	{ config_id = 17, shape = RegionShape.SPHERE, radius = 3.42, pos = { x = 325.1, y = -11.4, z = 283.3 } },
	{ config_id = 18, shape = RegionShape.SPHERE, radius = 3.16, pos = { x = 362.7, y = -11.3, z = 281.2 } },
	{ config_id = 19, shape = RegionShape.SPHERE, radius = 5, pos = { x = 358.5, y = -11.4, z = 250.1 } },
	{ config_id = 29, shape = RegionShape.SPHERE, radius = 5, pos = { x = 342.6, y = -12.8, z = 252.8 } },
	{ config_id = 30, shape = RegionShape.SPHERE, radius = 5, pos = { x = 342.5, y = -12.8, z = 253.2 } },
	{ config_id = 31, shape = RegionShape.SPHERE, radius = 5, pos = { x = 342.4, y = -12.8, z = 253.2 } },
	{ config_id = 32, shape = RegionShape.SPHERE, radius = 5, pos = { x = 342.5, y = -12.8, z = 253.1 } },
	{ config_id = 33, shape = RegionShape.SPHERE, radius = 5, pos = { x = 342.4, y = -12.8, z = 253.5 } },
	{ config_id = 34, shape = RegionShape.SPHERE, radius = 5, pos = { x = 343.0, y = -12.8, z = 253.3 } },
	{ config_id = 35, shape = RegionShape.SPHERE, radius = 5, pos = { x = 342.7, y = -12.8, z = 253.6 } },
	{ config_id = 36, shape = RegionShape.SPHERE, radius = 5, pos = { x = 342.2, y = -12.8, z = 253.1 } },
	{ config_id = 37, shape = RegionShape.SPHERE, radius = 5, pos = { x = 343.0, y = -12.8, z = 253.3 } },
	{ config_id = 41, shape = RegionShape.SPHERE, radius = 5, pos = { x = 343.1, y = -12.7, z = 264.7 } },
	{ config_id = 42, shape = RegionShape.SPHERE, radius = 5, pos = { x = 353.6, y = -12.8, z = 262.8 } },
	{ config_id = 43, shape = RegionShape.SPHERE, radius = 5, pos = { x = 344.5, y = -12.7, z = 261.7 } },
	{ config_id = 44, shape = RegionShape.SPHERE, radius = 5, pos = { x = 341.5, y = -12.7, z = 262.0 } },
	{ config_id = 45, shape = RegionShape.SPHERE, radius = 5, pos = { x = 343.3, y = -12.7, z = 263.1 } },
	{ config_id = 46, shape = RegionShape.SPHERE, radius = 5, pos = { x = 343.6, y = -12.7, z = 263.6 } },
	{ config_id = 47, shape = RegionShape.SPHERE, radius = 5, pos = { x = 343.7, y = -12.7, z = 264.4 } },
	{ config_id = 48, shape = RegionShape.SPHERE, radius = 5, pos = { x = 342.8, y = -12.7, z = 265.8 } },
	{ config_id = 49, shape = RegionShape.SPHERE, radius = 5, pos = { x = 342.6, y = -12.7, z = 265.5 } },
	{ config_id = 50, shape = RegionShape.SPHERE, radius = 5, pos = { x = 341.9, y = -12.7, z = 265.4 } },
	{ config_id = 51, shape = RegionShape.SPHERE, radius = 5, pos = { x = 342.6, y = -12.7, z = 264.2 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_11", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_11", action = "action_EVENT_ENTER_REGION_11" },
	{ name = "ENTER_REGION_12", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_12", action = "action_EVENT_ENTER_REGION_12" },
	{ name = "ENTER_REGION_13", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_13", action = "action_EVENT_ENTER_REGION_13" },
	{ name = "ENTER_REGION_14", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_14", action = "action_EVENT_ENTER_REGION_14" },
	{ name = "ENTER_REGION_15", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_15", action = "action_EVENT_ENTER_REGION_15" },
	{ name = "ENTER_REGION_16", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_16", action = "action_EVENT_ENTER_REGION_16" },
	{ name = "ENTER_REGION_17", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_17", action = "action_EVENT_ENTER_REGION_17" },
	{ name = "ENTER_REGION_18", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_18", action = "action_EVENT_ENTER_REGION_18" },
	{ name = "ENTER_REGION_19", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_19", action = "action_EVENT_ENTER_REGION_19" },
	{ name = "DUNGEON_SETTLE_29", event = EventType.EVENT_DUNGEON_SETTLE, source = "", condition = "condition_EVENT_DUNGEON_SETTLE_29", action = "action_EVENT_DUNGEON_SETTLE_29" },
	{ name = "DUNGEON_SETTLE_30", event = EventType.EVENT_DUNGEON_SETTLE, source = "", condition = "condition_EVENT_DUNGEON_SETTLE_30", action = "action_EVENT_DUNGEON_SETTLE_30" },
	{ name = "DUNGEON_SETTLE_31", event = EventType.EVENT_DUNGEON_SETTLE, source = "", condition = "condition_EVENT_DUNGEON_SETTLE_31", action = "action_EVENT_DUNGEON_SETTLE_31" },
	{ name = "DUNGEON_SETTLE_32", event = EventType.EVENT_DUNGEON_SETTLE, source = "", condition = "condition_EVENT_DUNGEON_SETTLE_32", action = "action_EVENT_DUNGEON_SETTLE_32" },
	{ name = "DUNGEON_SETTLE_33", event = EventType.EVENT_DUNGEON_SETTLE, source = "", condition = "condition_EVENT_DUNGEON_SETTLE_33", action = "action_EVENT_DUNGEON_SETTLE_33" },
	{ name = "DUNGEON_SETTLE_34", event = EventType.EVENT_DUNGEON_SETTLE, source = "", condition = "condition_EVENT_DUNGEON_SETTLE_34", action = "action_EVENT_DUNGEON_SETTLE_34" },
	{ name = "DUNGEON_SETTLE_35", event = EventType.EVENT_DUNGEON_SETTLE, source = "", condition = "condition_EVENT_DUNGEON_SETTLE_35", action = "action_EVENT_DUNGEON_SETTLE_35" },
	{ name = "DUNGEON_SETTLE_36", event = EventType.EVENT_DUNGEON_SETTLE, source = "", condition = "condition_EVENT_DUNGEON_SETTLE_36", action = "action_EVENT_DUNGEON_SETTLE_36" },
	{ name = "DUNGEON_SETTLE_37", event = EventType.EVENT_DUNGEON_SETTLE, source = "", condition = "condition_EVENT_DUNGEON_SETTLE_37", action = "action_EVENT_DUNGEON_SETTLE_37" },
	{ name = "DUNGEON_SETTLE_41", event = EventType.EVENT_DUNGEON_SETTLE, source = "", condition = "condition_EVENT_DUNGEON_SETTLE_41", action = "action_EVENT_DUNGEON_SETTLE_41" },
	{ name = "ANY_MONSTER_DIE_42", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_42", action = "action_EVENT_ANY_MONSTER_DIE_42", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_43", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_43", action = "action_EVENT_ANY_MONSTER_DIE_43", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_44", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_44", action = "action_EVENT_ANY_MONSTER_DIE_44", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_45", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_45", action = "action_EVENT_ANY_MONSTER_DIE_45", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_46", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_46", action = "action_EVENT_ANY_MONSTER_DIE_46", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_47", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_47", action = "action_EVENT_ANY_MONSTER_DIE_47", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_48", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_48", action = "action_EVENT_ANY_MONSTER_DIE_48", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_49", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_49", action = "action_EVENT_ANY_MONSTER_DIE_49", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_50", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_50", action = "action_EVENT_ANY_MONSTER_DIE_50", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_51", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_51", action = "action_EVENT_ANY_MONSTER_DIE_51" }
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
		-- description = 火+火,
		monsters = { 31 },
		gadgets = { 99, 100, 101, 102, 203 },
		regions = { 11, 12, 13, 14, 15, 16, 17, 18, 19, 29, 41, 51 },
		triggers = { "ENTER_REGION_11", "ENTER_REGION_12", "ENTER_REGION_13", "ENTER_REGION_14", "ENTER_REGION_15", "ENTER_REGION_16", "ENTER_REGION_17", "ENTER_REGION_18", "ENTER_REGION_19", "DUNGEON_SETTLE_29", "DUNGEON_SETTLE_41", "ANY_MONSTER_DIE_51" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = 火+水,
		monsters = { 41, 42, 45 },
		gadgets = { 203 },
		regions = { 30, 41 },
		triggers = { "DUNGEON_SETTLE_30", "DUNGEON_SETTLE_41" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { 48, 51, 53, 54 },
		gadgets = { 203 },
		regions = { 31, 41 },
		triggers = { "DUNGEON_SETTLE_31", "DUNGEON_SETTLE_41" },
		rand_weight = 100
	},
	{
		-- suite_id = 3,
		-- description = suite_4,
		monsters = { 55, 56, 58 },
		gadgets = { 121, 122, 123, 124, 126, 127, 128, 129, 203 },
		regions = { 32, 41 },
		triggers = { "DUNGEON_SETTLE_32", "DUNGEON_SETTLE_41" },
		rand_weight = 100
	},
	{
		-- suite_id = 4,
		-- description = suite_5,
		monsters = { 61, 62, 63 },
		gadgets = { 121, 122, 123, 124, 126, 127, 128, 129, 203 },
		regions = { 33, 41 },
		triggers = { "DUNGEON_SETTLE_33", "DUNGEON_SETTLE_41" },
		rand_weight = 100
	},
	{
		-- suite_id = 5,
		-- description = suite_6,
		monsters = { 64, 65, 66, 67, 68 },
		gadgets = { 203 },
		regions = { 34, 41 },
		triggers = { "DUNGEON_SETTLE_34", "DUNGEON_SETTLE_41" },
		rand_weight = 100
	},
	{
		-- suite_id = 6,
		-- description = suite_7,
		monsters = { 75, 76, 79, 80 },
		gadgets = { 203, 276, 277, 278, 279, 280, 281 },
		regions = { 35, 41 },
		triggers = { "DUNGEON_SETTLE_35", "DUNGEON_SETTLE_41" },
		rand_weight = 100
	},
	{
		-- suite_id = 7,
		-- description = suite_8,
		monsters = { 83, 84, 85, 86 },
		gadgets = { 203 },
		regions = { 36, 41 },
		triggers = { "DUNGEON_SETTLE_36", "DUNGEON_SETTLE_41" },
		rand_weight = 100
	},
	{
		-- suite_id = 8,
		-- description = suite_9,
		monsters = { 93, 94, 95, 96, 97 },
		gadgets = { 203 },
		regions = { 37, 41 },
		triggers = { "DUNGEON_SETTLE_37", "DUNGEON_SETTLE_41" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_11(context, evt)
	if evt.param1 ~= 11 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_11(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 32, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_12(context, evt)
	if evt.param1 ~= 12 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_12(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 33, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_13(context, evt)
	if evt.param1 ~= 13 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_13(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 34, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_14(context, evt)
	if evt.param1 ~= 14 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_14(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 35, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_15(context, evt)
	if evt.param1 ~= 15 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_15(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 36, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_16(context, evt)
	if evt.param1 ~= 16 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_16(context, evt)
	-- 延迟2秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 37, delay_time = 2 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_17(context, evt)
	if evt.param1 ~= 17 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_17(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 38, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_18(context, evt)
	if evt.param1 ~= 18 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_18(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 39, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_19(context, evt)
	if evt.param1 ~= 19 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_19(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 40, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_DUNGEON_SETTLE_29(context, evt)
	-- 判断副本成功
	if 1 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_DUNGEON_SETTLE_29(context, evt)
	-- 创生gadget 194
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 194 }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_DUNGEON_SETTLE_30(context, evt)
	-- 判断副本成功
	if 1 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_DUNGEON_SETTLE_30(context, evt)
	-- 创生gadget 195
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 195 }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_DUNGEON_SETTLE_31(context, evt)
	-- 判断副本成功
	if 1 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_DUNGEON_SETTLE_31(context, evt)
	-- 创生gadget 196
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 196 }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_DUNGEON_SETTLE_32(context, evt)
	-- 判断副本成功
	if 1 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_DUNGEON_SETTLE_32(context, evt)
	-- 创生gadget 197
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 197 }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_DUNGEON_SETTLE_33(context, evt)
	-- 判断副本成功
	if 1 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_DUNGEON_SETTLE_33(context, evt)
	-- 创生gadget 198
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 198 }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_DUNGEON_SETTLE_34(context, evt)
	-- 判断副本成功
	if 1 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_DUNGEON_SETTLE_34(context, evt)
	-- 创生gadget 199
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 199 }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_DUNGEON_SETTLE_35(context, evt)
	-- 判断副本成功
	if 1 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_DUNGEON_SETTLE_35(context, evt)
	-- 创生gadget 200
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 200 }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_DUNGEON_SETTLE_36(context, evt)
	-- 判断副本成功
	if 1 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_DUNGEON_SETTLE_36(context, evt)
	-- 创生gadget 201
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 201 }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_DUNGEON_SETTLE_37(context, evt)
	-- 判断副本成功
	if 1 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_DUNGEON_SETTLE_37(context, evt)
	-- 创生gadget 202
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 202 }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_DUNGEON_SETTLE_41(context, evt)
	-- 判断副本成功
	if 1 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_DUNGEON_SETTLE_41(context, evt)
	-- 调用提示id为 10051701 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 10051701) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_42(context, evt)
	--判断死亡怪物的configid是否为 35
	if evt.param1 ~= 35 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_42(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 35, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_43(context, evt)
	--判断死亡怪物的configid是否为 32
	if evt.param1 ~= 32 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_43(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 32, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_44(context, evt)
	--判断死亡怪物的configid是否为 33
	if evt.param1 ~= 33 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_44(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 33, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_45(context, evt)
	--判断死亡怪物的configid是否为 34
	if evt.param1 ~= 34 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_45(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 34, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_46(context, evt)
	--判断死亡怪物的configid是否为 36
	if evt.param1 ~= 36 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_46(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 36, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_47(context, evt)
	--判断死亡怪物的configid是否为 37
	if evt.param1 ~= 37 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_47(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 37, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_48(context, evt)
	--判断死亡怪物的configid是否为 38
	if evt.param1 ~= 38 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_48(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 38, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_49(context, evt)
	--判断死亡怪物的configid是否为 39
	if evt.param1 ~= 39 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_49(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 39, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_50(context, evt)
	--判断死亡怪物的configid是否为 40
	if evt.param1 ~= 40 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_50(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 40, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_51(context, evt)
	--判断死亡怪物的configid是否为 31
	if evt.param1 ~= 31 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_51(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 220013005, suite = 10 }) then
			return -1
		end
	
	return 0
end
