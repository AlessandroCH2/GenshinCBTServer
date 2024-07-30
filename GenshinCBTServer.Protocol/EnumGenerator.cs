using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;

namespace GenshinCBTServer.Protocol
{
    internal class EnumGenerator
    {

        public static void Main(string[] args)
        {
            string[] file = File.ReadAllLines("ProtoFiles/cmdids.csv");
            List<string> enumFile = new List<string>();


            enumFile.Add("using System;\r\nusing System.Collections.Generic;\r\nusing System.Linq;\r\nusing System.Text;\r\nusing System.Threading.Tasks;\r\n\r\nnamespace GenshinCBTServer.Protocol\r\n{\r\n    public enum CmdType\r\n    {\r\n        ");

            int i = 0;
            foreach(string line in file) {
                if(i != 0)
                {
                    string[] split = line.Split(',');

                    enumFile.Add($"{split[0]} = {split[1]},");
                }

                i++;
            }

            enumFile.Add("\r\n    }\r\n}");
            File.WriteAllLines("CmdType.cs",enumFile.ToArray());
        }
    }
}
