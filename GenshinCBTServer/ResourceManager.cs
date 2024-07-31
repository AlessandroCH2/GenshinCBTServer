using GenshinCBTServer.Excel;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Threading.Tasks;

namespace GenshinCBTServer
{
    public class ResourceManager
    {
        public List<AvatarData> avatarsData;


        public void Load()
        {
            avatarsData = JsonConvert.DeserializeObject<List<AvatarData>>(File.ReadAllText("resources/excel/AvatarData.json"));
            

            
        }

        public AvatarData GetAvatarDataById(uint id)
        {
            return avatarsData.Find(av => av.id == id);
        }
    }
}
