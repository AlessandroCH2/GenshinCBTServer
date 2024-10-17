namespace GenshinCBTServer.Data;
public enum EquipType
{
    EQUIP_NONE = 0,
    EQUIP_BRACER = 1,
    EQUIP_DRESS = 2,
    EQUIP_SHOES = 3,
    EQUIP_RING = 4,
    EQUIP_NECKLACE = 5,
    EQUIP_WEAPON = 6
}

public enum WeaponType
{
    WEAPON_NONE = 0,
    WEAPON_SWORD_ONE_HAND = 1,
    WEAPON_CROSSBOW = 2,
    WEAPON_STAFF = 3,
    WEAPON_DOUBLE_DAGGER = 4,
    WEAPON_KATANA = 5,
    WEAPON_SHURIKEN = 6,
    WEAPON_STICK = 7,
    WEAPON_SPEAR = 8,
    WEAPON_SHIELD_SMALL = 9,
    WEAPON_CATALYST = 10,
    WEAPON_CLAYMORE = 11,
    WEAPON_BOW = 12,
    WEAPON_POLE = 13
}

public enum ItemType
{
    ITEM_NONE = 0,
    ITEM_VIRTUAL = 1,
    ITEM_MATERIAL = 2,
    ITEM_RELIQUARY = 3,
    ITEM_WEAPON = 4
}

public enum ArithType
{
    ARITH_NONE = 0,
    ARITH_ADD = 1,
    ARITH_MULTI = 2,
    ARITH_SUB = 3,
    ARITH_DIVIDE = 4,
}

public enum GrowCurveType
{
    GROW_CURVE_NONE = 0,
    GROW_CURVE_HP = 1,
    GROW_CURVE_ATTACK = 2,
    GROW_CURVE_STAMINA = 3,
    GROW_CURVE_STRIKE = 4,
    GROW_CURVE_ANTI_STRIKE = 5,
    GROW_CURVE_ANTI_STRIKE1 = 6,
    GROW_CURVE_ANTI_STRIKE2 = 7,
    GROW_CURVE_ANTI_STRIKE3 = 8,
    GROW_CURVE_STRIKE_HURT = 9,
    GROW_CURVE_ELEMENT = 10,
    GROW_CURVE_KILL_EXP = 11,
    GROW_CURVE_DEFENSE = 12,
    GROW_CURVE_ATTACK_BOMB = 13,
    GROW_CURVE_HP_LITTLEMONSTER = 14,
    GROW_CURVE_HP_S5 = 21,
    GROW_CURVE_HP_S4 = 22,
    GROW_CURVE_ATTACK_S5 = 31,
    GROW_CURVE_ATTACK_S4 = 32,
    GROW_CURVE_ATTACK_S3 = 33,
    GROW_CURVE_DEFENSE_S5 = 41,
    GROW_CURVE_DEFENSE_S4 = 42,
}

public enum ElementType
{
    None = 0,
    Fire = 1,
    Water = 2,
    Grass = 3,
    Electric = 4,
    Ice = 5,
    Frozen = 6,
    Wind = 7,
    Rock = 8,
    AntiFire = 9,
}

public enum CompoundType
{
    COMPOUND_NONE = 0,
    COMPOUND_COOK = 1,
    COMPOUND_PLACEHOLDER_2 = 2,
}