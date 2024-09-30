using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenshinCBTServer
{
    public enum OpenStateType
    {
        OPEN_STATE_NONE = 0,
        OPEN_STATE_PAIMON = 1,
        OPEN_STATE_PAIMON_NAVIGATION = 2,
        OPEN_STATE_AVATAR_PROMOTE = 3,
        OPEN_STATE_AVATAR_TALENT = 4,
        OPEN_STATE_WEAPON_PROMOTE = 5,
        OPEN_STATE_WEAPON_AWAKEN = 6,
        OPEN_STATE_QUEST_REMIND = 7,
        OPEN_STATE_GAME_GUIDE = 8,
        OPEN_STATE_COOK = 9,
        OPEN_STATE_WEAPON_UPGRADE = 10,
        OPEN_STATE_RELIQUARY_UPGRADE = 11,
        OPEN_STATE_RELIQUARY_PROMOTE = 12,
        OPEN_STATE_WEAPON_PROMOTE_GUIDE = 13,
        OPEN_STATE_WEAPON_CHANGE_GUIDE = 14,
        OPEN_STATE_PLAYER_LVUP_GUIDE = 15,
        OPEN_STATE_FRESHMAN_GUIDE = 16,
        OPEN_STATE_SKIP_FRESHMAN_GUIDE = 17,
        OPEN_STATE_GUIDE_MOVE_CAMERA = 18,
        OPEN_STATE_GUIDE_SCALE_CAMERA = 19,
        OPEN_STATE_GUIDE_KEYBOARD = 20,
        OPEN_STATE_GUIDE_MOVE = 21,
        OPEN_STATE_GUIDE_JUMP = 22,
        OPEN_STATE_GUIDE_SPRINT = 23,
        OPEN_STATE_GUIDE_MAP = 24,
        OPEN_STATE_GUIDE_ATTACK = 25,
        OPEN_STATE_GUIDE_FLY = 26,
        OPEN_STATE_GUIDE_TALENT = 27,
        OPEN_STATE_GUIDE_RELIC = 28,
        OPEN_STATE_GUIDE_RELIC_PROM = 29
    }
    public enum EquipType
    {
        EQUIP_NONE = 0,
        // artifact slots
        EQUIP_BRACER = 1, // flower
        EQUIP_DRESS = 2, // circlet
        EQUIP_SHOES = 3, // sands
        EQUIP_RING = 4, // goblet
        EQUIP_NECKLACE = 5, // feather
                            // weapon
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
}
