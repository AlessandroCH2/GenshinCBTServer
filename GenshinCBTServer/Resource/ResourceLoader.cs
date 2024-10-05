using GenshinCBTServer.Controllers;
using GenshinCBTServer.Data;
using GenshinCBTServer.Excel;
using GenshinCBTServer.Player;
using Newtonsoft.Json;
using NLua;

namespace GenshinCBTServer
{
    public class ResourceLoader {
        private readonly ResourceManager _resourceManager;

        public ResourceLoader(ResourceManager resourceManager)
        {
            _resourceManager = resourceManager;
        }

        public void LoadAll()
        {
            // JsonConvert stuff
            _resourceManager.shopGoodsDict = JsonConvert.DeserializeObject<Dictionary<uint, ShopGoodsData>>(File.ReadAllText("resources/ExcelOutput/ShopGoodsExcelConfigData.json"))!;
            _resourceManager.dungeonDataDict = JsonConvert.DeserializeObject<Dictionary<uint, DungeonData>>(File.ReadAllText("resources/ExcelOutput/DungeonExcelConfigData.json"))!;
            _resourceManager.gadgetDataDict = JsonConvert.DeserializeObject<Dictionary<uint, GadgetData>>(File.ReadAllText("resources/ExcelOutput/GadgetExcelConfigData.json"))!;
            _resourceManager.monsterDataDict = JsonConvert.DeserializeObject<Dictionary<uint, MonsterData>>(File.ReadAllText("resources/ExcelOutput/MonsterExcelConfigData.json"))!;
            _resourceManager.avatarPromoteData = JsonConvert.DeserializeObject<List<AvatarPromoteExcel>>(File.ReadAllText("resources/ExcelOutput/AvatarPromoteExcelConfigData.json"))!;
            _resourceManager.avatarCurveDict = JsonConvert.DeserializeObject<Dictionary<uint, LevelCurve>>(File.ReadAllText("resources/ExcelOutput/AvatarCurveExcelConfigData.json"))!;
            _resourceManager.itemData = AddItemDataDic(JsonConvert.DeserializeObject<Dictionary<uint, ItemData>>(File.ReadAllText("resources/ExcelOutput/WeaponExcelConfigData.json"))!);
            _resourceManager.itemData = AddItemDataDic(JsonConvert.DeserializeObject<Dictionary<uint, ItemData>>(File.ReadAllText("resources/ExcelOutput/MaterialExcelConfigData.json"))!);
            _resourceManager.itemData = AddItemDataDic(JsonConvert.DeserializeObject<Dictionary<uint, ItemData>>(File.ReadAllText("resources/ExcelOutput/ReliquaryExcelConfigData.json"))!);
            _resourceManager.weaponCurves = JsonConvert.DeserializeObject<Dictionary<uint, LevelCurve>>(File.ReadAllText("resources/ExcelOutput/WeaponCurveExcelConfigData.json"))!;
            _resourceManager.gadgetProps = JsonConvert.DeserializeObject<Dictionary<uint, GadgetProp>>(File.ReadAllText("resources/ExcelOutput/GadgetPropExcelConfigData.json"))!;
            _resourceManager.weaponsPromote = JsonConvert.DeserializeObject<Dictionary<uint, PromoteInfo>>(File.ReadAllText("resources/ExcelOutput/WeaponPromoteExcelConfigData.json"))!;
            _resourceManager.dropData = JsonConvert.DeserializeObject<List<DropData>>(File.ReadAllText("resources/ExcelOutput/DropTreeExcelConfigData.json"))!;
            _resourceManager.childDropData = JsonConvert.DeserializeObject<List<ChildDrop>>(File.ReadAllText("resources/ExcelOutput/DropLeafExcelConfigData.json"))!;

            // functions
            _resourceManager.configGadgetDict = LoadConfigGadget();
            _resourceManager.avatarsData = LoadAvatarExcel();
            _resourceManager.talentSkillData = LoadTalentSkillData();
            _resourceManager.avatarSkillDepotData = LoadAvatarSkillDepotData();

        }

        public void LoadAllLua() {
            Server.Print("Loading all scenes lua");
            string[] scenes_ = Directory.GetDirectories("resources/Lua/Scene");
            foreach (string scene in scenes_)
            {
                uint sceneid = uint.Parse(scene.Replace("resources/Lua/Scene\\", ""));
                _resourceManager.scenes.Add(LoadSceneLua(sceneid));
                _resourceManager.scenePointDict[sceneid] = LoadScenePointData(sceneid);
            }
        }

