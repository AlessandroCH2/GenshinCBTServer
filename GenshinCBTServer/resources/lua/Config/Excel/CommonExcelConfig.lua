--************************************************************************
--  工具自动生成的类型定义代码(UTF-8 With BOM)，请勿编辑！
--  File Name:    CommonExcelConfig.lua
--  Purpose:      lua类型定义文件
--  Copyright (c) 2017-2100 miHoYo.com, Inc. All rights reserved.
--************************************************************************

--算数运算类型
ArithType =
{
	ARITH_NONE = 0, -- 未定义
	ARITH_ADD = 1, -- 算数加
	ARITH_MULTI = 2, -- 算数乘
	ARITH_SUB = 3, -- 算数减
	ARITH_DIVIDE = 4, -- 算数除
}

--逻辑运算类型
LogicType =
{
	LOGIC_NONE = 0, -- 未定义
	LOGIC_AND = 1, -- 逻辑与
	LOGIC_OR = 2, -- 逻辑或
	LOGIC_NOT = 3, -- 逻辑非
}

--品质
QualityType =
{
	QUALITY_NONE = 0, -- 未定义
	QUALITY_WHITE = 1, -- 白
	QUALITY_GREEN = 2, -- 绿
	QUALITY_BLUE = 3, -- 蓝
	QUALITY_PURPLE = 4, -- 紫
	QUALITY_ORANGE = 5, -- 橙
}

--职业
JobType =
{
	JOB_NONE = 0, -- 未定义
	JOB_SWORDMAN = 1, -- 剑士
	JOB_ARCHER = 2, -- 弓手
}

--体型
BodyType =
{
	BODY_NONE = 0, -- 未定义
	BODY_BOY = 1, -- 少男
	BODY_GIRL = 2, -- 少女
	BODY_LADY = 3, -- 成女
	BODY_MALE = 4, -- 成男
	BODY_LOLI = 5, -- 萝莉
}

--生命状态
LifeState =
{
	LIFE_NONE = 0, -- 未定义
	LIFE_ALIVE = 1, -- 活着
	LIFE_DEAD = 2, -- 死亡
	LIFE_REVIVE = 3, -- 复活中
}

--效果类型
StateType =
{
	BUFF_NONE = 0, -- 无
	BUFF_CONTROL = 1, -- 效果类型_控制
}

--怪物类型
MonsterType =
{
	MONSTER_NONE = 0, -- 无
	MONSTER_ORDINARY = 1, -- 怪物类型_普通
	MONSTER_BOSS = 2, -- 怪物类型_BOSS
	MONSTER_ENV_ANIMAL = 3, -- 怪物类型_环境小动物
}

--技能按钮是否支持拖动
SkillDrag =
{
	DRAG_NONE = 0, -- 不支持
	DRAG_ROTATE_CAMERA = 1, -- 旋转相机
	DRAG_ROTATE_CHARACTER = 2, -- 旋转角色
}

