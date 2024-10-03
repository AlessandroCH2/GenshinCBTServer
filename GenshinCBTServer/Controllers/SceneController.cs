using GenshinCBTServer.Network;
using GenshinCBTServer.Player;
using GenshinCBTServer.Protocol;
using System;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Reflection.Metadata.Ecma335;
using static GenshinCBTServer.ResourceManager;

namespace GenshinCBTServer.Controllers
{
    public class SceneController
    {
        [Server.Handler(CmdType.ExecuteGadgetLuaReq)]
        public static void OnExecuteGadgetLuaReq(Client session, CmdType cmdId, Network.Packet packet)
        {
            ExecuteGadgetLuaReq req = packet.DecodeBody<ExecuteGadgetLuaReq>();
           GameEntity entity = session.world.entities.Find(e=>e.entityId==req.SourceEntityId);
            if(entity != null)
            {
                if(entity is GameEntityGadget) 
                {
                    GameEntityGadget gadget = (GameEntityGadget)entity;
                  //  session.world.onClientExecuteRequest(gadget, req.Param1, req.Param2, req.Param3);
                    session.SendPacket((uint)CmdType.ExecuteGadgetLuaRsp, new ExecuteGadgetLuaRsp() { Retcode = 0 });
                }
            }
        }
        [Server.Handler(CmdType.SceneEntityDrownReq)]
        public static void OnSceneEntityDrownReq(Client session, CmdType cmdId, Network.Packet packet)
        {
            SceneEntityDrownReq req = packet.DecodeBody<SceneEntityDrownReq>();
        }
        [Server.Handler(CmdType.PersonalSceneJumpReq)]
        public static void OnPersonalSceneJumpReq(Client session, CmdType cmdId, Packet packet)
        {
            PersonalSceneJumpReq req = packet.DecodeBody<PersonalSceneJumpReq>();
            ScenePointRow pointRow = Server.getResources().scenePointDict[session.currentSceneId];
            if (pointRow.points.ContainsKey(req.PointId)){
                session.TeleportToScene(pointRow.points[req.PointId].tranSceneId, pointRow.points[req.PointId].tranPos, pointRow.points[req.PointId].tranRot, EnterType.EnterJump);
                PersonalSceneJumpRsp rsp = new()
                {
                    DestPos = pointRow.points[req.PointId].tranPos,
                    DestSceneId = pointRow.points[req.PointId].tranSceneId,
                    Retcode = 0
                };

                session.SendPacket((uint)CmdType.PersonalSceneJumpRsp, rsp);
            }
           
        }
        [Server.Handler(CmdType.UnlockTransPointReq)]
        public static void OnUnlockTransPointReq(Client session, CmdType cmdId, Network.Packet packet)
        {

            UnlockTransPointReq req = packet.DecodeBody<UnlockTransPointReq>();
            session.unlockedPoints.Add(req.PointId);
            UnlockTransPointRsp rsp_ = new() { Retcode = 0 };
            GetScenePointRsp rsp = new GetScenePointRsp()
            {
                SceneId = req.SceneId,
                BelongUid = session.uid,

                Retcode = 0,

            };
            for (int i = 0; i < 5; i++)
            {
                rsp.UnlockAreaList.Add((uint)i);
            }
            rsp.UnlockedPointList.Add(session.unlockedPoints);
            session.SendPacket((uint)CmdType.GetScenePointRsp, rsp);
            session.SendPacket((uint)CmdType.UnlockTransPointRsp, rsp_);



        }
        [Server.Handler(CmdType.EnterSceneReadyReq)]
        public static void OnEnterSceneReadyReq(Client session, CmdType cmdId, Network.Packet packet)
        {

            EnterSceneReadyReq req = packet.DecodeBody<EnterSceneReadyReq>();
            EnterScenePeerNotify enterscenepeernotify = new EnterScenePeerNotify()
            {

                DestSceneId = session.currentSceneId,
                HostPeerId = (uint)session.gamePeer,
                PeerId = (uint)session.gamePeer

            };

            session.SendPacket((uint)CmdType.EnterScenePeerNotify, enterscenepeernotify);
            session.SendPacket((uint)CmdType.EnterSceneReadyRsp, new EnterSceneReadyRsp() { Retcode = 0 });


        }

       
        [Server.Handler(CmdType.SceneEntityMoveReq)]
        public static void OnSceneEntityMoveReq(Client session, CmdType cmdId, Network.Packet packet)
        {

            SceneEntityMoveReq req = packet.DecodeBody<SceneEntityMoveReq>();

            Avatar avatar = session.avatars.Find(av=>av.entityId==req.EntityId);
            if(avatar != null)
            {
               
                if(req.MotionInfo.Pos.X == 0 && req.MotionInfo.Pos.Y==0 && req.MotionInfo.Pos.Z == 0)
                {
                    //Client bug when jump
                }
                else
                {
                    session.motionInfo = req.MotionInfo;
                    session.world.UpdateBlocks();
                }
               // Server.Print($"Client Pos: {session.motionInfo.Pos.X}, {session.motionInfo.Pos.Y}, {session.motionInfo.Pos.Z}");
              
            }
            else
            {
                GameEntity entity = session.world.entities.Find(entity=>entity.entityId==req.EntityId);
                if(entity is GameEntityMonster)
                {
                    entity.MoveEntity(req.MotionInfo);
                }
            }
            session.SendPacket((uint)CmdType.SceneEntityMoveRsp, new SceneEntityMoveRsp() { Retcode = 0,EntityId=req.EntityId,FailMotion=req.MotionInfo,SceneTime=req.SceneTime,ReliableSeq=req.ReliableSeq });


        }

