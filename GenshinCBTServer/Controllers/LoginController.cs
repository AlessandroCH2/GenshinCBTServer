using GenshinCBTServer.Excel;
using GenshinCBTServer.Player;
using GenshinCBTServer.Protocol;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace GenshinCBTServer.Controllers
{
    public class LoginController
    {
        [Server.Handler(CmdType.GetPlayerTokenReq)]
        public static void OnGetPlayerTokenReq(Client session, CmdType cmdId, Network.Packet packet)
        {
            GetPlayerTokenReq req = packet.DecodeBody<GetPlayerTokenReq>();
            GetPlayerTokenRsp resp = new GetPlayerTokenRsp()
            {
                AccountUid = "1",
                AccountType = 0,
                Token = req.AccountToken,
                Retcode = 0,
                Uid = 1,
                Msg = "Funziona",
            };

            session.SendPacket((uint)CmdType.GetPlayerTokenRsp, resp);
        }
        [Server.Handler(CmdType.SetPlayerBornDataReq)]
        public static void OnSetPlayerBornDataReq(Client session, CmdType cmdId, Network.Packet packet)
        {
            SetPlayerBornDataReq req = packet.DecodeBody<SetPlayerBornDataReq>();
            session.name = req.NickName;
            session.avatars.Add(new Avatar(session, req.AvatarId));
            //  session.avatars.Add(new Avatar(session, 10000016));

            session.selectedAvatar = (int)session.avatars[0].guid;
            foreach (AvatarData av in Server.getResources().avatarsData)
            {
                if (av.id != req.AvatarId) session.avatars.Add(new Avatar(session, av.id));
            }

            // session.team = new uint[] { session.avatars[0].id, session.avatars[1].id };
            PlayerDataNotify playerDataNotify = new PlayerDataNotify()
            {
                NickName = session.name,
                ServerTime = 0,

            };
            playerDataNotify.PropMap.Add(session.GetPlayerProps());
            session.SendPacket((uint)CmdType.PlayerDataNotify, playerDataNotify);
            session.TeleportToScene(3);
            session.SendPacket((uint)CmdType.SetPlayerBornDataRsp, new SetPlayerBornDataRsp() { });
            session.SendInventory();
            session.SendAllAvatars();
        }
        [Server.Handler(CmdType.PlayerLoginReq)]
        public static void OnPlayerLoginReq(Client session, CmdType cmdId, Network.Packet packet)
        {

            PlayerLoginReq req = packet.DecodeBody<PlayerLoginReq>();
            session.InitiateAccount(req.Token);
            PlayerLoginRsp resp = new PlayerLoginRsp()
            {
                DataVersion = 138541,
                ResVersion = 138541,
                TargetUid = session.uid,
                Retcode = 0,
            };
            if (session.avatars.Count < 1)
            {
                DoSetPlayerBornDataNotify start = new()
                {

                };
                session.SendPacket((uint)CmdType.DoSetPlayerBornDataNotify, start);
            }
            else
            {
                session.TeleportToScene(3);
            }
            session.SendPacket((uint)CmdType.PlayerLoginRsp, resp);
        }
        [Server.Handler(CmdType.PingReq)]
        public static void OnPingReq(Client session, CmdType cmdId, Network.Packet packet)
        {

            PingReq req = packet.DecodeBody<PingReq>();
            session.SendPacket((uint)CmdType.PingRsp, new PingRsp() { ClientTime = req.ClientTime, Retcode = 0, Seq = req.Seq });
        }
    }
}
