using GenshinCBTServer.Protocol;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

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
                AccountUid="1",
                AccountType=0,
                Token=req.AccountToken,
                Retcode=0,
                Uid=1,
                Msg="Funziona",
            };
            
            session.SendPacket((uint)CmdType.GetPlayerTokenRsp, resp);
        }
        [Server.Handler(CmdType.PlayerLoginReq)]
        public static void OnPlayerLoginReq(Client session, CmdType cmdId, Network.Packet packet)
        {

            PlayerLoginReq req = packet.DecodeBody<PlayerLoginReq>();


            session.InitiateAccount(req.Token);

            PlayerLoginRsp resp = new PlayerLoginRsp()
            {
                DataVersion= 138541,
                ResVersion= 138541,
                TargetUid=1,
                Retcode=0,
            };

           
            

            session.TeleportToScene(3);
            session.SendPacket((uint)CmdType.PlayerLoginRsp, resp);
        }
        [Server.Handler(CmdType.PingReq)]
        public static void OnPingReq(Client session, CmdType cmdId, Network.Packet packet)
        {

            PingReq req = packet.DecodeBody<PingReq>();


            session.SendPacket((uint)CmdType.PingRsp, new PingRsp() { ClientTime=req.ClientTime,Retcode=0,Seq=req.Seq});
        }
        
        
    }
}