        [Server.Handler(CmdType.ChangeAvatarReq)]
        public static void OnChangeAvatarReq(Client session, CmdType cmdId, Network.Packet packet)
        {

            ChangeAvatarReq req = packet.DecodeBody<ChangeAvatarReq>();
            SwitchAvatar(session,(uint) req.Guid);
            ChangeAvatarRsp rsp = new ChangeAvatarRsp() { CurGuid = req.Guid, Retcode=0};
            session.SendPacket((uint)CmdType.ChangeAvatarRsp, rsp);

        }
        [Server.Handler(CmdType.GadgetInteractReq)]
        public static void OnGadgetInteractReq(Client session, CmdType cmdId, Network.Packet packet)
        {
            GadgetInteractReq req = packet.DecodeBody<GadgetInteractReq>();
            GameEntity entity_ = session.world.entities.Find(entity => entity.entityId == req.GadgetEntityId);
            if(entity_ != null)
            if (entity_ is GameEntityGadget)
            {

                GameEntityGadget entity = (GameEntityGadget)session.world.entities.Find(entity => entity.entityId == req.GadgetEntityId);
                    Server.Print("Type: " + entity.gadgetType);
                    if (entity.chest_drop > 0)
                    {

                        entity.ChangeState(GadgetState.ChestOpened);
                        session.world.KillEntities(new List<GameEntity>() { entity }, VisionType.VisionNone);

                        DropList dropList = Server.getResources().GetRandomDrops(session, entity.chest_drop, entity.motionInfo);
                        foreach (GameEntity en in dropList.entities)
                        {
                            session.world.SpawnEntity(en, true, VisionType.VisionReborn);
                        }

                        session.SendPacket((uint)CmdType.GadgetInteractRsp, new GadgetInteractRsp() { Retcode = (int)0, GadgetEntityId = req.GadgetEntityId, GadgetId = entity.id, InteractType = InteractType.InteractOpenChest, OpType = InterOpType.InterOpFinish });

                    }
                
               

            }else if (entity_ is GameEntityItem)
                {

                    GameEntityItem entity = (GameEntityItem)entity_;

                    
                        session.world.KillEntities(new List<GameEntity>() { entity }, VisionType.VisionNone);

                        session.AddItem(entity.item);

                        session.SendPacket((uint)CmdType.GadgetInteractRsp, new GadgetInteractRsp() { Retcode = (int)0, GadgetEntityId = req.GadgetEntityId, GadgetId = entity.id, InteractType = InteractType.InteractPickItem, OpType = InterOpType.InterOpStart });

                    



                }
                else if (entity_ is GameEntityMonster)
                {

                    GameEntityMonster entity = (GameEntityMonster)entity_;


                    session.world.KillEntities(new List<GameEntity>() { entity }, VisionType.VisionNone);

                    DropList dropList = Server.getResources().GetRandomDrops(session, entity.drop_id, entity.motionInfo);
                    foreach (GameEntity en in dropList.entities)
                    {
                        if(en is GameEntityItem)
                        {
                            GameEntityItem eni = (GameEntityItem)en;
                            session.AddItem(eni.item);
                        }
                        
                    }

                    session.SendPacket((uint)CmdType.GadgetInteractRsp, new GadgetInteractRsp() { Retcode = (int)0, GadgetEntityId = req.GadgetEntityId, GadgetId = entity.id, InteractType = InteractType.InteractGather, OpType = InterOpType.InterOpStart });





                }
        }

