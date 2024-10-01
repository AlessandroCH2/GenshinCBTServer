--************************************************************************
--  工具自动生成的类型定义代码(UTF-8 With BOM)，请勿编辑！
--  File Name:    ConfigAbilityModifier.lua
--  Purpose:      lua类型定义文件
--  Copyright (c) 2017-2100 miHoYo.com, Inc. All rights reserved.
--************************************************************************

--Modifier Time Scale
ModifierTimeScale =
{
	Owner = 0, -- Use owner's timescale, meaning if owner get slowed done the modifier will last longer
	Caster = 1, -- Use caster's timescae, meaning if caster get slowed done the modifier will last longer
	Level = 2, -- Use level's timescale, meaning constant timescale
}

--Modifier Attribute
ModifierStacking =
{
	Refresh = 0, -- When applied again within its duration, the duration will be refreshed.
	Unique = 1, -- When applied again within its duration, nothing will happen.
	Prolong = 2, -- When applied again within its duration, it's element durability will be prolonged.
	Multiple = 3, -- When applied again, multiple instanced of this modifier will be added.
	MultipleRefresh = 4, -- When applied again, multiple instanced of this modifier will be added and replace the smallest element durability one.
	MultipleRefreshNoRemove = 5, -- When applied again, multiple instanced of this modifier will be added and refresh the smallest element durability one to origin, then return.
	MultipleAllRefresh = 6, -- When applied again, all the multiplied modifiers element durability will be refreshed
	GlobalUnique = 7, -- When applied by others again, select the one match the stacking option condition
}

--UniqueModifierCond
UniqueModifierCond =
{
	Greater = 0, -- Greater
	Smaller = 1, -- Smaller
}

