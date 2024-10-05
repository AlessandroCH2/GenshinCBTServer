namespace GenshinCBTServer.Data;

public class SceneBlockRoutes
{
    public uint sceneId;
    public uint blockId; //Not in the json
    public List<RouteData> routes = new List<RouteData>();
}