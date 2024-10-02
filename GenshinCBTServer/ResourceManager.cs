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
        public string jsonName;
        public bool hasMove;
        public bool hasAudio;
        public bool isInteractive;
        public int campID;

    }

    public class ResourceManager
    {
        public List<AvatarData> avatarsData;
        public List<TalentSkillData> talentSkillData;
        public List<AvatarSkillDepotData> avatarSkillDepotData;
        public Dictionary<uint, ItemData> itemData = new Dictionary<uint, ItemData>();
        public List<SceneExcel> scenes = new List<SceneExcel>();
        public Dictionary<uint, ShopGoodsData> shopGoodsDict = new Dictionary<uint, ShopGoodsData>();
        public Dictionary<uint, ScenePointRow> scenePointDict = new Dictionary<uint, ScenePointRow>();
        public Dictionary<uint, DungeonData> dungeonDataDict = new Dictionary<uint, DungeonData>();
        public Dictionary<uint, GadgetData> gadgetDataDict = new Dictionary<uint, GadgetData>();
        public Dictionary<uint, ReliquaryCurve> reliquaryCurves = new Dictionary<uint, ReliquaryCurve>();
        public Dictionary<uint, LevelCurve> weaponCurves = new Dictionary<uint, LevelCurve>();
        public Dictionary<uint, PromoteInfo>  weaponsPromote = new Dictionary<uint, PromoteInfo>();
        public void Load()
        {
            avatarsData = JsonConvert.DeserializeObject<List<AvatarData>>(File.ReadAllText("resources/excel/AvatarData.json"));
            shopGoodsDict = JsonConvert.DeserializeObject<Dictionary<uint, ShopGoodsData>>(File.ReadAllText("resources/excel/ShopGoodsExcelConfigData.json"));
            dungeonDataDict = JsonConvert.DeserializeObject<Dictionary<uint, DungeonData>>(File.ReadAllText("resources/excel/DungeonExcelConfigData.json"));
            gadgetDataDict = JsonConvert.DeserializeObject<Dictionary<uint, GadgetData>>(File.ReadAllText("resources/excel/GadgetExcelConfigData.json"));
            talentSkillData = LoadTalentSkillData();
            avatarSkillDepotData = LoadAvatarSkillDepotData();
            itemData = AddItemDataDic(JsonConvert.DeserializeObject<Dictionary<uint, ItemData>>(File.ReadAllText("resources/excel/WeaponExcelConfigData.json")));
            itemData = AddItemDataDic(JsonConvert.DeserializeObject<Dictionary<uint, ItemData>>(File.ReadAllText("resources/excel/MaterialExcelConfigData.json")));
            itemData = AddItemDataDic(JsonConvert.DeserializeObject<Dictionary<uint, ItemData>>(File.ReadAllText("resources/excel/ReliquaryExcelConfigData.json")));
            weaponCurves = JsonConvert.DeserializeObject<Dictionary<uint, LevelCurve>>(File.ReadAllText("resources/excel/WeaponCurveExcelConfigData.json"));

          
            weaponsPromote = JsonConvert.DeserializeObject<Dictionary<uint, PromoteInfo>>(File.ReadAllText("resources/excel/WeaponPromoteExcelConfigData.json"));
            Server.Print("Loading all scenes lua");
            string[] scenes_ = Directory.GetDirectories("resources/lua/Scene");
            foreach (string scene in scenes_)
            {
                uint sceneid = uint.Parse(scene.Replace("resources/lua/Scene\\", ""));
                scenes.Add(LoadSceneLua(sceneid));
                scenePointDict[sceneid] = LoadScenePointData(sceneid);
            }
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
                    for (int i = 0; i < blocks.Keys.Count; i++)
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
            return File.ReadAllText("resources/lua/Config/Json/ConfigEntity.lua") + "\n" + File.ReadAllText("resources/lua/Config/Excel/CommonScriptConfig.lua") + "\n";
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
                        if (gadgetTable["state"] != null) gadget.state = (uint)(long)gadgetTable["state"];

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
                Server.Print($"Cannot load scene point data for scene {sceneId} (Not found)");
                return new ScenePointRow();
            }
            using var reader = file.OpenRead();
            using StreamReader reader2 = new(reader);
            var text = reader2.ReadToEnd().Replace("$type", "JsonObjType");
            return JsonConvert.DeserializeObject<ScenePointRow>(text);
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
            return gadgetDataDict[id];
        }
        public AvatarData GetAvatarDataById(uint id)
        {
            return avatarsData.Find(av => av.id == id);
        }
    }
}
