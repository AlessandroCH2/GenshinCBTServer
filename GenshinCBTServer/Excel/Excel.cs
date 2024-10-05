using CsvHelper.Configuration;
using CsvHelper.Configuration.Attributes;
using GenshinCBTServer.Player;
using GenshinCBTServer.Protocol;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenshinCBTServer.Excel
{
  
    public class RoutePointData
    {
        public uint waitTime;
        public float speedLevel;
        public Vector pos;
        public float targetVelocity;
        public bool hasReachEvent;
    }
    public class RouteData
    {
        public uint localId;
        public string type;
        public string name;
        public List<RoutePointData> points;
    }
    public class SceneBlockRoutes
    {
        public uint sceneId;
        public uint blockId; //Not in the json
        public List<RouteData> routes;
    }
    public class MonsterData
    {
        public uint id;
        public bool canSwim;
        public uint type;
        public int killExp; //?

        //Stats
        public float hp_base;
        public float attack_base;
        public float defense_base;


        public uint campId;
        public List<PropGrowCurve> propGrowCurves;
    }
    public class PropGrowCurve
    {
        public FightPropType type;
        public GrowCurveType grow_curve;
    }
    public class GadgetProp
    {
        public uint id;
        public float hp;
        public int hpCurve;
        public float attack;
        public int attackCurve;
        public float defense;
        public int defenseCurve;
    }
    public class TalentSkillData
    {
        [JsonProperty("talentId")]
        public int id;
        [JsonProperty("talentGroupId")]
        public int talent_group_id;
        [JsonProperty("level")]
        public int rank;
    };
    
    public class AvatarSkillDepotData
    {
        public int id;
        [JsonProperty("leaderTalent")]
        public int leader_Talent;
        [JsonProperty("talentGroup")]
        public List<int> talent_groups = new List<int>(10);
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


    public class PromoteInfo
    {
        public uint coinCost;
        public uint weaponPromoteId;
        public uint promoteLevel;

        public List<PromoteProp> addProps;


        public PromoteProp getPropByType(FightPropType type)
        {
            for (int i = 0; i < addProps.Count; i++)
            {
                PromoteProp curveInfo = addProps[i];
                if (curveInfo.propType == (int)type) return curveInfo;
            }
            return addProps[0];
        }
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
    public class PromoteProp
    {
        public int propType;
        public float value;
    }
    public class CurveInfo
    {
        public GrowCurveType type;
        public ArithType arith;
        public float value;
    }
    public class ReliquaryProp
    {
        public int propType;
        public float value;
    }
    public class ReliquaryMainPropData
    {
        public string affixName;
        public uint id;
        public uint propDepotId;
        public int propType;

    }
    public class ReliquaryAppendPropData
    {
        public float propValue;
        public uint id;
        public uint depotId;
        public int propType;

    }
    public class ReliquaryCurve
    {
        public uint level;
        public uint rank;
        public List<ReliquaryProp> addProps;
        public ReliquaryProp getCurveValue(int growcurve)
        {
            for (int i = 0; i < addProps.Count; i++)
            {
                ReliquaryProp curveInfo = addProps[i];
                if (curveInfo.propType == growcurve) return curveInfo;
            }
            return addProps[0];
        }
    }
    public class LevelCurve
    {
        public uint level;
        public List<CurveInfo> curveInfos = new List<CurveInfo>();

        public CurveInfo getCurveValue(int growcurve)
        {
            for (int i = 0; i < curveInfos.Count; i++)
            {
                CurveInfo curveInfo = curveInfos[i];
                if ((uint)curveInfo.type == growcurve) return curveInfo;
            }
            CurveInfo ret = curveInfos[0];
            ret.type = (GrowCurveType)growcurve;
            ret.arith = ArithType.ARITH_MULTI;
            ret.value = 1;
            return ret;
        }
    }
    public class WeaponPropValue
    {
        public float initValue;
        public int type;
        public FightPropType propType;
    }
    public class ItemData
    {
        public uint id;
        public uint gadgetId;
        public ItemType itemType;
        public EquipType equipType;
        public List<WeaponPropValue> weaponProp;
        
        public uint mainPropDepotId;
        public uint rankLevel;
        public uint appendPropDepotId;
        //Need to add info of the reliquary

        public EquipType GetEquipType()
        {
            return equipType;
        }
        public PromoteInfo getPromoteInfo(uint asc)
        {
            return Server.getResources().weaponsPromote[asc];
        }
        public ItemType GetType()
        {
            return itemType;
        }
    }
    public class DropData
    {
        public uint drop_id;
        public string comment;
        public uint child_drop_id;
        public int child_drop_id_weight;
    }
    public class ChildDrop
    {
        public uint child_drop_id;
        public uint item_drop_id;
       // public string item_drop_quantity_range;
        public int item_drop_weight;
    }
}
