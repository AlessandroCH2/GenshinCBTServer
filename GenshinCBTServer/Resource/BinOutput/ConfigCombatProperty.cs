namespace GenshinCBTServer.Data;

public class ConfigCombatProperty
{
    public string JsonObjType = "ConfigCombatProperty";
    public float HP;
    public float attack;
    public float defense;
    public float weight;
    public bool isInvincible = false;
    public bool isLockHP = false;
}