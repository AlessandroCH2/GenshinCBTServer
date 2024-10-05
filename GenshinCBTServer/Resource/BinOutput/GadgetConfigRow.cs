namespace GenshinCBTServer.Data;

public class GadgetConfigRow // todo: add all objects
{
    public string JsonObjType = "ConfigGadget";
    public ConfigEntityCommon Common = new ConfigEntityCommon();
    public ConfigCombat Combat = new ConfigCombat();
    public List<ConfigEntityAbilityEntry> Abilities = new List<ConfigEntityAbilityEntry>();
    public ConfigTimer Timer = new ConfigTimer();
    public ConfigLinerBulletMove Move = new ConfigLinerBulletMove();
    // public ConfigBulletPattern Gadget = new ConfigBulletPattern();
}