        [Server.Handler(CmdType.SceneTransToPointReq)]
        public static void OnSceneTransToPointReq(Client session, CmdType cmdId, Network.Packet packet)
        {
            SceneTransToPointReq req = packet.DecodeBody<SceneTransToPointReq>();
            ScenePointRow pointRow = Server.getResources().scenePointDict[3];
            if (pointRow == null) {
                Server.Print($"Point {req.PointId} not found");
                session.SendPacket((uint)CmdType.SceneTransToPointRsp, new SceneTransToPointRsp() { Retcode = (int)Retcode.RetFail });
                return;
            }
            MotionInfo newMotion;
            Dictionary<uint,ScenePoint> points = pointRow.points;
            ScenePoint point = points[req.PointId];
            Vector prevPos = session.motionInfo.Pos;
            switch (point.JsonObjType) {
                case "DungeonEntry":
                case "DungeonExit":
                    newMotion = new MotionInfo()
                    {
                        Pos=new Vector() { X=point.pos.X,Y=point.pos.Y,Z=point.pos.Z},
                        Rot=point.rot,
                        State=MotionState.MotionFallOnGround,
                        Speed = new Vector(),
                    };
                    break;
                case "SceneTransPoint":
                    newMotion = new MotionInfo()
                    {
                        Pos=new Vector() { X=point.tranPos.X,Y=point.tranPos.Y,Z=point.tranPos.Z},
                        Rot=point.tranRot,
                        State=MotionState.MotionFallOnGround,
                        Speed = new Vector(),
                    };
                    break;
                default:
                    Server.Print($"Unhandled ScenePoint type {point.JsonObjType} for scene point {req.PointId}");
                    session.SendPacket((uint)CmdType.SceneTransToPointRsp, new SceneTransToPointRsp() { Retcode = (int)Retcode.RetFail });
                    return;
            }
            Server.Print($"Teleporting to {req.PointId} at {session.motionInfo.Pos.X},{session.motionInfo.Pos.Y},{session.motionInfo.Pos.Z}");
            session.TeleportToScene(3,newMotion.Pos,newMotion.Rot,EnterType.EnterGoto);
            // session.SendPacket((uint)CmdType.PlayerEnterSceneNotify, new PlayerEnterSceneNotify() { SceneId = session.currentSceneId,PrevPos= prevPos, Pos=session.motionInfo.Pos,PrevSceneId= 0, Type=EnterType.EnterGoto,SceneBeginTime=0 });
            // session.SendPacket((uint)CmdType.ScenePlayerLocationNotify, new ScenePlayerLocationNotify() { PlayerLocList = { new PlayerLocationInfo() { Uid = session.uid, Pos = session.motionInfo.Pos, Rot = session.motionInfo.Rot } } });
             session.SendPacket((uint)CmdType.SceneTransToPointRsp, new SceneTransToPointRsp() { PointId = req.PointId, SceneId = 3, Retcode = 0 });
            // session.world.UpdateBlocks();
        }

