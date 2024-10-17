using GenshinCBTServer.Player;
using GenshinCBTServer.Excel;
using GenshinCBTServer.Data;

namespace GenshinCBTServer
{
    public class ResourceManager
    {
        public List<AvatarData> avatarsData = new List<AvatarData>();
        public List<TalentSkillData> talentSkillData = new List<TalentSkillData>();
        public List<AvatarSkillDepotData> avatarSkillDepotData = new List<AvatarSkillDepotData>();
        public List<AvatarPromoteExcel> avatarPromoteData = new List<AvatarPromoteExcel>();
        public Dictionary<uint, ItemData> itemData = new Dictionary<uint, ItemData>();
        public Dictionary<uint, LevelCurve> avatarCurveDict = new Dictionary<uint, LevelCurve>();
        public List<SceneExcel> scenes = new List<SceneExcel>();
        public Dictionary<uint, ShopGoodsData> shopGoodsDict = new Dictionary<uint, ShopGoodsData>();
        public Dictionary<uint, ScenePointRow> scenePointDict = new Dictionary<uint, ScenePointRow>();
        public Dictionary<uint, DungeonData> dungeonDataDict = new Dictionary<uint, DungeonData>();
        public Dictionary<uint, GadgetData> gadgetDataDict = new Dictionary<uint, GadgetData>();
        public Dictionary<uint, ReliquaryCurve> reliquaryCurves = new Dictionary<uint, ReliquaryCurve>();
        public Dictionary<uint, LevelCurve> weaponCurves = new Dictionary<uint, LevelCurve>();
        public Dictionary<uint, PromoteInfo> weaponsPromote = new Dictionary<uint, PromoteInfo>();
        public Dictionary<uint, GadgetProp> gadgetProps = new Dictionary<uint, GadgetProp>();
        public Dictionary<uint, MonsterData> monsterDataDict = new Dictionary<uint, MonsterData>();
        public Dictionary<uint, CookRecipeExcel> cookRecipeDict = new Dictionary<uint, CookRecipeExcel>();
        public Dictionary<uint, CompoundExcel> compoundDict = new Dictionary<uint, CompoundExcel>();
        public Dictionary<string, GadgetConfigRow> configGadgetDict = new Dictionary<string, GadgetConfigRow>();
        public List<DropData> dropData = new List<DropData>();
        public List<ChildDrop> childDropData = new List<ChildDrop>();

        public class DropList
        {
            public List<GameEntity> entities = new();
        }

        public DropList GetRandomDrops(Client session, uint id, MotionInfo motion)
        {
            DropList dropList = new DropList();
            DropData data = dropData.Find(d => d.drop_id == id)!;
            if (data != null)
            {
                List<ChildDrop> childDrops = childDropData.FindAll(c => c.child_drop_id == data.child_drop_id);
                int size = new Random().Next(1, childDrops.Count);
                for (int i = 0; i < size; i++)
                {
                    ChildDrop drop = childDrops[i];
                    ItemData itemD = itemData[drop.item_drop_id];
                    uint entityId = ((uint)ProtEntityType.ProtEntityGadget << 24) + (uint)session.random.Next();
                    GameEntityItem gadgetItem = new(entityId, itemD.gadgetId, motion, new GameItem(session, itemD.id));
                    gadgetItem.item.amount = new Random().Next(1, 10);
                    dropList.entities.Add(gadgetItem);
                }
            }
            return dropList;
        }

        public GadgetData GetGadgetData(uint id)
        {
            if (gadgetDataDict.ContainsKey(id))
            {
                return gadgetDataDict[id];
            }
            return gadgetDataDict.Values.First();
        }

        public AvatarData GetAvatarDataById(uint id)
        {
            return avatarsData.Find(av => av.id == id)!;
        }
    }
}
