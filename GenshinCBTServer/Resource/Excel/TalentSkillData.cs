namespace GenshinCBTServer.Excel;
using Newtonsoft.Json;

public class TalentSkillData
{
    [JsonProperty("talentId")]
    public int id;
    [JsonProperty("talentGroupId")]
    public int talent_group_id;
    [JsonProperty("level")]
    public int rank;
};