        [Server.Handler(CmdType.EnterSceneDoneReq)]
        public static void OnEnterSceneDoneReq(Client session, CmdType cmdId, Network.Packet packet)
        {

            EnterSceneDoneReq req = packet.DecodeBody<EnterSceneDoneReq>();
            
            Avatar NewAv = session.avatars.Find(av => av.guid == session.GetCurrentAvatar());
            SceneEntityAppearNotify appearNotify = new SceneEntityAppearNotify()
            {
                Param= NewAv.asInfo().EntityId,
                EntityList = { NewAv.asInfo() },
                AppearType = VisionType.VisionNone

            };
            session.SendPacket((uint)CmdType.SceneEntityAppearNotify, appearNotify);
            ScenePlayerLocationNotify locNotify = new() { PlayerLocList = { new PlayerLocationInfo() { Uid = session.uid, Pos = session.motionInfo.Pos, Rot = session.motionInfo.Rot } } };
            session.SendPacket((uint)CmdType.ScenePlayerLocationNotify, locNotify);
            
            session.SendPacket((uint)CmdType.EnterSceneDoneRsp, new EnterSceneDoneRsp() { Retcode =0 });
            session.world.UpdateBlocks();
            //session.world.SendAllEntities();

        }

        [Server.Handler(CmdType.PlayerSetPauseReq)]
        public static void OnPlayerSetPauseReq(Client session, CmdType cmdId, Network.Packet packet)
        {
            // later should implement the pause on server side (for specific props, countdowns etc)
            PlayerSetPauseReq req = packet.DecodeBody<PlayerSetPauseReq>();
            PlayerSetPauseRsp rsp = new PlayerSetPauseRsp() { Retcode = 0 };
            session.SendPacket((uint)CmdType.PlayerSetPauseRsp, rsp);

        }

        [Server.Handler(CmdType.SetOpenStateReq)]
        public static void OnSetOpenStateReq(Client session, CmdType cmdId, Network.Packet packet)
        {
           
            SetOpenStateReq req = packet.DecodeBody<SetOpenStateReq>();
            SetOpenStateRsp rsp = new SetOpenStateRsp() { Key = req.Key, Value = req.Value, Retcode = 0 };
            session.SendPacket((uint)CmdType.SetOpenStateRsp, rsp);

        }

        [Server.Handler(CmdType.EnterWorldAreaReq)]
        public static void OnEnterWorldAreaReq(Client session, CmdType cmdId, Network.Packet packet)
        {
         
            EnterWorldAreaReq req = packet.DecodeBody<EnterWorldAreaReq>();
            EnterWorldAreaRsp rsp = new EnterWorldAreaRsp() { AreaId = req.AreaId, AreaType = req.AreaType, Retcode = 0 };
            session.SendPacket((uint)CmdType.EnterWorldAreaRsp, rsp);

        }

        [Server.Handler(CmdType.SceneGetAreaExplorePercentReq)]
        public static void OnSceneGetAreaExplorePercentReq(Client session, CmdType cmdId, Network.Packet packet)
        {
           
            SceneGetAreaExplorePercentReq req = packet.DecodeBody<SceneGetAreaExplorePercentReq>();
            SceneGetAreaExplorePercentRsp rsp = new SceneGetAreaExplorePercentRsp() { AreaId = req.AreaId, ExplorePercent = 1f, Retcode = 0 };
            session.SendPacket((uint)CmdType.SceneGetAreaExplorePercentRsp, rsp);

        }

