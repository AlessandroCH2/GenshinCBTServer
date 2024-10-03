using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenshinCBTServer
{
    public enum GadgetType
    {
        GADGET_NONE = 0, 

        GADGET_WORLD_CHECT = 1, 

        GADGET_DUNGEON_SECRET_CHEST = 2,

        GADGET_DUNGEON_PASS_CHEST = 3,
    }
    public enum GadgetState // TypeDefIndex: 10045
    {
  
   
        Default = 0,
        GatherDrop = 1,
        ChestLocked = 101,
        ChestOpened = 102,
        ChestTrap = 103,
        ChestBramble = 104,
        ChestFrozen = 105,
        GearStart = 201,
        GearStop = 202,
        GearAction1 = 203,
        GearAction2 = 204,
        CrystalResonate1 = 301,
        CrystalResonate2 = 302,
        CrystalExplode = 303,
        CrystalDrain = 304,
        Action01 = 901,
        Action02 = 902,
        Action03 = 903,
    }
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
   
}
