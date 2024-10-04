using GenshinCBTServer.Controllers;
using GenshinCBTServer.Excel;
using GenshinCBTServer.Protocol;
using Google.Protobuf.Collections;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static GenshinCBTServer.ResourceManager;
using static System.Formats.Asn1.AsnWriter;

namespace GenshinCBTServer.Player
{
    public abstract class BaseRoute
    {
        public bool IsStarted { get; set; }
        public bool IsActive { get; set; }
        public Vector StartPos { get; set; }
        public int StartSceneTime { get; set; }
        public int StopSceneTime { get; set; }

        protected BaseRoute(Vector startPos, bool isStarted, bool isActive)
        {
            this.StartPos = startPos;
            this.IsStarted = isStarted;
            this.IsActive = isActive;
        }

        protected BaseRoute(SceneGadget gadget)
        {
            this.StartPos = gadget.pos;
          //  this.IsStarted = gadget.StartRoute;
          //  this.IsActive = gadget.StartRoute;
        }

        public static BaseRoute FromSceneGadget(SceneGadget sceneGadget)
        {
            if (sceneGadget.route_id != 0)
            {
                return new ConfigRoute(sceneGadget);
            }
           /* else if (sceneGadget.IsUsePointArray)
            {
                return new PointArrayRoute(sceneGadget);
            }*/
            return null;
        }

        public bool StartRoute(World scene)
        {
            if (this.IsStarted)
            {
                return false;
            }
            this.IsStarted = true;
            this.IsActive = true;
            this.StartSceneTime = scene.GetSceneTime() + 300;
            return true;
        }

        public bool StopRoute(World scene)
        {
            if (!this.IsStarted)
            {
                return false;
            }
            this.IsStarted = false;
            this.IsActive = false;
            this.StartSceneTime = scene.GetSceneTime();
            this.StopSceneTime = scene.GetSceneTime();

            return true;
        }

        
        public virtual PlatformInfo ToProto()
        {
            var result = new PlatformInfo
            {
                IsStarted = IsStarted,
               StartPos = StartPos,
              
                StartSceneTime =(uint) StartSceneTime
            };

          

            return result;
        }
    }
    public class ConfigRoute : BaseRoute
    {
        public int RouteId { get; set; }
        public int StartIndex { get; set; }
        public List<int> ScheduledIndexes { get; set; }

        public ConfigRoute(SceneGadget gadget) : base(gadget)
        {
            this.RouteId = (int)gadget.route_id;
            this.StartIndex = 0;
            this.ScheduledIndexes = new List<int>();
        }

        public ConfigRoute(Vector startRot, bool startRoute, bool isActive, int routeId)
            : base(startRot, startRoute, isActive)
        {
            this.RouteId = routeId;
            this.StartIndex = 0;
            this.ScheduledIndexes = new List<int>();
        }

        public override PlatformInfo ToProto()
        {
            var proto = base.ToProto();

            proto.RouteId = (uint)this.RouteId;
            proto.StartIndex = StartIndex;
            return proto;
        }
    }
    public class GameEntityGadget : GameEntity
    {
        public uint chest_drop, route_id,gadgetType;
        public ConfigRoute Route = null;


        public void InitRoute(SceneGadget gadget)
        {
            Route = new ConfigRoute(gadget);
        }
        public void ChangeState(GadgetState state)
        {
            int oldState = (int)state;
            this.state = (uint)state;

            GadgetStateNotify notify = new GadgetStateNotify()
            {
                GadgetEntityId = entityId,
                IsEnableInteract = true,
                GadgetState = this.state
            };
            GetClientOwner().SendPacket((uint)CmdType.GadgetStateNotify, notify);
            ScriptArgs args = new((int)groupId, (int)EventType.EVENT_GADGET_STATE_CHANGE, (int)this.state, (int)this.configId);
            Server.Print("Gadget config id: " + configId);
            args.param3 = oldState;
            LuaManager.executeTriggersLua(GetClientOwner(), GetGroup(), args);
        }
        public GadgetData GetGadgetExcel()
        {
            return Server.getResources().GetGadgetData(id);
        }
        public GadgetProp GetGadgetPropExcel()
        {
            return Server.getResources().gadgetProps.Values.ToList().Find(e=>e.id==id);
        }
        public GadgetConfigRow GetGadgetConfigRow()
        {
            return Server.getResources().configGadgetDict[GetGadgetExcel().jsonName];
        }
        public override void InitProps()
        {
            GadgetProp prop = GetGadgetPropExcel();
            GadgetData gadgetData = GetGadgetExcel();
           
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
            props[(uint)PropType.PROP_IS_FLYABLE] = new PropValue() { Fval=1,Ival = 1, Val = (long)1, Type = (uint)PropType.PROP_IS_FLYABLE };
           
            if (prop != null)
            {
                FightPropUpdate(FightPropType.FIGHT_PROP_BASE_HP, prop.hp);
                FightPropUpdate(FightPropType.FIGHT_PROP_HP, prop.hp);
                FightPropUpdate(FightPropType.FIGHT_PROP_CUR_HP, prop.hp);
                FightPropUpdate(FightPropType.FIGHT_PROP_BASE_DEFENSE, prop.defense);
                FightPropUpdate(FightPropType.FIGHT_PROP_DEFENSE, prop.defense);
                FightPropUpdate(FightPropType.FIGHT_PROP_CUR_DEFENSE, prop.defense);
            }

            if (gadgetData.jsonName != "" && Server.getResources().configGadgetDict.ContainsKey(gadgetData.jsonName))
            {
                GadgetConfigRow row = Server.getResources().configGadgetDict[gadgetData.jsonName];
                ConfigCombatProperty property = row.Combat.property;
                if (property.HP > 0) FightPropUpdate(FightPropType.FIGHT_PROP_HP, property.HP);
                if (property.attack > 0) FightPropUpdate(FightPropType.FIGHT_PROP_DEFENSE, property.attack);
                if (property.defense > 0) FightPropUpdate(FightPropType.FIGHT_PROP_ATTACK, property.defense);
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
                AiInfo = new()
                {
                    BornPos=motionInfo.Pos,
                    IsAiOpen=true,
                }
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
                      GadgetType = gadgetType,
                    IsEnableInteract = false,
                      AuthorityPeerId =owner,
                      
                   
                    //  GadgetType = 1
                    
                      

                };
            if(Route!=null)
            {
                info.Gadget.Platform = Route.ToProto();
               /* RouteData route = GetClientOwner().world.currentBlock.routeData.routes.Find(route => route.localId == route_id);
                if (route != null)
                {
                    info.Gadget.Platform.StartPos = route.points[0].pos;
                }
                else
                {
                    info.Gadget.Platform.StartPos = motionInfo.Pos;

                }*/
            }
         
            return info;
        }

