using CsvHelper;
using CsvHelper.Configuration;
using GenshinCBTServer.Excel;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace GenshinCBTServer
{
    public class ResourceManager
    {
        public List<AvatarData> avatarsData;
        public List<TalentSkillData> talentSkillData;
        public List<AvatarSkillDepotData> avatarSkillDepotData;
        public List<ItemData> itemData;
       
        public void Load()
        {
            avatarsData = JsonConvert.DeserializeObject<List<AvatarData>>(File.ReadAllText("resources/excel/AvatarData.json"));

            talentSkillData = LoadTalentSkillData();
            avatarSkillDepotData = LoadAvatarSkillDepotData();
            itemData = LoadWeaponData();
        }

        private List<ItemData> LoadWeaponData()
        {
            var configuration = new CsvConfiguration(CultureInfo.InvariantCulture)
            {
                Delimiter = "\t",
                HasHeaderRecord = true,

            };
            using (var reader = new StreamReader("resources/excel/WeaponData.tsv"))
            using (var csv = new CsvReader(reader, configuration))
            {
                var records = csv.GetRecords<ItemData>().ToList();
                return records;
            }
        }

        private List<AvatarSkillDepotData> LoadAvatarSkillDepotData()
        {
            var configuration = new CsvConfiguration(CultureInfo.InvariantCulture)
            {
                Delimiter = "\t",
                HasHeaderRecord = true,
                BadDataFound = null

            };
            using (var reader = new StreamReader("resources/excel/AvatarSkillDepotData.tsv"))
            using (var csv = new CsvReader(reader, configuration))
            {

                var records = new List<AvatarSkillDepotData>();

                csv.Read(); // Read the header
                csv.ReadHeader();

                while (csv.Read())
                {
                    var record = new AvatarSkillDepotData
                    {
                        id = csv.GetField<int>(0),                   // Index 0 is for 'id'
                        leader_Talent = csv.GetField<int?>(9),        // Index 9 is for 'leader_Talent'
                    };

                    // Manually reading talent_groups from index 13 to 23
                    for (int i = 13; i <= 23; i++)
                    {
                        var field = csv.GetField(i);
                        if (!string.IsNullOrWhiteSpace(field) && int.TryParse(field, out int result))
                        {
                            record.talent_groups.Add(result);
                        }
                    }

                    records.Add(record); // Add the record to the list

                }
                    return records;
            }
        }

        private List<TalentSkillData> LoadTalentSkillData()
        {
            var configuration = new CsvConfiguration(CultureInfo.InvariantCulture)
            {
                Delimiter = "\t",
                HasHeaderRecord = true,
                
            };
            using (var reader = new StreamReader("resources/excel/TalentSkillData.tsv"))
            using (var csv = new CsvReader(reader, configuration))
            {
                var records = csv.GetRecords<TalentSkillData>().ToList();
                return records;
            }
            
        }

        public AvatarData GetAvatarDataById(uint id)
        {
            return avatarsData.Find(av => av.id == id);
        }
    }
}
