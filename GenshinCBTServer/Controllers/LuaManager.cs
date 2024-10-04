using GenshinCBTServer.Player;

using NLua;
using GenshinCBTServer.Protocol;

namespace GenshinCBTServer.Controllers
{
    public static class LuaTableExtensions
    {
        public static int[] ToIntArray(this LuaTable table)
        {
            if (table == null) return new int[0];
            // Create an integer array from the LuaTable
            int[] result = new int[table.Values.Count];
            int i = 0;

            // Iterate through LuaTable and convert values to integers
            foreach (var value in table.Values)
            {
                result[i++] = Convert.ToInt32(value);
            }

            return result;
        }
    }
    public class ScriptLib
    {
        public int currentGroupId;
        public Client curClient;

       
        public int GetGroupMonsterCount(Client client)
        {
            return client.world.entities.FindAll(e => e.groupId == currentGroupId && e is GameEntityMonster).Count;
        }
        public int GetGadgetConfigId(int entityId)
        {
            GameEntity en = curClient.world.entities.Find(e=>e.entityId == entityId);
            if(en != null)
            {
                return (int)en.configId;
            }
            return 0;
        }
        public int GetGroupMonsterCountByGroupId(Client client, int groupId)
        {
            return client.world.entities.FindAll(e=>e.groupId == groupId && e is GameEntityMonster).Count;
        }

        public int ChangeGroupGadget(Client client, LuaTable parameters)
        {
            int configId = (int)(long)parameters["config_id"];
            GadgetState state = (GadgetState)(int)(long)parameters["state"];

            Server.Print($"[LUA] Call ChangeGroupGadget with {configId},{state}");
            GameEntity entity = client.world.entities.Find(e => e.configId == configId);
            if (entity == null)
            {
                
                Server.Print($"[LUA] Entity not found with configId {configId}");
                return 0;
            }
            if (entity is not GameEntityGadget) return 0;
            Server.Print($"[LUA] Entity found with configId {configId}");
            GameEntityGadget gadget = (GameEntityGadget)entity;
            gadget.ChangeState(state);
            return 1;
        }

        // ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false })
        public int BeginCameraSceneLook(Client client, LuaTable parameters)
        {
            LuaTable lookPos = (LuaTable)parameters["look_pos"];
            float x = (float)(double)lookPos["x"];
            float y = (float)(double)lookPos["y"];
            float z = (float)(double)lookPos["z"];
            float duration = (float)(double)parameters["duration"];
            bool isForce = (bool)parameters["is_force"];
            bool isBroadcast = (bool)parameters["is_broadcast"];
            Server.Print($"[LUA] Call BeginCameraSceneLook with {x},{y},{z},{duration},{isForce},{isBroadcast}");
            BeginCameraSceneLookNotify ntf = new BeginCameraSceneLookNotify()
            {
                LookPos = new Vector()
                {
                    X = x,
                    Y = y,
                    Z = z
                },
                Duration = duration,
                IsForce = isForce
            };
            client.SendPacket((uint)CmdType.BeginCameraSceneLookNotify, ntf);
            return 1;
        }

        public int SetGroupGadgetStateByConfigId(Client client,int groupId, int configId, int gadgetState)
        {
            Server.Print($"[LUA] CallSetGroupGadgetStateByConfigId with {configId},{gadgetState}");
            GameEntity entity = client.world.entities.Find(e => e.configId == configId && e.groupId==groupId);
            if (entity == null) return 1;
            if (!(entity is GameEntityGadget))
            {
                return 1;
            }
            GameEntityGadget gadget = (GameEntityGadget)entity;
            gadget.ChangeState((GadgetState)gadgetState);
            return 0;

        }
        // ScriptLib.ChangeGroupVariableValue(context, "var_MONSTER_NUM", -1)
        public int ChangeGroupVariableValue(Client client, string variable, int value)
        {
            Server.Print($"[LUA] Call ChangeGroupVariableValue with {variable},{value}");
            SceneGroup group = client.world.currentBlock.groups.Find(g => g.id == currentGroupId);
            if (group == null) return 1;
            foreach (Variable var in group.variables)
            {
                if (var.name == variable)
                {
                    var.value = value;
                    return 0;
                }
            }
            return 1;
        }
        // ScriptLib.GetGroupVariableValue(context, "var_MONSTER_NUM")
        public int GetGroupVariableValue(Client client, string variable)
        {
            Server.Print($"[LUA] Call GetGroupVariableValue with {variable}");
            SceneGroup group = client.world.currentBlock.groups.Find(g => g.id == currentGroupId);
            if (group == null) return 0;
            foreach (Variable var in group.variables)
            {
                if (var.name == variable)
                {
                    return var.value;
                }
            }
            return 0;
        }
        // ScriptLib.CreateVariable(context, "int", 3)
        public int CreateVariable(Client client, string variable, int value)
        {
            Server.Print($"[LUA] Call CreateVariable with {variable},{value}");
            Variable var = new Variable()
            {
                name = variable,
                value = value
            };
            SceneGroup group = client.world.currentBlock.groups.Find(g => g.id == currentGroupId);
            if (group == null) return 1; // idk if should be value
            group.variables.Add(var);
            return 0;
        }
        // ScriptLib.PrintLog(LogLevel.DEBUG, "CreateMonster succeed")
        public int CreateVariable(Client client, LogLevel logLevel, string value)
        {
            Server.Print($"[LUA] Call CreateVariable with {logLevel},{value}");
            Server.Print($"[LUA] ({logLevel}): {value}");
            return 0;
        }
        public int SetGadgetStateByConfigId(Client client, int configId, int gadgetState)
        {
            Server.Print($"[LUA] Call SetGadgetStateByConfigId with {configId},{gadgetState}");
            GameEntity entity = client.world.entities.Find(e=>e.configId==configId);
            if (!(entity is GameEntityGadget)) {
                return 1;
            }
            GameEntityGadget gadget = (GameEntityGadget)entity;
            gadget.ChangeState((GadgetState)gadgetState);
            return 0;
        }
        public int KillGroupEntity(Client client,LuaTable table)
        {
            uint groupId = (uint)(long)table["group_id"];
            int[] gadgets = (table["gadgets"] as LuaTable).ToIntArray();
            int[] monsters = (table["monsters"] as LuaTable).ToIntArray();
            List<GameEntity> entities = client.world.entities.FindAll(e=>e.groupId==groupId && gadgets.Contains((int)e.configId) || monsters.Contains((int)e.configId));
            client.world.KillEntities(entities);
            return 1;
        }
        public int GetRegionEntityCount(Client client,LuaTable table)
        {
           // logger.debug("[LUA] Call GetRegionEntityCount with {}", printTable(table));
            int regionId = (int)(long)table["region_eid"];

            int entityType = 0;
            if (table["entity_type"] != null)
            {
                entityType = (int)(long)table["entity_type"];
            }
            if (entityType == (int)EntityType.Avatar)
            {
                if(client.inRegions.Contains((uint)regionId))
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                return client.world.entities.FindAll(e => e.inRegions.Contains((uint)regionId)).Count;
            }
            
        }
    }
    public enum LogLevel
    {
        Info = 0,
        Warning = 1,
        Error = 2,
        Debug = 3
    }
    public class ScriptArgs
    {
        public int param1;
        public int param2;
        public int param3;
        public int source_eid; // Source entity
        public int target_eid;
        public int group_id;
        public string source; // source string, used for timers
        public int type;
       
  
        public ScriptArgs(int groupId, int eventType, int param1, int param2)
        {
            this.group_id = groupId;
            this.type = eventType;
            this.param1 = param1;
            this.param2 = param2;
        }
        public ScriptArgs(int groupId, int eventType)
        {
            this.group_id = groupId;
            this.type = eventType;
        }
        public ScriptArgs(int groupId, int eventType, int param1)
        {
            this.group_id = groupId;
            this.type = eventType;
            this.param1 = param1;
        }
    }
    public class LuaManager
    {
        public static List<GroupTrigger> errorTriggers = new();

