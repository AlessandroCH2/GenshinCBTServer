using GenshinCBTServer.Excel;
using GenshinCBTServer.Protocol;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenshinCBTServer.Player
{
    public class ItemStats
    {
        public float attack;
        public float elementaryMastery;
        public float atkperc;
        public float hpPerc;
        public float hpFlat;
        public float critdmg;
        public float critrate;
        public float defense;
        public float defPerc;

        public void Add(ItemStats stats)
        {
            attack += stats.attack;
            elementaryMastery += stats.elementaryMastery;
            atkperc += stats.atkperc;
            hpPerc += stats.hpPerc;
            hpFlat += stats.hpFlat;
            critdmg += stats.critdmg;
            critrate += stats.critrate;
            defense += stats.defense;
            defPerc += stats.defPerc;
        }
    }
    public class GameItem
    {
      
        public uint id;
        public uint guid;
        public uint entityId;
        public int amount;

        //Weapon
        public uint level;
        public uint xp;
        public uint promoteLevel;

        public ReliquaryMainPropData mainProp { get; set; }
        public List<ReliquaryAppendPropData> appendPropList = new List<ReliquaryAppendPropData>();
        public Excel.ItemData GetExcel()
        {
            return Server.getResources().itemData[id];
        }
        public GameItem(Client client,uint id)
        {
            this.id = id;
            this.amount = 1;
            guid = (uint)client.random.Next();
            if (GetExcel().itemType==ItemType.ITEM_WEAPON)
            {
                entityId = ((uint)ProtEntityType.ProtEntityWeapon << 24) + (uint)client.random.Next();
                level = 1;
                xp = 0;
                promoteLevel = 0;
            }
           
        }
        
        public ItemStats GetWeaponAttack()
        {
            ItemData data = GetExcel();
            CurveInfo curve = Server.getResources().weaponCurves[level].getCurveValue(data.weaponProp[0].type);
            ItemStats stats = new ItemStats();

            if (curve.arith == ArithType.ARITH_MULTI)
            {
                stats.attack = data.weaponProp[0].initValue * curve.value;
                
            }
            stats.attack += data.getPromoteInfo(promoteLevel).getPropByType(FightPropType.FIGHT_PROP_BASE_ATTACK).value;
            if (data.weaponProp.Count > 1)
            {
                CurveInfo sub = Server.getResources().weaponCurves[level].getCurveValue(data.weaponProp[1].type);
                if (data.weaponProp[1].propType == FightPropType.FIGHT_PROP_ATTACK_PERCENT)
                {
                    stats.atkperc += data.weaponProp[1].initValue * sub.value; //Perc value * level curve value
                }
                /*else if (data.weaponProp[1].propType == FightPropType.FIGHT_PROP_ELEMENT_MASTERY)
                {
                    Idk the name on CBT
                    stats.elementaryMastery = data.weaponProp[1].initValue * sub.value; //Perc value * level curve value
                }*/
                else if (data.weaponProp[1].propType == FightPropType.FIGHT_PROP_HP_PERCENT)
                {
                    stats.hpPerc = data.weaponProp[1].initValue * sub.value; //Perc value * level curve value
                }
                else if (data.weaponProp[1].propType == FightPropType.FIGHT_PROP_DEFENSE)
                {
                    stats.defense += data.weaponProp[1].initValue * sub.value;
                }
                else if (data.weaponProp[1].propType == FightPropType.FIGHT_PROP_DEFENSE_PERCENT)
                {
                    stats.defPerc += data.weaponProp[1].initValue * sub.value;
                }
                else if (data.weaponProp[1].propType == FightPropType.FIGHT_PROP_CRITICAL)
                {
                    stats.critrate += data.weaponProp[1].initValue * sub.value;
                }
                else if (data.weaponProp[1].propType == FightPropType.FIGHT_PROP_CRITICAL_HURT)
                {
                    stats.critdmg += data.weaponProp[1].initValue * sub.value;
                }
            }


            return stats;
        }
        public SceneWeaponInfo weaponSceneInfo()
        {
            return new SceneWeaponInfo
            {
                EntityId = entityId,
                GadgetId = 50000000 + id,
                ItemId = id,
                Guid = guid,
                Level = level,
                PromoteLevel = promoteLevel,
                AbilityInfo = new() { IsInited = true }
            };
        }
        public ReliquaryCurve GetLevelReliquary()
        {
            //Idk how in CBT 1 work
            return null;
        }
        public ItemStats addMainPropStats(ItemStats stats)
        {
           //Idk how in CBT 1 work
            return stats;
        }
        public Item toProtoItem()
        {
            GameItem gameItem = this;
            ItemType itemType = GetExcel().itemType;
            if (itemType == ItemType.ITEM_VIRTUAL)
            {
                return new Item()
                {

                    Material = new Material()
                    {
                        Count = (uint)gameItem.amount,

                    },

                    Guid = gameItem.guid,
                    ItemId = gameItem.id

                };
            }
            else if (itemType == ItemType.ITEM_MATERIAL)
            {
                return new Item()
                {
                    Material = new Material()
                    {
                        Count = (uint)gameItem.amount
                    },
                    Guid = gameItem.guid,
                    ItemId = gameItem.id

                };
            }
            else if (itemType == ItemType.ITEM_WEAPON)
            {
                return new Item()
                {
                    Equip = new Equip()
                    {
                        Weapon = new Weapon()
                        {
                            Exp = gameItem.xp,
                            Level = gameItem.level,
                            PromoteLevel = gameItem.promoteLevel,

                        },
                      
                    },
                    Guid = gameItem.guid,
                    ItemId = gameItem.id

                };
            }
           
            return new Item()
            {
                Guid= gameItem.guid,
                ItemId=gameItem.id,
                
            };
        }
    }
}
