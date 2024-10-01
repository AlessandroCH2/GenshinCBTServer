--************************************************************************
--  工具自动生成的类型定义代码(UTF-8 With BOM)，请勿编辑！
--  File Name:    ConfigDefine.lua
--  Purpose:      lua类型定义文件
--  Copyright (c) 2017-2100 miHoYo.com, Inc. All rights reserved.
--************************************************************************

--触发类型
TriggerType =
{
	TriggerOnce = 0, -- 触发一次
	TriggerNoRepeat = 1, -- 触发不重复
	TriggerAlways = 2, -- 总是触发
}

--目标类型
TargetType =
{
	Alliance = 0, -- 友善，不包含自己
	Enemy = 1, -- 敌对
	Self = 2, -- 个体为自己
	SelfCamp = 3, -- 阵营为自己阵营，包含自己
	All = 4, -- 所有
	AllExceptSelf = 5, -- 所有，不包含自己
}

--时间限制类型
TimerLimitType =
{
	Finite = 0, -- 有限
	Infinite = 1, -- 无限
}

--技能公式
AbilityFormula =
{
	None = 0, -- none
	DummyThrowSpeed = 1, -- 投弹抛物蓄力速度计算(入参: 蓄力值，出参：子弹初速度)
}

--shderData
E_ShaderData =
{
	None = 0, -- none
	CharacterFrozen = 1, -- 冰冻化
	CharacterDie = 2, -- 角色死亡消隐
	CharacterBurningToAshes = 3, -- 角色燃烧死亡
	CharacterDissolve = 4, -- 角色消隐
	GadgetFrozen = 5, -- 场景物冰冻化
	GadgetDie = 6, -- 场景物死亡消隐
}

--shderPlus
E_ShaderPlus =
{
	PlusHitFlash = 0, -- 受击闪光
}

--shader使用情景(shader上的tag, 特效定的)
ShaderUseType =
{
	None = 0, -- 未知
	Character = 1, -- 用于Character
	Gadget = 2, -- 用于Gadget
}

--dieFlag 动画使用
DieFlag =
{
	Alive = 0, -- Alive
	Normal = 1, -- normal
	Drowned = 2, -- 溺亡
	InAir = 3, -- 空中状态死亡
}

--死因
DieStateFlag =
{
	None = 0, -- none
	FrozenToDeath = 1, -- 冰冻死亡
	BurningToAshes = 2, -- 燃烧死亡
}

--AttachPointEntityType
AttachPointTargetType =
{
	Target = 0, -- Use target
	Owner = 1, -- Use owner's timescale, meaning if owner get slowed done the modifier will last longer
	Caster = 2, -- Use caster's timescae, meaning if caster get slowed done the modifier will last longer
}

--方向类型
DirectionAngleType =
{
	Free = 0, -- none
	Horizontal = 1, -- 水平的
	Vertical = 2, -- 垂直的
}

