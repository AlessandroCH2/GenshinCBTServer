using GenshinCBTServer.Controllers;
using GenshinCBTServer.Excel;
using GenshinCBTServer.Protocol;
using Newtonsoft.Json;
using NLua;
using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace GenshinCBTServer.Player
{
    public class World
    {
        public int sceneTime;
        public uint sceneId;
        public Client client;
        public uint monsterDieCount = 0;

        public List<GameEntity> entities = new List<GameEntity>();
        public List<uint> mobEntitiesNear = new List<uint>();
        
      

        public List<SceneBlock> loadedBlocks = new List<SceneBlock>();
        public SceneExcel excel;
        public SceneBlock currentBlock;
        public World(Client client)
        {
            this.client = client;
           
        }
        public void LoadNewScene(uint sceneId)
        {

            ResetScene();
            this.sceneId = sceneId;
            excel = Server.getResources().scenes.Find(sc => sc.sceneId == sceneId);
            //Load();
        }
        public void ResetScene()
        {
            mobEntitiesNear.Clear();
            KillEntities(entities);
            entities.Clear();
            currentBlock = null;
            monsterDieCount = 0;
           
        }
        public void KillEntities(List<GameEntity> tokill,VisionType disType = VisionType.VisionNone)
        {
            SceneEntityDisappearNotify notify = new();
            foreach(GameEntity entity in tokill)
            {
                if(tokill != entities)entities.Remove(entity);
                notify.EntityList.Add(entity.entityId);
                LifeStateChangeNotify notify1 = new LifeStateChangeNotify() { EntityId=entity.entityId,LifeState=(int)LifeState.LIFE_DEAD,DieType=PlayerDieType.PlayerDieNone};
                client.SendPacket((uint)CmdType.LifeStateChangeNotify, notify1);
                if (entity is GameEntityMonster)
                {
                    monsterDieCount++;
                }
            }
            notify.DisappearType = disType;
            client.SendPacket((uint)CmdType.SceneEntityDisappearNotify, notify);
        }
        public void UnloadCurrentBlock()
        {
            List<GameEntity> toKill = new List<GameEntity>();
            foreach (GameEntity entity in entities)
            {
                if (currentBlock.insideRegion(entity.motionInfo.Pos))
                {
                   
                    toKill.Add(entity);

                }
            }
            KillEntities(toKill);
            mobEntitiesNear.Clear();
        }
        public void UpdateBlocks()
        {
            if(currentBlock!=null)
            {
                if (currentBlock != GetBlockByPosition())
                {
                    UnloadCurrentBlock();
                    currentBlock = GetBlockByPosition();
                   // Server.Print($"New block min pos: {currentBlock.minPos.X}, {currentBlock.minPos.Y}");
                    if (currentBlock != null)
                    {
                        Load();
                    }
                }
            }
            else
            {
                currentBlock = GetBlockByPosition();
                if(currentBlock!=null)
                {
                    Load();
                }
            }
            UpdateMobs();
            UpdateRegions();
        }
        public void UpdateRegions()
        {
            try
            {
                if (currentBlock == null || currentBlock.groups == null)
                {
                    Server.Print($"Current {(currentBlock == null ? "currentBlock" : (currentBlock.groups == null ? "currentBlock.groups" : "none"))} is null");
                    return;
                }
                foreach (SceneGroup group in currentBlock.groups)
                {
                    foreach (SceneRegion region in group.regions)
                    {
                        foreach (GameEntity entity in entities)
                        {
                            if (entity == null) break;
                            if (mobEntitiesNear.Contains(entity.entityId))
                            {
                                if (region.Inside(entity.motionInfo.Pos))
                                {
                                    if (!entity.inRegions.Contains(region.config_id))
                                    {
                                        entity.inRegions.Add(region.config_id);
                                        ScriptArgs args = new((int)group.id, (int)EventType.EVENT_ENTER_REGION, (int)region.config_id);
                                        args.target_eid = (int)entity.entityId;
                                        args.source_eid = (int)region.config_id;
                                        LuaManager.executeTriggersLua(client, group, args);
                                        Server.Print($"Entering region id " + region.config_id);
                                    }


                                }
                                else
                                {

                                    if (entity.inRegions.Contains(region.config_id))
                                    {
                                        entity.inRegions.Remove(region.config_id);
                                        ScriptArgs args = new((int)group.id, (int)EventType.EVENT_LEAVE_REGION, (int)region.config_id);
                                        args.target_eid = (int)client.avatars.Find(a=>a.guid==client.GetCurrentAvatar()).entityId;
                                        args.source_eid = (int)region.config_id;
                                        LuaManager.executeTriggersLua(client, group, args);
                                        Server.Print($"Leaving region id " + region.config_id);
                                    }

                                }
                            }

                        }
                        //Check avatar
                        if (region.Inside(client.motionInfo.Pos))
                        {
                            if (!client.inRegions.Contains(region.config_id))
                            {
                                client.inRegions.Add(region.config_id);
                                ScriptArgs args = new((int)group.id, (int)EventType.EVENT_ENTER_REGION, (int)region.config_id);
                                args.target_eid = (int)client.avatars.Find(a => a.guid == client.GetCurrentAvatar()).entityId;
                                args.source_eid = (int)region.config_id;
                                LuaManager.executeTriggersLua(client, group, args);
                                Server.Print($"Avatar Entering region id " + region.config_id);
                            }
                        }
                        else
                        {
                            if (client.inRegions.Contains(region.config_id))
                            {
                               client.inRegions.Remove(region.config_id);
                            ScriptArgs args = new((int)group.id, (int)EventType.EVENT_LEAVE_REGION, (int)region.config_id);
                            args.target_eid = (int)client.avatars.Find(a=>a.guid==client.GetCurrentAvatar()).entityId;
                            args.source_eid = (int)region.config_id;
                            LuaManager.executeTriggersLua(client, group, args);
                            Server.Print($"AvatarLeaving region id " + region.config_id);
                            }
                        }
                    }
                }
            }
            catch(Exception e)
            {

            }
           
            
        }
        public void UpdateMobs()
        {
            foreach (GameEntity entity in entities)
            {
                if(entity is GameEntityMonster)
                {
                    GameEntityMonster monster = (GameEntityMonster)entity;
                    if (mobEntitiesNear.Contains(monster.entityId))
                    {
                        if (DistanceTo(monster.motionInfo.Pos, client.motionInfo.Pos) > 50)
                        {
                            mobEntitiesNear.Remove(monster.entityId);
                            SceneEntityDisappearNotify notify = new() { EntityList = {monster.entityId } };
                            LifeStateChangeNotify ln = new() { EntityId= entity.entityId,LifeState=(uint)LifeState.LIFE_DEAD,DieType=PlayerDieType.PlayerDieNone };
                            client.SendPacket((uint)CmdType.LifeStateChangeNotify, ln);
                            client.SendPacket((uint)CmdType.SceneEntityDisappearNotify, notify);
                        }
                    }
                    else
                    {
                        if(DistanceTo(monster.motionInfo.Pos,client.motionInfo.Pos) < 50)
                        {
                            mobEntitiesNear.Add(monster.entityId);
                            SceneEntityAppearNotify appearNotify = new SceneEntityAppearNotify()
                            {

                                EntityList = { monster.asInfo() },
                                AppearType = VisionType.VisionNone

                            };
                            client.SendPacket((uint)CmdType.SceneEntityAppearNotify, appearNotify);
                        }
                    }
                }
            }
        }
        public SceneBlock GetBlockByPosition()
        {
            foreach(SceneBlock block in excel.sceneBlocks)
            {
                if (block.insideRegion(client.motionInfo.Pos))
                {
                    return block;
                }
            }
            return null;
        }
        public static double DistanceTo(Vector from, Vector to)
        {
            var result = Math.Sqrt(Math.Pow((from.X - to.X), 2) + Math.Pow((from.Y - to.Y), 2));
            return result;
        }
        public void Load()
        {
            SceneBlock block = currentBlock;
                foreach(SceneGroup group in block.groups)
                {
                    foreach(SceneGadget gadget in group.gadgets)
                    {
                        
                        if (!group.isInSuite((int)gadget.config_id)) continue;
                        
                        uint entityId = ((uint)ProtEntityType.ProtEntityGadget << 24) + (uint)client.random.Next();
                        ItemData itemData = Server.getResources().itemData.Values.ToList().Find(i=>i.gadgetId==gadget.gadget_id);
                        GadgetData gData=Server.getResources().gadgetDataDict.Values.ToList().Find(i => i.id == gadget.gadget_id);
                        if(gData!=null)
                        if (itemData != null && gData.type==22)
                        {
                       
                        GameEntityItem entity = new GameEntityItem(entityId, gadget.gadget_id, new MotionInfo()
                        {
                            Pos = new Vector() { X = gadget.pos.X, Y = gadget.pos.Y, Z = gadget.pos.Z },
                            Rot = gadget.rot,
                          
                            
                        },
                        new GameItem(client, itemData.id));
                        entity.item.amount = 1;
                        entity.configId = gadget.config_id;
                        entity.groupId = group.id;
                        entity.owner = (uint)client.gamePeer;
                        
                        entity.state = (uint)gadget.state;
                        SpawnEntity(entity);
                        }
                        else
                        {
                        GameEntityGadget entity = new GameEntityGadget(

                            entityId,
                            gadget.gadget_id,
                            new MotionInfo()
                            {
                                Pos = new Vector() { X = gadget.pos.X, Y = gadget.pos.Y - 1, Z = gadget.pos.Z },
                                Rot = gadget.rot,
                                State = MotionState.MotionFallOnGround,
                                Speed = new Vector() { Y = 0.01f },
                            }
                        );
                        entity.configId = gadget.config_id;
                        entity.groupId = group.id;
                        entity.owner = (uint)client.gamePeer;
                        entity.chest_drop = gadget.chest_drop_id;
                        entity.state = (uint)gadget.state;
                        entity.route_id = gadget.route_id;
                        entity.gadgetType = gadget.type;
                        if (entity.route_id > 0) entity.InitRoute(gadget);
                        SpawnEntity(entity);
                        /*if (entity.route_id > 0)
                        {
                            PlatformStartRouteNotify ntf = new PlatformStartRouteNotify()
                            {
                                EntityId = entity.entityId,
                                Platform = entity.asInfo().Gadget.Platform,
                                SceneTime = 9000
                            };
                            client.SendPacket((uint)CmdType.PlatformStartRouteNotify, ntf);
                        }*/
                    }


                       
                    }
                foreach (SceneMonster monster in group.monsters)
                {
                    if (!group.isInSuite((int)monster.config_id)) continue;
                    //   Server.Print("gadget id " + gadget.gadget_id);
                    uint entityId = ((uint)ProtEntityType.ProtEntityMonster << 24) + (uint)client.random.Next();
                    GameEntityMonster entity = new GameEntityMonster(

                        entityId,
                        monster.monster_id,
                        new MotionInfo()
                        {
                            Pos = monster.pos,
                            Rot = monster.rot,
                            State = MotionState.MotionFallOnGround,
                            Speed = new Vector(),
                        },monster.level
                        );
                    entity.configId = monster.config_id;
                    entity.groupId = group.id;
                    entity.owner = (uint)client.gamePeer;
                
                    entity.drop_id = monster.drop_id;
                    entity.pose_id = monster.pose_id;
                    SpawnEntity(entity);
                }
                foreach (SceneNpc npc in group.npcs)
                    {
                        uint entityId = ((uint)ProtEntityType.ProtEntityNpc << 24) + (uint)client.random.Next();
                       GameEntity entity = new GameEntity(
                       
                       entityId,
                       npc.npc_id,
                       new MotionInfo()
                       {
                           Pos = npc.pos,
                           Rot = npc.rot,
                           Speed = new Vector(),

                           State = MotionState.MotionNone
                       }, ProtEntityType.ProtEntityNpc
                       ) ;
                        entity.configId = npc.config_id;
                        entity.groupId = group.id;
                        entity.owner = (uint)client.gamePeer;
                        SpawnEntity(entity);
                    }
                }
            SendAllEntities();
        }
        public void SpawnEntity(GameEntity entity, bool notify=false, VisionType vision = VisionType.VisionMeet)
        {
            entities.Add(entity);
            //Send spawn packet
            if (notify)
            {
                SceneEntityAppearNotify appearNotify = new SceneEntityAppearNotify()
                {
                   
                    EntityList = { entity.asInfo() },
                    AppearType = vision

                };
                client.SendPacket((uint)CmdType.SceneEntityAppearNotify, appearNotify);
            }
        }
        public void SendAllEntities()
        {
           
            int i = 0;
            foreach (GameEntity entity in entities)
            {
                i++;
                SceneEntityAppearNotify appearNotify = new SceneEntityAppearNotify()
                {

                    EntityList = { entity.asInfo() },
                    AppearType = VisionType.VisionMeet

                };
               if(entity is not GameEntityMonster) client.SendPacket((uint)CmdType.SceneEntityAppearNotify, appearNotify);
            }
          //  client.SendPacket((uint)CmdType.SceneEntityAppearNotify, appearNotify);
        }

        public void onClientExecuteRequest(GameEntityGadget gadget, int param1, int param2, int param3)
        {
            LuaManager.executeClientTriggerLua(client, currentBlock.groups.Find(g => g.id == gadget.groupId), new ScriptArgs((int)gadget.groupId, (int)EventType.EVENT_CLIENT_EXECUTE) { source_eid = (int)gadget.entityId,param1=param1,param2=param2,param3=param3 });
        }

        public void callEvent(ScriptArgs args)
        {
            List<GroupTrigger> triggers = getTriggersByEvent(args.type).FindAll(t=>t.groupId==args.group_id || args.group_id == 0);

            foreach(GroupTrigger trigger in triggers)
            {
                LuaManager.executeTrigger(this.client, trigger, args);
            }

        }
        public List<GroupTrigger> getTriggersByEvent(int type)
        {
            List<GroupTrigger> triggers = new();
            if(currentBlock!=null)
            foreach(SceneGroup group in currentBlock.groups)
            {
                    triggers.AddRange(group.triggers.FindAll(t => t.eventType == type));
            }
            return triggers;
        }

        public int GetSceneTime()
        {
            return sceneTime;
        }

        public void ScheduleDelayedTask(Action value, int time)
        {
            new Thread(new ThreadStart(() =>
            {
                Thread.Sleep(time);
                value.Invoke();
            }));
        }
    }

    public class SceneBlock
    {
        public uint blockId;
        public Vector minPos,maxPos;
        public List<SceneGroup> groups = new List<SceneGroup>();
        public SceneBlockRoutes routeData = new();
        public bool insideRegion(Vector point)
        {
            float minX = Math.Min(minPos.X, maxPos.X);
            float maxX = Math.Max(minPos.X, maxPos.X);
            float minY = Math.Min(minPos.Z, maxPos.Z);
            float maxY = Math.Max(minPos.Z, maxPos.Z);
            return point.X >= minX && point.X <= maxX && point.Z >= minY && point.Z <= maxY;
        }
    }
    public class GroupTrigger
    {
        public string name;
        public int eventType;
        public string conditionLua;
        public string actionLua;

        public int groupId;

    }

    public class Variable
    {
        public string name;
        public int value;
    }
    public class GroupSuite
    {
        public int[] monsters;
        public int[] gadgets;
        public int[] regions;
        
    }
    public class SceneGroup
    {
        public string luaFile;
        public uint id;
        public uint refreshTime;
        public uint area;
        public Vector pos;
        public List<Variable> variables = new List<Variable>();
        public List<SceneGadget> gadgets = new List<SceneGadget>();
        public List<SceneNpc> npcs = new List<SceneNpc>();
        public List<SceneMonster> monsters = new List<SceneMonster>();
        public List<GroupTrigger> triggers = new List<GroupTrigger>();
        public List<SceneRegion> regions = new List<SceneRegion>();

        public List<GroupSuite> suites = new();

        public bool isInSuite(int id)
        {
            return suites.Find(s=>s.monsters.Contains(id) || s.gadgets.Contains(id)) != null;
        }
    }
    public class SceneRegion
    {
        public uint config_id;
        public uint shape;
        public float radius;
        public Vector pos;
        public Vector size;

        public bool Inside(Vector pos)
        {
           if(size == null)
            {
                if(World.DistanceTo(this.pos,pos) < radius)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
    }
    public class SceneGadget
    {
        public int state;
        public uint config_id;
        public uint chest_drop_id;
        public uint gadget_id;
        public uint route_id;
        public uint type;
        public bool showcutscene;
        public Vector pos;
        public Vector rot;
    }
    public class SceneMonster
    {
        public uint level;
        public uint config_id;
        public uint drop_id, pose_id;
        public uint monster_id;
        public Vector pos;
        public Vector rot;
    }
    public class SceneNpc
    {
        public uint config_id;
        public uint npc_id;
        public Vector pos;
        public Vector rot;
    }

}