        [Server.Handler(CmdType.GetScenePointReq)]
        public static void OnGetScenePointReq(Client session, CmdType cmdId, Network.Packet packet)
        {
            GetScenePointReq req = packet.DecodeBody<GetScenePointReq>();
            GetScenePointRsp rsp = new GetScenePointRsp()
            {
                SceneId = req.SceneId,
                BelongUid = req.BelongUid,
                
                Retcode = 0,
                
            };
            for (int i = 0; i < 200; i++) // todo: get from scene{player.pos.scenepoint}_point.json
            {
                rsp.UnlockAreaList.Add((uint)i);
                rsp.UnlockedPointList.Add((uint)i);
            }
            rsp.UnlockedPointList.Add(session.unlockedPoints);
            session.SendPacket((uint)CmdType.GetScenePointRsp, rsp);
        }
        [Server.Handler(CmdType.GetSceneAreaReq)]
        public static void OnGetSceneAreaReq(Client session, CmdType cmdId, Network.Packet packet)
        {
            GetSceneAreaReq req = packet.DecodeBody<GetSceneAreaReq>();
            GetSceneAreaRsp rsp = new GetSceneAreaRsp()
            {
                SceneId = req.SceneId,
                Retcode = 0,

            };
            for(int i=0; i < 200; i++) // 200 just in case, the client will ignore the extra areas
            {
                rsp.AreaIdList.Add((uint)i);
            }
            rsp.CityInfoList.Add(new CityInfo()
            {
                CityId = 1,
                Level = 10,
                CrystalNum = 10
            });
            session.SendPacket((uint)CmdType.GetSceneAreaRsp, rsp);
        }
        [Server.Handler(CmdType.SceneInitFinishReq)]
        public static void OnSceneInitFinishReq(Client session, CmdType cmdId, Network.Packet packet)
        {
            
            
            SceneInitFinishReq req = packet.DecodeBody<SceneInitFinishReq>();


            ScenePlayerInfoNotify sceneplayerinfonotify = new()
            {
                
            };
            sceneplayerinfonotify.PlayerInfoList.Add(new ScenePlayerInfo()
            {
                IsConnected = true,
                Uid = session.uid,
                Name = session.name,
                PeerId = (uint)session.gamePeer
            });

            session.SendPacket((uint)CmdType.ScenePlayerInfoNotify, sceneplayerinfonotify);

           // SendSceneTeamUpdate(session);

           
            SendEnterSceneInfo(session);
            //Send GameTime
            PlayerGameTimeNotify playerGameTimeNotify = new()
            {
                GameTime = 5 * 60 * 60,
                Uid = session.uid,
            };
            session.SendPacket((uint)CmdType.PlayerGameTimeNotify, playerGameTimeNotify);
            //Send SceneTime
            SceneTimeNotify sceneTimeNotify = new()
            {
                SceneId=session.currentSceneId,
                SceneTime=9000
            };
           
            session.SendPacket((uint)CmdType.SceneTimeNotify, sceneTimeNotify);

            HostPlayerNotify hostplayernotify = new() { HostUid = session.uid, HostPeerId = (uint)session.gamePeer };
          
            session.SendPacket((uint)CmdType.HostPlayerNotify, hostplayernotify);
            session.SendPacket((uint)CmdType.SceneInitFinishRsp, new SceneInitFinishRsp() { Retcode = 0});
          
        }
        [Server.Handler(CmdType.SetUpAvatarTeamReq)]
        public static void OnSetUpAvatarTeamReq(Client session, CmdType cmdId, Network.Packet packet)
        {
            SetUpAvatarTeamReq req = packet.DecodeBody<SetUpAvatarTeamReq>();

            uint[] team = new uint[req.AvatarTeam.AvatarGuidList.Count];
            int i = 0;
            foreach(uint g in req.AvatarTeam.AvatarGuidList)
            {
                team[i] = session.avatars.Find(av=>av.guid ==g).id;
                i++;
            }
            session.team = team;
            SendSceneTeamUpdate(session);
            
               
        }

            
        public static void SendSceneTeamUpdate(Client session)
        {

            AvatarTeamUpdateNotify sceneTeamUpdate = new();
            AvatarTeam team = new AvatarTeam();
          


            foreach (uint avatarId in session.team)
            {
               
               
                    team.AvatarGuidList.Add(session.avatars.Find(av => av.id == avatarId).guid);
                    sceneTeamUpdate.AvatarEntityIdMap.Add(session.avatars.Find(av => av.id == avatarId).guid, session.avatars.Find(av => av.id == avatarId).asInfo().EntityId);
                
                
            }
           // sceneTeamUpdate.AvatarTeamMap.Add(0, team);
            sceneTeamUpdate.AvatarTeamMap.Add(1, team);
            session.SendPacket((uint)CmdType.AvatarTeamUpdateNotify, sceneTeamUpdate);
            // session.SendAllAvatars();
            SetUpAvatarTeamRsp setUpAvatarTeamRsp = new SetUpAvatarTeamRsp()
            {
                AvatarTeam=team,
                Retcode = 0,
                TeamId=1,
                CurAvatarGuid= session.avatars.Find(av => av.guid == session.GetCurrentAvatar()).guid
                
            };
            SwitchAvatar(session, session.GetCurrentAvatar());
            session.SendPacket((uint)CmdType.SetUpAvatarTeamRsp, setUpAvatarTeamRsp);
            
           
        }

