
using GenshinCBTServer.Network;
using GenshinCBTServer.Protocol;
using Google.Protobuf;


using Newtonsoft.Json;
using Pastel;
using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Reflection;
using System.Resources;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using static GenshinCBTServer.Dispatch;
using static GenshinCBTServer.ENet;


namespace GenshinCBTServer
{
    public class Server
    {
        public class HandlerAttribute : Attribute
        {

            public CmdType CmdId { get; set; }
            public HandlerAttribute(CmdType cmdID)
            {
                this.CmdId = cmdID;
            }

            public delegate void HandlerDelegate(Client client, int cmdId, Network.Packet packet);
        }
        public class CommandAttribute : Attribute
        {
            public string command;
            public string desc;
            
            public CommandAttribute(string cmdName,string desc = "No description")
            {
                this.command = cmdName;
                this.desc = desc;
            }

            public delegate void HandlerDelegate(string command, string[] args);
        }
        public static List<Client> clients = new List<Client>();
        public IntPtr server;
        public  static bool showLogs = true;
      
        public static SQLiteConnection _db;
        public static Dispatch dispatch;
        public static ResourceManager resourceManager;
        public static SQLiteConnection GetDatabase()
        {
            return _db;
        }
        public static ResourceManager getResources()
        {
            return resourceManager;
        }
        public void Start(bool hideLogs = false)
        {
           {
                Assembly assembly = Assembly.GetExecutingAssembly();
                Type[] types = assembly.GetTypes();

                foreach (var type in types)
                {

                    NotifyManager.AddReqGroupHandler(type);

                }

                NotifyManager.Init();
            }
            Logger.Initialize(); // can also pass hideLogs here
            showLogs = !hideLogs;
           // showLogs = false;
            Print($"Logs are {(showLogs ? "enabled" : "disabled")}");

            enet_initialize();

            ENetAddress address = new ENetAddress();

            Print("Creating database");
          
            _db = new SQLiteConnection("database.db");
            _db.CreateTable<Account>();
            _db.CreateTable<Profile>();
            
           
            Print("Created database!");

            Print("Loading resources...");
            resourceManager=new ResourceManager();
            ResourceLoader resourceLoader = new(resourceManager);
            resourceLoader.LoadAll();
            resourceLoader.LoadAllLua();
            Print("Resources loaded");
             enet_address_set_host(ref address, "127.0.0.1");
            address.port = (ushort)System.Net.IPAddress.HostToNetworkOrder((short)22102); 
            //address.host = 0;
            //Print($"{address.host}:{address.port}");
           
            server = enet_host_create(ref address, 16,0,0,0,0);
           
            if (server == IntPtr.Zero)
            {
                Print("An error occurred while trying to create an ENet server host.");
                ENet.enet_deinitialize();
                return;
            }
            enet_host_compress_with_range_coder(server);
           // enet_host_set_checksum(server, new ENetChecksumCallback(ENet.enet_crc32)); //Not exist in the .dll, modified .dll compiled with checksum set when host is created.
            Print($"Gameserver started on 22102");
            new Thread(new ThreadStart(PeerHandle)).Start();
            new Thread(new ThreadStart(DispatchServer)).Start();
            while (true)
            {
                string cmd = Console.ReadLine()!;
                string[] split = cmd.Split(" ");
                string[] args = cmd.Split(" ").Skip(1).ToArray();
                string command = split[0];
                //TODO Command handling system
                switch(command.ToLower())
                {
                    case "dispatch":
                        if(args.Length > 0)
                        {
                            if (args[0].ToLower() == "new")
                            {
                                if (args.Length > 1) {
                                    dispatch.NewAccount(args[1], args[2]);
                                }
                            }
                        }
                        break;
                    case "teleport":
                        if (args.Length >= 4)
                        {
                            try {
                                int uid = int.Parse(args[0]);
                                float x = float.Parse(args[1]);
                                float y = float.Parse(args[2]);
                                float z = float.Parse(args[3]);
                                clients.Find(c => c.uid == uid).TeleportToScene(clients.Find(c => c.uid == uid).currentSceneId, new Vector() { X = x, Y = y, Z = z });
                                Print($"Teleporting UID {uid} to {x}, {y}, {z}");
                            } catch (Exception e)
                            {
                                Print("Invalid arguments");
                            }
                        }
                        break;
                    case "endload":
                        foreach (Client client in clients)
                        {
                            client.SendPacket((uint)CmdType.EnterSceneDoneRsp, new EnterSceneDoneRsp() { Retcode = 0 });
                        }
                        break;
                    case "pos":
                        if (args.Length >= 1)
                        {
                            if (args[0].ToLower() == "all")
                            {
                                foreach (Client client in clients)
                                {
                                    Print($"Position of UID {client.uid}: {client.motionInfo.Pos.X}, {client.motionInfo.Pos.Y}, {client.motionInfo.Pos.Z}");
                                }
                                return;
                            }
                            try
                            {
                                int uid = int.Parse(args[0]);
                                Client client = clients.Find(c => c.uid == uid);
                                if (client != null)
                                {
                                    Print($"Position of UID {uid}: {client.motionInfo.Pos.X}, {client.motionInfo.Pos.Y}, {client.motionInfo.Pos.Z}");
                                }
                                else
                                {
                                    Print("Client not found");
                                }
                            }
                            catch (Exception e)
                            {
                                Print("Invalid arguments");
                            }
                        }
                        break;
                    case "sendinventory":
                        foreach (Client client in clients)
                        {
                            client.SendInventory();
                        }
                        break;
                    case "elfie":
                        foreach (Client client in clients)
                        {
                            client.SpawnElfie();
                        }
                        break;
                    case "sendworld":
                        foreach (Client client in clients)
                        {
                            client.world.SendAllEntities();
                        }
                        break;
                    default:
                        // Print("Unknown command");
                        break;
                }
            }
        }
        public void DispatchServer()
        {
            dispatch = new Dispatch();
            dispatch.Start();
        }
        public static CmdType[] hideLog = [CmdType.SceneEntityDrownReq, CmdType.SceneEntityMoveReq, CmdType.SceneEntityMoveRsp, CmdType.PingReq, CmdType.AbilityInvocationsNotify, CmdType.AbilityInvocationFixedNotify
            ,CmdType.EvtAnimatorParameterNotify,CmdType.ClientAbilityInitFinishNotify,CmdType.PingRsp,CmdType.SceneEntityAppearNotify,CmdType.PlayerStoreNotify];
        public void PeerHandle()
        {

            ENet.ENetEvent netEvent;
            while (true)
            {


                //server.CheckEvents(out netEvent);

                if (enet_host_service(server, out netEvent, 20) > 0)
                {
                   // Print("Net event " + netEvent.type);
                }




                switch (netEvent.type)
                {
                    case ENet.EventType.None:
                        
                        break;
                    case ENet.EventType.Connect:
                        Print("Player connected, Peer: " + netEvent.peer + ", IP: " + netEvent.peer);
                        Client client = new Client(netEvent.peer);
                        clients.Add(client);

                        break;

                    case ENet.EventType.Disconnect:
                        
                        Client client_ = clients.Find(client => client.peer == netEvent.peer);
                        Server.GetDatabase().Update(client_.ToProfile());
                        clients.Remove(client_);
                        if(client_!=null)
                        Print($"Player UID {client_.uid}, Peer: {netEvent.peer} disconnected");
                        break;


                   
                    case ENet.EventType.Receive:
                        
                            ENetPacket enetPacket = Marshal.PtrToStructure<ENetPacket>(netEvent.packet);
                          //  Print("Packet received from - ID: " + netEvent.peer + ", IP: " + netEvent.peer + ", Channel ID: " + netEvent.channelID + ", Data length: " + enetPacket.data);
                            Packet genshinPacket = Packet.Read(enetPacket);
                           // Print($"Received from client: {genshinPacket.cmdId} ({((CmdType)genshinPacket.cmdId).ToString()})");
                         
                        CmdType cmd = (CmdType)genshinPacket.cmdId;
                        if (!hideLog.Contains(cmd) && showLogs == true)
                        {
                            Server.Print($"[{Server.ColoredText("client", "fcc603")}->{Server.ColoredText("server", "03fc4e")}] {cmd.ToString()}");
                        }
                        Logger.Log($"[client->server] {cmd.ToString()}");

                        try
                        {
                            NotifyManager.Notify(clients.Find(client => client.peer == netEvent.peer), (CmdType)genshinPacket.cmdId, genshinPacket);
                        }
                        catch(Exception ex)
                        {

                        }

                       

                        break;
                }

                //enet_host_flush(server);
            }
        }
        public static string ColoredText(string text,string color)
        {
            return text.Pastel(color);
        }
        public static void Print(string text)
        {
            Logger.Log(text);
            Console.WriteLine($"[{ColoredText("Server", "03fcce")}] " + text);
        }
    }
}