--战斗属性
FightPropType =
{
	FIGHT_PROP_NONE = 0, -- 未定义
	FIGHT_PROP_BASE_HP = 1, -- 基础生命值
	FIGHT_PROP_HP = 2, -- 生命值
	FIGHT_PROP_HP_PERCENT = 3, -- 生命值百分比
	FIGHT_PROP_BASE_ATTACK = 4, -- 基础攻击力
	FIGHT_PROP_ATTACK = 5, -- 攻击力
	FIGHT_PROP_ATTACK_PERCENT = 6, -- 攻击力百分比
	FIGHT_PROP_BASE_DEFENSE = 7, -- 基础防御力
	FIGHT_PROP_DEFENSE = 8, -- 防御力
	FIGHT_PROP_DEFENSE_PERCENT = 9, -- 防御力百分比
	FIGHT_PROP_BASE_SPEED = 10, -- 基础移动速度
	FIGHT_PROP_SPEED_PERCENT = 11, -- 移动速度百分比
	FIGHT_PROP_CRITICAL = 20, -- 暴击率
	FIGHT_PROP_ANTI_CRITICAL = 21, -- 暴击抗性
	FIGHT_PROP_CRITICAL_HURT = 22, -- 暴击伤害
	FIGHT_PROP_CHARGE_EFFICIENCY = 23, -- 充能效率
	FIGHT_PROP_ADD_HURT = 24, -- 伤害增加
	FIGHT_PROP_SUB_HURT = 25, -- 伤害减免
	FIGHT_PROP_HEAL_ADD = 26, -- 治疗加成
	FIGHT_PROP_HEALED_ADD = 27, -- 受治疗加成
	FIGHT_PROP_FIRE_ADD_HURT = 40, -- 火元素伤害加成
	FIGHT_PROP_ELEC_ADD_HURT = 41, -- 电元素伤害加成
	FIGHT_PROP_WATER_ADD_HURT = 42, -- 水元素伤害加成
	FIGHT_PROP_GRASS_ADD_HURT = 43, -- 草元素伤害加成
	FIGHT_PROP_WIND_ADD_HURT = 44, -- 风元素伤害加成
	FIGHT_PROP_ROCK_ADD_HURT = 45, -- 岩元素伤害加成
	FIGHT_PROP_ICE_ADD_HURT = 46, -- 冰元素伤害加成
	FIGHT_PROP_FIRE_SUB_HURT = 50, -- 火元素抗性
	FIGHT_PROP_ELEC_SUB_HURT = 51, -- 电元素抗性
	FIGHT_PROP_WATER_SUB_HURT = 52, -- 水元素抗性
	FIGHT_PROP_GRASS_SUB_HURT = 53, -- 草元素抗性
	FIGHT_PROP_WIND_SUB_HURT = 54, -- 风元素抗性
	FIGHT_PROP_ROCK_SUB_HURT = 55, -- 岩元素抗性
	FIGHT_PROP_ICE_SUB_HURT = 56, -- 冰元素抗性
	FIGHT_PROP_EFFECT_HIT = 60, -- 效果命中
	FIGHT_PROP_EFFECT_RESIST = 61, -- 效果抵抗
	FIGHT_PROP_FREEZE_RESIST = 62, -- 冰冻抵抗
	FIGHT_PROP_TORPOR_RESIST = 63, -- 麻痹抵抗
	FIGHT_PROP_DIZZY_RESIST = 64, -- 眩晕抵抗
	FIGHT_PROP_FREEZE_SHORTEN = 65, -- 冰冻时间缩短
	FIGHT_PROP_TORPOR_SHORTEN = 66, -- 麻痹时间缩短
	FIGHT_PROP_DIZZY_SHORTEN = 67, -- 眩晕时间缩短
	FIGHT_PROP_MAX_FIRE_ENERGY = 70, -- 最大火元素能量
	FIGHT_PROP_MAX_ELEC_ENERGY = 71, -- 最大电元素能量
	FIGHT_PROP_MAX_WATER_ENERGY = 72, -- 最大水元素能量
	FIGHT_PROP_MAX_GRASS_ENERGY = 73, -- 最大草元素能量
	FIGHT_PROP_MAX_WIND_ENERGY = 74, -- 最大风元素能量
	FIGHT_PROP_MAX_ICE_ENERGY = 75, -- 最大冰元素能量
	FIGHT_PROP_MAX_ROCK_ENERGY = 76, -- 最大岩元素能量
	FIGHT_PROP_CUR_FIRE_ENERGY = 1000, -- 当前火元素能量
	FIGHT_PROP_CUR_ELEC_ENERGY = 1001, -- 当前电元素能量
	FIGHT_PROP_CUR_WATER_ENERGY = 1002, -- 当前水元素能量
	FIGHT_PROP_CUR_GRASS_ENERGY = 1003, -- 当前草元素能量
	FIGHT_PROP_CUR_WIND_ENERGY = 1004, -- 当前风元素能量
	FIGHT_PROP_CUR_ICE_ENERGY = 1005, -- 当前冰元素能量
	FIGHT_PROP_CUR_ROCK_ENERGY = 1006, -- 当前岩元素能量
	FIGHT_PROP_CUR_HP = 1010, -- 当前生命值
	FIGHT_PROP_MAX_HP = 2000, -- 生命值上限
	FIGHT_PROP_CUR_ATTACK = 2001, -- 当前攻击力
	FIGHT_PROP_CUR_DEFENSE = 2002, -- 当前防御力
	FIGHT_PROP_CUR_SPEED = 2003, -- 当前速度
}

