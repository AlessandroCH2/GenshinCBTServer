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
        public uint id;
        [JsonProperty("hp_base")]
        public float baseHp;
        [JsonProperty("attack_base")]
        public float baseAtk;
        [JsonProperty("defense_base")]
        public float baseDef;
        public uint skillDepotId;
        [JsonProperty("initialWeapon")]
        public uint weaponId;
        public float critical;
        public float criticalHurt;
        public float fireAddHurt;
        public float waterAddHurt;
        public float grassAddHurt;
        public float elecAddHurt;
        public float windAddHurt;
        public float iceAddHurt;
        public float rockAddHurt;
        public List<PropGrowCurve> propGrowCurves = new List<PropGrowCurve>();
    }
}
