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
        public uint sceneId;
        public Client client;

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
                     //   Server.Print("gadget id " + gadget.gadget_id);
                        uint entityId = ((uint)ProtEntityType.ProtEntityGadget << 24) + (uint)client.random.Next();
                        GameEntityGadget entity = new GameEntityGadget(
                            
                            entityId,
                            gadget.gadget_id,
                            new MotionInfo()
                            {
                                Pos=new Vector() { X=gadget.pos.X,Y=gadget.pos.Y,Z=gadget.pos.Z},
                                Rot=gadget.rot,
                                State=MotionState.MotionFallOnGround,
                                Speed = new Vector(),
                            }
                            );
                        entity.configId = gadget.config_id;
                        entity.groupId = group.id;
                        entity.owner = (uint)client.gamePeer;
                        entity.chest_drop = gadget.chest_drop_id;
                        entity.state = gadget.state;
                        entity.route_id = gadget.route_id;
                        SpawnEntity(entity);
                    }
                foreach (SceneMonster monster in group.monsters)
                {
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
    public class SceneGroup
    {
        public uint id;
        public uint refreshTime;
        public uint area;
        public Vector pos;

        public List<SceneGadget> gadgets = new List<SceneGadget>();
        public List<SceneNpc> npcs = new List<SceneNpc>();
        public List<SceneMonster> monsters = new List<SceneMonster>();
    }
    public class SceneGadget
    {
        public uint state;
        public uint config_id;
        public uint chest_drop_id;
        public uint gadget_id;
        public uint route_id;
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
