using GenshinCBTServer.Player;

using NLua;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace GenshinCBTServer.Controllers
{
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

            Server.Print($"[LUA] Call GetGroupMonsterCountByGroupId with {configId},{state}");
            GameEntity entity = client.world.entities.First(e => e.configId == configId && e is GameEntityGadget);
            if (entity == null)
            {
                Server.Print($"[LUA] Entity not found with configId {configId}");
                return 0;
            }
            Server.Print($"[LUA] Entity found with configId {configId}");
            GameEntityGadget gadget = (GameEntityGadget)entity;
            gadget.ChangeState(state);
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
        public int KillGroupEntity(LuaTable table)
        {
            uint groupId = (uint)(long)table["group_id"];
            int[] gadgets = (int[])table["gadgets"];

            List<GameEntity> entities = curClient.world.entities.FindAll(e=>e.groupId==groupId && gadgets.Contains((int)e.configId));
            curClient.world.KillEntities(entities);
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

        public static void executeTrigger(Client client, GroupTrigger trigger, ScriptArgs args)
        {
            SceneGroup group = client.world.currentBlock.groups.Find(g=>g.id==args.group_id);
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
                               
                                {trigger.actionLua}(context_, evt_)
                            
                        ";
                    try
                    {
                        groupLua.DoString(luaScript);
                        Server.Print("Executed successfully LUA");
                    }
                    catch (Exception ex)
                    {
                        Server.Print("Error occured in executing Trigger Lua " + ex.Message);

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
        public static void executeTriggerLua(Client client,SceneGroup group,ScriptArgs args)
        {
            if (group == null) return;
            List<GroupTrigger> triggers = group.triggers.FindAll(t => t.eventType == (int)args.type && !errorTriggers.Contains(t));

            if(triggers.Count > 0)
            {
                using (Lua groupLua = new Lua())
                {
                    ScriptLib scriptLib = new();
                    scriptLib.curClient = client;
                    scriptLib.currentGroupId =(int) group.id;
                    groupLua["ScriptLib"] = scriptLib;
                    groupLua["context_"] = client;
                    groupLua["evt_"] = args;
                    groupLua.DoString(group.luaFile.Replace("ScriptLib.", "ScriptLib:"));

                        foreach (GroupTrigger trigger in triggers)
                        {
                            string luaScript = @$"
                                if {trigger.conditionLua}(context_, evt_) then
                                {trigger.actionLua}(context_, evt_)
                            end
                        ";
                        try
                        {
                            groupLua.DoString(luaScript);
                        }
                        catch(Exception ex)
                        {
                            Server.Print("Error occured in LUA "+ex.Message);
                            errorTriggers.Add(trigger);
                        }
                        // Execute the Lua script
                    }
                }
               
            }
           
        }
    }
}
