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
            Server.Print("Let's go il token è " + req.AccountToken);
            GetPlayerTokenRsp resp = new GetPlayerTokenRsp()
            {
                AccountUid="0",
                AccountType=0,
                Token=req.AccountToken,
                Retcode=(int)Retcode.RetAccountNotExist,
                Uid=1,
                Msg="Funziona",
            };
            
            session.SendPacket((uint)CmdType.GetPlayerTokenRsp, resp);
        }
    }
}
