using GenshinCBTServer.Controllers;
using GenshinCBTServer.Excel;
using GenshinCBTServer.Protocol;
using Google.Protobuf.Collections;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static GenshinCBTServer.ResourceManager;

namespace GenshinCBTServer.Player
{
    public class GameEntityItem : GameEntity
    {
        public GameItem item;

        public override void InitProps()
        {
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_HP, 1f);
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_DEFENSE, 1);
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_ATTACK, 1);
            FightPropUpdate(FightPropType.FIGHT_PROP_ATTACK, 1);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_ATTACK, 1); //TODO calculate total attack
            FightPropUpdate(FightPropType.FIGHT_PROP_HP, 1f);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_HP, 1f);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_HP, 1f); //TODO calculate total hp
            FightPropUpdate(FightPropType.FIGHT_PROP_HP_PERCENT, 0);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_DEFENSE, 100);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_SPEED, 0.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_FIRE_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_ELEC_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_WATER_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_GRASS_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_WIND_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_ICE_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_ROCK_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_FIRE_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_ELEC_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_WATER_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_GRASS_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_WIND_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_ICE_ENERGY, 100.0f);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_ROCK_ENERGY, 100.0f);
            props[(uint)PropType.PROP_EXP] = new PropValue() { Ival = 1, Val = 1, Type = (uint)PropType.PROP_EXP };
            props[(uint)PropType.PROP_LEVEL] = new PropValue() { Ival = 1, Val = (long)1, Type = (uint)PropType.PROP_LEVEL };
        }
        public GameEntityItem(uint entityId, uint id, MotionInfo motionInfo, GameItem item) : base(entityId, id, motionInfo, ProtEntityType.ProtEntityGadget)
        {
            InitProps();
            this.entityId = entityId;
            this.id = id;
            this.motionInfo = motionInfo;
            this.item = item;
        }
        public void FightPropUpdate(FightPropType key, float value)
        {
            fightprops[(uint)key] = value;
        }
        public override SceneEntityInfo asInfo()
        {
            SceneEntityInfo info = new SceneEntityInfo()
            {
                EntityType = EntityType,
                EntityId = entityId,
                MotionInfo = motionInfo,
                LifeState = (uint)LifeState.LIFE_ALIVE,

                AiInfo = new() { IsAiOpen = true },
                // EntityCase = SceneEntityInfo.EntityOneofCase.Gadget
            };
            info.PropMap.Add(props);
            // info.FightPropMap.Add(fightprops);

            info.Gadget = new SceneGadgetInfo()
            {

                GadgetId = item.GetExcel().gadgetId,

                BornType = GadgetBornType.GadgetBornInAir,
                GadgetState = state,
                IsEnableInteract = true,
                AuthorityPeerId = owner,

                //  GadgetType = 1
            };
            // info.Gadget.ItemId = item.id;

            info.Gadget.TrifleItem = item.toProtoItem();

            // if (chest_drop > 0) info.Gadget.GadgetType = 1;
            return info;
        }
        public override bool onInteract(Client session, GadgetInteractReq req)
        {
            session.world.KillEntities(new List<GameEntity>() { this }, VisionType.VisionNone);
            session.AddItem(item);
            session.SendPacket((uint)CmdType.GadgetInteractRsp, new GadgetInteractRsp() { Retcode = (int)0, GadgetEntityId = req.GadgetEntityId, GadgetId = id, InteractType = InteractType.InteractPickItem, OpType = InterOpType.InterOpStart });
            return true;
        }
    }
}
