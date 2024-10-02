using GenshinCBTServer.Controllers;
using GenshinCBTServer.Excel;
using GenshinCBTServer.Network;
using GenshinCBTServer.Player;
using GenshinCBTServer.Protocol;
using Google.Protobuf;
using Google.Protobuf.Collections;
using Pastel;
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
    public class GuidRandomizer
    {
        int v = 0;
        public int Next()
        {
            v++;
            return v;
        }
    }
    public class Client
    {
       
        public GuidRandomizer random = new GuidRandomizer();
        public IntPtr peer;
        public int gamePeer = 0;
        public MapField<uint, uint> openStateMap = new MapField<uint, uint>();
        public uint currentSceneId = 3;
        public uint returnPointId = 1;

        public uint[] team = { 10000015 };
        public uint teamEntityId;
        public int selectedAvatar = 0;
        public List<Avatar> avatars = new List<Avatar>();
        public List<GameItem> inventory = new List<GameItem>();
        public uint uid;
        public string name;
        public string token;
        //public Vector position = new Vector() { X = 2136.926f, Y = 208, Z = -1172 };
        public MotionInfo motionInfo = new MotionInfo(){ Pos=new Vector() { X = 2136.926f, Y = 208, Z = -1172 }, Rot = new(), Speed = new(), State = MotionState.MotionStandby };
        public World world;
        public List<uint> unlockedPoints = new();

        public MapField<uint,PropValue> GetPlayerProps()
        {
            MapField<uint, PropValue> props = new MapField<uint, PropValue>();
            props.Add((uint)PropType.PROP_LAST_CHANGE_AVATAR_TIME, new PropValue() { Val=0});
            addProp((uint)PropType.PROP_IS_FLYABLE, 1, props);
            props.Add((uint)PropType.PROP_IS_WEATHER_LOCKED, new PropValue() { Val = 0 });
            props.Add((uint)PropType.PROP_IS_GAME_TIME_LOCKED, new PropValue() { Val = 0 });
            addProp((uint)PropType.PROP_IS_TRANSFERABLE, 1, props);
            props.Add((uint)PropType.PROP_MAX_STAMINA, new PropValue() { Val = 15000 });
            props.Add((uint)PropType.PROP_CUR_PERSIST_STAMINA, new PropValue() { Val = 15000 });
            addProp((uint)PropType.PROP_CUR_TEMPORARY_STAMINA, 15000, props);
            addProp((uint)PropType.PROP_PLAYER_LEVEL, 20, props);
            addProp((uint)PropType.PROP_PLAYER_EXP, 0, props);
            addProp((uint)PropType.PROP_IS_SPRING_AUTO_USE, 1, props);
            addProp((uint)PropType.PROP_SPRING_AUTO_USE_PERCENT, 50, props);
            addProp((uint)PropType.PROP_PLAYER_HCOIN, 2000, props);
            addProp((uint)PropType.PROP_PLAYER_SCOIN,10000, props);
            addProp((uint)PropType.PROP_IS_WORLD_ENTERABLE, 1,props);
            return props;
        }
        public void addProp(uint type, int value, MapField<uint, PropValue> map)
        {
            PropValue prop = new PropValue();
            prop.Val = value;
            prop.Type = type;
            prop.Ival = value;

            map.Add(type, prop);
        }
        public void SendInventory()
        {
            PlayerStoreNotify n = new()
            {
                StoreType = StoreType.StorePack,
                WeightLimit = 99999,
            };

            foreach(GameItem item in inventory)
            {
                n.ItemList.Add(item.toProtoItem());
            }
            SendPacket((uint)CmdType.PlayerStoreNotify, n);
        }
        public void InitiateAccount(string token)
        {
            world = new World(this);
            OpenStateUpdateNotify openStateNotify = new OpenStateUpdateNotify();
            //TODO loading account
            this.teamEntityId = ((uint)ProtEntityType.ProtEntityTeam << 24) + (uint)random.Next();
            this.uid = 1;
            this.token = token;
                name = "Traveler";
            PlayerDataNotify playerDataNotify = new PlayerDataNotify()
            {
                NickName=name,
                ServerTime=0,
                
            };
            playerDataNotify.PropMap.Add(GetPlayerProps());

            foreach (OpenStateType state in Enum.GetValues(typeof(OpenStateType)))
            {
                openStateMap[(uint)state] = 1;
            }

            SendPacket((uint)CmdType.PlayerDataNotify, playerDataNotify);
                
                foreach (KeyValuePair<uint, uint> state in openStateMap)
                {
                    openStateNotify.OpenStateMap.Add(state.Key, state.Value);
                }

            foreach(ItemData itemData in Server.getResources().itemData)
            {
                inventory.Add(new GameItem(this, (uint)itemData.id));
            }
            //  avatars.Add(new Avatar(this, 10000015));

            // selectedAvatar = (int)avatars[0].guid;
            SendInventory();
            SendAllAvatars();
            QuestController.UpdateQuestForClient(this);
            SendPacket((uint)CmdType.OpenStateUpdateNotify, openStateNotify);
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

            SendPacket((uint)CmdType.PlayerEnterSceneNotify, new PlayerEnterSceneNotify() { SceneId = scene,TargetUid=uid,PrevPos= new Vector() { X = 0, Y = 0, Z = 0 }, Pos=motionInfo.Pos,PrevSceneId= 0, Type=EnterType.EnterJump,SceneBeginTime=0 });
            currentSceneId = scene;
            world.LoadNewScene(currentSceneId);

        }
        public uint GetCurrentAvatar()
        {
            return (uint)selectedAvatar;
        }
        public void SendAllAvatars()
        {
            AvatarDataNotify notify = new AvatarDataNotify();
            AvatarTeam team = new AvatarTeam();
            foreach (uint avatarId in this.team)
            {
                Avatar av = avatars.Find(av => av.id == avatarId);
                if (av == null) continue;
                team.AvatarGuidList.Add(av.guid);
            } 
            notify.AvatarTeamMap.Add(1, team);
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
            if (enet_peer_send(peer, 0, packet) == 0)
            {
                Server.Print($"[server->client] {((CmdType)cmdId).ToString()} body: {protoMessage.ToString().Pastel(Color.FromArgb(165, 229, 250))}");
            }
        }

        public void SpawnElfie()
        {
            SceneEntityAppearNotify appear = new()
            {
                AppearType = VisionType.VisionMeet,

            };
            appear.EntityList.Add(new SceneEntityInfo()
            {
                EntityId= ((uint)ProtEntityType.ProtEntityNpc << 24) + (uint)random.Next(),
                EntityType =ProtEntityType.ProtEntityNpc,
                LifeState=(uint)LifeState.LIFE_ALIVE,
                MotionInfo=this.motionInfo,
                Npc=new SceneNpcInfo()
                {
                    NpcId= 1469
                }
            });

            SendPacket((uint)CmdType.SceneEntityAppearNotify, appear);
        }

        public Client(IntPtr iD)
        {
            this.peer = iD;
        }
    }
}
