using CsvHelper.Configuration;
using CsvHelper.Configuration.Attributes;
using GenshinCBTServer.Player;
using GenshinCBTServer.Protocol;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenshinCBTServer.Excel
{
  
    public class TalentSkillData
    {
        [Index(0)]
        public int id { get; set; }
        [Index(1)]
        public int? talent_group_id { get; set; }
        [Index(2)]
        public int rank { get; set; }
    };
    
    public class AvatarSkillDepotData
    {
        [Index(0)]
        public int id { get; set; }
        [Index(9)]
        public int? leader_Talent { get; set; }
        [Index(13)]
        public List<int> talent_groups { get; set; } // Talent groups (天赋组)
        public AvatarSkillDepotData()
        {
            talent_groups = new List<int>(10);  // Initialize the list to avoid null reference issues
        }

    }

  /*  public enum FightPropType
    {
        FIGHT_PROP_NONE = 0, 

    FIGHT_PROP_BASE_HP = 1, 

    FIGHT_PROP_HP = 2, 

    FIGHT_PROP_HP_PERCENT = 3, 

    FIGHT_PROP_BASE_ATTACK = 4, 

    FIGHT_PROP_ATTACK = 5, 

    FIGHT_PROP_ATTACK_PERCENT = 6, 

    FIGHT_PROP_BASE_DEFENSE = 7, 

    FIGHT_PROP_DEFENSE = 8, 

    FIGHT_PROP_DEFENSE_PERCENT = 9, 

    FIGHT_PROP_BASE_SPEED = 10, 

    FIGHT_PROP_SPEED_PERCENT = 11, 

    FIGHT_PROP_CRITICAL = 20, 

    FIGHT_PROP_ANTI_CRITICAL = 21, 

    FIGHT_PROP_CRITICAL_HURT = 22, 

    FIGHT_PROP_CHARGE_EFFICIENCY = 23, 

    FIGHT_PROP_ADD_HURT = 24, 

    FIGHT_PROP_SUB_HURT = 25, 

    FIGHT_PROP_HEAL_ADD = 26, 

    FIGHT_PROP_HEALED_ADD = 27, 

    FIGHT_PROP_FIRE_ADD_HURT = 40,

    FIGHT_PROP_ELEC_ADD_HURT = 41,

    FIGHT_PROP_WATER_ADD_HURT = 42, 

    FIGHT_PROP_GRASS_ADD_HURT = 43,

    FIGHT_PROP_WIND_ADD_HURT = 44, 

    FIGHT_PROP_ROCK_ADD_HURT = 45,

    FIGHT_PROP_ICE_ADD_HURT = 46, 

    FIGHT_PROP_FIRE_SUB_HURT = 50,

    FIGHT_PROP_ELEC_SUB_HURT = 51, 

    FIGHT_PROP_WATER_SUB_HURT = 52,

    FIGHT_PROP_GRASS_SUB_HURT = 53, 

    FIGHT_PROP_WIND_SUB_HURT = 54, 

    FIGHT_PROP_ROCK_SUB_HURT = 55, 

    FIGHT_PROP_ICE_SUB_HURT = 56, 

    FIGHT_PROP_EFFECT_HIT = 60, 

    FIGHT_PROP_EFFECT_RESIST = 61,

    FIGHT_PROP_FREEZE_RESIST = 62,

    FIGHT_PROP_TORPOR_RESIST = 63, 

    FIGHT_PROP_DIZZY_RESIST = 64,

    FIGHT_PROP_FREEZE_SHORTEN = 65,

    FIGHT_PROP_TORPOR_SHORTEN = 66,

    FIGHT_PROP_DIZZY_SHORTEN = 67, 

    FIGHT_PROP_MAX_FIRE_ENERGY = 70, 

    FIGHT_PROP_MAX_ELEC_ENERGY = 71, 

    FIGHT_PROP_MAX_WATER_ENERGY = 72,

    FIGHT_PROP_MAX_GRASS_ENERGY = 73, 

    FIGHT_PROP_MAX_WIND_ENERGY = 74, 

    FIGHT_PROP_MAX_ICE_ENERGY = 75, 

    FIGHT_PROP_MAX_ROCK_ENERGY = 76,

    FIGHT_PROP_CUR_FIRE_ENERGY = 1000,

    FIGHT_PROP_CUR_ELEC_ENERGY = 1001, 

    FIGHT_PROP_CUR_WATER_ENERGY = 1002,

    FIGHT_PROP_CUR_GRASS_ENERGY = 1003,

    FIGHT_PROP_CUR_WIND_ENERGY = 1004, 

    FIGHT_PROP_CUR_ICE_ENERGY = 1005, 

    FIGHT_PROP_CUR_ROCK_ENERGY = 1006, 

    FIGHT_PROP_CUR_HP = 1010, 

    FIGHT_PROP_MAX_HP = 2000,

    FIGHT_PROP_CUR_ATTACK = 2001, 

    FIGHT_PROP_CUR_DEFENSE = 2002, 

    FIGHT_PROP_CUR_SPEED = 2003, 
    }*/
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
    public class PromoteProp
    {
        public int propType;
        public float value;
    }
    public class CurveInfo
    {
        public int type;
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
        public List<CurveInfo> curveInfos;

        public CurveInfo getCurveValue(int growcurve)
        {
            for (int i = 0; i < curveInfos.Count; i++)
            {
                CurveInfo curveInfo = curveInfos[i];
                if (curveInfo.type == growcurve) return curveInfo;
            }
            return curveInfos[0];
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

}