        public Dictionary<string, GadgetConfigRow> LoadConfigGadget()
        {
            string mainlocation = $"resources/BinOutput/Gadget";
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

        public Dictionary<uint,ItemData> AddItemDataDic(Dictionary<uint,ItemData> data)
        {
            return _resourceManager.itemData.Union(data).ToDictionary(kvp => kvp.Key, kvp => kvp.Value);
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
                            if (groupTable["variables"] != null)
                            {
                                /// here implement variables
                            }
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

        private void LoadSceneGroupLua(SceneGroup group, uint sceneId)
        {
            string mainlocation = $"resources/Lua/Scene/{sceneId}";
            string mainLua = mainlocation + $"/scene{sceneId}_group{group.id}.lua";
            if (File.Exists(mainLua))
            {
                string mainLuaString = getRequiredLuas() + File.ReadAllText(mainLua);
                using (Lua sceneGroup = new Lua())
                {
                    mainLuaString = ReplaceGadgetState(mainLuaString);
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
                    LuaTable suites = sceneGroup["suites"] as LuaTable;
                    for (int i = 0; i < suites.Keys.Count; i++)
                    {
                        LuaTable suiteTable = suites[i + 1] as LuaTable;
                        GroupSuite suite = new GroupSuite();
                        suite.monsters = suiteTable.GetIntArray("monsters");
                        suite.gadgets = suiteTable.GetIntArray("gadgets");

                        group.suites.Add(suite);
                    }
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
                        }
                        if (gadgetTable["route_id"] != null) gadget.route_id = (uint)(long)gadgetTable["route_id"];
                        if (gadgetTable["type"] != null) gadget.type = (uint)(long)gadgetTable["type"];
                        if (gadgetTable["showcutscene"] != null) gadget.showcutscene = (bool)gadgetTable["showcutscene"];
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
                        trigger.groupId = (int)group.id;
                        if (triggerTable["event"] != null) trigger.eventType = (int)(long)triggerTable["event"];
                        group.triggers.Add(trigger);
                        // Server.Print($"Trigger: " + trigger.name + " added");
                    }
                    LuaTable variables = sceneGroup["variables"] as LuaTable;
                    for (int i = 0; i < variables.Keys.Count; i++)
                    {
                        LuaTable variablesTable = variables[i + 1] as LuaTable;
                        // Server.Print($"Variable:  {variablesTable["name"]}: {variablesTable["value"]} (on ${mainLua})");
                        Variable variable = new Variable();
                        variable.name = (string)variablesTable["name"];
                        variable.value = (int)(long)variablesTable["value"];
                        // Server.Print($"Variable: {variable.name} added with value {variable.value}");
                        group.variables.Add(variable);
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

        public string getRequiredLuas()
        {
            return File.ReadAllText("resources/Lua/Config/Json/ConfigEntityType.lua") + "\n" + File.ReadAllText("resources/Lua/Config/Json/ConfigEntity.lua") + "\n" + File.ReadAllText("resources/Lua/Config/Excel/CommonScriptConfig.lua") + "\n";
        }

        private string ReplaceGadgetState(string mainLuaString)
        {
            foreach(string v in Enum.GetNames(typeof(GadgetState)))
            {
                int val = (int)Enum.Parse(typeof(GadgetState), v);
                string rep = "GadgetState." + v;
                mainLuaString = mainLuaString.Replace(rep, ""+val);
            }
            return mainLuaString;
        }

        public List<AvatarData> LoadAvatarExcel()
        {
            Dictionary<uint, AvatarData> data = JsonConvert.DeserializeObject<Dictionary<uint, AvatarData> >(File.ReadAllText("resources/ExcelOutput/AvatarExcelConfigData.json"))!;
            return data.Values.ToList();
        }

        private ScenePointRow LoadScenePointData(uint sceneId)
        {
            string path = $"resources/BinOutput/Scene/Point/scene{sceneId}_point.json";
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
            string path = $"resources/ExcelOutput/AvatarSkillDepotExcelConfigData.json";
            return JsonConvert.DeserializeObject<Dictionary<uint, AvatarSkillDepotData>>(File.ReadAllText(path))!.Values.ToList();
        }

        private List<TalentSkillData> LoadTalentSkillData()
        {
            string path = $"resources/ExcelOutput/AvatarTalentExcelConfigData.json";
            return JsonConvert.DeserializeObject<Dictionary<uint, TalentSkillData>>(File.ReadAllText(path))!.Values.ToList();
        }
    }
}
