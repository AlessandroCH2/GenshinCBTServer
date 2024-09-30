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
    public class InventoryController
    {

        [Server.Handler(CmdType.GetAllMailReq)]
        public static void OnGetAllMailReq(Client session, CmdType cmdId, Network.Packet packet)
        {
            GetAllMailReq req = packet.DecodeBody<GetAllMailReq>();


            session.SendPacket((uint)CmdType.GetAllMailRsp, new GetAllMailRsp() { MailList = {new MailData() { MailId = 0, MailTextContent = new() { Content="Server creato da Akari",Sender="AkariLeaksITA",Title="Server CBT 1"},SendTime=0 } }});
        }
            
        [Server.Handler(CmdType.WearEquipReq)]
        public static void OnWearEquipReq(Client session, CmdType cmdId, Network.Packet packet)
        {

            WearEquipReq req = packet.DecodeBody<WearEquipReq>();
            Avatar avatar = session.avatars.Find(av => av.guid == req.AvatarGuid);
            Avatar oldAvatar = session.avatars.Find(av=>av.weaponGuid==req.EquipGuid);

            if(avatar != null)
            {

                if(oldAvatar != null)
                {
                    oldAvatar.weaponGuid = avatar.weaponGuid;
                    avatar.weaponGuid = (uint)req.EquipGuid;
                }
                else
                {
                    avatar.weaponGuid = (uint)req.EquipGuid;
                    
                }
                
                WearEquipRsp resp = new WearEquipRsp()
                {
                    AvatarGuid = req.AvatarGuid,
                    EquipGuid = req.EquipGuid,
                    Retcode = 0,
                };

                session.SendPacket((uint)CmdType.WearEquipRsp, resp);
                session.SendAllAvatars();
            }
            else
            {
                WearEquipRsp resp = new WearEquipRsp()
                {
           
                    Retcode = (int)Retcode.RetCanNotFindAvatar,
                };

                session.SendPacket((uint)CmdType.WearEquipRsp, resp);
            }

           
        }
       
        
    }
}
