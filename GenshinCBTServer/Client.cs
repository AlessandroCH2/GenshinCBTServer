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

        public uint[] team = new uint[4] { 10000020, 0,0,0 };
        public int selectedAvatar = 0;
        public List<Avatar> avatars = new List<Avatar>();
        public uint uid;
        public string name;
        public string token;
        

        public MapField<uint,PropValue> GetPlayerProps()
        {
            MapField<uint, PropValue> props = new MapField<uint, PropValue>();
            props.Add((uint)PropType.PROP_LAST_CHANGE_AVATAR_TIME, new PropValue() { Val=0});
            props.Add((uint)PropType.PROP_IS_FLYABLE, new PropValue() { Val = 1 });
            props.Add((uint)PropType.PROP_IS_WEATHER_LOCKED, new PropValue() { Val = 0 });
            props.Add((uint)PropType.PROP_IS_GAME_TIME_LOCKED, new PropValue() { Val = 0 });
            props.Add((uint)PropType.PROP_IS_TRANSFERABLE, new PropValue() { Val = 1 });
            props.Add((uint)PropType.PROP_MAX_STAMINA, new PropValue() { Val = 15000 });
            props.Add((uint)PropType.PROP_CUR_PERSIST_STAMINA, new PropValue() { Val = 15000 });
            props.Add((uint)PropType.PROP_CUR_TEMPORARY_STAMINA, new PropValue() { Val = 15000 });
            props.Add((uint)PropType.PROP_PLAYER_LEVEL, new PropValue() { Val = 1 });

            return props;
        }
        public void InitiateAccount(string token)
        {
            OpenStateUpdateNotify openStateNotify = new OpenStateUpdateNotify();
            /*  List<Profile> profiles = Server.GetDatabase().GetAllWithChildren<Profile>();

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
              }*/
           

            this.token = token;
                name = "Traveler";
            PlayerDataNotify playerDataNotify = new PlayerDataNotify()
            {
                NickName=name,
                ServerTime=0,
                
            };
            playerDataNotify.PropMap.Add(GetPlayerProps());
            SendPacket((uint)CmdType.PlayerDataNotify, playerDataNotify);
                
                foreach (KeyValuePair<uint, uint> state in openStateMap)
                {
                    openStateNotify.OpenStateMap.Add(state.Key, state.Value);
                }
                avatars.Add(new Avatar(this, 10000020));
            avatars.Add(new Avatar(this, 10000021));
            avatars.Add(new Avatar(this, 10000022));
            avatars.Add(new Avatar(this, 10000023));
            selectedAvatar = (int)avatars[0].guid;
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

            SendPacket((uint)CmdType.PlayerEnterSceneNotify, new PlayerEnterSceneNotify() { SceneId = scene,TargetUid=uid,PrevPos= new Vector() { X = 200, Y = 500, Z = 200 }, Pos=new Vector() { X=200,Y=500,Z=200},PrevSceneId= currentSceneId, Type=EnterType.EnterJump,SceneBeginTime=9000 });
            currentSceneId = scene;
        }
        public uint GetCurrentAvatar()
        {
            return (uint)selectedAvatar;
        }
        public void SendAllAvatars()
        {
            AvatarDataNotify notify = new AvatarDataNotify();

            AvatarTeam team = new AvatarTeam();
            AvatarTeam eteam = new AvatarTeam();


            foreach (uint avatarId in this.team)
            {

                Avatar av = avatars.Find(av => av.id == avatarId);
                if (av == null) continue;


                    team.AvatarGuidList.Add(av.guid);
                  
                

            } 
           
            notify.AvatarTeamMap.Add(1, team);
            notify.AvatarTeamMap.Add(2, eteam);
            notify.AvatarTeamMap.Add(3, eteam);
            notify.AvatarTeamMap.Add(4, eteam);
            notify.AvatarTeamMap.Add(5, eteam);
            //  notify.AvatarTeamMap.Add(1,new AvatarTeam() { AvatarGuidList = { team[0], team[1], team[2], team[3] } });
            notify.CurAvatarTeamId = 1;
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
