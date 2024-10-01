--************************************************************************
--  工具自动生成的类型定义代码(UTF-8 With BOM)，请勿编辑！
--  File Name:    ConfigCombat.lua
--  Purpose:      lua类型定义文件
--  Copyright (c) 2017-2100 miHoYo.com, Inc. All rights reserved.
--************************************************************************

--元素类型
ElementType =
{
	None = 0,
	Fire = 1, -- 火
	Water = 2, -- 水
	Grass = 3, -- 草
	Electric = 4, -- 电
	Ice = 5, -- 冰
	Frozen = 6, -- 冻结
	Wind = 7, -- 风
	Rock = 8, -- 岩
}

--打击类型
StrikeType =
{
	Default = 0, -- 默认
	Slash = 1, -- 挥砍
	Blunt = 2, -- 钝击
	Pierce = 3, -- 穿刺
	None = 4, -- 无
}

--攻击类型，区分攻击来源，用于匹配受击相关技能的表现和逻辑
AttackType =
{
	Melee = 0, -- 近身挥砍、钝击、戳刺、横扫、撞击等，可被格挡、闪避
	Range = 1, -- 中远距离喷射、炸弹、龙卷风等范围伤害
	None = 2, -- 默认，无法归类的情况
}

--受击等级
HitLevel =
{
	Mute = 0, -- 0无效果
	Shake = 1, -- 1轻颤
	Light = 2, -- 2(打断)轻受击
	Heavy = 3, -- 3(打断)击退受击
	Air = 4, -- 4(打断)挑飞
}

