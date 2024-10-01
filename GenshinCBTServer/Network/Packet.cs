using GenshinCBTServer.Protocol;
using Google.Protobuf;
using System;
using System.Buffers.Binary;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using static GenshinCBTServer.ENet;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace GenshinCBTServer.Network
{
    public class Packet
    {
        public uint cmdId;
        public byte[] finishedBody;
        public static void PutUInt16(byte[] buf, ushort value, int offset)
        {
            ushort networkValue = (ushort)IPAddress.HostToNetworkOrder((short)value);
            byte[] bytes = BitConverter.GetBytes(networkValue);
            Buffer.BlockCopy(bytes, 0, buf, offset, bytes.Length);
        }
       
        public static void PutUInt32(byte[] buf, uint value, int offset)
        {
            uint networkValue = (uint)IPAddress.HostToNetworkOrder((int)value);
            byte[] bytes = BitConverter.GetBytes(networkValue);
            Buffer.BlockCopy(bytes, 0, buf, offset, bytes.Length);
        }
        public static ushort GetUInt16(byte[] buf, int index)
        {
            ushort networkValue = BitConverter.ToUInt16(buf, index);
            return (ushort)IPAddress.NetworkToHostOrder((short)networkValue);
        }

        public static uint GetUInt32(byte[] buf,int index)
        {
            uint networkValue = BitConverter.ToUInt32(buf, index);
            return (uint)IPAddress.NetworkToHostOrder((int)networkValue);
        }

        public TBody DecodeBody<TBody>() where TBody : IMessage<TBody>, new()
        {
            return new MessageParser<TBody>(() => new()).ParseFrom(finishedBody);
        }
        public static void PutByteArray(byte[] destination, byte[] source, int offset)
        {
            if (destination == null)
                throw new ArgumentNullException(nameof(destination));
            if (source == null)
                throw new ArgumentNullException(nameof(source));
            if (offset < 0 || offset > destination.Length - source.Length)
                throw new ArgumentOutOfRangeException(nameof(offset), "Offset is out of range.");

            Buffer.BlockCopy(source, 0, destination, offset, source.Length);
        }
        public static byte[] ToByteArray(IntPtr ptr, int length)
        {
            if (ptr == IntPtr.Zero)
            {
                throw new ArgumentException("Pointer cannot be null", nameof(ptr));
            }

            byte[] byteArray = new byte[length];
            Marshal.Copy(ptr, byteArray, 0, length);
            return byteArray;
        }
        public static IntPtr ByteArrayToIntPtr(byte[] data)
        {
            if (data == null) throw new ArgumentNullException(nameof(data));

            // Allocate unmanaged memory
            IntPtr ptr = Marshal.AllocHGlobal(data.Length);

            // Copy the byte array to the unmanaged memory
            Marshal.Copy(data, 0, ptr, data.Length);

            return ptr;
        }
        public static IntPtr EncodePacket(ushort cmdId, IMessage body)
        {
            PacketHead head = new PacketHead();
            head.PacketId = cmdId;
            ByteString headSerialized = head.ToByteString();
            ByteString bodySerialized = body.ToByteString();
            int totalSerializedDataSize = 10+headSerialized.Length+bodySerialized.Length+2;
            byte[] data = new byte[totalSerializedDataSize];
            PutUInt16(data, 0x4567,0);
            PutUInt16(data, cmdId, 2);
            PutUInt16(data, (ushort)headSerialized.Length, 4);
            PutUInt32(data, (ushort)bodySerialized.Length, 6);
            PutByteArray(data, headSerialized.ToByteArray(),10);
            PutByteArray(data, bodySerialized.ToByteArray(), 10+ headSerialized.Length);
            PutUInt16(data, 0x89ab, 10 + headSerialized.Length + bodySerialized.Length);
            IntPtr dataPtr = 0;
           
            unsafe
            {
                fixed (byte* p = data)
                {
                    IntPtr ptr = (IntPtr)p;
                    dataPtr = ptr;
                }
            }
           
            IntPtr enet_packet = enet_packet_create(dataPtr, (uint)data.Length, 0 | 1);

            return enet_packet;
        }
        public static Packet Read(ENetPacket packet)
        {

            byte[] byteArray = ToByteArray(packet.data, (int)packet.dataLength);
            ushort header_magic = GetUInt16(byteArray,0);
            ushort cmdId = (ushort)GetUInt16(byteArray, 2);
               
            ushort head_length = (ushort)GetUInt16(byteArray, 4);
            uint body_length = (uint)GetUInt32(byteArray, 6);
            ushort footer_magic = (ushort)GetUInt16(byteArray, 10 + (int)head_length + (int)body_length);

            if(header_magic != 0x4567)
            {
               // Server.Print($"{header_magic}:{(int)0x4567}");
                return null;
            }
            byte[] managedArray = new byte[body_length];
            Array.Copy(byteArray, 10 + (int)head_length, managedArray, 0, (int)body_length);
           // Server.Print("Incoming packet length: " + packet.dataLength);
            return new Packet() { cmdId = cmdId, finishedBody = managedArray };
        }
    }
}
