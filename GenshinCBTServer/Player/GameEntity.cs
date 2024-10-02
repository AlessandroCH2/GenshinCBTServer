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
        public MotionInfo motionInfo;

        public uint configId, groupId,owner,state;
        public GameEntity(uint entityId, uint id, MotionInfo motionInfo, ProtEntityType entityType = ProtEntityType.ProtEntityNone)
        {
            EntityType = entityType;
            this.entityId = entityId;
            this.id = id;
            this.motionInfo = motionInfo;
        }

        public virtual SceneEntityInfo asInfo()
        {
            SceneEntityInfo info = new SceneEntityInfo()
            {
                EntityType = EntityType,
                EntityId = entityId,
                MotionInfo = motionInfo,
                LifeState = 1,

               // EntityCase = SceneEntityInfo.EntityOneofCase.Gadget
            };
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
