using GenshinCBTServer.Player;
using GenshinCBTServer.Protocol;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenshinCBTServer.Controllers
{
    public class SceneController
    {

        [Server.Handler(CmdType.EnterSceneReadyReq)]
        public static void OnEnterSceneReadyReq(Client session, CmdType cmdId, Network.Packet packet)
        {

            EnterSceneReadyReq req = packet.DecodeBody<EnterSceneReadyReq>();
            EnterScenePeerNotify enterscenepeernotify = new EnterScenePeerNotify()
            {

                DestSceneId = session.currentSceneId,
                HostPeerId = (uint)session.peer,
                PeerId = (uint)session.peer,

            };

            session.SendPacket((uint)CmdType.EnterScenePeerNotify, enterscenepeernotify);
            session.SendPacket((uint)CmdType.EnterSceneReadyRsp, new EnterSceneReadyRsp() { Retcode = 0 });


        }
       
        [Server.Handler(CmdType.SceneEntityMoveReq)]
        public static void OnSceneEntityMoveReq(Client session, CmdType cmdId, Network.Packet packet)
        {

            SceneEntityMoveReq req = packet.DecodeBody<SceneEntityMoveReq>();

           
            session.SendPacket((uint)CmdType.SceneEntityMoveRsp, new SceneEntityMoveRsp() { Retcode = 0,EntityId=req.EntityId,FailMotion=req.MotionInfo,SceneTime=req.SceneTime,ReliableSeq=req.ReliableSeq });


        }
        [Server.Handler(CmdType.EnterSceneDoneReq)]
        public static void OnEnterSceneDoneReq(Client session, CmdType cmdId, Network.Packet packet)
        {

            EnterSceneDoneReq req = packet.DecodeBody<EnterSceneDoneReq>();
            Avatar NewAv = session.avatars.Find(av => av.guid == session.GetCurrentAvatar());
            SceneEntityAppearNotify appearNotify = new SceneEntityAppearNotify()
            {

                EntityList = { NewAv.asInfo() },
                AppearType = VisionType.VisionMeet

            };
            ScenePlayerLocationNotify locNotify = new() { PlayerLocList = { new PlayerLocationInfo() { Uid=session.uid,Pos= new Vector() { X = 200, Y = 500, Z = 200 },Rot=new Vector() { X = 200, Y = 500, Z = 200 } } } };
            session.SendPacket((uint)CmdType.ScenePlayerLocationNotify, locNotify);
            session.SendPacket((uint)CmdType.EnterSceneDoneRsp, new EnterSceneDoneRsp() { Retcode = 0 });


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
            for (int i = 0; i < 5; i++)
            {
                rsp.UnlockAreaList.Add((uint)i);
            }
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
            for(int i=0; i < 5; i++)
            {
                rsp.AreaIdList.Add((uint)i);
            }
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
                PeerId = (uint)session.peer
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

            HostPlayerNotify hostplayernotify = new() { HostUid = session.uid, HostPeerId = (uint)session.peer };

            session.SendPacket((uint)CmdType.HostPlayerNotify, hostplayernotify);
            session.SendPacket((uint)CmdType.SceneInitFinishRsp, new SceneInitFinishRsp() { Retcode = 0});
           
        }
        public static void SendSceneTeamUpdate(Client session)
        {

            AvatarTeamUpdateNotify sceneTeamUpdate = new();
            AvatarTeam team = new AvatarTeam();
            AvatarTeam eteam = new AvatarTeam();


            foreach (uint avatarId in session.team)
            {
               
                if (avatarId == 0)
                {
                    ulong randomGuid = (ulong)(avatarId + session.random.Next());
                  //  team.AvatarGuidList.Add(randomGuid);
                   // sceneTeamUpdate.AvatarEntityIdMap.Add(randomGuid, 0);
                }
                else
                {
                    team.AvatarGuidList.Add(session.avatars.Find(av => av.id == avatarId).guid);
                    sceneTeamUpdate.AvatarEntityIdMap.Add(session.avatars.Find(av => av.id == avatarId).guid, session.avatars.Find(av => av.id == avatarId).asInfo().EntityId);
                }
                
            }
           // sceneTeamUpdate.AvatarTeamMap.Add(0, team);
            sceneTeamUpdate.AvatarTeamMap.Add(1, team);
            sceneTeamUpdate.AvatarTeamMap.Add(2, eteam);
            sceneTeamUpdate.AvatarTeamMap.Add(3, eteam);
            sceneTeamUpdate.AvatarTeamMap.Add(4, eteam);
            sceneTeamUpdate.AvatarTeamMap.Add(5, eteam);
            session.SendAllAvatars();
            SetUpAvatarTeamRsp setUpAvatarTeamRsp = new SetUpAvatarTeamRsp()
            {
                AvatarTeam=team,
                Retcode = 0,
                TeamId=1,
                CurAvatarGuid= session.avatars.Find(av => av.guid == session.GetCurrentAvatar()).guid
                
            };
            session.SendPacket((uint)CmdType.SetUpAvatarTeamRsp, setUpAvatarTeamRsp);
            session.SendPacket((uint)CmdType.AvatarTeamUpdateNotify, sceneTeamUpdate);
            SwitchAvatar(session, session.GetCurrentAvatar());
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
                AvatarEnterInfo =
                {
                    
                },
                TeamEnterInfo = new()
                {
                    TeamEntityId = session.teamEntityId,
                    TeamAbilityInfo = new() { IsInited=false} ,
                    
                }
            };
            foreach (uint avatarId in session.team)
            {
                if(avatarId == 0) continue;
                
                playerEnterSceneInfoNotify.AvatarEnterInfo.Add(new AvatarEnterSceneInfo()
                {
                    AvatarEntityId = session.avatars.Find(av => av.id == avatarId).asInfo().EntityId,
                    WeaponEntityId = session.avatars.Find(av => av.id == avatarId).asInfo().Avatar.Weapon.EntityId,
                    AvatarGuid = session.avatars.Find(av => av.id == avatarId   ).guid,
                    WeaponGuid = session.avatars.Find(av => av.id == avatarId).weaponGuid,
                    WeaponAbilityInfo = new() { IsInited = false},
                    AvatarAbilityInfo = new() { IsInited = false },
                    
                });
            }
            
            session.SendPacket((uint)CmdType.PlayerEnterSceneInfoNotify, playerEnterSceneInfoNotify);
        }
    }
}
