using GenshinCBTServer.Excel;
using GenshinCBTServer.Protocol;
using Google.Protobuf.Collections;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenshinCBTServer.Player
{
    public class GameEntityMonster : GameEntity
    {
        public uint level, pose_id;
        public Vector bornPos;
        public bool IsAiOpen = true;
        public MonsterData GetMonsterExcel()
        {
            return Server.getResources().monsterDataDict[id];
        }
        public ItemStats CalcStats()
        {
            ItemStats stats = new ItemStats();
            stats.hpFlat = GetMonsterExcel().hp_base;
            stats.attack = GetMonsterExcel().attack_base;
            stats.defense= GetMonsterExcel().defense_base;
            //Calculate other stats + curve for levels
            return stats;
        }
        public override void InitProps()
        {
            ItemStats stats = CalcStats();
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_HP, stats.hpFlat);
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_DEFENSE, stats.defense);
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_ATTACK, stats.attack);
            FightPropUpdate(FightPropType.FIGHT_PROP_ATTACK, stats.attack);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_ATTACK, stats.attack); //TODO calculate total attack
            FightPropUpdate(FightPropType.FIGHT_PROP_HP, stats.hpFlat);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_HP, stats.hpFlat);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_HP, stats.hpFlat); //TODO calculate total hp
            FightPropUpdate(FightPropType.FIGHT_PROP_HP_PERCENT, 0);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_DEFENSE, stats.defense);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_SPEED, 0.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_FIRE_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_ELEC_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_WATER_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_GRASS_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_WIND_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_ICE_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_ROCK_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_FIRE_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_ELEC_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_WATER_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_GRASS_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_WIND_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_ICE_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_ROCK_ENERGY, 100.0f);
            props[(uint)PropType.PROP_EXP] = new PropValue() { Ival = 1, Val = 1, Type = (uint)PropType.PROP_EXP };
            props[(uint)PropType.PROP_LEVEL] = new PropValue() { Ival = level, Val = (long)level, Type = (uint)PropType.PROP_LEVEL };
           
        }
        public GameEntityMonster(uint entityId, uint id, MotionInfo motionInfo, uint level) : base(entityId, id,motionInfo,ProtEntityType.ProtEntityMonster)
        {

           
            this.entityId = entityId;
            this.id = id;
            this.motionInfo = motionInfo;
            this.level=level;
            bornPos = motionInfo.Pos;
            InitProps();
        }
   
       
        public override SceneEntityInfo asInfo()
        {
            SceneEntityInfo info = new SceneEntityInfo()
            {
                EntityType = EntityType,
                EntityId = entityId,
                AiInfo = new() { BornPos=bornPos,IsAiOpen=IsAiOpen},
                MotionInfo = motionInfo,
                LifeState = fightprops[(uint)FightPropType.FIGHT_PROP_CUR_HP] > 0 ? (uint)LifeState.LIFE_ALIVE : (uint)LifeState.LIFE_DEAD,
                //Name=GetGadgetExcel().jsonName,
                
               // EntityCase = SceneEntityInfo.EntityOneofCase.Gadget
            };
            info.PropMap.Add(props);
            info.FightPropMap.Add(fightprops);

                info.Monster = new SceneMonsterInfo()
                {
                  
                   MonsterId=id,
                     ConfigId=configId,
                     GroupId=groupId,
                      BornType=MonsterBornType.MonsterBornNone,
                      PoseId=pose_id,
                     
                      AuthorityPeerId=owner,
                      
                    //  GadgetType = 1



                };
                
               // if (chest_drop > 0) info.Gadget.GadgetType = 1;
            return info;
        }
    }
}
