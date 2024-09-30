using CsvHelper.Configuration;
using CsvHelper.Configuration.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenshinCBTServer.Excel
{
  
    public class TalentSkillData
    {
        [Index(0)]
        public int id { get; set; }
        [Index(1)]
        public int? talent_group_id { get; set; }
        [Index(2)]
        public int rank { get; set; }
    };

    public class AvatarSkillDepotData
    {
        [Index(0)]
        public int id { get; set; }
        [Index(9)]
        public int? leader_Talent { get; set; }
        [Index(13)]
        public List<int> talent_groups { get; set; } // Talent groups (天赋组)
        public AvatarSkillDepotData()
        {
            talent_groups = new List<int>(10);  // Initialize the list to avoid null reference issues
        }

    }
    public class ItemData
    {
        [Index(0)]
        public int id { get; set; } // ID
        [Index(2)]
        public ItemType type { get; set; } // 类型
      //  [Index(0)]
       // public EquipType equipType { get; set; } // 圣遗物类别 for ReliquaryData, implicit for others

        // The equivalent of empty structs can just be ignored or represented minimally if needed

        public WeaponData Weapon { get; set; } = new WeaponData();

        public object Reliquary { get; set; } = new object(); // Empty struct equivalent
    }
    public class WeaponData
    {
        [Index(5)]
        public int gadgetId { get; set; } // 物件ID
        [Index(8)]
        public WeaponType weaponType { get; set; } // 武器种类
    }
}
