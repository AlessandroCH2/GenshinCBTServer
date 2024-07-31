using GenshinCBTServer.Network;
using GenshinCBTServer.Player;
using GenshinCBTServer.Protocol;
using Google.Protobuf;
using Google.Protobuf.Collections;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using static GenshinCBTServer.ENet;

namespace GenshinCBTServer
{
   
    public class Client
    {
       
        public Random random = new Random();
        public IntPtr peer;
        public MapField<uint, uint> openStateMap = new MapField<uint, uint>();
        public uint currentSceneId = 1003;

        public uint[] team = new uint[4] { 10000020, 0, 0, 0 };
        public int selectedAvatar = 0;
        public List<Avatar> avatars = new List<Avatar>();
        public uint uid;
        public string name;
        public void InitiateAccount()
        {
            name = "Traveler";
            uid = 1;
            OpenStateUpdateNotify openStateNotify = new OpenStateUpdateNotify();
            foreach (KeyValuePair<uint, uint> state in openStateMap)
            {
                openStateNotify.OpenStateMap.Add(state.Key, state.Value);
            }
            avatars.Add(new Avatar(this, 10000020));
            
            SendAllAvatars();
            SendPacket((uint)CmdType.OpenStateUpdateNotify, openStateNotify);
            
        }
        public void TeleportToScene(uint scene)
        {
            SendPacket((uint)CmdType.PlayerEnterSceneNotify, new PlayerEnterSceneNotify() { SceneId = scene,TargetUid=uid,PrevPos= new Vector() { X = 200, Y = 500, Z = 200 }, Pos=new Vector() { X=200,Y=500,Z=200},PrevSceneId=0,Type=EnterType.EnterSelf,SceneBeginTime=0,DungeonId=0 });
            currentSceneId = scene;
        }
        public uint GetCurrentAvatar()
        {
            return team[selectedAvatar];
        }
        public void SendAllAvatars()
        {
            AvatarDataNotify notify = new AvatarDataNotify();
            notify.AvatarTeamMap.Add(0,new AvatarTeam() { AvatarGuidList = { team[0], team[1], team[2], team[3] } });
            notify.CurAvatarTeamId = 0;
            notify.ChooseAvatarGuid = GetCurrentAvatar();
            foreach(Avatar avatar in avatars)
            {
                notify.AvatarList.Add(avatar.toProto());
            }
            SendPacket((uint)CmdType.AvatarDataNotify, notify);
        }
        public void Update()
        {

        }
        public void SendPacket(uint cmdId,IMessage protoMessage)
        {
            IntPtr packet = Packet.EncodePacket((ushort)cmdId, protoMessage);
           // Server.Print(""+packet.dataLength);
            //packet.flags |= (uint)PacketFlags.Reliable;
            if (enet_peer_send(peer, 0, packet) == 0)
            {
                Server.Print($"[server->client] {((CmdType)cmdId).ToString()}");
            }
        }
        
        public Client(IntPtr iD)
        {
            this.peer = iD;
        }
    }
}
