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
        public int GetGroupMonsterCountByGroupId(Client client, int groupId)
        {
            return client.world.entities.FindAll(e=>e.groupId == groupId && e is GameEntityMonster).Count;
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
        public int GetRegionEntityCount(LuaTable table)
        {
           // logger.debug("[LUA] Call GetRegionEntityCount with {}", printTable(table));
            int regionId = (int)(long)table["region_eid"];
            var entityType = (int)(long)table["entity_type"];
            if (entityType == (int)EntityType.Avatar)
            {
                if(curClient.inRegions.Contains((uint)regionId))
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
                return curClient.world.entities.FindAll(e => e.inRegions.Contains((uint)regionId)).Count;
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
