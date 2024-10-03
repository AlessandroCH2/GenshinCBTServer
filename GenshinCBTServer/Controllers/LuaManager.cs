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

    }
    public class EventInfo
    {

    }
    public class LuaManager
    {

        public static void executeTriggerLua(Client client,SceneGroup group, EventType eventType)
        {
            if (group == null) return;
            List<GroupTrigger> triggers = group.triggers.FindAll(t => t.eventType == (int)eventType);

            if(triggers.Count > 0)
            {
                using (Lua groupLua = new Lua())
                {
                    try {
                        ScriptLib scriptLib = new();
                        scriptLib.currentGroupId =(int) group.id;
                        groupLua["ScriptLib"] = scriptLib;
                        groupLua["context_"] = client;
                        groupLua["evt"] = new EventInfo();
                        groupLua.DoString(group.luaFile.Replace("ScriptLib.", "ScriptLib:"));

                        foreach (GroupTrigger trigger in triggers)
                        {
                            string luaScript = @$"
                                if {trigger.conditionLua}(context_, evt_) then

                                    {trigger.actionLua}(context_, evt_)
                                end
                            ";

                            // Execute the Lua script
                            groupLua.DoString(luaScript);
                        }
                    } catch (Exception e)
                    {
                        Server.Print($"[LUA] Error executing trigger lua: {e.Message}");
                    }
                }
               
            }
           
        }
    }
}
