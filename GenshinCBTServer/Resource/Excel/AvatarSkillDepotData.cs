namespace GenshinCBTServer.Excel;
using Newtonsoft.Json;
    
public class AvatarSkillDepotData
{
    public int id;
    [JsonProperty("leaderTalent")]
    public int leader_Talent;
    [JsonProperty("talentGroup")]
    public List<int> talent_groups = new List<int>(10);
}