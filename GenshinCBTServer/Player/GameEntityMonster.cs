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
        public uint drop_id,level, pose_id;
        public MapField<uint, float> fightprops = new MapField<uint, float>();
        public MapField<uint, PropValue> props = new MapField<uint, PropValue>();

        public GadgetData GetMonsterExcel()
        {
            return null;
        }
        public void UpdateProps()
        {
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_HP, 1);
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_DEFENSE, 1);
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_ATTACK, 1);
            FightPropUpdate(FightPropType.FIGHT_PROP_ATTACK, 1);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_ATTACK, 1); //TODO calculate total attack
            FightPropUpdate(FightPropType.FIGHT_PROP_HP, 1);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_HP, 1);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_HP, 1); //TODO calculate total hp
            FightPropUpdate(FightPropType.FIGHT_PROP_HP_PERCENT, 0);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_DEFENSE, 123456.0f);
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
            props[(uint)PropType.PROP_LEVEL] = new PropValue() { Ival = 1, Val = (long)1, Type = (uint)PropType.PROP_LEVEL };
           
        }
        public GameEntityMonster(uint entityId, uint id, MotionInfo motionInfo) : base(entityId, id,motionInfo,ProtEntityType.ProtEntityMonster)
        {
           
            UpdateProps();
            this.entityId = entityId;
            this.id = id;
            this.motionInfo = motionInfo;
        }
        public void FightPropUpdate(FightPropType key, float value)
        {
            fightprops[(uint)key] = value;
        }
        public override SceneEntityInfo asInfo()
        {
            SceneEntityInfo info = new SceneEntityInfo()
            {
                EntityType = EntityType,
                EntityId = entityId,
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