        public static void executeTrigger(Client client, GroupTrigger trigger, ScriptArgs args, SceneGroup group = null)
        {
            if(group == null)
            {
                group = client.world.currentBlock.groups.Find(g => g.id == args.group_id);
            }
            
            if (group!=null)
            {
                using (Lua groupLua = new Lua())
                {
                    ScriptLib scriptLib = new();
                    scriptLib.curClient = client;
                    scriptLib.currentGroupId = (int)group.id;
                    groupLua["ScriptLib"] = scriptLib;
                    groupLua["context_"] = client;
                    groupLua["evt_"] = args;
                    groupLua.DoString(group.luaFile.Replace("ScriptLib.", "ScriptLib:"));

                    string luaScript = @$"
                                if {trigger.conditionLua}(context_, evt_) then
                                    {trigger.actionLua}(context_, evt_)

                                end
                            
                        ";
                    try
                    {
                        if(trigger.conditionLua.Length==0)
                        {
                            luaScript = @$"
                                {trigger.actionLua}(context_, evt_)

                        ";
                        }
                        groupLua.DoString(luaScript);
                        Server.Print("Executed successfully LUA");
                    }
                    catch (Exception ex)
                    {
                        Server.Print("Error occured in executing Trigger Lua " + ex.Message);
                        errorTriggers.Add(trigger);
                    }
                }
            }
            

        }
        public static void executeClientTriggerLua(Client client, SceneGroup group, ScriptArgs args)
        {
            if (group == null) return;
            GameEntity en = client.world.entities.Find(e => e.entityId == args.source_eid);
            if(en == null) return;
            List<GroupTrigger> triggers = group.triggers.FindAll(t => t.eventType == (int)args.type);

            if (triggers.Count > 0)
            {
                using (Lua groupLua = new Lua())
                {
                    ScriptLib scriptLib = new();
                    scriptLib.curClient = client;
                    scriptLib.currentGroupId = (int)group.id;
                    groupLua["ScriptLib"] = scriptLib;
                    groupLua["context_"] = client;
                    groupLua["evt_"] = args;
                    groupLua.DoString(group.luaFile.Replace("ScriptLib.", "ScriptLib:"));

                    foreach (GroupTrigger trigger in triggers)
                    {
                        string luaScript = @$"
                               
                                {trigger.actionLua}(context_, evt_)
                            
                        ";
                        try
                        {
                            groupLua.DoString(luaScript);
                            Server.Print("Executed successfully LUA");
                        }
                        catch (Exception ex)
                        {
                            Server.Print("Error occured in LUA " + ex.Message);
                           
                        }
                        // Execute the Lua script
                    }
                }

            }
        }
        public static void executeTriggersLua(Client client,SceneGroup group,ScriptArgs args)
        {
            if (group == null) return;
            List<GroupTrigger> triggers = group.triggers.FindAll(t => t.eventType == (int)args.type && !errorTriggers.Contains(t));

            if(triggers.Count > 0)
            {
               

                        foreach (GroupTrigger trigger in triggers)
                        {

                            executeTrigger(client, trigger, args,group);
                        }
               
            }
           
        }
    }
}
