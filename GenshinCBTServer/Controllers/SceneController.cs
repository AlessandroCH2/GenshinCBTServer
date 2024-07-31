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
        [Server.Handler(CmdType.EnterSceneDoneReq)]
        public static void OnEnterSceneDoneReq(Client session, CmdType cmdId, Network.Packet packet)
        {

            EnterSceneDoneReq req = packet.DecodeBody<EnterSceneDoneReq>();

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



            HostPlayerNotify hostplayernotify = new() { HostUid = session.uid, HostPeerId = (uint)session.peer };

            session.SendPacket((uint)CmdType.HostPlayerNotify, hostplayernotify);
            session.SendPacket((uint)CmdType.SceneInitFinishRsp, new SceneInitFinishRsp() { Retcode = 0 });
        }

    }
}