--属性类型
PropType =
{
	PROP_NONE = 0, -- 未定义
	PROP_EXP = 1001, -- 经验
	PROP_BREAK_LEVEL = 1002, -- 突破等级
	PROP_SMALL_TALENT_POINT = 1004, -- 小天赋点数
	PROP_BIG_TALENT_POINT = 1005, -- 大天赋点数
	PROP_GEAR_START_VAL = 2001, -- 机关启动值
	PROP_GEAR_STOP_VAL = 2002, -- 机关停止值
	PROP_LEVEL = 4001, -- 等级
	PROP_LAST_CHANGE_AVATAR_TIME = 10001, -- 上次切换角色的时间(使用场景时间，单位：豪秒)
	PROP_MAX_SPRING_VOLUME = 10002, -- 最大泉水量(值乘以100后与客户端通信)
	PROP_CUR_SPRING_VOLUME = 10003, -- 当前泉水量(值乘以100后与客户端通信)
	PROP_IS_SPRING_AUTO_USE = 10004, -- 是否自动使用泉水
	PROP_SPRING_AUTO_USE_PERCENT = 10005, -- 泉水自动使用的百分比
	PROP_IS_FLYABLE = 10006, -- 是否具备飞行能力
	PROP_IS_WEATHER_LOCKED = 10007, -- 是否锁定天气
	PROP_IS_GAME_TIME_LOCKED = 10008, -- 是否锁定游戏时间
	PROP_IS_TRANSFERABLE = 10009, -- 是否能够传送
	PROP_MAX_STAMINA = 10010, -- 固定体力上限
	PROP_CUR_PERSIST_STAMINA = 10011, -- 当前固定体力
	PROP_CUR_TEMPORARY_STAMINA = 10012, -- 当前临时体力
	PROP_PLAYER_LEVEL = 10013, -- 玩家等级
	PROP_PLAYER_EXP = 10014, -- 玩家经验
	PROP_PLAYER_HCOIN = 10015, -- 玩家水晶
	PROP_PLAYER_SCOIN = 10016, -- 玩家金币
	PROP_TEAM_COST = 90001, -- 队伍消耗
}

--道具类型
ItemType =
{
	ITEM_NONE = 0, -- 未定义
	ITEM_VIRTUAL = 1, -- 虚拟道具
	ITEM_MATERIAL = 2, -- 材料
	ITEM_RELIQUARY = 3, -- 圣遗物
	ITEM_WEAPON = 4, -- 武器
}

--材料类型
MaterialType =
{
	MATERIAL_NONE = 0, -- 未定义
	MATERIAL_FOOD = 1, -- 食物
	MATERIAL_QUEST = 2, -- 任务物品
	MATERIAL_EXCHANGE = 4, -- 兑换材料
	MATERIAL_CONSUME = 5, -- 消耗品
	MATERIAL_EXP_FRUIT = 6, -- 经验果实
	MATERIAL_AVATAR = 7, -- 角色卡
	MATERIAL_ADSORBATE = 8, -- 吸附物
	MATERIAL_CRICKET = 9, -- 蛐蛐（临时方案）
	MATERIAL_ELEM_CRYSTAL = 10, -- 元素结晶
	MATERIAL_WEAPON_EXP_STONE = 11, -- 武器强化石
}

--成长曲线类型
GrowCurveType =
{
	GROW_CURVE_NONE = 0, -- 未定义
	GROW_CURVE_HP = 1, -- 血量
	GROW_CURVE_ATTACK = 2, -- 攻击
	GROW_CURVE_STAMINA = 3, -- 体力
	GROW_CURVE_STRIKE = 4, -- 暴击
	GROW_CURVE_ANTI_STRIKE = 5, -- 抗暴
	GROW_CURVE_ANTI_STRIKE1 = 6, -- 抗暴1
	GROW_CURVE_ANTI_STRIKE2 = 7, -- 抗暴2
	GROW_CURVE_ANTI_STRIKE3 = 8, -- 抗暴3
	GROW_CURVE_STRIKE_HURT = 9, -- 暴击伤害
	GROW_CURVE_ELEMENT = 10, -- 元素
	GROW_CURVE_KILL_EXP = 11, -- 击杀经验
	GROW_CURVE_DEFENSE = 12, -- 防御
	GROW_CURVE_ATTACK_BOMB = 13, -- 炸药攻击
}