        private static void SwitchAvatar(Client session, uint guid)
        {
            Avatar prevAv =session.avatars.Find(av => av.guid == session.GetCurrentAvatar());
            session.selectedAvatar = (int)guid;
            Avatar NewAv = session.avatars.Find(av => av.guid==guid);

            SceneEntityDisappearNotify disappearNotify = new SceneEntityDisappearNotify()
            {
                EntityList = {prevAv.asInfo().EntityId},
                DisappearType=VisionType.VisionReplace
            };
            SceneEntityAppearNotify appearNotify = new SceneEntityAppearNotify()
            {
                
                EntityList = { NewAv.asInfo() },
                AppearType = VisionType.VisionReplace
               
            };
           if(guid!=prevAv.guid) session.SendPacket((uint)CmdType.SceneEntityDisappearNotify, disappearNotify);
            session.SendPacket((uint)CmdType.SceneEntityAppearNotify, appearNotify);
        }

        public static void SendEnterSceneInfo(Client session)
        {
            PlayerEnterSceneInfoNotify playerEnterSceneInfoNotify = new()
            {
                CurAvatarEntityId = session.avatars.Find(av => av.guid == session.GetCurrentAvatar()).asInfo().EntityId,
               
                TeamEnterInfo = new()
                {
                    TeamEntityId = session.teamEntityId,
                    TeamAbilityInfo = new() { IsInited=false} ,
                    
                }
            };
            foreach (uint avatarId in session.team)
            {
                Avatar avatar = session.avatars.Find(av => av.id == avatarId);
                if(avatar!=null)


                playerEnterSceneInfoNotify.AvatarEnterInfo.Add(new AvatarEnterSceneInfo()
                {
                    AvatarEntityId = avatar.asInfo().EntityId,
                    WeaponEntityId = avatar.asInfo().Avatar.Weapon.EntityId,
                    AvatarGuid = avatar.guid,
                    WeaponGuid = avatar.weaponGuid,
                    WeaponAbilityInfo = new() { IsInited = false},
                    AvatarAbilityInfo = new() { IsInited = false },
                    
                    
                });
               
            }
            
            session.SendPacket((uint)CmdType.PlayerEnterSceneInfoNotify, playerEnterSceneInfoNotify);
           // OnEnterSceneDoneReq(session, CmdType.EnterSceneDoneReq, new Packet() { cmdId=(uint) CmdType.EnterSceneDoneReq,finishedBody=new byte[] { } });
        }
    }
}
