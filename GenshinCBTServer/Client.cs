using GenshinCBTServer.Network;
using GenshinCBTServer.Player;
using GenshinCBTServer.Protocol;
using Google.Protobuf;
using Google.Protobuf.Collections;
using SQLite;
using SQLiteNetExtensions.Attributes;
using SQLiteNetExtensions.Extensions;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Linq.Expressions;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using static GenshinCBTServer.Dispatch;
using static GenshinCBTServer.ENet;

namespace GenshinCBTServer
{
   public class Profile
    {
        [PrimaryKey, AutoIncrement]
        [Column("uid")]
        public uint uid { get; set; }
        [Column("name")]
        public string name { get; set; }
        [Column("token")]
        public string token { get; set; }
        [Column("level")]
        public int level { get; set; }
        [Column("xp")]
        public float xp { get; set; }

        [Column("currentSceneId")]
        public uint currentSceneId { get; set; }


        [Column("selectedAvatar")]
        public int selectedAvatar { get; set; }
        [TextBlob("_team")]
        public uint[] team { get; set; }
        [TextBlob("_avatars")]
        public List<Avatar> avatars { get; set; }

        public string _avatars;
        public string _team;
    }
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
        public string token;
        

        
        public void InitiateAccount(string token)
        {
            OpenStateUpdateNotify openStateNotify = new OpenStateUpdateNotify();
            List<Profile> profiles = Server.GetDatabase().GetAllWithChildren<Profile>();
            
            foreach (Profile profile in profiles)
            {
                if(profile.token == token)
                {


                    ReadProfile(profile);
                   
                    foreach (KeyValuePair<uint, uint> state in openStateMap)
                    {
                        openStateNotify.OpenStateMap.Add(state.Key, state.Value);
                    }
                    SendAllAvatars();
                    SendPacket((uint)CmdType.OpenStateUpdateNotify, openStateNotify);
                    return;
                }
            }

            
                this.token = token;
                name = "Traveler";
               
                
                foreach (KeyValuePair<uint, uint> state in openStateMap)
                {
                    openStateNotify.OpenStateMap.Add(state.Key, state.Value);
                }
                avatars.Add(new Avatar(this, 10000020));

                SendAllAvatars();
                SendPacket((uint)CmdType.OpenStateUpdateNotify, openStateNotify);

                 Server.GetDatabase().Insert(ToProfile());

            
            
        }
        public Profile ToProfile()
        {
            Profile profile = new Profile()
            {
                uid = this.uid,
                avatars=avatars,
                currentSceneId=currentSceneId,
                name = name,
                token= token,
                team=team,
                selectedAvatar=selectedAvatar,
            };
            return profile;
        }
        private void ReadProfile(Profile profile)
        {
            this.avatars = profile.avatars;
            this.currentSceneId = profile.currentSceneId;
            this.name = profile.name;
            this.team = profile.team;
            this.uid = profile.uid;
            this.token = profile.token;
           
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
