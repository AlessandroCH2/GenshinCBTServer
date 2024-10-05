namespace GenshinCBTServer.Data;

public class ScenePointRow
{
    public string JsonObjType = "";
    public Dictionary<uint, ScenePoint> points = new Dictionary<uint, ScenePoint>();
}