--装备类型枚举
EquipType =
{
	EQUIP_NONE = 0, -- 未定义
	EQUIP_BRACER = 1, -- 生之花
	EQUIP_DRESS = 2, -- 理之冠
	EQUIP_SHOES = 3, -- 时之沙
	EQUIP_RING = 4, -- 空之杯
	EQUIP_NECKLACE = 5, -- 死之羽
	EQUIP_WEAPON = 6, -- 武器
}

--武器类型
WeaponType =
{
	WEAPON_NONE = 0, -- 未定义
	WEAPON_SWORD_ONE_HAND = 1, -- 单手剑
	WEAPON_CROSSBOW = 2, -- 弩
	WEAPON_STAFF = 3, -- 法杖
	WEAPON_DOUBLE_DAGGER = 4, -- 双短刀
	WEAPON_KATANA = 5, -- 太刀
	WEAPON_SHURIKEN = 6, -- 手里剑
	WEAPON_STICK = 7, -- 棍
	WEAPON_SPEAR = 8, -- 长枪
	WEAPON_SHIELD_SMALL = 9, -- 小盾
	WEAPON_CATALYST = 10, -- 法器
	WEAPON_CLAYMORE = 11, -- 双手剑
	WEAPON_BOW = 12, -- 弓
	WEAPON_POLE = 13, -- 长柄武器
}

--玩家事件类型
PlayerEventType =
{
	PLAYER_EVENT_NONE = 0, -- 未定义
	PLAYER_EVENT_KILL_MONSTER = 1, -- 杀死怪物
	PLAYER_EVENT_COMPLETE_TALK = 2, -- 完成对话
	PLAYER_EVENT_MONSTER_DIE = 3, -- 自己场景怪物死亡
	PLAYER_EVENT_FINISH_PLOT = 4, -- 完成剧情(客户端判断)
	PLAYER_EVENT_OBTAIN_ITEM = 5, -- 获得道具
	PLAYER_EVENT_TRIGGER_FIRE = 6, -- 触发器触发
	PLAYER_EVENT_CLEAR_GROUP_MONSTER = 7, -- 清空怪物营地
	PLAYER_EVENT_NOT_FINISH_PLOT = 8, -- 未完成剧情(客户端判断)
	PLAYER_EVENT_ENTER_DUNGEON = 9, -- 进入副本
	PLAYER_EVENT_ENTER_MY_WORLD = 10, -- 进入我的大世界
	PLAYER_EVENT_FINISH_DUNGEON = 11, -- 完成地下城
	PLAYER_EVENT_DESTROY_GADGET = 12, -- 摧毁物件
	PLAYER_EVENT_OBTAIN_MATERIAL_WITH_SUBTYPE = 13, -- 获得指定类型材料
	PLAYER_EVENT_NICK_NAME = 14, -- 任意一次取名后
	PLAYER_EVENT_GADGET_INTERACT = 15, -- 调查物件
	PLAYER_EVENT_SEAL_BATTLE_RESULT = 16, -- 封印战斗结束
	PLAYER_EVENT_GAME = 101, -- 只要在游戏中
	PLAYER_EVENT_GATHER = 102, -- 采集
	PLAYER_EVENT_ACCELERATE = 104, -- 比如奔跑或是速游
	PLAYER_EVENT_USE_ITEM = 105, -- 使用背包道具
	PLAYER_EVENT_CHANGE_AVATAR = 106, -- 换人
	PLAYER_EVENT_SKILL = 107, -- 使用技能
	PLAYER_EVENT_REGION = 108, -- 踩到隐藏的无聊区
	PLAYER_EVENT_JUMP_POINT = 1000, -- 传送，包括同场景
}

--副本玩法类型
DungeonPlayType =
{
	DUNGEON_PLAY_TYPE_NONE = 0, -- 未定义
	DUNGEON_PLAY_TYPE_FOGGY_MAZE = 1, -- 迷雾迷宫
}

--单机或联机等模式
PlayMode =
{
	ALL = 0, -- 全部
	SINGLE = 1, -- 单人
	MULTIPLE = 2, -- 多人
}

