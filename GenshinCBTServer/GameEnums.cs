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
    public enum EventType
    {
        EVENT_NONE = 0, // 无

    EVENT_ANY_MONSTER_DIE = 1, // 任何怪物死亡

    EVENT_ANY_GADGET_DIE = 2, // 任何物件死亡

    EVENT_VARIABLE_CHANGE = 3, // 变量改变

    EVENT_ENTER_REGION = 4, // 进入区域

    EVENT_LEAVE_REGION = 5, // 离开区域

    EVENT_GADGET_CREATE = 6, // 物件创建

    EVENT_GADGET_STATE_CHANGE = 7, // 物件状态改变

    EVENT_DUNGEON_SETTLE = 8, // 副本结算

    EVENT_SELECT_OPTION = 9, // 选择选项

    EVENT_CLIENT_EXECUTE = 10, // 客户端请求执行trigger

    EVENT_ANY_MONSTER_LIVE = 11, // 任何怪物创生

    EVENT_SPECIFIC_MONSTER_HP_CHANGE = 12, // 指定config_id的怪物血量变化

    EVENT_AREA_LEVELUP_UNLOCK_DUNGEON_ENTRY = 13, // area升级后执行UNLOCK_DUNGEON_ENTRY的动作

    EVENT_DUNGEON_BROADCAST_ONTIMER = 14, // 副本group定时事件，广播给所有group

    EVENT_TIMER_EVENT = 15, // 延时调用事件

    EVENT_CHALLENGE_SUCCESS = 16, // 区域挑战成功

    EVENT_CHALLENGE_FAIL = 17, // 区域挑战失败

    EVENT_SEAL_BATTLE_BEGIN = 18, // 封印战斗开始

    EVENT_SEAL_BATTLE_END = 19, // 封印战斗结束

    EVENT_GATHER = 20, // 采集事件

    EVENT_QUEST_FINISH = 21, // 任务完成

    EVENT_MONSTER_BATTLE = 22, // 怪物入战

    EVENT_AREA_LEVELUP = 23, // 一级区域升级

    EVENT_CUTSCENE_END = 24, // 所有客户端播放cutscene结束

    EVENT_AVATAR_NEAR_PLATFORM = 25, // 角色靠近移动平台，这时移动平台已停止(客户端发送)
    EVENT_PLATFORM_REACH_POINT= 26,
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
