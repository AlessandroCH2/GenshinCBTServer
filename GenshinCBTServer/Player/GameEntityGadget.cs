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
    public class GameEntityGadget : GameEntity
    {
        public uint chest_drop, route_id;
      


        public GadgetData GetGadgetExcel()
        {
            return Server.getResources().GetGadgetData(id);
        }
        public GadgetProp GetGadgetPropExcel()
        {
            return Server.getResources().gadgetProps.Values.ToList().Find(e=>e.id==id);
        }
        public override void InitProps()
        {
            GadgetProp prop = GetGadgetPropExcel();
           
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_HP, 1f);
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_DEFENSE, 1);
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_ATTACK, 1);
            FightPropUpdate(FightPropType.FIGHT_PROP_ATTACK, 1);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_ATTACK, 1); //TODO calculate total attack
            FightPropUpdate(FightPropType.FIGHT_PROP_HP, 1f);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_HP, 1f);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_HP, 1f); //TODO calculate total hp
            FightPropUpdate(FightPropType.FIGHT_PROP_HP_PERCENT, 0);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_DEFENSE, 100);
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
            if (prop != null)
            {
                FightPropUpdate(FightPropType.FIGHT_PROP_BASE_HP, prop.hp);
                FightPropUpdate(FightPropType.FIGHT_PROP_HP, prop.hp);
                FightPropUpdate(FightPropType.FIGHT_PROP_CUR_HP, prop.hp);
                FightPropUpdate(FightPropType.FIGHT_PROP_BASE_DEFENSE, prop.defense);
                FightPropUpdate(FightPropType.FIGHT_PROP_DEFENSE, prop.defense);
                FightPropUpdate(FightPropType.FIGHT_PROP_CUR_DEFENSE, prop.defense);
            }
        }
        public GameEntityGadget(uint entityId, uint id, MotionInfo motionInfo) : base(entityId, id,motionInfo,ProtEntityType.ProtEntityGadget)
        {

            InitProps();
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
                LifeState = 1,
                Name=GetGadgetExcel().jsonName,
                
               // EntityCase = SceneEntityInfo.EntityOneofCase.Gadget
            };
            info.PropMap.Add(props);
            info.FightPropMap.Add(fightprops);

                info.Gadget = new SceneGadgetInfo()
                {
                  
                   GadgetId=id,
                     ConfigId=configId,
                     GroupId=groupId,
                      BornType=GadgetBornType.GadgetBornGadget,
                      GadgetState = state,
                      GadgetType = GetGadgetExcel().type,
                      AuthorityPeerId=owner,
                   
                    //  GadgetType = 1

                      

                };
            if(route_id > 0)
            {
                info.Gadget.Platform = new()
                {
                    IsStarted = true,
                    RouteId = route_id,
                    StartIndex = 0,
                   // StartPos = GetClientOwner().world.currentBlock.routeData.routes.Find(route=>route.localId== route_id).points[0].pos,
                };
                RouteData route = GetClientOwner().world.currentBlock.routeData.routes.Find(route => route.localId == route_id);
                if (route != null)
                {
                    info.Gadget.Platform.StartPos = route.points[0].pos;
                }
            }
          //  if(GetGadgetExcel().hasMove )
               // if (chest_drop > 0) info.Gadget.GadgetType = 1;
            return info;
        }
    }
}
