using CsvHelper;
using CsvHelper.Configuration;
using GenshinCBTServer.Excel;
using GenshinCBTServer.Player;
using Newtonsoft.Json;
using NLua;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

using System.Threading.Tasks;
using System.Xml.Linq;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace GenshinCBTServer
{
    public class SceneExcel
    {
        public uint sceneId;
        public Vector bornPos = new Vector();
        public Vector bornRot = new Vector();
        public List<SceneBlock> sceneBlocks = new List<SceneBlock>();
    }

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

    public class ScenePointRow
    {
        public string JsonObjType = "";
        public Dictionary<uint, ScenePoint> points = new Dictionary<uint, ScenePoint>();
    }

    public class CostItems
    {
        public uint id;
        public uint count;
    }

    public class ShopGoodsData
    {
        public uint goodsId;
        public uint itemId;
        public uint itemCount;
        public uint costScoin;
        public uint costHcoin;
        public List<CostItems> costItems = new List<CostItems>();
    }

    public class DungeonData
    {
        public uint id;
        public uint type;
        public uint playType;
        public uint sceneId;
        public uint blockId;
        public uint firstDropPreview;
        public uint dropPreview;
        public uint firstPassRewardId;
        public uint passRewardId;
        public uint settleCountdownTime;
        public bool forbiddenRestart;
    }
    public class GadgetData
    {
        public uint id;
        public uint type;
        public string jsonName = "";
        public bool hasMove;
        public bool hasAudio;
        public bool isInteractive;
        public int campID;

    }

    public class ConfigEntityCommon
    {
        public string JsonObjType = "ConfigEntityCommon";
        // ConfigEffectAttachShape effectAttachShape = new ConfigEffectAttachShape();
    }

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

    public class ConfigCombat
    {
        public string JsonObjType = "ConfigCombat";
        public ConfigCombatProperty property = new ConfigCombatProperty();
        // ConfigSummon summon = new ConfigSummon();
    }

    public class ConfigEntityAbilityEntry
    {
        public string JsonObjType = "ConfigEntityAbilityEntry";
        public string abilityID = "";
        public string abilityName = "";
    }

    public class ConfigTimer
    {
        public string JsonObjType = "ConfigTimer";
        public bool lifeInfinite = false;
        public float startCheckTime;
        public float checkInterval;
        public float lifeTime;
    }

    public class ConfigLinerBulletMove
    {
        public string JsonObjType = "ConfigLinerBulletMove";
        public float speed;
        public bool canBornInWater = false;
    }

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

    public class AvatarPromoteExcel
    {
        public uint promoteLevel;
        public ElementType elementType;
        public List<CostItems> costItems = new List<CostItems>();
        public uint unlockMaxLevel;
        public List<PromoteProp> addProps = new List<PromoteProp>();
        public uint playerExp;
    }

    public enum ElementType
    {
        None = 0,
        Fire = 1,
        Water = 2,
        Grass = 3,
        Electric = 4,
        Ice = 5,
        Frozen = 6,
        Wind = 7,
        Rock = 8,
        AntiFire = 9,
    }

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
        public Dictionary<uint, PromoteInfo>  weaponsPromote = new Dictionary<uint, PromoteInfo>();
        public Dictionary<uint, GadgetProp> gadgetProps = new Dictionary<uint, GadgetProp>();
        public Dictionary<uint, MonsterData> monsterDataDict = new Dictionary<uint, MonsterData>();
        public Dictionary<string, GadgetConfigRow> configGadgetDict = new Dictionary<string, GadgetConfigRow>();
        public List<DropData> dropData = new List<DropData>();
        public List<ChildDrop> childDropData = new List<ChildDrop>();

        public class DropList
        {
            public List<GameEntity> entities = new();
        }
        public DropList GetRandomDrops(Client session,uint id, MotionInfo motion)
        {
            DropList dropList = new DropList();
            DropData data = dropData.Find(d=>d.drop_id== id)!;  
            if (data!= null)
            {
                List<ChildDrop> childDrops = childDropData.FindAll(c=>c.child_drop_id==data.child_drop_id);
                int size = new Random().Next(1, childDrops.Count);
                for(int i=0; i<size; i++) { 
                    ChildDrop drop = childDrops[i];
                    ItemData itemD = itemData[drop.item_drop_id];
                    uint entityId = ((uint)ProtEntityType.ProtEntityGadget << 24) + (uint)session.random.Next();
                    GameEntityItem gadgetItem = new(entityId, itemD.gadgetId, motion,new GameItem(session,itemD.id));
                    gadgetItem.item.amount= new Random().Next(1, 10);
                    dropList.entities.Add(gadgetItem);
                }

            }

            return dropList;
        }
        public void Load()
        {
            shopGoodsDict = JsonConvert.DeserializeObject<Dictionary<uint, ShopGoodsData>>(File.ReadAllText("resources/excel/ShopGoodsExcelConfigData.json"))!;
            dungeonDataDict = JsonConvert.DeserializeObject<Dictionary<uint, DungeonData>>(File.ReadAllText("resources/excel/DungeonExcelConfigData.json"))!;
            gadgetDataDict = JsonConvert.DeserializeObject<Dictionary<uint, GadgetData>>(File.ReadAllText("resources/excel/GadgetExcelConfigData.json"))!;
            monsterDataDict = JsonConvert.DeserializeObject<Dictionary<uint, MonsterData>>(File.ReadAllText("resources/excel/MonsterExcelConfigData.json"))!;
            avatarPromoteData = JsonConvert.DeserializeObject<List<AvatarPromoteExcel>>(File.ReadAllText("resources/excel/AvatarPromoteExcelConfigData.json"))!;
            configGadgetDict = LoadConfigGadget();
            avatarsData = LoadAvatarExcel();
            talentSkillData = LoadTalentSkillData();
            avatarSkillDepotData = LoadAvatarSkillDepotData();
            avatarCurveDict = JsonConvert.DeserializeObject<Dictionary<uint, LevelCurve>>(File.ReadAllText("resources/excel/AvatarCurveExcelConfigData.json"))!;
            itemData = AddItemDataDic(JsonConvert.DeserializeObject<Dictionary<uint, ItemData>>(File.ReadAllText("resources/excel/WeaponExcelConfigData.json"))!);
            itemData = AddItemDataDic(JsonConvert.DeserializeObject<Dictionary<uint, ItemData>>(File.ReadAllText("resources/excel/MaterialExcelConfigData.json"))!);
            itemData = AddItemDataDic(JsonConvert.DeserializeObject<Dictionary<uint, ItemData>>(File.ReadAllText("resources/excel/ReliquaryExcelConfigData.json"))!);
            weaponCurves = JsonConvert.DeserializeObject<Dictionary<uint, LevelCurve>>(File.ReadAllText("resources/excel/WeaponCurveExcelConfigData.json"))!;
            gadgetProps = JsonConvert.DeserializeObject<Dictionary<uint, GadgetProp>>(File.ReadAllText("resources/excel/GadgetPropExcelConfigData.json"))!;

            weaponsPromote = JsonConvert.DeserializeObject<Dictionary<uint, PromoteInfo>>(File.ReadAllText("resources/excel/WeaponPromoteExcelConfigData.json"))!;
            dropData = JsonConvert.DeserializeObject<List<DropData>>(File.ReadAllText("resources/excel/DropTreeData.json"))!;
            childDropData = JsonConvert.DeserializeObject<List<ChildDrop>>(File.ReadAllText("resources/excel/DropLeafData.json"))!;
            Server.Print("Loading all scenes lua");
            string[] scenes_ = Directory.GetDirectories("resources/lua/Scene");
            foreach (string scene in scenes_)
            {
                uint sceneid = uint.Parse(scene.Replace("resources/lua/Scene\\", ""));
                scenes.Add(LoadSceneLua(sceneid));
                scenePointDict[sceneid] = LoadScenePointData(sceneid);
            }
        }
        public List<AvatarData> LoadAvatarExcel()
        {
            Dictionary<uint, AvatarData> data = JsonConvert.DeserializeObject<Dictionary<uint, AvatarData> >(File.ReadAllText("resources/excel/AvatarExcelConfigData.json"))!;
            return data.Values.ToList();
        }
        public Dictionary<uint,ItemData> AddItemDataDic(Dictionary<uint,ItemData> data)
        {
            return itemData.Union(data).ToDictionary(kvp => kvp.Key, kvp => kvp.Value);
        }
        public SceneExcel LoadSceneLua(uint sceneId)
        {
            string mainlocation = $"resources/lua/Scene/{sceneId}";
            string mainLua = mainlocation + $"/scene{sceneId}.lua";
            SceneExcel scene = new() { sceneId = sceneId };
            if (File.Exists(mainLua))
            {
                string mainLuaString = File.ReadAllText(mainLua) + "\n" + File.ReadAllText("resources/lua/Config/Excel/CommonScriptConfig.lua");
                using (Lua scenelua = new Lua())
                {

                    scenelua.DoString(mainLuaString);


                    LuaTable blocks = scenelua["blocks"] as LuaTable;  // Cast to LuaTable for tables
                    LuaTable scene_config = scenelua["scene_config"] as LuaTable;
                    scene.bornPos = TableToVector2D(scene_config["born_pos"] as LuaTable);
                    scene.bornRot = TableToVector2D(scene_config["born_rot"] as LuaTable);

                    LuaTable block_rects = scenelua["block_rects"] as LuaTable;
                    for (int i = 0; i < blocks!.Keys.Count; i++)
                    {
                        uint blockId = (uint)(long)blocks[i + 1];
                        SceneBlock block = new SceneBlock() { blockId = blockId };
                        LoadSceneGroup(block,sceneId);

                        if (block_rects != null)
                        {
                            LuaTable rectTable = block_rects[i + 1] as LuaTable;
                            if (rectTable != null)
                            {
                                Vector min = TableToVector2D(rectTable["min"] as LuaTable);
                                Vector max = TableToVector2D(rectTable["max"] as LuaTable);
                                block.minPos = min;
                                block.maxPos = max;
                            }
                            
                        }
                        
                        scene.sceneBlocks.Add(block);
                    }

                }
            }
            else
            {
                Server.Print($"Cannot load scene {sceneId} lua file (Not found)");
            }
            return scene;
        }

        private Vector TableToVector2D(LuaTable pos)
        {
            if (pos["y"] != null)
            {
                return new Vector() { X = Convert.ToSingle(pos["x"]), Y = Convert.ToSingle(pos["y"]), Z = Convert.ToSingle(pos["z"]) };
            } else {
                return new Vector() { X = (float)(double)pos["x"], Z = (float)(double)pos["z"] };
            }
        }

        public Dictionary<string, GadgetConfigRow> LoadConfigGadget()
        {
            string mainlocation = $"resources/binoutput/gadget";
            string[] files = Directory.GetFiles(mainlocation);
            Dictionary<string, GadgetConfigRow> configGadgetDict = new();
            foreach (string file in files)
            {
                FileInfo fileInfo = new(file);
                if (fileInfo.Extension == ".json")
                {
                    string text = File.ReadAllText(file);
                    Dictionary<string, GadgetConfigRow> config = JsonConvert.DeserializeObject<Dictionary<string, GadgetConfigRow>>(text)!;
                    foreach (var entry in config)
                    {
                        configGadgetDict[entry.Key] = entry.Value;
                    }
                }
            }
            Server.Print($"Loaded {configGadgetDict.Count} gadget configs");
            return configGadgetDict;
        }

        private void LoadSceneGroup(SceneBlock block, uint sceneId)
        {
            string mainlocation = $"resources/lua/Scene/{sceneId}";
            string mainLua = mainlocation + $"/scene{sceneId}_block{block.blockId}.lua";
            if (File.Exists(mainLua))
            {
                string mainLuaString = File.ReadAllText(mainLua) + "\n" + File.ReadAllText("resources/lua/Config/Excel/CommonScriptConfig.lua");
                using (Lua sceneBlock = new Lua())
                {

                    sceneBlock.DoString(mainLuaString);
                    if (File.Exists(mainlocation + $"/scene{sceneId}_{block.blockId}_routes.json"))
                    {
                        string jsonRoute = File.ReadAllText(mainlocation + $"/scene{sceneId}_{block.blockId}_routes.json");
                        block.routeData = JsonConvert.DeserializeObject<SceneBlockRoutes>(jsonRoute)!;
                    }
                    else
                    {
                        block.routeData.blockId = block.blockId;
                    }
                   
                    LuaTable groups = sceneBlock["groups"] as LuaTable;  // Cast to LuaTable for tables


                    for (int i = 0; i < groups.Keys.Count; i++)
                    {
                        LuaTable groupTable = groups[i + 1] as LuaTable;
                        try
                        {
                            SceneGroup group = new SceneGroup()
                            {
                                id = (uint)(long)groupTable["id"],
                                refreshTime = (uint)(long)groupTable["refresh_time"],

                            };
                            if (groupTable["area"] != null)
                            {
                                group.area = (uint)(long)groupTable["area"];
                            }
                            LoadSceneGroupLua(group,sceneId);
                            block.groups.Add(group);
                        }
                        catch (Exception e)
                        {

                        }


                    }

                }
            }
            else
            {
                Server.Print($"Cannot get scene groups from {block.blockId} lua file (Not found)");
            }
        }
        public string getRequiredLuas()
        {
            return File.ReadAllText("resources/lua/Config/Json/ConfigEntityType.lua") + "\n" + File.ReadAllText("resources/lua/Config/Json/ConfigEntity.lua") + "\n" + File.ReadAllText("resources/lua/Config/Excel/CommonScriptConfig.lua") + "\n";
        }
        private void LoadSceneGroupLua(SceneGroup group, uint sceneId)
        {
            string mainlocation = $"resources/lua/Scene/{sceneId}";
            string mainLua = mainlocation + $"/scene{sceneId}_group{group.id}.lua";
            if (File.Exists(mainLua))
            {
                string mainLuaString = getRequiredLuas() + File.ReadAllText(mainLua);
                using (Lua sceneGroup = new Lua())
                {

                    sceneGroup.DoString(mainLuaString);

                    sceneGroup.DoString(@"
                        function GetEnumName(enumTable, value)
                            for k, v in pairs(enumTable) do
                                if v == value then
                                    return k
                                end
                            end
                            return nil
                        end
                    ");

                    group.luaFile = mainLuaString;

                    LuaTable gadgets = sceneGroup["gadgets"] as LuaTable;  // Cast to LuaTable for tables
                    LuaTable npcs = sceneGroup["npcs"] as LuaTable;
                    LuaTable monsters = sceneGroup["monsters"] as LuaTable;
                   
                    for (int i = 0; i < gadgets.Keys.Count; i++)
                    {
                        LuaTable gadgetTable = gadgets[i + 1] as LuaTable;
                        LuaTable pos = gadgetTable["pos"] as LuaTable;
                        LuaTable rot = gadgetTable["rot"] as LuaTable;
                        SceneGadget gadget = new()
                        {
                            
                            gadget_id = (uint)(long)gadgetTable["gadget_id"],
                            config_id = (uint)(long)gadgetTable["config_id"],
                            pos = new Vector() { X = (float)(double)pos["x"], Y = (float)(double)pos["y"], Z = (float)(double)pos["z"] },
                            rot = new Vector() { X = (float)(double)rot["x"], Y = (float)(double)rot["y"], Z = (float)(double)rot["z"] }
                        };
                        if (gadgetTable["chest_drop_id"] != null) gadget.chest_drop_id = (uint)(long)gadgetTable["chest_drop_id"];
                        if (gadgetTable["state"] != null) {
                            gadget.state = (int)(long)gadgetTable["state"];
                            string stateName = sceneGroup.GetFunction("GetEnumName").Call(sceneGroup["GadgetState"], gadget.state)[0].ToString()!;
                            if (Enum.TryParse(typeof(GadgetState), stateName, out var parsedState) && parsedState is GadgetState gadgetState)
                            {
                                gadget.state = (int)gadgetState;
                            }
                        }
                        if (gadgetTable["route_id"] != null) gadget.route_id = (uint)(long)gadgetTable["route_id"];
                        if (gadgetTable["type"] != null) gadget.type = (uint)(long)gadgetTable["type"];
                        if (gadgetTable["showcutscene"] != null) gadget.showcutscene = (bool)gadgetTable["showcutscene"];
                        
                        /*
                        if(gadget.type > 0)
                        {
                            Server.Print($" type: {((GadgetType)gadget.type).ToString()} & state {gadget.state} & config id {gadget.config_id}");
                        }
                        */
                        
                        group.gadgets.Add(gadget);
                    }

                    for (int i = 0; i < monsters.Keys.Count; i++)
                    {
                        LuaTable monsterTable = monsters[i + 1] as LuaTable;
                        LuaTable pos = monsterTable["pos"] as LuaTable;
                        LuaTable rot = monsterTable["rot"] as LuaTable;
                        SceneMonster monster = new()
                        {

                            monster_id = (uint)(long)monsterTable["monster_id"],
                            config_id = (uint)(long)monsterTable["config_id"],
                            pos = new Vector() { X = (float)(double)pos["x"], Y = (float)(double)pos["y"], Z = (float)(double)pos["z"] },
                            rot = new Vector() { X = (float)(double)rot["x"], Y = (float)(double)rot["y"], Z = (float)(double)rot["z"] }
                        };
                        if (monsterTable["level"] != null) monster.level = (uint)(long)monsterTable["level"];
                        if (monsterTable["drop_id"] != null) monster.drop_id = (uint)(long)monsterTable["drop_id"];
                        if (monsterTable["pose_id"] != null) monster.pose_id = (uint)(long)monsterTable["pose_id"];
                        group.monsters.Add(monster);
                    }

                    for (int i = 0; i < npcs.Keys.Count; i++)
                    {
                        LuaTable npcTable = npcs[i + 1] as LuaTable;
                        LuaTable pos = npcTable["pos"] as LuaTable;
                        LuaTable rot = npcTable["rot"] as LuaTable;
                        SceneNpc npc = new()
                        {
                            npc_id = (uint)(long)npcTable["npc_id"],
                            config_id = (uint)(long)npcTable["config_id"],
                            pos = new Vector() { X = (float)(double)pos["x"], Y = (float)(double)pos["y"], Z = (float)(double)pos["z"] },
                            rot = new Vector() { X = (float)(double)rot["x"], Y = (float)(double)rot["y"], Z = (float)(double)rot["z"] }
                        };
                        group.npcs.Add(npc);
                    }
                    LuaTable triggers = sceneGroup["triggers"] as LuaTable;
                    for (int i = 0; i < triggers.Keys.Count; i++)
                    {
                        LuaTable triggerTable = triggers[i + 1] as LuaTable;
                        GroupTrigger trigger = new GroupTrigger();
                        trigger.name = (string)triggerTable["name"];
                        trigger.actionLua = (string)triggerTable["action"];
                        trigger.conditionLua = (string)triggerTable["condition"];
                        if (triggerTable["event"] != null) trigger.eventType = (int)(long)triggerTable["event"];
                        group.triggers.Add(trigger);
                       // Server.Print($"Trigger: " + trigger.name + " added");
                    }
                    LuaTable regions = sceneGroup["regions"] as LuaTable;
                    for (int i = 0; i < regions.Keys.Count; i++)
                    {
                        try
                        {
                            LuaTable regionTable = regions[i + 1] as LuaTable;
                            if (regionTable == null) break;
                            SceneRegion region = new SceneRegion();
                            if (regionTable["config_id"] != null) region.config_id = (uint)(long)regionTable["config_id"];
                            if (regionTable["shape"] != null) region.shape = (uint)(long)regionTable["shape"];
                            if (regionTable["pos"] != null)
                            {
                                LuaTable pos = regionTable["pos"] as LuaTable;
                                region.pos = new Vector() { X = (float)(double)Convert.ToDouble(pos["x"]), Y = (float)(double)Convert.ToDouble(pos["y"]), Z = (float)(double)Convert.ToDouble(pos["z"]) };
                            }

                            if (regionTable["radius"] != null) region.radius = (float)(double)Convert.ToDouble(regionTable["radius"]);
                            //Need to add size for cubic
                            group.regions.Add(region);
                        }
                        catch(Exception e)
                        {
                            Server.Print("Error occured " + e.Message);
                        }
                    }
                }
            }
            else
            {
                Server.Print($"Cannot get scene group things because lua file not found");
            }
        }
        

        private ScenePointRow LoadScenePointData(uint sceneId)
        {
            string path = $"resources/binoutput/Scene/Point/scene{sceneId}_point.json";
            FileInfo file = new(path);
            if (!file.Exists)
            {
                // Server.Print($"Cannot load scene point data for scene {sceneId} (Not found)");
                return new ScenePointRow();
            }
            using var reader = file.OpenRead();
            using StreamReader reader2 = new(reader);
            var text = reader2.ReadToEnd().Replace("$type", "JsonObjType");
            return JsonConvert.DeserializeObject<ScenePointRow>(text)!;
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
