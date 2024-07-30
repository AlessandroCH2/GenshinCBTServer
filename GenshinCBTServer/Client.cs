using GenshinCBTServer.Network;
using GenshinCBTServer.Protocol;
using Google.Protobuf;
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
    public class PacketReceiver
    {
        public Client client;
        public PacketReceiver(Client client)
        {
            this.client = client;
        }

        public void Receive()
        {
            try
            {
                while (client.SocketConnected(client.socket))
                {

                    // Packet packet = Packet.Read(client);

                    // if(packet != null)
                    // {
                    // NotifyManager.Notify(client, (CmdType)packet.cmdId,packet);
                    // Server.Print($"id: ")
                    // }

                }
            }
            catch (Exception e)
            {
                Server.Print("Error: " + e.Message);
            }


            //client.Disconnect();
        }
    }
    public class Client
    {
        public Socket socket;
        public Thread receivorThread;
        public Random random = new Random();
        public IntPtr peer;

        public void Update()
        {

        }
        public void SendPacket(uint cmdId,IMessage protoMessage)
        {
            ENetPacket packet = Packet.EncodePacket((ushort)cmdId, protoMessage);
            Server.Print(""+packet.dataLength);
            packet.flags |= (uint)PacketFlags.Reliable;
            if (enet_peer_send(peer, 0, packet) == 0)
            {
                Server.Print("Packet sent");
            }
        }
        public bool SocketConnected(Socket s)
        {
            return !((s.Poll(1000, SelectMode.SelectRead) && (s.Available == 0)) || !s.Connected);
        }
        
        public Client(IntPtr iD)
        {
            this.peer = iD;
        }
    }
}
