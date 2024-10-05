namespace GenshinCBTServer.Data;

public class ScenePoint
{
    required public string JsonObjType;
    public uint gadgetId;
    public uint areaId;
    public string type = "";
    required public Vector pos;
    required public Vector rot;

    // those 2 only when SceneTransPoint
    public Vector tranPos = new Vector();
    public Vector tranRot = new Vector();
    public uint tranSceneId;

    public bool unlocked;
    public List<uint> dungeonIds = new List<uint>();
    public Vector size = new Vector();
    public List<uint> cutsceneList = new List<uint>();
}