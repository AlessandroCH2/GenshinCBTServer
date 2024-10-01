--************************************************************************
--  工具自动生成的类型定义代码(UTF-8 With BOM)，请勿编辑！
--  File Name:    ConfigAbilityCommon.lua
--  Purpose:      lua类型定义文件
--  Copyright (c) 2017-2100 miHoYo.com, Inc. All rights reserved.
--************************************************************************

--simple targetting
AbilityTargetting =
{
	Self = 0, -- Ability/Modifier owner, notice modifier can be applyied to other target.
	Caster = 1, -- Ability owner, always point to the *Caster* of this ability.
	Target = 2, -- target, conditionally points to target on events like BeingHit/EvadeSucess.
	SelfAttackTarget = 3, -- SelfAttackTarget, points to self's attack target
	Other = 4, -- other
	Owner = 5, -- all avatars
	CurTeamAvatars = 6, -- cur team avatars
	CurLocalAvatar = 7, -- cur local avatar
}

--注意这些虽然叫 MixinPredicate/MixinXXX  但其实是跨 Action/Mixin 通用的
MixinPredicate =
{
	Greater = 0, -- 大于
	GreaterOrEqual = 1, -- 大于等于
	Equal = 2, -- 等于
	Lesser = 3, -- 小于
	LesserOrEqual = 4, -- 小于等于
}

--注意这些虽然叫 MixinPredicate/MixinXXX  但其实是跨 Action/Mixin 通用的
MixinTargetting =
{
	None = 0, -- None
	Allied = 1, -- Allied
	Enemy = 2, -- Enemy
	All = 3, -- All
}

--Ability state
AbilityState =
{
	None = 0,
	Invincible = 1 << 0, -- (non buff/debuff) Invincible, will be hit but won't show attack number.
	DenyLockOn = 1 << 1, -- 不可被选取为目标
	IsGhostToAllied = 1 << 2, -- istarget时候是否忽略盟友
	IsGhostToEnemy = 1 << 3, -- istarget时候是否忽略掉敌人
	ElementBurning = 1 << 4, -- 火元素造成了点燃状态
	ElementWet = 1 << 5, -- 水元素造成了潮湿状态
	ElementGrassGrowing = 1 << 6, -- 草生长状态
	Frozen = 1 << 7, -- 冻结
	Paralyze = 1 << 8, -- 麻痹
}

--Property Type
PropertyType =
{
	Entity = 0,
	Actor = 1,
}

--Stack Method
StackMethod =
{
	Top = 0, -- top
	Sum = 1, -- a + b
	Multiplied = 2, -- a * b
	OneMinusMultiplied = 3, -- (1-a) * (1-b)
}

