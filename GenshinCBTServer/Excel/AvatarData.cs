using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace GenshinCBTServer.Excel
{
    public class AvatarData
    {
        [JsonProperty("ID")]
        public uint id;
        [JsonProperty("Base HP")]
        public float baseHp;
        [JsonProperty("Base Attack")]
        public float baseAtk;
        [JsonProperty("Base Defense")]
        public float baseDef;
        [JsonProperty("Skill Library ID")]
        public uint skillDepotId;
    }
}
