using GenshinCBTServer.Protocol;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenshinCBTServer.Player
{
    public class GameEntity
    {
        public ProtEntityType EntityType = ProtEntityType.ProtEntityNone;
        public uint entityId;

        public uint id;
        public uint chest_drop;
        public MotionInfo motionInfo;

        public uint configId, groupId,owner,state;
        public GameEntity(ProtEntityType entityType, uint entityId, uint id, MotionInfo motionInfo)
        {
            EntityType = entityType;
            this.entityId = entityId;
            this.id = id;
            this.motionInfo = motionInfo;
        }

        public SceneEntityInfo asInfo()
        {
            SceneEntityInfo info = new SceneEntityInfo()
            {
                EntityType = EntityType,
                EntityId = entityId,
                MotionInfo = motionInfo,
                LifeState = 1,

               // EntityCase = SceneEntityInfo.EntityOneofCase.Gadget
            };
            if(EntityType == ProtEntityType.ProtEntityGadget)
            {
                info.Gadget = new SceneGadgetInfo()
                {
                  
                   GadgetId=id,
                     ConfigId=configId,
                     GroupId=groupId,
                      BornType=GadgetBornType.GadgetBornGadget,
                      GadgetState = state,
                    //  GadgetType = 1



                };
                if (chest_drop > 0) info.Gadget.GadgetType = 1;
            }
            if (EntityType == ProtEntityType.ProtEntityNpc)
            {
                info.Npc = new SceneNpcInfo()
                {
                    NpcId=id,
                };
            }

            return info;
        }
    }
}