        public override bool onInteract(Client session, GadgetInteractReq req)
        {
            if (chest_drop > 0)
            {
                ChangeState(GadgetState.ChestOpened);
                session.world.KillEntities(new List<GameEntity>() { this }, VisionType.VisionNone);
                DropList dropList = Server.getResources().GetRandomDrops(session, chest_drop, motionInfo);
                foreach (GameEntity en in dropList.entities)
                {
                    session.world.SpawnEntity(en, true, VisionType.VisionReborn);
                }
                session.SendPacket((uint)CmdType.GadgetInteractRsp, new GadgetInteractRsp() { Retcode = (int)0, GadgetEntityId = req.GadgetEntityId, GadgetId = id, InteractType = InteractType.InteractOpenChest, OpType = InterOpType.InterOpFinish });
                LuaManager.executeTriggersLua(session, GetGroup(), new ScriptArgs((int)groupId, (int)EventType.EVENT_GATHER, (int)configId));
                return true;
            }
            else
            {
                return false;
            }
        }
        public Vector prevpos;
        public bool StartPlatform()
        {
            if (Route == null)
            {
                return false;
            }
            if(Route.IsStarted)
            {
                return true;
            }
            RouteData routeData = GetClientOwner().world.currentBlock.routeData.routes.Find(route => route.localId == route_id);
            if (routeData != null)
            {
                List<RoutePointData> points = routeData.points;
                if(Route.StartIndex==points.Count-1) {
                    Route.StartIndex = 0;

                }
                int curIndex = Route.StartIndex;
                if (curIndex == 0)
                {
                    prevpos = this.motionInfo.Pos;
                    //Call event lua
                    ScriptArgs args = new((int)groupId, (int)EventType.EVENT_PLATFORM_REACH_POINT, (int)configId, Route.RouteId);
                    args.param3 = 0;
                    LuaManager.executeTriggersLua(GetClientOwner(), GetGroup(), args);
                }
                else
                {
                    prevpos = points[curIndex].pos;
                }
                Route.IsStarted = true;
                double time = 0;
                for(int i = curIndex; i < points.Count; i++)
                {
                    time += World.DistanceTo(prevpos, points[i].pos) / points[i].targetVelocity;
                    prevpos = points[i].pos;
                    int I = i;
                    GetClientOwner().world.ScheduleDelayedTask(() =>
                    {
                        if (points[i].hasReachEvent && I > curIndex)
                        {
                            ScriptArgs args = new((int)this.groupId, (int)EventType.EVENT_PLATFORM_REACH_POINT, (int)this.configId,Route.RouteId);
                            args.param3 = I;
                            args.source_eid = (int)configId;
                            LuaManager.executeTriggersLua(GetClientOwner(), GetGroup(), args);
                        }
                        Route.StartIndex = I;
                        this.MoveEntity(new MotionInfo() { Pos= points[I].pos},true);

                        if (I == points.Count - 1)
                        {
                            Route.IsStarted = false;
                        }
                    },(int)time);
                }

               
            }
            GetClientOwner().SendPacket((uint)CmdType.SceneTimeNotify, new SceneTimeNotify() { SceneId = GetClientOwner().currentSceneId, SceneTime = (ulong)GetClientOwner().world.GetSceneTime() });
            PlatformStartRouteNotify ntf = new PlatformStartRouteNotify()
            {
                EntityId = entityId,
                Platform = asInfo().Gadget.Platform,
                SceneTime = (uint)GetClientOwner().world.GetSceneTime()
            };
            GetClientOwner().SendPacket((uint)CmdType.PlatformStartRouteNotify, ntf);
            return true;
        }
    }
}
