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
    public class QuestController
    {


        public static void UpdateQuestForClient(Client session)
        {
            QuestListUpdateNotify questList = new();


            questList.QuestList.Add(new Quest()
            {
                QuestId=1,
                State=1,
            });
            session.SendPacket((uint)CmdType.QuestListUpdateNotify, questList);
        }
       
            
        [Server.Handler(CmdType.QuestCreateEntityReq)]
        public static void OnQuestCreateEntityReq(Client session, CmdType cmdId, Network.Packet packet)
        {

           
        }
       
        
    }
}
