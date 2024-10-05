namespace GenshinCBTServer.Excel;
using GenshinCBTServer.Player;

public class SceneExcel
{
    public uint sceneId;
    public Vector bornPos = new Vector();
    public Vector bornRot = new Vector();
    public List<SceneBlock> sceneBlocks = new List<SceneBlock>();
}