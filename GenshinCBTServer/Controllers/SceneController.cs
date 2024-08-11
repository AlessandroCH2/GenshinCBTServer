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
           
            SwitchAvatar(session, session.GetCurrentAvatar());
            ScenePlayerLocationNotify locNotify = new() { PlayerLocList = { new PlayerLocationInfo() { Uid=session.uid,Pos= new Vector() { X = 200, Y = 500, Z = 200 },Rot=new Vector() } } };
            session.SendPacket((uint)CmdType.ScenePlayerLocationNotify, locNotify);
            session.SendPacket((uint)CmdType.EnterSceneDoneRsp, new EnterSceneDoneRsp() { Retcode = 0 });


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

            SendSceneTeamUpdate(session);
            SendEnterSceneInfo(session);
            HostPlayerNotify hostplayernotify = new() { HostUid = session.uid, HostPeerId = (uint)session.peer };

            session.SendPacket((uint)CmdType.HostPlayerNotify, hostplayernotify);
            session.SendPacket((uint)CmdType.SceneInitFinishRsp, new SceneInitFinishRsp() { Retcode = 0});
           
        }
        public static void SendSceneTeamUpdate(Client session)
        {

            AvatarTeamUpdateNotify sceneTeamUpdate = new();
            AvatarTeam team = new AvatarTeam();
            
           
            
            foreach (uint avatarId in session.team)
            {
               
                if (avatarId == 0)
                {
                    ulong randomGuid = (ulong)(avatarId + session.random.Next());
                    team.AvatarGuidList.Add(randomGuid);
                    sceneTeamUpdate.AvatarEntityIdMap.Add(randomGuid, 0);
                }
                else
                {
                    team.AvatarGuidList.Add(session.avatars.Find(av => av.id == avatarId).guid);
                    sceneTeamUpdate.AvatarEntityIdMap.Add(session.avatars.Find(av => av.id == avatarId).guid, session.avatars.Find(av => av.id == avatarId).asInfo().EntityId);
                }
                
            }
            sceneTeamUpdate.AvatarTeamMap.Add(0, team);
            sceneTeamUpdate.AvatarTeamMap.Add(1, team);
            sceneTeamUpdate.AvatarTeamMap.Add(2, team);
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
                EntityList = {prevAv.guid},
                DisappearType=VisionType.VisionReplace
            };
            SceneEntityAppearNotify appearNotify = new SceneEntityAppearNotify()
            {
                
                EntityList = { NewAv.asInfo() },
                AppearType = VisionType.VisionReplace
               
            };
            session.SendPacket((uint)CmdType.SceneEntityDisappearNotify, disappearNotify);
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
                    TeamEntityId = 0,
                    TeamAbilityInfo = new() 
                }
            };
            foreach (uint avatarId in session.team)
            {
                if(avatarId == 0) continue;
                playerEnterSceneInfoNotify.AvatarEnterInfo.Add(new AvatarEnterSceneInfo()
                {
                    AvatarEntityId = session.avatars.Find(av => av.id == avatarId).asInfo().EntityId,
                    WeaponEntityId = session.avatars.Find(av => av.id == avatarId).asInfo().Avatar.Weapon.EntityId,
                    AvatarGuid = session.avatars.Find(av => av.id == avatarId   ).asInfo().Avatar.Guid,
                    WeaponGuid = session.avatars.Find(av => av.id == avatarId).asInfo().Avatar.Weapon.Guid,
                    
                });
            }
            
            session.SendPacket((uint)CmdType.PlayerEnterSceneInfoNotify, playerEnterSceneInfoNotify);
        }
    }
}
